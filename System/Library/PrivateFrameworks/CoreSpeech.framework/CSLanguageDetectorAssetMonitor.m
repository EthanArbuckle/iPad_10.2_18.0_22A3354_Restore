@implementation CSLanguageDetectorAssetMonitor

- (CSLanguageDetectorAssetMonitor)init
{
  CSLanguageDetectorAssetMonitor *v2;
  CSLanguageDetectorAssetMonitor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSLanguageDetectorAssetMonitor;
  v2 = -[CSLanguageDetectorAssetMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    v4 = dispatch_queue_create("CSLanguageDetectorAssetMonitor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)startMonitor
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)supportedLocale:(id)a3
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
  v7[2] = __50__CSLanguageDetectorAssetMonitor_supportedLocale___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_supportedLocale:(id)a3
{
  id v3;
  CSAssetDownloadingOption *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportLanguageDetector"))
    {
      v4 = objc_alloc_init(CSAssetDownloadingOption);
      -[CSAssetDownloadingOption setAllowLanguageDetectorAssetDownloading:](v4, "setAllowLanguageDetectorAssetDownloading:", 1);
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAssetDownloadingOption:", v4);

      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__CSLanguageDetectorAssetMonitor__supportedLocale___block_invoke;
      v7[3] = &unk_1E7C28D20;
      v8 = v3;
      objc_msgSend(v6, "assetOfType:language:completion:", 2, CFSTR("en-US"), v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1052, 0);
      v4 = (CSAssetDownloadingOption *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, CSAssetDownloadingOption *))v3 + 2))(v3, 0, v4);
    }

  }
}

- (CSLanguageDetectorAssetMonitorDelegate)delegate
{
  return (CSLanguageDetectorAssetMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__CSLanguageDetectorAssetMonitor__supportedLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "languageDetectorSupportedLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[CSLanguageDetectorAssetMonitor _supportedLocale:]_block_invoke";
      v14 = 2114;
      v15 = v11;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s LanguageDetector supported locale is nil : %{public}@", (uint8_t *)&v12, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __50__CSLanguageDetectorAssetMonitor_supportedLocale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_supportedLocale:", *(_QWORD *)(a1 + 40));
}

void __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 8) == -1)
  {
    v3 = *(NSObject **)(v1 + 24);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_2;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = v1;
    notify_register_dispatch("com.apple.MobileAsset.LanguageDetectorAssets.ma.new-asset-installed", (int *)(v1 + 8), v3, handler);
  }
  else
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSLanguageDetectorAssetMonitor startMonitor]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s Cannot start monitoring language detector asset, since we already registered", buf, 0xCu);
    }
  }
}

uint64_t __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_3;
  v3[3] = &unk_1E7C243F8;
  v3[4] = v1;
  return objc_msgSend(v1, "_supportedLocale:", v3);
}

void __46__CSLanguageDetectorAssetMonitor_startMonitor__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v5, "languageDetectorAssetMonitor:didReceiveNewAssetWithSupportLocale:", *(_QWORD *)(a1 + 32), v6);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3416 != -1)
    dispatch_once(&sharedInstance_onceToken_3416, &__block_literal_global_3417);
  return (id)sharedInstance_sharedInstance_3418;
}

void __48__CSLanguageDetectorAssetMonitor_sharedInstance__block_invoke()
{
  CSLanguageDetectorAssetMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSLanguageDetectorAssetMonitor);
  v1 = (void *)sharedInstance_sharedInstance_3418;
  sharedInstance_sharedInstance_3418 = (uint64_t)v0;

}

@end
