@implementation NPTunnelFlowDNS

- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NPTunnelFlowDNS *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v32;
  unint64_t v33;
  unint64_t v34;
  const __CFString *v35;
  objc_super v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NPTunnelFlowDNS;
  v7 = -[NPTunnelFlow shouldSendDataToClient:fromTunnel:](&v36, sel_shouldSendDataToClient_fromTunnel_, v6, v4);
  if (v4)
  {
    if (!-[NPTunnelFlowDNS tunnelResult](self, "tunnelResult"))
    {
      v20 = -[NSPDNSPacket initFromData:]([NSPDNSPacket alloc], "initFromData:", v6);
      -[NPTunnelFlowDNS setTunnelDNSResponse:](self, "setTunnelDNSResponse:", v20);

      -[NPTunnelFlowDNS tunnelDNSResponse](self, "tunnelDNSResponse");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NPTunnelFlowDNS tunnelDNSResponse](self, "tunnelDNSResponse");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "identifier");
        -[NPTunnelFlowDNS query](self, "query");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "identifier");

        if (v23 == v25)
        {
          nplog_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            -[NPTunnelFlowDNS tunnelDNSResponse](self, "tunnelDNSResponse");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "identifier");
            *(_DWORD *)buf = 134217984;
            v38 = v28;
            _os_log_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEFAULT, "Received DNS response %ld from the tunnel", buf, 0xCu);

          }
          -[NPTunnelFlowDNS setTunnelResult:](self, "setTunnelResult:", 4);
          if (-[NPTunnelFlowDNS tunnelResponseTimer](self, "tunnelResponseTimer"))
          {
            -[NPTunnelFlowDNS tunnelResponseTimer](self, "tunnelResponseTimer");
            nw_queue_cancel_source();
            -[NPTunnelFlowDNS setTunnelResponseTimer:](self, "setTunnelResponseTimer:", 0);
          }
        }
      }
      else
      {
        nplog_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v32, OS_LOG_TYPE_ERROR, "Failed to parse a DNS response from the tunnel", buf, 2u);
        }

        -[NPTunnelFlowDNS setTunnelResult:](self, "setTunnelResult:", 2);
      }
    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
    if (-[NPTunnelFlowDNS directResult](self, "directResult"))
      goto LABEL_20;
    v9 = -[NSPDNSPacket initFromData:]([NSPDNSPacket alloc], "initFromData:", v6);
    -[NPTunnelFlowDNS setDirectDNSResponse:](self, "setDirectDNSResponse:", v9);

    -[NPTunnelFlowDNS directDNSResponse](self, "directDNSResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NPTunnelFlowDNS directDNSResponse](self, "directDNSResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "identifier");
      -[NPTunnelFlowDNS query](self, "query");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "identifier");

      if (v12 != v14)
        goto LABEL_20;
      nplog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTunnelFlowDNS directDNSResponse](self, "directDNSResponse");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "identifier");
        *(_DWORD *)buf = 134217984;
        v38 = v17;
        _os_log_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_DEFAULT, "Received DNS response %ld from the direct connection", buf, 0xCu);

      }
      v18 = self;
      v19 = 4;
    }
    else
    {
      nplog_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "Failed to parse a DNS response from the direct connection", buf, 2u);
      }

      v18 = self;
      v19 = 2;
    }
    -[NPTunnelFlowDNS setDirectResult:](v18, "setDirectResult:", v19);
  }
LABEL_20:
  nplog_obj();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v33 = -[NPTunnelFlow hashKey](self, "hashKey");
    v34 = -[NPTunnelFlow identifier](self, "identifier");
    v35 = CFSTR("should not");
    *(_DWORD *)buf = 134218498;
    v38 = v33;
    if (v8)
      v35 = CFSTR("should");
    v39 = 2048;
    v40 = v34;
    v41 = 2112;
    v42 = v35;
    _os_log_debug_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_DEBUG, "DNS Flow %llu (%llu): %@ send data to client", buf, 0x20u);
  }

  return v8;
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPTunnelFlowDNS;
  -[NPTunnelFlowProtocol sendDataToClient:fromTunnel:](&v5, sel_sendDataToClient_fromTunnel_, a3, a4);
  if (-[NPTunnelFlowDNS checkAndReportTelemetry](self, "checkAndReportTelemetry"))
  {
    if (!-[NPTunnelFlow isDirectConnectionViable](self, "isDirectConnectionViable"))
      -[NPTunnelFlowDNS closeFromTunnel](self, "closeFromTunnel");
  }
}

- (void)closeFromTunnel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[NPTunnelFlow tunnel](self, "tunnel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFlow:", -[NPTunnelFlow identifier](self, "identifier"));

  if ((v4 & 1) == 0)
  {
    if (!-[NPTunnelFlowDNS tunnelResult](self, "tunnelResult"))
      -[NPTunnelFlowDNS setTunnelResult:](self, "setTunnelResult:", 3);
    -[NPTunnelFlowDNS checkAndReportTelemetry](self, "checkAndReportTelemetry");
    goto LABEL_7;
  }
  if (-[NPTunnelFlowDNS checkAndReportTelemetry](self, "checkAndReportTelemetry"))
  {
    -[NPTunnelFlow tunnel](self, "tunnel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeFlow:", self);

LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)NPTunnelFlowDNS;
    -[NPTunnelFlow closeFromTunnel](&v9, sel_closeFromTunnel);
    return;
  }
  if (!-[NPTunnelFlowDNS tunnelResponseTimer](self, "tunnelResponseTimer"))
  {
    -[NPTunnelFlow tunnel](self, "tunnel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)nw_parameters_copy_context();
    -[NPTunnelFlowDNS setTunnelResponseTimer:](self, "setTunnelResponseTimer:", nw_queue_context_create_source());

    -[NPTunnelFlowDNS tunnelResponseTimer](self, "tunnelResponseTimer");
    dispatch_time(0, 30000000000);
    nw_queue_set_timer_values();
    -[NPTunnelFlowDNS tunnelResponseTimer](self, "tunnelResponseTimer");
    nw_queue_resume_source();
  }
}

uint64_t __34__NPTunnelFlowDNS_closeFromTunnel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
    v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) tunnel DNS response timer fired", (uint8_t *)&v6, 0x16u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "tunnelResponseTimer");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "tunnelResponseTimer");
    nw_queue_cancel_source();
    objc_msgSend(*(id *)(a1 + 32), "setTunnelResponseTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setTunnelResult:", 1);
    objc_msgSend(*(id *)(a1 + 32), "checkAndReportTelemetry");
    return objc_msgSend(*(id *)(a1 + 32), "closeFromTunnel");
  }
  return result;
}

- (void)closeFromDirectConnectionWithError:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPTunnelFlowDNS;
  -[NPTunnelFlow closeFromDirectConnectionWithError:](&v4, sel_closeFromDirectConnectionWithError_, *(_QWORD *)&a3);
  if (!-[NPTunnelFlowDNS directResult](self, "directResult"))
    -[NPTunnelFlowDNS setDirectResult:](self, "setDirectResult:", 1);
  -[NPTunnelFlowDNS checkAndReportTelemetry](self, "checkAndReportTelemetry");
}

- (BOOL)checkAndReportTelemetry
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  uint32_t v16;
  BOOL v17;
  BOOL v18;
  NSObject *v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[5];
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[NPTunnelFlowDNS telemetryReported](self, "telemetryReported")
    || !-[NPTunnelFlowDNS tunnelResult](self, "tunnelResult")
    || !-[NPTunnelFlowDNS directResult](self, "directResult"))
  {
    return -[NPTunnelFlowDNS telemetryReported](self, "telemetryReported");
  }
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v28 = -[NPTunnelFlow hashKey](self, "hashKey");
    v29 = 2048;
    v30 = -[NPTunnelFlow identifier](self, "identifier");
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) tunnel and direct DNS results known, checking if telemetry should be reported", buf, 0x16u);
  }

  -[NPTunnelFlow appRule](self, "appRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "telemetryRatio");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTunnelFlowDNS setTelemetryReported:](self, "setTelemetryReported:", 1);
  -[NPTunnelFlow tunnel](self, "tunnel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isConnectionAlive");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    if (v8 == 0.0)
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = -[NPTunnelFlow hashKey](self, "hashKey");
        v11 = -[NPTunnelFlow identifier](self, "identifier");
        *(_DWORD *)buf = 134218240;
        v28 = v10;
        v29 = 2048;
        v30 = v11;
        v12 = "Flow %llu (%llu) configured telemetry ratio is 0";
LABEL_12:
        v15 = v9;
        v16 = 22;
LABEL_13:
        _os_log_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_INFO, v12, buf, v16);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v18 = +[NPUtilities rollDiceWithSuccessRatio:](NPUtilities, "rollDiceWithSuccessRatio:", v5);
    nplog_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    v9 = v19;
    if (!v18)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      v21 = -[NPTunnelFlow hashKey](self, "hashKey");
      v22 = -[NPTunnelFlow identifier](self, "identifier");
      objc_msgSend(v5, "doubleValue");
      *(_DWORD *)buf = 134218496;
      v28 = v21;
      v29 = 2048;
      v30 = v22;
      v31 = 2048;
      v32 = v23;
      v12 = "Flow %llu (%llu) random telemety ratio did not fall within configured ratio (%f)";
      v15 = v9;
      v16 = 32;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v24 = -[NPTunnelFlow hashKey](self, "hashKey");
      v25 = -[NPTunnelFlow identifier](self, "identifier");
      *(_DWORD *)buf = 134218240;
      v28 = v24;
      v29 = 2048;
      v30 = v25;
      _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) reporting telemetry", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __42__NPTunnelFlowDNS_checkAndReportTelemetry__block_invoke;
    v26[3] = &unk_1E4137458;
    v26[4] = self;
    -[NPTunnelFlow createTelemetryDataWithCompletionHandler:](self, "createTelemetryDataWithCompletionHandler:", v26);

    return -[NPTunnelFlowDNS telemetryReported](self, "telemetryReported");
  }
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = -[NPTunnelFlow hashKey](self, "hashKey");
    v14 = -[NPTunnelFlow identifier](self, "identifier");
    *(_DWORD *)buf = 134218240;
    v28 = v13;
    v29 = 2048;
    v30 = v14;
    v12 = "Flow %llu (%llu) not reporting telemetry because the tunnel is not connected";
    goto LABEL_12;
  }
LABEL_14:

  v17 = -[NPTunnelFlowDNS telemetryReported](self, "telemetryReported");
  return v17;
}

void __42__NPTunnelFlowDNS_checkAndReportTelemetry__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "addDNSInfoToTelemetry:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reportTelemetry:withService:url:", v10, v9, v8);

}

- (id)resultToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E4137478[a3 - 1];
}

- (id)createStateDictionaryWithResult:(int64_t)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NPTunnelFlowDNS resultToString:](self, "resultToString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("net_result"));

  if (v6)
  {
    objc_msgSend(v6, "responseCodeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("response"));

    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "answers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "answers", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "copyStateDictionary");
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("answers"));
    objc_msgSend(v6, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnelFlowDNS query](self, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v21);
    v23 = v22 * 1000.0;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v23);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("rtt"));

  }
  return v7;
}

- (id)addDNSInfoToTelemetry:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NPTunnelFlowDNS query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v8, "count"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NPTunnelFlowDNS query](self, "query", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "copyStateDictionary");
        if (v16)
          objc_msgSend(v9, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("questions"));
  v17 = -[NPTunnelFlowDNS tunnelResult](self, "tunnelResult");
  -[NPTunnelFlowDNS tunnelDNSResponse](self, "tunnelDNSResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTunnelFlowDNS createStateDictionaryWithResult:response:](self, "createStateDictionaryWithResult:response:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("alternate"));
  v20 = -[NPTunnelFlowDNS directResult](self, "directResult");
  -[NPTunnelFlowDNS directDNSResponse](self, "directDNSResponse");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTunnelFlowDNS createStateDictionaryWithResult:response:](self, "createStateDictionaryWithResult:response:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("direct"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("dns"));

  return v4;
}

- (void)cleanupLosingConnection:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[NPTunnelFlow hashKey](self, "hashKey");
    v7 = -[NPTunnelFlow identifier](self, "identifier");
    v8 = CFSTR("Direct");
    v9 = 134218498;
    v10 = v6;
    if (v3)
      v8 = CFSTR("Tunnel");
    v11 = 2048;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) %@ won: skip cleanup of losing connection", (uint8_t *)&v9, 0x20u);
  }

}

- (void)handleAppData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  objc_super v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v18 = -[NPTunnelFlow hashKey](self, "hashKey");
    v19 = 2048;
    v20 = -[NPTunnelFlow identifier](self, "identifier");
    v21 = 2048;
    v22 = objc_msgSend(v4, "length");
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "DNS Flow %llu (%llu) received %lu bytes from the app", buf, 0x20u);
  }

  if (objc_msgSend(v4, "length"))
  {
    if (-[NPTunnelFlow state](self, "state") == 1)
    {
      v6 = -[NSPDNSPacket initFromData:]([NSPDNSPacket alloc], "initFromData:", v4);
      -[NPTunnelFlowDNS setQuery:](self, "setQuery:", v6);

      -[NPTunnelFlowDNS query](self, "query");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      nplog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v10 = -[NPTunnelFlow hashKey](self, "hashKey");
          v11 = -[NPTunnelFlow identifier](self, "identifier");
          -[NPTunnelFlowDNS query](self, "query");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "identifier");
          *(_DWORD *)buf = 134218496;
          v18 = v10;
          v19 = 2048;
          v20 = v11;
          v21 = 2048;
          v22 = v13;
          _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_INFO, "Flow %llu (%llu) received query %ld", buf, 0x20u);

        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v14 = -[NPTunnelFlow hashKey](self, "hashKey");
          v15 = -[NPTunnelFlow identifier](self, "identifier");
          *(_DWORD *)buf = 134218240;
          v18 = v14;
          v19 = 2048;
          v20 = v15;
          _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) failed to parse the DNS query", buf, 0x16u);
        }

        -[NPTunnelFlowDNS setTelemetryReported:](self, "setTelemetryReported:", 1);
      }
      -[NPTunnelFlowUDP startDirectConnection](self, "startDirectConnection");
    }
    v16.receiver = self;
    v16.super_class = (Class)NPTunnelFlowDNS;
    -[NPTunnelFlowUDP handleAppData:](&v16, sel_handleAppData_, v4);
  }
  else
  {
    -[NPTunnelFlowDNS closeFromDirectConnectionWithError:](self, "closeFromDirectConnectionWithError:", 0);
    -[NPTunnelFlowDNS closeFromTunnel](self, "closeFromTunnel");
  }

}

- (NSPDNSPacket)query
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 224, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (int64_t)tunnelResult
{
  return self->_tunnelResult;
}

- (void)setTunnelResult:(int64_t)a3
{
  self->_tunnelResult = a3;
}

- (NSPDNSPacket)tunnelDNSResponse
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTunnelDNSResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (int64_t)directResult
{
  return self->_directResult;
}

- (void)setDirectResult:(int64_t)a3
{
  self->_directResult = a3;
}

- (NSPDNSPacket)directDNSResponse
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDirectDNSResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void)tunnelResponseTimer
{
  return self->_tunnelResponseTimer;
}

- (void)setTunnelResponseTimer:(void *)a3
{
  self->_tunnelResponseTimer = a3;
}

- (BOOL)telemetryReported
{
  return self->_telemetryReported;
}

- (void)setTelemetryReported:(BOOL)a3
{
  self->_telemetryReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directDNSResponse, 0);
  objc_storeStrong((id *)&self->_tunnelDNSResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
