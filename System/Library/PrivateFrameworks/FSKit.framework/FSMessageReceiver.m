@implementation FSMessageReceiver

- (FSMessageReceiver)initWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5
{
  id v8;
  id v9;
  id v10;
  FSMessageReceiver *v11;
  uint64_t v12;
  NSXPCListener *listener;
  uint64_t v14;
  NSXPCListenerEndpoint *endpoint;
  FSMessageReceiverDelegateWrapper *v16;
  FSMessageReceiverDelegateWrapper *delegateWrapper;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FSMessageReceiver;
  v11 = -[FSMessageReceiver init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v12 = objc_claimAutoreleasedReturnValue();
    listener = v11->_listener;
    v11->_listener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v11->_listener, "setDelegate:", v11);
    -[NSXPCListener endpoint](v11->_listener, "endpoint");
    v14 = objc_claimAutoreleasedReturnValue();
    endpoint = v11->_endpoint;
    v11->_endpoint = (NSXPCListenerEndpoint *)v14;

    -[NSXPCListener resume](v11->_listener, "resume");
    v16 = -[FSMessageReceiverDelegateWrapper initWithDelegate:Locale:preferredLanguages:]([FSMessageReceiverDelegateWrapper alloc], "initWithDelegate:Locale:preferredLanguages:", v8, v9, v10);
    delegateWrapper = v11->_delegateWrapper;
    v11->_delegateWrapper = v16;

  }
  return v11;
}

+ (id)receiverWithDelegate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "receiverWithDelegate:locale:preferredLanguages:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)receiverWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:locale:preferredLanguages:", v10, v9, v8);

  return v11;
}

+ (id)receiverForStandardIO:(id)a3
{
  void *v4;
  void *v5;

  +[FSMessageSTDIODelegate delegateWithCompletionHandler:](FSMessageSTDIODelegate, "delegateWithCompletionHandler:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "receiverWithDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getConnection
{
  FSMessageConnection *v3;

  v3 = -[FSMessageConnection initWithEndpoint:]([FSMessageConnection alloc], "initWithEndpoint:", self->_endpoint);
  -[FSMessageConnection setReceiver:](v3, "setReceiver:", self);
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  +[FSKitConstants FSTaskOperations](FSKitConstants, "FSTaskOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self->_delegateWrapper);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __56__FSMessageReceiver_listener_shouldAcceptNewConnection___block_invoke;
  v14 = &unk_250C31E00;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v11);
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  fskit_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FSMessageReceiver listener:shouldAcceptNewConnection:].cold.1(v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __56__FSMessageReceiver_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "delegateWrapper");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    objc_msgSend(v7, "delegateWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) != 0)
    {
      fs_errorForCocoaError(4099);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "completed:reply:", v5, &__block_literal_global_76);
LABEL_6:

      WeakRetained = v7;
      goto LABEL_7;
    }
    v6 = objc_opt_respondsToSelector();

    WeakRetained = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "delegateWrapper");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      fs_errorForCocoaError(4099);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "completed:replyHandler:", v5, &__block_literal_global_77);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (FSMessageReceiverDelegateWrapper)delegateWrapper
{
  return (FSMessageReceiverDelegateWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)didStart
{
  -[FSMessageReceiverDelegateWrapper didStart](self->_delegateWrapper, "didStart");
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FSMessageReceiver listener:shouldAcceptNewConnection:]";
  _os_log_debug_impl(&dword_23B2A6000, log, OS_LOG_TYPE_DEBUG, "%s:connection:accept", (uint8_t *)&v1, 0xCu);
}

@end
