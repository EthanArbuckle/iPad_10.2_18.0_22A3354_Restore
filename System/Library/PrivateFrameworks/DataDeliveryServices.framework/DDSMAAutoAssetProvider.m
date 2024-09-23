@implementation DDSMAAutoAssetProvider

- (id)autoAssetForAssetSelector:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D4E060]);
  objc_msgSend(v3, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = (void *)objc_msgSend(v4, "initForClientName:selectingAsset:error:", CFSTR("com.apple.DataDeliveryServices"), v5, &v11);
  v7 = v11;

  if (v7)
  {
    AutoAssetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DDSMAAutoAssetProvider autoAssetForAssetSelector:].cold.1(v3);

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (void)fetchLockReasonCountForAutoAsset:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke;
  v9[3] = &unk_1EA1414D8;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "currentStatus:", v9);

}

void __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void (*v10)(void);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "code") == 6301)
  {
    AutoAssetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = (uint64_t)v9;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Auto asset status is not available for assetSelector: %{public}@", (uint8_t *)&v20, 0xCu);

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_13:
    v10();
    goto LABEL_14;
  }
  AutoAssetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke_cold_1(a1);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "currentLockUsage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218242;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Auto asset lock reason count: %lu for assetSelector: %{public}@", (uint8_t *)&v20, 0x16u);

  }
  v16 = *(_QWORD *)(a1 + 40);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "currentLockUsage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v19, 0);

LABEL_14:
}

- (void)lockAutoAsset:(id)a3 forReason:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  AutoAssetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "assetSelector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Lock auto asset: %@", buf, 0xCu);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0D4E070]);
  objc_msgSend(v14, "setUserInitiated:", 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__DDSMAAutoAssetProvider_lockAutoAsset_forReason_withTimeout_completion___block_invoke;
  v17[3] = &unk_1EA141500;
  v18 = v9;
  v19 = v10;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v16, "lockContent:withUsagePolicy:withTimeout:completion:", v11, v14, a5, v17);

}

void __73__DDSMAAutoAssetProvider_lockAutoAsset_forReason_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  AutoAssetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "Auto asset: %{public}@ present at path: %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get content localContentURL for: %{public}@ with error: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)lockAutoAssetSync:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  DDSAsset *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  objc_msgSend(v6, "lockContentSync:withTimeout:lockedAssetSelector:newerInProgress:error:", a4, 0, &v31, &v30, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  v9 = v30;
  v10 = v29;
  AutoAssetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      objc_msgSend(v6, "assetSelector");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v13;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "lockContentSync completed for auto asset: %@ with error: %@", buf, 0x16u);

    }
    v28 = v10;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4E060]), "initForClientName:selectingAsset:error:", CFSTR("data-delivery-service"), v8, &v28);
    v14 = v28;

    if (!v11)
    {
      AutoAssetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v8;
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1DA990000, v15, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset instance with selector: %@, error: %@", buf, 0x16u);
      }
      v20 = 0;
      v10 = v14;
      goto LABEL_24;
    }
    v27 = v14;
    -[NSObject currentStatusSync:](v11, "currentStatusSync:", &v27);
    v15 = objc_claimAutoreleasedReturnValue();
    v10 = v27;

    if (!v15)
    {
      AutoAssetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject assetSelector](v11, "assetSelector");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v21;
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_1DA990000, v16, OS_LOG_TYPE_DEFAULT, "Fetch status for locked auto asset: %@ completed with error: %@", buf, 0x16u);

      }
      v20 = 0;
      goto LABEL_23;
    }
    v16 = objc_opt_new();
    -[NSObject availableForUseAttributes](v15, "availableForUseAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[NSObject availableForUseAttributes](v15, "availableForUseAttributes");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSObject newerVersionAttributes](v15, "newerVersionAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_20:
        AutoAssetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject assetSelector](v11, "assetSelector");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v25;
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1DA990000, v24, OS_LOG_TYPE_DEFAULT, "Auto Asset: %@, Attributes: %@", buf, 0x16u);

        }
        v20 = -[DDSAsset initWithAttributes:localURL:]([DDSAsset alloc], "initWithAttributes:localURL:", v16, v7);
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      -[NSObject newerVersionAttributes](v15, "newerVersionAttributes");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v18;
    -[NSObject addEntriesFromDictionary:](v16, "addEntriesFromDictionary:", v18);

    goto LABEL_20;
  }
  if (v12)
  {
    objc_msgSend(v6, "assetSelector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v19;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "lockContentSync failed for auto asset: %@ with error: %@", buf, 0x16u);

  }
  v20 = 0;
LABEL_25:

  return v20;
}

- (void)unlockAutoAsset:(id)a3 forReason:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__DDSMAAutoAssetProvider_unlockAutoAsset_forReason___block_invoke;
  v7[3] = &unk_1EA141528;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "endLockUsage:completion:", a4, v7);

}

void __52__DDSMAAutoAssetProvider_unlockAutoAsset_forReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AutoAssetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      v9 = "Auto asset: %{public}@ unlocked successfully";
      v10 = v6;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);

    }
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v5;
    v9 = "End lock for auto asset: %{public}@ failed with error: %{public}@";
    v10 = v6;
    v11 = 22;
    goto LABEL_6;
  }

}

- (void)interestInContentForAutoAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke;
  v9[3] = &unk_1EA141550;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "interestInContent:completion:", CFSTR("dds-auto-asset-interest"), v9);

}

void __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  AutoAssetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "interestInContent successful for asset selector: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke_cold_1(a1, v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)eliminateInterestForAutoAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D4E060];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke;
  v6[3] = &unk_1EA141528;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "eliminateAllForSelector:completion:", v5, v6);

}

void __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AutoAssetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "eliminateAllForSelector successful for asset selector: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke_cold_1(a1, v5, v6);
  }

}

+ (void)setFetchAssetUpdateStatusDateForAutoAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("DDSAutoAssetPreferences"), v6, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AutoAssetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "assetSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "Did server lookup for auto asset: %@ on %@", buf, 0x16u);

  }
  DDSSetPreferenceObjectForKey(v9, v10);

}

+ (id)fetchAssetUpdateStatusDateForAutoAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "assetSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("DDSAutoAssetPreferences"), v6, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  DDSGetPreferenceObjectForKey(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)fetchUpdateStatusForAutoAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  AutoAssetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "assetSelector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for auto asset: %@", buf, 0xCu);

  }
  +[DDSMAAutoAssetProvider fetchAssetUpdateStatusDateForAutoAsset:](DDSMAAutoAssetProvider, "fetchAssetUpdateStatusDateForAutoAsset:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "timeIntervalSinceNow"), v11 > -86400.0))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke;
    v20[3] = &unk_1EA141578;
    v12 = &v21;
    v21 = v6;
    v13 = v6;
    objc_msgSend(v5, "currentStatus:", v20);
  }
  else
  {
    AutoAssetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DDSMAAutoAssetProvider fetchUpdateStatusForAutoAsset:completion:].cold.1(v5, v14);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_28;
    v17[3] = &unk_1EA1415A0;
    v12 = &v18;
    v15 = v5;
    v18 = v15;
    v19 = v6;
    v16 = v6;
    objc_msgSend(v15, "determineIfAvailable:withTimeout:completion:", CFSTR("dds-asset-download-ui-determine-if-available"), -2, v17);

  }
}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "notifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, objc_msgSend(v7, "newerVersionDiscovered"), 0);

  }
  else
  {
    AutoAssetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Cannot fetch the current status of auto asset due to error: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_28(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3)
  {
    v16 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E060]), "initForClientName:selectingAsset:error:", CFSTR("com.apple.DataDeliveryServices"), v7, &v16);
    v10 = v16;
    if (v9)
    {
      +[DDSMAAutoAssetProvider setFetchAssetUpdateStatusDateForAutoAsset:](DDSMAAutoAssetProvider, "setFetchAssetUpdateStatusDateForAutoAsset:", v9);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_29;
      v14[3] = &unk_1EA141578;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v9, "currentStatus:", v14);

    }
    else
    {
      AutoAssetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1DA990000, v13, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset for asset selector: %@ due to error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    AutoAssetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "Auto asset: %@, determineIfAvailable failed with error: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (objc_msgSend(v8, "code") == 6201)
      +[DDSMAAutoAssetProvider setFetchAssetUpdateStatusDateForAutoAsset:](DDSMAAutoAssetProvider, "setFetchAssetUpdateStatusDateForAutoAsset:", *(_QWORD *)(a1 + 32));
  }

}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "notifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, objc_msgSend(v7, "newerVersionDiscovered"), 0);

  }
  else
  {
    AutoAssetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Cannot fetch the current status of auto asset due to error: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)updateAutoAsset:(id)a3 forReason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AutoAssetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "assetSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "Download latest version of auto asset: %@", buf, 0xCu);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke;
  v15[3] = &unk_1EA1415F0;
  v16 = v9;
  v17 = v10;
  v15[4] = self;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v8, "determineIfAvailable:withTimeout:completion:", v13, -2, v15);

}

void __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v16 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E060]), "initForClientName:selectingAsset:error:", CFSTR("com.apple.DataDeliveryServices"), v6, &v16);
    v9 = v16;
    if (v8)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke_31;
      v14[3] = &unk_1EA1415C8;
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v10, "lockAutoAsset:forReason:withTimeout:completion:", v8, v11, -1, v14);

    }
    else
    {
      AutoAssetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1DA990000, v13, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset for asset selector: %@ due to error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    AutoAssetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Cannot determine the latest auto asset version due to error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)autoAssetForAssetSelector:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "assetSelector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DA990000, v2, v3, "Cannot create auto asset object for asset selector: %{public}@ due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DA990000, v2, v3, "Unexpected error while getting status of auto asset for assetSelector: %{public}@ error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, v4, "interestInContent failed for auto asset: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

void __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, a3, "eliminateAllForSelector failed for auto asset selector: %@", (uint8_t *)&v4);
}

- (void)fetchUpdateStatusForAutoAsset:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DA990000, a2, OS_LOG_TYPE_DEBUG, "Determine latest version of auto asset: %@ on server", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
