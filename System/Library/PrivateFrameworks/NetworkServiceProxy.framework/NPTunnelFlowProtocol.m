@implementation NPTunnelFlowProtocol

- (NPTunnelFlowProtocol)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  NPTunnelFlowProtocol *v14;
  NPTunnelFlowProtocol *v15;
  NSObject *v16;
  uint8_t v18[16];
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v12, "flowIdentifier");
  if (v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)NPTunnelFlowProtocol;
    v14 = -[NPTunnelFlow initWithTunnel:appRule:hashKey:extraFlowProperties:](&v19, sel_initWithTunnel_appRule_hashKey_extraFlowProperties_, v10, v11, v13, v12);
    if (v14)
      v14->_inputProtocol = a5;
    self = v14;
    v15 = self;
  }
  else
  {
    nplog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_ERROR, "No flow ID available, failed to create a flow", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (void)dropInputProtocol
{
  self->_inputProtocol = 0;
}

- (BOOL)connect
{
  nw_protocol *inputProtocol;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const void *v9;
  size_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  void (*v17)(nw_protocol *, uint64_t);
  _QWORD destructor[5];
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  inputProtocol = self->_inputProtocol;
  (*((void (**)(nw_protocol *, SEL))inputProtocol->callbacks + 17))(inputProtocol, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(nw_protocol *))inputProtocol->callbacks + 14))(inputProtocol);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTunnelFlow hashKey](self, "hashKey");
  kdebug_trace();
  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = -[NPTunnelFlow hashKey](self, "hashKey");
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = nw_endpoint_get_description();
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "Flow %llu is connecting with endpoint %s", buf, 0x16u);
  }

  if (-[NPTunnelFlow shouldComposeIntialData](self, "shouldComposeIntialData"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    -[NPTunnelFlow extraFlowProperties](self, "extraFlowProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestData");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v8)
    {
      v9 = (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      v10 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length");
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      destructor[0] = MEMORY[0x1E0C809B0];
      destructor[1] = 3221225472;
      destructor[2] = __31__NPTunnelFlowProtocol_connect__block_invoke;
      destructor[3] = &unk_1E41380A8;
      destructor[4] = buf;
      v12 = dispatch_data_create(v9, v10, v11, destructor);

    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(buf, 8);

    self->_connectedOnInitialData = 1;
    if (v12)
    {
      self->_discardFirstData = 1;
      -[NPTunnelFlowProtocol handleAppData:](self, "handleAppData:", v12);
      goto LABEL_20;
    }
  }
  else
  {
    self->_connectedOnInitialData = 1;
  }
  if (v5
    && !-[NPTunnelFlow shouldComposeIntialData](self, "shouldComposeIntialData")
    && ((nw_parameters_get_tfo() & 1) != 0 || nw_parameters_has_initial_data_payload()))
  {
    nplog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[NPTunnelFlow hashKey](self, "hashKey");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_DEFAULT, "Flow %llu has initial data or TFO is enabled, waiting for output", buf, 0xCu);
    }

    self->_waitingForOutput = 1;
    v17 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 5);
    -[NPTunnelFlow tunnel](self, "tunnel");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v17(inputProtocol, objc_msgSend(v12, "protocol"));
  }
  else
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[NPTunnelFlow hashKey](self, "hashKey");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEFAULT, "Flow %llu has no initial data", buf, 0xCu);
    }

    self->_connectedOnTunnelReadyForData = 1;
    v12 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    -[NPTunnelFlowProtocol handleAppData:](self, "handleAppData:", v12);
  }
LABEL_20:

  return 1;
}

void __31__NPTunnelFlowProtocol_connect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)disconnect
{
  -[NPTunnelFlow setDisconnectedByApp:](self, "setDisconnectedByApp:", 1);
  if (!self->_disconnectedByTunnel)
    -[NPTunnelFlowProtocol handleAppData:](self, "handleAppData:", 0);
}

- (void)closeClientFlowWithError:(int)a3
{
  uint64_t v3;
  nw_protocol *inputProtocol;
  NSObject *inputBuffer;
  NSObject *v7;
  void (*v8)(nw_protocol *, uint64_t, uint64_t);
  void *v9;
  void (*v10)(nw_protocol *, uint64_t);
  void *v11;
  NSObject *v12;
  void (*v13)(nw_protocol *, uint64_t);
  int v14;
  unint64_t v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  inputProtocol = self->_inputProtocol;
  if (!-[NPTunnelFlow disconnectedByApp](self, "disconnectedByApp") && inputProtocol)
  {
    if (self->_disconnectedByTunnel)
    {
      if (!(_DWORD)v3)
        return;
      goto LABEL_11;
    }
    self->_disconnectedByTunnel = 1;
    inputBuffer = self->_inputBuffer;
    if (inputBuffer)
    {
      if (!(_DWORD)v3)
      {
        if (dispatch_data_get_size(inputBuffer))
          return;
        goto LABEL_16;
      }
    }
    else if (!(_DWORD)v3)
    {
LABEL_16:
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = 134217984;
        v15 = -[NPTunnelFlow hashKey](self, "hashKey");
        _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished", (uint8_t *)&v14, 0xCu);
      }

      v13 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 23);
      -[NPTunnelFlow tunnel](self, "tunnel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13(inputProtocol, objc_msgSend(v9, "protocol"));
      goto LABEL_14;
    }
LABEL_11:
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = -[NPTunnelFlow hashKey](self, "hashKey");
      v16 = 2080;
      v17 = strerror(v3);
      _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu notifying input protocol of error: %s", (uint8_t *)&v14, 0x16u);
    }

    v8 = (void (*)(nw_protocol *, uint64_t, uint64_t))*((_QWORD *)inputProtocol->callbacks + 7);
    -[NPTunnelFlow tunnel](self, "tunnel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8(inputProtocol, objc_msgSend(v9, "protocol"), v3);
LABEL_14:

    v10 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 6);
    -[NPTunnelFlow tunnel](self, "tunnel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10(inputProtocol, objc_msgSend(v11, "protocol"));

  }
}

- (BOOL)isClientFlowClosed
{
  return self->_disconnectedByTunnel;
}

- (void)notifyClientConnected
{
  nw_protocol *inputProtocol;
  NSObject *v4;
  void (*v5)(nw_protocol *, uint64_t);
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_connectedOnInitialData = 0;
  self->_connectedOnTunnelReadyForData = 0;
  inputProtocol = self->_inputProtocol;
  if (inputProtocol)
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = -[NPTunnelFlow hashKey](self, "hashKey");
      _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu is now connected", (uint8_t *)&v7, 0xCu);
    }

    -[NPTunnelFlow hashKey](self, "hashKey");
    kdebug_trace();
    v5 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 5);
    -[NPTunnelFlow tunnel](self, "tunnel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5(inputProtocol, objc_msgSend(v6, "protocol"));

  }
}

- (void)handleTunnelReadyForData
{
  id v3;

  if (self->_connectedOnTunnelReadyForData)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    -[NPTunnelFlowProtocol sendDataToClient:fromTunnel:](self, "sendDataToClient:fromTunnel:", v3, 1);

  }
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  _BOOL8 v4;
  nw_protocol *inputProtocol;
  OS_dispatch_data **p_inputBuffer;
  NSObject *inputBuffer;
  dispatch_data_t concat;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(nw_protocol *, uint64_t);
  NSObject *data2;

  v4 = a4;
  data2 = a3;
  inputProtocol = self->_inputProtocol;
  if (inputProtocol
    && !-[NPTunnelFlow disconnectedByApp](self, "disconnectedByApp")
    && -[NPTunnelFlow shouldSendDataToClient:fromTunnel:](self, "shouldSendDataToClient:fromTunnel:", data2, v4))
  {
    if (self->_connectedOnInitialData)
      -[NPTunnelFlowProtocol notifyClientConnected](self, "notifyClientConnected");
    if (-[NSObject length](data2, "length"))
    {
      p_inputBuffer = &self->_inputBuffer;
      inputBuffer = self->_inputBuffer;
      if (inputBuffer)
      {
        concat = dispatch_data_create_concat(inputBuffer, data2);
        v11 = *p_inputBuffer;
        *p_inputBuffer = (OS_dispatch_data *)concat;
      }
      else
      {
        objc_storeStrong((id *)&self->_inputBuffer, a3);
        kdebug_trace();
        -[NPTunnelFlow tunnel](self, "tunnel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "timestamps");
        if (v13 && g_recordTimestamps && !*(_QWORD *)(v13 + 104))
          *(_QWORD *)(v13 + 104) = mach_absolute_time();

        v14 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 8);
        -[NPTunnelFlow tunnel](self, "tunnel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14(inputProtocol, objc_msgSend(v11, "protocol"));
      }
      goto LABEL_11;
    }
  }
  else if (v4)
  {
    -[NPTunnelFlow tunnel](self, "tunnel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acknowledgeData:sentToFlow:", -[NSObject length](data2, "length"), self);
LABEL_11:

  }
}

- (void)readDataFromClient
{
  nw_protocol *inputProtocol;
  void (*v4)(nw_protocol *, uint64_t);
  id v5;

  inputProtocol = self->_inputProtocol;
  if (inputProtocol)
  {
    if (!-[NPTunnelFlow disconnectedByApp](self, "disconnectedByApp"))
    {
      kdebug_trace();
      v4 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 9);
      -[NPTunnelFlow tunnel](self, "tunnel");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4(inputProtocol, objc_msgSend(v5, "protocol"));

    }
  }
}

- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6
{
  NSObject *inputBuffer;
  _BOOL4 v11;
  _BOOL4 disconnectedByTunnel;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  void (*v18)(nw_protocol *, uint64_t);
  void *v19;
  NSObject *v20;
  size_t size;
  NSObject *v22;
  unsigned int v23;
  size_t v24;
  OS_dispatch_data *subrange;
  void *v26;
  OS_dispatch_data *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unsigned int v38;
  nw_protocol *inputProtocol;
  _QWORD applier[7];
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint8_t buf[4];
  unint64_t v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  inputBuffer = self->_inputBuffer;
  if (inputBuffer)
    v11 = dispatch_data_get_size(inputBuffer) == 0;
  else
    v11 = 1;
  disconnectedByTunnel = self->_disconnectedByTunnel;
  inputProtocol = self->_inputProtocol;
  nw_frame_array_init();
  if (!a5 || !a6)
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v34 = -[NPTunnelFlow hashKey](self, "hashKey");
      *(_DWORD *)buf = 134218496;
      v53 = v34;
      v54 = 1024;
      v55 = a6;
      v56 = 1024;
      v57 = a5;
      _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, "Flow %llu Maximum frame count (%u) and/or maximum byte count (%u) is 0", buf, 0x18u);
    }

  }
  if (v11)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v35 = -[NPTunnelFlow hashKey](self, "hashKey");
      *(_DWORD *)buf = 134217984;
      v53 = v35;
      _os_log_debug_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEBUG, "Flow %llu no input data currently available", buf, 0xCu);
    }
    v15 = disconnectedByTunnel;

    if (inputProtocol)
      v16 = v15;
    else
      v16 = 0;
    if (v16)
    {
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v36 = -[NPTunnelFlow hashKey](self, "hashKey");
        *(_DWORD *)buf = 134217984;
        v53 = v36;
        _os_log_debug_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished", buf, 0xCu);
      }

      v18 = (void (*)(nw_protocol *, uint64_t))*((_QWORD *)inputProtocol->callbacks + 23);
      -[NPTunnelFlow tunnel](self, "tunnel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18(inputProtocol, objc_msgSend(v19, "protocol"));

    }
LABEL_23:
    v23 = 0;
    goto LABEL_39;
  }
  v20 = self->_inputBuffer;
  size = dispatch_data_get_size(v20);
  if (size < a4)
  {
    nplog_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v53 = size;
      v54 = 1024;
      v55 = a4;
      _os_log_debug_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_DEBUG, "Available input data (%lu bytes) is smaller than minimum bytes requested (%u bytes)", buf, 0x12u);
    }

    goto LABEL_23;
  }
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke;
  applier[3] = &unk_1E4138120;
  applier[4] = &v48;
  applier[5] = &v44;
  applier[6] = a3;
  v42 = a5;
  v43 = a6;
  dispatch_data_apply(v20, applier);
  v24 = *((unsigned int *)v45 + 6);
  if (size > v24)
  {
    subrange = (OS_dispatch_data *)dispatch_data_create_subrange((dispatch_data_t)self->_inputBuffer, v24, size - v24);
    v26 = self->_inputBuffer;
    self->_inputBuffer = subrange;
LABEL_29:

    goto LABEL_30;
  }
  v27 = self->_inputBuffer;
  self->_inputBuffer = 0;

  if (self->_disconnectedByTunnel)
  {
    (*((void (**)(void))self->_inputProtocol->callbacks + 14))();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v28 = (void *)nw_parameters_copy_context();
      nw_queue_context_async();

    }
    goto LABEL_29;
  }
LABEL_30:
  if (-[NPTunnelFlow state](self, "state") == 3)
  {
    -[NPTunnelFlow tunnel](self, "tunnel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "acknowledgeData:sentToFlow:", *((unsigned int *)v45 + 6), self);

  }
  nplog_obj();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v37 = -[NPTunnelFlow hashKey](self, "hashKey");
    v38 = *((_DWORD *)v45 + 6);
    *(_DWORD *)buf = 134218240;
    v53 = v37;
    v54 = 1024;
    v55 = v38;
    _os_log_debug_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_DEBUG, "Flow %llu app read %u bytes", buf, 0x12u);
  }

  -[NPTunnelFlow tunnel](self, "tunnel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "timestamps");
  if (v32 && g_recordTimestamps && !*(_QWORD *)(v32 + 112))
    *(_QWORD *)(v32 + 112) = mach_absolute_time();

  v23 = *((_DWORD *)v49 + 6);
LABEL_39:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v23;
}

BOOL __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  unint64_t v9;
  _BOOL8 result;

  v8 = a2;
  v9 = *(unsigned int *)(a1 + 56);
  if (a5 + a3 > v9)
    LODWORD(a5) = v9 - a3;
  nw_frame_create();
  nw_frame_array_append();
  result = 0;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a5;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < *(_DWORD *)(a1 + 56))
    return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < *(_DWORD *)(a1 + 60);
  return result;
}

void __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void (*v4)(uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (v1)
  {
    nplog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
      v7 = 134217984;
      v8 = v6;
      _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished after all pending data read", (uint8_t *)&v7, 0xCu);
    }

    v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 24) + 184);
    objc_msgSend(*(id *)(a1 + 32), "tunnel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4(v1, objc_msgSend(v5, "protocol"));

  }
}

- (BOOL)addBufferToFrameArray:(nw_frame_array_s *)a3 bufferSize:(unint64_t)a4
{
  void *v4;

  v4 = malloc_type_malloc(a4, 0x100004077774924uLL);
  if (v4)
  {
    nw_frame_create();
    nw_frame_array_append();
  }
  return v4 != 0;
}

- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6
{
  void *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _DWORD *v15;
  unsigned int result;
  unsigned int v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  BOOL v22;
  NSObject *v23;
  uint8_t v24[16];

  -[NPTunnelFlow tunnel](self, "tunnel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maxDataSendSizeForFlow:", self);

  nw_frame_array_init();
  if (!v12)
    return 0;
  v13 = a5;
  v14 = a6;
  if (self->super._hasTunnel)
  {
    v15 = -[NPTunnelFlow window](self, "window");
    if (v15)
      v13 = v15[3];
    else
      v13 = 0;
    if (v13 % v12)
      v14 = v13 / v12 + 1;
    else
      v14 = v13 / v12;
  }
  result = 0;
  if (v14 >= a6)
    v14 = a6;
  if (v13 >= a5)
    v17 = a5;
  else
    v17 = v13;
  if (v17 >= a4)
    v18 = v17;
  else
    v18 = 0;
  if (self->_discardFirstData)
    v12 = v18;
  if ((_DWORD)v18 && v14)
  {
    v19 = 0;
    v20 = v14 - 1;
    while (1)
    {
      v21 = v12 >= v17 ? v17 : v12;
      if (!-[NPTunnelFlowProtocol addBufferToFrameArray:bufferSize:](self, "addBufferToFrameArray:bufferSize:", a3, v21))break;
      result = v19 + 1;
      v17 -= v21;
      if (v17)
        v22 = v20 == v19;
      else
        v22 = 1;
      ++v19;
      if (v22)
        return result;
    }
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "Failed to create an output buffer", v24, 2u);
    }

    return v19;
  }
  return result;
}

- (void)handleOutputFrame:(id)a3 send:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *buffer;
  const void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_data_t v11;
  _QWORD v12[5];
  unsigned int v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v6 = a3;
  buffer = (void *)nw_frame_get_buffer();
  v8 = (const void *)nw_frame_unclaimed_bytes();

  if (buffer && v4 && !self->_discardFirstData)
  {
    self->_waitingForOutput = 0;
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__NPTunnelFlowProtocol_handleOutputFrame_send___block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = buffer;
    v11 = dispatch_data_create(v8, v13, v10, v12);

    -[NPTunnelFlowProtocol handleAppData:](self, "handleAppData:", v11);
  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v15 = -[NPTunnelFlow hashKey](self, "hashKey");
      v16 = 1024;
      v17 = v13;
      _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu discarding %u bytes", buf, 0x12u);
    }

    self->_discardFirstData = 0;
    free(buffer);
  }
}

void __47__NPTunnelFlowProtocol_handleOutputFrame_send___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

- (void)handleAppData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  objc_super v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NPTunnelFlow state](self, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTunnelFlow setFirstTxByteTimestamp:](self, "setFirstTxByteTimestamp:", v5);

  }
  -[NPTunnelFlow tunnel](self, "tunnel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "timestamps");
  if (v7 && g_recordTimestamps && !*(_QWORD *)(v7 + 64))
    *(_QWORD *)(v7 + 64) = mach_absolute_time();

  v13.receiver = self;
  v13.super_class = (Class)NPTunnelFlowProtocol;
  -[NPTunnelFlow handleAppData:](&v13, sel_handleAppData_, v4);

  if (!v4)
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NPTunnelFlow hashKey](self, "hashKey");
      v10 = -[NPTunnelFlow identifier](self, "identifier");
      *(_DWORD *)buf = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) received EOF from the app", buf, 0x16u);
    }

    -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
  }
  if (-[NPTunnelFlow state](self, "state") == 2)
  {
    -[NPTunnelFlow tunnel](self, "tunnel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isReadyForData");

    if (v12)
      -[NPTunnelFlowProtocol handleTunnelReadyForData](self, "handleTunnelReadyForData");
  }
}

- (nw_protocol)inputProtocol
{
  return self->_inputProtocol;
}

- (BOOL)waitingForOutput
{
  return self->_waitingForOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

@end
