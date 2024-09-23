@implementation DCImageAnalyzerManager

- (DCImageAnalyzerManager)init
{
  DCImageAnalyzerManager *v2;
  void *v3;
  objc_class *v4;
  VKCImageAnalyzer *v5;
  VKCImageAnalyzer *imageAnalyzer;
  NSCache *v7;
  NSCache *cachedAnalyses;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *operationQueue;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)DCImageAnalyzerManager;
  v2 = -[DCImageAnalyzerManager init](&v13, sel_init);
  if (v2)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v3 = (void *)getVKCImageAnalyzerClass_softClass;
    v18 = getVKCImageAnalyzerClass_softClass;
    if (!getVKCImageAnalyzerClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getVKCImageAnalyzerClass_block_invoke;
      v14[3] = &unk_24C5B8008;
      v14[4] = &v15;
      __getVKCImageAnalyzerClass_block_invoke((uint64_t)v14);
      v3 = (void *)v16[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v15, 8);
    v5 = (VKCImageAnalyzer *)objc_alloc_init(v4);
    imageAnalyzer = v2->_imageAnalyzer;
    v2->_imageAnalyzer = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedAnalyses = v2->_cachedAnalyses;
    v2->_cachedAnalyses = v7;

    -[NSCache setCountLimit:](v2->_cachedAnalyses, "setCountLimit:", 3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.DocumentCamera.imageanalysisqueue", v9);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_instance;
}

void __40__DCImageAnalyzerManager_sharedInstance__block_invoke()
{
  DCImageAnalyzerManager *v0;
  void *v1;

  v0 = objc_alloc_init(DCImageAnalyzerManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

+ (BOOL)isImageAnalysisEnabled
{
  return _os_feature_enabled_impl();
}

- (void)cleanup
{
  NSObject *operationQueue;
  _QWORD block[5];

  operationQueue = self->_operationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DCImageAnalyzerManager_cleanup__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(operationQueue, block);
}

void __33__DCImageAnalyzerManager_cleanup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  v2 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CE8E000, v2, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cleanup started.", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelAllRequests");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v3 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CE8E000, v3, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cleanup finished.", v4, 2u);
  }

}

- (void)analysisForImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *operationQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DCImageAnalyzerManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  operationQueue = self->_operationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke;
  block[3] = &unk_24C5B7FE0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(operationQueue, block);

}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_20CE8E000, v2, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager started classification for image: %@", buf, 0xCu);
  }

  if ((objc_msgSend((id)objc_opt_class(), "isImageAnalysisEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.documentcamera", ");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        _os_log_impl(&dword_20CE8E000, v5, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cache hit for image: %@, analysis: %@", buf, 0x16u);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_30;
      block[3] = &unk_24C5B7F68;
      v22 = *(id *)(a1 + 48);
      v21 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v8 = v22;
    }
    else
    {
      if (v6)
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_20CE8E000, v5, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cache miss for image: %@", buf, 0xCu);
      }

      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v10 = (void *)getVKCImageAnalyzerRequestClass_softClass;
      v26 = getVKCImageAnalyzerRequestClass_softClass;
      if (!getVKCImageAnalyzerRequestClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getVKCImageAnalyzerRequestClass_block_invoke;
        v28 = &unk_24C5B8008;
        v29 = &v23;
        __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)buf);
        v10 = (void *)v24[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v23, 8);
      v8 = (void *)objc_msgSend([v11 alloc], "initWithImage:orientation:requestType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "imageOrientation"), -1);
      v12 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_31;
      v16[3] = &unk_24C5B7FB8;
      v13 = *(id *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      v17 = v13;
      v18 = v14;
      v19 = v15;
      objc_msgSend(v12, "processRequest:progressHandler:completionHandler:", v8, 0, v16);

    }
  }
  else
  {
    v4 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CE8E000, v4, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager refusing to perform analysis since feature flag isn't enabled.", buf, 2u);
    }
  }

}

uint64_t __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.documentcamera", ");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_31_cold_1((uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_20CE8E000, v8, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager caching image: %@, analysis: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_32;
  block[3] = &unk_24C5B7F90;
  v10 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_32(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedAnalyses, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_31_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "DCImageAnalyzerManager encountered error while analyzing image: %@", (uint8_t *)&v2, 0xCu);
}

@end
