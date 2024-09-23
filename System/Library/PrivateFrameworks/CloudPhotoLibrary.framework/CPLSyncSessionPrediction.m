@implementation CPLSyncSessionPrediction

- (CPLSyncSessionPrediction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLSyncSessionPrediction;
  return -[CPLSyncSessionPrediction init](&v3, sel_init);
}

- (CPLSyncSessionPrediction)initWithPredictedValuesAndTypes:(id)a3
{
  id v4;
  CPLSyncSessionPrediction *v5;
  uint64_t v6;
  NSDictionary *predictions;

  v4 = a3;
  v5 = -[CPLSyncSessionPrediction init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    predictions = v5->_predictions;
    v5->_predictions = (NSDictionary *)v6;

  }
  return v5;
}

- (id)predictedValueForType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_predictions, "objectForKeyedSubscript:", a3);
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_predictions, "objectForKeyedSubscript:", a3);
}

- (id)updatedPredictionWithValuesAndTypes:(id)a3
{
  id v4;
  CPLSyncSessionPrediction *v5;
  CPLSyncSessionPrediction *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__329;
  v13 = __Block_byref_object_dispose__330;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CPLSyncSessionPrediction_updatedPredictionWithValuesAndTypes___block_invoke;
  v8[3] = &unk_1E60DA908;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (v10[5])
  {
    v5 = [CPLSyncSessionPrediction alloc];
    v6 = -[CPLSyncSessionPrediction initWithPredictedValuesAndTypes:](v5, "initWithPredictedValuesAndTypes:", v10[5]);
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[NSDictionary count](self->_predictions, "count"))
    return CFSTR("<no predictions>");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_predictions, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_opt_self();
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_84);
  obj = (id)_orderedPredictionTypes;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        if (v9)
          v10 = *(_QWORD *)(v9 + 8);
        else
          v10 = 0;
        -[NSDictionary objectForKeyedSubscript:](self->_predictions, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "longLongValue") >= 1)
        {
          if (v9)
            v12 = *(void **)(v9 + 16);
          else
            v12 = 0;
          v13 = v12;
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          if (v9)
            v15 = *(void **)(v9 + 8);
          else
            v15 = 0;
          v16 = v15;
          objc_msgSend(v13, "stringForObjectValue:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@: %@"), v16, v17);

          v3 = v7;
          objc_msgSend(v7, "addObject:", v18);

        }
        ++v8;
      }
      while (v5 != v8);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v5 = v19;
    }
    while (v19);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("<no predictions>");
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
}

void __64__CPLSyncSessionPrediction_updatedPredictionWithValuesAndTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    v7 = v5;
LABEL_15:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v17);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v17);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "isEqualToNumber:", v9);

    }
    else
    {
      v11 = objc_msgSend(v8, "isEqualToNumber:", &unk_1E6119E98);
    }

    if ((v11 & 1) == 0)
      goto LABEL_11;
  }
  else if (v9)
  {
    v12 = objc_msgSend(v9, "isEqualToNumber:", &unk_1E6119E98);

    if ((v12 & 1) == 0)
    {
LABEL_11:
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      if (v13)
        v14 = objc_msgSend(v13, "mutableCopy");
      else
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v7 = v10;
      goto LABEL_15;
    }
  }
LABEL_16:

}

@end
