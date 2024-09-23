@implementation ATXWidgetLocationAuthorizationTracker

- (ATXWidgetLocationAuthorizationTracker)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  ATXWidgetLocationAuthorizationTracker *v8;
  uint64_t v9;
  NSString *extensionBundleIdentifier;
  uint64_t v11;
  NSString *containerBundleIdentifier;
  objc_class *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXWidgetLocationAuthorizationTracker;
  v8 = -[ATXWidgetLocationAuthorizationTracker init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    containerBundleIdentifier = v8->_containerBundleIdentifier;
    v8->_containerBundleIdentifier = (NSString *)v11;

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v17;

  }
  return v8;
}

- (BOOL)isContainerAuthorizedForWidgetUpdates
{
  uint64_t *p_containerBundleIdentifier;
  NSObject *queue;
  uint64_t v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[6];
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  p_containerBundleIdentifier = (uint64_t *)&self->_containerBundleIdentifier;
  if (self->_containerBundleIdentifier)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    queue = self->_queue;
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke;
    block[3] = &unk_250A2CF68;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(queue, block);
    v6 = (void *)v15[5];
    if (v6)
    {
      v7 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      if (objc_msgSend(MEMORY[0x24BE7A5D8], "waitForSemaphore:timeoutSeconds:", self->_sem, 1.0) == 1)
      {
        __atxlog_handle_default();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ATXWidgetLocationAuthorizationTracker isContainerAuthorizedForWidgetUpdates].cold.1(p_containerBundleIdentifier, v9);

        v8 = 0;
        goto LABEL_11;
      }
      v10 = self->_queue;
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke_11;
      v12[3] = &unk_250A2CF90;
      v12[4] = self;
      v12[5] = &v14;
      dispatch_sync(v10, v12);
      v7 = objc_msgSend((id)v15[5], "BOOLValue");
    }
    v8 = v7;
LABEL_11:
    _Block_object_dispose(&v14, 8);

    return v8;
  }
  return 1;
}

void __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
LABEL_3:

    return;
  }
  if (!*(_QWORD *)(v2 + 48))
  {
    v7 = dispatch_semaphore_create(0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA88]), "initWithEffectiveBundleIdentifier:delegate:onQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v11 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v11 + 48);
    *(_QWORD *)(v11 + 48) = v10;
    goto LABEL_3;
  }
}

void __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke_11(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (BOOL)widgetWantsLocation
{
  uint64_t *p_extensionBundleIdentifier;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;

  p_extensionBundleIdentifier = (uint64_t *)&self->_extensionBundleIdentifier;
  if ((ATXBundleIdIsSpecialWidgetExtensionBundleId() & 1) != 0)
    return 0;
  v4 = (void *)MEMORY[0x23B836ABC]();
  v5 = objc_alloc(MEMORY[0x24BDC1528]);
  v6 = *p_extensionBundleIdentifier;
  v12 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:error:", v6, &v12);
  v8 = v12;
  objc_autoreleasePoolPop(v4);
  if (v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXWidgetLocationAuthorizationTracker widgetWantsLocation].cold.1(p_extensionBundleIdentifier, v9);
    v3 = 0;
  }
  else
  {
    objc_msgSend(v7, "infoDictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:ofClass:](v9, "objectForKey:ofClass:", CFSTR("NSWidgetWantsLocation"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v10, "BOOLValue");

  }
  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *queue_authorizedForWidgetUpdates;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v5, "isAuthorizedForWidgetUpdates");

  objc_msgSend(v6, "numberWithBool:", v7);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  queue_authorizedForWidgetUpdates = self->_queue_authorizedForWidgetUpdates;
  self->_queue_authorizedForWidgetUpdates = v8;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_queue_authorizedForWidgetUpdates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (void)isContainerAuthorizedForWidgetUpdates
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[ATXWidgetLocationAuthorizationTracker isContainerAuthorizedForWidgetUpdates]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_2384B0000, a2, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for location auth delegate callback for bundle id: %@", (uint8_t *)&v3, 0x16u);
}

- (void)widgetWantsLocation
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2384B0000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetLocationAuthorizationTracker: could not access LSApplicationExtensionRecord for extension bundle id %@", (uint8_t *)&v3, 0xCu);
}

@end
