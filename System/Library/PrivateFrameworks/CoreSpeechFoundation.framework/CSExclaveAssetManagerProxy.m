@implementation CSExclaveAssetManagerProxy

- (CSExclaveAssetManagerProxy)init
{
  CSExclaveAssetManagerProxy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSExclaveAssetManagerProxy;
  v2 = -[CSExclaveAssetManagerProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.corespeech.csexclave.assetmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke;
  v7[3] = &unk_1E6881160;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke;
  block[3] = &unk_1E687ED98;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (CSExclaveRecordClient)exclaveRecordClient
{
  return self->_exclaveRecordClient;
}

- (void)setExclaveRecordClient:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveRecordClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exclaveRecordClient, 0);
}

void __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke_2;
  v4[3] = &unk_1E687EA38;
  v5 = v1;
  objc_msgSend(v2, "startSecureMobileAssetLoaderService:completion:", v3, v4);

}

uint64_t __77__CSExclaveAssetManagerProxy_startSecureMobileAssetLoaderService_completion___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[CSExclaveAssetManagerProxy startSecureMobileAssetLoaderService:completion:]_block_invoke_2";
      v8 = 1024;
      v9 = a2;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Starting Secure Mobile Asset failed with error %u", (uint8_t *)&v6, 0x12u);
    }
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke_2;
  v3[3] = &unk_1E687EA38;
  v4 = v1;
  objc_msgSend(v2, "stopSecureMobileAssetLoaderService:", v3);

}

uint64_t __65__CSExclaveAssetManagerProxy_stopSecureMobileAssetLoaderService___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[CSExclaveAssetManagerProxy stopSecureMobileAssetLoaderService:]_block_invoke_2";
      v8 = 1024;
      v9 = a2;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Stopping Secure Mobile Asset failed with error %u", (uint8_t *)&v6, 0x12u);
    }
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2707);
  return (id)sharedManager_assetManager;
}

void __43__CSExclaveAssetManagerProxy_sharedManager__block_invoke()
{
  CSExclaveAssetManagerProxy *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(CSExclaveAssetManagerProxy);
  v1 = (void *)sharedManager_assetManager;
  sharedManager_assetManager = (uint64_t)v0;

  +[CSExclaveRecordClient sharedClient](CSExclaveRecordClient, "sharedClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedManager_assetManager, "setExclaveRecordClient:", v2);

}

@end
