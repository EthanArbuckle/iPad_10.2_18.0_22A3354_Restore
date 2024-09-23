@implementation SFSafariViewControllerDataStore

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSafariViewControllerDataStore;
  return -[SFSafariViewControllerDataStore init](&v3, sel_init);
}

+ (SFSafariViewControllerDataStore)defaultDataStore
{
  if (defaultDataStore_onceToken != -1)
    dispatch_once(&defaultDataStore_onceToken, &__block_literal_global_7);
  return (SFSafariViewControllerDataStore *)(id)defaultDataStore_defaultDataStore;
}

void __51__SFSafariViewControllerDataStore_defaultDataStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SFSafariViewControllerDataStore _init]([SFSafariViewControllerDataStore alloc], "_init");
  v1 = (void *)defaultDataStore_defaultDataStore;
  defaultDataStore_defaultDataStore = (uint64_t)v0;

}

- (void)clearWebsiteDataWithCompletionHandler:(void *)completion
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  id v6;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *cancelViewServiceRequest;
  _QWORD v9[5];
  void (**v10)(_QWORD);

  v4 = completion;
  if (v4)
    v5 = v4;
  else
    v5 = (void (**)(_QWORD))&__block_literal_global_1;
  if (self->_remoteViewController)
  {
    v5[2](v5);
  }
  else
  {
    v6 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E4AC1360;
    v9[4] = self;
    v10 = v5;
    +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:](SFBrowserRemoteViewController, "requestViewControllerWithConnectionHandler:", v9);
    v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
    cancelViewServiceRequest = self->_cancelViewServiceRequest;
    self->_cancelViewServiceRequest = v7;

  }
}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_3;
    v13[3] = &unk_1E4AC1338;
    v11 = *(id *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v11;
    objc_msgSend(v10, "clearWebsiteDataWithCompletionHandler:", v13);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXSVCDeletion();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(v12, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for website data deletion with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
