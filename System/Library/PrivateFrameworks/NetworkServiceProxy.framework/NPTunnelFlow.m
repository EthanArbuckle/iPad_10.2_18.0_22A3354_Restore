@implementation NPTunnelFlow

- (NPTunnelFlow)initWithTunnel:(id)a3 appRule:(id)a4 hashKey:(unint64_t)a5 extraFlowProperties:(id)a6
{
  id v11;
  id v12;
  id v13;
  NPTunnelFlow *v14;
  NPTunnelFlow *v15;
  void *v16;
  void *v17;
  int v18;
  _DWORD *v19;
  int v20;
  int v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  NSDate *startDate;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)NPTunnelFlow;
  v14 = -[NPTunnelFlow init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_identifier = 0;
    objc_storeStrong((id *)&v14->_tunnel, a3);
    v15->_hasTunnel = 1;
    objc_storeStrong((id *)&v15->_appRule, a4);
    objc_msgSend(v12, "initialWindowSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "initialWindowSize");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
      v19 = (_DWORD *)operator new();
      if (v18 >= 0)
        v20 = v18;
      else
        v20 = v18 + 1;
      *v19 = 0;
      v19[1] = v20 >> 1;
      v19[2] = v18;
      v19[3] = v18;
      v15->_window = v19;

    }
    else
    {
      v21 = -[NPTunnel initialWindowSize](v15->_tunnel, "initialWindowSize");
      v22 = (_DWORD *)operator new();
      if (v21 >= 0)
        v23 = v21;
      else
        v23 = v21 + 1;
      *v22 = 0;
      v22[1] = v23 >> 1;
      v22[2] = v21;
      v22[3] = v21;
      v15->_window = v22;
    }
    v15->_state = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = objc_claimAutoreleasedReturnValue();
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v24;

    v15->_hashKey = a5;
    objc_msgSend(v12, "disableFallback");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_fallbackDisabled = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v12, "shouldComposeInitialData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_shouldComposeIntialData = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v12, "enableDirectRace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_enableDirectRace = objc_msgSend(v28, "BOOLValue");

    if (v15->_enableDirectRace)
      v15->_fallbackDisabled = 1;
    objc_storeStrong((id *)&v15->_extraFlowProperties, a6);
  }

  return v15;
}

- (void)dealloc
{
  void *window;
  objc_super v4;

  window = self->_window;
  if (window)
    MEMORY[0x1A1AE9F9C](window, 0x1000C40451B5BE8);
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelFlow;
  -[NPTunnelFlow dealloc](&v4, sel_dealloc);
}

- (void)cleanupLosingConnection:(BOOL)a3
{
  if (a3)
  {
    -[NPTunnelFlow closeFromDirectConnectionWithError:](self, "closeFromDirectConnectionWithError:", 0);
  }
  else if (self->_hasTunnel)
  {
    -[NPTunnel closeFlow:](self->_tunnel, "closeFlow:", self);
    -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
  }
}

- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  const char *v20;
  unint64_t hashKey;
  unint64_t identifier;
  uint64_t v24;
  const char *v25;
  _BYTE v26[22];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    hashKey = self->_hashKey;
    identifier = self->_identifier;
    v24 = objc_msgSend(v6, "length");
    v25 = "direct connection";
    *(_DWORD *)v26 = 134218754;
    *(_QWORD *)&v26[4] = hashKey;
    *(_WORD *)&v26[12] = 2048;
    if (v4)
      v25 = "tunnel";
    *(_QWORD *)&v26[14] = identifier;
    v27 = 2048;
    v28 = v24;
    v29 = 2080;
    v30 = v25;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Received %lu bytes from %s", v26, 0x2Au);
  }

  if (self->_state == 2)
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_hashKey;
      v10 = self->_identifier;
      v11 = "direct connection";
      if (v4)
        v11 = "tunnel";
      *(_DWORD *)v26 = 134218498;
      *(_QWORD *)&v26[4] = v9;
      *(_WORD *)&v26[12] = 2048;
      *(_QWORD *)&v26[14] = v10;
      v27 = 2080;
      v28 = (uint64_t)v11;
      _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) Received first data from %s", v26, 0x20u);
    }

    if (v4)
    {
      self->_state = 3;
      v12 = -[NPTunnelFlow copyConnectionInfo](self, "copyConnectionInfo");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NPFlowProperties flowIdentifier](self->_extraFlowProperties, "flowIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSPManager sharedManager](NSPManager, "sharedManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setConnectionInfo:forIdentifier:", v12, v13);

      }
    }
    else
    {
      self->_state = 4;
    }
    -[NPTunnelFlow cleanupLosingConnection:](self, "cleanupLosingConnection:", v4, *(_OWORD *)v26);
  }
  if (v4)
  {
    if (self->_hasTunnel)
    {
LABEL_15:
      v15 = 1;
      goto LABEL_22;
    }
  }
  else if (self->_isDirectConnectionViable)
  {
    goto LABEL_15;
  }
  nplog_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_hashKey;
    v17 = self->_identifier;
    v19 = objc_msgSend(v6, "length");
    v20 = "direct connection";
    *(_DWORD *)v26 = 134218754;
    *(_QWORD *)&v26[4] = v18;
    *(_WORD *)&v26[12] = 2048;
    if (v4)
      v20 = "tunnel";
    *(_QWORD *)&v26[14] = v17;
    v27 = 2048;
    v28 = v19;
    v29 = 2080;
    v30 = v20;
    _os_log_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) dropping %lu bytes of data from %s", v26, 0x2Au);
  }

  v15 = 0;
LABEL_22:

  return v15;
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  id v5;

  v5 = a3;
  if (-[NPTunnelFlow shouldSendDataToClient:fromTunnel:](self, "shouldSendDataToClient:fromTunnel:"))
    -[NPTunnel acknowledgeData:sentToFlow:](self->_tunnel, "acknowledgeData:sentToFlow:", objc_msgSend(v5, "length"), self);

}

- (void)handleAppData:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_data *concat;
  size_t v7;
  uint64_t v8;
  OS_dispatch_data *savedData;
  NPFlowProperties *extraFlowProperties;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_hasTunnel)
  {
    if (v4)
    {
      if (self->_savedData)
      {
        if (-[NSObject length](v4, "length"))
        {
          concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_savedData, v5);
LABEL_12:
          savedData = self->_savedData;
          self->_savedData = concat;

        }
      }
      else
      {
        v7 = -[NPTunnel sendData:forFlow:](self->_tunnel, "sendData:forFlow:", v4, self);
        if (self->_state == 1)
        {
          self->_state = 2;
          if (!self->_fallbackDisabled)
          {
            if (-[NSObject length](v5, "length"))
            {
              extraFlowProperties = self->_extraFlowProperties;
              if (extraFlowProperties
                && (-[NPFlowProperties fallbackTimeout](extraFlowProperties, "fallbackTimeout"), v11 > 0.0))
              {
                -[NPFlowProperties fallbackTimeout](self->_extraFlowProperties, "fallbackTimeout");
                v13 = v12;
              }
              else
              {
                -[NSPAppRule fallbackTimeout](self->_appRule, "fallbackTimeout");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "doubleValue");
                v13 = v15;

              }
              if (v13 > 0.0)
              {
                nplog_obj();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  v20 = (unint64_t)v13;
                  _os_log_debug_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEBUG, "Fallback timeout %ld", buf, 0xCu);
                }

                -[NPTunnel parameters](self->_tunnel, "parameters");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)nw_parameters_copy_context();
                self->_fallbackTimer = (void *)nw_queue_context_create_source();

                dispatch_time(0, (uint64_t)(v13 * 1000000.0));
                nw_queue_set_timer_values();
                nw_queue_resume_source();
              }
            }
          }
        }
        if ((v7 & 0x8000000000000000) != 0)
        {
          -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
          -[NPTunnel cancelConnection](self->_tunnel, "cancelConnection");
          goto LABEL_14;
        }
        v8 = -[NSObject length](v5, "length");
        if (v8 != v7)
        {
          concat = (OS_dispatch_data *)dispatch_data_create_subrange(v5, v7, v8 - v7);
          goto LABEL_12;
        }
      }
    }
    else
    {
      -[NPTunnel closeFlow:](self->_tunnel, "closeFlow:", self);
    }
  }
LABEL_14:

}

uint64_t __30__NPTunnelFlow_handleAppData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  }
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v3 + 32);
    v4 = *(_QWORD *)(v3 + 40);
    v7 = 134218240;
    v8 = v5;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) fallback timer fired", (uint8_t *)&v7, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "closeFlow:");
  return objc_msgSend(*(id *)(a1 + 32), "closeFromTunnel");
}

- (void)increaseWindowSize:(unint64_t)a3
{
  _DWORD *window;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t hashKey;
  unint64_t identifier;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  window = self->_window;
  if (window && (window[3] += a3, (v6 = (int *)self->_window) != 0))
    v7 = v6[3];
  else
    v7 = 0;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    hashKey = self->_hashKey;
    identifier = self->_identifier;
    v11 = 134218752;
    v12 = hashKey;
    v13 = 2048;
    v14 = identifier;
    v15 = 2048;
    v16 = a3;
    v17 = 2048;
    v18 = v7;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Received ack for %lu bytes, window size is now %lu", (uint8_t *)&v11, 0x2Au);
  }

  -[NPTunnelFlow handleTunnelCanHandleMoreData](self, "handleTunnelCanHandleMoreData");
}

- (BOOL)isClientFlowClosed
{
  return 0;
}

- (void)closeFromTunnel
{
  NSObject *v3;
  unint64_t hashKey;
  unint64_t identifier;
  void *v6;
  NSDate *startDate;
  double v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  OS_dispatch_data *savedData;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  unint64_t v19;
  int tunnelError;
  char *v21;
  int64_t fallbackReason;
  unint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  if (self->_fallbackTimer)
  {
    nw_queue_cancel_source();
    self->_fallbackTimer = 0;
  }
  if (self->_hasTunnel)
  {
    if (self->_state != 3
      || (-[NPTunnel handleFlowUsedTunnel](self->_tunnel, "handleFlowUsedTunnel"), self->_hasTunnel))
    {
      if (self->_fallbackReason)
      {
        nplog_obj();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          hashKey = self->_hashKey;
          identifier = self->_identifier;
          +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", self->_fallbackReason);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 134218498;
          v26 = hashKey;
          v27 = 2048;
          v28 = identifier;
          v29 = 2112;
          v30[0] = v6;
          _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed with fallback reason: %@", (uint8_t *)&v25, 0x20u);

        }
        if (self->_fallbackDelay == 0.0)
        {
          startDate = self->_startDate;
          if (startDate)
          {
            -[NSDate timeIntervalSinceNow](startDate, "timeIntervalSinceNow");
            if (v8 < 0.0)
              self->_fallbackDelay = fabs(v8) * 1000.0;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NPFlowProperties flowIdentifier](self->_extraFlowProperties, "flowIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      nplog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v23 = self->_hashKey;
        v24 = self->_identifier;
        v25 = 134218240;
        v26 = v23;
        v27 = 2048;
        v28 = v24;
        _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) setting final connection info", (uint8_t *)&v25, 0x16u);
      }

      v11 = -[NPTunnelFlow copyConnectionInfo](self, "copyConnectionInfo");
      if (v11)
      {
        +[NSPManager sharedManager](NSPManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setConnectionInfo:forIdentifier:", v11, v9);

      }
      if (self->_state != 3 && !self->_fallbackDisabled)
        -[NPTunnel handleFallbackForFlow:](self->_tunnel, "handleFallbackForFlow:", self);

    }
  }
  self->_hasTunnel = 0;
  savedData = self->_savedData;
  self->_savedData = 0;

  if (!-[NPTunnelFlow isClientFlowClosed](self, "isClientFlowClosed") && !self->_isDirectConnectionViable)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_hashKey;
      v16 = self->_identifier;
      v25 = 134218240;
      v26 = v15;
      v27 = 2048;
      v28 = v16;
      _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from tunnel and has no direct connection, closing the flow", (uint8_t *)&v25, 0x16u);
    }

    if (self->_tunnelError)
    {
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_hashKey;
        v19 = self->_identifier;
        tunnelError = self->_tunnelError;
        v21 = strerror(tunnelError);
        v25 = 134218754;
        v26 = v18;
        v27 = 2048;
        v28 = v19;
        v29 = 1024;
        LODWORD(v30[0]) = tunnelError;
        WORD2(v30[0]) = 2080;
        *(_QWORD *)((char *)v30 + 6) = v21;
        _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from tunnel with error %d (%s)", (uint8_t *)&v25, 0x26u);
      }

      fallbackReason = self->_tunnelError;
    }
    else
    {
      fallbackReason = self->_fallbackReason;
      if (fallbackReason)
        fallbackReason = +[NSPConnectionInfo fallbackReasonToErrno:](NSPConnectionInfo, "fallbackReasonToErrno:");
    }
    -[NPTunnelFlow closeWithError:](self, "closeWithError:", fallbackReason);
  }
}

- (void)closeFromDirectConnectionWithError:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  unint64_t hashKey;
  unint64_t identifier;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  *(_WORD *)&self->_isDirectConnectionViable = 256;
  if (self->_fallbackTimer)
  {
    nw_queue_cancel_source();
    self->_fallbackTimer = 0;
  }
  -[NPTunnelFlow stopDirectConnection](self, "stopDirectConnection");
  if (!self->_hasTunnel && !-[NPTunnelFlow isClientFlowClosed](self, "isClientFlowClosed"))
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      hashKey = self->_hashKey;
      identifier = self->_identifier;
      v8 = 134218240;
      v9 = hashKey;
      v10 = 2048;
      v11 = identifier;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from direct connection and has no tunnel, closing the flow", (uint8_t *)&v8, 0x16u);
    }

    -[NPTunnelFlow closeWithError:](self, "closeWithError:", v3);
  }
}

- (void)handleTunnelConnected
{
  void *v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[16];

  -[NPTunnelFlow handleTunnelCanHandleMoreData](self, "handleTunnelCanHandleMoreData");
  if (-[NPTunnel flowIsFirstFlow:](self->_tunnel, "flowIsFirstFlow:", self))
  {
    -[NSPAppRule telemetryRatio](self->_appRule, "telemetryRatio");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_telemetryTimer)
    {
      nw_queue_cancel_source();
      self->_telemetryTimer = 0;
    }
    objc_msgSend(v3, "doubleValue");
    if (v4 == 0.0)
    {
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_INFO, "Telemetry ratio is 0.0, not sending telemetry", buf, 2u);
      }

    }
    else if (+[NPUtilities rollDiceWithSuccessRatio:](NPUtilities, "rollDiceWithSuccessRatio:", v3))
    {
      -[NPTunnel parameters](self->_tunnel, "parameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)nw_parameters_copy_context();
      self->_telemetryTimer = (void *)nw_queue_context_create_source();

      dispatch_time(0, 30000000000);
      nw_queue_set_timer_values();
      nw_queue_resume_source();
    }

  }
}

uint64_t __37__NPTunnelFlow_handleTunnelConnected__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 128))
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v2 + 48), "isConnectionAlive");
  if ((_DWORD)result)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__NPTunnelFlow_handleTunnelConnected__block_invoke_2;
    v5[3] = &unk_1E4137458;
    v5[4] = v4;
    return objc_msgSend(v4, "createTelemetryDataWithCompletionHandler:", v5);
  }
  return result;
}

uint64_t __37__NPTunnelFlow_handleTunnelConnected__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && a3)
  {
    if (a4)
      return objc_msgSend(*(id *)(result + 32), "reportTelemetry:withService:url:", a2, a3);
  }
  return result;
}

- (void)handleTunnelDisconnected
{
  if (-[NPTunnel fallbackReason](self->_tunnel, "fallbackReason"))
    self->_fallbackReason = -[NPTunnel fallbackReason](self->_tunnel, "fallbackReason");
  self->_tunnelError = -[NPTunnel error](self->_tunnel, "error");
  -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
}

- (void)handleTunnelCanHandleMoreData
{
  OS_dispatch_data *savedData;
  OS_dispatch_data *v4;
  OS_dispatch_data *v5;

  savedData = self->_savedData;
  if (savedData)
  {
    v5 = savedData;
    v4 = self->_savedData;
    self->_savedData = 0;

    if (-[OS_dispatch_data length](v5, "length"))
      -[NPTunnelFlow handleAppData:](self, "handleAppData:", v5);

  }
  else
  {
    -[NPTunnelFlow readDataFromClient](self, "readDataFromClient");
  }
}

- (void)processConnectionInfo:(id)a3
{
  void *v4;
  NSDate *startDate;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  -[NPTunnel connectionStartDate](self->_tunnel, "connectionStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    startDate = self->_startDate;
    -[NPTunnel connectionStartDate](self->_tunnel, "connectionStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](startDate, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 < 0.0)
      objc_msgSend(v10, "setConnectionDelay:", v8 * -1000.0);
  }
  objc_msgSend(v10, "setFirstTxByteTimeStamp:", self->_firstTxByteTimestamp);
  if (self->_firstTxByteTimestamp)
  {
    -[NSDate timeIntervalSinceDate:](self->_startDate, "timeIntervalSinceDate:");
    if (v9 < 0.0)
      objc_msgSend(v10, "setFirstTxByteDelay:", v9 * -1000.0);
  }

}

- (id)createFallbackConnectionInfoWithFallbackReason:(int64_t)a3
{
  NSPConnectionInfo *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(NSPConnectionInfo);
  -[NSPConnectionInfo setFallbackReason:](v5, "setFallbackReason:", a3);
  -[NSPConnectionInfo setPathType:](v5, "setPathType:", 2);
  -[NPTunnel path](self->_tunnel, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)nw_path_copy_interface();
    if (v7)
      -[NSPConnectionInfo setInterfaceType:](v5, "setInterfaceType:", +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v7));

  }
  return v5;
}

- (id)copyConnectionInfo
{
  void *v3;
  NSObject *v4;
  unint64_t hashKey;
  unint64_t identifier;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_state == 3 && self->_hasTunnel)
  {
    -[NPTunnel createConnectionInfo](self->_tunnel, "createConnectionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnelFlow processConnectionInfo:](self, "processConnectionInfo:", v3);
  }
  else
  {
    -[NPTunnelFlow createFallbackConnectionInfoWithFallbackReason:](self, "createFallbackConnectionInfoWithFallbackReason:", self->_fallbackReason);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "fallbackReason") && !-[NPTunnelFlow disconnectedByApp](self, "disconnectedByApp"))
    {
      nplog_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        hashKey = self->_hashKey;
        identifier = self->_identifier;
        v8 = 134218240;
        v9 = hashKey;
        v10 = 2048;
        v11 = identifier;
        _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) is falling back with no fallback reason", (uint8_t *)&v8, 0x16u);
      }

      +[NPDiagnosticReport logInternalError:context:](NPDiagnosticReport, "logInternalError:context:", CFSTR("NoFallbackReason"), 0);
    }
    objc_msgSend(v3, "setTunnelConnectionError:", self->_tunnelError);
    objc_msgSend(v3, "setFallbackDelay:", self->_fallbackDelay);
    objc_msgSend(v3, "setIsTFOProbeSucceeded:", -[NPTunnel isTFOProbeSucceeded](self->_tunnel, "isTFOProbeSucceeded"));
  }
  return v3;
}

- (id)appData
{
  return 0;
}

- (void)setFallbackReason:(int64_t)a3
{
  if (a3 && (a3 != 12 || self->_state != 3) && !self->_fallbackReason)
    self->_fallbackReason = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (BOOL)isBestEffort
{
  return 0;
}

- (id)combineStateInfo:(id)a3 andConnectionInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  NPTunnelFlow *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int bytes;
  _QWORD v61[3];
  _QWORD v62[3];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("connection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  objc_msgSend(v6, "edgeAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "edgeAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("peer_address"));

  }
  +[NPUtilities getInterfaceName:](NPUtilities, "getInterfaceName:", objc_msgSend(v6, "interfaceType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("interface"));

  -[NPTunnel timeToFirstByte](self->_tunnel, "timeToFirstByte");
  v15 = v14;
  -[NPTunnel timeToFirstRequest](self->_tunnel, "timeToFirstRequest");
  v17 = v16;
  bytes = 0;
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 4uLL, &bytes))
    v15 = ((double)(bytes % 30 + 100) / 100.0) * v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("ttfb"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("ttfr"));

  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "interfaceName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "TCPInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interfaceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "length") == 408)
    {
      v25 = objc_msgSend(objc_retainAutorelease(v24), "bytes");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v25 + 24));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("rtt"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v25 + 28));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("rttvar"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v25 + 284));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("resend"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v25 + 76));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("tx"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v25 + 108));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("rx"));

    }
  }
  v53 = self;
  v54 = v8;
  v55 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "TFOSucceeded"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, CFSTR("tfo"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("tcp"));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v6, "multipathSubflowSwitchCounts");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v57 != v36)
          objc_enumerationMutation(v32);
        v38 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v6, "multipathSubflowSwitchCounts");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v35 += objc_msgSend(v40, "unsignedIntegerValue");
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
  }

  v61[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isMultipath"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v41;
  v61[1] = CFSTR("subflows");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "multipathSubflowCount"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v42;
  v61[2] = CFSTR("switches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v44, CFSTR("mptcp"));

  objc_msgSend(v6, "exceptions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v6, "exceptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, CFSTR("exceptions"));

  }
  objc_msgSend(v55, "setObject:forKeyedSubscript:", v10, CFSTR("connection"));
  copyOSVersionString();
  v47 = objc_claimAutoreleasedReturnValue();
  copyProductTypeString();
  v48 = objc_claimAutoreleasedReturnValue();
  if (v47 | v48)
  {
    v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v50 = v49;
    if (v47)
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v47, CFSTR("build"));
    if (v48)
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v48, CFSTR("type"));
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v50, CFSTR("device"));

  }
  -[NSPAppRule label](v53->_appRule, "label");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKeyedSubscript:", v51, CFSTR("source"));

  return v55;
}

- (void)createTelemetryDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[NPTunnel createConnectionInfo](self->_tunnel, "createConnectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NEAppRule matchSigningIdentifier](self->_appRule, "matchSigningIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "edgeAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E4137960;
    v9[4] = self;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    v10 = v5;
    objc_msgSend(v7, "fetchStateForClient:withPeerEndpoint:completionHandler:", v6, v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

void __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)nw_parameters_copy_context();
  objc_copyWeak(&v17, (id *)(a1 + 56));
  v12 = v7;
  v16 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  v14 = v8;
  v15 = v9;
  nw_queue_context_async();

  objc_destroyWeak(&v17);
}

void __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(WeakRetained, "combineStateInfo:andConnectionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)reportTelemetry:(id)a3 withService:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  NPTunnelFlowTelemetry *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[NPTunnelFlowTelemetry initWithTunnel:service:postURL:]([NPTunnelFlowTelemetry alloc], "initWithTunnel:service:postURL:", self->_tunnel, v9, v8);

  if (v10)
  {
    -[NPTunnel addNewFlow:](self->_tunnel, "addNewFlow:", v10);
    -[NPTunnelFlowTelemetry reportTelemetry:](v10, "reportTelemetry:", v11);
  }

}

- (unint64_t)hashKey
{
  return self->_hashKey;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NPTunnel)tunnel
{
  return self->_tunnel;
}

- (int64_t)state
{
  return self->_state;
}

- (NSPAppRule)appRule
{
  return self->_appRule;
}

- (NPFlowProperties)extraFlowProperties
{
  return self->_extraFlowProperties;
}

- (NSDate)firstTxByteTimestamp
{
  return self->_firstTxByteTimestamp;
}

- (void)setFirstTxByteTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_firstTxByteTimestamp, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)window
{
  return self->_window;
}

- (unint64_t)initialBytesLeftOver
{
  return self->_initialBytesLeftOver;
}

- (void)setInitialBytesLeftOver:(unint64_t)a3
{
  self->_initialBytesLeftOver = a3;
}

- (BOOL)isDirectConnectionViable
{
  return self->_isDirectConnectionViable;
}

- (void)setIsDirectConnectionViable:(BOOL)a3
{
  self->_isDirectConnectionViable = a3;
}

- (BOOL)fallbackDisabled
{
  return self->_fallbackDisabled;
}

- (void)setFallbackDisabled:(BOOL)a3
{
  self->_fallbackDisabled = a3;
}

- (BOOL)enableDirectRace
{
  return self->_enableDirectRace;
}

- (BOOL)disconnectedByApp
{
  return self->_disconnectedByApp;
}

- (void)setDisconnectedByApp:(BOOL)a3
{
  self->_disconnectedByApp = a3;
}

- (BOOL)shouldComposeIntialData
{
  return self->_shouldComposeIntialData;
}

- (void)setShouldComposeIntialData:(BOOL)a3
{
  self->_shouldComposeIntialData = a3;
}

- (OS_dispatch_data)savedData
{
  return self->_savedData;
}

- (void)setSavedData:(id)a3
{
  objc_storeStrong((id *)&self->_savedData, a3);
}

- (void)fallbackTimer
{
  return self->_fallbackTimer;
}

- (void)setFallbackTimer:(void *)a3
{
  self->_fallbackTimer = a3;
}

- (void)telemetryTimer
{
  return self->_telemetryTimer;
}

- (void)setTelemetryTimer:(void *)a3
{
  self->_telemetryTimer = a3;
}

- (double)fallbackDelay
{
  return self->_fallbackDelay;
}

- (void)setFallbackDelay:(double)a3
{
  self->_fallbackDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedData, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_firstTxByteTimestamp, 0);
  objc_storeStrong((id *)&self->_extraFlowProperties, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_tunnel, 0);
}

@end
