@implementation QLThumbnailServiceProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxy;
}

+ (QLThumbnailServiceProxy)sharedInstance
{
  return (QLThumbnailServiceProxy *)objc_msgSend(a1, "sharedInstanceWithError:", 0);
}

+ (id)sharedInstanceWithError:(id *)a3
{
  void *v3;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = (void *)sSharedProxy;
  if (!sSharedProxy)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2;
    v11 = __Block_byref_object_dispose__2;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__QLThumbnailServiceProxy_sharedInstanceWithError___block_invoke;
    v6[3] = &unk_1E5D7C610;
    v6[4] = &v7;
    v6[5] = a1;
    if (sharedInstanceWithError__once == -1)
    {
      if (!a3)
      {
LABEL_5:
        _Block_object_dispose(&v7, 8);

        v3 = (void *)sSharedProxy;
        return v3;
      }
    }
    else
    {
      dispatch_once(&sharedInstanceWithError__once, v6);
      if (!a3)
        goto LABEL_5;
    }
    *a3 = objc_retainAutorelease((id)v8[5]);
    goto LABEL_5;
  }
  return v3;
}

void __51__QLThumbnailServiceProxy_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v2 = objc_alloc(*(Class *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "initWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = (void *)sSharedProxy;
  sSharedProxy = v4;

}

- (QLThumbnailServiceProxy)initWithError:(id *)a3
{
  QLThumbnailServiceProxy *v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  QLThumbnailsInterface *proxy;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)QLThumbnailServiceProxy;
  v4 = -[QLThumbnailServiceProxy init](&v19, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.quicklook.ThumbnailsAgent"), 4096);
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v5;

    objc_msgSend((id)objc_opt_class(), "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4->_connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](v4->_connection, "resume");
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    v18 = 0;
    v8 = v4->_connection;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__QLThumbnailServiceProxy_initWithError___block_invoke;
    v12[3] = &unk_1E5D7C638;
    v12[4] = &v13;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    proxy = v4->_proxy;
    v4->_proxy = (QLThumbnailsInterface *)v9;

    if (!v4->_proxy)
    {

      v4 = 0;
      if (a3)
        *a3 = objc_retainAutorelease((id)v14[5]);
    }
    _Block_object_dispose(&v13, 8);

  }
  return v4;
}

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED97360);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED973C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_retrieveAllAdditions_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED90740);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_didGenerateThumbnailForRequestWithUUID_images_metadata_contentRect_iconFlavor_thumbnailType_clientShouldTakeOwnership_, 1, 0);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_generateSuccessiveThumbnailRepresentationsForRequests_generationHandler_completionHandler_, 1, 0);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_generateSuccessiveThumbnailRepresentationsForRequests_generationHandler_completionHandler_, 0, 0);

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_cancelThumbnailRequests_, 0, 0);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_askThumbnailAdditionIndex_, 0, 1);
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_fetchAllDataSeparatedVolumesWithCompletionHandler_, 0, 1);

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_getAllThumbnailsForIno_fsid_completionHandler_, 0, 1);

  return v2;
}

void __41__QLThumbnailServiceProxy_initWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__QLThumbnailServiceProxy_initWithError___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailServiceProxy;
  -[QLThumbnailServiceProxy dealloc](&v3, sel_dealloc);
}

- (id)indexProxy
{
  QLThumbnailAdditionIndexInterface *indexProxy;
  QLThumbnailServiceProxy *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  indexProxy = self->_indexProxy;
  if (!indexProxy)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_indexProxy)
    {
      +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__QLThumbnailServiceProxy_indexProxy__block_invoke_90;
      v8[3] = &unk_1E5D7C660;
      v8[4] = v4;
      objc_msgSend(v6, "askThumbnailAdditionIndex:", v8);

    }
    objc_sync_exit(v4);

    indexProxy = self->_indexProxy;
  }
  return indexProxy;
}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _log_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__QLThumbnailServiceProxy_indexProxy__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke_90(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
}

- (void)askThumbnailAdditionIndex:(id)a3
{
  -[QLThumbnailsInterface askThumbnailAdditionIndex:](self->_proxy, "askThumbnailAdditionIndex:", a3);
}

- (void)touchOrAddThumbnailAddition:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:extensionClass:error:", v7, "com.apple.quicklook.readonly", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v9)
  {
    _log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:].cold.1();

  }
  -[QLThumbnailServiceProxy indexProxy](self, "indexProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__QLThumbnailServiceProxy_touchOrAddThumbnailAddition_forURL___block_invoke;
  v14[3] = &unk_1E5D7C6A8;
  v14[4] = self;
  v15 = v8;
  v16 = v6;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v11, "hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:", v13, 1, 0, v14);

}

void __62__QLThumbnailServiceProxy_touchOrAddThumbnailAddition_forURL___block_invoke(uint64_t a1, char a2)
{
  id v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "indexProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addThumbnailForURLWrapper:size:completion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "additionSize"), &__block_literal_global_93);

  }
}

- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  QLThumbnailServiceProxy *v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:extensionClass:error:", v7, "com.apple.quicklook.readonly", &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (v9)
  {
    _log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:].cold.1();

  }
  -[QLThumbnailServiceProxy indexProxy](self, "indexProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__QLThumbnailServiceProxy_updateLastHitDateOfAddition_onPhysicalURL___block_invoke;
  v15[3] = &unk_1E5D7C6D0;
  v16 = v7;
  v17 = self;
  v18 = v8;
  v19 = v6;
  v12 = v6;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v11, "hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:", v13, 1, 0, v15);

}

void __69__QLThumbnailServiceProxy_updateLastHitDateOfAddition_onPhysicalURL___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    _log_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1AE3F5000, v3, OS_LOG_TYPE_INFO, "GenStore has a thumbnail for %@ but it was not present in the Quick Look DB", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "indexProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addThumbnailForURLWrapper:size:completion:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "additionSize"), &__block_literal_global_95);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__QLThumbnailServiceProxy_initWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, a2, a3, "Error caught while looking for a thumbnail: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __37__QLThumbnailServiceProxy_indexProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, a2, a3, "indexProxy received error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)touchOrAddThumbnailAddition:forURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not create FPSandboxingURLWrapper with url: %@, error: %@");
  OUTLINED_FUNCTION_2();
}

@end
