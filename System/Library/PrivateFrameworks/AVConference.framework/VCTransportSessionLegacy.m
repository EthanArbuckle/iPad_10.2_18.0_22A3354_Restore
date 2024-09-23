@implementation VCTransportSessionLegacy

- (VCTransportSessionLegacy)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  uint64_t v5;
  VCTransportSessionLegacy *v6;
  int AppBooleanValue;
  double v8;
  float v9;
  GKInterfaceListener *v10;
  VCConnectionManagerLegacy *v11;
  Boolean keyExistsAndHasValidFormat;
  objc_super v14;
  uint64_t v15;

  v5 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCTransportSessionLegacy;
  v6 = -[VCTransportSession initWithNotificationQueue:reportingAgent:](&v14, sel_initWithNotificationQueue_reportingAgent_, 0);
  if (v6)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enableRelay"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v6->allowsRelay = AppBooleanValue != 0;
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-pre-relay-timeout")), "doubleValue");
    v9 = v8;
    if (v9 < 3.0)
      v9 = 6.0;
    v6->callerPreEmptiveTimeoutInSecs = v9;
    v10 = objc_alloc_init(GKInterfaceListener);
    v6->_interfaceListener = v10;
    -[GKInterfaceListener setInterfaceListenerDelegate:](v10, "setInterfaceListenerDelegate:", v6);
    v11 = objc_alloc_init(VCConnectionManagerLegacy);
    v6->super._connectionManager = &v11->super;
    -[VCConnectionManager setupConnectionHealthMonitor](v11, "setupConnectionHealthMonitor");
    -[VCConnectionManager setReportingAgent:](v6->super._connectionManager, "setReportingAgent:", a4);
    -[VCTransport setReportingAgent:](v6->transport, "setReportingAgent:", a4);
    -[VCConnectionManager setCallID:](v6->super._connectionManager, "setCallID:", v5);
    -[VCConnectionManager setDelegate:](v6->super._connectionManager, "setDelegate:", v6);
    VTP_RegisterConnectionManagerWithCallID(v6->super._connectionManager, v5);
    v6->_callID = v5;
    v6->super._requiresWiFi = 1;
    v6->_connectionDataTimeoutCondVar = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    v6->super._useCompressedConnectionData = 1;
    v6->_localU8Version = 1;
    -[VCTransportSessionLegacy setupTransport](v6, "setupTransport");
  }
  return v6;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCTransport stopConnectivityCheckForCallID:](self->transport, "stopConnectivityCheckForCallID:", self->_callID);
  -[VCTransport discardRelayBindingForCallID:](self->transport, "discardRelayBindingForCallID:", self->_callID);

  VTP_DeregisterConnectionManagerWithCallID(self->_callID);
  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  objc_storeWeak(&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)VCTransportSessionLegacy;
  -[VCTransportSession dealloc](&v4, sel_dealloc);
}

- (VCTransportSessionLegacyDelegate)delegate
{
  return (VCTransportSessionLegacyDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)start
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VCTransportSessionLegacy_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __33__VCTransportSessionLegacy_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "startTimingForKey:", 14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "startRoutingChangeListener");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 263))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(*(id *)(v2 + 280), "updateICERoleForCallID:role:remoteCallID:sessionID:", *(unsigned int *)(v2 + 288), v3, *(unsigned int *)(v2 + 292), *(_QWORD *)(v2 + 384));
  objc_msgSend(*(id *)(a1 + 32), "initiateRelayRequest");
  v6[0] = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteConnectionData"), 0, 0, v6) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "start");
    result = objc_msgSend(*(id *)(a1 + 32), "addNetworkAssertionWithInterfaceType:", 3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 267) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __33__VCTransportSessionLegacy_start__block_invoke_cold_1(v5, v6);
    }
    return objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, v6[0]);
  }
  return result;
}

- (BOOL)startConnectionWithBlob:(id)a3 useRelay:(BOOL)a4 isInitialRelay:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  uint64_t v11;
  uint64_t v12;
  VCTransport *transport;
  uint64_t callID;
  NSDictionary *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v20;
  uint64_t v21;

  v7 = a5;
  v8 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v11 = -[NSObject pointerValue](self->super._connectionSetupPiggybackBlob, "pointerValue");
  -[TimingCollection stopTimingForKey:](self->super._perfTimings, "stopTimingForKey:", 12);
  if (!v8 || v7)
  {
    if (v8 && v7)
      v12 = 10;
    else
      v12 = 0;
    -[TimingCollection startTimingForKey:](self->super._perfTimings, "startTimingForKey:", v12);
  }
  if (-[VCDefaults forceIPv6](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceIPv6"))
    -[VCTransport setForceIPv6ForCallID:](self->transport, "setForceIPv6ForCallID:", self->_callID);
  transport = self->transport;
  callID = self->_callID;
  v15 = -[VCTransportSessionLegacy remoteRelayUpdate](self, "remoteRelayUpdate");
  -[VCTransportSessionLegacy iceTimeoutInSeconds:](self, "iceTimeoutInSeconds:", v8);
  v16 = -[VCTransport startConnectionCheckForCallID:remoteConnectionDataBlob:relayDictionary:iceTimeout:securityIdentity:skeState:usedRelay:](transport, "startConnectionCheckForCallID:remoteConnectionDataBlob:relayDictionary:iceTimeout:securityIdentity:skeState:usedRelay:", callID, a3, v15, self->_identity, v11, &v20);
  if (v16 < 0)
  {
    v17 = 207;
    if (v8)
      v17 = 250;
    if (self->_tcpTunnelClient)
      v18 = 251;
    else
      v18 = v17;
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a6, 32002, v18, v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 230), CFSTR("Could not connect"), CFSTR("connection check returned error"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionLegacy startConnectionWithBlob:useRelay:isInitialRelay:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCTransportSessionLegacy startConnectionWithBlob:useRelay:isInitialRelay:error:].cold.2();
      }
    }
  }
  return v16 >= 0;
}

- (void)stop
{
  NSObject *stateQueue;
  _QWORD v4[5];
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VCTransport setSKEState:forCallID:](self->transport, "setSKEState:forCallID:", 0, self->_callID);
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionLegacy;
  -[VCTransportSession stop](&v5, sel_stop);
  stateQueue = self->super._stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__VCTransportSessionLegacy_stop__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(stateQueue, v4);
}

uint64_t __32__VCTransportSessionLegacy_stop__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 267) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "registerICEBlockForCallID:connectedBlock:newCandidatesBlock:newNominationBlock:removeIPPortBlock:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288), 0, 0, 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "cleanup");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "stopRoutingChangeListener");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setInterfaceListenerDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stopLoopback");
  objc_msgSend(*(id *)(a1 + 32), "removeNetworkAssertion");
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

- (void)setForceRelay
{
  uint64_t v3;
  NSObject *v4;
  unsigned int callID;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      callID = self->_callID;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCTransportSessionLegacy setForceRelay]";
      v10 = 1024;
      v11 = 266;
      v12 = 1024;
      v13 = callID;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Force Relay is set for call (%d)", (uint8_t *)&v6, 0x22u);
    }
  }
  -[VCTransport setForceRelayForCallID:](self->transport, "setForceRelayForCallID:", self->_callID);
}

- (void)processRelayRequestResponse:(id)a3 didOriginateRequest:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int64_t relayState;
  NSObject *stateQueue;
  _QWORD block[6];
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
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v9 = "<nil>";
      relayState = self->relayState;
      *(_DWORD *)buf = 136316418;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]";
      v18 = 1024;
      v19 = 283;
      v20 = 2080;
      v21 = v9;
      v22 = 1024;
      v23 = relayState;
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay: processRelayRequestResponseDict:%s, %d, %d", buf, 0x32u);
    }
  }
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke;
  block[3] = &unk_1E9E52210;
  v13 = v4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  char IsOSFaultDisabled;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  _QWORD v30[4];
  __int128 v31;
  char v32;
  BOOL v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[10];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 260))
  {
    v3 = *(_QWORD *)(v1 + 240);
    if ((v3 > 3 || v3 == 2) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
        *(_DWORD *)buf = 136316162;
        v36 = v20;
        v37 = 2080;
        v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
        v39 = 1024;
        v40 = 297;
        v41 = 1024;
        *(_DWORD *)v42 = 297;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v22;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict bailing because relayState is %d", buf, 0x28u);
      }
    }
    v34 = 0;
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40));
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "setLocalRelayRequestResponse:", v6);
      v8 = objc_msgSend(*(id *)(a1 + 32), "localRelayRequestResponse");
    }
    else
    {
      objc_msgSend(v7, "setRemoteRelayRequestResponse:", v6);
      v8 = objc_msgSend(*(id *)(a1 + 32), "remoteRelayRequestResponse");
    }
    v11 = (void *)v8;
    v12 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GKSRelayRemotePrimaryIdentifier"));
    v13 = 3;
    if (!v12)
      v13 = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = v13;
    v14 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GKSRelayType"));
    if (v14)
    {
      v15 = objc_msgSend(v14, "unsignedCharValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = "TCP";
          v36 = v16;
          *(_DWORD *)buf = 136315906;
          v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
          v37 = 2080;
          if (!(_DWORD)v15)
            v18 = "UDP";
          v39 = 1024;
          v40 = 321;
          v41 = 2080;
          *(_QWORD *)v42 = v18;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processRelayRequestResponseDict: %s relay.", buf, 0x26u);
        }
      }
      if ((_DWORD)v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "deleteTCPTunnel");
        if ((objc_msgSend(*(id *)(a1 + 32), "createTCPTunnelForParticipantID:relayDictionary:didOriginateRequest:relayType:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368), v11, *(unsigned __int8 *)(a1 + 48), v15, &v34) & 1) == 0)
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 6;
          if (objc_opt_class() == *(_QWORD *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_2();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_3();
              }
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v19 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
            else
              v19 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
              v25 = *MEMORY[0x1E0CF2758];
              if ((IsOSFaultDisabled & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  v26 = *(_QWORD *)(a1 + 32);
                  if (objc_msgSend(v34, "userInfo"))
                    v27 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "userInfo"), "description"), "UTF8String");
                  else
                    v27 = "<nil>";
                  *(_DWORD *)buf = 136316418;
                  v36 = v23;
                  v37 = 2080;
                  v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
                  v39 = 1024;
                  v40 = 337;
                  v41 = 2112;
                  *(_QWORD *)v42 = v19;
                  *(_WORD *)&v42[8] = 2048;
                  v43 = v26;
                  v44 = 2080;
                  v45 = v27;
                  _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to create TCPTunnel: %s", buf, 0x3Au);
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                v28 = *(_QWORD *)(a1 + 32);
                if (objc_msgSend(v34, "userInfo"))
                  v29 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "userInfo"), "description"), "UTF8String");
                else
                  v29 = "<nil>";
                *(_DWORD *)buf = 136316418;
                v36 = v23;
                v37 = 2080;
                v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
                v39 = 1024;
                v40 = 337;
                v41 = 2112;
                *(_QWORD *)v42 = v19;
                *(_WORD *)&v42[8] = 2048;
                v43 = v28;
                v44 = 2080;
                v45 = v29;
                _os_log_fault_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Unable to create TCPTunnel: %s", buf, 0x3Au);
              }
            }
          }
        }
        return;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_1();
    }
    objc_msgSend(*(id *)(a1 + 32), "resetICETimeoutToLongTimeout");
    reportingLog();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_32;
    v30[3] = &unk_1E9E55F78;
    v32 = *(_BYTE *)(a1 + 48);
    v33 = v12 != 0;
    v31 = *(_OWORD *)(a1 + 32);
    objc_msgSend((id)v31, "getConnectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:queue:completionHandler:", 1, v12 == 0, *(_QWORD *)(v31 + 16), v30, 0.0);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = v9;
      v37 = 2080;
      v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
      v39 = 1024;
      v40 = 289;
      v41 = 1024;
      *(_DWORD *)v42 = 289;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict bailing because relay is not allowed.", buf, 0x22u);
    }
  }
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;
  int *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = *(char **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v5 = &OBJC_IVAR___VCTransportSessionLegacy__localRelayRequestResponse;
    else
      v5 = &OBJC_IVAR___VCTransportSessionLegacy__remoteRelayRequestResponse;
    objc_msgSend(*(id *)(a1 + 32), "setLocalRelayUpdate:", objc_msgSend(v4, "createRelayUpdateDictionary:", *(_QWORD *)&v4[*v5]));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_33;
    v15[3] = &unk_1E9E521C0;
    v15[4] = v6;
    dispatch_async(v7, v15);
    v8 = 4;
    if (!*(_BYTE *)(a1 + 49))
      v8 = 2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = v8;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID")), "isEqualToData:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID"))))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRemoteRelayConnectionData:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "objectForKeyedSubscript:", CFSTR("ClientData")));
      v16 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
      if ((objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayConnectionData"), 1, *(_BYTE *)(a1 + 49) == 0, &v16) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, v16);
    }
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_32_cold_1();
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
        v13 = *(_QWORD *)(a1 + 32);
        if (objc_msgSend(a3, "userInfo"))
          v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "description"), "UTF8String");
        else
          v14 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v18 = v11;
        v19 = 2080;
        v20 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
        v21 = 1024;
        v22 = 353;
        v23 = 2112;
        v24 = v10;
        v25 = 2048;
        v26 = v13;
        v27 = 2080;
        v28 = v14;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unabled to create UDP relay blob: %s", buf, 0x3Au);
      }
    }
  }
}

uint64_t __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_33(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:sendRelayResponse:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate"));
}

- (void)processRelayUpdate:(id)a3 didOriginateRequest:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int64_t relayState;
  NSObject *stateQueue;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v9 = "<nil>";
      relayState = self->relayState;
      *(_DWORD *)buf = 136316418;
      v14 = v7;
      v15 = 2080;
      v16 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]";
      v17 = 1024;
      v18 = 410;
      v19 = 2080;
      v20 = v9;
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = relayState;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay: processRelayUpdateDict:%s, %d, %d", buf, 0x32u);
    }
  }
  stateQueue = self->super._stateQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke;
  v12[3] = &unk_1E9E52238;
  v12[4] = self;
  v12[5] = a3;
  dispatch_async(stateQueue, v12);
}

void __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int ErrorLogLevelForModule;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  _BYTE v26[12];
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[260])
  {
    objc_msgSend(v2, "setRemoteRelayUpdate:", *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
    if (v3 != 2 && v3 != 4)
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
          *(_DWORD *)v26 = 136316162;
          *(_QWORD *)&v26[4] = v21;
          v27 = 2080;
          v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
          v29 = 1024;
          v30 = 423;
          v31 = 1024;
          *(_DWORD *)v32 = 423;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v23;
          v17 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportS"
                "essionLegacy.m:%d: processRelayUpdateDict: wait until allocation is finished %d";
          v18 = v22;
          v19 = 40;
          goto LABEL_25;
        }
      }
      return;
    }
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GKSRelayType"));
    if (v5)
    {
      v6 = objc_msgSend(v5, "unsignedCharValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = "TCP";
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
          *(_DWORD *)v26 = 136316162;
          if (!v6)
            v9 = "UDP";
          *(_QWORD *)&v26[4] = v7;
          v27 = 2080;
          v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
          v29 = 1024;
          v30 = 433;
          v31 = 2080;
          *(_QWORD *)v32 = v9;
          *(_WORD *)&v32[8] = 1024;
          v33 = v10;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processRelayUpdateDict: %s relay, %d", v26, 0x2Cu);
        }
      }
      if (v6)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) != 2)
          return;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(void **)(a1 + 40);
            if (v13)
              v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            else
              v14 = "<nil>";
            *(_DWORD *)v26 = 136315906;
            *(_QWORD *)&v26[4] = v11;
            v27 = 2080;
            v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
            v29 = 1024;
            v30 = 440;
            v31 = 2080;
            *(_QWORD *)v32 = v14;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: relayUpdateDict %s", v26, 0x26u);
          }
        }
        *(_QWORD *)v26 = 0;
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "sendChannelBindingMsgWithDict:error:", *(_QWORD *)(a1 + 40), v26) & 1) != 0)return;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 6;
LABEL_37:
        objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, *(_QWORD *)v26, *(_QWORD *)v26);
        return;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke_cold_1();
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate", *(_QWORD *)v26))
      return;
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID")), "isEqualToData:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate"), "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID"))))return;
    objc_msgSend(*(id *)(a1 + 32), "setRemoteRelayConnectionData:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), "objectForKeyedSubscript:", CFSTR("ClientData")));
    *(_QWORD *)v26 = 0;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(v24 + 240) == 2;
    *(_QWORD *)(v24 + 240) = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayConnectionData"), 1, v25, v26) & 1) != 0)return;
    goto LABEL_37;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315906;
      *(_QWORD *)&v26[4] = v15;
      v27 = 2080;
      v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
      v29 = 1024;
      v30 = 416;
      v31 = 1024;
      *(_DWORD *)v32 = 416;
      v17 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessi"
            "onLegacy.m:%d: processRelayUpdateDict bailing because relay is not allowed.";
      v18 = v16;
      v19 = 34;
LABEL_25:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v26, v19);
    }
  }
}

- (void)createSecondaryRelayDispatchTimer:(float)a3 callID:(unsigned int)a4 callerRequired:(BOOL)a5
{
  NSObject *stateQueue;
  _QWORD v6[5];
  float v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke;
  v6[3] = &unk_1E9E529D8;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_async(stateQueue, v6);
}

void __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  int v8;
  int v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "destroySecondaryRelayDispatchTimer");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 272);
  if (v2)
  {
    v3 = (unint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0);
    v4 = dispatch_time(0, v3);
    dispatch_source_set_timer(v2, v4, v3, 0x3B9ACA00uLL);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 272);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke_2;
    v7[3] = &unk_1E9E529D8;
    v8 = *(_DWORD *)(a1 + 40);
    v7[4] = v5;
    v9 = *(_DWORD *)(a1 + 44);
    v10 = *(_BYTE *)(a1 + 48);
    dispatch_source_set_event_handler(v6, v7);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 272));
  }
}

uint64_t __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(float *)(a1 + 40);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCTransportSessionLegacy createSecondaryRelayDispatchTimer:callID:callerRequired:]_block_invoke_2";
      v10 = 1024;
      v11 = 487;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: secondary relay dispatch timed out after %5.2f sec. Start relay setup", (uint8_t *)&v6, 0x26u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "destroySecondaryRelayDispatchTimer");
  return objc_msgSend(*(id *)(a1 + 32), "setupSecondaryRelayForCall:callerRequired:", *(unsigned int *)(a1 + 44), *(unsigned __int8 *)(a1 + 48));
}

- (void)destroySecondaryRelayDispatchTimer
{
  NSObject *relaySetupTimer;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  relaySetupTimer = self->relaySetupTimer;
  if (relaySetupTimer)
  {
    dispatch_source_cancel(relaySetupTimer);
    v4 = self->relaySetupTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->relaySetupTimer = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCTransportSessionLegacy destroySecondaryRelayDispatchTimer]";
        v11 = 1024;
        v12 = 504;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: secondary relay dispatch timer is deleted.", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (void)setupPendingSecondaryRelayWithNewPrimary:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCTransportSessionLegacy_setupPendingSecondaryRelayWithNewPrimary___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __69__VCTransportSessionLegacy_setupPendingSecondaryRelayWithNewPrimary___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  char IsRelay;
  unsigned int *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(int *)(*(_QWORD *)(result + 32) + 248) >= 1)
  {
    v1 = result;
    result = VCConnection_Priority(*(_QWORD *)(result + 40));
    if ((_DWORD)result == 3 && !*(_BYTE *)(*(_QWORD *)(v1 + 32) + 261))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v2 = VRTraceErrorLogLevelToCSTR();
        v3 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = 136315650;
          v7 = v2;
          v8 = 2080;
          v9 = "-[VCTransportSessionLegacy setupPendingSecondaryRelayWithNewPrimary:]_block_invoke";
          v10 = 1024;
          v11 = 511;
          _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange, setup initial secondary relay", (uint8_t *)&v6, 0x1Cu);
        }
      }
      IsRelay = VCConnection_IsRelay(*(_QWORD *)(v1 + 40));
      v5 = *(unsigned int **)(v1 + 32);
      if ((IsRelay & 1) == 0)
      {
        objc_msgSend(v5, "notifyDelegateToCancelRelay");
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 280), "discardRelayBindingForCallID:", *(unsigned int *)(*(_QWORD *)(v1 + 32) + 288));
        v5 = *(unsigned int **)(v1 + 32);
      }
      result = objc_msgSend(v5, "setupSecondaryRelayForCall:callerRequired:", v5[72], 1);
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 248) = 0;
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 261) = 1;
    }
  }
  return result;
}

- (void)notifyDelegateToCancelRelay
{
  unint64_t relayState;
  BOOL v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  int64_t v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v12;
  NSMutableDictionary *v13;
  NSObject *notificationQueue;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  relayState = self->relayState;
  v4 = relayState > 4;
  v5 = (1 << relayState) & 0x19;
  if (v4 || v5 == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->relayState;
        *(_DWORD *)buf = 136315906;
        v17 = v10;
        v18 = 2080;
        v19 = "-[VCTransportSessionLegacy notifyDelegateToCancelRelay]";
        v20 = 1024;
        v21 = 541;
        v22 = 1024;
        v23 = v12;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notifyDelegateToCancelRelay: Resetting relay state from %d.", buf, 0x22u);
      }
    }
    self->relayState = 0;
    v13 = -[VCTransportSessionLegacy localRelayRequestResponse](self, "localRelayRequestResponse");
    notificationQueue = self->super._notificationQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__VCTransportSessionLegacy_notifyDelegateToCancelRelay__block_invoke;
    v15[3] = &unk_1E9E52238;
    v15[4] = self;
    v15[5] = v13;
    dispatch_async(notificationQueue, v15);
    -[VCTransportSessionLegacy setLocalRelayRequestResponse:](self, "setLocalRelayRequestResponse:", 0);
    -[VCTransportSessionLegacy setLocalRelayUpdate:](self, "setLocalRelayUpdate:", 0);
    -[VCTransportSessionLegacy setRemoteRelayRequestResponse:](self, "setRemoteRelayRequestResponse:", 0);
    -[VCTransportSessionLegacy setRemoteRelayUpdate:](self, "setRemoteRelayUpdate:", 0);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->relayState;
      *(_DWORD *)buf = 136315906;
      v17 = v7;
      v18 = 2080;
      v19 = "-[VCTransportSessionLegacy notifyDelegateToCancelRelay]";
      v20 = 1024;
      v21 = 537;
      v22 = 1024;
      v23 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notifyDelegateToCancelRelay: No need, relay state %d.", buf, 0x22u);
    }
  }
}

uint64_t __55__VCTransportSessionLegacy_notifyDelegateToCancelRelay__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:cancelRelayRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setupSecondaryRelayForCall:(unsigned int)a3 callerRequired:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *notificationQueue;
  uint64_t v13;
  NSObject *v14;
  int64_t relayState;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super._connectionManager);
  if (v7)
  {
    v8 = (void *)v7;
    if (!v4 || self->_isCaller)
    {
      if (self->relayState
        || !-[VCTransportSessionLegacy isConnectedAndAllowAdditionalConnection](self, "isConnectedAndAllowAdditionalConnection"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            relayState = self->relayState;
            *(_DWORD *)buf = 136315906;
            v18 = v13;
            v19 = 2080;
            v20 = "-[VCTransportSessionLegacy setupSecondaryRelayForCall:callerRequired:]";
            v21 = 1024;
            v22 = 575;
            v23 = 1024;
            v24 = relayState;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setupSecondaryRelay fail, relayState %d", buf, 0x22u);
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v18 = v9;
            v19 = 2080;
            v20 = "-[VCTransportSessionLegacy setupSecondaryRelayForCall:callerRequired:]";
            v21 = 1024;
            v22 = 565;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setupSecondaryRelayForCall", buf, 0x1Cu);
          }
        }
        v11 = -[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:](self, "createInitiateRelayDictionaryForCall:primaryConnection:", v5, objc_msgSend(v8, "connectionResult"));
        if (v11)
        {
          self->relayState = 3;
          notificationQueue = self->super._notificationQueue;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __70__VCTransportSessionLegacy_setupSecondaryRelayForCall_callerRequired___block_invoke;
          v16[3] = &unk_1E9E52238;
          v16[4] = self;
          v16[5] = v11;
          dispatch_async(notificationQueue, v16);
        }
      }
    }
    CFRelease(v8);
  }
}

uint64_t __70__VCTransportSessionLegacy_setupSecondaryRelayForCall_callerRequired___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:initiateRelayRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setupInitialSecondaryRelayWithCallbackRelayFlag:(BOOL)a3 callID:(unsigned int)a4 connectionId:(int)a5
{
  NSObject *stateQueue;
  _QWORD v6[5];
  int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__VCTransportSessionLegacy_setupInitialSecondaryRelayWithCallbackRelayFlag_callID_connectionId___block_invoke;
  v6[3] = &unk_1E9E529D8;
  v6[4] = self;
  v9 = a3;
  v7 = a5;
  v8 = a4;
  dispatch_async(stateQueue, v6);
}

void __96__VCTransportSessionLegacy_setupInitialSecondaryRelayWithCallbackRelayFlag_callID_connectionId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  _BYTE *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = objc_msgSend(v2, "connectionResult");
  v4 = v3;
  if (v2 && *(_DWORD *)(a1 + 40) == *(_DWORD *)(v3 + 4))
  {
    if (VCConnection_Priority((uint64_t)v2) == 3 && !*(_BYTE *)(a1 + 48))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_DWORD *)(a1 + 44);
          v30 = 136315906;
          v31 = v5;
          v32 = 2080;
          v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          v34 = 1024;
          v35 = 592;
          v36 = 1024;
          v37 = v7;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal P2P primary: cancel preemptive relay", (uint8_t *)&v30, 0x22u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "notifyDelegateToCancelRelay");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "discardRelayBindingForCallID:", *(unsigned int *)(a1 + 44));
    }
    v8 = *(_BYTE **)(a1 + 32);
    if (v8[261] || !v8[263])
      goto LABEL_20;
    if (*(_BYTE *)(a1 + 48))
    {
      if (objc_msgSend((id)objc_msgSend(v8, "localRelayRequestResponse"), "objectForKeyedSubscript:", CFSTR("GKSRelayRemotePrimaryIdentifier")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v30 = 136315650;
            v31 = v9;
            v32 = 2080;
            v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            v34 = 1024;
            v35 = 616;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: not initial secondary relay, return, let ProcessRemoteIPChange setup secondary relay", (uint8_t *)&v30, 0x1Cu);
          }
        }
        goto LABEL_20;
      }
      v20 = VCConnection_Priority((uint64_t)v2);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v20 == 3)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(_DWORD *)(a1 + 44);
            v30 = 136315906;
            v31 = v22;
            v32 = 2080;
            v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            v34 = 1024;
            v35 = 622;
            v36 = 1024;
            v37 = v24;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal relay primary: setup secondary relay", (uint8_t *)&v30, 0x22u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setupSecondaryRelayForCall:callerRequired:", *(unsigned int *)(a1 + 44), 1);
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
LABEL_32:
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 261) = 1;
LABEL_20:
        CFRelease(v2);
        return;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(unsigned __int8 *)(a1 + 48);
          v30 = 136315906;
          v31 = v28;
          v32 = 2080;
          v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          v34 = 1024;
          v35 = 627;
          v36 = 1024;
          v37 = v29;
          goto LABEL_39;
        }
      }
    }
    else
    {
      v15 = VCConnection_Priority((uint64_t)v2);
      v16 = VRTraceGetErrorLogLevelForModule();
      if (v15 == 3)
      {
        if (v16 >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_DWORD *)(a1 + 44);
            v30 = 136315906;
            v31 = v17;
            v32 = 2080;
            v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            v34 = 1024;
            v35 = 605;
            v36 = 1024;
            v37 = v19;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal P2P primary: setup initial secondary relay", (uint8_t *)&v30, 0x22u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setupSecondaryRelayForCall:callerRequired:", *(unsigned int *)(a1 + 44), 1);
        goto LABEL_32;
      }
      if (v16 >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(unsigned __int8 *)(a1 + 48);
          v30 = 136315906;
          v31 = v25;
          v32 = 2080;
          v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          v34 = 1024;
          v35 = 609;
          v36 = 1024;
          v37 = v27;
LABEL_39:
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: add a pending relay count = 1 relayFlag: %d, let handlePrimaryConnChange start initial secondary relay", (uint8_t *)&v30, 0x22u);
        }
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 248) = 1;
    goto LABEL_20;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_DWORD *)(a1 + 40);
      v14 = *(_DWORD *)(v4 + 4);
      v30 = 136316162;
      v31 = v11;
      v32 = 2080;
      v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
      v34 = 1024;
      v35 = 587;
      v36 = 1024;
      v37 = v13;
      v38 = 1024;
      v39 = v14;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: link doesnot match(%d, %d)", (uint8_t *)&v30, 0x28u);
    }
  }
  if (v2)
    goto LABEL_20;
}

- (void)initiateRelayRequest
{
  uint64_t v3;
  NSObject *v4;
  double callerPreEmptiveTimeoutInSecs;
  dispatch_time_t v6;
  NSObject *stateQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isCaller && self->allowsRelay)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        callerPreEmptiveTimeoutInSecs = self->callerPreEmptiveTimeoutInSecs;
        *(_DWORD *)buf = 136315906;
        v10 = v3;
        v11 = 2080;
        v12 = "-[VCTransportSessionLegacy initiateRelayRequest]";
        v13 = 1024;
        v14 = 641;
        v15 = 2048;
        v16 = callerPreEmptiveTimeoutInSecs;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initiateRelayRequest: caller start relay in %f seconds", buf, 0x26u);
      }
    }
    v6 = dispatch_time(0, (uint64_t)(float)(self->callerPreEmptiveTimeoutInSecs * 1000000000.0));
    stateQueue = self->super._stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_after(v6, stateQueue, block);
  }
}

void __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "connectionCount") < 1)
  {
    v7 = *(_QWORD **)(a1 + 32);
    if (v7[30] || objc_msgSend(v7, "remoteRelayUpdate"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
          *(_DWORD *)buf = 136315906;
          v18 = v8;
          v19 = 2080;
          v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
          v21 = 1024;
          v22 = 650;
          v23 = 1024;
          v24 = v10;
          v4 = " [%s] %s:%d initiateRelayRequest bailing because relay has already started %d";
          v5 = v9;
          v6 = 34;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v11 = *(_BYTE **)(a1 + 32);
      if (v11[267])
      {
        v12 = objc_msgSend(v11, "createInitiateRelayDictionary");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 1;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 262) = 1;
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(NSObject **)(v13 + 24);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke_35;
        v16[3] = &unk_1E9E52238;
        v16[4] = v13;
        v16[5] = v12;
        dispatch_async(v14, v16);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v3 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
          v21 = 1024;
          v22 = 655;
          v4 = " [%s] %s:%d initiateRelayRequest bailing because transportSession has been stopped";
          goto LABEL_5;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = v2;
      v19 = 2080;
      v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
      v21 = 1024;
      v22 = 644;
      v4 = " [%s] %s:%d initiateRelayRequest bailing because already connected";
LABEL_5:
      v5 = v3;
      v6 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
    }
  }
}

uint64_t __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke_35(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:initiateRelayRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int IsIPv6;
  int v11;
  char v12;
  int IsRelay;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  VCTransportSessionLegacy *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  char v41;
  unsigned int v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!VCConnection_IsLocalOnCellular((uint64_t)a3))
    return -2144665542;
  v31 = self;
  v7 = objc_msgSend(a3, "connectionResult");
  v8 = *(unsigned __int16 *)(v7 + 64);
  v9 = *(unsigned __int16 *)(v7 + 184);
  IsIPv6 = VCConnection_IsIPv6((uint64_t)a3);
  if (IsIPv6)
    v11 = 2;
  else
    v11 = 1;
  v42 = v11;
  if (IsIPv6)
    v12 = 48;
  else
    v12 = 28;
  IsRelay = VCConnection_IsRelay((uint64_t)a3);
  v14 = v12 + 4;
  if (!IsRelay)
    v14 = v12;
  v41 = v14;
  v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
  if (v15)
  {
    v16 = v15;
    v40 = bswap32(v8) >> 16;
    v39 = *(_QWORD *)v54;
    v38 = bswap32(v9) >> 16;
    v37 = *MEMORY[0x1E0CA7520];
    v36 = *MEMORY[0x1E0CA7560];
    v35 = *MEMORY[0x1E0CA7510];
    v34 = *MEMORY[0x1E0CA7550];
    v33 = *MEMORY[0x1E0CA7548];
    v17 = *MEMORY[0x1E0CA7570];
    v18 = *MEMORY[0x1E0CA7568];
    v19 = *MEMORY[0x1E0CA7518];
    obj = a4;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42), v37);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v40), v36);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v38), v35);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushPayloadType")), v34);
        v23 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushPayloadTypeFieldOffset")), "unsignedCharValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (v23 + v41)), v33);
        v24 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushTransactionID")), "unsignedShortValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", __rev16(v24)), v17);
        v25 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushTimestamp")), "unsignedLongValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v25)), v18);
        v26 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushCriterion")), "unsignedShortValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", __rev16(v26)), v19);
        objc_msgSend(v43, "addObject:", v22);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
    }
    while (v16);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v43)
        v29 = (const char *)objc_msgSend((id)objc_msgSend(v43, "description"), "UTF8String");
      else
        v29 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v45 = v27;
      v46 = 2080;
      v47 = "-[VCTransportSessionLegacy flushBasebandQueueForConnection:payloadInfoList:]";
      v48 = 1024;
      v49 = 723;
      v50 = 2080;
      v51 = v29;
      _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Baseband flush dict %s", buf, 0x26u);
    }
  }
  return -[VCTransport flushBasebandQueue:](v31->transport, "flushBasebandQueue:", v43);
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  return -[VCTransport getSignalStrengthBars:displayBars:maxDisplayBars:](self->transport, "getSignalStrengthBars:displayBars:maxDisplayBars:", a3, a4, a5);
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return -[VCTransport updateQualityIndicator:isIPv6:](self->transport, "updateQualityIndicator:isIPv6:", *(_QWORD *)&a3, a4);
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
  return -[VCTransport updateBasebandForConnection:notificationRegistrationToken:callType:](self->transport, "updateBasebandForConnection:notificationRegistrationToken:callType:", objc_msgSend(a3, "connectionResult"), self->super._basebandNotificationRegistrationToken, -[VCTransportSessionLegacy transportCallType](self, "transportCallType"));
}

- (void)deregisterBasebandNotifications
{
  -[VCTransport updateBasebandForConnection:notificationRegistrationToken:callType:](self->transport, "updateBasebandForConnection:notificationRegistrationToken:callType:", 0, self->super._basebandNotificationRegistrationToken, -[VCTransportSessionLegacy transportCallType](self, "transportCallType"));
}

- (unsigned)transportCallType
{
  unint64_t operatingMode;
  char v3;

  operatingMode = self->_operatingMode;
  if (operatingMode >= 8)
    v3 = 0;
  else
    v3 = 0x100000200010200uLL >> (8 * operatingMode);
  return v3 & 3;
}

- (void)handleConnectionSetupDataChangeMessageDelivered
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__VCTransportSessionLegacy_handleConnectionSetupDataChangeMessageDelivered__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __75__VCTransportSessionLegacy_handleConnectionSetupDataChangeMessageDelivered__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "destroySecondaryRelayDispatchTimer");
  return objc_msgSend(*(id *)(a1 + 32), "setupSecondaryRelayForCall:callerRequired:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288), 0);
}

- (BOOL)isHandoverSupported
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  unsigned int v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[VCTransport getRemoteICEVersion:remoteICEVersion:](self->transport, "getRemoteICEVersion:remoteICEVersion:", self->_callID, &v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = "NOT ";
      if (v6 > 0x3F1)
        v4 = "";
      *(_DWORD *)buf = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCTransportSessionLegacy isHandoverSupported]";
      v11 = 1024;
      v12 = 771;
      v13 = 1024;
      v14 = v6;
      v15 = 2080;
      v16 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote ICE Version:%u, handover is %ssupported.", buf, 0x2Cu);
    }
  }
  return v6 > 0x3F1;
}

- (void)networkStateDidChange
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *v3;
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  _BYTE buf[12];
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  int v35;
  _OWORD v36[2];
  unint64_t v37;
  _BYTE v38[54];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  reportingLog();
  objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 10, 0);
  v26 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "updateInterfaceList:shouldFilterCellInterface:isUpdateNeeded:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9), &v26);
  if (v2 < 0)
  {
    v13 = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)v38 = 136315906;
    *(_QWORD *)&v38[4] = v14;
    *(_WORD *)&v38[12] = 2080;
    *(_QWORD *)&v38[14] = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
    *(_WORD *)&v38[22] = 1024;
    *(_DWORD *)&v38[24] = 794;
    *(_WORD *)&v38[28] = 1024;
    *(_DWORD *)&v38[30] = v13;
    v16 = " [%s] %s:%d networkStateDidChange: Failed updating interface list %x";
    v17 = v38;
    v18 = v15;
    v19 = 34;
LABEL_27:
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v16, v17, v19);
    return;
  }
  if (v26 && !objc_msgSend(*(id *)(a1 + 32), "localConnectionData"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "lock");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "signal");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "unlock");
    return;
  }
  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[267])
    return;
  *(_QWORD *)&v38[46] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v38[32] = v4;
  *(_OWORD *)v38 = v4;
  *(_OWORD *)&v38[16] = v4;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v36[0] = v4;
  v36[1] = v4;
  objc_msgSend(v3, "IPPortForPrimaryConnectionOnLocalInterface:", 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = IPPORTToStringWithSize();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v5;
      v28 = 2080;
      v29 = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
      v30 = 1024;
      v31 = 812;
      v32 = 2080;
      *(_QWORD *)v33 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d networkStateDidChange: checking for %s.", buf, 0x26u);
    }
  }
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "ipPortStillExists:requiresWifi:", v36, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));
  if (!v26)
  {
    v20 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v23 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v21;
    v28 = 2080;
    v29 = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
    v30 = 1024;
    v31 = 819;
    v32 = 1024;
    *(_DWORD *)v33 = v20;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v26;
    v34 = 1024;
    v35 = v23;
    v16 = " [%s] %s:%d networkStateDidChange: no need to collect blob: %d, %d, %d.";
    v17 = buf;
    v18 = v22;
    v19 = 46;
    goto LABEL_27;
  }
  *(_QWORD *)buf = 0;
  v9 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288);
  v10 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-blob-size-max")), "intValue");
  if (v10)
    v11 = v10;
  else
    v11 = 201;
  v25 = v11;
  LOBYTE(v24) = 1;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "getConnectionDataForCallID:version:useCompressedData:pConnectionData:connectDataSizeInBytes:relayDictionary:interfaceUpdate:nonCellularCandidateTimeout:", v9, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 232), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10), buf, &v25, 0, 0.0, v24) & 0x80000000) == 0)
  {
    if (v25)
    {
      v12 = *(void **)buf;
      if (*(_QWORD *)buf)
        goto LABEL_19;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke_cold_1();
  }
  v12 = *(void **)buf;
  if (*(_QWORD *)buf)
LABEL_19:
    free(v12);
}

- (void)handleNewCandidates:(id)a3 version:(unsigned __int16)a4
{
  uint64_t v6;
  NSObject *v7;
  int relayState;
  const char *v9;
  void *v10;
  NSObject *notificationQueue;
  double v12;
  _QWORD block[6];
  unsigned __int16 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      relayState = self->relayState;
      if (a3)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v9 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v16 = v6;
      v17 = 2080;
      v18 = "-[VCTransportSessionLegacy handleNewCandidates:version:]";
      v19 = 1024;
      v20 = 859;
      v21 = 1024;
      v22 = relayState;
      v23 = 2080;
      v24 = v9;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Relay state: %d, local blob is updated %s", buf, 0x2Cu);
    }
  }
  *(_WORD *)buf = 1;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", buf, 2);
  objc_msgSend(v10, "appendData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 2));
  objc_msgSend(v10, "appendData:", a3);
  notificationQueue = self->super._notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCTransportSessionLegacy_handleNewCandidates_version___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = v10;
  dispatch_async(notificationQueue, block);
  LODWORD(v12) = 5.0;
  -[VCTransportSessionLegacy createSecondaryRelayDispatchTimer:callID:callerRequired:](self, "createSecondaryRelayDispatchTimer:callID:callerRequired:", self->_callID, 0, v12);
}

uint64_t __56__VCTransportSessionLegacy_handleNewCandidates_version___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:connectionSetupDataDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)processRemoteIPChange:(char *)a3 dataLength:(int)a4 remoteCandidateVersion:(unsigned __int16)a5
{
  -[VCTransport processRemoteInterfaceChangeMessageWithLocalCallID:remoteCallID:remoteData:remoteLen:remoteCandidateVersion:](self->transport, "processRemoteInterfaceChangeMessageWithLocalCallID:remoteCallID:remoteData:remoteLen:remoteCandidateVersion:", self->_callID, self->_remoteCallID, a3, *(_QWORD *)&a4, a5);
  reportingLog();
}

- (void)processRemoteIPChange:(id)a3
{
  int v5;
  _WORD *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int callID;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  v6 = malloc_type_malloc(v5, 0x385DCB59uLL);
  objc_msgSend(a3, "getBytes:length:", v6, v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      callID = self->_callID;
      v10 = 136316162;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCTransportSessionLegacy processRemoteIPChange:]";
      v14 = 1024;
      v15 = 891;
      v16 = 1024;
      v17 = callID;
      v18 = 1024;
      v19 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: processRemoteIPChange: callID:%u length:%d", (uint8_t *)&v10, 0x28u);
    }
  }
  if (v5 - 2 >= 0)
  {
    if (*v6 == 1)
    {
      if (v5 - 4 < 0)
        return;
      -[VCTransportSessionLegacy processRemoteIPChange:dataLength:remoteCandidateVersion:](self, "processRemoteIPChange:dataLength:remoteCandidateVersion:", v6 + 2, (v5 - 4), (unsigned __int16)v6[1]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionLegacy processRemoteIPChange:].cold.1();
    }
    free(v6);
  }
}

- (void)connectionResultCallback:(tagCONNRESULT *)a3 didReceiveICEPacket:(BOOL)a4 didUseRelay:(BOOL)a5 secretKey:(id)a6 skeResult:(int)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v13;
  NSObject *v14;
  int iResultCount;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *stateQueue;
  _QWORD v20[7];
  int v21;
  _BYTE buf[24];
  _BYTE v23[14];
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v9 = a5;
  v10 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        iResultCount = a3->iResultCount;
      else
        iResultCount = -1;
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy connectionResultCallback:didReceiveICEPacket:didUseRelay:secretKey:skeResult:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v23 = 929;
      *(_WORD *)&v23[4] = 2048;
      *(_QWORD *)&v23[6] = a3;
      v24 = 1024;
      v25 = v10;
      v26 = 1024;
      v27 = iResultCount;
      v28 = 2048;
      v29 = a6;
      v30 = 1024;
      v31 = a7;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionResultCallback: pConnResult = %p, didReceiveICEPacket = %d resultCount = %d, secretKey = %p, skeResult = %d", buf, 0x42u);
    }
  }
  if (v9)
    v16 = 10;
  else
    v16 = 0;
  -[TimingCollection stopTimingForKey:](self->super._perfTimings, "stopTimingForKey:", v16);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)v23 = 0;
  if (a3)
  {
    v17 = malloc_type_malloc(0x140uLL, 0x1020040A6FBA1A4uLL);
    v18 = *(_QWORD *)&buf[8];
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
    memcpy(v17, a3, 0x140uLL);
    *(_QWORD *)(*(_QWORD *)(v18 + 24) + 304) = 0;
  }
  stateQueue = self->super._stateQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__VCTransportSessionLegacy_connectionResultCallback_didReceiveICEPacket_didUseRelay_secretKey_skeResult___block_invoke;
  v20[3] = &unk_1E9E54AA0;
  v20[4] = self;
  v20[5] = a6;
  v21 = a7;
  v20[6] = buf;
  dispatch_async(stateQueue, v20);
  _Block_object_dispose(buf, 8);
}

void __105__VCTransportSessionLegacy_connectionResultCallback_didReceiveICEPacket_didUseRelay_secretKey_skeResult___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  VCConnectionLegacy *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "handleExchangedKey:result:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56)))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v3)
    {
      LODWORD(v2) = *(_DWORD *)(v3 + 268);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 256) = ((double)v2 * 0.0000152587891 * 1000.0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 266) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                                                           + 8) == 0;
      v4 = -[VCConnectionLegacy initWithConnectionResult:type:]([VCConnectionLegacy alloc], "initWithConnectionResult:type:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "connectionTypeForConnectionResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addConnection:", v4);

    }
  }
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (BOOL)handleExchangedKey:(id)a3 result:(int)a4
{
  BOOL v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || a4)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionLegacy handleExchangedKey:result:].cold.1();
      }
      v9[0] = 0;
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v9, 32018, a4 + 700, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 982), CFSTR("Media Insecure"), CFSTR("Optimized SKE failed"));
      -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 7, v9[0]);
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 1;
    if (!self->_didReceivePiggybackBlob)
    {
      self->_didReceivePiggybackBlob = 1;
      -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 5, a3);
    }
  }

  return v7;
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  unsigned int callID;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      callID = self->_callID;
      *(_DWORD *)buf = 136315906;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VCTransportSessionLegacy primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
      v19 = 1024;
      v20 = 997;
      v21 = 1024;
      v22 = callID;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange dwCallID(%u)", buf, 0x22u);
    }
  }
  -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a3);
  if (VCConnection_IsRelay((uint64_t)a4) && objc_msgSend(a3, "isReplaceOnly"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v11;
        v17 = 2080;
        v18 = "-[VCTransportSessionLegacy primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        v19 = 1024;
        v20 = 1005;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange, old primary uses relay, now it is removed, tear relay down", buf, 0x1Cu);
      }
    }
    -[VCTransport discardRelayBindingForCallID:withChannelNumber:](self->transport, "discardRelayBindingForCallID:withChannelNumber:", self->_callID, objc_msgSend(a4, "relayChannelNumber"));
  }
  -[VCTransportSessionLegacy setupPendingSecondaryRelayWithNewPrimary:](self, "setupPendingSecondaryRelayWithNewPrimary:", a3);
  v13[0] = CFSTR("transportSessionEventInfoNewPrimary");
  v13[1] = CFSTR("transportSessionEventInfoOldPrimary");
  v14[0] = a3;
  v14[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
}

- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSObject *v8;
  NSObject *stateQueue;
  _QWORD block[5];
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a3);
    -[TimingCollection stopTimingForKey:](self->super._perfTimings, "stopTimingForKey:", 14);
    if (self->rtChannel)
    {
      if ((VCConnection_IsRelay((uint64_t)a3) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v14 = v7;
            v15 = 2080;
            v16 = "-[VCTransportSessionLegacy connectionCallback:isInitialConnection:]";
            v17 = 1024;
            v18 = 1028;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: P2P established, no need for TCP relay.", buf, 0x1Cu);
          }
        }
        stateQueue = self->super._stateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__VCTransportSessionLegacy_connectionCallback_isInitialConnection___block_invoke;
        block[3] = &unk_1E9E521C0;
        block[4] = self;
        dispatch_async(stateQueue, block);
      }
    }
  }
  v11[0] = CFSTR("transportSessionEventInfoNewLink");
  v11[1] = CFSTR("transportSessionEventInfoIsFirstLink");
  v12[0] = a3;
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
}

uint64_t __67__VCTransportSessionLegacy_connectionCallback_isInitialConnection___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 6;
  return objc_msgSend(*(id *)(a1 + 32), "resetLoopback");
}

- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4
{
  _BOOL8 v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v5 = a3;
  v8[2] = *MEMORY[0x1E0C80C00];
  -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a4);
  v7[0] = CFSTR("transportSessionEventInfoIsDuplicationEnabled");
  v7[1] = CFSTR("transportSessionEventInfoActiveConnection");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

- (BOOL)createTCPTunnelForParticipantID:(id)a3 relayDictionary:(id)a4 didOriginateRequest:(BOOL)a5 relayType:(unsigned __int8)a6 error:(id *)a7
{
  TCPTunnelClient *v10;
  TCPTunnelClient *tcpTunnelClient;
  uint64_t v12;
  TCPTunnelClient *v13;
  TCPTunnelClient *v14;
  TCPTunnelClient *v15;
  TCPTunnelClient *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v10 = -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]([TCPTunnelClient alloc], "initWithRelayRequestDictionary:withCallID:relayType:errorCode:", a4, self->_callID, a6, &v23);
  if (v10)
  {
    self->_tcpTunnelClient = v10;
    self->rtChannel = (VideoConferenceRealTimeChannel *)v10;
    -[TCPTunnelClient setParticipantID:](self->_tcpTunnelClient, "setParticipantID:", a3);
    tcpTunnelClient = self->_tcpTunnelClient;
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke;
    v22[3] = &unk_1E9E55FA0;
    v22[4] = self;
    -[TCPTunnelClient setAllocationResponseHandler:](tcpTunnelClient, "setAllocationResponseHandler:", v22);
    v13 = self->_tcpTunnelClient;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4;
    v21[3] = &unk_1E9E55FC8;
    v21[4] = self;
    -[TCPTunnelClient setReceiveHandler:](v13, "setReceiveHandler:", v21);
    v14 = self->_tcpTunnelClient;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_5;
    v20[3] = &unk_1E9E52260;
    v20[4] = self;
    -[TCPTunnelClient setBindingResponseHandler:](v14, "setBindingResponseHandler:", v20);
    v15 = self->_tcpTunnelClient;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_57;
    v19[3] = &unk_1E9E534F8;
    v19[4] = self;
    -[TCPTunnelClient setTerminationHandler:](v15, "setTerminationHandler:", v19);
    v16 = self->_tcpTunnelClient;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3_60;
    v18[3] = &unk_1E9E521C0;
    v18[4] = self;
    -[TCPTunnelClient setDestroyHandler:](v16, "setDestroyHandler:", v18);
    -[TimingCollection startTimingForKey:](self->super._perfTimings, "startTimingForKey:", 9);
    return -[TCPTunnelClient sendAllocateMsg:](self->_tcpTunnelClient, "sendAllocateMsg:", a7);
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a7, 32002, v23, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1089), CFSTR("Creating TCPTunnel Client failed."), CFSTR("Error was encountered"));
    return 0;
  }
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2;
  block[3] = &unk_1E9E52238;
  block[4] = v2;
  block[5] = a2;
  dispatch_async(v3, block);
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *global_queue;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[30] == 1)
  {
    v2[30] = 2;
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = objc_msgSend(v2, "remoteRelayUpdate");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"))
          v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), "description"), "UTF8String");
        else
          v7 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCTransportSessionLegacy createTCPTunnelForParticipantID:relayDictionary:didOriginateRequest:relayType:e"
              "rror:]_block_invoke_2";
        v17 = 1024;
        v18 = 1110;
        v19 = 2080;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: continue with ChannelBinding, %s.", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_52;
    block[3] = &unk_1E9E521C0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, block);
  }
  objc_msgSend(*(id *)(a1 + 32), "setLocalRelayConnectionData:", objc_msgSend(*(id *)(a1 + 32), "localConnectionData"));
  objc_msgSend(*(id *)(a1 + 32), "setLocalRelayUpdate:", objc_msgSend(*(id *)(a1 + 32), "createRelayUpdateDictionary:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopTimingForKey:", 9);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 24);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3;
  v11[3] = &unk_1E9E521C0;
  v11[4] = v9;
  dispatch_async(v10, v11);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_52(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "sendChannelBindingMsgWithDict:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), v6);
  if ((result & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_53;
    block[3] = &unk_1E9E521C0;
    block[4] = v3;
    dispatch_sync(v4, block);
    return objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, v6[0]);
  }
  return result;
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_53(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 240) = 6;
  return result;
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "transportSession:sendRelayResponse:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate"));
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedRealTimeData:fromParticipantID:", a2, a3);
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_6;
  v3[3] = &unk_1E9E521C0;
  v3[4] = v1;
  dispatch_async(v2, v3);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_6(uint64_t a1)
{
  uint64_t result;
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
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 240) != 5)
  {
    if (*(_BYTE *)(result + 267))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v5 = 136315650;
          v6 = v3;
          v7 = 2080;
          v8 = "-[VCTransportSessionLegacy createTCPTunnelForParticipantID:relayDictionary:didOriginateRequest:relayType:"
               "error:]_block_invoke_6";
          v9 = 1024;
          v10 = 1160;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCP Channel is set up, time out ICE right away.", (uint8_t *)&v5, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setICETimeout:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopTimingForKey:", 0);
      objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 6, 0);
      result = objc_msgSend(*(id *)(a1 + 32), "setupLoopbackWithConnectionType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "connectionType"));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 5;
    }
    else
    {
      return objc_msgSend((id)result, "deleteTCPTunnel");
    }
  }
  return result;
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_58;
  block[3] = &unk_1E9E52238;
  block[4] = v2;
  block[5] = a2;
  dispatch_async(v3, block);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_58(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 6;
  objc_msgSend(*(id *)(a1 + 32), "resetLoopback");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "connectionCount");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, *(_QWORD *)(a1 + 40));
  return result;
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3_60(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4_61;
  v3[3] = &unk_1E9E521C0;
  v3[4] = v1;
  dispatch_sync(v2, v3);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteTCPTunnel");
}

- (void)deleteTCPTunnel
{
  TCPTunnelClient *tcpTunnelClient;

  tcpTunnelClient = self->_tcpTunnelClient;
  if (tcpTunnelClient)
  {
    -[TCPTunnelClient closeTunnelSocket](tcpTunnelClient, "closeTunnelSocket");

    self->_tcpTunnelClient = 0;
  }
  self->rtChannel = 0;
}

- (void)loopbackSocketTunnel:(id)a3 receivedData:(id)a4 from:(tagIPPORT *)a5
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCTransportSessionLegacy_loopbackSocketTunnel_receivedData_from___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(stateQueue, block);
}

void __67__VCTransportSessionLegacy_loopbackSocketTunnel_receivedData_from___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 265))
  {
    v3 = *(id *)(v1 + 408);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "vcArg:sendRealTimeData:toParticipantID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "optionalArg"));

  }
}

- (void)resetLoopback
{
  uint64_t v3;
  NSObject *v4;
  VCConnectionProtocol *loopbackConnection;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VCTransportSessionLegacy deleteTCPTunnel](self, "deleteTCPTunnel");
  if (self->_useLoopback)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        loopbackConnection = self->_loopbackConnection;
        if (loopbackConnection)
          v6 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](loopbackConnection, "description"), "UTF8String");
        else
          v6 = "<nil>";
        v7 = 136315906;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCTransportSessionLegacy resetLoopback]";
        v11 = 1024;
        v12 = 1240;
        v13 = 2080;
        v14 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Remove loopback connection %s", (uint8_t *)&v7, 0x26u);
      }
    }
    -[VCConnectionManager removeConnection:](self->super._connectionManager, "removeConnection:", self->_loopbackConnection);
    self->_useLoopback = 0;
    -[LoopbackSocketTunnel shutdownSocket](self->_tunnel, "shutdownSocket");

    self->_tunnel = 0;
    self->rtChannel = 0;
  }
}

- (void)setupLoopbackWithConnectionType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  VCTransport *transport;
  uint64_t callID;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int ErrorLogLevelForModule;
  os_log_t *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  VCConnectionProtocol *loopbackConnection;
  const char *v25;
  int v26;
  uint64_t v27;
  uint8_t v28[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  uint8_t buf[48];
  __int128 v37;
  _OWORD v38[14];
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  unint64_t v42;
  uint64_t v43;

  v3 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1253;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  self->_useLoopback = 1;
  v42 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41[0] = v7;
  v41[1] = v7;
  transport = self->transport;
  callID = self->_callID;
  v26 = 0;
  -[VCTransport updateInterfaceList:shouldFilterCellInterface:isUpdateNeeded:](transport, "updateInterfaceList:shouldFilterCellInterface:isUpdateNeeded:", callID, self->super._requiresWiFi, &v26);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1261;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d call [transport getLoopbackIP]...", buf, 0x1Cu);
    }
  }
  -[VCTransport getLoopbackIP:](self->transport, "getLoopbackIP:", v41);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1263;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done [transport getLoopbackIP]...", buf, 0x1Cu);
    }
  }
  IPPORTToStringWithSize();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1267;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = &setupLoopbackWithConnectionType__ip;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d vtpIP = %s", buf, 0x26u);
    }
  }
  self->_tunnel = -[LoopbackSocketTunnel initWithPort:delegate:error:]([LoopbackSocketTunnel alloc], "initWithPort:delegate:error:", 55100, self, &v27);
  if (v27)
  {
    -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 7);
  }
  else
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v17 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1275;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d call tunnel setVTPIP...", buf, 0x1Cu);
      }
    }
    -[LoopbackSocketTunnel setVTPIP:](self->_tunnel, "setVTPIP:", v41);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1277;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done tunnel setVTPIP...", buf, 0x1Cu);
      }
    }
    -[LoopbackSocketTunnel setOptionalArg:](self->_tunnel, "setOptionalArg:", -[VCTransportSessionLegacy remoteParticipantID](self, "remoteParticipantID"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    memset(v38, 0, sizeof(v38));
    memset(buf, 0, sizeof(buf));
    -[LoopbackSocketTunnel getIPPort:](self->_tunnel, "getIPPort:", (char *)v38 + 4);
    -[LoopbackSocketTunnel getIPPort:](self->_tunnel, "getIPPort:", (char *)&v38[5] + 4);
    *(_DWORD *)&buf[20] = 1;
    DWORD2(v39) = 1;
    -[LoopbackSocketTunnel getVTPIPPort:](self->_tunnel, "getVTPIPPort:", &buf[28]);
    -[LoopbackSocketTunnel getVTPIPPort:](self->_tunnel, "getVTPIPPort:", (char *)&v38[2] + 12);
    self->_loopbackConnection = (VCConnectionProtocol *)-[VCConnectionLegacy initWithConnectionResult:type:]([VCConnectionLegacy alloc], "initWithConnectionResult:type:", buf, v3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        loopbackConnection = self->_loopbackConnection;
        if (loopbackConnection)
          v25 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](loopbackConnection, "description"), "UTF8String");
        else
          v25 = "<nil>";
        *(_DWORD *)v28 = 136315906;
        v29 = v22;
        v30 = 2080;
        v31 = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        v32 = 1024;
        v33 = 1292;
        v34 = 2080;
        v35 = v25;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Add loopback connection %s", v28, 0x26u);
      }
    }
    -[VCConnectionManager addConnection:](self->super._connectionManager, "addConnection:", self->_loopbackConnection);
  }
}

- (void)receivedRealTimeData:(id)a3 fromParticipantID:(id)a4
{
  NSObject *stateQueue;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (self->_useLoopback)
  {
    -[LoopbackSocketTunnel setOptionalArg:](self->_tunnel, "setOptionalArg:", a4);
    -[LoopbackSocketTunnel sendPacketToVTP:](self->_tunnel, "sendPacketToVTP:", a3);
  }
  else
  {
    stateQueue = self->super._stateQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__VCTransportSessionLegacy_receivedRealTimeData_fromParticipantID___block_invoke;
    v7[3] = &unk_1E9E527D0;
    v7[4] = self;
    v7[5] = a4;
    v7[6] = a3;
    dispatch_sync(stateQueue, v7);
  }
}

_BYTE *__67__VCTransportSessionLegacy_receivedRealTimeData_fromParticipantID___block_invoke(id *a1)
{
  _BYTE *result;
  void *v3;

  result = a1[4];
  if (!result[263])
  {
    result = (_BYTE *)objc_msgSend(a1[5], "isEqualToString:", objc_msgSend(result, "remoteParticipantID"));
    if ((_DWORD)result)
    {
      v3 = (void *)objc_msgSend(a1[6], "bytes");
      result = memchr(v3, 10, objc_msgSend(a1[6], "length"));
      if (result)
      {
        result = strnstr((const char *)v3, "SIP/", result - (_BYTE *)v3);
        if (result)
        {
          objc_msgSend(a1[4], "setupLoopbackWithConnectionType:", 0);
          objc_msgSend(*((id *)a1[4] + 52), "sendPacketToVTP:", a1[6]);
          return (_BYTE *)objc_msgSend((id)objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "resultQueue"), "addResult:forCallID:", 0, *((unsigned int *)a1[4] + 72));
        }
      }
    }
  }
  return result;
}

- (void)stopLoopback
{
  if (self->_useLoopback)
    objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel_stopLoopbackProc_, self, objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 8.0));
}

- (void)stopLoopbackProc:(id)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  int v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", a3);
  stateQueue = self->super._stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  -[TCPTunnelClient unbindChannel](self->_tcpTunnelClient, "unbindChannel");
  v7 = 4;
  while (!-[TCPTunnelClient isTunnelSocketClosed](self->_tcpTunnelClient, "isTunnelSocketClosed"))
  {
    sleep(1u);
    if (!--v7)
    {
      v8 = self->super._stateQueue;
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke_2;
      v10[3] = &unk_1E9E521C0;
      v10[4] = self;
      dispatch_sync(v8, v10);
      break;
    }
  }

}

void __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "shutdownSocket");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = 0;
}

uint64_t __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteTCPTunnel");
}

- (id)createInitiateRelayDictionary
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = -1431655766;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  -[VCTransportSessionLegacy localConnectionData](self, "localConnectionData");
  v4 = ICEGetExtIPIndex();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy localConnectionData](self, "localConnectionData"), CFSTR("GKSRelaySelfBlob"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4), CFSTR("GKSRelaySelfAddrPointer"));
  if ((_DWORD)v4 == -1)
  {
    v5 = 0;
  }
  else
  {
    -[NSData getBytes:range:](-[VCTransportSessionLegacy localConnectionData](self, "localConnectionData"), "getBytes:range:", &v10, (int)v4, 4);
    v5 = bswap32(v10);
  }
  v9 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 4), CFSTR("GKSRelaySelfExternalAddr"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF5318, CFSTR("GKSRelaySelfNatType"));
  -[VCTransportSessionLegacy remoteConnectionData](self, "remoteConnectionData");
  v6 = ICEGetExtIPIndex();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy remoteConnectionData](self, "remoteConnectionData"), CFSTR("GKSRelayPeerBlob"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6), CFSTR("GKSRelayPeerAddrPointer"));
  if ((_DWORD)v6 == -1)
  {
    v7 = 0;
  }
  else
  {
    -[NSData getBytes:range:](-[VCTransportSessionLegacy remoteConnectionData](self, "remoteConnectionData"), "getBytes:range:", &v10, (int)v6, 4);
    v7 = bswap32(v10);
  }
  v9 = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 4), CFSTR("GKSRelayPeerExternalAddr"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF5318, CFSTR("GKSRelayPeerNatType"));
  return v3;
}

- (id)createInitiateRelayDictionaryForCall:(unsigned int)a3 primaryConnection:(tagCONNRESULT *)a4
{
  uint64_t v5;
  id v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  unsigned int dwIPv4;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSData *v19;
  __int16 v20;
  NSData *v21;
  __int16 v22;
  void *v24[3];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v44 = 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  if (a4->dwCallID != a3)
    return 0;
  v5 = *(_QWORD *)&a3;
  memset(v24, 170, sizeof(v24));
  v7 = -[VCTransport getRemoteCIDForDstIPPort:callID:](self->transport, "getRemoteCIDForDstIPPort:callID:", &a4->mbDst, *(_QWORD *)&a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v7)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:].cold.1(v16, v17);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      dwIPv4 = a4->mbSrc.IP.dwIPv4;
      v12 = a4->mbRemote.IP.dwIPv4;
      *(_DWORD *)buf = 136316162;
      v26 = v9;
      v27 = 2080;
      v28 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
      v29 = 1024;
      v30 = 1442;
      v31 = 1024;
      v32 = dwIPv4;
      v33 = 1024;
      v34 = v12;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCallSession: preparing for secondary connection, %x, %x", buf, 0x28u);
    }
  }
  -[VCTransport getNextBestCandidate:callID:isLocal:IPPortToExclude:](self->transport, "getNextBestCandidate:callID:isLocal:IPPortToExclude:", &v45, v5, 1, &a4->mbSrc);
  -[VCTransport getNextBestCandidate:callID:isLocal:IPPortToExclude:](self->transport, "getNextBestCandidate:callID:isLocal:IPPortToExclude:", &v35, v5, 0, &a4->mbRemote);
  if (((a4->mbSrc.iFlags ^ DWORD2(v46)) & 4) == 0 && ((a4->mbRemote.iFlags ^ DWORD2(v36)) & 4) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v26 = v13;
        v27 = 2080;
        v28 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
        v29 = 1024;
        v30 = 1455;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d createInitiateRelayDictionaryForCall: No new candidate for secondary connection", buf, 0x1Cu);
      }
    }
    return 0;
  }
  if ((ICECompressCandidates() & 0x80000000) != 0)
  {
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24[2], SHIDWORD(v24[0]));
    free(v24[2]);
  }
  if ((ICECompressCandidates() & 0x80000000) != 0)
  {
    v19 = 0;
  }
  else
  {
    v19 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24[1], SLODWORD(v24[0]));
    free(v24[1]);
  }
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  if (v15)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v47));
    v20 = 1;
    v21 = (NSData *)v15;
  }
  else if (v19)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v37));
    v20 = 1;
    v21 = v19;
  }
  else
  {
    v21 = -[VCTransportSessionLegacy localConnectionData](self, "localConnectionData");
    *(_DWORD *)buf = 0;
    v20 = -1;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v20), CFSTR("GKSRelaySelfAddrPointer"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("GKSRelaySelfBlob"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 4), CFSTR("GKSRelaySelfExternalAddr"));
  if (v19)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v37));
    v22 = 1;
  }
  else if (v15)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v47));
    v22 = 1;
    v19 = (NSData *)v15;
  }
  else
  {
    v19 = -[VCTransportSessionLegacy remoteConnectionData](self, "remoteConnectionData");
    *(_DWORD *)buf = 0;
    v22 = -1;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v22), CFSTR("GKSRelayPeerAddrPointer"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("GKSRelayPeerBlob"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 4), CFSTR("GKSRelayPeerExternalAddr"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9EF5318, CFSTR("GKSRelaySelfNatType"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9EF5318, CFSTR("GKSRelayPeerNatType"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("GKSRelayRemotePrimaryIdentifier"));
  return v18;
}

- (id)createRelayUpdateDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  _BYTE v22[12];
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayType")), "intValue")), CFSTR("GKSRelayType"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID"));
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("GKSRelayConnectionID"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKRelayTransactionID"));
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("GKRelayTransactionID"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKRelayToken"));
  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("GKRelayToken"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayPeerRelayPort"));
  if (v9)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("GKSRelayPeerRelayPort"));
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayPeerRelayIP"));
  if (v10)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("GKSRelayPeerRelayIP"));
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelaySelfRelayIP"));
  if (v11)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("GKSRelaySelfRelayIP"));
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelaySelfRelayPort"));
  if (v12)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("GKSRelaySelfRelayPort"));
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayRemotePrimaryIdentifier"));
  if (v13)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("GKSRelayRemotePrimaryIdentifier"));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = v14;
  v30 = v14;
  if (GetIPPortFromDict())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionLegacy createRelayUpdateDictionary:].cold.1(v15, a3, v16);
    }
  }
  else
  {
    *(_DWORD *)v22 = -1431655766;
    if ((v29 & 1) == 0)
      *(_DWORD *)v22 = bswap32(DWORD1(v30));
    v17 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("GKSRelaySelfRelayNatIP"), *(_QWORD *)v22);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", WORD2(v31)), CFSTR("GKSRelaySelfRelayNatPort"));
  }
  if (-[VCTransportSessionLegacy localRelayConnectionData](self, "localRelayConnectionData"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy localRelayConnectionData](self, "localRelayConnectionData"), CFSTR("ClientData"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v20 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v20 = "<nil>";
      *(_DWORD *)v22 = 136315906;
      *(_QWORD *)&v22[4] = v18;
      v23 = 2080;
      v24 = "-[VCTransportSessionLegacy createRelayUpdateDictionary:]";
      v25 = 1024;
      v26 = 1588;
      v27 = 2080;
      v28 = v20;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d createRelayUpdateDictionary: dict %s", v22, 0x26u);
    }
  }
  return v5;
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;

  if (!a3)
    return 0;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("transportSessionLegacyOptionNonCellularCandidateTimeout")), "doubleValue");
  v8 = -[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:](self, "connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:", 0, 0, a5);
  *a3 = v8;
  return v8 != 0;
}

- (void)getConnectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 queue:(id)a6 completionHandler:(id)a7
{
  uint64_t v12;
  NSObject *global_queue;
  _QWORD v14[8];
  BOOL v15;
  BOOL v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = objc_msgSend(a7, "copy");
  global_queue = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E9E55FF0;
  v15 = a3;
  v16 = a4;
  *(double *)&v14[7] = a5;
  v14[4] = self;
  v14[5] = a6;
  v14[6] = v12;
  dispatch_async(global_queue, v14);
}

void __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[7];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:", *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), v6, *(double *)(a1 + 56));
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke_2;
      block[3] = &unk_1E9E53330;
      block[6] = v4;
      block[4] = v2;
      block[5] = v6[0];
      dispatch_async(v3, block);
    }
  }

}

uint64_t __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)connectionData:(char *)a3 connectionDataSizeInBytes:(int)a4 shouldUseRelay:(BOOL)a5
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  TimingCollection *perfTimings;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
  free(a3);
  if (a5)
  {
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
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCTransportSessionLegacy connectionData:connectionDataSizeInBytes:shouldUseRelay:]";
        v19 = 1024;
        v20 = 1645;
        v21 = 2080;
        v22 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relayconnectiondata = %s", buf, 0x26u);
      }
    }
    -[VCTransportSessionLegacy setLocalRelayConnectionData:](self, "setLocalRelayConnectionData:", v8);
    perfTimings = self->super._perfTimings;
    v13 = 9;
  }
  else
  {
    -[VCTransportSessionLegacy setLocalConnectionData:](self, "setLocalConnectionData:", v8);
    perfTimings = self->super._perfTimings;
    v13 = 8;
  }
  -[TimingCollection stopTimingForKey:](perfTimings, "stopTimingForKey:", v13);
  *(_DWORD *)buf = -1431655766;
  snprintf((char *)buf, 4uLL, "%u", self->_NATType);
  reportingLog();
  return v8;
}

- (id)connectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 error:(id *)a6
{
  uint64_t callID;
  uint64_t v10;
  VCTransport *transport;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  VCTransport *v23;
  int v25;
  int v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  VCTransport *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  callID = self->_callID;
  if (!a3 || a4)
  {
    if (a3 && a4)
      v10 = 9;
    else
      v10 = 8;
    -[TimingCollection startTimingForKey:](self->super._perfTimings, "startTimingForKey:", v10);
  }
  v27 = 0;
  transport = self->transport;
  v25 = 0;
  -[VCTransport updateInterfaceList:shouldFilterCellInterface:isUpdateNeeded:](transport, "updateInterfaceList:shouldFilterCellInterface:isUpdateNeeded:", callID, self->super._requiresWiFi, &v25);
  v12 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-blob-size-max")), "intValue");
  v26 = v12;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v29 = v13;
      v30 = 2080;
      v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
      v32 = 1024;
      v33 = 1684;
      v34 = 1024;
      v35 = v12;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The max blob size allowed = %d", buf, 0x22u);
    }
  }
  if (!v12)
    v26 = 201;
  v15 = -[VCTransportSessionLegacy generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:](self, "generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:", &v27, callID, &v26, a5);
  if (v15 == -2146107370)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v29 = v19;
        v30 = 2080;
        v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
        v32 = 1024;
        v33 = 1714;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ICE_E_NOTFOUND was received, using default connection data", buf, 0x1Cu);
      }
    }
  }
  else if (v15)
  {
    v16 = v15;
    reportingLog();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:].cold.1();
    }
    if (-[NSMutableDictionary count](-[VCTransportSessionLegacy localRelayRequestResponse](self, "localRelayRequestResponse"), "count"))
    {
      v17 = -[VCTransport detailedErrorCodeForConnectionWithCallID:](self->transport, "detailedErrorCodeForConnectionWithCallID:", callID);
      v18 = 32019;
    }
    else
    {
      v17 = 210;
      v18 = 32013;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a6, v18, v17, v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1707), CFSTR("No local connection data"), CFSTR("Check network settings."));
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->transport;
      *(_DWORD *)buf = 136316418;
      v29 = v21;
      v30 = 2080;
      v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
      v32 = 1024;
      v33 = 1717;
      v34 = 1024;
      v35 = v26;
      v36 = 2048;
      v37 = v27;
      v38 = 2048;
      v39 = v23;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectDataSizeInBytes = %d, connectionData = %p, transport = %p", buf, 0x36u);
    }
  }
  if (v26 && v27)
    return -[VCTransportSessionLegacy connectionData:connectionDataSizeInBytes:shouldUseRelay:](self, "connectionData:connectionDataSizeInBytes:shouldUseRelay:");
  reportingLog();
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a6, 32013, 211, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1724), CFSTR("No local connection data"), CFSTR("Check network settings."));
  return 0;
}

- (int)generateConnectionData:(char *)a3 forCallID:(unsigned int)a4 connectionDataSize:(int *)a5 nonCellularCandidateTimeout:(double)a6
{
  uint64_t v8;
  VCTransport *transport;
  uint64_t localU8Version;
  _BOOL8 useCompressedConnectionData;
  NSMutableDictionary *v14;
  _BOOL8 v15;
  int *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v8 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 10.0);
  -[NSCondition lock](self->_connectionDataTimeoutCondVar, "lock");
  transport = self->transport;
  localU8Version = self->_localU8Version;
  useCompressedConnectionData = self->super._useCompressedConnectionData;
  v14 = -[VCTransportSessionLegacy localRelayRequestResponse](self, "localRelayRequestResponse");
  LOBYTE(v24) = 0;
  v15 = useCompressedConnectionData;
  v16 = a5;
  v17 = -[VCTransport getConnectionDataForCallID:version:useCompressedData:pConnectionData:connectDataSizeInBytes:relayDictionary:interfaceUpdate:nonCellularCandidateTimeout:](transport, "getConnectionDataForCallID:version:useCompressedData:pConnectionData:connectDataSizeInBytes:relayDictionary:interfaceUpdate:nonCellularCandidateTimeout:", v8, localU8Version, v15, a3, a5, v14, a6, v24);
  if (v17 == -2146107370)
  {
    while (1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v28 = v18;
          v29 = 2080;
          v30 = "-[VCTransportSessionLegacy generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:]";
          v31 = 1024;
          v32 = 1757;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIPGetConnectionData failed, retrying", buf, 0x1Cu);
        }
      }
      if (!-[NSCondition waitUntilDate:](self->_connectionDataTimeoutCondVar, "waitUntilDate:", v26))
        break;
      LOBYTE(v25) = 0;
      v20 = -[VCTransport getConnectionDataForCallID:version:useCompressedData:pConnectionData:connectDataSizeInBytes:relayDictionary:interfaceUpdate:nonCellularCandidateTimeout:](self->transport, "getConnectionDataForCallID:version:useCompressedData:pConnectionData:connectDataSizeInBytes:relayDictionary:interfaceUpdate:nonCellularCandidateTimeout:", v8, self->_localU8Version, self->super._useCompressedConnectionData, a3, v16, -[VCTransportSessionLegacy localRelayRequestResponse](self, "localRelayRequestResponse"), a6, v25);
      if (v20 != -2146107370)
      {
        v17 = v20;
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v21;
        v29 = 2080;
        v30 = "-[VCTransportSessionLegacy generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:]";
        v31 = 1024;
        v32 = 1770;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCallSession generateConnectionData: timed out", buf, 0x1Cu);
      }
    }
    v17 = -2146107370;
  }
LABEL_12:
  -[NSCondition unlock](self->_connectionDataTimeoutCondVar, "unlock");

  return v17;
}

- (void)setupTransport
{
  VCTransport *transport;
  uint64_t callID;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  transport = self->transport;
  if (!transport)
  {
    transport = +[VCTransport sharedInstance](VCTransport, "sharedInstance");
    self->transport = transport;
  }
  callID = self->_callID;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke;
  v8[3] = &unk_1E9E56018;
  v8[4] = self;
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_2;
  v7[3] = &unk_1E9E56040;
  v7[4] = self;
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_3;
  v6[3] = &unk_1E9E56068;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_4;
  v5[3] = &unk_1E9E56090;
  -[VCTransport registerICEBlockForCallID:connectedBlock:newCandidatesBlock:newNominationBlock:removeIPPortBlock:](transport, "registerICEBlockForCallID:connectedBlock:newCandidatesBlock:newNominationBlock:removeIPPortBlock:", callID, v8, v7, v6, v5);
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionResultCallback:didReceiveICEPacket:didUseRelay:secretKey:skeResult:", a2, a3, a4, a5, a6);
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewCandidates:version:", a2, a3);
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "connectionManager"), "shouldNominateCandidatePair:interfaceMask:nominated:demote:connectionPriority:replaceOnly:", a2, a3, a4, a5, a6, a7);
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "connectionManager"), "removeConnectionWithIPPort:isLocalInterface:", a2, a3);
}

- (void)resetICETimeoutToLongTimeout
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d [transport setICETimeout] timeout failed with %08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (double)iceTimeoutInSeconds:(BOOL)a3
{
  double result;

  if (self->allowsRelay)
  {
    result = 60.0;
    if (self->_isCaller && !a3)
    {
      if (GKSConnectivitySettings_GetICETimeout() <= 0.0)
        return 60.0;
      else
        return GKSConnectivitySettings_GetICETimeout();
    }
  }
  else
  {
    result = 1.0;
    if (!self->_tcpTunnelClient)
      return 15.0;
  }
  return result;
}

- (tagIPPORT)IPPortForPrimaryConnectionOnLocalInterface:(SEL)a3
{
  _BOOL4 v4;
  tagIPPORT *result;
  tagIPPORT *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v4 = a4;
  *(_QWORD *)&retstr->IP.abIPv6[12] = 0;
  *(_OWORD *)&retstr->iFlags = 0u;
  *(_OWORD *)&retstr->szIfName[12] = 0u;
  result = (tagIPPORT *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super._connectionManager);
  if (result)
  {
    v7 = result;
    if (-[tagIPPORT connectionResult](result, "connectionResult"))
    {
      v8 = -[tagIPPORT connectionResult](v7, "connectionResult");
      v9 = 148;
      if (v4)
        v9 = 28;
      v10 = v8 + v9;
      v11 = *(_OWORD *)(v10 + 16);
      *(_OWORD *)&retstr->iFlags = *(_OWORD *)v10;
      *(_OWORD *)&retstr->szIfName[12] = v11;
      *(_QWORD *)&retstr->IP.abIPv6[12] = *(_QWORD *)(v10 + 32);
    }
    CFRelease(v7);
  }
  return result;
}

- (unsigned)connectionTypeForConnectionResult:(tagCONNRESULT *)a3
{
  if (!a3)
    return 0;
  if (a3->bIfRelay)
  {
    if (self->requestedTimeoutRelay)
      return 5;
    else
      return 2;
  }
  else if (a3->bIfUpgrade)
  {
    return 6;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isConnectedAndAllowAdditionalConnection
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[VCConnectionManager connectionCount](self->super._connectionManager, "connectionCount");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCTransportSessionLegacy isConnectedAndAllowAdditionalConnection]";
      v10 = 1024;
      v11 = 1891;
      v12 = 1024;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d number of connection is %d", (uint8_t *)&v6, 0x22u);
    }
  }
  return (v2 - 1) < 2;
}

- (int)detailedErrorCode
{
  return -[VCTransport detailedErrorCodeForConnectionWithCallID:](self->transport, "detailedErrorCodeForConnectionWithCallID:", self->_callID);
}

- (void)reportNetworkConditionsDegraded
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v3 = v2;
  v4 = v2;
  if (self)
  {
    -[VCTransportSessionLegacy IPPortForPrimaryConnectionOnLocalInterface:](self, "IPPortForPrimaryConnectionOnLocalInterface:", 1, v3, v4, v5, v6);
  }
  else
  {
    v5 = 0;
    v3 = 0u;
    v4 = 0u;
  }
  VTP_SetNetworkLogLevel((uint64_t)&v3, 6);
}

- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3
{
  -[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:](self, "setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:", 0, self->_callID, *(_QWORD *)&a3);
}

- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3
{
  -[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:](self, "setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:", 1, self->_callID, *(_QWORD *)&a3);
}

- (void)setIdentity:(__SecIdentity *)a3
{
  __SecIdentity *v4;

  if (a3)
    v4 = (__SecIdentity *)CFRetain(a3);
  else
    v4 = 0;
  self->_identity = v4;
}

- (int)pendingRelayCount
{
  return self->pendingRelayCount;
}

- (void)setPendingRelayCount:(int)a3
{
  self->pendingRelayCount = a3;
}

- (BOOL)initialSecondaryRelaySetupDone
{
  return self->initialSecondaryRelaySetupDone;
}

- (void)setInitialSecondaryRelaySetupDone:(BOOL)a3
{
  self->initialSecondaryRelaySetupDone = a3;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (void)setIsCaller:(BOOL)a3
{
  self->_isCaller = a3;
}

- (NSString)localParticipantID
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setLocalParticipantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (NSString)remoteParticipantID
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRemoteParticipantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (NSData)localConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLocalConnectionData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSData)remoteConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRemoteConnectionData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSData)localRelayConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLocalRelayConnectionData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSData)remoteRelayConnectionData
{
  return self->_remoteRelayConnectionData;
}

- (void)setRemoteRelayConnectionData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (BOOL)allowsRelay
{
  return self->allowsRelay;
}

- (void)setAllowsRelay:(BOOL)a3
{
  self->allowsRelay = a3;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (unsigned)remoteCallID
{
  return self->_remoteCallID;
}

- (void)setRemoteCallID:(unsigned int)a3
{
  self->_remoteCallID = a3;
}

- (unsigned)connectionSetupRTTEstimate
{
  return self->_connectionSetupRTTEstimate;
}

- (BOOL)isRemoteOSPreLion
{
  return self->_isRemoteOSPreLion;
}

- (NSMutableDictionary)localRelayRequestResponse
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLocalRelayRequestResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSMutableDictionary)remoteRelayRequestResponse
{
  return self->_remoteRelayRequestResponse;
}

- (void)setRemoteRelayRequestResponse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (NSDictionary)localRelayUpdate
{
  return self->_localRelayUpdate;
}

- (void)setLocalRelayUpdate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (NSDictionary)remoteRelayUpdate
{
  return self->_remoteRelayUpdate;
}

- (void)setRemoteRelayUpdate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (int)NATType
{
  return self->_NATType;
}

- (void)setNATType:(int)a3
{
  self->_NATType = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

void __33__VCTransportSessionLegacy_start__block_invoke_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d startConnectionWithBlob for P2P failed with error %s", v4, v5, v6, v7, 2u);
}

- (void)startConnectionWithBlob:useRelay:isInitialRelay:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_9();
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: VCCallSession: StartConnectionCheck failed(%X)", v1, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (void)startConnectionWithBlob:useRelay:isInitialRelay:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_9();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: VCCallSession: StartConnectionCheck failed(%X)", v1, 0x28u);
  OUTLINED_FUNCTION_3();
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 323;
  v5 = v0;
  v6 = 323;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict: can't find relay type info in the dictionary", v3);
  OUTLINED_FUNCTION_3();
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_2()
{
  id *v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11_9();
  if (OUTLINED_FUNCTION_13_5(v1, v2))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v0, "userInfo"), "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v3, v4, " [%s] %s:%d Unable to create TCPTunnel: %s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_9_5();
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  id *v4;
  int v5;
  uint64_t v6;
  const char *v7;
  __int16 v8;

  OUTLINED_FUNCTION_11_9();
  if (OUTLINED_FUNCTION_13_5(v3, v4))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v2, "userInfo"), "description"), "UTF8String");
  v5 = 136315906;
  v6 = v1;
  OUTLINED_FUNCTION_7_1();
  v7 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
  v8 = 1024;
  OUTLINED_FUNCTION_10_10();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unable to create TCPTunnel: %s", (uint8_t *)&v5, 0x26u);
  OUTLINED_FUNCTION_9_5();
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_32_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11_9();
  if (objc_msgSend(v1, "userInfo"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v0, "userInfo"), "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Unabled to create UDP relay blob: %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_9_5();
}

void __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke_cold_1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 435;
  v5 = v0;
  v6 = 435;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayUpdateDict: can't find relay type info in the dictionary", v3);
  OUTLINED_FUNCTION_3();
}

void __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d networkStateDidChange: Error %x getting connection data!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteIPChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: Bad blob version number: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)handleExchangedKey:result:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Key exchange failed with error: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)createInitiateRelayDictionaryForCall:(uint64_t)a1 primaryConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
  v6 = 1024;
  v7 = 1438;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Didn't find valid remote candidate ID, cannot create relay dictionary", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)createRelayUpdateDictionary:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  v8 = 136316162;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  v10 = 1582;
  v11 = v5;
  v12 = 1582;
  v13 = v6;
  v14 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: createRelayUpdateDictionary: requestResponse is %s", (uint8_t *)&v8, 0x2Cu);
}

- (void)connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error %x getting sip connection data!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
