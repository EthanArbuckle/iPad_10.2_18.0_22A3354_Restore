@implementation CSActivationEventNotifier

- (CSActivationEventNotifier)init
{
  CSActivationEventNotifier *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSActivationEventNotifier;
  v2 = -[CSActivationEventNotifier init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSActivationEventNotifier", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CSActivationEventNotifier _getHandlerFromEvent:](self, "_getHandlerFromEvent:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyActivationEvent:completion:", v7, v6);

}

- (void)notifyActivationEventSynchronously:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CSActivationEventNotifier notifyActivationEventSynchronously:completion:]";
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v6, "deviceActivationEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSActivationEventNotifier _notifyActivationEvent:completion:](self, "_notifyActivationEvent:completion:", v11, v7);

}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSActivationEventNotifier *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSActivationEventNotifier_notifyActivationEvent_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)notifyDeviceActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSActivationEventNotifier *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSActivationEventNotifier_notifyDeviceActivationEvent_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)notifyActivationEvent:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__CSActivationEventNotifier_notifyActivationEvent_deviceId_activationInfo_completion___block_invoke;
  v16[3] = &unk_1E7C290D8;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = (void *)MEMORY[0x1C3BC4734](v16);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D190A0]), "initWithType:deviceId:activationInfo:hosttime:", a3, v13, v12, mach_absolute_time());

  -[CSActivationEventNotifier notifyDeviceActivationEvent:completion:](self, "notifyDeviceActivationEvent:completion:", v15, v14);
}

- (id)_getHandlerFromHandlerID:(unint64_t)a3
{
  NSDictionary *handlerMap;
  void *v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  handlerMap = self->_handlerMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](handlerMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "connect");
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D190B0]), "initWithMachServiceName:", "com.apple.corespeech.corespeechd.activation.xpc");
    v6 = (os_log_t *)MEMORY[0x1E0D18F60];
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSActivationEventNotifier _getHandlerFromHandlerID:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Using default activation client", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(v5, "connect");
    if (!v5)
    {
      v8 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315138;
        v11 = "-[CSActivationEventNotifier _getHandlerFromHandlerID:]";
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s activation client not exist", (uint8_t *)&v10, 0xCu);
      }
      v5 = 0;
    }
  }
  return v5;
}

- (id)_getHandlerFromEvent:(id)a3
{
  return -[CSActivationEventNotifier _getHandlerFromHandlerID:](self, "_getHandlerFromHandlerID:", (objc_msgSend(a3, "type") << 16) | 1);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)handlerMap
{
  return self->_handlerMap;
}

- (void)setHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_handlerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __86__CSActivationEventNotifier_notifyActivationEvent_deviceId_activationInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSActivationEventNotifier notifyActivationEvent:deviceId:activationInfo:completion:]_block_invoke";
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Cannot handle activation event : %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

uint64_t __68__CSActivationEventNotifier_notifyDeviceActivationEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[CSActivationEventNotifier notifyDeviceActivationEvent:completion:]_block_invoke";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_notifyActivationEvent:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __62__CSActivationEventNotifier_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSActivationEventNotifier notifyActivationEvent:completion:]_block_invoke";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v8, 0x16u);

  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceActivationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_notifyActivationEvent:completion:", v7, *(_QWORD *)(a1 + 48));

}

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1)
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_18598);
  return (id)sharedNotifier_sharedInstance;
}

void __43__CSActivationEventNotifier_sharedNotifier__block_invoke()
{
  CSActivationEventNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(CSActivationEventNotifier);
  v1 = (void *)sharedNotifier_sharedInstance;
  sharedNotifier_sharedInstance = (uint64_t)v0;

}

@end
