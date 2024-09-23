@implementation INWidgetDescriptorManager

- (void)getDescriptorsWithCompletionHandler:(id)a3
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
  v7[2] = __65__INWidgetDescriptorManager_getDescriptorsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E2293BE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)getDescriptorForIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__INWidgetDescriptorManager_getDescriptorForIntent_completionHandler___block_invoke;
  v10[3] = &unk_1E2293C10;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[INWidgetDescriptorManager getDescriptorsWithCompletionHandler:](self, "getDescriptorsWithCompletionHandler:", v10);

}

- (INWidgetDescriptorManager)init
{
  INWidgetDescriptorManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSSet *widgetDescriptors;
  NSMutableArray *v8;
  NSMutableArray *completionHandlers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INWidgetDescriptorManager;
  v2 = -[INWidgetDescriptorManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("INWidgetDescriptorManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    widgetDescriptors = v2->_widgetDescriptors;
    v2->_widgetDescriptors = (NSSet *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CHSWidgetDescriptorProvider removeObserver:](self->_provider, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)INWidgetDescriptorManager;
  -[INWidgetDescriptorManager dealloc](&v3, sel_dealloc);
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  INWidgetDescriptor *v19;
  void *v20;
  void *v21;
  INWidgetDescriptor *v22;
  INWidgetDescriptorManager *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v23 = self;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v4;
    objc_msgSend(v4, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v13, "supportedSizeClasses", v23) & 8) != 0)
          {
            v14 = 3;
          }
          else if ((objc_msgSend(v13, "supportedSizeClasses") & 4) != 0)
          {
            v14 = 2;
          }
          else
          {
            v14 = 1;
          }
          objc_msgSend(v13, "intentType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v13, "intentType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("."));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = [INWidgetDescriptor alloc];
            objc_msgSend(v13, "extensionBundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "kind");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[INWidgetDescriptor initWithExtensionBundleIdentifier:kind:intentClassName:preferredSizeClass:](v19, "initWithExtensionBundleIdentifier:kind:intentClassName:preferredSizeClass:", v20, v21, v18, v14);
            objc_msgSend(v7, "addObject:", v22);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    -[INWidgetDescriptorManager _notifyCompletionHandlersWithWidgetDescriptors:](v23, "_notifyCompletionHandlersWithWidgetDescriptors:", v7);
    v4 = v24;
  }
  else
  {
    -[INWidgetDescriptorManager _notifyCompletionHandlersWithWidgetDescriptors:](self, "_notifyCompletionHandlersWithWidgetDescriptors:", 0);
  }

}

- (void)_startObservingDescriptors
{
  INWatchdogTimer *watchdogTimer;
  INWatchdogTimer *v4;
  uint64_t v5;
  INWatchdogTimer *v6;
  INWatchdogTimer *v7;
  CHSWidgetDescriptorProvider *provider;
  void *v9;
  objc_class *v10;
  CHSWidgetDescriptorProvider *v11;
  CHSWidgetDescriptorProvider *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  self->_observing = 1;
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
    -[INWatchdogTimer cancel](watchdogTimer, "cancel");
  v4 = [INWatchdogTimer alloc];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__INWidgetDescriptorManager__startObservingDescriptors__block_invoke;
  v15[3] = &unk_1E2294DE0;
  v15[4] = self;
  v6 = -[INWatchdogTimer initWithTimeoutInterval:timeoutHandler:](v4, "initWithTimeoutInterval:timeoutHandler:", v15, 10.0);
  v7 = self->_watchdogTimer;
  self->_watchdogTimer = v6;

  -[INWatchdogTimer start](self->_watchdogTimer, "start");
  provider = self->_provider;
  if (provider)
    -[CHSWidgetDescriptorProvider removeObserver:](provider, "removeObserver:", self);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v9 = (void *)getCHSWidgetDescriptorProviderClass_softClass;
  v20 = getCHSWidgetDescriptorProviderClass_softClass;
  if (!getCHSWidgetDescriptorProviderClass_softClass)
  {
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __getCHSWidgetDescriptorProviderClass_block_invoke;
    v16[3] = &unk_1E22953C0;
    v16[4] = &v17;
    __getCHSWidgetDescriptorProviderClass_block_invoke((uint64_t)v16);
    v9 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v17, 8);
  v11 = (CHSWidgetDescriptorProvider *)objc_alloc_init(v10);
  v12 = self->_provider;
  self->_provider = v11;

  -[CHSWidgetDescriptorProvider addObserver:](self->_provider, "addObserver:", self);
  -[CHSWidgetDescriptorProvider descriptors](self->_provider, "descriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
    -[INWidgetDescriptorManager descriptorsDidChangeForDescriptorProvider:](self, "descriptorsDidChangeForDescriptorProvider:", self->_provider);
}

- (void)_notifyCompletionHandlersWithWidgetDescriptors:(id)a3
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
  v7[2] = __76__INWidgetDescriptorManager__notifyCompletionHandlersWithWidgetDescriptors___block_invoke;
  v7[3] = &unk_1E2293C38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSSet)widgetDescriptors
{
  return self->_widgetDescriptors;
}

- (void)setWidgetDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

uint64_t __76__INWidgetDescriptorManager__notifyCompletionHandlersWithWidgetDescriptors___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
  v2 = *(_BYTE **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "setWidgetDescriptors:");
  else
    v2[16] = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "widgetDescriptors", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

uint64_t __55__INWidgetDescriptorManager__startObservingDescriptors__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_notifyCompletionHandlersWithWidgetDescriptors:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return result;
}

void __70__INWidgetDescriptorManager_getDescriptorForIntent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "supportsIntent:", *(_QWORD *)(a1 + 32), (_QWORD)v8))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

_BYTE *__65__INWidgetDescriptorManager_getDescriptorsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "widgetDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "widgetDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v5 = (void *)MEMORY[0x18D7812C4](*(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "addObject:", v5);
  }

  result = *(_BYTE **)(a1 + 32);
  if (!result[16])
    return (_BYTE *)objc_msgSend(result, "_startObservingDescriptors");
  return result;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_113237 != -1)
    dispatch_once(&sharedManager_onceToken_113237, &__block_literal_global_113238);
  return (id)sharedManager_sharedManager_113239;
}

void __42__INWidgetDescriptorManager_sharedManager__block_invoke()
{
  INWidgetDescriptorManager *v0;
  void *v1;

  v0 = objc_alloc_init(INWidgetDescriptorManager);
  v1 = (void *)sharedManager_sharedManager_113239;
  sharedManager_sharedManager_113239 = (uint64_t)v0;

}

@end
