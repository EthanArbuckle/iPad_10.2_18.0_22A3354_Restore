@implementation CDPDAuthObserver

- (CDPDAuthObserver)init
{
  CDPDAuthObserver *v2;
  uint64_t v3;
  NSMutableArray *authListeners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDAuthObserver;
  v2 = -[CDPDAuthObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    authListeners = v2->_authListeners;
    v2->_authListeners = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)registerListener:(id)a3
{
  -[NSMutableArray addObject:](self->_authListeners, "addObject:", a3);
}

- (void)eventReceived:(const char *)a3 eventInfo:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSMutableArray *authListeners;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = (uint64_t)a3;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Received Auth Notification %s, with userInfo %@\", buf, 0x16u);
  }

  if (!strcmp((const char *)objc_msgSend((id)*MEMORY[0x24BE0AC80], "UTF8String"), a3))
  {
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BE0AC78]);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BE0AC88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        v17 = 1752392040;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Detected security level change for %{mask.hash}@\", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BE1A3F8], "contextForAccountWithAltDSID:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      authListeners = self->_authListeners;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __44__CDPDAuthObserver_eventReceived_eventInfo___block_invoke;
      v14[3] = &unk_24C81CE38;
      v15 = v12;
      v11 = v12;
      -[NSMutableArray enumerateObjectsUsingBlock:](authListeners, "enumerateObjectsUsingBlock:", v14);

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CDPDAuthObserver eventReceived:eventInfo:].cold.1((uint64_t)a3, v11);
    }

  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDAuthObserver eventReceived:eventInfo:].cold.2((uint64_t)a3, v8);
  }

}

uint64_t __44__CDPDAuthObserver_eventReceived_eventInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "securityLevelChangedForAccountContext:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authListeners, 0);
}

- (void)eventReceived:(uint64_t)a1 eventInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Auth observer ignoring %s, securityLevel %@\", (uint8_t *)&v2, 0x16u);
}

- (void)eventReceived:(uint64_t)a1 eventInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Auth observer ignoring: %s\", (uint8_t *)&v2, 0xCu);
}

@end
