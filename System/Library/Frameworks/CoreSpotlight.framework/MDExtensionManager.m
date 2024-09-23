@implementation MDExtensionManager

void __57___MDExtensionManager_findExtensionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = a5;
    objc_msgSend(a2, "allValues");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v8, v7);

  }
}

void __49___MDExtensionManager__notifyForLoadedExtensions__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_MDIndexExtensionsLoadedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("_MDImportExtensionsLoadedNotification"), 0);

}

uint64_t __44___MDExtensionManager_extensionForFileType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44___MDExtensionManager_extensionForFileType___block_invoke_cold_1(v3, v4);

  objc_msgSend(v3, "supportedFileTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  return v6;
}

id __47___MDExtensionManager__willRunJobWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("bundleid");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48___MDExtensionManager__didRetryJobWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("bundleid");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id obj;
  _QWORD v25[4];
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D782104]();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (*(_QWORD *)(a1 + 72) <= 1uLL)
      v3 = 1;
    else
      v3 = 2;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(v5, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
        break;
      v7 = (void *)v6;
      objc_msgSend(v4, "addObject:", v6);

      --v3;
    }
    while (v3);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v4, v5);
    v36 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "containerID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          logForCSLogCategoryIndex();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v38 = v16;
            v39 = 2112;
            v40 = v13;
            _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _MDExtensionManager#_performJob Performing job:%@, extension:%@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 48), "_willRunJobWithBundleID:", v14);
          v17 = *(void **)(a1 + 40);
          v25[0] = v11;
          v25[1] = 3221225472;
          v25[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46;
          v25[3] = &unk_1E2405258;
          v18 = v17;
          v26 = v18;
          v27 = v13;
          v19 = *(id *)(a1 + 56);
          v20 = *(_QWORD *)(a1 + 48);
          v28 = v19;
          v29 = v20;
          v30 = *(id *)(a1 + 32);
          v21 = *(id *)(a1 + 64);
          v31 = v14;
          v32 = v21;
          v22 = v14;
          objc_msgSend(v13, "performJob:completionBlock:", v18, v25);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v9);
    }

  }
  objc_autoreleasePoolPop(v2);
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    logForCSLogCategoryIndex();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46_cold_1();
    goto LABEL_13;
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CSIndexErrorDomain"));

  if ((v9 & 1) != 0)
    goto LABEL_9;
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46_cold_2();

  v11 = objc_msgSend(*(id *)(a1 + 48), "nextDispatchTimeDeltaForExtension:job:memoryPressure:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), sUnderMemoryPressure);
  if (v11 < 1)
  {
LABEL_9:
    logForCSLogCategoryIndex();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46_cold_2();
LABEL_13:

    v23 = *(_QWORD *)(a1 + 80);
    if (v23)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, *(_QWORD *)(a1 + 72), v7);
      v24 = *(_QWORD *)(a1 + 80);
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "_performJob:extensions:count:throttle:perExtensionCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 48), v24);
    goto LABEL_17;
  }
  v12 = v11;
  logForCSLogCategoryIndex();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v34 = v14;
    v35 = 2112;
    v36 = v15;
    v37 = 2048;
    v38 = v12 / 0x3B9ACA00;
    _os_log_impl(&dword_18C42F000, v13, OS_LOG_TYPE_DEFAULT, "Rescheduling job:%@, extension:%@, delta:%llds", buf, 0x20u);
  }

  v16 = dispatch_time(0, v12);
  v17 = *(void **)(a1 + 64);
  v18 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_47;
  block[3] = &unk_1E2405230;
  v19 = v17;
  v21 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v26 = v19;
  v27 = v20;
  v28 = *(_QWORD *)(a1 + 56);
  v29 = v21;
  v30 = *(id *)(a1 + 48);
  v32 = *(id *)(a1 + 80);
  v31 = *(id *)(a1 + 72);
  dispatch_after(v16, v18, block);

LABEL_17:
}

uint64_t __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_47(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_performJob:extensions:count:throttle:perExtensionCompletionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 48), "_didRetryJobWithBundleID:", *(_QWORD *)(a1 + 72));
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2_cold_1(a1, v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  objc_autoreleasePoolPop(v2);
}

void __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  id *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_2;
    v22[3] = &unk_1E24051E0;
    v5 = v22;
    v6 = (id *)(a1 + 32);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_3;
    v21 = &unk_1E24051E0;
    v6 = (id *)(a1 + 48);
    v5 = &v18;
  }
  v5[4] = (uint64_t)*v6;
  objc_msgSend(v4, "anyExtensionWithBlock:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "containerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 48));

    if ((v9 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setExtensionBundleID:", *(_QWORD *)(a1 + 48));
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_performJob:extensions:perExtensionCompletionHandler:completionHandler:", v11, v12, 0, *(_QWORD *)(a1 + 56));

  }
  else
  {
    logForCSLogCategoryIndex();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_cold_1();

    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v14, v15, v16);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "supportedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

void __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "extensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_performJob:extensions:perExtensionCompletionHandler:completionHandler:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1(a1, v4);

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

  objc_autoreleasePoolPop(v2);
}

void __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_2;
    v24[3] = &unk_1E24051E0;
    v4 = *(void **)(a1 + 40);
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v4, "anyExtensionWithBlock:", v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    v7 = v25;
  }
  else
  {
    v7 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = *(void **)(a1 + 40);
          v19[0] = v12;
          v19[1] = 3221225472;
          v19[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_3;
          v19[3] = &unk_1E24051E0;
          v19[4] = v14;
          objc_msgSend(v15, "anyExtensionWithBlock:", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v7, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
      v6 = (void *)objc_msgSend(v7, "copy");
    else
      v6 = 0;
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_performJob:extensions:perExtensionCompletionHandler:completionHandler:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    logForCSLogCategoryIndex();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1();

    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(void))(v18 + 16))();
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "supportedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

void __106___MDExtensionManager_indexRequestsPerformJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "_performJob:extensions:perExtensionCompletionHandler:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

void __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(WeakRetained, "getProviderIDForBundle:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "fileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "fileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionForFileType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke_2;
    v17 = &unk_1E24052F8;
    v18 = *(id *)(a1 + 40);
    v19 = v3;
    objc_msgSend(v5, "anyExtensionWithBlock:", &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerID", v14, v15, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v9 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "setExtensionBundleID:", *(_QWORD *)(a1 + 40));

  }
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_18C42F000, v10, OS_LOG_TYPE_INFO, "~~~ Extension to use: %@", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(v7, "performJob:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    logForCSLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(void **)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "~~~ Couldn't find an indexing extension for bundleID:%@, job:%@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    if (!v8)
      v8 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(v6, "containsObject:", v8);

  }
  return v5;
}

void __44___MDExtensionManager_extensionForFileType___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "supportedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "~~~ supportedTypes: %@", v4, 0xCu);

  OUTLINED_FUNCTION_7_4();
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v0, v1, "Finished job:%@, extension:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_46_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_2(&dword_18C42F000, v0, v1, "Failed to complete job:%@, extension:%@, error:%@");
  OUTLINED_FUNCTION_7_4();
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, a2, a3, "Finished job:%@ with %ld indexing extensions", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

void __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v0, (uint64_t)v0, "Couldn't find an indexing extension for bundleID:%@, job:%@", v1);
  OUTLINED_FUNCTION_1();
}

void __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "Failed to find any indexing extensions for job:%@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v0, (uint64_t)v0, "Couldn't find any indexing extensions for bundleIDs:%@, job:%@", v1);
  OUTLINED_FUNCTION_1();
}

@end
