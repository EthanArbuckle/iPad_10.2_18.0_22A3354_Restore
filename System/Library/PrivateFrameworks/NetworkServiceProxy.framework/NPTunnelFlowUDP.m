@implementation NPTunnelFlowUDP

- (NPTunnelFlowUDP)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6
{
  id v10;
  NPTunnelFlowUDP *v11;
  uint64_t v12;
  NWEndpoint *remoteEndpoint;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NPTunnelFlowUDP;
  v11 = -[NPTunnelFlowProtocol initWithTunnel:appRule:inputProtocol:extraProperties:](&v15, sel_initWithTunnel_appRule_inputProtocol_extraProperties_, a3, a4, a5, v10);
  if (v11)
  {
    objc_msgSend(v10, "directEndpoint");
    v12 = objc_claimAutoreleasedReturnValue();
    remoteEndpoint = v11->_remoteEndpoint;
    v11->_remoteEndpoint = (NWEndpoint *)v12;

  }
  return v11;
}

- (void)handleAppData:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[NPTunnelFlow state](self, "state") == 1)
  {
    -[NPTunnelFlow firstTxByteTimestamp](self, "firstTxByteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnelFlowUDP setFirstPacketDate:](self, "setFirstPacketDate:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)NPTunnelFlowUDP;
  -[NPTunnelFlowProtocol handleAppData:](&v6, sel_handleAppData_, v4);
  -[NPTunnelFlowUDP sendDataOnDirectSession:](self, "sendDataOnDirectSession:", v4);

}

- (void)startDirectConnection
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NPTunnelFlowUDP *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[NPTunnelFlow isDirectConnectionViable](self, "isDirectConnectionViable"))
  {
    -[NPTunnelFlowUDP remoteEndpoint](self, "remoteEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      nplog_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = -[NPTunnelFlow hashKey](self, "hashKey");
        v6 = -[NPTunnelFlow identifier](self, "identifier");
        -[NPTunnelFlowUDP remoteEndpoint](self, "remoteEndpoint");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134218498;
        v15 = v5;
        v16 = 2048;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) starting direct session to %@", (uint8_t *)&v14, 0x20u);

      }
      v8 = objc_alloc(MEMORY[0x1E0CCECD8]);
      -[NPTunnelFlowUDP remoteEndpoint](self, "remoteEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
      v11 = (void *)objc_msgSend(v8, "initWithEndpoint:parameters:", v9, v10);
      -[NPTunnelFlowUDP setDirectSession:](self, "setDirectSession:", v11);

      -[NPTunnelFlowUDP directSession](self, "directSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self;
      objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v13, CFSTR("state"), 4, v13);

      -[NPTunnelFlow setIsDirectConnectionViable:](v13, "setIsDirectConnectionViable:", 1);
    }
  }
}

- (void)stopDirectConnection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[NPTunnelFlowUDP directSession](self, "directSession");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[NPTunnelFlowUDP directSession](self, "directSession"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "state"),
        v5,
        v4,
        v6 != 5))
  {
    -[NPTunnelFlowUDP directSession](self, "directSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
  else
  {
    -[NPTunnelFlowUDP setSavedDirectData:](self, "setSavedDirectData:", 0);
  }
}

- (void)handleIncomingData:(id)a3 andError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[NPTunnelFlow tunnel](self, "tunnel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)nw_parameters_copy_context();
  v13 = v7;
  v11 = v7;
  v12 = v6;
  nw_queue_context_async();

}

uint64_t __47__NPTunnelFlowUDP_handleIncomingData_andError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = *(void **)(a1 + 40);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
    return objc_msgSend(*(id *)(a1 + 48), "sendDataToClient:fromTunnel:", *(_QWORD *)(a1 + 32), 0);
  else
    return objc_msgSend(*(id *)(a1 + 48), "closeFromDirectConnectionWithError:", objc_msgSend(v3, "code"));
}

- (void)startHandlingIncomingData
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[NPTunnelFlowUDP directSession](self, "directSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__NPTunnelFlowUDP_startHandlingIncomingData__block_invoke;
  v4[3] = &unk_1E4137370;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setReadHandler:maxDatagrams:", v4, 64);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__NPTunnelFlowUDP_startHandlingIncomingData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = objc_msgSend(v5, "count");
    if (v6 || !v8)
    {
      objc_msgSend(WeakRetained, "handleIncomingData:andError:", 0, v6);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(WeakRetained, "handleIncomingData:andError:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, (_QWORD)v14);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)sendDataOnDirectSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NPTunnelFlow isDirectConnectionViable](self, "isDirectConnectionViable")
    && (-[NPTunnelFlowUDP directSession](self, "directSession"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "state"),
        v5,
        v6 == 3))
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v28 = -[NPTunnelFlow hashKey](self, "hashKey");
      v29 = 2048;
      v30 = -[NPTunnelFlow identifier](self, "identifier");
      v31 = 2048;
      v32 = objc_msgSend(v4, "length");
      _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Sending %lu bytes of data on the direct session", buf, 0x20u);
    }

    -[NPTunnelFlowUDP directSession](self, "directSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke;
    v25[3] = &unk_1E4137398;
    v25[4] = self;
    v26 = v4;
    objc_msgSend(v8, "writeDatagram:completionHandler:", v26, v25);

  }
  else if (-[NPTunnelFlow enableDirectRace](self, "enableDirectRace")
         || -[NPTunnelFlow state](self, "state") != 3 && !-[NPTunnelFlow fallbackDisabled](self, "fallbackDisabled"))
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v28 = -[NPTunnelFlow hashKey](self, "hashKey");
      v29 = 2048;
      v30 = -[NPTunnelFlow identifier](self, "identifier");
      v31 = 2048;
      v32 = objc_msgSend(v4, "length");
      _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Saving %lu bytes of data for the direct session", buf, 0x20u);
    }

    -[NPTunnelFlowUDP savedDirectData](self, "savedDirectData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[NPTunnelFlowUDP savedDataSize](self, "savedDataSize");
      v12 = objc_msgSend(v4, "length") + v11;
      -[NPTunnelFlow appRule](self, "appRule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fallbackBufferLimit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      if (v12 >= v15)
      {
        nplog_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = -[NPTunnelFlow hashKey](self, "hashKey");
          v20 = -[NPTunnelFlow identifier](self, "identifier");
          -[NPTunnelFlow appRule](self, "appRule");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fallbackBufferLimit");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[NPTunnelFlowUDP savedDataSize](self, "savedDataSize");
          v24 = objc_msgSend(v4, "length");
          *(_DWORD *)buf = 134218754;
          v28 = v19;
          v29 = 2048;
          v30 = v20;
          v31 = 2112;
          v32 = (uint64_t)v22;
          v33 = 1024;
          v34 = v24 + v23;
          _os_log_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) ran over the limit (%@) on saved data (%u), disabling fallback", buf, 0x26u);

        }
        -[NPTunnelFlow closeFromDirectConnectionWithError:](self, "closeFromDirectConnectionWithError:", 0);
      }
      else
      {
        -[NPTunnelFlowUDP savedDirectData](self, "savedDirectData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v4);

        -[NPTunnelFlowUDP setSavedDataSize:](self, "setSavedDataSize:", -[NPTunnelFlowUDP savedDataSize](self, "savedDataSize") + objc_msgSend(v4, "length"));
      }
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
      -[NPTunnelFlowUDP setSavedDirectData:](self, "setSavedDirectData:", v17);

    }
  }

}

void __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tunnel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)nw_parameters_copy_context();
  v8 = *(id *)(a1 + 40);
  v7 = v3;
  nw_queue_context_async();

}

uint64_t __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke_2(id *a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1[4])
    return objc_msgSend(a1[5], "readDataFromClient");
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_msgSend(a1[5], "hashKey");
    v5 = objc_msgSend(a1[5], "identifier");
    v6 = objc_msgSend(a1[6], "length");
    v7 = a1[4];
    v8 = 134218754;
    v9 = v4;
    v10 = 2048;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_error_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) failed to send %lu bytes of data on the direct session: %@", (uint8_t *)&v8, 0x2Au);
  }

  return objc_msgSend(a1[5], "closeFromDirectConnectionWithError:", objc_msgSend(a1[4], "code"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  void *v22;
  void *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("state"));
  if (a6 == self && v13)
  {
    objc_msgSend(a6, "tunnel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)nw_parameters_copy_context();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __66__NPTunnelFlowUDP_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v21 = &unk_1E41373C0;
    v22 = a6;
    v23 = a6;
    nw_queue_context_async();

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NPTunnelFlowUDP;
    -[NPTunnelFlowUDP observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __66__NPTunnelFlowUDP_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "directSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  switch(v3)
  {
    case 5:
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
        v15 = objc_msgSend(*(id *)(a1 + 32), "identifier");
        *(_DWORD *)buf = 134218240;
        v26 = v14;
        v27 = 2048;
        v28 = v15;
        _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session is now cancelled", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "directSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("state"), *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "setDirectSession:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setSavedDirectData:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setIsDirectConnectionViable:", 0);

      break;
    case 4:
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
        v19 = objc_msgSend(*(id *)(a1 + 32), "identifier");
        *(_DWORD *)buf = 134218240;
        v26 = v18;
        v27 = 2048;
        v28 = v19;
        _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session failed", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "closeFromDirectConnectionWithError:", 0);
      break;
    case 3:
      nplog_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
        v6 = objc_msgSend(*(id *)(a1 + 32), "identifier");
        *(_DWORD *)buf = 134218240;
        v26 = v5;
        v27 = 2048;
        v28 = v6;
        _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session is now ready", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setFallbackDisabled:", 1);
      objc_msgSend(*(id *)(a1 + 32), "savedDirectData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSavedDirectData:", 0);
      if (objc_msgSend(v7, "count"))
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(a1 + 32), "sendDataOnDirectSession:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12++), (_QWORD)v20);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v10);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "startHandlingIncomingData", (_QWORD)v20);

      break;
  }
}

- (NSMutableArray)savedDirectData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSavedDirectData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unint64_t)savedDataSize
{
  return self->_savedDataSize;
}

- (void)setSavedDataSize:(unint64_t)a3
{
  self->_savedDataSize = a3;
}

- (NWUDPSession)directSession
{
  return (NWUDPSession *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDirectSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)firstPacketDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFirstPacketDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_firstPacketDate, 0);
  objc_storeStrong((id *)&self->_directSession, 0);
  objc_storeStrong((id *)&self->_savedDirectData, 0);
}

@end
