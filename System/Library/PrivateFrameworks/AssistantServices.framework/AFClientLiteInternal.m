@implementation AFClientLiteInternal

- (id)initAndHandleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  AFClientLiteInternal *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  id commandHandler;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  AFClientLiteInternal *v27;
  uint64_t v28;

  v9 = a5;
  v10 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AFClientLiteInternal;
  v15 = -[AFClientLiteInternal init](&v23, sel_init);
  if (v15)
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[AFClientLiteInternal initAndHandleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:]";
      v26 = 2048;
      v27 = v15;
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(0, v17);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v20 = MEMORY[0x1A1AC0C3C](v13);
    commandHandler = v15->_commandHandler;
    v15->_commandHandler = (id)v20;

    -[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:](v15, "_handleCommand:afterCurrentRequest:isOneWay:completion:", v12, v10, v9, v14);
  }

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFClientLiteInternal *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFClientLiteInternal dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFClientLiteInternal;
  -[AFClientLiteInternal dealloc](&v4, sel_dealloc);
}

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _BOOL4 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  AFClientLiteInternal *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v22 = a5;
  v7 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v32 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]";
    v33 = 2048;
    v34 = self;
    v35 = 2112;
    v36 = v9;
    v37 = 1024;
    v38 = v7;
    v39 = 1024;
    v40 = v22;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p Started %@ %d %d", buf, 0x2Cu);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.client_lite"), 0);
  objc_initWeak((id *)buf, v12);
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke;
  v28[3] = &unk_1E3A305C8;
  v28[4] = self;
  v14 = v10;
  v29 = v14;
  objc_copyWeak(&v30, (id *)buf);
  v15 = (void *)MEMORY[0x1A1AC0C3C](v28);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4008F0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExportedInterface:", v16);

  objc_msgSend(v12, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4322B8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v17);

  objc_msgSend(v12, "resume");
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_6;
  v26[3] = &unk_1E3A35B08;
  v18 = v15;
  v27 = v18;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_8;
  v23[3] = &unk_1E3A31EA8;
  v20 = v18;
  v25 = v20;
  v21 = v12;
  v24 = v21;
  objc_msgSend(v19, "handleRemoteCommand:afterCurrentRequest:isOneWay:completion:", v9, v7, v22, v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AFClientLiteInternal_handleCommand_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__AFClientLiteInternal_handleCommand_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  objc_class *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1[4] + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[5]);
    v3 = (objc_class *)MEMORY[0x1E0D87FF8];
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = 136315394;
      v9 = "-[AFClientLiteInternal handleCommand:completion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s No command handler in client for command %@", (uint8_t *)&v8, 0x16u);
    }
    v3 = (objc_class *)MEMORY[0x1E0D87FE8];
  }
  v5 = objc_alloc_init(v3);
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v5, 0);

}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_2;
  block[3] = &unk_1E3A305A0;
  block[1] = 3221225472;
  v15 = a2;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v9 = v5;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  dispatch_async(v8, block);
  objc_destroyWeak(&v14);

}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__AFClientLiteInternal__handleCommand_afterCurrentRequest_isOneWay_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 136315394;
      v13 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke_2";
      v14 = 2048;
      v15 = v9;
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p Finished", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 136315906;
      v13 = "-[AFClientLiteInternal _handleCommand:afterCurrentRequest:isOneWay:completion:]_block_invoke";
      v14 = 2048;
      v15 = v10;
      v16 = 1024;
      v17 = v2;
      v18 = 2112;
      v19 = v11;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p Failed %d %@", (uint8_t *)&v12, 0x26u);
    }
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "invalidate");

}

@end
