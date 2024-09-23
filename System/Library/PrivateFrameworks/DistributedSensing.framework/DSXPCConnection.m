@implementation DSXPCConnection

- (void)activate
{
  OS_xpc_object *xpcConnection;
  uint64_t v4;
  int pid;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  _QWORD handler[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __27__DSXPCConnection_activate__block_invoke;
    handler[3] = &unk_24D9109E8;
    handler[4] = self;
    xpc_connection_set_event_handler(xpcConnection, handler);
    xpc_connection_set_target_queue(self->_xpcConnection, (dispatch_queue_t)self->_dispatchQueue);
    xpc_connection_activate(self->_xpcConnection);
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v4 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      *(_DWORD *)buf = 67109120;
      v13 = pid;
      v6 = "DSXPCConnection activated for PID: %d";
      v7 = v4;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 8;
LABEL_10:
      _os_log_impl(&dword_217E3C000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v10 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "xpc connection not set";
      v7 = v10;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 2;
      goto LABEL_10;
    }
  }
}

uint64_t __27__DSXPCConnection_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcEventHandler:", a2);
}

- (void)invalidate
{
  OS_xpc_object *xpcConnection;
  _xpc_connection_s *v4;
  OS_xpc_object *v5;
  DSKappaSession *kappaSession;
  DSMotionSession *motionSession;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = xpcConnection;
    xpc_connection_cancel(v4);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  kappaSession = self->_kappaSession;
  if (kappaSession)
  {
    self->_isEntitledForKappa = 0;
    self->_kappaSession = 0;

  }
  motionSession = self->_motionSession;
  if (motionSession)
  {
    self->_isEntitledForMotion = 0;
    self->_motionSession = 0;

  }
  -[DSXPCServer removeXPCConnection:](self->_xpcDaemonServer, "removeXPCConnection:", self);
}

- (void)_xpcEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int pid;
  OS_xpc_object *xpcConnection;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x24BDACF38])
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v8 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      v11 = 67109120;
      LODWORD(v12) = pid;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidated for pid: %d", (uint8_t *)&v11, 8u);
    }
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    -[DSXPCConnection invalidate](self, "invalidate");
  }
  else if (MEMORY[0x219A18A58](v4) == MEMORY[0x24BDACFA0])
  {
    -[DSXPCConnection _handleXPCMessage:](self, "_handleXPCMessage:", v5);
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v6 = (void *)logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v11 = 136315138;
      v12 = MEMORY[0x219A18998](v5);
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "Invalid XPC Message :%s", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)_handleXPCMessage:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  string = xpc_dictionary_get_string(v4, "kDSXPCMsg");
  if (!string)
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v11 = logObjDSXPCConnection;
    if (!os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)v13 = 0;
    v8 = "No message type in XPC";
    v9 = v11;
    v10 = 2;
    goto LABEL_15;
  }
  v6 = string;
  if (!strcmp(string, "kDSKappaActivate"))
  {
    -[DSXPCConnection _activateKappaSessionMessage:](self, "_activateKappaSessionMessage:", v4);
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSKappaUpdate"))
  {
    -[DSXPCConnection _updateCoordinationStatusMessage:](self, "_updateCoordinationStatusMessage:", v4);
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSMotionActivate"))
  {
    -[DSXPCConnection _activateMotionSessionMessage:](self, "_activateMotionSessionMessage:", v4);
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSMotionUpdate"))
  {
    -[DSXPCConnection _updateVehicleStateMessage:](self, "_updateVehicleStateMessage:", v4);
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSCohortPrint"))
  {
    -[DSXPCConnection _printCohortMessage:](self, "_printCohortMessage:", v4);
    goto LABEL_22;
  }
  if (onceTokenDSXPCConnection != -1)
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  v7 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)&v13[4] = v6;
    v8 = "Unknown message type in XPC: %s";
    v9 = v7;
    v10 = 12;
LABEL_15:
    _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, v8, v13, v10);
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0, *(_OWORD *)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSXPCConnection _xpcSendReplyForMessage:error:](self, "_xpcSendReplyForMessage:error:", v4, v12);

LABEL_22:
}

- (void)_xpcSendReplyForMessage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  void *v10;
  id v11;
  id v12;
  xpc_object_t v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t v22[16];
  uint8_t buf[2];
  __int16 v24;

  v6 = a3;
  v7 = a4;
  if ((xpc_dictionary_expects_reply() & 1) != 0)
  {
    if (self->_xpcConnection)
    {
      reply = xpc_dictionary_create_reply(v6);
      v9 = reply;
      if (reply)
      {
        if (v7)
        {
          v21 = v7;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v21;

          if (v10)
          {
            v12 = objc_retainAutorelease(v10);
            v13 = xpc_data_create((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
            xpc_dictionary_set_value(v9, "kDSXPCErrorData", v13);

          }
          xpc_dictionary_set_string(v9, "kDSXPCMsg", "kDSXPCError");

        }
        else
        {
          xpc_dictionary_set_string(reply, "kDSXPCMsg", "kDSXPCSuccess");
          v11 = 0;
        }
        xpc_connection_send_message(self->_xpcConnection, v9);
        v7 = v11;
      }
      else
      {
        if (onceTokenDSXPCConnection != -1)
          dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
        v20 = logObjDSXPCConnection;
        if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_217E3C000, v20, OS_LOG_TYPE_ERROR, "Send reply error: reply creation error", v22, 2u);
        }
      }

      goto LABEL_24;
    }
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v19 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Send reply error: no connection";
      v16 = buf;
      v17 = v19;
      v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v14 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v15 = "XPC message does not expect reply";
      v16 = (uint8_t *)&v24;
      v17 = v14;
      v18 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_217E3C000, v17, v18, v15, v16, 2u);
    }
  }
LABEL_24:

}

- (void)_xpcConnectionSendEvent:(id)a3
{
  OS_xpc_object *xpcConnection;
  NSObject *v4;
  uint8_t v5[16];

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_send_message(xpcConnection, a3);
  }
  else
  {
    DSLogObjectForCategory_DSXPCConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_ERROR, "Send reply error: no connection", v5, 2u);
    }

  }
}

- (void)_checkEntitlement:(const char *)a3 error:(id *)a4
{
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = v7;
  v14 = v7;
  xpc_connection_get_audit_token();
  v8 = (void *)xpc_copy_entitlement_for_token();
  v9 = v8;
  if (v8 && xpc_dictionary_get_BOOL(v8, a3))
  {
    if (!strcmp(a3, "com.apple.distributedsensingd-kappa"))
    {
      self->_isEntitledForKappa = 1;
    }
    else if (!strcmp(a3, "com.apple.distributedsensingd-motionState"))
    {
      self->_isEntitledForMotion = 1;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = CFSTR("Entitlement Missing");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v12);

  }
}

- (void)_activateKappaSessionMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  DSKappaSession *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int pid;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke;
  v23[3] = &unk_24D910EE8;
  v23[4] = self;
  v6 = (void *)MEMORY[0x219A18818](v23);
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_2;
  v22[3] = &unk_24D910EE8;
  v22[4] = self;
  v7 = (void *)MEMORY[0x219A18818](v22);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_3;
  v21[3] = &unk_24D910EE8;
  v21[4] = self;
  v8 = (void *)MEMORY[0x219A18818](v21);
  v20 = 0;
  -[DSXPCConnection _checkEntitlement:error:](self, "_checkEntitlement:error:", "com.apple.distributedsensingd-kappa", &v20);
  v9 = v20;
  if (self->_isEntitledForKappa)
  {
    v19 = v9;
    v10 = -[DSKappaSession initWithXPCObject:error:]([DSKappaSession alloc], "initWithXPCObject:error:", v4, &v19);
    v11 = v19;

    if (v10)
    {
      -[DSKappaSession setDeviceFoundHandler:](v10, "setDeviceFoundHandler:", v6);
      -[DSKappaSession setDeviceLostHandler:](v10, "setDeviceLostHandler:", v7);
      -[DSKappaSession setDeviceChangedHandler:](v10, "setDeviceChangedHandler:", v8);
      objc_storeStrong((id *)&self->_kappaSession, v10);
      v12 = -[DSKappaSession coordinationStatus](v10, "coordinationStatus");
      -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCoordinationStatus:", v12);

      v14 = -[DSKappaSession tiebreaker](v10, "tiebreaker");
      -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTiebreaker:", v14);

      -[DSXPCServer updateAdvertiser](self->_xpcDaemonServer, "updateAdvertiser");
      -[DSXPCServer updateScanner](self->_xpcDaemonServer, "updateScanner");
    }
    else
    {
      DSLogObjectForCategory_DSXPCConnection();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = pid;
        _os_log_impl(&dword_217E3C000, v17, OS_LOG_TYPE_ERROR, "Error creating Kappa Session for pid %d", buf, 8u);
      }

      v10 = 0;
    }
    v9 = v11;
  }
  else
  {
    DSLogObjectForCategory_DSXPCConnection();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "com.apple.distributedsensingd-kappa";
      _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", buf, 0xCu);
    }

    v10 = 0;
  }
  -[DSXPCConnection _xpcSendReplyForMessage:error:](self, "_xpcSendReplyForMessage:error:", v4, v9);

}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceFoundHandler:", a2);
}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceLostHandler:", a2);
}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceChangedHandler:", a2);
}

- (void)_updateCoordinationStatusMessage:(id)a3
{
  id v4;
  DSKappaSession *v5;
  NSObject *p_super;
  uint64_t v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int pid;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_isEntitledForKappa)
  {
    DSLogObjectForCategory_DSXPCConnection();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v14 = 136315138;
    v15 = "com.apple.distributedsensingd-kappa";
    v9 = "Missing entitlement :%s";
    v10 = p_super;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
LABEL_9:
    _os_log_impl(&dword_217E3C000, v10, v11, v9, (uint8_t *)&v14, v12);
    goto LABEL_4;
  }
  v5 = -[DSKappaSession initWithXPCObject:error:]([DSKappaSession alloc], "initWithXPCObject:error:", v4, 0);
  if (!v5)
  {
    DSLogObjectForCategory_DSXPCConnection();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    pid = self->_pid;
    v14 = 67109120;
    LODWORD(v15) = pid;
    v9 = "Error creating Kappa Session for pid %d";
    v10 = p_super;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 8;
    goto LABEL_9;
  }
  p_super = &v5->super;
  -[DSKappaSession setCoordinationStatus:](self->_kappaSession, "setCoordinationStatus:", -[DSKappaSession coordinationStatus](v5, "coordinationStatus"));
  v7 = -[NSObject coordinationStatus](p_super, "coordinationStatus");
  -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinationStatus:", v7);

  -[DSXPCServer updateAdvertiser](self->_xpcDaemonServer, "updateAdvertiser");
LABEL_4:

}

- (void)_activateMotionSessionMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  DSMotionSession *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int pid;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke;
  v41[3] = &unk_24D910EE8;
  v41[4] = self;
  v6 = (void *)MEMORY[0x219A18818](v41);
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_2;
  v40[3] = &unk_24D910EE8;
  v40[4] = self;
  v7 = (void *)MEMORY[0x219A18818](v40);
  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_3;
  v39[3] = &unk_24D910EE8;
  v39[4] = self;
  v8 = (void *)MEMORY[0x219A18818](v39);
  v38 = 0;
  -[DSXPCConnection _checkEntitlement:error:](self, "_checkEntitlement:error:", "com.apple.distributedsensingd-motionState", &v38);
  v9 = v38;
  if (self->_isEntitledForMotion)
  {
    v37 = v9;
    v10 = -[DSMotionSession initWithXPCObject:error:]([DSMotionSession alloc], "initWithXPCObject:error:", v4, &v37);
    v11 = v37;

    if (v10)
    {
      -[DSMotionSession setDeviceFoundHandler:](v10, "setDeviceFoundHandler:", v6);
      -[DSMotionSession setDeviceLostHandler:](v10, "setDeviceLostHandler:", v8);
      -[DSMotionSession setDeviceChangedHandler:](v10, "setDeviceChangedHandler:", v7);
      objc_storeStrong((id *)&self->_motionSession, v10);
      v12 = -[DSMotionSession vehicleState](v10, "vehicleState");
      -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVehicleState:", v12);

      v14 = -[DSMotionSession vehicleConfidence](v10, "vehicleConfidence");
      -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVehicleConfidence:", v14);

      -[DSXPCServer updateAdvertiser](self->_xpcDaemonServer, "updateAdvertiser");
      -[DSXPCServer updateScanner](self->_xpcDaemonServer, "updateScanner");
    }
    else
    {
      DSLogObjectForCategory_DSXPCConnection();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        LODWORD(v44) = pid;
        _os_log_impl(&dword_217E3C000, v27, OS_LOG_TYPE_ERROR, "Error creating Motion Session for pid %d", buf, 8u);
      }

      v10 = 0;
    }
    v9 = v11;
  }
  else
  {
    DSLogObjectForCategory_DSXPCConnection();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "com.apple.distributedsensingd-motionState";
      _os_log_impl(&dword_217E3C000, v26, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", buf, 0xCu);
    }

    v10 = 0;
  }
  -[DSXPCConnection _xpcSendReplyForMessage:error:](self, "_xpcSendReplyForMessage:error:", v4, v9);
  if (!v9)
  {
    v29 = v8;
    v30 = v7;
    v31 = v6;
    v32 = v4;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[DSXPCServer cohortManager](self->_xpcDaemonServer, "cohortManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "devices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21);
          -[DSXPCServer cohortManager](self->_xpcDaemonServer, "cohortManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "devices");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSXPCConnection _deviceFoundHandler:](self, "_deviceFoundHandler:", v25);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v19);
    }

    v6 = v31;
    v4 = v32;
    v8 = v29;
    v7 = v30;
  }

}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceFoundHandler:", a2);
}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceChangedHandler:", a2);
}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceLostHandler:", a2);
}

- (void)_updateVehicleStateMessage:(id)a3
{
  id v4;
  DSMotionSession *v5;
  NSObject *p_super;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int pid;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_isEntitledForMotion)
  {
    DSLogObjectForCategory_DSXPCConnection();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v16 = 136315138;
    v17 = "com.apple.distributedsensingd-motionState";
    v11 = "Missing entitlement :%s";
    v12 = p_super;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 12;
LABEL_9:
    _os_log_impl(&dword_217E3C000, v12, v13, v11, (uint8_t *)&v16, v14);
    goto LABEL_4;
  }
  v5 = -[DSMotionSession initWithXPCObject:error:]([DSMotionSession alloc], "initWithXPCObject:error:", v4, 0);
  if (!v5)
  {
    DSLogObjectForCategory_DSXPCConnection();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    pid = self->_pid;
    v16 = 67109120;
    LODWORD(v17) = pid;
    v11 = "Error creating Motion Session for pid %d";
    v12 = p_super;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 8;
    goto LABEL_9;
  }
  p_super = &v5->super;
  v7 = -[DSMotionSession vehicleState](v5, "vehicleState");
  -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVehicleState:", v7);

  v9 = -[NSObject vehicleConfidence](p_super, "vehicleConfidence");
  -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVehicleConfidence:", v9);

  -[DSXPCServer updateAdvertiser](self->_xpcDaemonServer, "updateAdvertiser");
LABEL_4:

}

- (void)_printCohortMessage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceTokenDSXPCConnection != -1)
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  v5 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "print cohort message", (uint8_t *)&v7, 2u);
  }
  if (self->_isEntitledForMotion)
  {
    -[DSXPCServer cohortManager](self->_xpcDaemonServer, "cohortManager");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject printConsensusData](v6, "printConsensusData");
  }
  else
  {
    DSLogObjectForCategory_DSXPCConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "com.apple.distributedsensingd-motionState";
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_xpcCohortDeviceMessage:(id)a3 type:(const char *)a4
{
  id v6;
  NSObject *v7;
  xpc_object_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (onceTokenDSXPCConnection != -1)
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  v7 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = a4;
    _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "xpc send message: %s", (uint8_t *)&v9, 0xCu);
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "kDSXPCMsg", a4);
  objc_msgSend(v6, "encodeSelf:", v8);
  -[DSXPCConnection _xpcConnectionSendEvent:](self, "_xpcConnectionSendEvent:", v8);

}

- (void)_deviceFoundHandler:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *deviceDictionary;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    deviceDictionary = self->_deviceDictionary;
    if (!deviceDictionary)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v8 = self->_deviceDictionary;
      self->_deviceDictionary = v7;

      deviceDictionary = self->_deviceDictionary;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDictionary, "setObject:forKeyedSubscript:", v4, v5);
    -[DSXPCConnection _xpcCohortDeviceMessage:type:](self, "_xpcCohortDeviceMessage:type:", v4, "kDSXPCDeviceFound");
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v9 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "missing identifier in Device Found", v10, 2u);
    }
  }

}

- (void)_deviceChangedHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *deviceDictionary;
  const char *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    deviceDictionary = self->_deviceDictionary;
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDictionary, "setObject:forKeyedSubscript:", v4, v5);
      v8 = "kDSXPCDeviceChanged";
    }
    else
    {
      if (!deviceDictionary)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v11 = self->_deviceDictionary;
        self->_deviceDictionary = v10;

        deviceDictionary = self->_deviceDictionary;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDictionary, "setObject:forKeyedSubscript:", v4, v5);
      v8 = "kDSXPCDeviceFound";
    }
    -[DSXPCConnection _xpcCohortDeviceMessage:type:](self, "_xpcCohortDeviceMessage:type:", v4, v8);
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v9 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "missing identifier in Device Changed", v12, 2u);
    }
  }

}

- (void)_deviceLostHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDictionary, "setObject:forKeyedSubscript:", 0, v5);
      -[DSXPCConnection _xpcCohortDeviceMessage:type:](self, "_xpcCohortDeviceMessage:type:", v4, "kDSXPCDeviceLost");
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1)
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    v7 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_ERROR, "missing identifier in Device Lost", v8, 2u);
    }
  }

}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDaemonServer, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (DSKappaSession)kappaSession
{
  return self->_kappaSession;
}

- (void)setKappaSession:(id)a3
{
  objc_storeStrong((id *)&self->_kappaSession, a3);
}

- (DSMotionSession)motionSession
{
  return self->_motionSession;
}

- (void)setMotionSession:(id)a3
{
  objc_storeStrong((id *)&self->_motionSession, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionSession, 0);
  objc_storeStrong((id *)&self->_kappaSession, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
}

@end
