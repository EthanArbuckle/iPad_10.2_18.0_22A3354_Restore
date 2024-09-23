@implementation LNTranscriptObservingProvider

- (LNTranscriptObservingProvider)initWithObserver:(id)a3
{
  id v5;
  LNTranscriptObservingProvider *v6;
  LNTranscriptObservingProvider *v7;
  LNTranscriptObservingProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNTranscriptObservingProvider;
  v6 = -[LNTranscriptProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observer, a3);
    v8 = v7;
  }

  return v7;
}

- (void)configureConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LNTranscriptObservingProvider;
  -[LNTranscriptProvider configureConnection:](&v13, sel_configureConnection_, v4);
  objc_initWeak(&location, self);
  objc_msgSend(v4, "interruptionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__LNTranscriptObservingProvider_configureConnection___block_invoke;
  v9[3] = &unk_1E45DE268;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  LNNextActionObserverXPCInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v7);

  -[LNTranscriptObservingProvider observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedObject:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)startObservingNextActionStreamWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t *v13;
  LNTranscriptObservingProvider *v14;
  _QWORD v15[6];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((unint64_t)&self->super.super.isa + 1 >= 2 && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "starting observation", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11752;
  v20 = __Block_byref_object_dispose__11753;
  v21 = 0;
  -[LNTranscriptProvider connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke;
  v15[3] = &unk_1E45DE298;
  v15[4] = buf;
  v15[5] = self;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke_11;
  v11[3] = &unk_1E45DE2C0;
  v13 = buf;
  v14 = self;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "startObservingNextActionStreamWithCompletion:", v11);

  _Block_object_dispose(buf, 8);
}

- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  getLNLogCategoryExecution();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "stopping observation", ", buf, 2u);
  }

  -[LNTranscriptProvider connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke;
  v18[3] = &unk_1E45DE2E8;
  v12 = v6;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke_13;
  v15[3] = &unk_1E45DE310;
  v16 = v12;
  v17 = a3;
  v14 = v12;
  objc_msgSend(v13, "stopObservingNextActionStreamWithConnectionUUID:completion:", v7, v15);

}

- (LNTranscriptObservingProviderDelegate)delegate
{
  return (LNTranscriptObservingProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LNNextActionObserverProtocol)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "XPC Error when executing stopObservingNextActionStream. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  getLNLogCategoryExecution();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v5, OS_SIGNPOST_INTERVAL_END, v6, "stopping observation", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "XPC Error when executing startObservingNextActionStream. error: %@", (uint8_t *)&v11, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("LNTranscriptErrorDomain"), 1000, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  getLNLogCategoryExecution();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v9, OS_SIGNPOST_INTERVAL_END, v10, "starting observation", ", (uint8_t *)&v11, 2u);
  }

}

void __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke_11(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getLNLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_ERROR, "Error when executing startObservingNextActionStream. error: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  getLNLogCategoryExecution();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "starting observation", ", (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __53__LNTranscriptObservingProvider_configureConnection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "observingProviderObservationDidInterrupted:", WeakRetained);

    }
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

@end
