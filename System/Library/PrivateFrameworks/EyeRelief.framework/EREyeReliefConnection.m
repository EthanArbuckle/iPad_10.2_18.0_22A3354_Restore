@implementation EREyeReliefConnection

+ (id)sharedConnection
{
  if (sharedConnection_once != -1)
    dispatch_once(&sharedConnection_once, &__block_literal_global_1);
  return (id)sharedConnection_instance;
}

void __41__EREyeReliefConnection_sharedConnection__block_invoke()
{
  EREyeReliefConnection *v0;
  void *v1;

  v0 = objc_alloc_init(EREyeReliefConnection);
  v1 = (void *)sharedConnection_instance;
  sharedConnection_instance = (uint64_t)v0;

}

- (EREyeReliefConnection)connectionWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke;
  block[3] = &unk_250BBB9E0;
  block[4] = self;
  if (connectionWithErrorHandler__onceToken != -1)
    dispatch_once(&connectionWithErrorHandler__onceToken, block);
  -[EREyeReliefConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_6;
  v10[3] = &unk_250BBBA08;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (EREyeReliefConnection *)v8;
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.eyereliefd"), 0);
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", v2);

  EREyeReliefProtocolInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_2);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_2()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_3);
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Connection interrupted"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v0, 1);

}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_4()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_8);
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Connection invalidated"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v0, 1);

}

uint64_t __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)toggleDistanceSampling:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__EREyeReliefConnection_toggleDistanceSampling___block_invoke;
  v7[3] = &unk_250BBBA08;
  v8 = v4;
  v5 = v4;
  -[EREyeReliefConnection connectionWithErrorHandler:](self, "connectionWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toggleDistanceSampling:", v5);

}

void __48__EREyeReliefConnection_toggleDistanceSampling___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("toggleDistanceSampling: EREyeReliefConnection error: %@"), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v3, 1);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

}

- (void)isDistanceSamplingEnabled:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__EREyeReliefConnection_isDistanceSamplingEnabled___block_invoke;
  v7[3] = &unk_250BBBA08;
  v8 = v4;
  v5 = v4;
  -[EREyeReliefConnection connectionWithErrorHandler:](self, "connectionWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isDistanceSamplingEnabled:", v5);

}

void __51__EREyeReliefConnection_isDistanceSamplingEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isDistanceSamplingEnabled: EREyeReliefConnection error: %@"), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v3, 1);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
