@implementation _BNPresentableContext

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (_BNPresentableContext)initWithMachName:(id)a3 presentable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _BNPresentableContext *v10;
  _BNPresentableContext *v11;
  uint64_t v12;
  NSString *machName;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableContext.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableContext.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentable"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)_BNPresentableContext;
  v10 = -[_BNPresentableContext init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_valid = 1;
    v12 = objc_msgSend(v7, "copy");
    machName = v11->_machName;
    v11->_machName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_presentable, a4);
    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)Serial;

  }
  return v11;
}

- (void)setHostNeedsUpdate
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B9628000, v0, v1, "Error informing host of update: context: %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)__setBannerAppearState:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61___BNPresentableContext___setBannerAppearState_reason_error___block_invoke;
  v12[3] = &unk_1E7044558;
  objc_copyWeak(&v15, &location);
  v10 = v7;
  v13 = v10;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v9, "performAsync:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)__setBannerAppearState:(id)a3 reason:(id)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);
  uint64_t v9;

  v9 = 0;
  v8 = (void (**)(id, _QWORD))a5;
  -[_BNPresentableContext __setBannerAppearState:reason:error:](self, "__setBannerAppearState:reason:error:", a3, a4, &v9);
  v8[2](v8, v9);

}

- (void)__bannerWillNotAppearWithReason:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BNPresentable *presentable;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)BNLogContextService;
  if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    presentable = self->_presentable;
    v8 = v6;
    BNEffectivePresentableDescription(presentable);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke;
  v12[3] = &unk_1E70445A8;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v5;
  v13 = v11;
  objc_msgSend(v10, "performAsync:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)__bannerWillNotAppearWithReason:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;

  v7 = 0;
  v6 = (void (**)(id, _QWORD))a4;
  -[_BNPresentableContext __bannerWillNotAppearWithReason:error:](self, "__bannerWillNotAppearWithReason:error:", a3, &v7);
  v6[2](v6, v7);

}

- (void)__setUserInteractionWillBegin:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke;
  v8[3] = &unk_1E70445A8;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "performAsync:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)__setUserInteractionWillBegin:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;

  v7 = 0;
  v6 = (void (**)(id, _QWORD))a4;
  -[_BNPresentableContext __setUserInteractionWillBegin:error:](self, "__setUserInteractionWillBegin:error:", a3, &v7);
  v6[2](v6, v7);

}

- (void)__handleTemplateContentEvent:(id)a3 error:(id *)a4
{
  id v5;
  BNPresentable *v6;
  void *v7;
  id v8;
  BNPresentable *v9;
  _QWORD v10[4];
  BNPresentable *v11;
  id v12;

  v5 = a3;
  v6 = self->_presentable;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60___BNPresentableContext___handleTemplateContentEvent_error___block_invoke;
  v10[3] = &unk_1E70445F8;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performAsync:", v10);

}

- (void)__handleTemplateContentEvent:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;

  v7 = 0;
  v6 = (void (**)(id, _QWORD))a4;
  -[_BNPresentableContext __handleTemplateContentEvent:error:](self, "__handleTemplateContentEvent:error:", a3, &v7);
  v6[2](v6, v7);

}

- (void)invalidate
{
  _BNPresentableContext *v2;
  NSObject *v3;
  int v4;
  _BNPresentableContext *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_valid)
  {
    v2->_valid = 0;
    v3 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "BNPresentableContext invalidated: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    -[_BNPresentableContext _invalidateConnection](v2, "_invalidateConnection");
  }
  objc_sync_exit(v2);

}

- (void)addPresentableObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removePresentableObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *machName;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  machName = self->_machName;
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BNEffectivePresentableDescription(self->_presentable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; machName: %@; isValid: %@: presentable: %@>"),
    v4,
    self,
    machName,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_activeConnectionWithError:(id *)a3
{
  _BNPresentableContext *v4;
  void *v5;
  NSString *machName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BSServiceConnection *connection;
  BSServiceConnection *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BSServiceConnection *v19;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_valid)
  {
    if (!v4->_connection)
    {
      v5 = (void *)MEMORY[0x1E0D228C0];
      machName = v4->_machName;
      +[BNPresentableContextSessionSpecification identifier](BNPresentableContextSessionSpecification, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNPresentable requesterIdentifier](v4->_presentable, "requesterIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNPresentable requestIdentifier](v4->_presentable, "requestIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNPresentable uniquePresentableIdentifier](v4->_presentable, "uniquePresentableIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      BNSceneIdentifierForRequest(v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endpointForMachName:service:instance:", machName, v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D228B8], "connectionWithEndpoint:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      connection = v4->_connection;
      v4->_connection = (BSServiceConnection *)v13;

      v15 = v4->_connection;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke;
      v21[3] = &unk_1E70442E8;
      v21[4] = v4;
      -[BSServiceConnection configureConnection:](v15, "configureConnection:", v21);
      -[BSServiceConnection activate](v4->_connection, "activate");

    }
  }
  else
  {
    v16 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_ERROR))
      -[_BNPresentableContext _activeConnectionWithError:].cold.1((uint64_t)v4, v16);
    if (a3)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("Attempt to establish connection with an invalidated BNPresentableContext");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v19 = v4->_connection;
  objc_sync_exit(v4);

  return v19;
}

- (void)_invalidateConnection
{
  _BNPresentableContext *v2;
  NSObject *v3;
  BSServiceConnection *connection;
  int v5;
  _BNPresentableContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    v3 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v2;
      _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    -[BSServiceConnection invalidate](v2->_connection, "invalidate");
    connection = v2->_connection;
    v2->_connection = 0;

    -[_BNPresentableContext _runPostConnectionInvalidation](v2, "_runPostConnectionInvalidation");
  }
  objc_sync_exit(v2);

}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_setBannerAppearState:(int)a3 reason:(id)a4
{
  id v6;
  void *v7;
  BNPresentable *presentable;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BNPresentable *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  _QWORD *v17;
  void *v18;
  BNPresentable *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BNPresentable *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_presentableAppearState != a3)
  {
    self->_presentableAppearState = a3;
    switch(a3)
    {
      case 0:
        v7 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          presentable = self->_presentable;
          v9 = v7;
          BNEffectivePresentableDescription(presentable);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v10;
          v34 = 2114;
          v35 = v6;
          _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableDidDisappearAsBanner:withReason:](self->_presentable, "presentableDidDisappearAsBanner:withReason:", self->_presentable, v6);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_55;
        v26[3] = &unk_1E7044580;
        v26[4] = self;
        v27 = v6;
        -[_BNPresentableContext _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidDisappearAsBanner_withReason_, v26);
        v11 = v27;
        goto LABEL_24;
      case 1:
        v12 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_presentable;
          v14 = v12;
          BNEffectivePresentableDescription(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v15;
          _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", buf, 0xCu);

        }
        v16 = sel_presentableWillAppearAsBanner_;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableWillAppearAsBanner:](self->_presentable, "presentableWillAppearAsBanner:", self->_presentable);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke;
        v31[3] = &unk_1E70445D0;
        v31[4] = self;
        v17 = v31;
        goto LABEL_18;
      case 2:
        v18 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_presentable;
          v20 = v18;
          BNEffectivePresentableDescription(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v21;
          _os_log_impl(&dword_1B9628000, v20, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", buf, 0xCu);

        }
        v16 = sel_presentableDidAppearAsBanner_;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableDidAppearAsBanner:](self->_presentable, "presentableDidAppearAsBanner:", self->_presentable);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_49;
        v30[3] = &unk_1E70445D0;
        v30[4] = self;
        v17 = v30;
LABEL_18:
        -[_BNPresentableContext _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", v16, v17);
        break;
      case 3:
        v22 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          v23 = self->_presentable;
          v24 = v22;
          BNEffectivePresentableDescription(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          v34 = 2114;
          v35 = v6;
          _os_log_impl(&dword_1B9628000, v24, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableWillDisappearAsBanner:withReason:](self->_presentable, "presentableWillDisappearAsBanner:withReason:", self->_presentable, v6);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_52;
        v28[3] = &unk_1E7044580;
        v28[4] = self;
        v29 = v6;
        -[_BNPresentableContext _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillDisappearAsBanner_withReason_, v28);
        v11 = v29;
LABEL_24:

        break;
      default:
        break;
    }
  }

}

- (void)_runPostConnectionInvalidation
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___BNPresentableContext__runPostConnectionInvalidation__block_invoke;
  v3[3] = &unk_1E7044620;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "performAsync:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
  objc_storeStrong((id *)&self->_presentable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

- (void)_activeConnectionWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B9628000, a2, OS_LOG_TYPE_ERROR, "Attempt to establish connection with an invalidated BNPresentableContext: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
