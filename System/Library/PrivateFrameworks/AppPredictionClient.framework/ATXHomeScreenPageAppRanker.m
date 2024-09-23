@implementation ATXHomeScreenPageAppRanker

- (id)appsInAscendingOrderOfHistoricalUsageForPage:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v20 = 0;
  objc_msgSend(v5, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "pageIndex", (_QWORD)v16) == a3)
        {
          -[ATXHomeScreenPageAppRanker appsInAscendingOrderOfHistoricalUsage:](self, "appsInAscendingOrderOfHistoricalUsage:", v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_12:

  return v12;
}

- (id)appsInAscendingOrderOfHistoricalUsage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  objc_msgSend(a3, "nonFolderAppsOnPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "App");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "InFocus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_publisherFromStartTime:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_2;
  v26[3] = &unk_1E4D589B8;
  v27 = v4;
  v15 = v5;
  v28 = v15;
  v16 = v4;
  v17 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_19, v26);
  objc_msgSend(v16, "minusSet:", v15);
  objc_msgSend(v16, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v15, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_3;
  v24[3] = &unk_1E4D58578;
  v25 = v15;
  v21 = v15;
  objc_msgSend(v20, "sortedArrayUsingComparator:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v22);

  return v19;
}

void __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "eventBody");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "starting") && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 > v8)
    return 1;
  else
    return v9;
}

@end
