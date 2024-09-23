@implementation BNBannerSourcePresentableContext

- (BNBannerSourcePresentableContext)initWithPresentableIdentification:(id)a3 contentBehavior:(int64_t)a4 serviceDomain:(id)a5
{
  id v9;
  id v10;
  BNBannerSourcePresentableContext *v11;
  void *v12;
  uint64_t v13;
  NSString *requesterIdentifier;
  void *v15;
  uint64_t v16;
  NSString *requestIdentifier;
  void *v18;
  uint64_t v19;
  NSUUID *uniquePresentableIdentifier;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v23;
  id *v24;
  uint64_t v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id *v31;
  objc_super v32;

  v9 = a3;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BNBannerSourcePresentableContext;
  v11 = -[BNBannerSourcePresentableContext init](&v32, sel_init);
  if (v11)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("BNBannerSourcePresentableContext.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentableIdentification"));

    }
    objc_msgSend(v9, "requesterIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    requesterIdentifier = v11->_requesterIdentifier;
    v11->_requesterIdentifier = (NSString *)v13;

    objc_msgSend(v9, "requestIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    requestIdentifier = v11->_requestIdentifier;
    v11->_requestIdentifier = (NSString *)v16;

    objc_msgSend(v9, "uniquePresentableIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    uniquePresentableIdentifier = v11->_uniquePresentableIdentifier;
    v11->_uniquePresentableIdentifier = (NSUUID *)v19;

    v11->_contentBehavior = a4;
    Serial = BSDispatchQueueCreateSerial();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)Serial;

    v23 = (void *)MEMORY[0x1E0D228C8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __100__BNBannerSourcePresentableContext_initWithPresentableIdentification_contentBehavior_serviceDomain___block_invoke;
    v29[3] = &unk_1E7044420;
    v30 = v10;
    v24 = v11;
    v31 = v24;
    objc_msgSend(v23, "listenerWithConfigurator:", v29);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v24[1];
    v24[1] = (id)v25;

    objc_msgSend(v24[1], "activate");
  }

  return v11;
}

void __100__BNBannerSourcePresentableContext_initWithPresentableIdentification_contentBehavior_serviceDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "setDomain:", v3);
  +[BNPresentableContextSessionSpecification identifier](BNPresentableContextSessionSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:", v4);

  BNSceneIdentifierForRequest(*(void **)(*(_QWORD *)(a1 + 40) + 40), *(void **)(*(_QWORD *)(a1 + 40) + 48), *(void **)(*(_QWORD *)(a1 + 40) + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInstance:", v5);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourcePresentableContext;
  -[BNBannerSourcePresentableContext dealloc](&v3, sel_dealloc);
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE location[12];
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BSServiceConnectionHost remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke;
      v14[3] = &unk_1E7044448;
      objc_copyWeak(&v15, (id *)location);
      objc_msgSend(v5, "__handleTemplateContentEvent:reply:", v6, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v13, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v5, "__handleTemplateContentEvent:error:", v7, &v12);
      v8 = v12;

      if (v8)
      {
        v9 = (id)BNLogContextHost;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_loadWeakRetained(&v13);
          BNPresentableIdentificationDescription(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v11;
          v17 = 2114;
          v18 = v8;
          _os_log_error_impl(&dword_1B9628000, v9, OS_LOG_TYPE_ERROR, "Error asking client presentable to handle template content event: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);

        }
      }

      objc_destroyWeak(&v13);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:].cold.1();
  }

}

void __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
      __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke_cold_1(a1, v4);
  }

}

- (void)updatePresentableAppearState:(int)a3 reason:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _BYTE location[12];
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BSServiceConnectionHost remoteTarget](self->_connection, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke;
      v16[3] = &unk_1E7044448;
      objc_copyWeak(&v17, (id *)location);
      objc_msgSend(v7, "__setBannerAppearState:reason:reply:", v8, v6, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v15, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v7, "__setBannerAppearState:reason:error:", v9, v6, &v14);
      v10 = v14;

      if (v10)
      {
        v11 = (id)BNLogContextHost;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = objc_loadWeakRetained(&v15);
          BNPresentableIdentificationDescription(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v13;
          v19 = 2114;
          v20 = v10;
          _os_log_error_impl(&dword_1B9628000, v11, OS_LOG_TYPE_ERROR, "Error updating client presentable appearance state: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);

        }
      }

      objc_destroyWeak(&v15);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:].cold.1();
  }

}

void __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
      __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke_cold_1(a1, v4);
  }

}

- (void)handlePresentableWillNotAppearWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE location[12];
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BSServiceConnectionHost remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke;
      v12[3] = &unk_1E7044448;
      objc_copyWeak(&v13, (id *)location);
      objc_msgSend(v5, "__bannerWillNotAppearWithReason:reply:", v4, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v11, self);
      v10 = 0;
      objc_msgSend(v5, "__bannerWillNotAppearWithReason:error:", v4, &v10);
      v6 = v10;
      if (v6)
      {
        v7 = (id)BNLogContextHost;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = objc_loadWeakRetained(&v11);
          BNPresentableIdentificationDescription(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v9;
          v15 = 2114;
          v16 = v6;
          _os_log_error_impl(&dword_1B9628000, v7, OS_LOG_TYPE_ERROR, "Error notifying client presentable will not appear: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);

        }
      }

      objc_destroyWeak(&v11);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:].cold.1();
  }

}

void __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
      __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke_cold_1(a1, v4);
  }

}

- (void)updateUserInteractionWillBegin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE location[12];
  __int16 v17;
  id v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[BSServiceConnectionHost remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke;
      v14[3] = &unk_1E7044448;
      objc_copyWeak(&v15, (id *)location);
      objc_msgSend(v5, "__setUserInteractionWillBegin:reply:", v6, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v13, self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v5, "__setUserInteractionWillBegin:error:", v7, &v12);
      v8 = v12;

      if (v8)
      {
        v9 = (id)BNLogContextHost;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_loadWeakRetained(&v13);
          BNPresentableIdentificationDescription(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v11;
          v17 = 2114;
          v18 = v8;
          _os_log_error_impl(&dword_1B9628000, v9, OS_LOG_TYPE_ERROR, "Error informing client of user interaction change: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);

        }
      }

      objc_destroyWeak(&v13);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:].cold.1();
  }

}

void __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
      __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke_cold_1(a1, v4);
  }

}

- (void)invalidate
{
  BSServiceConnectionListener *connectionListener;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  BNBannerSourcePresentableContext *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "remoteProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = objc_msgSend(WeakRetained, "bannerSourcePresentableContext:isConnectingProcessAuthorized:error:", self, v12, &v18);
    v14 = v18;

    if (v13)
    {
      v15 = self;
      objc_sync_enter(v15);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke;
      v17[3] = &unk_1E70442E8;
      v17[4] = v15;
      objc_msgSend(v9, "configureConnection:", v17);
      objc_storeStrong((id *)&v15->_connection, a4);
      -[BSServiceConnectionHost activate](v15->_connection, "activate");
      objc_sync_exit(v15);

      goto LABEL_8;
    }
  }
  else
  {
    v14 = 0;
  }
  v16 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
    -[BNBannerSourcePresentableContext listener:didReceiveConnection:withContext:].cold.1(v16, (uint64_t)self, v14);
  objc_msgSend(v9, "invalidate");
LABEL_8:

}

void __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  +[BNPresentableContextSessionSpecification serviceQuality](BNPresentableContextSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNPresentableContextSessionSpecification interface](BNPresentableContextSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke_2;
  v9 = &unk_1E7044470;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v7, 0xCu);

    }
    v6 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    if (WeakRetained[9] == 1)
      *((_BYTE *)WeakRetained + 32) = 1;
  }

}

- (void)__setDraggingDismissalEnabled:(id)a3 error:(id *)a4
{
  id WeakRetained;

  self->_draggingDismissalEnabled = objc_msgSend(a3, "integerValue") != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerSourcePresentableContextDraggingDismissalEnabledDidChange:", self);

}

- (void)__setDraggingInteractionEnabled:(id)a3 error:(id *)a4
{
  id WeakRetained;

  self->_draggingInteractionEnabled = objc_msgSend(a3, "integerValue") != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerSourcePresentableContextDraggingInteractionEnabledDidChange:", self);

}

- (void)__setTouchOutsideDismissalEnabled:(id)a3 error:(id *)a4
{
  id WeakRetained;

  self->_touchOutsideDismissalEnabled = objc_msgSend(a3, "integerValue") != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerSourcePresentableContextTouchOutsideDismissalEnabledDidChange:", self);

}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (BNBannerSourcePresentableContextDelegate)delegate
{
  return (BNBannerSourcePresentableContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (BOOL)isDraggingDismissalEnabled
{
  return self->_draggingDismissalEnabled;
}

- (BOOL)isDraggingInteractionEnabled
{
  return self->_draggingInteractionEnabled;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return self->_touchOutsideDismissalEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)handleTemplateContentEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v0, v1, "Failed to obtain remote target from connection: context: %{public}@; error: %{public}@",
    v2);
  OUTLINED_FUNCTION_2();
}

void __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  v3 = OUTLINED_FUNCTION_4_0();
  BNPresentableIdentificationDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v2, v5, "Error asking client presentable to handle template content event: presentable: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_1_0();
}

void __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  v3 = OUTLINED_FUNCTION_4_0();
  BNPresentableIdentificationDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v2, v5, "Error updating client presentable appearance state: presentable: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_1_0();
}

void __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  v3 = OUTLINED_FUNCTION_4_0();
  BNPresentableIdentificationDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v2, v5, "Error notifying client presentable will not appear: presentable: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_1_0();
}

void __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  v3 = OUTLINED_FUNCTION_4_0();
  BNPresentableIdentificationDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v2, v5, "Error informing client of user interaction change: presentable: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)listener:(void *)a1 didReceiveConnection:(uint64_t)a2 withContext:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_0(&dword_1B9628000, v4, v8, "%{public}@ (host-side) connection failed to authenticate: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_0();
}

@end
