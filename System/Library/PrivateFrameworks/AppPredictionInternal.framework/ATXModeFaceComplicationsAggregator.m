@implementation ATXModeFaceComplicationsAggregator

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isBetaBuild") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C9AA60];
  v12 = v8;
  if (v6)
  {
    objc_msgSend(v7, "provideComplicationsForSuggestedFaceType:environment:", a3, v5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = v11;
    objc_msgSend(v10, "addObjectsFromArray:", v15);

    objc_msgSend(v8, "provideComplicationsForSuggestedFaceType:environment:", a3, v5);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = v11;
    objc_msgSend(v10, "addObjectsFromArray:", v18);

    v12 = v9;
  }
  objc_msgSend(v12, "provideComplicationsForSuggestedFaceType:environment:", a3, v5);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = v19;
  else
    v21 = v11;
  objc_msgSend(v10, "addObjectsFromArray:", v21);

  objc_msgSend(v10, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_58);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = &unk_1E83CC178;
  v24 = (void *)objc_opt_new();
  v34[0] = v24;
  v33[1] = &unk_1E83CC190;
  v25 = (void *)objc_opt_new();
  v34[1] = v25;
  v33[2] = &unk_1E83CC1A8;
  v26 = (void *)objc_opt_new();
  v34[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_17;
  v31[3] = &unk_1E82DE740;
  v32 = v27;
  v28 = v27;
  objc_msgSend(v23, "_pas_filteredArrayWithTest:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

uint64_t __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "score");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "score");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "widgetFamily"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
      {
        v8 = 0;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v7, "addObject:", v4);
    }
    else
    {
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_17_cold_1(v3, v9);

    }
    v8 = 1;
    goto LABEL_11;
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "provideLandscapeComplicationsForSuggestedFaceType:environment:", a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __100__ATXModeFaceComplicationsAggregator_provideLandscapeComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "score");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "score");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_17_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "widgetFamily");
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unrecognized widget family: %ld", (uint8_t *)&v3, 0xCu);
}

@end
