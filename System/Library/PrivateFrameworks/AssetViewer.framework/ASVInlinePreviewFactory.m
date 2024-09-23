@implementation ASVInlinePreviewFactory

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_7);
  return (id)shared__shared;
}

void __33__ASVInlinePreviewFactory_shared__block_invoke()
{
  ASVInlinePreviewFactory *v0;
  void *v1;

  v0 = objc_alloc_init(ASVInlinePreviewFactory);
  v1 = (void *)shared__shared;
  shared__shared = (uint64_t)v0;

}

- (ASVInlinePreviewFactory)init
{
  ASVInlinePreviewFactory *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  ASVInlinePreviewFactory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASVInlinePreviewFactory;
  v2 = -[ASVInlinePreviewFactory init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AssetViewer.ASVInlinePreviewFactory.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)getSharedInlineServiceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ASVInlinePreviewFactory_getSharedInlineServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9F0CC40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __71__ASVInlinePreviewFactory_getSharedInlineServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSharedInlineServiceWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_getSharedInlineServiceWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  NSExtension *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSExtension *v12;
  NSExtension *extension;
  _QWORD v14[5];
  void (**v15)(id, _QWORD);
  SEL v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_extension)
    goto LABEL_2;
  v6 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v6 = _asvLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v6, OS_LOG_TYPE_INFO, "#Inline: Retrieving extension", buf, 2u);
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.AssetViewer.ASVAssetViewer"), &v17);
  v7 = (NSExtension *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v8)
  {
    extension = self->_extension;
    self->_extension = v7;

LABEL_2:
    if (self->_sharedInlineService)
    {
      v5[2](v5, 0);
    }
    else
    {
      v12 = self->_extension;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E9F0CCE0;
      v16 = a2;
      v14[4] = self;
      v15 = v5;
      -[NSExtension instantiateViewControllerWithInputItems:connectionHandler:](v12, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v14);

    }
    goto LABEL_15;
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ASVInlinePreview"), 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v11 = _asvLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_1D93A7000, v11, OS_LOG_TYPE_ERROR, "#Inline: Couldn't retrieve extension, error: %@", buf, 0xCu);
  }
  ((void (**)(id, void *))v5)[2](v5, v10);

LABEL_15:
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  __int128 v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_ERROR, "#Inline: Error instantiating view controller: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASVInlinePreviewFactory.m"), 95, CFSTR("Error instantiating view controller: %@"), v9);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_extensionContextForUUID:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_auxiliaryConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_10;
    v25[3] = &unk_1E9F0CC68;
    v25[4] = *(_QWORD *)(a1 + 32);
    v19 = *(_OWORD *)(a1 + 40);
    v14 = (id)v19;
    v26 = v19;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_14;
    v24[3] = &unk_1E9F0C8A0;
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "_auxiliaryConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInterruptionHandler:", v24);

    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_15;
    v23[3] = &unk_1E9F0C8A0;
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "_auxiliaryConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInvalidationHandler:", v23);

    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_16;
    v21[3] = &unk_1E9F0CCB8;
    v21[4] = *(_QWORD *)(a1 + 32);
    v20 = *(_OWORD *)(a1 + 40);
    v18 = (id)v20;
    v22 = v20;
    objc_msgSend(v15, "getARQLInlineProxy3WithCompletionHandler:", v21);

  }
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_10(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_ERROR, "#Inline: Failed to get protocol service, error: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ASVInlinePreviewFactory.m"), 105, CFSTR("Failed to get protocol service, error: %@"), v3);

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D93A7000, v2, OS_LOG_TYPE_ERROR, "#Inline: Connection interrupted @@@", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleInterruptionOrInvalidation");
}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D93A7000, v2, OS_LOG_TYPE_ERROR, "#Inline: Connection invalidated @@@", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleInterruptionOrInvalidation");
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  __int128 v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E9F0CC90;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v11 = v7;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v4;

  v2 = (void *)a1[4];
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = (void *)a1[4];
  }
  objc_storeStrong((id *)(a1[5] + 32), v2);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)createFullscreenInstanceWithUUID:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  NSExtension *extension;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  SEL v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  extension = self->_extension;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke;
  v21[3] = &unk_1E9F0CD58;
  v24 = v16;
  v25 = a2;
  v21[4] = self;
  v22 = v14;
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  v23 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  -[NSExtension instantiateViewControllerWithInputItems:connectionHandler:](extension, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v21);

}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  __int128 v24;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("ASVInlinePreviewFactory.m"), 138, CFSTR("Error instantiating view controller: %@"), v8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_extensionContextForUUID:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_auxiliaryConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2;
    v23[3] = &unk_1E9F0CC68;
    v23[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_OWORD *)(a1 + 56);
    v12 = (id)v15;
    v24 = v15;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_23;
    v16[3] = &unk_1E9F0CD30;
    v17 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 88);
    v21 = *(_OWORD *)(a1 + 72);
    v22 = v14;
    v18 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v19 = v7;
    objc_msgSend(v13, "getARQLInlineProxy3WithCompletionHandler:", v16);

  }
}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_ERROR, "#Inline: Failed to get protocol service, error: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ASVInlinePreviewFactory.m"), 146, CFSTR("Failed to get protocol service: %@"), v3);

  (*(void (**)(void))(a1[5] + 16))();
}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2_24;
  v11[3] = &unk_1E9F0CD08;
  v14 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v10 = v3;
  objc_msgSend(v10, "prepareFullscreenPreview:initialFrame:previewOptions:fenceHandleCompletion:", v4, v5, v11, v6, v7, v8, v9);

}

uint64_t __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2_24(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a3, a4);
}

- (void)handleInterruptionOrInvalidation
{
  NSExtension *extension;
  ARQLInlineService3 *sharedInlineService;
  void *v5;
  id v6;

  extension = self->_extension;
  self->_extension = 0;

  sharedInlineService = self->_sharedInlineService;
  self->_sharedInlineService = 0;

  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("ASVConnectionInterrupted"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:", v6);

}

- (NSExtension)extension
{
  return self->_extension;
}

- (ARQLInlineService3)sharedInlineService
{
  return self->_sharedInlineService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedInlineService, 0);
  objc_storeStrong((id *)&self->_sharedRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
