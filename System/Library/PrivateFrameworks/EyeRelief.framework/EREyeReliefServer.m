@implementation EREyeReliefServer

+ (id)sharedServer
{
  if (sharedServer_once != -1)
    dispatch_once(&sharedServer_once, &__block_literal_global);
  return (id)sharedServer_instance;
}

void __33__EREyeReliefServer_sharedServer__block_invoke()
{
  EREyeReliefServer *v0;
  void *v1;

  v0 = objc_alloc_init(EREyeReliefServer);
  v1 = (void *)sharedServer_instance;
  sharedServer_instance = (uint64_t)v0;

}

- (EREyeReliefServer)init
{
  EREyeReliefServer *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EREyeReliefServer;
  v2 = -[EREyeReliefServer init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[EREyeReliefServer setClientConnections:](v2, "setClientConnections:", v3);

    v4 = dispatch_queue_create("com.apple.eyerelief.connectionqueue", 0);
    -[EREyeReliefServer setConnectionQueue:](v2, "setConnectionQueue:", v4);

  }
  return v2;
}

- (void)startServer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Starting up server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v3, 3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.eyereliefd"));
  -[EREyeReliefServer setListener:](self, "setListener:", v4);

  -[EREyeReliefServer listener](self, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[EREyeReliefServer listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  int v19;
  id location;
  _QWORD block[5];
  id v22;
  int v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.eyerelief.distancesampling"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) != 0)
  {
    EREyeReliefProtocolInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v11);

    objc_msgSend(v7, "setExportedObject:", self);
    -[EREyeReliefServer connectionQueue](self, "connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_250BBB8C8;
    v23 = v8;
    block[4] = self;
    v14 = v7;
    v22 = v14;
    dispatch_async(v12, block);

    objc_initWeak(&location, v14);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v17[3] = &unk_250BBB8F0;
    v17[4] = self;
    v19 = v8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v14, "setInvalidationHandler:", v17);
    objc_msgSend(v14, "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Rejecting client connection from pid %d: Client not permitted to activate distance sampling."), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v15, 1);

  }
  return v10;
}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Adding client connection from pid %d"), *(unsigned int *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v2, 3);

  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_3;
  block[3] = &unk_250BBB8F0;
  v5 = *(_DWORD *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing client connection from pid %d"), *(unsigned int *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v2, 3);

  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "removeObject:", WeakRetained);

}

- (void)toggleDistanceSampling:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EREyeReliefServer distanceSamplingToggleHandler](self, "distanceSamplingToggleHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EREyeReliefServer distanceSamplingToggleHandler](self, "distanceSamplingToggleHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distanceSamplingStatusHandler was nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v6, 3);

  }
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, BOOL, _QWORD))v8 + 2))(v8, v4 != 0, 0);
    v7 = v8;
  }

}

- (void)isDistanceSamplingEnabled:(id)a3
{
  void *v4;
  uint64_t (**v5)(void);
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[EREyeReliefServer isDistanceSamplingEnabledHandler](self, "isDistanceSamplingEnabledHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EREyeReliefServer isDistanceSamplingEnabledHandler](self, "isDistanceSamplingEnabledHandler");
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v6 = v5[2]();

    v7 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
    if (!v8)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v8)
  {
    v6 = 0;
LABEL_6:
    ((void (**)(id, uint64_t, _QWORD))v7)[2](v8, v6, 0);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  }
LABEL_7:

}

- (id)distanceSamplingToggleHandler
{
  return self->_distanceSamplingToggleHandler;
}

- (void)setDistanceSamplingToggleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)isDistanceSamplingEnabledHandler
{
  return self->_isDistanceSamplingEnabledHandler;
}

- (void)setIsDistanceSamplingEnabledHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_isDistanceSamplingEnabledHandler, 0);
  objc_storeStrong(&self->_distanceSamplingToggleHandler, 0);
}

@end
