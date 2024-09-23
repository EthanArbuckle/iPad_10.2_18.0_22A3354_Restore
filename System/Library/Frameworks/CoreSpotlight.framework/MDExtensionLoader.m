@implementation MDExtensionLoader

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E2404C90;
  v12 = v6;
  v8 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v13 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x18D782104]();
  if (a1[4])
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2_cold_1((uint64_t)(a1 + 4), v3, v4, v5, v6, v7, v8, v9);

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v10 = (void *)a1[5];
    v11 = a1[6];
    v16 = 0;
    v17 = 0;
    objc_msgSend(v10, "_filterIndexExtensions:outFileProviderBundleMap:outFileProviderBundleIDs:", v11, &v17, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    v14 = v16;
    v15 = a1[7];
    if (v15)
      (*(void (**)(uint64_t, void *, id, id, _QWORD))(v15 + 16))(v15, v12, v13, v14, 0);

  }
  objc_autoreleasePoolPop(v2);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "matchingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_cold_1(v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C42F000, v4, OS_LOG_TYPE_DEFAULT, "Started looking for indexing extensions", buf, 2u);
    }

    v5 = (void *)MEMORY[0x1E0CB35D8];
    objc_msgSend((id)objc_opt_class(), "_matchDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_38;
    v12 = &unk_1E2404CB8;
    v7 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(v5, "beginMatchingExtensionsWithAttributes:completion:", v6, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", v8, v9, v10, v11, v12, v13);

  }
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "beginMatchingExtensionsWithAttributes %@ %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_39;
  v12[3] = &unk_1E2404C90;
  v13 = v6;
  v9 = *(id *)(a1 + 40);
  v15 = v5;
  v16 = v9;
  v14 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, v12);

}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_39(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v2 = (void *)MEMORY[0x18D782104]();
  if (a1[4])
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_39_cold_1((uint64_t)(a1 + 4), v3, v4, v5, v6, v7, v8, v9);

    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v10 + 16))(v10, 0, 0, 0, a1[4]);
  }
  else
  {
    v11 = (void *)a1[5];
    v12 = a1[6];
    v17 = 0;
    v18 = 0;
    objc_msgSend(v11, "_filterIndexExtensions:outFileProviderBundleMap:outFileProviderBundleIDs:", v12, &v18, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    v15 = v17;
    v16 = a1[7];
    if (v16)
      (*(void (**)(uint64_t, void *, id, id, _QWORD))(v16 + 16))(v16, v13, v14, v15, 0);

  }
  objc_autoreleasePoolPop(v2);
}

void __46___MDExtensionLoader_stopLookingForExtensions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "matchingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35D8];
    objc_msgSend(*(id *)(a1 + 32), "matchingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endMatchingExtensions:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

void __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "Failed to find index extensions, error:%@", a5, a6, a7, a8, 2u);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "Already looking for indexing extensions", v1, 2u);
}

void __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke_39_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "Failed to find indexing extensions, error:%@", a5, a6, a7, a8, 2u);
}

@end
