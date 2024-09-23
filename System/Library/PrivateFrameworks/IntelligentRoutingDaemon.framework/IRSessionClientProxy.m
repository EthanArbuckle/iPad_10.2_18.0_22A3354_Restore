@implementation IRSessionClientProxy

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_didUpdateContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IRSessionClientProxy connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didUpdateContext:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (IRSessionClientProxy)initWithConnection:(id)a3
{
  id v4;
  IRSessionClientProxy *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  IRSessionClientProxy *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IRSessionClientProxy;
  v5 = -[IRSessionClientProxy init](&v16, sel_init);
  if (!v5)
    goto LABEL_8;
  if (v4)
    objc_msgSend(v4, "auditToken", (unsigned __int128)0, (unsigned __int128)0);
  v6 = xpc_copy_code_signing_identity_for_token();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        free(v7),
        !v8))
  {
    v13 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRSessionClientProxy initWithConnection:].cold.1(v13);
    goto LABEL_14;
  }
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.intelligentrouting.recommendationservice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    v14 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRSessionClientProxy initWithConnection:].cold.2(v14, v5);

LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  -[IRSessionClientProxy setConnection:](v5, "setConnection:", v4);
  objc_msgSend(v4, "_queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionClientProxy setQueue:](v5, "setQueue:", v11);

  -[IRSessionClientProxy setClientIdentifier:](v5, "setClientIdentifier:", v8);
LABEL_8:
  v12 = v5;
LABEL_15:

  return v12;
}

- (void)invalidateXPCConnection
{
  id v2;

  -[IRSessionClientProxy connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IRSessionClientProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sessionDidFailWithError:", v4);

  -[IRSessionClientProxy invalidateXPCConnection](self, "invalidateXPCConnection");
}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IRSessionClientProxy connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didSpotOnLocationComplete:", v4);

}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IRSessionClientProxy connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didUpdateBundlesWithSignificantInteractionPattern:", v4);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#server-client, [ErrorId - Missing signing identity] no signing identity for connection", v1, 2u);
}

- (void)initWithConnection:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_ERROR, "#server-client, [ErrorId - Missing entitlement] %@ is missing required entitlement, rejecting connection.", (uint8_t *)&v5, 0xCu);

}

@end
