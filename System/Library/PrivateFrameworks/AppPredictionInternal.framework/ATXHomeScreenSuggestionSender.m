@implementation ATXHomeScreenSuggestionSender

- (ATXHomeScreenSuggestionSender)init
{
  ATXHomeScreenSuggestionSender *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _PASXPCClientHelper *xpcClientHelper;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXHomeScreenSuggestionSender;
  v2 = -[ATXHomeScreenSuggestionSender init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D81640]);
    v4 = *MEMORY[0x1E0CF9330];
    ATXHomeScreenSuggestionServerXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ATXHomeScreenSuggestionClientXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v3, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", v4, v5, v6, v7, &__block_literal_global_70, &__block_literal_global_6_0, 0);
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v8;

  }
  return v2;
}

void __37__ATXHomeScreenSuggestionSender_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionSender: XPC connection interrupted.", v1, 2u);
  }

}

void __37__ATXHomeScreenSuggestionSender_init__block_invoke_5()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionSender: XPC connection invalidated.", v1, 2u);
  }

}

- (void)blendingLayerDidUpdateHomeScreenCachedSuggestions:(id)a3 completion:(id)a4
{
  id v6;
  _PASXPCClientHelper *xpcClientHelper;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcClientHelper = self->_xpcClientHelper;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__ATXHomeScreenSuggestionSender_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blendingLayerDidUpdateHomeScreenCachedSuggestions:completion:", v9, v8);

}

uint64_t __94__ATXHomeScreenSuggestionSender_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler:(id)a3
{
  id v4;
  _PASXPCClientHelper *xpcClientHelper;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcClientHelper = self->_xpcClientHelper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__ATXHomeScreenSuggestionSender_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler:", v6);

}

uint64_t __110__ATXHomeScreenSuggestionSender_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceDebugRotationForStack:(id)a3 extensionBundleId:(id)a4 kind:(id)a5 completion:(id)a6
{
  id v10;
  _PASXPCClientHelper *xpcClientHelper;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  xpcClientHelper = self->_xpcClientHelper;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__ATXHomeScreenSuggestionSender_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke;
  v17[3] = &unk_1E82DD268;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "forceDebugRotationForStack:extensionBundleId:kind:completion:", v15, v14, v13, v12);

}

uint64_t __94__ATXHomeScreenSuggestionSender_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:(id)a3
{
  id v4;
  _PASXPCClientHelper *xpcClientHelper;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcClientHelper = self->_xpcClientHelper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__ATXHomeScreenSuggestionSender_synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](xpcClientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:", v6);

}

uint64_t __112__ATXHomeScreenSuggestionSender_synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientHelper, 0);
}

@end
