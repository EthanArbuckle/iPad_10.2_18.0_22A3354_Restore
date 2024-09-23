@implementation PUPhotosFileProviderItemProvider

- (PUPhotosFileProviderItemProvider)initWithProgressURLs:(id)a3 progressURLSandboxExtensionTokens:(id)a4
{
  id v6;
  id v7;
  PUPhotosFileProviderItemProvider *v8;
  uint64_t v9;
  NSDictionary *progressURLs;
  uint64_t v11;
  NSDictionary *progressURLSandboxExtensionTokens;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosFileProviderItemProvider;
  v8 = -[PUPhotosFileProviderItemProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    progressURLs = v8->_progressURLs;
    v8->_progressURLs = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    progressURLSandboxExtensionTokens = v8->_progressURLSandboxExtensionTokens;
    v8->_progressURLSandboxExtensionTokens = (NSDictionary *)v11;

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD1768], "removeSubscriber:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

  }
  -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          NSStringFromSelector(sel_fractionCompleted);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObserver:forKeyPath:context:", self, v18, PUPhotosFileProviderItemProviderContext);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

  }
  v19.receiver = self;
  v19.super_class = (Class)PUPhotosFileProviderItemProvider;
  -[PUPhotosFileProviderItemProvider dealloc](&v19, sel_dealloc);
}

- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl(&dword_20D1E2000, v7, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadObjectOfClass: %@", buf, 0xCu);

  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_6;
LABEL_9:
    v19.receiver = self;
    v19.super_class = (Class)PUPhotosFileProviderItemProvider;
    -[PUPhotosFileProviderItemProvider loadObjectOfClass:completionHandler:](&v19, sel_loadObjectOfClass_completionHandler_, a3, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((Class)objc_opt_class() != a3)
    goto LABEL_9;
  PFCurrentPlatformLivePhotoBundleType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
LABEL_6:
  -[PUPhotosFileProviderItemProvider _progressURLForTypeIdentifier:](self, "_progressURLForTypeIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke;
    v26[3] = &unk_24C62C258;
    v14 = v6;
    v27 = v14;
    -[PUPhotosFileProviderItemProvider _startProgressForURL:UUID:cancellationHandler:](self, "_startProgressForURL:UUID:cancellationHandler:", v11, v12, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_2;
    v22[3] = &unk_24C62C280;
    objc_copyWeak(&v25, (id *)buf);
    v16 = v12;
    v23 = v16;
    v24 = v14;
    v21.receiver = self;
    v21.super_class = (Class)PUPhotosFileProviderItemProvider;
    v17 = -[PUPhotosFileProviderItemProvider loadObjectOfClass:completionHandler:](&v21, sel_loadObjectOfClass_completionHandler_, a3, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PUPhotosFileProviderItemProvider;
    -[PUPhotosFileProviderItemProvider loadObjectOfClass:completionHandler:](&v20, sel_loadObjectOfClass_completionHandler_, a3, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v15;
}

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadDataRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  -[PUPhotosFileProviderItemProvider _progressURLForTypeIdentifier:](self, "_progressURLForTypeIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_24C62C258;
    v12 = v7;
    v24 = v12;
    -[PUPhotosFileProviderItemProvider _startProgressForURL:UUID:cancellationHandler:](self, "_startProgressForURL:UUID:cancellationHandler:", v9, v10, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    v19[3] = &unk_24C62C2A8;
    objc_copyWeak(&v22, (id *)buf);
    v14 = v10;
    v20 = v14;
    v21 = v12;
    v18.receiver = self;
    v18.super_class = (Class)PUPhotosFileProviderItemProvider;
    v15 = -[PUPhotosFileProviderItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](&v18, sel_loadDataRepresentationForTypeIdentifier_completionHandler_, v6, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PUPhotosFileProviderItemProvider;
    -[PUPhotosFileProviderItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](&v17, sel_loadDataRepresentationForTypeIdentifier_completionHandler_, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)loadFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PUPhotosFileProviderItemProvider _progressURLForTypeIdentifier:](self, "_progressURLForTypeIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20D1E2000, v9, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadFileRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_24C62C258;
    v12 = v7;
    v24 = v12;
    -[PUPhotosFileProviderItemProvider _startProgressForURL:UUID:cancellationHandler:](self, "_startProgressForURL:UUID:cancellationHandler:", v8, v10, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    v19[3] = &unk_24C62C2D0;
    objc_copyWeak(&v22, (id *)buf);
    v14 = v10;
    v20 = v14;
    v21 = v12;
    v18.receiver = self;
    v18.super_class = (Class)PUPhotosFileProviderItemProvider;
    v15 = -[PUPhotosFileProviderItemProvider loadFileRepresentationForTypeIdentifier:completionHandler:](&v18, sel_loadFileRepresentationForTypeIdentifier_completionHandler_, v6, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PUPhotosFileProviderItemProvider;
    -[PUPhotosFileProviderItemProvider loadFileRepresentationForTypeIdentifier:completionHandler:](&v17, sel_loadFileRepresentationForTypeIdentifier_completionHandler_, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)loadInPlaceFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadInPlaceFileRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  if (dyld_program_sdk_at_least()
    && !-[PUPhotosFileProviderItemProvider _copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler](self, "_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler"))
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D1E2000, v9, OS_LOG_TYPE_FAULT, "loadInPlaceFileRepresentationForTypeIdentifier: is not supported. Use loadFileRepresentationForTypeIdentifier: instead.", buf, 2u);
    }

  }
  -[PUPhotosFileProviderItemProvider _progressURLForTypeIdentifier:](self, "_progressURLForTypeIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosFileProviderItemProvider _sanitizedSuggestedName](self, "_sanitizedSuggestedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __101__PUPhotosFileProviderItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_24C62C2F8;
  v23 = v13;
  v24 = v7;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v7;
  -[PUPhotosFileProviderItemProvider loadFileRepresentationForTypeIdentifier:completionHandler:](self, "loadFileRepresentationForTypeIdentifier:completionHandler:", v6, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_startProgressForURL:(id)a3 UUID:(id)a4 cancellationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 10000);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke;
  v33[3] = &unk_24C62C498;
  v13 = v10;
  v34 = v13;
  objc_msgSend(v11, "setCancellationHandler:", v33);
  -[PUPhotosFileProviderItemProvider _progressByUUID](self, "_progressByUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[PUPhotosFileProviderItemProvider set_progressByUUID:](self, "set_progressByUUID:", v15);

  }
  -[PUPhotosFileProviderItemProvider _progressByUUID](self, "_progressByUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v9);

  -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[PUPhotosFileProviderItemProvider set_progressSubscriberByUUID:](self, "set_progressSubscriberByUUID:", v18);

  }
  v19 = (void *)MEMORY[0x24BDD1768];
  v20 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v8, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fileURLWithPath:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  v28 = 3221225472;
  v29 = __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke_2;
  v30 = &unk_24C62C320;
  objc_copyWeak(&v32, &location);
  v23 = v9;
  v31 = v23;
  objc_msgSend(v19, "addSubscriberForFileURL:withPublishingHandler:", v22, &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID", v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v23);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_startObservingProgressProxyIfNeeded:(id)a3 UUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[PUPhotosFileProviderItemProvider set_progressProxyByUUID:](self, "set_progressProxyByUUID:", v10);

    }
    -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v6);

    NSStringFromSelector(sel_fractionCompleted);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, v12, 4, PUPhotosFileProviderItemProviderContext);

  }
}

- (void)_completeProgressWithUUID:(id)a3 success:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
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
  id v19;

  v6 = a4;
  v19 = a3;
  v8 = (void (**)(_QWORD))a5;
  -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x24BDD1768], "removeSubscriber:", v10);
  -[PUPhotosFileProviderItemProvider _progressSubscriberByUUID](self, "_progressSubscriberByUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v19);

  -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_fractionCompleted);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, v14, PUPhotosFileProviderItemProviderContext);

  -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v19);

  -[PUPhotosFileProviderItemProvider _progressByUUID](self, "_progressByUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosFileProviderItemProvider _progressByUUID](self, "_progressByUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v19);

  if ((objc_msgSend(v17, "isCancelled") & 1) == 0)
  {
    if (v6)
      objc_msgSend(v17, "setCompletedUnitCount:", objc_msgSend(v17, "totalUnitCount"));
    v8[2](v8);
  }

}

- (id)_progressURLForTypeIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  -[PUPhotosFileProviderItemProvider _representationConformingToType:](self, "_representationConformingToType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_DEBUG, "Can't find item provider representation for the progress URL.", v15, 2u);
    }
    goto LABEL_10;
  }
  -[PUPhotosFileProviderItemProvider progressURLs](self, "progressURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  -[PUPhotosFileProviderItemProvider progressURLSandboxExtensionTokens](self, "progressURLSandboxExtensionTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !v11)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D1E2000, v13, OS_LOG_TYPE_DEBUG, "Can't find progress URL or its sandbox extension token.", buf, 2u);
    }

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72258]), "initWithURL:sandboxExtensionToken:consume:", v8, v11, 1);

LABEL_11:
  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  double v26;
  NSObject *v27;
  id v28;
  id v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if ((void *)PUPhotosFileProviderItemProviderContext == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (NSStringFromSelector(sel_fractionCompleted),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v10, "isEqualToString:", v12),
          v12,
          v13))
    {
      v28 = v11;
      v29 = v10;
      v14 = v11;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[PUPhotosFileProviderItemProvider _progressProxyByUUID](self, "_progressProxyByUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allKeysForObject:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v32 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            -[PUPhotosFileProviderItemProvider _progressByUUID](self, "_progressByUUID", v28, v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              if ((objc_msgSend(v23, "isCancelled") & 1) != 0)
              {
                PLUIGetLog();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v36 = v23;
                  _os_log_impl(&dword_20D1E2000, v24, OS_LOG_TYPE_DEBUG, "Ignored progress updates for local progress (%@) because it's already cancelled.", buf, 0xCu);
                }

              }
              else
              {
                objc_msgSend(v14, "fractionCompleted");
                objc_msgSend(v23, "setCompletedUnitCount:", (uint64_t)(v26 * (double)objc_msgSend(v23, "totalUnitCount")));
              }
            }
            else
            {
              PLUIGetLog();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v36 = v14;
                v37 = 2112;
                v38 = v21;
                _os_log_impl(&dword_20D1E2000, v25, OS_LOG_TYPE_DEFAULT, "No matching local progress is found for remote progress (%@) with UUID (%@).", buf, 0x16u);
              }

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v18);
      }

      v11 = v28;
      v10 = v29;
    }
    else
    {
      PLUIGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v11;
        v37 = 2112;
        v38 = v10;
        _os_log_impl(&dword_20D1E2000, v27, OS_LOG_TYPE_DEFAULT, "Received invalid object (%@) or keypath (%@) for the progress context.", buf, 0x16u);
      }

    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PUPhotosFileProviderItemProvider;
    -[PUPhotosFileProviderItemProvider observeValueForKeyPath:ofObject:change:context:](&v30, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

- (BOOL)_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler
{
  return self->__copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler;
}

- (void)set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:(BOOL)a3
{
  self->__copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler = a3;
}

- (NSDictionary)progressURLs
{
  return self->_progressURLs;
}

- (void)setProgressURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)progressURLSandboxExtensionTokens
{
  return self->_progressURLSandboxExtensionTokens;
}

- (void)setProgressURLSandboxExtensionTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSMutableDictionary)_progressByUUID
{
  return self->__progressByUUID;
}

- (void)set_progressByUUID:(id)a3
{
  objc_storeStrong((id *)&self->__progressByUUID, a3);
}

- (NSMutableDictionary)_progressProxyByUUID
{
  return self->__progressProxyByUUID;
}

- (void)set_progressProxyByUUID:(id)a3
{
  objc_storeStrong((id *)&self->__progressProxyByUUID, a3);
}

- (NSMutableDictionary)_progressSubscriberByUUID
{
  return self->__progressSubscriberByUUID;
}

- (void)set_progressSubscriberByUUID:(id)a3
{
  objc_storeStrong((id *)&self->__progressSubscriberByUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressSubscriberByUUID, 0);
  objc_storeStrong((id *)&self->__progressProxyByUUID, 0);
  objc_storeStrong((id *)&self->__progressByUUID, 0);
  objc_storeStrong((id *)&self->_progressURLSandboxExtensionTokens, 0);
  objc_storeStrong((id *)&self->_progressURLs, 0);
}

void __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0E40], 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_startObservingProgressProxyIfNeeded:UUID:", v4, *(_QWORD *)(a1 + 32));

  return 0;
}

void __101__PUPhotosFileProviderItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 64))
  {
    if (!v5
      || dyld_program_sdk_at_least()
      && !objc_msgSend(*(id *)(a1 + 32), "_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler"))
    {
LABEL_28:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_29;
    }
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = dyld_program_sdk_at_least() ^ 1;
      v9 = objc_msgSend(*(id *)(a1 + 32), "_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v5;
      v42 = 2048;
      v43 = v8;
      v44 = 2048;
      v45 = v9;
      _os_log_impl(&dword_20D1E2000, v7, OS_LOG_TYPE_DEFAULT, "Copying URL (%@) because (old SDK: %ld, explicit: %ld) (loadInPlaceFileRepresentationForTypeIdentifier:)", buf, 0x20u);
    }

    v10 = *(void **)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v13 = v5;
    v14 = v10;
    v15 = v11;
    v39 = v12;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "temporaryDirectory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.Photos.NSItemProvider"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v14, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v20;
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v23 = objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, buf);
    v24 = *(id *)buf;

    if (!v23)
    {
      v28 = objc_retainAutorelease(v24);
      v5 = 0;
      goto LABEL_25;
    }
    if (v15)
    {
      objc_msgSend(v19, "URLByAppendingPathComponent:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "pathExtension");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v13, "pathExtension");
        v27 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "URLByAppendingPathExtension:", v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)v27;
      }
      else
      {
        if (!v39)
        {
          v19 = v25;
          goto LABEL_21;
        }
        objc_msgSend(v25, "URLByAppendingPathExtensionForType:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v13, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v13, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", v25);
        v30 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v30;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", v31);
        v38 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v38;
      }
    }

LABEL_21:
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeItemAtURL:error:", v19, 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v34 = objc_msgSend(v33, "copyItemAtURL:toURL:error:", v13, v19, &v40);
    v35 = v40;

    if (v34)
    {
      v5 = v19;
      v28 = v6;
    }
    else
    {
      v28 = objc_retainAutorelease(v35);
      v5 = 0;
    }

LABEL_25:
    v36 = v28;

    PLUIGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_20D1E2000, v37, OS_LOG_TYPE_DEFAULT, "Copied to URL (%@) (loadInPlaceFileRepresentationForTypeIdentifier:)", buf, 0xCu);
    }

    v6 = v36;
    goto LABEL_28;
  }
LABEL_29:

}

uint64_t __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  v12[3] = &unk_24C62C768;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(WeakRetained, "_completeProgressWithUUID:success:completionHandler:", v8, v5 != 0, v12);

}

uint64_t __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

uint64_t __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  v12[3] = &unk_24C62C768;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(WeakRetained, "_completeProgressWithUUID:success:completionHandler:", v8, v5 != 0, v12);

}

uint64_t __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

uint64_t __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_3;
  v12[3] = &unk_24C62C768;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(WeakRetained, "_completeProgressWithUUID:success:completionHandler:", v8, v5 != 0, v12);

}

uint64_t __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

@end
