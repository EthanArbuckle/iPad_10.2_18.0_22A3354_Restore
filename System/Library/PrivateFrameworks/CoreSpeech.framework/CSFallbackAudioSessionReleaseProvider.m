@implementation CSFallbackAudioSessionReleaseProvider

- (CSFallbackAudioSessionReleaseProvider)initWithAudioRecorder:(id)a3
{
  id v5;
  CSFallbackAudioSessionReleaseProvider *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSFallbackAudioSessionReleaseProvider;
  v6 = -[CSFallbackAudioSessionReleaseProvider init](&v11, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("CSFallbackAudioSessionReleaseProvider", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_audioRecorder, a3);
    -[CSFallbackAudioSessionReleaseProvider audioRecorder](v6, "audioRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v6);

  }
  return v6;
}

- (void)setAudioRecorder:(id)a3
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
  v7[2] = __58__CSFallbackAudioSessionReleaseProvider_setAudioRecorder___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  NSObject *queue;
  NSObject *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23373;
  v15 = __Block_byref_object_dispose__23374;
  v16 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__CSFallbackAudioSessionReleaseProvider_fallbackDeactivateAudioSession_error___block_invoke;
  v10[3] = &unk_1E7C27F30;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[7] = a3;
  dispatch_async_and_wait(queue, v10);
  if (!*((_BYTE *)v18 + 24))
  {
    v6 = (id)*MEMORY[0x1E0D18F38];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v12[5], "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSFallbackAudioSessionReleaseProvider fallbackDeactivateAudioSession:error:]";
      v23 = 2114;
      v24 = v7;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot deactivateAudioSession with %{public}@", buf, 0x16u);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSFallbackAudioSessionReleaseProvider_audioRecorderWillBeDestroyed___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __70__CSFallbackAudioSessionReleaseProvider_audioRecorderWillBeDestroyed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unregisterObserver:");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void __78__CSFallbackAudioSessionReleaseProvider_fallbackDeactivateAudioSession_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  id obj;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v3, "deactivateAudioSession:error:", v4, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

  }
  else
  {
    v7 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSFallbackAudioSessionReleaseProvider fallbackDeactivateAudioSession:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Cannot deactivateAudioSession since audio recorder doesn't exist", buf, 0xCu);
    }
  }
}

void __58__CSFallbackAudioSessionReleaseProvider_setAudioRecorder___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", *(_QWORD *)(a1 + 32));

}

@end
