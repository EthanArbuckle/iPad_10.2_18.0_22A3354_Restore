@implementation MFMailAssetViewerManager

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MFMailAssetViewerManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (id)log_log_2;
}

void __31__MFMailAssetViewerManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

- (MFMailAssetViewerManager)initWithDelegate:(id)a3
{
  id v4;
  MFMailAssetViewerManager *v5;
  id v6;
  id v7;
  uint64_t v8;
  EFLocked *handlers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMailAssetViewerManager;
  v5 = -[MFMailAssetViewerManager init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = objc_msgSend(v6, "initWithObject:", v7);
    handlers = v5->_handlers;
    v5->_handlers = (EFLocked *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (id)handlerForAttachmentContext:(id)a3
{
  id v4;
  MFMailAssetViewerHandler *v5;
  void *v6;
  MFMailAssetViewerHandler *v7;
  NSObject *v8;
  _QWORD v10[4];
  MFMailAssetViewerHandler *v11;
  uint8_t buf[4];
  MFMailAssetViewerHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MFMailAssetViewerHandler initWithAttachmentContext:delegate:]([MFMailAssetViewerHandler alloc], "initWithAttachmentContext:delegate:", v4, self);
  -[MFMailAssetViewerManager handlers](self, "handlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MFMailAssetViewerManager_handlerForAttachmentContext___block_invoke;
  v10[3] = &unk_1E5A67898;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "performWhileLocked:", v10);

  +[MFMailAssetViewerManager log](MFMailAssetViewerManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "Created and registered handler %@", buf, 0xCu);
  }

  return v7;
}

uint64_t __56__MFMailAssetViewerManager_handlerForAttachmentContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)assetViewerSceneLaunched:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MFMailAssetViewerManager log](MFMailAssetViewerManager, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene launched for %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)assetViewerSceneClosed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFMailAssetViewerManager log](MFMailAssetViewerManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene closed for %@", buf, 0xCu);
  }

  -[MFMailAssetViewerManager handlers](self, "handlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__MFMailAssetViewerManager_assetViewerSceneClosed___block_invoke;
  v9[3] = &unk_1E5A67898;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "performWhileLocked:", v9);

  -[MFMailAssetViewerManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetViewerManager:sceneClosedForHandler:", self, v7);

}

uint64_t __51__MFMailAssetViewerManager_assetViewerSceneClosed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)assetViewer:(id)a3 editCompletedWithURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[MFMailAssetViewerManager log](MFMailAssetViewerManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "Asset Viewerscene edit completed %@ for %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__MFMailAssetViewerManager_assetViewer_editCompletedWithURL___block_invoke;
  v12[3] = &unk_1E5A65BD8;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performBlock:", v12);

}

void __61__MFMailAssetViewerManager_assetViewer_editCompletedWithURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetViewerManager:editCompletedForHandler:URL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)assetViewerEditCanceled:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MFMailAssetViewerManager log](MFMailAssetViewerManager, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene edit canceled %@", (uint8_t *)&v5, 0xCu);
  }

}

- (MFMailAssetViewerManagerDelegate)delegate
{
  return (MFMailAssetViewerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EFLocked)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
