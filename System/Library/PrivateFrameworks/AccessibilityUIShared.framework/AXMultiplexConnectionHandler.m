@implementation AXMultiplexConnectionHandler

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  -[AXMultiplexConnectionHandler connection](self, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AXMultiplexConnectionHandler connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = xpc_equal(v8, v9);
LABEL_8:
      LOBYTE(v14) = v10;
LABEL_12:

      goto LABEL_14;
    }
  }
  -[AXMultiplexConnectionHandler serviceConnection](self, "serviceConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v4, "serviceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[AXMultiplexConnectionHandler serviceConnection](self, "serviceConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);
      goto LABEL_8;
    }
  }
  -[AXMultiplexConnectionHandler processHandle](self, "processHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_13:
    LOBYTE(v14) = 0;
    goto LABEL_14;
  }
  v16 = (void *)v15;
  objc_msgSend(v4, "processHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AXMultiplexConnectionHandler processHandle](self, "processHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v8, "pid");
    objc_msgSend(v4, "processHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = (_DWORD)v14 == objc_msgSend(v9, "pid");
    goto LABEL_12;
  }
LABEL_14:

  return (char)v14;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v5;
  void *v6;
  void *v7;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v9;

  -[AXMultiplexConnectionHandler connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
    -[AXMultiplexConnectionHandler connection](self, "connection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    xpc_connection_get_audit_token();
  }
  else
  {
    -[AXMultiplexConnectionHandler processHandle](self, "processHandle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "auditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "realToken");
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }

  }
  return result;
}

- (int)pid
{
  void *v3;
  _xpc_connection_s *v4;
  pid_t pid;
  int v6;

  -[AXMultiplexConnectionHandler connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXMultiplexConnectionHandler connection](self, "connection");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid = xpc_connection_get_pid(v4);
  }
  else
  {
    -[AXMultiplexConnectionHandler processHandle](self, "processHandle");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid = -[_xpc_connection_s pid](v4, "pid");
  }
  v6 = pid;

  return v6;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)xpc_handler
{
  return self->_xpc_handler;
}

- (void)setXpc_handler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_processHandle, a3);
}

- (BSServiceConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong(&self->_xpc_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
