@implementation AVTAvatarsDaemonServer

- (AVTAvatarsDaemonServer)initWithLogger:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  AVTAvatarsDaemonServer *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", CFSTR("com.apple.avatar.support"));
  v7 = -[AVTAvatarsDaemonServer initWithListener:logger:](self, "initWithListener:logger:", v6, v5);

  return v7;
}

- (AVTAvatarsDaemonServer)initWithListener:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  AVTAvatarsDaemonServer *v9;
  AVTAvatarsDaemonServer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarsDaemonServer;
  v9 = -[AVTAvatarsDaemonServer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a4);
    objc_storeStrong((id *)&v10->_listener, a3);
    -[NSXPCListener setDelegate:](v10->_listener, "setDelegate:", v10);
  }

  return v10;
}

- (void)startListening
{
  id v2;

  -[AVTAvatarsDaemonServer listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[AVTAvatarsDaemonServer logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logAvatarsDaemonReceivesIncomingConnection");

  +[AVTAvatarsDaemon xpcInterface](AVTAvatarsDaemon, "xpcInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)checkIn
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "processIdentifier");

  -[AVTAvatarsDaemonServer logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logAvatarsDaemonClientChecksIn:", v4);

  -[AVTAvatarsDaemonServer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientDidCheckInForServer:", self);

}

- (AVTAvatarsDaemonServerDelegate)delegate
{
  return (AVTAvatarsDaemonServerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
