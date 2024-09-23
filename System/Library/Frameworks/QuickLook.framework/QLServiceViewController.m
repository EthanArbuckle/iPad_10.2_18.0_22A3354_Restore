@implementation QLServiceViewController

- (QLServiceViewController)init
{
  QLServiceViewController *v2;
  uint64_t v3;
  NSUUID *uuid;
  QLServiceViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLServiceViewController;
  v2 = -[QLServiceViewController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    -[QLServiceViewController _registerServiceViewController](v2, "_registerServiceViewController");
    v5 = v2;
  }

  return v2;
}

- (UIViewController)mainViewController
{
  if (self->_isAccessoryView)
    return (UIViewController *)self;
  else
    return (UIViewController *)objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  void (*v3)(void);
  UIViewController **p_mainViewController;
  id v5;
  id WeakRetained;

  if (self->_isAccessoryView)
  {
    v3 = (void (*)(void))*((_QWORD *)a3 + 2);
    WeakRetained = a3;
    v3();
  }
  else
  {
    p_mainViewController = &self->_mainViewController;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
    objc_msgSend(WeakRetained, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v5);

  }
}

- (void)invalidateService
{
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t buf[4];
  QLServiceViewController *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_DEBUG, "%@ %@ invalidateService #Remote", buf, 0x16u);

  }
  QLRunInMainThread();
}

id __44__QLServiceViewController_invalidateService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "willMoveToParentViewController:", 0);

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(v5, "removeFromParentViewController");

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 976), 0);
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __81__QLServiceViewController_configureAsAccessoryViewContainerForPreviewCollection___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE **)(a1 + 40);
  if (v3)
  {
    v2[968] = 1;
    +[QLServiceViewController _getServiceWithUUID:](QLServiceViewController, "_getServiceWithUUID:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteAccessoryContainer:", v7);

  }
  else
  {
    objc_msgSend(v2, "_configurePreviewCollectionViewController");
  }
}

- (void)_configurePreviewCollectionViewController
{
  NSString *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  +[QLPreviewCollection previewCollectionClassName](QLPreviewCollection, "previewCollectionClassName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_opt_new();

  -[QLServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostApplicationBundleIdentifier:", v5);

  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    +[QLPreviewCollection previewCollectionClassName](QLPreviewCollection, "previewCollectionClassName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v4;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_INFO, "Created controller (%@) from class name (%@) #Remote", buf, 0x16u);

  }
  -[QLServiceViewController addChildViewController:](self, "addChildViewController:", v4);
  -[QLServiceViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[QLServiceViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1628];
  v25 = CFSTR("preview");
  objc_msgSend(v4, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[preview]|"), 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v17);

  -[QLServiceViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "view", CFSTR("preview"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[preview]|"), 0, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConstraints:", v22);

  objc_storeWeak((id *)&self->_mainViewController, v4);
}

+ (id)_serviceViewControllers
{
  if (_serviceViewControllers_onceToken != -1)
    dispatch_once(&_serviceViewControllers_onceToken, &__block_literal_global_290);
  return (id)_serviceViewControllers__serviceViewControllers;
}

void __50__QLServiceViewController__serviceViewControllers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_serviceViewControllers__serviceViewControllers;
  _serviceViewControllers__serviceViewControllers = v0;

}

+ (id)_getServiceWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "_serviceViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_registerServiceViewController
{
  id v3;

  +[QLServiceViewController _serviceViewControllers](QLServiceViewController, "_serviceViewControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addPointer:", self);

}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 984, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_mainViewController);
}

@end
