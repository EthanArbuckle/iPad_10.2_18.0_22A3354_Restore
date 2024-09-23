@implementation SOExtensionFinder

- (SOExtensionFinder)init
{
  SOExtensionFinder *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *extensionFinderQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOExtensionFinder;
  v2 = -[SOExtensionFinder init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AppSSO.extension-finder-queue", 0);
    extensionFinderQueue = v2->_extensionFinderQueue;
    v2->_extensionFinderQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)findExtensionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *extensionFinderQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtensionFinder *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtensionFinder();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtensionFinder findExtensionsWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extensionFinderQueue = self->_extensionFinderQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(extensionFinderQueue, v8);

}

void __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1550];
  v15 = *MEMORY[0x24BDD0C48];
  v16[0] = CFSTR("com.apple.AppSSO.idp-extension");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "extensionsWithMatchingAttributes:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  SO_LOG_SOExtensionFinder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1();

  if (v5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_soExtensionsForExtensions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SO_LOG_SOExtensionFinder();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "findExtensionsWithCompletion: %{public}@, error: %{public}@", buf, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v5);

}

- (void)findExtensionWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *extensionFinderQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SOExtensionFinder *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  SOExtensionFinder *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtensionFinder();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SOExtensionFinder findExtensionWithBundleIdentifier:completion:]";
    v18 = 2114;
    v19 = v6;
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  extensionFinderQueue = self->_extensionFinderQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SOExtensionFinder_findExtensionWithBundleIdentifier_completion___block_invoke;
  block[3] = &unk_24C80C2F0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(extensionFinderQueue, block);

}

void __66__SOExtensionFinder_findExtensionWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id SOErrorHelperClass_5;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1550];
  v3 = *MEMORY[0x24BDD0C30];
  v22[0] = *MEMORY[0x24BDD0C48];
  v22[1] = v3;
  v4 = *(_QWORD *)(a1 + 32);
  v23[0] = CFSTR("com.apple.AppSSO.idp-extension");
  v23[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v2, "extensionsWithMatchingAttributes:error:", v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;

  SO_LOG_SOExtensionFinder();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1();

  if (v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_soExtensionsForExtensions:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_msgSend(v9, "count");
    SOErrorHelperClass_5 = getSOErrorHelperClass_5();
    if (v11)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("More than one IdP extension with bundle ID: %@"), *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No valid IdP extension with bundle ID: %@"), *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SOErrorHelperClass_5, "internalErrorWithMessage:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v7 = (id)v14;
  }
  SO_LOG_SOExtensionFinder();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_20DABC000, v15, OS_LOG_TYPE_DEFAULT, "findExtensionWithBundleIdentifier: %{public}@, error: %{public}@", buf, 0x16u);
  }

  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v10, v7);

}

- (void)beginMatchingExtensionsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id matchingContext;
  _QWORD v19[4];
  void (**v20)(id, _QWORD, void *);
  id v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  SOExtensionFinder *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  SO_LOG_SOExtensionFinder();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[SOExtensionFinder beginMatchingExtensionsWithCompletion:]";
    v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (self->_matchingContext)
  {
    SO_LOG_SOExtensionFinder();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SOExtensionFinder beginMatchingExtensionsWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    if (v4)
    {
      objc_msgSend(getSOErrorHelperClass_5(), "silentInternalErrorWithMessage:", CFSTR("Extension matching is already in progress, ignoring request"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v14);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v15 = (void *)MEMORY[0x24BDD1550];
    v22 = *MEMORY[0x24BDD0C48];
    v23 = CFSTR("com.apple.AppSSO.idp-extension");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke;
    v19[3] = &unk_24C80CCB0;
    objc_copyWeak(&v21, (id *)buf);
    v20 = v4;
    objc_msgSend(v15, "beginMatchingExtensionsWithAttributes:completion:", v16, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    matchingContext = self->_matchingContext;
    self->_matchingContext = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  NSObject **v23;
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  SO_LOG_SOExtensionFinder();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_2();

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[1];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_13;
    v21[3] = &unk_24C80C390;
    v22 = v6;
    v23 = v9;
    v24 = v5;
    v25 = *(id *)(a1 + 32);
    dispatch_async(v10, v21);

    v11 = v22;
LABEL_9:

    goto LABEL_10;
  }
  SO_LOG_SOExtensionFinder();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);

  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    objc_msgSend(getSOErrorHelperClass_5(), "silentInternalErrorWithMessage:", CFSTR("Extension matching deallocated, request failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v11);
    goto LABEL_9;
  }
LABEL_10:

}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_13(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_soExtensionsForExtensions:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SO_LOG_SOExtensionFinder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "beginMatchingExtensionsWithCompletion: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v2, *(_QWORD *)(a1 + 32));

}

- (void)endMatchingExtensions
{
  OUTLINED_FUNCTION_4(&dword_20DABC000, a1, a3, "extension matching not started, ignoring request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (id)_soExtensionsForExtensions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SOExtension *v11;
  SOExtension *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [SOExtension alloc];
        v12 = -[SOExtension initWithExtension:](v11, "initWithExtension:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_extensionFinderQueue, 0);
}

void __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_3(&dword_20DABC000, v0, v1, "extensionsWithMatchingAttributes: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)beginMatchingExtensionsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DABC000, a1, a3, "extension matching is already in progress, ignoring request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DABC000, a1, a3, "extension matching deallocated, request failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_3(&dword_20DABC000, v0, v1, "beginMatchingExtensionsWithAttributes: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
