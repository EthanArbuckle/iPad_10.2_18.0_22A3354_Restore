@implementation PHASEXPCService

+ (id)sharedInstance
{
  void *v2;
  PHASEXPCService *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Phase::Logger *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)sPhaseService;
  if (!sPhaseService)
  {
    v3 = [PHASEXPCService alloc];
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PHASEXPCService initWithXPCListener:](v3, "initWithXPCListener:", v4);
    v6 = (void *)sPhaseService;
    sPhaseService = v5;

    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 848));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "PHASEXPCService.mm";
      v12 = 1024;
      v13 = 57;
      v14 = 2048;
      v15 = sPhaseService;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: created service@%p with anonymous listener", (uint8_t *)&v10, 0x1Cu);
    }
    gInProcessServer = 1;
    v2 = (void *)sPhaseService;
  }
  return v2;
}

+ (id)sharedInstanceWithPlatform:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  Phase::Logger *v8;
  Phase::Logger *v9;
  NSObject *v10;
  id v11;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = sPhaseService;
  if (sPhaseService
    || (+[PHASEXPCService sharedInstance](PHASEXPCService, "sharedInstance"),
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)sPhaseService,
        sPhaseService = v6,
        v7,
        (v5 = sPhaseService) != 0))
  {
    objc_storeStrong((id *)(v5 + 32), a3);
    v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 848));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315906;
      v15 = "PHASEXPCService.mm";
      v16 = 1024;
      v17 = 104;
      v18 = 2048;
      v19 = sPhaseService;
      v20 = 2048;
      v21 = v4;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: set service@%p with platform@%p", (uint8_t *)&v14, 0x26u);
    }
    v11 = (id)sPhaseService;
  }
  else
  {
    v13 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v8) + 848));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "PHASEXPCService.mm";
      v16 = 1024;
      v17 = 90;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d xpcserver: Error creating service!", (uint8_t *)&v14, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

- (PHASEXPCService)init
{
  -[PHASEXPCService doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PHASEXPCService)initWithXPCListener:(id)a3
{
  id v5;
  void *v6;
  PHASEXPCService *v7;
  PHASEXPCService *v8;
  PHASEPlatform *platform;
  PHASEXPCService *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
    std::terminate();
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)PHASEXPCService;
  v7 = -[PHASEXPCService init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_connectionUIDGenerator = 1;
    ihdYoUjk3kGK = getpid();
    platform = v8->_platform;
    v8->_platform = 0;

    objc_storeStrong((id *)&v8->_mainListener, a3);
    -[NSXPCListener setDelegate:](v8->_mainListener, "setDelegate:", v8);
    v10 = v8;
  }

  return v8;
}

- (void)resumeListener
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  PHASEXPCService *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 848));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315906;
    v5 = "PHASEXPCService.mm";
    v6 = 1024;
    v7 = 147;
    v8 = 2048;
    v9 = self;
    v10 = 1024;
    v11 = ihdYoUjk3kGK;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: service@%p (server pid %d) - resuming listener", (uint8_t *)&v4, 0x22u);
  }
  -[NSXPCListener resume](self->_mainListener, "resume");
}

- (unint64_t)newConnectionUID
{
  unint64_t connectionUIDGenerator;

  connectionUIDGenerator = self->_connectionUIDGenerator;
  self->_connectionUIDGenerator = connectionUIDGenerator + 1;
  return connectionUIDGenerator;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 848));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "PHASEXPCService.mm";
    v8 = 1024;
    v9 = 271;
    _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: not setup to accept any connection to PhaseXPCService!", (uint8_t *)&v6, 0x12u);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_mainListener, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
