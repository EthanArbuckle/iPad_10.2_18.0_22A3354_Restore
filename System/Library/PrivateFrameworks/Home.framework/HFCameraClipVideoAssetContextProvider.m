@implementation HFCameraClipVideoAssetContextProvider

+ (HFCameraClipVideoAssetContextProvider)defaultProvider
{
  if (_MergedGlobals_303 != -1)
    dispatch_once(&_MergedGlobals_303, &__block_literal_global_2_30);
  return (HFCameraClipVideoAssetContextProvider *)(id)qword_1ED379B88;
}

void __56__HFCameraClipVideoAssetContextProvider_defaultProvider__block_invoke_2()
{
  HFCameraClipVideoAssetContextProvider *v0;
  void *v1;

  v0 = -[HFCameraClipVideoAssetContextProvider init]([HFCameraClipVideoAssetContextProvider alloc], "init");
  v1 = (void *)qword_1ED379B88;
  qword_1ED379B88 = (uint64_t)v0;

}

- (HFCameraClipVideoAssetContextProvider)init
{
  return -[HFCameraClipVideoAssetContextProvider initWithDelegate:](self, "initWithDelegate:", self);
}

- (HFCameraClipVideoAssetContextProvider)initWithDelegate:(id)a3
{
  id v4;
  HFCameraClipVideoAssetContextProvider *v5;
  HFCameraClipVideoAssetContextProvider *v6;
  uint64_t v7;
  NSOperationQueue *operationQueue;
  uint64_t v9;
  NSMutableDictionary *videoContextFuturesByClipID;
  uint64_t v11;
  HMFUnfairLock *lock;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraClipVideoAssetContextProvider;
  v5 = -[HFCameraClipVideoAssetContextProvider init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3828]), "init");
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v7;

    -[NSOperationQueue setQualityOfService:](v6->_operationQueue, "setQualityOfService:", 25);
    v9 = objc_opt_new();
    videoContextFuturesByClipID = v6->_videoContextFuturesByClipID;
    v6->_videoContextFuturesByClipID = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286D8]), "init");
    lock = v6->_lock;
    v6->_lock = (HMFUnfairLock *)v11;

  }
  return v6;
}

- (id)fetchVideoAssetContextForClip:(id)a3 clipManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFCameraClipVideoAssetContextProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedVideoAssetContextForClip:clipManager:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HFLogForCategory(0x17uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Using cached video context for clip %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24;
    v21 = __Block_byref_object_dispose__24;
    v22 = 0;
    -[HFCameraClipVideoAssetContextProvider lock](self, "lock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke;
    v14[3] = &unk_1EA73CBA0;
    p_buf = &buf;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v12, "performBlock:", v14);

    v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

  }
  return v11;
}

void __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "videoContextFuturesByClipID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Reusing in-flight video context future for clip %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Initiating video context fetch operation for clip %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "newFetchVideoAssetContextOperationForClip:clipManager:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D519C0]), "init");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "videoContextFuturesByClipID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke_7;
    v23[3] = &unk_1EA73CB78;
    v19 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 32);
    v24 = v19;
    v25 = v21;
    v26 = v20;
    -[NSObject setFetchVideoAssetContextCompletionBlock:](v8, "setFetchVideoAssetContextCompletionBlock:", v23);
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addOperation:", v8);

  }
}

void __83__HFCameraClipVideoAssetContextProvider_fetchVideoAssetContextForClip_clipManager___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "videoContextFuturesByClipID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

    HFLogForCategory(0x17uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched video context %@ for clip %@", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishWithResult:", v5);
  }
  else
  {
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 42);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    HFLogForCategory(0x17uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch video context for clip %@: %@", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishWithError:", v13);
  }

}

- (id)newFetchVideoAssetContextOperationForClip:(id)a3 clipManager:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CBA3E0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithClipManager:clip:", v6, v7);

  return v8;
}

- (id)cachedVideoAssetContextForClip:(id)a3 clipManager:(id)a4
{
  return (id)objc_msgSend(a4, "videoSegmentsAssetContextForClip:", a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSMutableDictionary)videoContextFuturesByClipID
{
  return self->_videoContextFuturesByClipID;
}

- (HMFUnfairLock)lock
{
  return self->_lock;
}

- (HFCameraClipVideoAssetContextProviderDelegate)delegate
{
  return (HFCameraClipVideoAssetContextProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_videoContextFuturesByClipID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
