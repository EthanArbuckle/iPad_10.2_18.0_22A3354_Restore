@implementation FPDPresenterManager

- (FPDPresenterManager)initWithExtensionManager:(id)a3
{
  id v4;
  FPDPresenterManager *v5;
  FPDPresenterManager *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableDictionary *presenters;
  uint64_t v12;
  NSMutableDictionary *promisedPresenters;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPDPresenterManager;
  v5 = -[FPDPresenterManager init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionManager, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("presenter manager queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    presenters = v6->_presenters;
    v6->_presenters = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    promisedPresenters = v6->_promisedPresenters;
    v6->_promisedPresenters = (NSMutableDictionary *)v12;

  }
  return v6;
}

- (unint64_t)promisePresenterWithID:(id)a3
{
  id v4;
  FPDPresenterManager *v5;
  unint64_t v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->nextPromiseID + 1;
  v5->nextPromiseID = v6;
  objc_sync_exit(v5);

  queue = v5->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FPDPresenterManager_promisePresenterWithID___block_invoke;
  block[3] = &unk_1E8C75EE8;
  v11 = v4;
  v12 = v6;
  block[4] = v5;
  v8 = v4;
  dispatch_async(queue, block);

  return v6;
}

void __46__FPDPresenterManager_promisePresenterWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);

}

- (void)forgetPromiseForPresenterWithID:(id)a3 promiseID:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__FPDPresenterManager_forgetPromiseForPresenterWithID_promiseID___block_invoke;
  block[3] = &unk_1E8C75EE8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __65__FPDPresenterManager_forgetPromiseForPresenterWithID_promiseID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  v4 = a1[6];

  if (v3 == v4)
    objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
}

- (void)addPresenter:(id)a3 itemID:(id)a4 urlHint:(id)a5 auditToken:(id *)a6 promiseID:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  __int128 v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  block[1] = 3221225472;
  v15 = *(_OWORD *)&a6->var0[4];
  v25 = *(_OWORD *)a6->var0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke;
  block[3] = &unk_1E8C79040;
  block[4] = self;
  v21 = v13;
  v23 = v14;
  v24 = a7;
  v26 = v15;
  v22 = v12;
  v17 = v14;
  v18 = v12;
  v19 = v13;
  dispatch_async(queue, block);

}

void __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "domainFromItemID:reason:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  v6 = *(_QWORD *)(a1 + 64);

  if (v5 != v6)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke_cold_1(a1 + 48, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  if (v3)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_OWORD *)(a1 + 88);
    v18[0] = *(_OWORD *)(a1 + 72);
    v18[1] = v10;
    +[FPDFilePresenter presenter:withItemID:auditToken:urlHint:domain:](FPDFilePresenter, "presenter:withItemID:auditToken:urlHint:domain:", v7, v8, v18, v9, v3);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject start](v11, "start");
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("presenters"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v11, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("presenters"));
LABEL_6:

  }
}

- (void)removePresenter:(id)a3
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
  v7[2] = __39__FPDPresenterManager_removePresenter___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __39__FPDPresenterManager_removePresenter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stop");
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("presenters"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("presenters"));
  }
  else
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __39__FPDPresenterManager_removePresenter___block_invoke_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (id)presenterWithID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPDPresenterManager_presenterWithID___block_invoke;
  block[3] = &unk_1E8C79068;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__FPDPresenterManager_presenterWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)presentersForDomain:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FPDPresenterManager_presentersForDomain___block_invoke;
  block[3] = &unk_1E8C75240;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __43__FPDPresenterManager_presentersForDomain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__FPDPresenterManager_presentersForDomain___block_invoke_2;
  v4[3] = &unk_1E8C79090;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __43__FPDPresenterManager_presentersForDomain___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)signalPresentersForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "providerDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__FPDPresenterManager_signalPresentersForItemID___block_invoke;
  v11[3] = &unk_1E8C77420;
  v11[4] = self;
  v12 = v5;
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  v10 = v5;
  dispatch_async(queue, v11);

}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2;
  v4[3] = &unk_1E8C790B8;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "isEnumeratorActive") & 1) == 0)
  {
    objc_msgSend(v4, "observedItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerDomainID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0CAABA0]) & 1) != 0
        || (objc_msgSend(v4, "observedItemID"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "identifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)),
            v9,
            v8,
            v10))
      {
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2_cold_1((uint64_t)v4, a1, v11);

        objc_msgSend(v4, "enumerationResultsDidChange");
      }
    }
  }

}

- (NSDictionary)presenters
{
  return &self->_presenters->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionManager);
  objc_storeStrong((id *)&self->_promisedPresenters, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] Ignoring presenter creation for %@: promised has been deleted or superseded", a5, a6, a7, a8, 2u);
}

void __39__FPDPresenterManager_removePresenter___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] Removing promise for presenter %@", a5, a6, a7, a8, 2u);
}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 48), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] signaling our passive file presenter %@ about a change on %@", (uint8_t *)&v6, 0x16u);

}

@end
