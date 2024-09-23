@implementation HKCardioFitnessLevelContext

void __106___HKCardioFitnessLevelContext__updateContextItemWithChartPointCountForDateInterval_timeScope_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void (*v16)(void);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "userInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v12, "userInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "classification") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
              ++v9;

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v17 = *(void **)(a1 + 32);
    v18 = objc_msgSend(v17, "cardioFitnessLevel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_cardioFitnessContextItemWithLevel:chartPointCount:forTimeScope:", v18, v19, *(_QWORD *)(a1 + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v20);

    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v16();

}

void __102___HKCardioFitnessLevelContext__updateContextItemWithSampleCountForDateInterval_timeScope_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sampleType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_cardioFitnessContextItemWithLevel:sampleCount:", objc_msgSend(*(id *)(a1 + 32), "cardioFitnessLevel"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
