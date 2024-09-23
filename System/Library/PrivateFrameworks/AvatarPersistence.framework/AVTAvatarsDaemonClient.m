@implementation AVTAvatarsDaemonClient

- (AVTAvatarsDaemonClient)initWithLogger:(id)a3
{
  return -[AVTAvatarsDaemonClient initWithConnectionFactory:logger:](self, "initWithConnectionFactory:logger:", &__block_literal_global_2, a3);
}

id __41__AVTAvatarsDaemonClient_initWithLogger___block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.avatar.support"), 0);
}

- (AVTAvatarsDaemonClient)initWithConnectionFactory:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  AVTAvatarsDaemonClient *v8;
  uint64_t v9;
  id connectionFactory;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarsDaemonClient;
  v8 = -[AVTAvatarsDaemonClient init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    connectionFactory = v8->_connectionFactory;
    v8->_connectionFactory = (id)v9;

    objc_storeStrong((id *)&v8->_logger, a4);
  }

  return v8;
}

- (void)performWorkWithConnection:(id)a3
{
  void (**v4)(id, void *);
  void (**v5)(void);
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = (void (**)(id, void *))a3;
  -[AVTAvatarsDaemonClient connectionFactory](self, "connectionFactory");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarsDaemonClient logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke;
  v17[3] = &unk_24DD31D38;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v6, "setInterruptionHandler:", v17);
  v12 = v8;
  v13 = 3221225472;
  v14 = __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke_2;
  v15 = &unk_24DD31D38;
  v16 = v9;
  v10 = v9;
  objc_msgSend(v6, "setInvalidationHandler:", &v12);
  +[AVTAvatarsDaemon xpcInterface](AVTAvatarsDaemon, "xpcInterface", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v11);

  objc_msgSend(v6, "resume");
  v4[2](v4, v6);

  objc_msgSend(v6, "invalidate");
}

uint64_t __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAvatarsDaemonClientConnectionInterrupted");
}

uint64_t __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAvatarsDaemonClientConnectionInvalidated");
}

- (void)performWorkWithSynchronousProxy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[AVTAvatarsDaemonClient logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke;
  v8[3] = &unk_24DD31D88;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[AVTAvatarsDaemonClient performWorkWithConnection:](self, "performWorkWithConnection:", v8);

}

void __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke_2;
  v5[3] = &unk_24DD31D60;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logErrorGettingAvatarsDaemonClientProxy:", v3);

}

- (void)checkIn
{
  void *v3;
  _QWORD v4[5];

  -[AVTAvatarsDaemonClient logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__AVTAvatarsDaemonClient_checkIn__block_invoke;
  v4[3] = &unk_24DD31C40;
  v4[4] = self;
  objc_msgSend(v3, "checkingIn:", v4);

}

uint64_t __33__AVTAvatarsDaemonClient_checkIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWorkWithSynchronousProxy:", &__block_literal_global_7);
}

uint64_t __33__AVTAvatarsDaemonClient_checkIn__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkIn");
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (id)connectionFactory
{
  return self->_connectionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
