@implementation VCTransportSessionNW

- (VCTransportSessionNW)initWithRTPNWConnectionID:(id)a3 RTCPNWConnectionID:(id)a4 handlerQueue:(id)a5 context:(void *)a6 notificationHandler:(void *)a7 eventHandler:(void *)a8
{
  VCTransportSessionNW *v10;
  VCNWConnectionInfo *v11;
  VCNWConnectionInfo *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:].cold.1();
    }
    return 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)VCTransportSessionNW;
  v10 = -[VCTransportSession initWithNotificationQueue:reportingAgent:notificationHandler:eventHandler:handlerQueue:context:](&v14, sel_initWithNotificationQueue_reportingAgent_notificationHandler_eventHandler_handlerQueue_context_, 0, 0, a7, a8, a5, a6);
  if (v10)
  {
    v10->_startWaitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v10->_cancelWaitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v11 = (VCNWConnectionInfo *)objc_opt_new();
    v10->_rtpConnectionInfo = v11;
    -[VCNWConnectionInfo setConnectionID:](v11, "setConnectionID:", a3);
    if (a4)
    {
      v12 = (VCNWConnectionInfo *)objc_opt_new();
      v10->_rtcpConnectionInfo = v12;
      -[VCNWConnectionInfo setConnectionID:](v12, "setConnectionID:", a4);
    }
    if (-[VCTransportSessionNW createConnections](v10, "createConnections") < 0)
    {

      return 0;
    }
  }
  return v10;
}

- (int)createConnections
{
  int v3;
  int v4;
  int v5;

  self->_isSharedConnection = 1;
  v3 = -[VCTransportSessionNW createAndSetupConnection:](self, "createAndSetupConnection:", self->_rtpConnectionInfo);
  if (v3 < 0)
  {
    v5 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createConnections].cold.1();
    }
  }
  else
  {
    if (!self->_rtcpConnectionInfo)
    {
      v5 = v3;
      goto LABEL_6;
    }
    v4 = -[VCTransportSessionNW createAndSetupConnection:](self, "createAndSetupConnection:");
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      self->_isSharedConnection = 0;
LABEL_6:
      -[VCTransportSessionNW initializeNetworkMTU](self, "initializeNetworkMTU");
      -[VCTransportSessionNW initializeIsIPv6](self, "initializeIsIPv6");
      -[VCTransportSessionNW initializeInterfaceType](self, "initializeInterfaceType");
      -[VCTransportSession setShouldSetupNWMonitor:](self, "setShouldSetupNWMonitor:", 1);
      self->_didScheduleReceive = 0;
      return v5;
    }
    v5 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createConnections].cold.2();
    }
  }
  return v5;
}

- (int)createAndSetupConnection:(id)a3
{
  int v5;
  int v6;

  v5 = -[VCTransportSessionNW createNWConnection:](self, "createNWConnection:");
  if (v5 < 0)
  {
    v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createAndSetupConnection:].cold.1();
    }
  }
  else
  {
    v6 = -[VCTransportSessionNW setupNWConnection:](self, "setupNWConnection:", objc_msgSend(a3, "connection"));
    if (v6 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createAndSetupConnection:].cold.2();
    }
  }
  return v6;
}

- (int)configureConnectionToReceiveHoplimit:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_protocol_options_t v6;
  nw_protocol_options_t v7;
  int v8;

  if (!a3)
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:].cold.1();
    }
    goto LABEL_15;
  }
  if (!objc_msgSend(a3, "parameters"))
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:].cold.2();
    }
LABEL_15:
    v7 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  v4 = nw_parameters_copy_default_protocol_stack((nw_parameters_t)objc_msgSend(a3, "parameters"));
  if (!v4)
  {
    v8 = -2144665536;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:].cold.3();
        v7 = 0;
        v5 = 0;
        v8 = -2144665536;
        goto LABEL_6;
      }
    }
    goto LABEL_15;
  }
  v5 = v4;
  v6 = nw_protocol_stack_copy_internet_protocol(v4);
  if (v6)
  {
    v7 = v6;
    nw_ip_options_set_receive_hop_limit();
    v8 = 0;
  }
  else
  {
    v8 = -2144665536;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCTransportSessionNW configureConnectionToReceiveHoplimit:].cold.4();
      v7 = 0;
      v8 = -2144665536;
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_6:
  nw_release(v7);
  nw_release(v5);
  return v8;
}

- (int)createNWConnection:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *host_with_numeric_port;
  _BYTE v15[22];
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createNWConnection:].cold.1();
    }
    goto LABEL_31;
  }
  if (objc_msgSend(a3, "connectionID"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(a3, "connectionID"));
    if (!v5)
    {
      v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW createNWConnection:].cold.6();
      }
      goto LABEL_31;
    }
    v6 = v5;
    *(_QWORD *)v15 = 0;
    *(_QWORD *)&v15[8] = 0;
    objc_msgSend(v5, "getUUIDBytes:", v15);

    +[VCVTPWrapper connectionContext](VCVTPWrapper, "connectionContext");
    v7 = (void *)nw_connection_create_with_client_id();
    if (v7)
      goto LABEL_5;
LABEL_13:
    v8 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCTransportSessionNW createNWConnection:].cold.4();
        v7 = 0;
        v8 = -2144665596;
        goto LABEL_9;
      }
    }
LABEL_31:
    v7 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(a3, "remoteAddress"))
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createNWConnection:].cold.2();
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(a3, "parameters"))
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createNWConnection:].cold.3();
    }
    goto LABEL_31;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip"), "cStringUsingEncoding:", 4);
  objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port");
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  v7 = nw_connection_create(host_with_numeric_port, (nw_parameters_t)objc_msgSend(a3, "parameters"));
  nw_release(host_with_numeric_port);
  if (!v7)
    goto LABEL_13;
LABEL_5:
  objc_msgSend(a3, "setConnection:", v7);
  v8 = -[VCTransportSessionNW configureConnectionToReceiveHoplimit:](self, "configureConnectionToReceiveHoplimit:", a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8 < 0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createNWConnection:].cold.5();
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(a3, "remoteAddress");
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCTransportSessionNW createNWConnection:]";
      v16 = 1024;
      v17 = 237;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully created NW Connection to endpoint with remoteAddress=%@", v15, 0x26u);
    }
  }
LABEL_9:
  nw_release(v7);
  return v8;
}

- (int)cancelConnections
{
  int result;

  result = -[VCTransportSessionNW destroyNWConnection:](self, "destroyNWConnection:", &self->_rtpConnectionInfo);
  if (self->_rtcpConnectionInfo)
    return -[VCTransportSessionNW destroyNWConnection:](self, "destroyNWConnection:");
  return result;
}

- (int)destroyNWConnection:(id *)a3
{
  NSObject *cancelWaitSemaphore;
  dispatch_time_t v6;
  int v7;

  if (!a3 || !*a3 || !objc_msgSend(*a3, "connection"))
    return 0;
  nw_connection_cancel((nw_connection_t)objc_msgSend(*a3, "connection"));
  cancelWaitSemaphore = self->_cancelWaitSemaphore;
  v6 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(cancelWaitSemaphore, v6))
  {
    v7 = -2144665577;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW destroyNWConnection:].cold.1();
    }
  }
  else
  {
    nw_connection_set_state_changed_handler((nw_connection_t)objc_msgSend(*a3, "connection"), 0);

    v7 = 0;
    *a3 = 0;
  }
  return v7;
}

- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4
{
  unsigned __int16 v4;
  _BOOL4 v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  VCNetworkAddress *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  VCNetworkAddress *v19;
  uint64_t v21;
  NSObject *v22;
  VCNetworkAddress *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  VCNetworkAddress *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isValid"))
  {
LABEL_18:
    v13 = 0;
    v12 = 0;
    v15 = 0;
    goto LABEL_14;
  }
  v7 = -[VCNWConnectionInfo isSameRemoteAddress:](self->_rtpConnectionInfo, "isSameRemoteAddress:", a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = -[VCNWConnectionInfo remoteAddress](self->_rtpConnectionInfo, "remoteAddress");
        v24 = 136316162;
        v25 = v21;
        v26 = 2080;
        v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
        v28 = 1024;
        v29 = 282;
        v30 = 2112;
        v31 = v23;
        v32 = 2112;
        v33 = a3;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote IP Address did not change. current=%@, new=%@", (uint8_t *)&v24, 0x30u);
      }
    }
    goto LABEL_18;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[VCNWConnectionInfo remoteAddress](self->_rtpConnectionInfo, "remoteAddress");
      v24 = 136316162;
      v25 = v9;
      v26 = 2080;
      v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
      v28 = 1024;
      v29 = 284;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = a3;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating NW connections, oldRtpRemoteAddress=%@, newRtpRemoteAddress=%@", (uint8_t *)&v24, 0x30u);
    }
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setParameters:", -[VCNWConnectionInfo parameters](self->_rtpConnectionInfo, "parameters"));
  objc_msgSend(v12, "setRemoteAddress:", a3);
  if (self->_isSharedConnection)
  {
    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setParameters:", -[VCNWConnectionInfo parameters](self->_rtcpConnectionInfo, "parameters"));
    objc_msgSend(v13, "setRemoteAddress:", a3);
    objc_msgSend((id)objc_msgSend(v13, "remoteAddress"), "setPort:", v4);
  }
  v14 = -[VCTransportSessionNW cancelConnections](self, "cancelConnections");
  if (v14 < 0)
  {
    v15 = v14;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:].cold.1();
    }
  }
  else
  {
    -[VCTransportSessionNW setRtpConnectionInfo:](self, "setRtpConnectionInfo:", v12);
    -[VCTransportSessionNW setRtcpConnectionInfo:](self, "setRtcpConnectionInfo:", v13);
    v15 = -[VCTransportSessionNW createConnections](self, "createConnections");
    v16 = VRTraceGetErrorLogLevelForModule();
    if (v15 < 0)
    {
      if (v16 >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:].cold.2();
      }
    }
    else if (v16 >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[VCNWConnectionInfo remoteAddress](self->_rtpConnectionInfo, "remoteAddress");
        v24 = 136315906;
        v25 = v17;
        v26 = 2080;
        v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
        v28 = 1024;
        v29 = 307;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully updated NW connections, newRtpRemoteAddress=%@", (uint8_t *)&v24, 0x26u);
      }
    }
  }
LABEL_14:

  return v15;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"))
  {
    nw_connection_cancel((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
    nw_connection_set_state_changed_handler((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"), 0);
  }
  if (-[VCNWConnectionInfo connection](self->_rtcpConnectionInfo, "connection"))
  {
    nw_connection_cancel((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtcpConnectionInfo, "connection"));
    nw_connection_set_state_changed_handler((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtcpConnectionInfo, "connection"), 0);
  }

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionNW;
  -[VCTransportSession dealloc](&v3, sel_dealloc);
}

- (void)handleStateChanges:(int)a3 error:(id)a4 operationResult:(BOOL *)a5
{
  uint64_t v9;
  NSObject *v10;
  int *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCTransportSessionNW handleStateChanges:error:operationResult:]";
      v16 = 1024;
      v17 = 333;
      v18 = 2112;
      v19 = a4;
      v20 = 1024;
      v21 = a3;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Get error %@ from nw connection with state: %d!", (uint8_t *)&v12, 0x2Cu);
    }
  }
  if (a3 == 5)
  {
    v11 = &OBJC_IVAR___VCTransportSessionNW__cancelWaitSemaphore;
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 != 3)
        return;
      *a5 = 1;
    }
    v11 = &OBJC_IVAR___VCTransportSessionNW__startWaitSemaphore;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.super.isa + *v11));
}

- (int)setStateChangeHandlerForConnection:(id)a3 result:(BOOL *)a4
{
  uint64_t v6;
  int v7;
  _QWORD handler[7];

  handler[6] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__VCTransportSessionNW_setStateChangeHandlerForConnection_result___block_invoke;
    handler[3] = &unk_1E9E53198;
    handler[4] = v6;
    handler[5] = a4;
    nw_connection_set_state_changed_handler((nw_connection_t)a3, handler);
    return 0;
  }
  else
  {
    v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW setStateChangeHandlerForConnection:result:].cold.1();
    }
  }
  return v7;
}

void __66__VCTransportSessionNW_setStateChangeHandlerForConnection_result___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  void *v8;
  const void *v9;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCTransportSessionNW setStateChangeHandlerForConnection:result:]_block_invoke";
      v14 = 1024;
      v15 = 354;
      v16 = 1024;
      v17 = a2;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get nw connection state %d", (uint8_t *)&v10, 0x22u);
    }
  }
  v8 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "handleStateChanges:error:operationResult:", a2, a3, *(_QWORD *)(a1 + 40));
    CFRelease(v9);
  }
}

- (int)setupNWConnection:(id)a3
{
  int v5;
  NSObject *startWaitSemaphore;
  dispatch_time_t v7;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  nw_connection_set_queue((nw_connection_t)a3, (dispatch_queue_t)+[VCVTPWrapper targetQueue](VCVTPWrapper, "targetQueue"));
  v5 = -[VCTransportSessionNW setStateChangeHandlerForConnection:result:](self, "setStateChangeHandlerForConnection:result:", a3, &v9);
  if (v5 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW setupNWConnection:].cold.1();
    }
  }
  else
  {
    nw_connection_start((nw_connection_t)a3);
    startWaitSemaphore = self->_startWaitSemaphore;
    v7 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(startWaitSemaphore, v7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
        return -2144665577;
      }
      else
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = -2144665577;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW setupNWConnection:].cold.3();
      }
    }
    else if (!v9)
    {
      v5 = -2144665596;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW setupNWConnection:].cold.2();
      }
    }
  }
  return v5;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v7;
  unsigned int v8;
  int *v9;
  int v10;
  int v11;

  if (!a3)
  {
    v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createVFD:forStreamType:].cold.1();
    }
    goto LABEL_24;
  }
  v4 = *(_QWORD *)&a4;
  if (a4 > 6)
  {
    v7 = 0xFFFFFFFFLL;
  }
  else if (((1 << a4) & 0x2E) != 0)
  {
    v7 = VTP_SocketWithNWConnection(2u, 17, -[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
    if ((_DWORD)v7 == -1)
    {
      v8 = *__error() | 0xC02B0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW createVFD:forStreamType:].cold.5();
      }
      goto LABEL_24;
    }
  }
  else
  {
    if (((1 << a4) & 0x50) == 0)
    {
      v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW createVFD:forStreamType:].cold.4();
      }
      goto LABEL_24;
    }
    if (self->_isSharedConnection)
      v9 = &OBJC_IVAR___VCTransportSessionNW__rtpConnectionInfo;
    else
      v9 = &OBJC_IVAR___VCTransportSessionNW__rtcpConnectionInfo;
    v7 = VTP_SocketWithNWConnection(2u, 17, objc_msgSend(*(id *)((char *)&self->super.super.isa + *v9), "connection"));
    if ((_DWORD)v7 == -1)
    {
      v8 = *__error() | 0xC02B0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionNW createVFD:forStreamType:].cold.6();
      }
      goto LABEL_24;
    }
  }
  if (self->_isSharedConnection)
    v10 = 2;
  else
    v10 = 1;
  if (VTP_SetSocketMode(v7, v10) == -1)
  {
    v8 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createVFD:forStreamType:].cold.2();
    }
  }
  else
  {
    v11 = +[VCTransportSession vtpPacketTypeForStreamType:](VCTransportSession, "vtpPacketTypeForStreamType:", v4);
    if (!v11)
    {
      v8 = -2144665599;
      goto LABEL_25;
    }
    if (VTP_SetPktType(v7, v11) != -1)
    {
      v8 = 0;
      *a3 = v7;
LABEL_24:
      v7 = 0xFFFFFFFFLL;
      goto LABEL_25;
    }
    v8 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW createVFD:forStreamType:].cold.3();
    }
  }
LABEL_25:
  VCCloseVFDIfValid(v7);
  return v8;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_ScheduleReceiveForNWConnection failed for RTP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCTransportSession destroyNWMonitor](self, "destroyNWMonitor");
  -[VCTransportSessionNW removeNetworkAssertion](self, "removeNetworkAssertion");
  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionNW;
  -[VCTransportSession stop](&v3, sel_stop);
}

- (void)addNetworkAssertion
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VCTransportSessionNW_addNetworkAssertion__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __43__VCTransportSessionNW_addNetworkAssertion__block_invoke(uint64_t a1)
{
  void *v1;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)VCTransportSessionNW;
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
  v3[2] = __46__VCTransportSessionNW_removeNetworkAssertion__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __46__VCTransportSessionNW_removeNetworkAssertion__block_invoke(uint64_t a1)
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VCTransportSessionNW;
  return objc_msgSendSuper2(&v2, sel_removeNetworkAssertion);
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = -[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection");
  return (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_Create(v3);
}

- (int)dupRTPNWConnectionBackingSocket
{
  return -[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:](self, "dupRTPNWConnectionBackingSocketForNWConnection:", -[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
}

- (int)dupRTCPNWConnectionBackingSocket
{
  return -[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:](self, "dupRTPNWConnectionBackingSocketForNWConnection:", -[VCNWConnectionInfo connection](self->_rtcpConnectionInfo, "connection"));
}

- (int)dupRTPNWConnectionBackingSocketForNWConnection:(id)a3
{
  int connected_socket;
  int v5;
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:].cold.1();
    }
    return -1;
  }
  connected_socket = nw_connection_get_connected_socket();
  if (connected_socket == -1)
    return -1;
  v5 = connected_socket;
  v6 = dup(connected_socket);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6 == -1)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:]";
        v17 = 1024;
        v18 = 499;
        v19 = 2048;
        v20 = a3;
        v21 = 1024;
        v22 = v5;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection %p is backed by socket %d. Failed to dup", (uint8_t *)&v13, 0x2Cu);
      }
    }
    return -1;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136316418;
      v14 = v8;
      v15 = 2080;
      v16 = "-[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:]";
      v17 = 1024;
      v18 = 497;
      v19 = 2048;
      v20 = a3;
      v21 = 1024;
      v22 = v5;
      v23 = 1024;
      v24 = v6;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection %p is backed by socket %d duped to %d", (uint8_t *)&v13, 0x32u);
    }
  }
  return v6;
}

- (void)initializeInterfaceType
{
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = nw_connection_copy_current_path((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__VCTransportSessionNW_initializeInterfaceType__block_invoke;
  v4[3] = &unk_1E9E531C0;
  v4[4] = self;
  nw_path_enumerate_interfaces(v3, v4);
  nw_release(v3);
}

uint64_t __47__VCTransportSessionNW_initializeInterfaceType__block_invoke(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type;
  nw_interface_type_t v5;
  nw_interface_type_t subtype;
  nw_interface_type_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *name;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  nw_interface_type_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  type = nw_interface_get_type(interface);
  if (type == nw_interface_type_loopback)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 5;
    goto LABEL_9;
  }
  v5 = type;
  if (type == nw_interface_type_wired)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 1;
    goto LABEL_9;
  }
  if (type == nw_interface_type_wifi)
  {
    subtype = nw_interface_get_subtype();
    if (subtype == 1001)
    {
      name = nw_interface_get_name(interface);
      v15 = strcmp(name, "llw0");
      v8 = *(_QWORD *)(a1 + 32);
      if (v15)
        v9 = 3;
      else
        v9 = 2;
      goto LABEL_9;
    }
    v7 = subtype;
    if (subtype == 1002)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 4;
LABEL_9:
      *(_DWORD *)(v8 + 252) = v9;
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v16;
        v19 = 2080;
        v20 = "-[VCTransportSessionNW initializeInterfaceType]_block_invoke";
        v21 = 1024;
        v22 = 522;
        v23 = 1024;
        v24 = v7;
        v13 = " [%s] %s:%d Not setting unexpected wifi nw_interface_subtype_t %d";
        goto LABEL_19;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = v11;
      v19 = 2080;
      v20 = "-[VCTransportSessionNW initializeInterfaceType]_block_invoke";
      v21 = 1024;
      v22 = 529;
      v23 = 1024;
      v24 = v5;
      v13 = " [%s] %s:%d Not setting unexpected nw_interface_type_t %d";
LABEL_19:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x22u);
    }
  }
  return 0;
}

- (BOOL)initializeNetworkMTU
{
  nw_path_t v3;
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
  v3 = nw_connection_copy_current_path((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
  if (v3)
  {
    self->_networkMTU = nw_path_get_mtu();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCTransportSessionNW initializeNetworkMTU]";
      v11 = 1024;
      v12 = 540;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection_copy_current_path failed", (uint8_t *)&v7, 0x1Cu);
    }
  }
  nw_release(v3);
  return v3 != 0;
}

- (BOOL)initializeIsIPv6
{
  NSObject *v3;
  NSObject *v4;
  const sockaddr *address;
  BOOL v6;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = nw_connection_copy_endpoint((nw_connection_t)-[VCNWConnectionInfo connection](self->_rtpConnectionInfo, "connection"));
  v4 = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_4;
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCTransportSessionNW initializeIsIPv6]";
      v16 = 1024;
      v17 = 551;
      v10 = " [%s] %s:%d nw_connection_copy_endpoint failed";
      goto LABEL_11;
    }
LABEL_12:
    v6 = 0;
    goto LABEL_4;
  }
  address = nw_endpoint_get_address(v3);
  if (!address)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_4;
      v12 = 136315650;
      v13 = v11;
      v14 = 2080;
      v15 = "-[VCTransportSessionNW initializeIsIPv6]";
      v16 = 1024;
      v17 = 554;
      v10 = " [%s] %s:%d nw_endpoint_get_address failed";
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x1Cu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  self->_isIPv6 = address->sa_family == 30;
  v6 = 1;
LABEL_4:
  nw_release(v4);
  return v6;
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

- (VCNWConnectionInfo)rtpConnectionInfo
{
  return self->_rtpConnectionInfo;
}

- (void)setRtpConnectionInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (VCNWConnectionInfo)rtcpConnectionInfo
{
  return self->_rtcpConnectionInfo;
}

- (void)setRtcpConnectionInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (void)initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'connectionID' may not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createConnections
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create nw_connection for RTCP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndSetupConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create nw_connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndSetupConnection:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureConnectionToReceiveHoplimit:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nwConnectionInfo is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureConnectionToReceiveHoplimit:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d network parameters is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureConnectionToReceiveHoplimit:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d network protocolStack is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureConnectionToReceiveHoplimit:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d network protocol ipOptions is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nwConnectionInfo is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d remoteAddress is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d parameters is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create nwConnection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure connection to receive hoplimit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createNWConnection:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create connectionClientID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)destroyNWConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nw_connection cancel timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed cancelling the NW connections", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed creating the NW connections", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setStateChangeHandlerForConnection:result:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'operationResult' must be non-nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnection:.cold.1()
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
  v3 = 372;
  v4 = 2112;
  v5 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set handlers for NWConnection for connection=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnection:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nw_connection start failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnection:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nw_connection ready timeout", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL vfd", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetSocketMode failed %x", v2, v3, v4, 410);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetPktType failed %x", v2, v3, v4, 416);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid Stream Type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP socket creation failed for RTP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP socket creation failed for RTCP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dupRTPNWConnectionBackingSocketForNWConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d connection must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
