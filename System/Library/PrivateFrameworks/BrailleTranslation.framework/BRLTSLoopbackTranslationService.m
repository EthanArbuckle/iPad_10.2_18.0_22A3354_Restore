@implementation BRLTSLoopbackTranslationService

- (NSXPCListener)listener
{
  NSXPCListener *listener;
  NSXPCListener *v4;
  NSXPCListener *v5;

  listener = self->_listener;
  if (!listener)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    -[NSXPCListener setDelegate:](v4, "setDelegate:", self);
    -[NSXPCListener resume](v4, "resume");
    v5 = self->_listener;
    self->_listener = v4;

    listener = self->_listener;
  }
  return listener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  BRLTLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = v5;
    v7 = v11;
    _os_log_impl(&dword_2114B8000, v6, OS_LOG_TYPE_DEFAULT, "%@: Accepting new connection: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "exportedInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v8);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
