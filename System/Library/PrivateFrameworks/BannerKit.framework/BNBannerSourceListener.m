@implementation BNBannerSourceListener

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BNBannerSourceListener)initWithAuthorizedBundleIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BNBannerSourceListener *v7;

  v4 = (void *)MEMORY[0x1E0D228F8];
  v5 = a3;
  objc_msgSend(v4, "mainConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BNBannerSourceListener initWithServiceDomain:displayConfiguration:authorizedBundleIDs:](self, "initWithServiceDomain:displayConfiguration:authorizedBundleIDs:", CFSTR("com.apple.frontboard"), v6, v5);

  return v7;
}

- (BNBannerSourceListener)initWithServiceDomain:(id)a3 displayConfiguration:(id)a4 authorizedBundleIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  BNBannerSourceListener *v12;
  NSMutableArray *v13;
  NSMutableArray *connections;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v17;
  id *v18;
  uint64_t v19;
  id v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id *v26;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BNBannerSourceListener;
  v12 = -[BNBannerSourceListener init](&v27, sel_init);
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_displayConfiguration, a4);
        objc_storeStrong((id *)&v12->_authorizedBundleIDs, a5);
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        connections = v12->_connections;
        v12->_connections = v13;

        Serial = BSDispatchQueueCreateSerial();
        queue = v12->_queue;
        v12->_queue = (OS_dispatch_queue *)Serial;

        v17 = (void *)MEMORY[0x1E0D228C8];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __89__BNBannerSourceListener_initWithServiceDomain_displayConfiguration_authorizedBundleIDs___block_invoke;
        v24[3] = &unk_1E7044420;
        v25 = v9;
        v18 = v12;
        v26 = v18;
        objc_msgSend(v17, "listenerWithConfigurator:", v24);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v18[3];
        v18[3] = (id)v19;

        objc_msgSend(v18[3], "activate");
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("BNBannerSourceListener.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceDomain"));

      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("BNBannerSourceListener.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

void __89__BNBannerSourceListener_initWithServiceDomain_displayConfiguration_authorizedBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDomain:", v3);
  +[BNBannerSourceSessionSpecification identifier](BNBannerSourceSessionSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListener;
  -[BNBannerSourceListener dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_unpreparedPresentables;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "invalidate");
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)-[NSMutableArray copy](self->_connections, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "invalidate");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)layoutDescriptionDidChange:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](v5->_requesterIDsToPresentables, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v23 = v7;
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v27;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
              v15 = objc_opt_class();
              v16 = v14;
              if (v15)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v17 = v16;
                else
                  v17 = 0;
              }
              else
              {
                v17 = 0;
              }
              v18 = v17;

              objc_msgSend(v18, "scene");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __53__BNBannerSourceListener_layoutDescriptionDidChange___block_invoke;
              v24[3] = &unk_1E70446A8;
              v25 = v4;
              objc_msgSend(v19, "updateSettingsWithBlock:", v24);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v11);
        }

        v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }

}

void __53__BNBannerSourceListener_layoutDescriptionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "containerSize");
  objc_msgSend(v6, "setContainerSize:");
  objc_msgSend(*(id *)(a1 + 32), "presentationSize");
  objc_msgSend(v6, "setPresentationSize:");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = -[BNBannerSourceListener _isConnectingProcessAuthorized:error:](self, "_isConnectingProcessAuthorized:error:", v7, &v12);
  v9 = v12;

  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_1E70442E8;
    v11[4] = self;
    objc_msgSend(v6, "configureConnection:", v11);
    -[BNBannerSourceListener _addConnection:](self, "_addConnection:", v6);
    objc_msgSend(v6, "activate");
  }
  else
  {
    v10 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR))
      -[BNBannerSourceListener listener:didReceiveConnection:withContext:].cold.1(v10, (uint64_t)self, v9);
    objc_msgSend(v6, "invalidate");
  }

}

void __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  +[BNBannerSourceSessionSpecification serviceQuality](BNBannerSourceSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNBannerSourceSessionSpecification interface](BNBannerSourceSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v9 = &unk_1E7044470;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (void)__layoutDescriptionWithReply:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__BNBannerSourceListener___layoutDescriptionWithReply___block_invoke;
  v9[3] = &unk_1E70446D0;
  objc_copyWeak(&v11, &location);
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "performAsync:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __55__BNBannerSourceListener___layoutDescriptionWithReply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("Um, lost myself");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v4 = objc_loadWeakRetained(WeakRetained + 8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0;
    objc_msgSend(v4, "bannerSourceListener:layoutDescriptionWithError:", v3, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("No delegate to fulfill request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v11 = *MEMORY[0x1E0C9D820];
  v12 = v11;
  v10 = 0;
  objc_msgSend(v4, "bannerSourceListener:presentationSize:containerSize:error:", v3, &v11, &v12, &v10);
  v6 = v10;
  v5 = 0;
  if (!v6)
  {
    +[BNBannerSourceLayoutDescription bannerSourceLayoutDescriptionWithPresentationSize:containerSize:](BNBannerSourceLayoutDescription, "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:", v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)__postPresentableWithSpecification:(id)a3 options:(id)a4 userInfo:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  BNBannerSourceListener *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  const __CFString *v47;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

  }
  v15 = BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v11;
    _os_log_impl(&dword_1B9628000, v15, OS_LOG_TYPE_DEFAULT, "Asked to post presentable with specification: %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228B8], "currentContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteProcess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerProcessForHandle:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "contentBehavior") == 1 || objc_msgSend(v11, "contentBehavior") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke;
    v40[3] = &unk_1E7044720;
    v40[4] = self;
    v41 = v11;
    v42 = v19;
    v45 = v14;
    v43 = v12;
    v44 = v13;
    objc_msgSend(v20, "performAsync:", v40);

  }
  else if (!-[BNBannerSourceListener _isPresentableWithIdentificationWaitingToBeMadeReady:](self, "_isPresentableWithIdentificationWaitingToBeMadeReady:", v11))
  {
    -[BNBannerSourceListener _uniquePresentableWithIdentification:](self, "_uniquePresentableWithIdentification:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_3;
      v35[3] = &unk_1E7044748;
      v39 = v14;
      v35[4] = self;
      v36 = v21;
      v37 = v12;
      v38 = v13;
      objc_msgSend(v22, "performAsync:", v35);

      v23 = v39;
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_4;
      v28[3] = &unk_1E7044798;
      v29 = v11;
      v30 = self;
      v31 = v19;
      v32 = v13;
      v33 = v12;
      v34 = v14;
      objc_msgSend(v24, "performAsync:", v28);

      v23 = v29;
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("calling process doesn't exist -- did it crash?");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, MEMORY[0x1E0C9AAA0], v26);

    }
  }

}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_2;
  v5[3] = &unk_1E70446F8;
  v8 = *(id *)(a1 + 72);
  objc_copyWeak(&v9, &location);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_addUnpreparedBannerSourcePresentableForBannerSpecification:remoteProcess:scene:readyCompletion:", v3, v4, 0, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, _QWORD);
  id v5;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16);
  v5 = a2;
  v4(v3, MEMORY[0x1E0C9AAB0], 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:options:userInfo:", v5, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

uint64_t __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_requestPostingBannerSourceListenerPresentable:options:userInfo:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue"), *(_QWORD *)(a1 + 56));
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "requesterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "uniquePresentableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BNSceneIdentifierForRequest(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*v2, "preferredContentSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*v2, "contentOutsets");
  objc_msgSend(v7, "_createSceneWithIdentifier:forProcess:preferredContentSize:contentOutsets:userInfo:", v6, v8, *(_QWORD *)(a1 + 56), v10, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v18 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 48);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_5;
    v26[3] = &unk_1E7044770;
    objc_copyWeak(&v29, &location);
    v27 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v18, "_addUnpreparedBannerSourcePresentableForBannerSpecification:remoteProcess:scene:readyCompletion:", v19, v20, v17, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  v21 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17 != 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Failed to make a scene");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v21 + 16))(v21, v22, v25);

  }
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:options:userInfo:", v4, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

- (void)__revokePresentablesWithIdentification:(id)a3 withAnimation:(id)a4 reason:(id)a5 userInfo:(id)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v29 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

  }
  v17 = (id)BNLogHostingHost;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "requestIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requesterIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniquePresentableIdentifier");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v14, "BOOLValue");
      NSStringFromBOOL();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    *(_DWORD *)buf = 138544386;
    v38 = v18;
    v39 = 2114;
    v40 = v19;
    v41 = 2114;
    v42 = v20;
    v43 = 2114;
    v44 = v15;
    v45 = 2114;
    v46 = v21;
    _os_log_impl(&dword_1B9628000, v17, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentables with requestID %{public}@, requesterID %{public}@, and uniqueID %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x34u);
    if (v14)

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __101__BNBannerSourceListener___revokePresentablesWithIdentification_withAnimation_reason_userInfo_reply___block_invoke;
  v30[3] = &unk_1E70447C0;
  objc_copyWeak(&v36, (id *)buf);
  v30[4] = self;
  v23 = v13;
  v31 = v23;
  v24 = v15;
  v32 = v24;
  v25 = v14;
  v33 = v25;
  v26 = v29;
  v34 = v26;
  v27 = v16;
  v35 = v27;
  objc_msgSend(v22, "performAsync:", v30);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

}

void __101__BNBannerSourceListener___revokePresentablesWithIdentification_withAnimation_reason_userInfo_reply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeUnpreparedPresentablesWithIdentification:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained(WeakRetained + 8);
    v5 = objc_opt_respondsToSelector();
    v6 = *(_QWORD *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15 && (v16 = (void *)v15, v17 = objc_opt_respondsToSelector(), v16, (v17 & 1) != 0))
      {
        objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requesterIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
        v20 = *(_QWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 64);
        v38 = 0;
        v22 = objc_msgSend(v4, "bannerSourceListener:requestsRevokingPresentableWithRequestIdentifier:requesterIdentifier:animated:reason:userInfo:error:", WeakRetained, v12, v18, v19, v20, v21, &v38);
        v11 = (uint64_t)v38;
        v23 = (void *)MEMORY[0x1E0C9AA60];
        if (!v22)
          v23 = 0;
        v24 = v23;

        v3 = (uint64_t)v24;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {

        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "requesterIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(_QWORD *)(a1 + 48);
          v32 = *(_QWORD *)(a1 + 64);
          v37 = 0;
          v33 = objc_msgSend(v4, "bannerSourceListener:requestsRevokingAllPresentablesForRequesterWithIdentifier:reason:userInfo:error:", WeakRetained, v12, v31, v32, &v37);
          v11 = (uint64_t)v37;
          v34 = (void *)MEMORY[0x1E0C9AA60];
          if (!v33)
            v34 = 0;
          v35 = v34;

          v3 = (uint64_t)v35;
          goto LABEL_25;
        }
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v43 = CFSTR("No delegate to fulfill request");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v12);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    }
    v7 = *(_QWORD *)(a1 + 48);
    v8 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
    v9 = *(_QWORD *)(a1 + 64);
    v39 = 0;
    objc_msgSend(v4, "bannerSourceListener:requestsRevokingPresentablesWithIdentification:reason:animated:userInfo:error:", WeakRetained, v6, v7, v8, v9, &v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v39;
    objc_msgSend(v10, "bn_identificationsForPresentables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!v12)
      {
        if (objc_msgSend((id)v11, "code") == 3)
        {
          v30 = 0;
          goto LABEL_24;
        }
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend((id)v3, "arrayByAddingObjectsFromArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = v13;
    }
    else
    {
      v3 = v12;
    }
    if (!(v3 | v11))
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      BNPresentableIdentificationDescription(*(void **)(a1 + 40));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("No pending or presented presentables with identification %@"), v27);
      v11 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 3, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v3 = 0;
LABEL_24:

      v11 = v30;
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2D50];
  v41 = CFSTR("Um, lost myself");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v3 = 0;
LABEL_26:

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)__recommendSuspension:(id)a3 forReason:(id)a4 revokingCurrent:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__BNBannerSourceListener___recommendSuspension_forReason_revokingCurrent_reply___block_invoke;
  v21[3] = &unk_1E70447E8;
  objc_copyWeak(&v26, &location);
  v16 = v11;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  v18 = v12;
  v24 = v18;
  v19 = v14;
  v25 = v19;
  objc_msgSend(v15, "performAsync:", v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __80__BNBannerSourceListener___recommendSuspension_forReason_revokingCurrent_reply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("Um, lost myself");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v4 = objc_loadWeakRetained(WeakRetained + 8);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("No delegate to fulfill request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v6 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  v8 = objc_msgSend(v4, "bannerSourceListener:recommendsSuspending:forReason:revokingCurrent:error:", v3, v5, v7, v6, &v15);
  v9 = v15;
LABEL_9:

  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v9);

}

- (BOOL)bannerSourceListenerPresentable:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5
{
  return -[BNBannerSourceListener _isConnectingProcessAuthorized:error:](self, "_isConnectingProcessAuthorized:error:", a4, a5);
}

- (BOOL)bannerSourceListenerPresentableShouldEnablePresentableContextInterface:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "bannerSourceListenerShouldEnablePresentableContextInterface:", self);
  else
    v5 = 0;

  return v5;
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5;

  v5 = a3;
  -[BNBannerSourceListener _removePresentableWithIdentification:requiringUniqueMatch:](self, "_removePresentableWithIdentification:requiringUniqueMatch:", v5, 1);
  -[BNBannerSourceListener _stopObservingAndInvalidatePresentable:](self, "_stopObservingAndInvalidatePresentable:", v5);

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v5;

  v5 = a3;
  -[BNBannerSourceListener _removePresentableWithIdentification:requiringUniqueMatch:](self, "_removePresentableWithIdentification:requiringUniqueMatch:", v5, 1);
  -[BNBannerSourceListener _stopObservingAndInvalidatePresentable:](self, "_stopObservingAndInvalidatePresentable:", v5);

}

- (void)sceneDidInvalidateForBannerSourceListenerPresentable:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "bannerAppearState"))
  {
    objc_initWeak(&location, self);
    +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__BNBannerSourceListener_sceneDidInvalidateForBannerSourceListenerPresentable___block_invoke;
    v6[3] = &unk_1E7044810;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    -[BNBannerSourceListener __revokePresentablesWithIdentification:withAnimation:reason:userInfo:reply:](self, "__revokePresentablesWithIdentification:withAnimation:reason:userInfo:reply:", v5, MEMORY[0x1E0C9AAA0], CFSTR("BNBannerRevocationReasonSceneDidInvalidate"), 0, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __79__BNBannerSourceListener_sceneDidInvalidateForBannerSourceListenerPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    v7 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_error_impl(&dword_1B9628000, v8, OS_LOG_TYPE_ERROR, "%{public}@ (host-side) encountered error attempting to revoke bannerSourceListenerPresentable '%{public}@' for scene invalidation: %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }

}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  char v8;
  NSSet *authorizedBundleIDs;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.bannerkit.post"));
  if ((BNIsPrototypeFeatureDevelopmentEnabled() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    authorizedBundleIDs = self->_authorizedBundleIDs;
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSSet containsObject:](authorizedBundleIDs, "containsObject:", v10);

  }
  v11 = v7 & v8;
  if (a4 && (v7 & v8 & 1) == 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v6, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("[%@ (%d)] "), v13, objc_msgSend(v6, "pid"));

    if ((v7 & 1) == 0)
      objc_msgSend(v14, "appendString:", CFSTR("missing entitlement"));
    if ((v8 & 1) == 0)
    {
      if (v7)
        v15 = CFSTR("not an authorized bundle ID");
      else
        v15 = CFSTR(", not an authorized bundle ID");
      objc_msgSend(v14, "appendString:", v15);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)_addConnection:(id)a3
{
  BNBannerSourceListener *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_connections, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_removeConnection:(id)a3
{
  BNBannerSourceListener *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_connections, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_addUnpreparedPresentable:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  NSMutableSet *unpreparedPresentables;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    unpreparedPresentables = v5->_unpreparedPresentables;
    if (!unpreparedPresentables)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = v5->_unpreparedPresentables;
      v5->_unpreparedPresentables = v7;

      unpreparedPresentables = v5->_unpreparedPresentables;
    }
    -[NSMutableSet addObject:](unpreparedPresentables, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (BOOL)_isPresentableWaitingToBeMadeReady:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  char v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[NSMutableSet containsObject:](v5->_unpreparedPresentables, "containsObject:", v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isPresentableWithIdentificationWaitingToBeMadeReady:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5->_unpreparedPresentables;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((BNIsPresentableIdentifiedByIdentification(*(void **)(*((_QWORD *)&v11 + 1) + 8 * i), v4, 1) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_removeUnpreparedPresentable:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_unpreparedPresentables, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (id)_removeUnpreparedPresentablesWithIdentification:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  BNBannerSourceListener *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v5;
    v6 = (void *)-[NSMutableSet copy](v5->_unpreparedPresentables, "copy");
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v22;
      *(_QWORD *)&v9 = 138543618;
      v19 = v9;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification(v12, v4, 0))
          {
            v13 = (id)BNLogHostingHost;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              v15 = (id)objc_claimAutoreleasedReturnValue();
              BNEffectivePresentableDescription(v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v26 = v15;
              v27 = 2114;
              v28 = v16;
              _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) removing presentable waiting to be made ready: %{public}@", buf, 0x16u);

            }
            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", v12, v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v17);

            -[BNBannerSourceListener _removeUnpreparedPresentable:](obj, "_removeUnpreparedPresentable:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

    objc_sync_exit(obj);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addPresentable:(id)a3
{
  BNBannerSourceListener *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *requesterIDsToPresentables;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!v4->_requesterIDsToPresentables)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      requesterIDsToPresentables = v4->_requesterIDsToPresentables;
      v4->_requesterIDsToPresentables = v5;

    }
    objc_msgSend(v9, "requesterIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v4->_requesterIDsToPresentables, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_requesterIDsToPresentables, "setObject:forKeyedSubscript:", v8, v7);
    }
    objc_msgSend(v8, "addObject:", v9);

    objc_sync_exit(v4);
  }

}

- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BNBannerSourceListener *v9;
  NSMutableDictionary *requesterIDsToPresentables;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "requesterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_14;
  v9 = self;
  objc_sync_enter(v9);
  requesterIDsToPresentables = v9->_requesterIDsToPresentables;
  objc_msgSend(v6, "requesterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requesterIDsToPresentables, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v13;
  v15 = 0;
  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (BNIsPresentableIdentifiedByIdentification(v19, v6, a4))
        {
          if (!v15)
            v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v15, "addObject:", v19, (_QWORD)v21);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_sync_exit(v9);
  if (!v15)
LABEL_14:
    v15 = objc_alloc_init(MEMORY[0x1E0C99E60]);

  return v15;
}

- (id)_uniquePresentableWithIdentification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  -[BNBannerSourceListener _presentablesWithIdentification:requiringUniqueMatch:](self, "_presentablesWithIdentification:requiringUniqueMatch:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 456, CFSTR("Found multiple presentables with the unique identification: identificatio: %@; matching presentable: %@"),
      v5,
      v6);

  }
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_removePresentable:(id)a3
{
  id v4;
  BNBannerSourceListener *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(v8, "requesterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_requesterIDsToPresentables, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v8))
    {
      objc_msgSend(v7, "removeObject:", v8);
      if (!objc_msgSend(v7, "count"))
        -[NSMutableDictionary removeObjectForKey:](v5->_requesterIDsToPresentables, "removeObjectForKey:", v6);
    }

    objc_sync_exit(v5);
    v4 = v8;
  }

}

- (void)_removePresentableWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *requesterIDsToPresentables;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    requesterIDsToPresentables = self->_requesterIDsToPresentables;
    objc_msgSend(v6, "requesterIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](requesterIDsToPresentables, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification(v17, v7, a4))
            -[BNBannerSourceListener _removePresentable:](self, "_removePresentable:", v17, (_QWORD)v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)_stopObservingAndInvalidatePresentable:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "removePresentableObserver:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "invalidate");

}

- (void)_requestPostingBannerSourceListenerPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = 0;
    v11 = objc_msgSend(WeakRetained, "bannerSourceListener:requestsPostingPresentable:options:userInfo:error:", self, v8, a4, v9, &v16);
    v12 = v16;
    if (v11)
      -[BNBannerSourceListener _addPresentable:](self, "_addPresentable:", v8);
  }
  else
  {
    objc_msgSend(v8, "invalidate");
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("No delegate to fulfill request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v12)
  {
    v15 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR))
      -[BNBannerSourceListener _requestPostingBannerSourceListenerPresentable:options:userInfo:].cold.1(v15);
  }

}

- (void)_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[BNBannerSourceListener _isPresentableWaitingToBeMadeReady:](self, "_isPresentableWaitingToBeMadeReady:", v8))
  {
    -[BNBannerSourceListener _requestPostingBannerSourceListenerPresentable:options:userInfo:](self, "_requestPostingBannerSourceListenerPresentable:options:userInfo:", v8, a4, v9);
    -[BNBannerSourceListener _removeUnpreparedPresentable:](self, "_removeUnpreparedPresentable:", v8);
  }
  else
  {
    objc_msgSend(v8, "invalidate");
    v10 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BNEffectivePresentableDescription(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) presentable is ready, but no longer tracked (likely revoked): %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_addUnpreparedBannerSourcePresentableForBannerSpecification:(id)a3 remoteProcess:(id)a4 scene:(id)a5 readyCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BNBannerSourceListenerPresentableViewController *v18;
  BNBannerSourceListenerHostedPresentableViewController *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_msgSend(v21, "contentBehavior");
  v15 = objc_msgSend(v21, "contentBehavior");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bannerSourceListener:newBannerSourceListenerPresentableForBannerSpecification:serviceDomain:remoteProcess:readyCompletion:", self, v21, v16, v10, v12);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bannerSourceListener:newBannerSourceListenerPresentableForBannerSpecification:serviceDomain:scene:readyCompletion:", self, v21, v16, v11, v12);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else if (v15 == 1)
  {
    v18 = [BNBannerSourceListenerPresentableViewController alloc];
    -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BNBannerSourceListenerPresentableViewController initWithSpecification:serviceDomain:readyCompletion:](v18, "initWithSpecification:serviceDomain:readyCompletion:", v21, v16, v12);
  }
  else
  {
    v19 = [BNBannerSourceListenerHostedPresentableViewController alloc];
    -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BNBannerSourceListenerHostedPresentableViewController initWithSpecification:serviceDomain:scene:readyCompletion:](v19, "initWithSpecification:serviceDomain:scene:readyCompletion:", v21, v16, v11, v12);
  }
  v20 = (void *)v17;

  objc_msgSend(v20, "addPresentableObserver:", self);
  objc_msgSend(v20, "setDelegate:", self);
  -[BNBannerSourceListener _addUnpreparedPresentable:](self, "_addUnpreparedPresentable:", v20);
  if (v14 == 2 || v15 == 1)
    objc_msgSend(v20, "makeReadyIfPossible");

}

- (id)_createSceneWithIdentifier:(id)a3 forProcess:(id)a4 preferredContentSize:(CGSize)a5 contentOutsets:(UIEdgeInsets)a6 userInfo:(id)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  _QWORD v45[5];
  id v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a5.height;
  width = a5.width;
  v17 = a3;
  v18 = a4;
  v19 = a7;
  BSDispatchQueueAssertMain();
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 547, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneID"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListener.m"), 548, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

LABEL_3:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "bannerSourceListener:sceneSpecificationForBannerSceneWithIdentifier:forProcess:userInfo:", self, v17, v18, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sceneSpecificationForBannerSourceListener:", self);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v22 = (void *)v21;
    if (v21)
      goto LABEL_9;
  }
  +[FBSSceneSpecification specification](BNBannerSourceApplicationSceneSpecification, "specification");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(MEMORY[0x1E0D22930], "parametersForSpecification:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke;
  v45[3] = &unk_1E7044838;
  v45[4] = self;
  v25 = WeakRetained;
  v46 = v25;
  v47 = width;
  v48 = height;
  v49 = top;
  v50 = left;
  v51 = bottom;
  v52 = right;
  objc_msgSend(v23, "updateSettingsWithBlock:", v45);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v25, "bannerSourceListener:didUpdateInitialSceneSettingsWithParameters:", self, v23);
  v37[0] = v24;
  v37[1] = 3221225472;
  v37[2] = __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke_2;
  v37[3] = &unk_1E7044860;
  v26 = v23;
  v38 = v26;
  v39 = width;
  v40 = height;
  v41 = top;
  v42 = left;
  v43 = bottom;
  v44 = right;
  objc_msgSend(v26, "updateClientSettingsWithBlock:", v37);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v25, "bannerSourceListener:didUpdateInitialSceneClientSettingsWithParameters:", self, v26);
  v27 = objc_alloc_init(MEMORY[0x1E0D22928]);
  objc_msgSend(v27, "setSpecification:", v22);
  v28 = (void *)MEMORY[0x1E0D22948];
  objc_msgSend(v18, "identity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identityForProcessIdentity:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClientIdentity:", v30);

  objc_msgSend(MEMORY[0x1E0D22958], "identityForIdentifier:workspaceIdentifier:", v17, CFSTR("com.apple.BannerKit"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIdentity:", v31);

  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "createSceneWithDefinition:initialParameters:", v27, v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

void __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bounds");
  v9 = v8;
  v11 = v10;
  v18 = v8;
  v19 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "bannerSourceListener:layoutDescriptionWithError:", *(_QWORD *)(a1 + 32), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerSize");
    v18 = v13;
    v19 = v14;
    objc_msgSend(v12, "presentationSize");
    v9 = v15;
    v11 = v16;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "bannerSourceListener:presentationSize:containerSize:error:", *(_QWORD *)(a1 + 32), &v18, &v18, 0);
  BSRectWithSize();
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setInterfaceOrientation:", 1);
  objc_msgSend(v7, "setDisplayConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v7, "setForeground:", 1);
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v17, "userInterfaceStyle"));

  objc_msgSend(v7, "setContainerSize:", v18, v19);
  objc_msgSend(v7, "setPresentationSize:", v9, v11);

}

void __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_opt_class();
  v8 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v8;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  objc_msgSend(v6, "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v6, "setBannerContentOutsets:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

- (BNBannerSourceListenerDelegate)delegate
{
  return (BNBannerSourceListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requesterIDsToPresentables, 0);
  objc_storeStrong((id *)&self->_unpreparedPresentables, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIDs, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(uint64_t)a2 withContext:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a1;
  v6 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1B9628000, v8, v9, "%{public}@ (host-side) connection failed to authenticate: %{public}@", v10, v11, v12, v13, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_requestPostingBannerSourceListenerPresentable:(void *)a1 options:userInfo:.cold.1(void *a1)
{
  void *v1;
  id v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1;
  v3 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1B9628000, v5, v6, "%{public}@ (host-side) encountered error interacting with delegate: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
