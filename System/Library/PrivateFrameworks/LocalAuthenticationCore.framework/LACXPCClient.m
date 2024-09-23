@implementation LACXPCClient

- (LACXPCClient)initWithConnection:(id)a3
{
  id v4;
  LACXPCClient *v5;
  LACXPCClient *v6;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_auditToken;
  uid_t v8;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LACXPCClient;
  v5 = -[LACXPCClient init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    p_auditToken = &v6->_auditToken;
    if (v4)
    {
      v6->_processId = objc_msgSend(v4, "processIdentifier");
      objc_msgSend(v4, "auditToken");
      *(_OWORD *)p_auditToken->val = v10;
      *(_OWORD *)&v6->_auditToken.val[4] = v11;
      v8 = objc_msgSend(v4, "effectiveUserIdentifier");
    }
    else
    {
      v6->_processId = getpid();
      *(_OWORD *)p_auditToken->val = 0u;
      *(_OWORD *)&v6->_auditToken.val[4] = 0u;
      v8 = geteuid();
    }
    v6->_userId = v8;
  }

  return v6;
}

- (LACXPCClient)initWithProcessId:(int)a3 auditToken:(id *)a4 userId:(unsigned int)a5
{
  LACXPCClient *result;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LACXPCClient;
  result = -[LACXPCClient init](&v10, sel_init);
  if (result)
  {
    result->_processId = a3;
    v9 = *(_OWORD *)a4->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)result->_auditToken.val = v9;
    result->_userId = a5;
  }
  return result;
}

- (BOOL)checkEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[LACXPCClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[LACXPCClient connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForEntitlement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (unsigned)userId
{
  return self->_userId;
}

- (void)setUserId:(unsigned int)a3
{
  self->_userId = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
