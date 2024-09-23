@implementation SFWebAppDataController

- (SFWebAppDataController)initWithWebClipIdentifier:(id)a3
{
  id v5;
  SFWebAppDataController *v6;
  SFWebAppDataController *v7;
  SFWebAppDataController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFWebAppDataController;
  v6 = -[SFWebAppDataController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClipIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)clearWebsiteDataWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  id v6;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *cancelViewServiceRequest;
  _QWORD v9[5];
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
    v5 = v4;
  else
    v5 = (void (**)(_QWORD))&__block_literal_global_49;
  if (self->_remoteViewController)
  {
    v5[2](v5);
  }
  else
  {
    v6 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2;
    v9[3] = &unk_1E4AC1360;
    v9[4] = self;
    v10 = v5;
    +[_SFWebAppViewController requestViewControllerWithConnectionHandler:](_SFWebAppViewController, "requestViewControllerWithConnectionHandler:", v9);
    v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
    cancelViewServiceRequest = self->_cancelViewServiceRequest;
    self->_cancelViewServiceRequest = v7;

  }
}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;

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
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_1;
    v15[3] = &unk_1E4AC1338;
    v13 = v11;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v13;
    objc_msgSend(v10, "clearWebsiteDataWithWebClipIdentifier:completion:", v12, v15);

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXSVCDeletion();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2_cold_1(v14, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_1(uint64_t a1)
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
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2_cold_1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to get remote view for web clip data clearing with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
