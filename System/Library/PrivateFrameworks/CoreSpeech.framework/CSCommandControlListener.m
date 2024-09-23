@implementation CSCommandControlListener

- (CSCommandControlListener)init
{
  CSCommandControlListener *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSCommandControlListener;
  v2 = -[CSCommandControlListener init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSCommandControlListener", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)startListenWithOption:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSCommandControlListener startListenWithOption:completion:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Start Listening for Command Control", buf, 0xCu);
  }
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__CSCommandControlListener_startListenWithOption_completion___block_invoke;
  v14[3] = &unk_1E7C290D8;
  v15 = v5;
  v8 = v5;
  v9 = (void *)MEMORY[0x1C3BC4734](v14);
  queue = self->_queue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __61__CSCommandControlListener_startListenWithOption_completion___block_invoke_2;
  block[3] = &unk_1E7C29150;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, block);

}

- (void)_startRequestWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  CSAudioStreamProviding *audioStreamProvider;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__CSCommandControlListener__startRequestWithCompletion___block_invoke;
  v23[3] = &unk_1E7C290D8;
  v6 = v4;
  v24 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v23);
  audioStreamProvider = self->_audioStreamProvider;
  if (audioStreamProvider)
  {
    v9 = (void *)MEMORY[0x1E0D19058];
    objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultRequestWithContext:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[CSAudioStreamProviding audioStreamWithRequest:streamName:error:](audioStreamProvider, "audioStreamWithRequest:streamName:error:", v11, v13, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;

    if (v14)
    {
      -[CSCommandControlListener setAudioStream:](self, "setAudioStream:", v14);
      objc_msgSend(v14, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __56__CSCommandControlListener__startRequestWithCompletion___block_invoke_7;
      v20[3] = &unk_1E7C290D8;
      v21 = v7;
      objc_msgSend(v14, "startAudioStreamWithOption:completion:", v16, v20);

    }
    else
    {
      v17 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        objc_msgSend(v15, "localizedDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSCommandControlListener _startRequestWithCompletion:]";
        v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1004, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v15);
  }

}

- (void)stopListenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSCommandControlListener stopListenWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping stopListenWithCompletion", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CSCommandControlListener_stopListenWithCompletion___block_invoke;
  v13[3] = &unk_1E7C290D8;
  v14 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x1C3BC4734](v13);
  queue = self->_queue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __53__CSCommandControlListener_stopListenWithCompletion___block_invoke_8;
  block[3] = &unk_1E7C29150;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSCommandControlListener_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CSCommandControlListener_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSCommandControlListener_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSCommandControlListenerDelegate)delegate
{
  return (CSCommandControlListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioStreamProviding)audioStreamProvider
{
  return self->_audioStreamProvider;
}

- (void)setAudioStreamProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamProvider, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_audioStreamProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__CSCommandControlListener_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[CSCommandControlListener CSXPCClient:didDisconnect:]_block_invoke";
    v15 = 1026;
    v16 = objc_msgSend(v6, "isStreaming");
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Received xpc disconnection, audioStream is streaming = %{public}d", (uint8_t *)&v13, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStreaming");

  if (v8)
  {
    v9 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[CSCommandControlListener CSXPCClient:didDisconnect:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling didStopUnexpectedly", (uint8_t *)&v13, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v12, "commandControlListener:didStopUnexpectedly:", *(_QWORD *)(a1 + 32), 1);

    }
  }
}

void __69__CSCommandControlListener_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commandControlListener:hasLPCMBufferAvailable:hostTime:", v4, v5, objc_msgSend(*(id *)(a1 + 40), "hostTime"));
  }
  else
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commandControlListener:hasLPCMBufferAvailable:", v7, v5);
  }

}

void __74__CSCommandControlListener_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSCommandControlListener audioStreamProvider:didStopStreamUnexpectedly:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Calling didStopUnexpectedly", (uint8_t *)&v6, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "commandControlListener:didStopUnexpectedly:", *(_QWORD *)(a1 + 32), 1);

  }
}

void __53__CSCommandControlListener_stopListenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSCommandControlListener stopListenWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling didStop of CSCommandControlListener", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __53__CSCommandControlListener_stopListenWithCompletion___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioStream");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAudioStreamWithOption:completion:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1151, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __56__CSCommandControlListener__startRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSCommandControlListener _startRequestWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling didStart of CSCommandControlListener", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

uint64_t __56__CSCommandControlListener__startRequestWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__CSCommandControlListener_startListenWithOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__CSCommandControlListener_startListenWithOption_completion___block_invoke_2(uint64_t a1)
{
  CSXPCClient *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "connect");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v5, "prepareAudioProviderWithContext:clientType:error:", v6, 3, &v12);
  v8 = v12;

  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(*(_QWORD *)(a1 + 32) + 40));
    v9 = *(_QWORD **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    if (v9[3])
    {
      objc_msgSend(v9, "_startRequestWithCompletion:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1004, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
