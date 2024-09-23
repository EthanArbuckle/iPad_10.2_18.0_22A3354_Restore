@implementation WFExtensionEnumerator

- (WFExtensionEnumerator)initWithExtensionPointIdentifier:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFExtensionEnumerator.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFExtensionEnumerator;
  v6 = -[WFExtensionEnumerator init](&v20, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    v8 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v7;

    v9 = dispatch_queue_create("com.apple.shortcuts.WFExtensionEnumerator.queue", 0);
    v10 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v9;

    v11 = dispatch_queue_create("com.apple.shortcuts.WFExtensionEnumerator.notificationQueue", 0);
    v12 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v11;

    objc_initWeak(&location, v6);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke;
    aBlock[3] = &unk_24F8BB660;
    objc_copyWeak(&v18, &location);
    v13 = _Block_copy(aBlock);
    notify_register_dispatch((const char *)objc_msgSend((id)*MEMORY[0x24BDC14C8], "UTF8String"), (int *)v6 + 6, *((dispatch_queue_t *)v6 + 1), v13);
    notify_register_dispatch("com.apple.pluginkit.annotation-change", (int *)v6 + 7, *((dispatch_queue_t *)v6 + 1), v13);
    v14 = v6;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (WFExtensionEnumerator *)v6;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_pkToken);
  notify_cancel(self->_lsToken);
  v3.receiver = self;
  v3.super_class = (Class)WFExtensionEnumerator;
  -[WFExtensionEnumerator dealloc](&v3, sel_dealloc);
}

- (void)enumerateExtensions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *p_super;
  NSObject *v34;
  WFExtensionEnumerator *v35;
  void *v36;
  id v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x24BDC1578]);
  -[WFExtensionEnumerator extensionPointIdentifier](self, "extensionPointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:platform:error:", v5, dyld_get_active_platform(), &v44);
  v7 = v44;

  if (v6)
  {
    v35 = self;
    v36 = v3;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(MEMORY[0x24BDC1528], "enumeratorWithExtensionPointRecord:options:", v6, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (!v8)
      goto LABEL_36;
    v9 = v8;
    v10 = *(_QWORD *)v41;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x22E315218]();
        objc_msgSend(v12, "containingBundleRecord");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          getWFActionsLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            goto LABEL_19;
          objc_msgSend(v12, "bundleIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v47 = "-[WFExtensionEnumerator enumerateExtensions]";
          v48 = 2114;
          v49 = v20;
          v21 = v14;
          v22 = "%s Extension record with bundle identifier %{public}@ is not contained in an app bundle (containingBundl"
                "eRecord == nil), skipping";
          v23 = 22;
LABEL_17:
          _os_log_impl(&dword_22D353000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
          goto LABEL_18;
        }
        -[NSObject bundleIdentifier](v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          getWFActionsLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v21 = v20;
            v22 = "%s App record does not have bundle identifier, skipping";
LABEL_27:
            v23 = 12;
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_19;
        }
        if ((-[NSObject wf_isAvailableInContext:](v14, "wf_isAvailableInContext:", 0) & 1) == 0)
        {
          getWFActionsLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            -[NSObject bundleIdentifier](v14, "bundleIdentifier");
            v24 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v48 = 2114;
            v49 = v24;
            _os_log_impl(&dword_22D353000, v20, OS_LOG_TYPE_INFO, "%s App record with bundle identifier %{public}@ is not user-facing, skipping", buf, 0x16u);

          }
          goto LABEL_18;
        }
        objc_msgSend(v12, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          getWFActionsLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v21 = v20;
            v22 = "%s Extension record does not have bundle identifier, skipping";
            goto LABEL_27;
          }
          goto LABEL_18;
        }
        v17 = (void *)MEMORY[0x24BDD1550];
        objc_msgSend(v12, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v7;
        objc_msgSend(v17, "extensionWithIdentifier:error:", v18, &v39);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v39;

        if (!v19)
        {
          getWFActionsLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "bundleIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v48 = 2114;
            v49 = v26;
            v50 = 2114;
            v51 = v37;
            v27 = v25;
            v28 = OS_LOG_TYPE_ERROR;
            v29 = "%s Failed to create NSExtension for extension record with bundle identifier %{public}@: %{public}@";
            v30 = 32;
            goto LABEL_32;
          }
LABEL_33:

          goto LABEL_34;
        }
        if ((objc_msgSend(v19, "optedIn") & 1) == 0)
        {
          getWFActionsLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "bundleIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v48 = 2114;
            v49 = v26;
            v27 = v25;
            v28 = OS_LOG_TYPE_INFO;
            v29 = "%s Extension with bundle identifier %{public}@ not opted in by the user, skipping";
            v30 = 22;
LABEL_32:
            _os_log_impl(&dword_22D353000, v27, v28, v29, buf, v30);

          }
          goto LABEL_33;
        }
        objc_msgSend(v36, "addObject:", v14);
LABEL_34:

        v7 = v37;
LABEL_19:

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      v9 = v31;
      if (!v31)
      {
LABEL_36:

        v3 = v36;
        v32 = objc_msgSend(v36, "copy");
        p_super = &v35->_supportedApplicationRecords->super;
        v35->_supportedApplicationRecords = (NSSet *)v32;
        goto LABEL_39;
      }
    }
  }
  getWFActionsLogObject();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    -[WFExtensionEnumerator extensionPointIdentifier](self, "extensionPointIdentifier");
    v34 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[WFExtensionEnumerator enumerateExtensions]";
    v48 = 2114;
    v49 = v34;
    v50 = 2114;
    v51 = v7;
    _os_log_impl(&dword_22D353000, p_super, OS_LOG_TYPE_ERROR, "%s Failed to create extension point record for %{public}@: %{public}@", buf, 0x20u);

  }
LABEL_39:

}

- (NSSet)supportedApplicationRecords
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__48832;
  v10 = __Block_byref_object_dispose__48833;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__WFExtensionEnumerator_supportedApplicationRecords__block_invoke;
  v5[3] = &unk_24F8BB688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedApplicationRecords, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__WFExtensionEnumerator_supportedApplicationRecords__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "enumerateExtensions");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;

  v3 = WeakRetained[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke_2;
  block[3] = &unk_24F8BB638;
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_async(v3, block);

}

void __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFExtensionEnumeratorSupportedExtensionsChanged"), *(_QWORD *)(a1 + 32));

}

@end
