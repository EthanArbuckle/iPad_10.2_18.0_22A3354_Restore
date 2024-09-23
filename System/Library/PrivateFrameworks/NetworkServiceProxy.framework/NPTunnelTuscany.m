@implementation NPTunnelTuscany

- (void)handleConnected
{
  unint64_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  NPTunnelTuscany *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v3 = -[NPTunnel timestamps](self, "timestamps");
  if (v3 && g_recordTimestamps && !v3[10])
    v3[10] = mach_absolute_time();
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Tuscany connection is now connected", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTunnel setConnectionStartDate:](self, "setConnectionStartDate:", v6);

  self->_shouldReportUsage = 1;
  -[NPTunnel parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)nw_parameters_copy_context();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __34__NPTunnelTuscany_handleConnected__block_invoke;
  v14 = &unk_1E4137410;
  v15 = self;
  self->_usageReportTimer = (void *)nw_queue_context_create_source();

  dispatch_time(0, 3000000000);
  nw_queue_set_timer_values();
  nw_queue_resume_source();
  v9 = -[NPTunnelTuscany clientRef](self, "clientRef");
  if (v9)
  {
    *(_DWORD *)buf = 0;
    (*(void (**)(void *, uint8_t *))(*(_QWORD *)v9 + 64))(v9, buf);
  }
  -[NPTunnelTuscany cancelConnectionTimer](self, "cancelConnectionTimer");
  v10.receiver = self;
  v10.super_class = (Class)NPTunnelTuscany;
  -[NPTunnel handleConnected](&v10, sel_handleConnected);
}

uint64_t __34__NPTunnelTuscany_handleConnected__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEBUG, "%@: Usage timer fired", (uint8_t *)&v6, 0xCu);

  }
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[32])
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
    v3 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v3, "handleFlowUsedTunnel");
}

- (void)handleDisconnected
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Tuscany connection is now disconnected", buf, 0xCu);

  }
  -[NPTunnelTuscany handleConnectionError](self, "handleConnectionError");
  self->_nextFlowID = 1;
  -[NPTunnel setTimeToFirstRequest:](self, "setTimeToFirstRequest:", 0.0);
  -[NPTunnel setTimeToFirstByte:](self, "setTimeToFirstByte:", 0.0);
  v5.receiver = self;
  v5.super_class = (Class)NPTunnelTuscany;
  -[NPTunnel handleDisconnected](&v5, sel_handleDisconnected);
  -[NPTunnelTuscany cancelConnection](self, "cancelConnection");
}

- (void)handleConnectionError
{
  int v3;
  int v4;
  NSObject *v5;
  double v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NPTunnel error](self, "error");
  if (v3)
  {
    v4 = v3;
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 1024;
      v15 = v4;
      v16 = 2080;
      v17 = strerror(v4);
      _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: Tunnel connection disconnected with error: %d (%s)", (uint8_t *)&v12, 0x1Cu);

    }
    -[NPTunnel timeToFirstByte](self, "timeToFirstByte");
    if (v6 == 0.0)
    {
      -[NPTunnel flows](self, "flows");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = v4 - 50;
        v10 = 1;
        switch(v9)
        {
          case 0:
          case 1:
            break;
          case 3:
            v10 = 22;
            break;
          case 4:
            v10 = 5;
            break;
          case 10:
            v10 = 4;
            break;
          case 11:
            v10 = 23;
            break;
          case 14:
          case 15:
            v10 = 2;
            break;
          default:
            v10 = 27;
            break;
        }
        -[NPTunnel setFallbackReason:](self, "setFallbackReason:", v10);
        -[NPTuscanyOnRamp setError:](self->_onRamp, "setError:", v10);
        -[NPTunnelTuscany sendUsageReportWithRTT:geohash:fallbackReason:](self, "sendUsageReportWithRTT:geohash:fallbackReason:", 0xFFFFFFFFLL, 0, v10);
      }
    }
  }
}

- (void)handleInputAvailable
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _QWORD *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[NPTunnelTuscany clientRef](self, "clientRef");
  v4 = v3;
  if (v3)
  {
    v5 = v3[34];
    if (v5)
    {
      v6 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 32))(v5) + 16);
      v7 = (_QWORD *)(v4[34] + 32);
    }
    else
    {
      v7 = v4 + 38;
      v6 = 20;
    }
    v4 = (_QWORD *)(v6 - *v7);
  }
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[NPTunnel identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = v4;
    v14 = 2048;
    v15 = 0xFFFFFFFFLL;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "%@: Reading between %lu and %lu bytes from the tunnel connection", (uint8_t *)&v10, 0x20u);

  }
  -[NPTunnel readMinimumLength:maximumLength:](self, "readMinimumLength:maximumLength:", v4, 0xFFFFFFFFLL);
}

- (void)handleReadData:(nw_frame_array_s *)a3
{
  NPFrameStream *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NPTunnelTuscany cancelConnectionTimer](self, "cancelConnectionTimer");
  v5 = -[NPTunnelTuscany clientRef](self, "clientRef");
  if (!v5 || (NPFrameStream::handleReadData(v5, a3) & 1) == 0)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to handle data read from the tunnel connection", (uint8_t *)&v8, 0xCu);

    }
    -[NPTunnelTuscany sendUsageReportWithRTT:geohash:fallbackReason:](self, "sendUsageReportWithRTT:geohash:fallbackReason:", 0xFFFFFFFFLL, 0, -[NPTunnel fallbackReason](self, "fallbackReason"));
    -[NPTunnelTuscany cancelConnection](self, "cancelConnection");
  }
}

- (void)handleEOF
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Received EOF on the tunnel connection", (uint8_t *)&v5, 0xCu);

  }
}

- (void)handleDataWrittenWithError:(int)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NPTunnel isConnectionAlive](self, "isConnectionAlive"))
  {
    if (a3)
    {
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        -[NPTunnel identifier](self, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412802;
        v8 = v6;
        v9 = 1024;
        v10 = a3;
        v11 = 2080;
        v12 = strerror(a3);
        _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: Got an error while writing to the tunnel connection: %d (%s)", (uint8_t *)&v7, 0x1Cu);

      }
    }
    else
    {
      kdebug_trace();
      if (-[NPTunnelTuscany canHandleMoreData](self, "canHandleMoreData"))
        -[NPTunnel handleCanHandleMoreData](self, "handleCanHandleMoreData");
    }
  }
}

- (void)writeInitialData
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  tuscanyClientGetInitialData((NPFrameStream *)-[NPTunnelTuscany clientRef](self, "clientRef"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPTunnel write:](self, "write:", v3);
  }
  else
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "%@: writeInitialData called but no initial data is available", (uint8_t *)&v6, 0xCu);

    }
    -[NPTunnel readMinimumLength:maximumLength:](self, "readMinimumLength:maximumLength:", 1, 0xFFFFFFFFLL);
  }

}

- (void)acknowledgeData:(unint64_t)a3 sentToFlow:(id)a4
{
  int v4;
  int *v6;
  int v7;
  int v8;
  int v9;
  FrameStream *v11;
  int v12;
  id v13;

  v4 = a3;
  v13 = a4;
  if (-[NPTunnel isConnectionAlive](self, "isConnectionAlive"))
  {
    v6 = (int *)objc_msgSend(v13, "window");
    if (v6)
    {
      v7 = v6[1];
      v8 = *v6 + v4;
      if (v8 < v7)
        v9 = v8;
      else
        v9 = 0;
      *v6 = v9;
      if (v8 >= v7 && v8 >= 1)
      {
        v11 = -[NPTunnelTuscany clientRef](self, "clientRef");
        v12 = objc_msgSend(v13, "identifier");
        if (v11)
          FrameStream::acknowledge(v11, v12, v8, 1);
      }
    }
  }

}

- (void)createTuscanyClient
{
  id v3;

  -[NPTuscanyOnRamp dayPass](self->_onRamp, "dayPass");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NPTunnelTuscany setClientRef:](self, "setClientRef:", tuscanyClientCreate(self, v3));

}

- (NPTunnelTuscany)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  NPTunnelTuscany *v17;
  NPTunnelTuscany *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)NPTunnelTuscany;
  v17 = -[NPTunnel initWithEndpoint:parameters:appRule:flowProperties:delegate:](&v20, sel_initWithEndpoint_parameters_appRule_flowProperties_delegate_, a3, a4, a5, a6, v16);
  v18 = v17;
  if (v17)
  {
    v17->_nextFlowID = 1;
    objc_storeStrong((id *)&v17->_onRamp, a7);
    v18->_isFirstTunnel = objc_msgSend(v16, "isFirstTunnel");
    -[NPTunnelTuscany createTuscanyClient](v18, "createTuscanyClient");
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NPTunnelTuscany clientRef](self, "clientRef"))
  {
    tuscanyClientDestroy((_QWORD *)-[NPTunnelTuscany clientRef](self, "clientRef"));
    -[NPTunnelTuscany setClientRef:](self, "setClientRef:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)NPTunnelTuscany;
  -[NPTunnel dealloc](&v3, sel_dealloc);
}

- (BOOL)start
{
  void *v4;
  int tfo;
  void *v6;
  int multipath;
  void *v8;
  int tfo_no_cookie;
  void *v10;
  int no_delay;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t description;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[NPTunnel connectionState](self, "connectionState"))
    return 1;
  -[NPTunnel parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tfo = nw_parameters_get_tfo();

  -[NPTunnel parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  multipath = nw_parameters_get_multipath();

  -[NPTunnel parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tfo_no_cookie = nw_parameters_get_tfo_no_cookie();

  -[NPTunnel parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  no_delay = nw_parameters_get_no_delay();

  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnel endpoint](self, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v21 = v13;
    v22 = 2080;
    description = nw_endpoint_get_description();
    v24 = 1024;
    v25 = tfo;
    v26 = 1024;
    v27 = multipath;
    v28 = 1024;
    v29 = tfo_no_cookie;
    v30 = 1024;
    v31 = no_delay;
    _os_log_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Opening Tuscany connection to %s, TFO enabled = %d MPTCP enabled = %d, No TFO cookie = %d, No Delay = %d", buf, 0x2Eu);

  }
  kdebug_trace();
  -[NPTunnel appRule](self, "appRule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enableUDPRace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    tuscanyClientGetInitialData((NPFrameStream *)-[NPTunnelTuscany clientRef](self, "clientRef"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[NPTunnelTuscany sendDataOnUDPSession:](self, "sendDataOnUDPSession:", v18);

  }
  v19.receiver = self;
  v19.super_class = (Class)NPTunnelTuscany;
  return -[NPTunnel start](&v19, sel_start);
}

- (void)startConnectionTimer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[NPTunnel appRule](self, "appRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 > 0.0 && !self->_connectionTimer)
  {
    -[NPTunnel parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)nw_parameters_copy_context();
    self->_connectionTimer = (void *)nw_queue_context_create_source();

    dispatch_time(0, (uint64_t)(v6 * 1000000.0));
    nw_queue_set_timer_values();
    nw_queue_resume_source();
  }
}

_QWORD *__39__NPTunnelTuscany_startConnectionTimer__block_invoke(uint64_t a1)
{
  _QWORD *result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (result[29])
  {
    objc_msgSend(result, "cancelConnectionTimer");
    nplog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Connection timer fired", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", 60);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "cancelConnection");
  }
  return result;
}

- (void)cancelConnectionTimer
{
  if (self->_connectionTimer)
  {
    nw_queue_cancel_source();
    self->_connectionTimer = 0;
  }
}

- (void)cancelConnection
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Cancelling the Tuscany connection", buf, 0xCu);

  }
  -[NPTunnel setIsCancelled:](self, "setIsCancelled:", 1);
  if (self->_shouldReportUsage && -[NPTunnel connectionState](self, "connectionState") == 4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__NPTunnelTuscany_cancelConnection__block_invoke;
    v6[3] = &unk_1E4138190;
    v6[4] = self;
    -[NPTunnelTuscany pingWithCompletionHandler:](self, "pingWithCompletionHandler:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NPTunnelTuscany;
    -[NPTunnel cancelConnection](&v5, sel_cancelConnection);
  }
}

id __35__NPTunnelTuscany_cancelConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  objc_super v6;

  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "sendUsageReportWithRTT:geohash:fallbackReason:", a2, a3, 0);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NPTunnelTuscany;
  return objc_msgSendSuper2(&v6, sel_cancelConnection);
}

- (void)sendDataOnUDPSession:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  OS_nw_connection *UDPSession;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, int, void *);
  void *v20;
  NPTunnelTuscany *v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t description;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_UDPSession)
  {
    -[NPTunnel endpoint](self, "endpoint");
    v5 = objc_claimAutoreleasedReturnValue();
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

      if (v8)
      {
        nplog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[NPTunnel identifier](self, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v16;
          v26 = 2080;
          description = nw_endpoint_get_description();
          _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "%@: Racing UDP to %s", buf, 0x16u);

        }
      }
      v10 = nw_parameters_create();
      nw_parameters_set_data_mode();
      nw_parameters_set_indefinite();
      v11 = nw_connection_create(v5, v10);
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      nw_connection_set_queue(v11, v12);

      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke;
      v20 = &unk_1E41381B8;
      v21 = self;
      v22 = v4;
      v13 = v11;
      v23 = v13;
      MEMORY[0x1A1AEA3A4]();
      nw_connection_start(v13);
      UDPSession = self->_UDPSession;
      self->_UDPSession = (OS_nw_connection *)v13;
      v7 = v13;

    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "%@: No UDP endpoint available, not racing UDP", buf, 0xCu);

    }
  }

}

void __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _BYTE buf[12];
  __int16 v9;
  nw_error_domain_t error_domain;
  __int16 v11;
  int error_code;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      v9 = 1024;
      error_domain = nw_error_get_error_domain(v5);
      v11 = 1024;
      error_code = nw_error_get_error_code(v5);
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "%@: Got an error on the UDP session: %d:%d", buf, 0x18u);

    }
  }
  else if (a2 == 3)
  {
    *(_QWORD *)buf = *(id *)(a1 + 40);
    nw_connection_write_multiple();

  }
}

void __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke_13(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2080;
      v9 = strerror(a2);
      _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error while writing the UDP datagram: %s", (uint8_t *)&v6, 0x16u);

    }
  }
}

- (void)handleFallbackForFlow:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[NPTunnel delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fallbackReason");

  objc_msgSend(v6, "tunnel:flowDidFallbackWithReason:", self, v5);
}

- (void)destroyConnection
{
  NSObject *UDPSession;
  OS_nw_connection *v4;
  void (**pendingPingCompletionHandler)(id, uint64_t, _QWORD, uint64_t);
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPTunnelTuscany;
  -[NPTunnel destroyConnection](&v7, sel_destroyConnection);
  -[NPTunnelTuscany cancelConnectionTimer](self, "cancelConnectionTimer");
  UDPSession = self->_UDPSession;
  if (UDPSession)
  {
    nw_connection_cancel(UDPSession);
    v4 = self->_UDPSession;
    self->_UDPSession = 0;

  }
  if (self->_pingTimer)
  {
    nw_queue_cancel_source();
    self->_pingTimer = 0;
  }
  pendingPingCompletionHandler = (void (**)(id, uint64_t, _QWORD, uint64_t))self->_pendingPingCompletionHandler;
  if (pendingPingCompletionHandler)
  {
    pendingPingCompletionHandler[2](pendingPingCompletionHandler, 0xFFFFFFFFLL, 0, 1);
    v6 = self->_pendingPingCompletionHandler;
    self->_pendingPingCompletionHandler = 0;

  }
  if (self->_usageReportTimer)
  {
    nw_queue_cancel_source();
    self->_usageReportTimer = 0;
  }
}

- (int64_t)currentMTU
{
  void *v3;
  void *v4;
  int mtu;

  -[NPTunnel path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[NPTunnel path](self, "path"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        mtu = nw_path_get_mtu(),
        v4,
        mtu > 0))
  {
    return mtu - 100;
  }
  else
  {
    return 1400;
  }
}

- (unint64_t)maxFrameSize
{
  return -[NPTuscanyOnRamp maxFrameSize](self->_onRamp, "maxFrameSize");
}

- (void)handleFlowUsedTunnel
{
  _QWORD v2[5];

  if (self->_shouldReportUsage)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __39__NPTunnelTuscany_handleFlowUsedTunnel__block_invoke;
    v2[3] = &unk_1E4138190;
    v2[4] = self;
    -[NPTunnelTuscany pingWithCompletionHandler:](self, "pingWithCompletionHandler:", v2);
  }
}

uint64_t __39__NPTunnelTuscany_handleFlowUsedTunnel__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
    return objc_msgSend(*(id *)(result + 32), "sendUsageReportWithRTT:geohash:fallbackReason:", a2, a3, 0);
  return result;
}

- (void)sendUsageReportWithRTT:(unint64_t)a3 geohash:(id)a4 fallbackReason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NPUsageReport *v15;
  void *v16;
  void *v17;
  NPUsageReport *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a5 || self->_shouldReportUsage)
  {
    self->_shouldReportUsage = 0;
    if (self->_usageReportTimer)
    {
      nw_queue_cancel_source();
      self->_usageReportTimer = 0;
    }
    if (a5 == 26)
    {
      -[NPTunnel appRule](self, "appRule");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requireTFO");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
        a5 = 26;
      else
        a5 = 0;
    }
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Reporting usage with fallback reason: %@", (uint8_t *)&v21, 0x16u);

    }
    v15 = [NPUsageReport alloc];
    -[NPTunnel appRule](self, "appRule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "matchSigningIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NPUsageReport initWithSigningIdentifier:fallbackReason:](v15, "initWithSigningIdentifier:fallbackReason:", v17, a5);

    -[NPUsageReport setRtt:](v18, "setRtt:", a3);
    -[NPUsageReport setGeohash:](v18, "setGeohash:", v8);
    -[NPTuscanyOnRamp dayPassUUID](self->_onRamp, "dayPassUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPUsageReport setDayPassUUID:](v18, "setDayPassUUID:", v19);

    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendUsageReport:", v18);

  }
}

- (void)closeFlow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "identifier"))
  {
    if (-[NPTunnelTuscany clientRef](self, "clientRef")
      && -[NPTunnel connectionState](self, "connectionState") == 4
      && objc_msgSend(v4, "state") == 3)
    {
      tuscanyClientSendClose((NPTuscanyClient *)-[NPTunnelTuscany clientRef](self, "clientRef"), v4);
    }
    v5.receiver = self;
    v5.super_class = (Class)NPTunnelTuscany;
    -[NPTunnel closeFlow:](&v5, sel_closeFlow_, v4);
  }

}

- (int64_t)sendData:(id)a3 forFlow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  void *v12;
  double v13;
  int64_t v14;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "state") == 1)
  {
    if (-[NPTunnelTuscany flowIsFirstFlow:](self, "flowIsFirstFlow:", v7))
    {
      objc_msgSend(v7, "appRule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "edgeSetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[NPTunnelTuscany setIgnoreWaldoTimestamp:](self, "setIgnoreWaldoTimestamp:", 1);
      nplog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[NPTunnel identifier](self, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v17 = 138412546;
        *(_QWORD *)&v17[4] = v16;
        v18 = 2048;
        v19 = objc_msgSend(v6, "length");
        _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "%@: sendData (size %lu): first request", v17, 0x16u);

      }
    }
  }
  else if (!-[NPTunnelTuscany canHandleMoreData](self, "canHandleMoreData"))
  {
    v14 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "length"))
  {
    -[NPTunnel timeToFirstRequest](self, "timeToFirstRequest");
    if (v11 == 0.0)
    {
      kdebug_trace();
      objc_msgSend(v7, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceNow");
      -[NPTunnel setTimeToFirstRequest:](self, "setTimeToFirstRequest:", fabs(v13 * 1000.0));

    }
  }
  if (tuscanyClientSendData((id *)-[NPTunnelTuscany clientRef](self, "clientRef", 0), v7, v6, (unint64_t *)v17))
  {
    if (*(_QWORD *)v17 >= 0x7FFFFFFFuLL)
      v14 = 0;
    else
      v14 = *(_QWORD *)v17;
  }
  else
  {
    -[NPTunnelTuscany sendUsageReportWithRTT:geohash:fallbackReason:](self, "sendUsageReportWithRTT:geohash:fallbackReason:", 0xFFFFFFFFLL, 0, -[NPTunnel fallbackReason](self, "fallbackReason"));
    v14 = -1;
  }
LABEL_18:

  return v14;
}

- (unint64_t)allocateFlowID
{
  unint64_t result;

  result = self->_nextFlowID;
  if (result > 0xFFFFFFFE)
    return 0;
  self->_nextFlowID = result + 2;
  return result;
}

- (BOOL)canHandleMoreData
{
  return -[NPTunnel connectionState](self, "connectionState") == 3
      || -[NPTunnel connectionState](self, "connectionState") == 4;
}

- (unint64_t)initialWindowSize
{
  return 0x10000;
}

- (id)createConnectionInfo
{
  NSPConnectionInfo *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t i;
  double v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  NSPConnectionInfo *v37;

  v3 = objc_alloc_init(NSPConnectionInfo);
  if (-[NPTunnel connectionState](self, "connectionState") == 3
    || -[NPTunnel connectionState](self, "connectionState") == 4)
  {
    -[NPTunnel path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnel outputInterface](self, "outputInterface");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NPTunnel endpoint](self, "endpoint");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NPTunnel parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v6;
    +[NPUtilities fillOutConnectionInfo:withPath:interface:remoteEndpoint:parameters:outputHandler:](NPUtilities, "fillOutConnectionInfo:withPath:interface:remoteEndpoint:parameters:outputHandler:", v3, v4, v5, v6, v7, (_QWORD)-[NPTunnel protocol](self, "protocol")[32]);

    -[NSPConnectionInfo setPathType:](v3, "setPathType:", 1);
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceLastUsage");
    -[NSPConnectionInfo setTimeIntervalSinceLastUsage:](v3, "setTimeIntervalSinceLastUsage:");

    -[NSPConnectionInfo setEdgeType:](v3, "setEdgeType:", -[NPTuscanyOnRamp currentEdgeType](self->_onRamp, "currentEdgeType"));
    -[NSPConnectionInfo setIsTFOProbeSucceeded:](v3, "setIsTFOProbeSucceeded:", -[NPTuscanyOnRamp isTFOEnabled](self->_onRamp, "isTFOEnabled"));
    v37 = v3;
    v36 = (void *)v5;
    if (-[NPTunnelTuscany clientRef](self, "clientRef")
      && (v9 = -[NPTunnelTuscany clientRef](self, "clientRef")) != 0)
    {
      v10 = 0;
      v11 = 0;
      v12 = v9 + 496;
      do
      {
        v13 = *(_QWORD *)&v12[v10 * 8];
        v14 = (&Frame::Exception::label(int)::names)[v10];
        if (v14)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v17);

        }
        ++v10;
      }
      while (v10 != 6);
    }
    else
    {
      v11 = 0;
    }
    v3 = v37;
    -[NSPConnectionInfo setExceptions:](v37, "setExceptions:", v11);
    -[NPTunnel timeToFirstByte](self, "timeToFirstByte");
    -[NSPConnectionInfo setTimeToFirstByte:](v37, "setTimeToFirstByte:");
    if (-[NPTunnel timestamps](self, "timestamps"))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = -[NPTunnel timestamps](self, "timestamps");
      for (i = 0; i != 15; ++i)
      {
        v23 = 0.0;
        if (i)
        {
          v24 = i;
          while (v24 > 0)
          {
            v25 = v19[--v24];
            if (v25)
              goto LABEL_24;
          }
          v25 = *(v19 - 1);
LABEL_24:
          v26 = v19[i];
          v27 = v26 >= v25;
          v28 = v26 - v25;
          if (v28 != 0 && v27 && g_recordTimestamps != 0)
          {
            LODWORD(v20) = g_timebaseInfo;
            LODWORD(v21) = unk_1EE52E120;
            v23 = (double)v28 * (double)v20 / (double)v21 / 1000000.0;
          }
        }
        +[NPUtilities timestampIdentifierToName:](NPUtilities, "timestampIdentifierToName:", i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc(MEMORY[0x1E0C99D80]);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v23);
        v33 = (void *)objc_msgSend(v31, "initWithObjectsAndKeys:", v32, v30, 0);

        objc_msgSend(v18, "addObject:", v33);
      }
      v3 = v37;
      -[NSPConnectionInfo setTimingIntervals:](v37, "setTimingIntervals:", v18);

    }
  }
  return v3;
}

- (void)handleHelloAck:(unsigned int)a3
{
  unint64_t *v5;

  v5 = -[NPTunnel timestamps](self, "timestamps");
  if (v5 && g_recordTimestamps && !v5[11])
    v5[11] = mach_absolute_time();
  self->_waldoTimestamp = a3;
  -[NPTunnel handleReady](self, "handleReady");
}

- (unint64_t)maxDataSendSizeForFlow:(id)a3
{
  unint64_t result;
  uint64_t v5;

  if (objc_msgSend(a3, "state") != 1 && !-[NPTunnelTuscany canHandleMoreData](self, "canHandleMoreData"))
    return 0;
  result = -[NPTunnelTuscany clientRef](self, "clientRef");
  if (result)
  {
    v5 = *(_QWORD *)(result + 264);
    if (v5)
      return v5 - 24;
    else
      return 1256;
  }
  return result;
}

- (void)pingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id pendingPingCompletionHandler;
  void *v7;
  void *v8;
  Client *v9;

  v4 = a3;
  if (self->_pendingPingCompletionHandler || -[NPTunnel connectionState](self, "connectionState") != 4)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v4 + 2))(v4, 0xFFFFFFFFLL, 0, 0);
  }
  else
  {
    if (self->_pingTimer)
    {
      nw_queue_cancel_source();
      self->_pingTimer = 0;
    }
    v5 = (void *)MEMORY[0x1A1AEA9EC](v4);
    pendingPingCompletionHandler = self->_pendingPingCompletionHandler;
    self->_pendingPingCompletionHandler = v5;

    -[NPTunnel parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)nw_parameters_copy_context();
    self->_pingTimer = (void *)nw_queue_context_create_source();

    dispatch_time(0, 2000000000);
    nw_queue_set_timer_values();
    nw_queue_resume_source();
    v9 = -[NPTunnelTuscany clientRef](self, "clientRef");
    if (v9)
      Client::ping(v9, 0, 0);
  }

}

uint64_t __45__NPTunnelTuscany_pingWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[31])
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "handlePingResponseRTT:geohash:", 0xFFFFFFFFLL, 0);
}

- (void)handlePingResponseRTT:(unint64_t)a3 geohash:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id pendingPingCompletionHandler;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received ping RTT of %lu", (uint8_t *)&v11, 0x16u);

  }
  if (self->_pingTimer)
  {
    nw_queue_cancel_source();
    self->_pingTimer = 0;
  }
  if (self->_pendingPingCompletionHandler)
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AEA9EC]();
    pendingPingCompletionHandler = self->_pendingPingCompletionHandler;
    self->_pendingPingCompletionHandler = 0;

    ((void (**)(_QWORD, unint64_t, id, uint64_t))v9)[2](v9, a3, v6, 1);
  }

}

- (BOOL)flowIsFirstFlow:(id)a3
{
  return objc_msgSend(a3, "identifier") == 1;
}

- (unsigned)dayPassSessionCounter
{
  unsigned int v3;

  v3 = -[NPTuscanyOnRamp getNextSessionCounter](self->_onRamp, "getNextSessionCounter");
  if (!v3)
    -[NPTunnel setFallbackReason:](self, "setFallbackReason:", -[NPTuscanyOnRamp error](self->_onRamp, "error"));
  return v3;
}

- (NSDate)dayPassCreationDate
{
  return -[NPTuscanyOnRamp dayPassCreationDate](self->_onRamp, "dayPassCreationDate");
}

- (BOOL)isTFOProbeSucceeded
{
  return -[NPTuscanyOnRamp isTFOEnabled](self->_onRamp, "isTFOEnabled");
}

- (void)clientRef
{
  return self->_clientRef;
}

- (void)setClientRef:(void *)a3
{
  self->_clientRef = a3;
}

- (BOOL)ignoreWaldoTimestamp
{
  return self->_ignoreWaldoTimestamp;
}

- (void)setIgnoreWaldoTimestamp:(BOOL)a3
{
  self->_ignoreWaldoTimestamp = a3;
}

- (id)pendingPingCompletionHandler
{
  return self->_pendingPingCompletionHandler;
}

- (void)setPendingPingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)isFirstTunnel
{
  return self->_isFirstTunnel;
}

- (void)setIsFirstTunnel:(BOOL)a3
{
  self->_isFirstTunnel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingPingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_onRamp, 0);
  objc_storeStrong((id *)&self->_UDPSession, 0);
}

@end
