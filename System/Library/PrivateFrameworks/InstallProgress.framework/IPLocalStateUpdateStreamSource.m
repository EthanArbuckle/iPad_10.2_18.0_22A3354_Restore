@implementation IPLocalStateUpdateStreamSource

- (IPLocalStateUpdateStreamSource)initWithUpdateStream:(id)a3
{
  id v4;
  IPLocalStateUpdateStreamSource *v5;
  IPLocalStateUpdateStreamSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPLocalStateUpdateStreamSource;
  v5 = -[IPLocalStateUpdateStreamSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakStream, v4);
    v6->_resumed = 0;
  }

  return v6;
}

- (void)resume
{
  self->_resumed = 1;
}

- (void)stream:(id)a3 receiveMessage:(id)a4
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (self->_resumed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stateUpdateStreamSource:updateMessageReceived:", self, v5);

  }
  else
  {
    _IPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_23F108000, v7, OS_LOG_TYPE_DEFAULT, "unresumed local source ignoring incoming message %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (IPStateUpdateStreamSourceDelegate)delegate
{
  return (IPStateUpdateStreamSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_weakStream);
}

@end
