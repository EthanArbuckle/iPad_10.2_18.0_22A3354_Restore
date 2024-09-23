@implementation MSAutosaveSession

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__MSAutosaveSession_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __24__MSAutosaveSession_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (MSAutosaveSession)initWithIdentifier:(id)a3 remoteSession:(id)a4 remoteService:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSAutosaveSession *v12;
  MSAutosaveSession *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSAutosaveSession;
  v12 = -[MSAutosaveSession init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_autosaveIdentifier, a3);
    objc_storeStrong((id *)&v13->_remoteSession, a4);
    objc_storeStrong((id *)&v13->_remoteService, a5);
  }

  return v13;
}

- (void)didReconnectRemoteSession:(id)a3 remoteService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[MSAutosaveSession log](MSAutosaveSession, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[MSAutosaveSession autosaveIdentifier](self, "autosaveIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_INFO, "Reconnected to remote autosave session (autosaveID=%@)", (uint8_t *)&v10, 0xCu);

  }
  -[MSAutosaveSession setRemoteSession:](self, "setRemoteSession:", v6);
  -[MSAutosaveSession setRemoteService:](self, "setRemoteService:", v7);

}

- (void)remoteSessionDisconnectedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MSAutosaveSession log](MSAutosaveSession, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[MSAutosaveSession autosaveIdentifier](self, "autosaveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSAutosaveSession remoteSessionDisconnectedWithError:].cold.1(v6, v7, v8, v5);
  }

}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (MSDAutosaveSessionProtocol)remoteSession
{
  return self->_remoteSession;
}

- (void)setRemoteSession:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSession, a3);
}

- (MSDAutosaveProtocol)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_remoteSession, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

- (void)remoteSessionDisconnectedWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_20AC30000, log, OS_LOG_TYPE_ERROR, "Reconnecting to remote autosave session (autosaveID=%@) failed with error: %{public}@", buf, 0x16u);

}

@end
