@implementation NPTunnelFlowTelemetry

- (NPTunnelFlowTelemetry)initWithTunnel:(id)a3 service:(id)a4 postURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPFlowProperties *v11;
  uint64_t v12;
  NPTunnelFlowTelemetry *v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(NPFlowProperties);
  v12 = serviceNameToID(v9);

  -[NPFlowProperties setServiceID:](v11, "setServiceID:", v12);
  v15.receiver = self;
  v15.super_class = (Class)NPTunnelFlowTelemetry;
  v13 = -[NPTunnelFlowHTTP initWithTunnel:URL:extraFlowProperties:](&v15, sel_initWithTunnel_URL_extraFlowProperties_, v10, v8, v11);

  return v13;
}

- (void)reportTelemetry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t source;
  NSObject *v12;
  void *v13;
  _QWORD v14[11];
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v17 = 0x2020000000;
    v18 = 0;
    -[NPTunnelFlow tunnel](self, "tunnel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)nw_parameters_copy_context();
    v10 = MEMORY[0x1E0C809B0];
    v14[5] = MEMORY[0x1E0C809B0];
    v14[6] = 3221225472;
    v14[7] = __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke;
    v14[8] = &unk_1E4138948;
    v14[9] = self;
    v14[10] = &buf;
    source = nw_queue_context_create_source();

    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = source;
    dispatch_time(0, 5000000000);
    nw_queue_set_timer_values();
    nw_queue_resume_source();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke_2;
    v14[3] = &unk_1E4138970;
    v14[4] = &buf;
    -[NPTunnelFlowHTTP postData:withCompletionHandler:](self, "postData:withCompletionHandler:", v5, v14);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Failed to create telemetry JSON: %@", (uint8_t *)&buf, 0xCu);
    }

    -[NPTunnelFlow tunnel](self, "tunnel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "closeFlow:", self);

    -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
  }

}

uint64_t __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "tunnel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeFlow:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "closeFromTunnel");
}

void __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    nw_queue_cancel_source();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  if ((a2 & 1) == 0)
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "Failed to post telemetry data", v5, 2u);
    }

  }
}

- (BOOL)isBestEffort
{
  return 1;
}

@end
