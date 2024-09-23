@implementation NPTunnel

+ (void)initializeProtocol
{
  if (_MergedGlobals_35 != -1)
    dispatch_once(&_MergedGlobals_35, &__block_literal_global_10);
}

- (NPTunnel)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)NPTunnel;
  v18 = -[NPTunnel init](&v24, sel_init);
  if (v18)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v20 = (void *)*((_QWORD *)v18 + 13);
    *((_QWORD *)v18 + 13) = v19;

    objc_storeWeak((id *)v18 + 18, v17);
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = (void *)*((_QWORD *)v18 + 19);
    *((_QWORD *)v18 + 19) = v21;

    objc_storeStrong((id *)v18 + 15, a3);
    objc_storeStrong((id *)v18 + 14, a4);
    *(_OWORD *)(v18 + 56) = 0u;
    *(_OWORD *)(v18 + 40) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_OWORD *)(v18 + 8) = 0u;
    if (_MergedGlobals_35 != -1)
      dispatch_once(&_MergedGlobals_35, &__block_literal_global_10);
    *((_QWORD *)v18 + 3) = &xmmword_1ED062A80;
    *((_QWORD *)v18 + 4) = &xmmword_1ED062AA8;
    *((_QWORD *)v18 + 24) = 0;
    objc_storeStrong((id *)v18 + 20, a5);
    *((_QWORD *)v18 + 26) = objc_msgSend(v16, "timestamps");
    objc_msgSend(v16, "setTimestamps:", 0);
    v18[93] = objc_msgSend(v16, "disableIdleTimeout");
  }

  return (NPTunnel *)v18;
}

- (void)dealloc
{
  unint64_t *timestamps;
  objc_super v4;

  timestamps = self->_timestamps;
  if (timestamps)
  {
    free(timestamps);
    self->_timestamps = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPTunnel;
  -[NPTunnel dealloc](&v4, sel_dealloc);
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (BOOL)addNewFlow:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setIdentifier:", -[NPTunnel allocateFlowID](self, "allocateFlowID"));
  v5 = objc_msgSend(v4, "identifier");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_flows, "setObject:forKeyedSubscript:", v4, v6);
    if (self->_idleTimer)
    {
      nw_queue_cancel_source();
      self->_idleTimer = 0;
    }
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "hashKey");
      v9 = objc_msgSend(v4, "identifier");
      -[NPTunnel identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = v8;
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) added to tunnel %@", (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v4, "setFallbackReason:", 7);
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = (uint64_t)v11;
      _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Ran out of flow identifiers", (uint8_t *)&v13, 0xCu);

    }
  }

  return v5 != 0;
}

- (unint64_t)allocateFlowID
{
  return 1;
}

- (void)startIdleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_idleTimer)
  {
    nw_queue_cancel_source();
    self->_idleTimer = 0;
  }
  if (self->_disableIdleTimeout
    || (-[NSPAppRule connectionIdleTimeout](self->_appRule, "connectionIdleTimeout"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "unsignedLongLongValue"),
        v5,
        !v6))
  {
    nplog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: No more flows, cancelling the tunnel", buf, 0xCu);

    }
    -[NPTunnel cancelConnection](self, "cancelConnection");
  }
  else
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPAppRule connectionIdleTimeout](self->_appRule, "connectionIdleTimeout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "%@: No more flows, setting the idle timer to fire in %@ seconds", buf, 0x16u);

    }
    v10 = (void *)nw_parameters_copy_context();
    self->_idleTimer = (void *)nw_queue_context_create_source();

    -[NSPAppRule connectionIdleTimeout](self->_appRule, "connectionIdleTimeout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_time(0, 1000000000 * objc_msgSend(v11, "unsignedLongLongValue"));
    nw_queue_set_timer_values();

    nw_queue_resume_source();
  }
}

uint64_t __26__NPTunnel_startIdleTimer__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (result)
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    nplog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Idle timer fired, cancelling the tunnel", (uint8_t *)&v5, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "cancelConnection");
  }
  return result;
}

- (void)removeFlow:(unint64_t)a3
{
  NSMutableDictionary *flows;
  void *v6;
  NSObject *v7;
  void *v8;
  int64_t connectionState;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  flows = self->_flows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](flows, "removeObjectForKey:", v6);

  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTunnel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = a3;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu removed from tunnel %@", (uint8_t *)&v10, 0x16u);

  }
  if (!-[NSMutableDictionary count](self->_flows, "count"))
  {
    connectionState = self->_connectionState;
    if ((unint64_t)(connectionState - 2) < 2)
    {
      -[NPTunnel cancelConnection](self, "cancelConnection");
    }
    else if (connectionState == 5)
    {
      -[NPTunnel teardownOutputHandler](self, "teardownOutputHandler");
    }
    else if (connectionState == 4)
    {
      -[NPTunnel startIdleTimer](self, "startIdleTimer");
    }
  }
}

- (BOOL)hasFlow:(unint64_t)a3
{
  NSMutableDictionary *flows;
  void *v4;
  void *v5;

  flows = self->_flows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](flows, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(flows) = v5 != 0;

  return (char)flows;
}

- (id)handleFlowClosed:(unint64_t)a3 withFallbackReason:(int64_t)a4
{
  NSMutableDictionary *flows;
  void *v6;
  void *v7;

  flows = self->_flows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](flows, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a4)
      objc_msgSend(v7, "setFallbackReason:", a4);
    objc_msgSend(v7, "closeFromTunnel");
  }
  return v7;
}

- (int64_t)sendData:(id)a3 forFlow:(id)a4
{
  return objc_msgSend(a3, "length");
}

- (void)increaseWindowSizeForFlow:(unint64_t)a3 byBytes:(unint64_t)a4
{
  NSMutableDictionary *flows;
  void *v6;
  void *v7;
  id v8;

  flows = self->_flows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](flows, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "increaseWindowSize:", a4);
    v7 = v8;
  }

}

- (void)sendData:(id)a3 toClientFlow:(unint64_t)a4
{
  id v6;
  unint64_t *timestamps;
  BOOL v8;
  NSMutableDictionary *flows;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  double v18;
  void *v19;
  double timeToFirstByte;
  double timeToFirstRequest;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  timestamps = self->_timestamps;
  if (timestamps)
    v8 = g_recordTimestamps == 0;
  else
    v8 = 1;
  if (!v8 && !timestamps[12])
    timestamps[12] = mach_absolute_time();
  flows = self->_flows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](flows, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (self->_timeToFirstByte == 0.0)
    {
      kdebug_trace();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceNow");
      self->_timeToFirstByte = fabs(v13 * 1000.0) - self->_timeToFirstRequest;

      objc_msgSend(v11, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", self->_connectionStartDate);
      v16 = v15;

      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v16 >= 0.0)
          v18 = 0.0;
        else
          v18 = v16 * -1000.0;
        -[NPTunnel identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        timeToFirstRequest = self->_timeToFirstRequest;
        timeToFirstByte = self->_timeToFirstByte;
        v22 = 138413058;
        v23 = v19;
        v24 = 2048;
        v25 = timeToFirstByte;
        v26 = 2048;
        v27 = timeToFirstRequest;
        v28 = 2048;
        v29 = v18;
        _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "%@: TTFB: %f TTFR: %f ConnectionDelay: %f", (uint8_t *)&v22, 0x2Au);

      }
    }
    objc_msgSend(v11, "sendDataToClient:fromTunnel:", v6, 1);
  }

}

- (void)handleConnected
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tunnelDidConnect:", self);

  if (-[NSMutableDictionary count](self->_flows, "count"))
  {
    -[NSMutableDictionary allKeys](self->_flows, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_flows, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleTunnelConnected");

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[NPTunnel startIdleTimer](self, "startIdleTimer");
  }
}

- (void)handleReady
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_connectionState = 4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tunnelIsReady:", self);

  self->_isReadyForData = 1;
  -[NSMutableDictionary allKeys](self->_flows, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_flows, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleTunnelReadyForData");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)handleDisconnected
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_flows, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_flows, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleTunnelDisconnected");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)handleCanHandleMoreData
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_flows;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_flows, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleTunnelCanHandleMoreData");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)canHandleMoreData
{
  return 0;
}

- (unint64_t)initialWindowSize
{
  return 0;
}

- (id)createConnectionInfo
{
  return 0;
}

- (unint64_t)maxDataSendSizeForFlow:(id)a3
{
  return 0;
}

- (BOOL)isConnectionAlive
{
  return self->_connectionState != 5;
}

- (BOOL)start
{
  nw_protocol *output_handler;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  output_handler = self->_protocol.output_handler;
  if (output_handler)
  {
    self->_connectionState = 2;
    return (*((uint64_t (**)(void))output_handler->callbacks + 3))();
  }
  else
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: Cannot start the connection, no output handler available", (uint8_t *)&v7, 0xCu);

    }
    return 0;
  }
}

- (BOOL)flowIsFirstFlow:(id)a3
{
  return 0;
}

- (void)handleConnectionIsDisconnected
{
  OS_dispatch_data *savedData;
  void *v4;
  void *v5;

  savedData = self->_savedData;
  self->_savedData = 0;

  -[NPTunnel handleDisconnected](self, "handleDisconnected");
  if (self->_connectionState == 5)
  {
    -[NPTunnel parameters](self, "parameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)nw_parameters_copy_context();
    nw_queue_context_async();

  }
}

uint64_t __42__NPTunnel_handleConnectionIsDisconnected__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyConnection");
}

- (void)handleOutputAvailable
{
  if (self->_savedData)
    -[NPTunnel write:](self, "write:", 0);
}

- (void)write:(id)a3
{
  nw_protocol *output_handler;
  NSObject *v6;
  NSObject *savedData;
  dispatch_data_t concat;
  NSObject *subrange;
  OS_dispatch_data *v10;
  void (*v11)(nw_protocol *, nw_protocol *, uint64_t, size_t, uint64_t, _QWORD *);
  size_t size;
  void *v13;
  void *v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v25;
  OS_dispatch_data *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *data2;
  _QWORD applier[8];
  _QWORD v34[4];
  unsigned int v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE buf[24];
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  data2 = a3;
  v37[0] = 0;
  v37[1] = 0;
  nw_frame_array_init();
  v36[0] = 0;
  v36[1] = 0;
  nw_frame_array_init();
  output_handler = self->_protocol.output_handler;
  if (self->_connectionState == 5 || output_handler == 0)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = 138412290;
      *(_QWORD *)((char *)&v40 + 4) = v28;
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "%@: write called while not connected", (uint8_t *)&v40, 0xCu);

    }
    -[NPTunnel handleDataWrittenWithError:](self, "handleDataWrittenWithError:", 57);
    goto LABEL_49;
  }
  savedData = self->_savedData;
  if (savedData)
  {
    if (data2)
      concat = dispatch_data_create_concat(savedData, data2);
    else
      concat = savedData;
    subrange = concat;
    v10 = self->_savedData;
    self->_savedData = 0;

  }
  else
  {
    subrange = data2;
  }
  if (!subrange)
  {
    -[NPTunnel handleDataWrittenWithError:](self, "handleDataWrittenWithError:", 0);
    goto LABEL_49;
  }
  v11 = (void (*)(nw_protocol *, nw_protocol *, uint64_t, size_t, uint64_t, _QWORD *))*((_QWORD *)output_handler->callbacks
                                                                                               + 11);
  size = dispatch_data_get_size(subrange);
  v11(output_handler, &self->_protocol, 1, size, 0xFFFFFFFFLL, v37);
  nw_frame_array_first();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = 0;
    goto LABEL_39;
  }
  while (1)
  {
    nw_frame_array_next();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_data_get_size(subrange);
    *(_QWORD *)&v40 = 0;
    *((_QWORD *)&v40 + 1) = &v40;
    v41 = 0x2020000000;
    v42 = 0;
    if (nw_frame_uses_external_data())
    {
      if ((nw_frame_set_external_data() & 1) == 0)
      {
        nplog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[NPTunnel identifier](self, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v31;
          _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to set data in frame", buf, 0xCu);

        }
        goto LABEL_38;
      }
    }
    else
    {
      v35 = 0;
      v16 = nw_frame_unclaimed_bytes();
      if (v35)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v39 = v35;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        v34[3] = 0;
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __18__NPTunnel_write___block_invoke;
        applier[3] = &unk_1E4138208;
        applier[4] = buf;
        applier[5] = v34;
        applier[6] = &v40;
        applier[7] = v16;
        dispatch_data_apply(subrange, applier);
        _Block_object_dispose(v34, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    if (!*(_DWORD *)(*((_QWORD *)&v40 + 1) + 24))
    {
      nplog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTunnel identifier](self, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEFAULT, "%@: Did not write any bytes to a frame", buf, 0xCu);

      }
      goto LABEL_29;
    }
    if ((nw_frame_claim() & 1) == 0)
      break;
    nw_frame_collapse();
    nw_frame_unclaim();
    v17 = *(unsigned int *)(*((_QWORD *)&v40 + 1) + 24);
    v18 = v15 - v17;
    if (v15 <= v17)
    {
      v19 = subrange;
      subrange = 0;
    }
    else
    {
      v19 = subrange;
      subrange = dispatch_data_create_subrange(subrange, v17, v18);
    }
LABEL_29:

    nw_frame_array_remove();
    nw_frame_array_append();

    _Block_object_dispose(&v40, 8);
    if (subrange)
    {
      v13 = v14;
      if (v14)
        continue;
    }
    goto LABEL_39;
  }
  nplog_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    -[NPTunnel identifier](self, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_DWORD *)(*((_QWORD *)&v40 + 1) + 24);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v22;
    _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to claim %u bytes", buf, 0x12u);

  }
LABEL_38:

  _Block_object_dispose(&v40, 8);
  v14 = v13;
LABEL_39:
  if ((nw_frame_array_is_empty() & 1) == 0)
    (*((void (**)(nw_protocol *, _QWORD *))output_handler->callbacks + 12))(output_handler, v36);
  if ((nw_frame_array_is_empty() & 1) == 0)
  {
    *(_QWORD *)&v40 = 0;
    *((_QWORD *)&v40 + 1) = &v40;
    v41 = 0x2020000000;
    v42 = 0;
    nw_frame_array_foreach();
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[NPTunnel identifier](self, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_DWORD *)(*((_QWORD *)&v40 + 1) + 24);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      _os_log_error_impl(&dword_19E8FE000, v25, OS_LOG_TYPE_ERROR, "%@: Failed to use %u frames", buf, 0x12u);

    }
    _Block_object_dispose(&v40, 8);
  }
  if (subrange)
  {
    v26 = self->_savedData;
    self->_savedData = (OS_dispatch_data *)subrange;
    v27 = subrange;

  }
  else
  {
    -[NPTunnel handleDataWrittenWithError:](self, "handleDataWrittenWithError:", 0);
  }

LABEL_49:
}

BOOL __18__NPTunnel_write___block_invoke(_QWORD *a1, int a2, int a3, void *__src, size_t a5)
{
  size_t v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) >= a5)
    v6 = a5;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  memcpy((void *)(a1[7] + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)), __src, v6);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) -= v6;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v6;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v6;
  return *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
}

uint64_t __18__NPTunnel_write___block_invoke_7(uint64_t a1)
{
  nw_frame_finalize();
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (void)readMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  NSObject *v5;
  void *v6;
  nw_protocol *output_handler;
  uint64_t v10;
  uint64_t v11;
  __int128 buf;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_connectionState == 5)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTunnel identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "%@: read called after the connection was torn down", (uint8_t *)&buf, 0xCu);

    }
  }
  else
  {
    output_handler = self->_protocol.output_handler;
    v10 = 0;
    v11 = 0;
    nw_frame_array_init();
    if ((*((unsigned int (**)(nw_protocol *, nw_protocol *, unint64_t, unint64_t, uint64_t, uint64_t *))output_handler->callbacks
          + 10))(output_handler, &self->_protocol, a3, a4, 0xFFFFFFFFLL, &v10))
    {
      -[NPTunnel handleReadData:](self, "handleReadData:", &v10);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v13 = __np_tunnel_finalize_output_frames_block_invoke;
      v14 = &__block_descriptor_40_e31_B16__0__NSObject_OS_nw_frame__8l;
      v15 = &v10;
      nw_frame_array_foreach();
    }
    else if (self->_eof)
    {
      -[NPTunnel handleEOF](self, "handleEOF", v10, v11);
    }
  }
}

- (void)cancelConnection
{
  int64_t connectionState;
  nw_protocol *output_handler;
  void *v5;
  void *v6;

  self->_isCancelled = 1;
  if (self->_idleTimer)
  {
    nw_queue_cancel_source();
    self->_idleTimer = 0;
  }
  connectionState = self->_connectionState;
  if ((unint64_t)(connectionState - 2) >= 3)
  {
    if (connectionState != 5)
    {
      self->_connectionState = 5;
      -[NPTunnel parameters](self, "parameters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)nw_parameters_copy_context();
      nw_queue_context_async();

    }
  }
  else
  {
    self->_connectionState = 5;
    output_handler = self->_protocol.output_handler;
    if (output_handler)
      (*((void (**)(void))output_handler->callbacks + 4))();
  }
}

uint64_t __28__NPTunnel_cancelConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyConnection");
}

- (void)destroyConnection
{
  id WeakRetained;

  if (!-[NSMutableDictionary count](self->_flows, "count"))
    -[NPTunnel teardownOutputHandler](self, "teardownOutputHandler");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tunnelDidCancel:", self);

  nw_protocol_remove_instance();
}

- (void)teardownOutputHandler
{
  nw_protocol *output_handler;
  NSObject *v4;
  nw_protocol_callbacks *callbacks;
  void (*v6)(nw_protocol *, nw_protocol *, uint64_t);
  void *handle;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  output_handler = self->_protocol.output_handler;
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[NPTunnel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "%@: Tearing down output handler", (uint8_t *)&v9, 0xCu);

  }
  if (output_handler)
  {
    callbacks = output_handler->callbacks;
    if (callbacks)
    {
      v6 = (void (*)(nw_protocol *, nw_protocol *, uint64_t))*((_QWORD *)callbacks + 1);
      if (v6)
        v6(output_handler, &self->_protocol, 1);
    }
  }
  handle = self->_protocol.handle;
  self->_protocol.output_handler = 0;
  self->_protocol.handle = 0;

}

- (OS_nw_interface)outputInterface
{
  _QWORD *flow_id;

  flow_id = self->_protocol.output_handler->flow_id;
  if (flow_id)
  {
    (*(void (**)(void))(flow_id[3] + 208))();
    flow_id = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return (OS_nw_interface *)flow_id;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localEndpoint, a3);
}

- (OS_nw_path)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NPTunnelDelegate)delegate
{
  return (NPTunnelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)flows
{
  return self->_flows;
}

- (NSPAppRule)appRule
{
  return self->_appRule;
}

- (NSDate)connectionStartDate
{
  return self->_connectionStartDate;
}

- (void)setConnectionStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_connectionStartDate, a3);
}

- (double)timeToFirstRequest
{
  return self->_timeToFirstRequest;
}

- (void)setTimeToFirstRequest:(double)a3
{
  self->_timeToFirstRequest = a3;
}

- (double)timeToFirstByte
{
  return self->_timeToFirstByte;
}

- (void)setTimeToFirstByte:(double)a3
{
  self->_timeToFirstByte = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
}

- (unint64_t)timestamps
{
  return self->_timestamps;
}

- (BOOL)isTFOProbeSucceeded
{
  return self->_isTFOProbeSucceeded;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isReadyForData
{
  return self->_isReadyForData;
}

- (BOOL)eof
{
  return self->_eof;
}

- (void)setEof:(BOOL)a3
{
  self->_eof = a3;
}

- (BOOL)handledDisconnected
{
  return self->_handledDisconnected;
}

- (void)setHandledDisconnected:(BOOL)a3
{
  self->_handledDisconnected = a3;
}

- (BOOL)disableIdleTimeout
{
  return self->_disableIdleTimeout;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  self->_disableIdleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionStartDate, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_flows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_savedData, 0);
}

@end
