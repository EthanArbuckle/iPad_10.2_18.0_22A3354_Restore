@implementation CPLSyncSessionPredictor

- (CPLSyncSessionPredictor)initWithIdentifier:(id)a3
{
  id v4;
  CPLSyncSessionPredictor *v5;
  CPLSyncSessionPredictor *v6;
  CPLSyncSessionPrediction *v7;
  CPLSyncSessionPrediction *currentPrediction;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSHashTable *observers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPLSyncSessionPredictor;
  v5 = -[CPLSyncSessionPredictor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc_init(CPLSyncSessionPrediction);
    currentPrediction = v6->_currentPrediction;
    v6->_currentPrediction = v7;

    v9 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v11;

  }
  return v6;
}

- (CPLSyncSessionPrediction)currentPrediction
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLSyncSessionPredictor *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__329;
  v15 = __Block_byref_object_dispose__330;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __44__CPLSyncSessionPredictor_currentPrediction__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLSyncSessionPrediction *)v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLSyncSessionPredictor *v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __39__CPLSyncSessionPredictor_addObserver___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLSyncSessionPredictor *v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __42__CPLSyncSessionPredictor_removeObserver___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

- (void)updatePredictionWithValuesAndTypes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[2];
  void (*v11)(_QWORD *);
  void *v12;
  CPLSyncSessionPredictor *v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__329;
  v23 = __Block_byref_object_dispose__330;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__329;
  v17[4] = __Block_byref_object_dispose__330;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke;
  v12 = &unk_1E60DDAA8;
  v15 = v17;
  v13 = self;
  v6 = v4;
  v14 = v6;
  v16 = &v19;
  v7 = v10;
  os_unfair_lock_lock(&self->_lock);
  v11(v7);
  os_unfair_lock_unlock(&self->_lock);

  v8 = (void *)v20[5];
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke_37;
  v9[3] = &unk_1E60D7600;
  v9[4] = self;
  v9[5] = v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)updatePredictedValue:(id)a3 forType:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLSyncSessionPredictor updatePredictionWithValuesAndTypes:](self, "updatePredictionWithValuesAndTypes:", v9);
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CPLSyncSessionPredictor currentPrediction](self, "currentPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ current: %@>"), v4, v5);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 24), "updatedPredictionWithValuesAndTypes:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 16), "allObjects");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
    if (!_CPLSilentLogging)
    {
      if (__CPLPredictorOSLogDomain_onceToken != -1)
        dispatch_once(&__CPLPredictorOSLogDomain_onceToken, &__block_literal_global_352);
      v8 = (void *)__CPLPredictorOSLogDomain_result;
      if (os_log_type_enabled((os_log_t)__CPLPredictorOSLogDomain_result, OS_LOG_TYPE_DEBUG))
      {
        v9 = *(_QWORD *)(a1[4] + 32);
        v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
        v12 = v8;
        v13 = 138543874;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        v17 = 2048;
        v18 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Updated predictions for %{public}@: %@ - informing %lu observers", (uint8_t *)&v13, 0x20u);

      }
    }
  }
}

uint64_t __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predictor:changedPrediction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __42__CPLSyncSessionPredictor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__CPLSyncSessionPredictor_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __44__CPLSyncSessionPredictor_currentPrediction__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)updatePredictionsWithDerivativesStatistics:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CPLSyncSessionPredictor *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v24 = self;
    v5 = +[CPLResource largeResourceSizeThreshold](CPLResource, "largeResourceSizeThreshold");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v27;
      v12 = 0.0;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v6);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v15, "generationDuration");
          if (v16 > 1.0)
          {
            v17 = v16;
            objc_msgSend(v15, "sourceResource");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identity");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "fileSize");

            if (v20 <= v5)
            {
              if (v20 != 0 && v17 > v13)
              {
                v10 = v20;
                v13 = v17;
              }
            }
            else if (v17 > v12)
            {
              v9 = v20;
              v12 = v17;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v12 = 0.0;
      v13 = 0.0;
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v10 / v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("derivativesSpeed"));

    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v9 / v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("largeDerivativesSpeed"));

    }
    if (objc_msgSend(v21, "count"))
      -[CPLSyncSessionPredictor updatePredictionWithValuesAndTypes:](v24, "updatePredictionWithValuesAndTypes:", v21);

    v4 = v25;
  }

}

@end
