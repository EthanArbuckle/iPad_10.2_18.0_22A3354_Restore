@implementation ARTechniqueParallelGatherContext

- (ARTechniqueParallelGatherContext)initWithParentContext:(id)a3 previousContext:(id)a4 requiredTechniqueIndices:(id)a5 deterministicTechniqueIndices:(id)a6 techniques:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ARTechniqueParallelGatherContext *v17;
  ARTechniqueParallelGatherContext *v18;
  uint64_t v19;
  NSIndexSet *requiredTechniqueIndices;
  uint64_t v21;
  NSIndexSet *deterministicTechniqueIndices;
  uint64_t v23;
  NSMutableDictionary *gatheredDataByTechniqueIndex;
  uint64_t v25;
  NSMapTable *techniquesByIndex;
  _QWORD v28[4];
  ARTechniqueParallelGatherContext *v29;
  objc_super v30;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ARTechniqueParallelGatherContext;
  v17 = -[ARTechniqueGatherContext initWithParentContext:](&v30, sel_initWithParentContext_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_previousContext, a4);
    v19 = objc_msgSend(v14, "copy");
    requiredTechniqueIndices = v18->_requiredTechniqueIndices;
    v18->_requiredTechniqueIndices = (NSIndexSet *)v19;

    v21 = objc_msgSend(v15, "copy");
    deterministicTechniqueIndices = v18->_deterministicTechniqueIndices;
    v18->_deterministicTechniqueIndices = (NSIndexSet *)v21;

    v18->_techniqueCount = objc_msgSend(v16, "count");
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18->_techniqueCount);
    gatheredDataByTechniqueIndex = v18->_gatheredDataByTechniqueIndex;
    v18->_gatheredDataByTechniqueIndex = (NSMutableDictionary *)v23;

    v18->_gatherLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    techniquesByIndex = v18->_techniquesByIndex;
    v18->_techniquesByIndex = (NSMapTable *)v25;

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __140__ARTechniqueParallelGatherContext_initWithParentContext_previousContext_requiredTechniqueIndices_deterministicTechniqueIndices_techniques___block_invoke;
    v28[3] = &unk_1E6674E78;
    v29 = v18;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v28);

  }
  return v18;
}

void __140__ARTechniqueParallelGatherContext_initWithParentContext_previousContext_requiredTechniqueIndices_deterministicTechniqueIndices_techniques___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

}

- (id)gatheredData
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ARTechniqueParallelGatherContext _allGatheredDataByTechniqueIndex](self, "_allGatheredDataByTechniqueIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)indexForTechnique:(id)a3
{
  id v4;
  unint64_t v5;
  NSMapTable *techniquesByIndex;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_techniqueCount)
  {
    v5 = 0;
    while (1)
    {
      techniquesByIndex = self->_techniquesByIndex;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](techniquesByIndex, "objectForKey:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        break;
      if (++v5 >= self->_techniqueCount)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)deterministicResultsCaptured
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSIndexSet count](self->_deterministicTechniqueIndices, "count"))
    return 1;
  os_unfair_lock_lock(&self->_gatherLock);
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_gatheredDataByTechniqueIndex, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "integerValue"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_gatherLock);
  v9 = objc_msgSend(v3, "containsIndexes:", self->_deterministicTechniqueIndices);

  return v9;
}

- (id)_allGatheredDataByTechniqueIndex
{
  os_unfair_lock_s *p_gatherLock;
  ARTechniqueParallelGatherContext *previousContext;
  void *v5;
  void *v6;

  p_gatherLock = &self->_gatherLock;
  os_unfair_lock_lock(&self->_gatherLock);
  previousContext = self->_previousContext;
  if (previousContext)
  {
    -[ARTechniqueParallelGatherContext _allGatheredDataByTechniqueIndex](previousContext, "_allGatheredDataByTechniqueIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  v6 = v5;
  objc_msgSend(v5, "addEntriesFromDictionary:", self->_gatheredDataByTechniqueIndex);
  os_unfair_lock_unlock(p_gatherLock);
  return v6;
}

- (id)captureGatheredData
{
  void *v3;
  void *v4;
  ARTechniqueParallelGatherContext *previousContext;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *gatheredDataByTechniqueIndex;
  NSMutableDictionary *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  ARTechniqueParallelGatherContext *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  os_unfair_lock_lock(&self->_gatherLock);
  previousContext = self->_previousContext;
  if (previousContext)
  {
    -[ARTechniqueParallelGatherContext _allGatheredDataByTechniqueIndex](previousContext, "_allGatheredDataByTechniqueIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  v7 = v6;
  objc_msgSend(v6, "addEntriesFromDictionary:", self->_gatheredDataByTechniqueIndex, 16);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v7;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    v34 = v3;
    v35 = *(_QWORD *)v38;
    v36 = v4;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v14);

        if (-[NSIndexSet containsIndex:](self->_requiredTechniqueIndices, "containsIndex:", objc_msgSend(v13, "integerValue")))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_gatheredDataByTechniqueIndex, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            if (_ARLogTechnique_onceToken_15 != -1)
              dispatch_once(&_ARLogTechnique_onceToken_15, &__block_literal_global_173_1);
            v16 = (void *)_ARLogTechnique_logObj_15;
            if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_15, OS_LOG_TYPE_INFO))
            {
              v17 = v16;
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v13, "integerValue");
              -[NSMapTable objectForKey:](self->_techniquesByIndex, "objectForKey:", v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARTechniqueGatherContext imageData](self, "imageData");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "timestamp");
              *(_DWORD *)buf = 138544386;
              v42 = v19;
              v43 = 2048;
              v44 = self;
              v45 = 2048;
              v46 = v20;
              v47 = 2112;
              v48 = v21;
              v49 = 2048;
              v50 = v23;
              _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Technique %ld (%@) result data missed frame %f", buf, 0x34u);

              v3 = v34;
            }
            -[ARTechniqueGatherContext imageData](self, "imageData");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timestamp");

            objc_msgSend(v13, "integerValue");
            kdebug_trace();
            -[NSMapTable objectForKey:](self->_techniquesByIndex, "objectForKey:", v13);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
            {
              objc_msgSend(v25, "traceKey");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (ARTechnique_Result_Drop_onceToken != -1)
                dispatch_once(&ARTechnique_Result_Drop_onceToken, &__block_literal_global_175);
              objc_msgSend((id)ARTechnique_Result_Drop_keyToCode, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "intValue");

              kdebug_trace();
            }

            v4 = v36;
            v11 = v35;
          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v8, "removeObjectsForKeys:", v4);
  gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
  self->_gatheredDataByTechniqueIndex = v8;
  v30 = v8;

  self->_resultsCaptured = 1;
  v31 = *(Class *)((char *)&self->super.super.isa + v33);
  *(Class *)((char *)&self->super.super.isa + v33) = 0;

  os_unfair_lock_unlock(&self->_gatherLock);
  return v3;
}

- (id)addResultData:(id)a3 forTechniqueAtIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_gatherLock;
  id v7;
  NSMutableDictionary *gatheredDataByTechniqueIndex;
  void *v9;
  NSMutableIndexSet *lateResultTechniqueIndices;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *v12;
  void *v13;

  p_gatherLock = &self->_gatherLock;
  v7 = a3;
  os_unfair_lock_lock(p_gatherLock);
  gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](gatheredDataByTechniqueIndex, "setObject:forKeyedSubscript:", v7, v9);

  if (self->_resultsCaptured)
  {
    lateResultTechniqueIndices = self->_lateResultTechniqueIndices;
    if (!lateResultTechniqueIndices)
    {
      v11 = (NSMutableIndexSet *)objc_opt_new();
      v12 = self->_lateResultTechniqueIndices;
      self->_lateResultTechniqueIndices = v11;

      lateResultTechniqueIndices = self->_lateResultTechniqueIndices;
    }
    -[NSMutableIndexSet addIndex:](lateResultTechniqueIndices, "addIndex:", a4);
  }
  -[ARTechniqueParallelGatherContext lateResultDataForTechniqueAtIndex:](self->_previousContext, "lateResultDataForTechniqueAtIndex:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_gatherLock);
  return v13;
}

- (id)lateResultDataForTechniqueAtIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_gatherLock;
  NSMutableDictionary *gatheredDataByTechniqueIndex;
  void *v7;
  void *v8;

  p_gatherLock = &self->_gatherLock;
  os_unfair_lock_lock(&self->_gatherLock);
  if (-[NSMutableIndexSet containsIndex:](self->_lateResultTechniqueIndices, "containsIndex:", a3))
  {
    gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](gatheredDataByTechniqueIndex, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ARTechniqueParallelGatherContext lateResultDataForTechniqueAtIndex:](self->_previousContext, "lateResultDataForTechniqueAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_gatherLock);
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v11.receiver = self;
  v11.super_class = (Class)ARTechniqueParallelGatherContext;
  -[ARTechniqueGatherContext description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\r"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ARTechniqueParallelGatherContext requiredTimeIntervalComplete](self, "requiredTimeIntervalComplete"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("RequiredTimeIntervalComplete: %@\r"), v6);
  if (-[ARTechniqueParallelGatherContext deterministicResultsCaptured](self, "deterministicResultsCaptured"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("DeterministicResultsCaptured: %@\r"), v7);
  -[ARTechniqueGatherContext imageData](self, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  objc_msgSend(v5, "appendFormat:", CFSTR("ImageData timestamp: %f\r"), v9);

  os_unfair_lock_lock(&self->_gatherLock);
  objc_msgSend(v5, "appendFormat:", CFSTR("Techniques ByIndex: %@\r"), self->_techniquesByIndex);
  objc_msgSend(v5, "appendFormat:", CFSTR("Late Results ByIndex: %@\r"), self->_lateResultTechniqueIndices);
  objc_msgSend(v5, "appendFormat:", CFSTR("GatheredData ByIndex: %@\r"), self->_gatheredDataByTechniqueIndex);
  os_unfair_lock_unlock(&self->_gatherLock);
  return v5;
}

- (BOOL)requiredTimeIntervalComplete
{
  return self->_requiredTimeIntervalComplete;
}

- (void)setRequiredTimeIntervalComplete:(BOOL)a3
{
  self->_requiredTimeIntervalComplete = a3;
}

- (unint64_t)techniqueCount
{
  return self->_techniqueCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_techniquesByIndex, 0);
  objc_storeStrong((id *)&self->_lateResultTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_gatheredDataByTechniqueIndex, 0);
  objc_storeStrong((id *)&self->_deterministicTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_requiredTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
}

@end
