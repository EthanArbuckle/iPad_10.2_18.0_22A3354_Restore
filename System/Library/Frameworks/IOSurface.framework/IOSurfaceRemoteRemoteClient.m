@implementation IOSurfaceRemoteRemoteClient

- (IOSurfaceRemoteRemoteClient)initWithRemoteConnection:(id)a3 disconnectedQueue:(id)a4 disconnectedHandler:(id)a5
{
  _xpc_connection_s *v8;
  id v9;
  id v10;
  IOSurfaceRemoteRemoteClient *v11;
  void *v12;
  _QWORD handler[4];
  id v15;
  id location;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (_xpc_connection_s *)a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IOSurfaceRemoteRemoteClient;
  v11 = -[IOSurfaceRemoteRemoteClient init](&v17, sel_init);
  v12 = (void *)objc_opt_new();
  -[IOSurfaceRemoteRemoteClient setSurfaceStates:](v11, "setSurfaceStates:", v12);

  -[IOSurfaceRemoteRemoteClient setDisconnectedQueue:](v11, "setDisconnectedQueue:", v9);
  -[IOSurfaceRemoteRemoteClient setDisconnectedHandler:](v11, "setDisconnectedHandler:", v10);
  -[IOSurfaceRemoteRemoteClient setRemoteConnection:](v11, "setRemoteConnection:", v8);
  -[IOSurfaceRemoteRemoteClient setPid:](v11, "setPid:", xpc_connection_get_pid(v8));
  objc_initWeak(&location, v11);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke;
  handler[3] = &unk_1E4DE7628;
  objc_copyWeak(&v15, &location);
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_activate(v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MEMORY[0x1A85A6ECC](v4) == MEMORY[0x1E0C81310])
      objc_msgSend(WeakRetained, "_handleError:", v4);
    else
      objc_msgSend(WeakRetained, "_handleMessage:", v4);
  }

}

- (void)dealloc
{
  _xpc_connection_s *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[IOSurfaceRemoteRemoteClient remoteConnection](self, "remoteConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceRemoteRemoteClient;
  -[IOSurfaceRemoteRemoteClient dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOSurfaceRemoteRemoteClient { remote_pid=%d }"), -[IOSurfaceRemoteRemoteClient pid](self, "pid"));
}

- (void)_handleError:(id)a3
{
  NSObject *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  -[IOSurfaceRemoteRemoteClient disconnectedQueue](self, "disconnectedQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke;
  v5[3] = &unk_1E4DE76A0;
  v5[4] = self;
  dispatch_async(v4, v5);

}

void __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "disconnectedHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (void)_addSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v10;
  const char *ID;
  void *v12;
  void *v13;
  IOSurfaceRemotePerSurfacePerClientState *v14;
  void *v15;

  v10 = a6;
  ID = (const char *)IOSurfaceClientGetID((uint64_t)a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (IOSurfaceRemotePerSurfacePerClientState *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IOSurfaceRemotePerSurfacePerClientState addClientReferenceToSurfaceWithExtraData:](v14, "addClientReferenceToSurfaceWithExtraData:", v10);
  }
  else
  {
    v14 = -[IOSurfaceRemotePerSurfacePerClientState initWithSurface:mappedAddress:mappedSize:extraData:]([IOSurfaceRemotePerSurfacePerClientState alloc], "initWithSurface:mappedAddress:mappedSize:extraData:", a3, a4, a5, v10);
    -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[IOSurfaceRemoteRemoteClient _addSurface:mappedAddress:mappedSize:extraData:].cold.1(self, ID);

}

- (BOOL)_removeSurface:(unsigned int)a3
{
  const char *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(const char **)&a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "removeClientReferenceToSurface"))
    {
      -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v5);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[IOSurfaceRemoteRemoteClient _removeSurface:].cold.1(self, v3);
  }

  return v7 != 0;
}

- (__IOSurfaceClient)_getClient:(unsigned int)a3 inboundExtradata:(id)a4 outboundExtraData:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __IOSurfaceClient *v12;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[IOSurfaceRemoteRemoteClient _getClient:inboundExtradata:outboundExtraData:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("IOSurfaceRemoteServer.m"), 384, CFSTR("BUG: Missing state?!?"));

  }
  objc_msgSend(v11, "mergeExtraData:", v8);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (__IOSurfaceClient *)objc_msgSend(v11, "surface");

  return v12;
}

- (void)_handleMessage:(id)a3
{
  id v4;
  xpc_object_t reply;
  uint64_t v6;
  _xpc_connection_s *v7;
  uint64_t uint64;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)();
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __IOSurfaceClient *v17;
  id v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_get_remote_connection(v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_xpc_connection_s *)v6;
  if (reply && v6)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "Method");
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (uint64 < 0x1B)
    {
      if (v9)
        -[IOSurfaceRemoteRemoteClient _handleMessage:].cold.2(uint64, self);
      v12 = _handleMessage__method_dispatch[uint64];
      if (uint64 > 2)
      {
        v13 = -536870160;
        v14 = xpc_dictionary_get_uint64(v4, "SurfaceID");
        v15 = v14;
        if (uint64 == 3)
        {
          if (-[IOSurfaceRemoteRemoteClient _removeSurface:](self, "_removeSurface:", v14))
            v13 = 0;
          else
            v13 = -536870160;
        }
        else
        {
          xpc_dictionary_set_uint64(reply, "SurfaceID", v14);
          xpc_dictionary_get_value(v4, "ExtraData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = 0;
          v17 = -[IOSurfaceRemoteRemoteClient _getClient:inboundExtradata:outboundExtraData:](self, "_getClient:inboundExtradata:outboundExtraData:", v15, v16, v19);
          v18 = v19[0];

          if (v17)
          {
            v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, __IOSurfaceClient *, id, xpc_object_t))v12)(self, v17, v4, reply);
            _ioSurfaceAddClientState((uint64_t)v17, v15, reply);
            if (v18)
              xpc_dictionary_set_value(reply, "ExtraData", v18);
          }

        }
      }
      else
      {
        v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, id, xpc_object_t))v12)(self, v4, reply);
      }
      v11 = v13;
      v10 = reply;
    }
    else
    {
      if (v9)
        -[IOSurfaceRemoteRemoteClient _handleMessage:].cold.1(self, (const char *)uint64);
      v10 = reply;
      v11 = -536870201;
    }
    xpc_dictionary_set_uint64(v10, "ErrorCode", v11);
    xpc_connection_send_message(v7, reply);
  }

}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSMutableDictionary)surfaceStates
{
  return self->_surfaceStates;
}

- (void)setSurfaceStates:(id)a3
{
  objc_storeStrong((id *)&self->_surfaceStates, a3);
}

- (OS_xpc_object)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remoteConnection, a3);
}

- (OS_dispatch_queue)disconnectedQueue
{
  return self->_disconnectedQueue;
}

- (void)setDisconnectedQueue:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectedQueue, a3);
}

- (id)disconnectedHandler
{
  return self->_disconnectedHandler;
}

- (void)setDisconnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectedHandler, 0);
  objc_storeStrong((id *)&self->_disconnectedQueue, 0);
  objc_storeStrong((id *)&self->_remoteConnection, 0);
  objc_storeStrong((id *)&self->_surfaceStates, 0);
}

- (void)_addSurface:(void *)a1 mappedAddress:(const char *)a2 mappedSize:extraData:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], v2, "Surface %d created by client pid=%d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeSurface:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], v2, "Surface %d released by client pid=%d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleMessage:(void *)a1 .cold.1(void *a1, const char *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 134218240;
  v3 = a2;
  v4 = 1024;
  v5 = OUTLINED_FUNCTION_6(a1, a2);
  _os_log_debug_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Received unknown client method %lu from client %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleMessage:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  char *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = _handleMessage__method_name[a1];
  v3 = 134218498;
  v4 = a1;
  v5 = 2080;
  v6 = v2;
  v7 = 1024;
  v8 = objc_msgSend(a2, "pid");
  _os_log_debug_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Received client method %lu (%s) from client %d", (uint8_t *)&v3, 0x1Cu);
}

@end
