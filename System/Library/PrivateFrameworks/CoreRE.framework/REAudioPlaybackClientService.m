@implementation REAudioPlaybackClientService

- (REAudioPlaybackClientService)initWithXPCEndpoint:(id)a3 queue:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  id v10;
  REAudioPlaybackClientService *v11;
  REAudioPlaybackClientService *v12;
  id v13;
  uint64_t v14;
  NSXPCConnection *connection;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)REAudioPlaybackClientService;
  v11 = -[REAudioPlaybackClientService init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_service, a5);
    v13 = objc_alloc_init(MEMORY[0x24BDD19A0]);
    objc_msgSend(v13, "_setEndpoint:", v8);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v13);
    connection = v12->_connection;
    v12->_connection = (NSXPCConnection *)v14;

    -[NSXPCConnection setExportedObject:](v12->_connection, "setExportedObject:", v12);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255840B80);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v12->_connection, "setExportedInterface:", v16);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255840880);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v12->_connection, "setRemoteObjectInterface:", v17);

    -[NSXPCConnection _setQueue:](v12->_connection, "_setQueue:", v9);
    objc_initWeak(&location, v12);
    v18 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke;
    v23[3] = &unk_24ED3F600;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInterruptionHandler:](v12->_connection, "setInterruptionHandler:", v23);
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke_120;
    v21[3] = &unk_24ED3F600;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v12->_connection, "setInvalidationHandler:", v21);
    atomic_store(0, &v12->_connectionIdentifier.__a_.__a_value);
    -[NSXPCConnection resume](v12->_connection, "resume");
    -[NSXPCConnection remoteObjectProxy](v12->_connection, "remoteObjectProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "start");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  id *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)*re::audioLogObjects((re *)WeakRetained);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = WeakRetained;
    v6 = 2048;
    v7 = objc_msgSend(WeakRetained, "connectionIdentifier");
    _os_log_impl(&dword_224FE9000, v2, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ connection %llu with service was interrupted", (uint8_t *)&v4, 0x16u);
  }

  if (WeakRetained && (objc_msgSend(WeakRetained[3], "isCancelled") & 1) == 0)
  {
    v3 = objc_msgSend(WeakRetained[3], "audioService");
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 64))(v3);
  }

}

void __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke_120(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  id *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)*re::audioLogObjects((re *)WeakRetained);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = WeakRetained;
    v6 = 2048;
    v7 = objc_msgSend(WeakRetained, "connectionIdentifier");
    _os_log_impl(&dword_224FE9000, v2, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ connection %llu with service was invalidated", (uint8_t *)&v4, 0x16u);
  }

  if (WeakRetained && (objc_msgSend(WeakRetained[3], "isCancelled") & 1) == 0)
  {
    v3 = objc_msgSend(WeakRetained[3], "audioService");
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 64))(v3);
  }

}

- (void)didReceiveConnectionIdentifier:(unint64_t)a3
{
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  int v10;
  REAudioPlaybackClientService *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (atomic_load(&self->_connectionIdentifier.__a_.__a_value))
  {
    v6 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
      v10 = 138412802;
      v11 = self;
      v12 = 2048;
      v13 = v7;
      v14 = 2048;
      v15 = a3;
      _os_log_error_impl(&dword_224FE9000, v6, OS_LOG_TYPE_ERROR, "AudioPlaybackClientService %@ cannot change connection identifier from %llu to %llu", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    atomic_store(a3, &self->_connectionIdentifier.__a_.__a_value);
    v8 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
      v10 = 138412546;
      v11 = self;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ received connection identifier %llu", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)streamToken:(unint64_t)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  AudioService *v9;

  if (!-[_REAudioManagerCancellable isCancelled](self->_service, "isCancelled"))
  {
    v9 = -[_REAudioManagerCancellable audioService](self->_service, "audioService");
    (*((void (**)(AudioService *, unint64_t, unint64_t, unint64_t))v9->var0 + 86))(v9, a3, a4, a5);
  }
}

- (void)mediaServicesLost
{
  re *v3;
  NSObject *v4;
  AudioService *v5;
  int v6;
  REAudioPlaybackClientService *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (re *)-[_REAudioManagerCancellable isCancelled](self->_service, "isCancelled");
  if ((v3 & 1) == 0)
  {
    v4 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackClientService %@ received media services lost notification from host.", (uint8_t *)&v6, 0xCu);
    }
    v5 = -[_REAudioManagerCancellable audioService](self->_service, "audioService");
    (*((void (**)(AudioService *))v5->var0 + 9))(v5);
  }
}

- (void)mediaServicesReset
{
  re *v3;
  NSObject *v4;
  AudioService *v5;
  int v6;
  REAudioPlaybackClientService *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (re *)-[_REAudioManagerCancellable isCancelled](self->_service, "isCancelled");
  if ((v3 & 1) == 0)
  {
    v4 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackClientService %@ received media services reset notification from host.", (uint8_t *)&v6, 0xCu);
    }
    v5 = -[_REAudioManagerCancellable audioService](self->_service, "audioService");
    (*((void (**)(AudioService *))v5->var0 + 10))(v5);
  }
}

- (unint64_t)connectionIdentifier
{
  return atomic_load(&self->_connectionIdentifier.__a_.__a_value);
}

- (BOOL)connected
{
  unint64_t v2;

  v2 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
  return v2 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
