@implementation ARParentTechnique

- (void)dotGraphWithLines:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARParentTechnique;
  -[ARTechnique dotGraphWithLines:](&v21, sel_dotGraphWithLines_, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subgraph \"cluster_%p\" {"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = -[ARParentTechnique isParallel](self, "isParallel");
  v7 = CFSTR("orange");
  if (v6)
    v7 = CFSTR("blue");
  v8 = v7;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARParentTechnique techniques](self, "techniques");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"(%p)\" -> \"(%p)\"[style=bold color=%@]"), self, v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

        objc_msgSend(v14, "dotGraphWithLines:", v4);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("}"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

}

+ (id)parentTechniqueOfClass:(Class)a3 inArray:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v22 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v11, "_internalTechniques");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
LABEL_9:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_23;
              if (v14 == ++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                if (v14)
                  goto LABEL_9;
                break;
              }
            }
          }

          objc_msgSend(v11, "_internalTechniques");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[ARParentTechnique parentTechniqueOfClass:inArray:](ARParentTechnique, "parentTechniqueOfClass:inArray:", a3, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18
            || (objc_msgSend(v11, "splitTechniques"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                +[ARParentTechnique parentTechniqueOfClass:inArray:](ARParentTechnique, "parentTechniqueOfClass:inArray:", a3, v19), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19, v18))
          {
            v20 = v18;

            v12 = v11;
            v11 = v20;
LABEL_23:

            goto LABEL_24;
          }

          v8 = v22;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v11 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_24:

  return v11;
}

- (ARParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ARParentTechnique *v8;
  ARParentTechnique *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARParentTechnique;
  v8 = -[ARTechnique init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARTechnique setDelegate:](v8, "setDelegate:", v7);
    -[ARParentTechnique setTechniques:](v9, "setTechniques:", v6);
  }

  return v9;
}

- (ARParentTechnique)initWithTechniques:(id)a3
{
  return -[ARParentTechnique initWithTechniques:delegate:](self, "initWithTechniques:delegate:", a3, 0);
}

- (ARParentTechnique)initWithParallelTechniques:(id)a3
{
  ARParentTechnique *v3;
  ARParentTechnique *v4;
  uint64_t v5;
  OS_dispatch_queue *queue;

  v3 = -[ARParentTechnique initWithTechniques:delegate:](self, "initWithTechniques:delegate:", a3, 0);
  v4 = v3;
  if (v3)
  {
    v3->_parallelExecution = 1;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique");
    v5 = objc_claimAutoreleasedReturnValue();
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_previousContext_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)reuseTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ARParentTechnique techniques](self, "techniques");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARParentTechnique techniquesByReplacingOriginalTechniques:withReplacementTechniques:passingTest:](ARParentTechnique, "techniquesByReplacingOriginalTechniques:withReplacementTechniques:passingTest:", v5, v4, &__block_literal_global_42);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[ARParentTechnique setTechniques:](self, "setTechniques:", v7);
    v6 = v7;
  }

}

uint64_t __37__ARParentTechnique_reuseTechniques___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "reconfigurableFrom:", v4);
  if ((_DWORD)v6)
    objc_msgSend(v5, "reconfigureFrom:", v4);

  return v6;
}

- (BOOL)isParallel
{
  return self->_parallelExecution;
}

- (id)processData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARParentTechnique techniques](self, "techniques");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARParentTechnique processData:onTechniques:](self, "processData:onTechniques:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)processData:(id)a3 onTechniques:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v10 = v8;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    v10 = v8;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "processData:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  v17.receiver = self;
  v17.super_class = (Class)ARParentTechnique;
  -[ARTechnique processData:](&v17, sel_processData_, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ARParentTechnique techniques](self, "techniques");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ARParentTechnique requestResultDataAtTimestamp:context:onTechniques:](self, "requestResultDataAtTimestamp:context:onTechniques:", v6, v7, a3);

}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4 onTechniques:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  ARTechniqueParallelGatherContext *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  dispatch_time_t v27;
  NSObject *queue;
  ARTechniqueParallelGatherContext *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  ARTechniqueSequentialGatherContext *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ARParentTechnique *v41;
  id v42;
  id obj;
  _QWORD block[4];
  ARTechniqueParallelGatherContext *v45;
  id v46[2];
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    if (self->_parallelExecution)
    {
      objc_msgSend(v9, "indexesOfObjectsPassingTest:", &__block_literal_global_7);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexesOfObjectsPassingTest:", &__block_literal_global_8_1);
      v11 = objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_previousContext_lock);
      v40 = (void *)v10;
      v41 = self;
      v39 = (void *)v11;
      v12 = -[ARTechniqueParallelGatherContext initWithParentContext:previousContext:requiredTechniqueIndices:deterministicTechniqueIndices:techniques:]([ARTechniqueParallelGatherContext alloc], "initWithParentContext:previousContext:requiredTechniqueIndices:deterministicTechniqueIndices:techniques:", v8, self->_previousContext, v10, v11, v9);
      objc_storeStrong((id *)&self->_previousContext, v12);
      os_unfair_lock_unlock(&self->_previousContext_lock);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v42 = v9;
      obj = v9;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v49;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v49 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
            objc_msgSend(v17, "traceKey");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (ARTechnique_Request_to_Result_onceToken != -1)
              dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_165);
            objc_msgSend((id)ARTechnique_Request_to_Result_keyToCode, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "intValue");

            kdebug_trace();
            objc_msgSend(v17, "traceKey");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (ARTechnique_Request_begin_onceToken != -1)
              dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_241);
            objc_msgSend((id)ARTechnique_Request_begin_keyToCode, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "intValue");

            kdebug_trace();
            objc_msgSend(v17, "requestResultDataAtTimestamp:context:", v12, a3);
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v14);
      }

      -[ARParentTechnique requiredTimeInterval](v41, "requiredTimeInterval");
      v23 = v22;
      -[ARTechnique bonusLatency](v41, "bonusLatency");
      v25 = v23 - v24;
      objc_initWeak(&location, v41);
      v26 = 100000.0;
      if (v25 >= 0.0001)
        v26 = v25 * 1000000000.0;
      v27 = dispatch_time(0, (uint64_t)v26);
      queue = v41->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_3;
      block[3] = &unk_1E6674158;
      v45 = v12;
      v29 = v12;
      objc_copyWeak(v46, &location);
      v46[1] = *(id *)&a3;
      dispatch_after(v27, queue, block);
      objc_destroyWeak(v46);

      objc_destroyWeak(&location);
      v9 = v42;
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[ARTechniqueSequentialGatherContext initWithParentContext:]([ARTechniqueSequentialGatherContext alloc], "initWithParentContext:", v8);
      objc_msgSend(v33, "traceKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (ARTechnique_Request_to_Result_onceToken != -1)
        dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_165);
      objc_msgSend((id)ARTechnique_Request_to_Result_keyToCode, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "intValue");

      kdebug_trace();
      objc_msgSend(v33, "traceKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (ARTechnique_Request_begin_onceToken != -1)
        dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_241);
      objc_msgSend((id)ARTechnique_Request_begin_keyToCode, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "intValue");

      kdebug_trace();
      objc_msgSend(v33, "requestResultDataAtTimestamp:context:", v34, a3);

    }
  }
  else
  {
    -[ARTechnique delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_respondsToSelector();

    if ((v31 & 1) != 0)
    {
      -[ARTechnique delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v8, a3);

    }
  }

}

BOOL __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "captureBehavior") == 1;
}

uint64_t __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deterministicMode");
}

void __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setRequiredTimeIntervalComplete:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "deterministicResultsCaptured"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_submitResultsForTimestamp:context:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

  }
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  ARTechniqueSequentialGatherContext *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[ARParentTechnique techniques](self, "techniques");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[ARTechniqueSequentialGatherContext initWithParentContext:]([ARTechniqueSequentialGatherContext alloc], "initWithParentContext:", v6);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "predictedResultDataAtTimestamp:context:", v8, a3, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARTechniqueSequentialGatherContext addResultData:](v8, "addResultData:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[ARTechniqueSequentialGatherContext gatheredData](v8, "gatheredData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (void)setPowerUsage:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)ARParentTechnique;
  -[ARTechnique setPowerUsage:](&v14, sel_setPowerUsage_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setPowerUsage:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setTechniques:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARTechnique delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDelegate:", v13);

        }
        objc_msgSend(v9, "setPowerUsage:", -[ARTechnique powerUsage](self, "powerUsage"));
        objc_msgSend(v9, "setDelegate:", self);
        objc_msgSend(v9, "setBonusLatency:", 0.0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  if (!self->_parallelExecution)
  {
    -[ARTechnique bonusLatency](self, "bonusLatency");
    v15 = v14;
    objc_msgSend(v4, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBonusLatency:", v15);

  }
  v17 = (void *)objc_msgSend(v4, "copy");
  -[ARParentTechnique set_internalTechniques:](self, "set_internalTechniques:", v17);

}

- (unint64_t)requiredSensorDataTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "requiredSensorDataTypes");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)optionalSensorDataTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "optionalSensorDataTypes");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)requiredTimeInterval
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  _BOOL4 parallelExecution;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        parallelExecution = self->_parallelExecution;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "requiredTimeInterval");
        if (v10 >= v7)
          v11 = v10;
        else
          v11 = v7;
        v12 = v7 + v10;
        if (parallelExecution)
          v7 = v11;
        else
          v7 = v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)resultDataClasses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "resultDataClasses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[ARParentTechnique techniques](self, "techniques");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "techniques");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    if (v8 == objc_msgSend(v7, "count"))
    {
      if (objc_msgSend(v6, "count"))
      {
        v9 = 0;
        v10 = MEMORY[0x1E0C809B0];
        do
        {
          v15[0] = v10;
          v15[1] = 3221225472;
          v15[2] = __40__ARParentTechnique_reconfigurableFrom___block_invoke;
          v15[3] = &unk_1E6674180;
          v11 = v6;
          v16 = v11;
          v17 = v9;
          +[ARParentTechnique techinqueInArray:passingTest:](ARParentTechnique, "techinqueInArray:passingTest:", v7, v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 != 0;

          if (!v12)
            break;
          ++v9;
        }
        while (v9 < objc_msgSend(v11, "count"));
      }
      else
      {
        v13 = 1;
      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __40__ARParentTechnique_reconfigurableFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reconfigurableFrom:", v4);

  return v6;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v15 = v4;
    v5 = v4;
    -[ARParentTechnique techniques](self, "techniques");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "techniques");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __37__ARParentTechnique_reconfigureFrom___block_invoke;
        v16[3] = &unk_1E6674180;
        v10 = v6;
        v17 = v10;
        v18 = v8;
        +[ARParentTechnique techinqueInArray:passingTest:](ARParentTechnique, "techinqueInArray:passingTest:", v7, v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reconfigureFrom:", v11);

        ++v8;
      }
      while (v8 < objc_msgSend(v10, "count"));
    }
    objc_msgSend(v5, "splitTechniques");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARTechnique setSplitTechniques:](self, "setSplitTechniques:", v13);

    objc_msgSend(v5, "splitTechniqueFowardingStrategy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARTechnique setSplitTechniqueFowardingStrategy:](self, "setSplitTechniqueFowardingStrategy:", v14);

    v4 = v15;
  }

}

uint64_t __37__ARParentTechnique_reconfigureFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reconfigurableFrom:", v4);

  return v6;
}

- (void)siblingTechniquesDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "siblingTechniquesDidChange:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)techniqueOfClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARParentTechnique;
  -[ARTechnique techniqueOfClass:](&v10, sel_techniqueOfClass_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ARParentTechnique techniques](self, "techniques");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", a3, v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)techniqueMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARParentTechnique;
  -[ARTechnique techniqueMatchingPredicate:](&v19, sel_techniqueMatchingPredicate_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[ARParentTechnique techniques](self, "techniques", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "techniqueMatchingPredicate:", v4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v7 = (id)v13;

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (void)setBonusLatency:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARParentTechnique;
  -[ARTechnique setBonusLatency:](&v7, sel_setBonusLatency_);
  if (!self->_parallelExecution)
  {
    -[ARParentTechnique techniques](self, "techniques");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBonusLatency:", a3);

  }
}

- (void)prepare:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ARParentTechnique;
  -[ARTechnique prepare:](&v23, sel_prepare_);
  if (v3)
    self->_parallelExecution = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARParentTechnique techniques](self, "techniques");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "prepare:", v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ARTechnique splitTechniques](self, "splitTechniques", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "prepare:", v3);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v12);
  }

}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  return a3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ARParentTechnique techniques](self, "techniques");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_parallelExecution)
      v13 = CFSTR("parallel");
    else
      v13 = CFSTR("serial");
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@(%p) %@ techniques=[%@]>"), v12, self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ARParentTechnique;
    -[ARTechnique description](&v17, sel_description);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARParentTechnique;
  if (-[ARTechnique isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    if (self->_parallelExecution)
    {
      if (v5[56])
      {
        v6 = (void *)MEMORY[0x1E0C99E60];
        -[ARParentTechnique techniques](self, "techniques");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setWithArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v5, "techniques");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "isEqualToSet:", v11);

LABEL_9:
        goto LABEL_10;
      }
    }
    else if (!v5[56])
    {
      -[ARParentTechnique techniques](self, "techniques");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "techniques");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "isEqualToArray:", v8);
      goto LABEL_9;
    }
    v12 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v23.receiver = self;
  v23.super_class = (Class)ARParentTechnique;
  -[ARTechnique _fullDescription](&v23, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARTechniqueParallelGatherContext description](self->_previousContext, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tPreviousContext: %@\n"), v8);

  objc_msgSend(v5, "appendFormat:", CFSTR("\tChild Techniques:\n"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARParentTechnique techniques](self, "techniques");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "_fullDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t|\t"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\t| - %@\n"), v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[ARParentTechnique techniques](self, "techniques");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ARParentTechnique technique:didOutputResultData:timestamp:context:onTechniques:](self, "technique:didOutputResultData:timestamp:context:onTechniques:", v12, v11, v10, v13, a5);

}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6 onTechniques:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t i;
  id v30;
  unint64_t j;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  ARTechniqueSequentialGatherContext *v59;
  void *v60;
  ARTechniqueSequentialGatherContext *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  id v68;
  id v69;
  id v70;
  ARParentTechnique *v71;
  id obj;
  id obja;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  uint64_t v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v75 = a6;
  v14 = a7;
  v15 = objc_msgSend(v14, "indexOfObject:", v12);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v15;
    objc_msgSend(v12, "traceKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = self;
    if (ARTechnique_Request_to_ResultEnd_onceToken != -1)
      dispatch_once(&ARTechnique_Request_to_ResultEnd_onceToken, &__block_literal_global_279);
    objc_msgSend((id)ARTechnique_Request_to_ResultEnd_keyToCode, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intValue");

    kdebug_trace();
    objc_msgSend(v12, "traceKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v12;
    if (ARTechnique_Request_fulfilled_onceToken != -1)
      dispatch_once(&ARTechnique_Request_fulfilled_onceToken, &__block_literal_global_317);
    objc_msgSend((id)ARTechnique_Request_fulfilled_keyToCode, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intValue");

    kdebug_trace();
    -[ARTechnique delegate](v71, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ARTechnique delegate](v71, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

    }
    objc_msgSend(v13, "count");
    kdebug_trace();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = v75;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v24 = v13;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      if (v25)
      {
        v26 = v25;
        v69 = v13;
        v27 = *(_QWORD *)v85;
        v28 = v16 + 1;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v85 != v27)
              objc_enumerationMutation(v24);
            v30 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * i);
            for (j = v28; j < objc_msgSend(v14, "count"); v30 = v35)
            {
              objc_msgSend(v14, "objectAtIndexedSubscript:", j);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "processData:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
                v34 = v33;
              else
                v34 = v30;
              v35 = v34;

              ++j;
            }
            if (v30)
              objc_msgSend(obj, "addObject:", v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
        }
        while (v26);
        v12 = v74;
        v13 = v69;
      }
      else
      {
        v28 = v16 + 1;
      }

      v43 = v70;
      objc_msgSend(v70, "addResultData:", obj);
      if (v28 >= objc_msgSend(v14, "count"))
      {
        -[ARParentTechnique _submitResultsForTimestamp:context:](v71, "_submitResultsForTimestamp:context:", v70, a5);
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v28);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "traceKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (ARTechnique_Request_to_Result_onceToken != -1)
          dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_165);
        objc_msgSend((id)ARTechnique_Request_to_Result_keyToCode, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "intValue");

        kdebug_trace();
        objc_msgSend(v44, "traceKey");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (ARTechnique_Request_begin_onceToken != -1)
          dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_241);
        objc_msgSend((id)ARTechnique_Request_begin_keyToCode, "objectForKeyedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "intValue");

        kdebug_trace();
        v43 = v70;
        objc_msgSend(v44, "requestResultDataAtTimestamp:context:", v70, a5);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v75;
        v37 = objc_msgSend(v14, "count");
        if (v37 != objc_msgSend(v36, "techniqueCount"))
        {
          v16 = objc_msgSend(v36, "indexForTechnique:", v12);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            _ARLogTechnique_3();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "imageData");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "timestamp");
              *(_DWORD *)buf = 138412546;
              v91 = v40;
              v92 = 2048;
              v93 = v42;
              _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_INFO, "Ignoring result from %@, because it isn't collected by gathering context at timestamp %f.", buf, 0x16u);

            }
            goto LABEL_64;
          }
        }
        objc_msgSend(v36, "addResultData:forTechniqueAtIndex:", v13, v16);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
          objc_msgSend(v12, "mergeResultData:intoData:context:", v49, v13, v36);
        if (objc_msgSend(v12, "deterministicMode")
          && objc_msgSend(v36, "requiredTimeIntervalComplete")
          && objc_msgSend(v36, "deterministicResultsCaptured"))
        {
          -[ARParentTechnique _submitResultsForTimestamp:context:](v71, "_submitResultsForTimestamp:context:", v36, a5);
        }

      }
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v12, "splitTechniques");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    if (v50)
    {
      v51 = v50;
      v52 = v13;
      v53 = *(_QWORD *)v81;
      obja = v36;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v81 != v53)
            objc_enumerationMutation(obja);
          v55 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
          objc_msgSend(v12, "splitTechniqueFowardingStrategy");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v56
            || (objc_msgSend(v12, "splitTechniqueFowardingStrategy"),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                v58 = objc_msgSend(v57, "shouldRequestResultDataAtTimestamp:context:", v75, a5),
                v57,
                v58))
          {
            v59 = [ARTechniqueSequentialGatherContext alloc];
            objc_msgSend(v75, "parentContext");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = -[ARTechniqueSequentialGatherContext initWithParentContext:](v59, "initWithParentContext:", v60);

            objc_msgSend(v75, "gatheredData");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARTechniqueSequentialGatherContext addResultData:](v61, "addResultData:", v62);

            objc_msgSend(v55, "requestResultDataAtTimestamp:context:", v61, a5);
          }
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v63 = v52;
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          if (v64)
          {
            v65 = v64;
            v66 = *(_QWORD *)v77;
            do
            {
              for (m = 0; m != v65; ++m)
              {
                if (*(_QWORD *)v77 != v66)
                  objc_enumerationMutation(v63);
                v68 = (id)objc_msgSend(v55, "processData:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m));
              }
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
            }
            while (v65);
          }

          v12 = v74;
        }
        v36 = obja;
        v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      }
      while (v51);
      v13 = v52;
    }
LABEL_64:

  }
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[ARTechnique delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "technique:didFailWithError:", v10, v6);

  }
}

- (void)_submitResultsForTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  kdebug_trace();
  objc_msgSend(v6, "captureGatheredData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "processResultData:timestamp:context:", v13, v6, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[ARTechnique delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "technique:didOutputResultData:timestamp:context:", self, v7, v17, a3);

  }
  kdebug_trace();

}

+ (id)techinqueInArray:(id)a3 passingTest:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v7[2](v7, v13))
        {
          v15 = v13;
          goto LABEL_13;
        }
        objc_msgSend(v13, "techniques", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "techinqueInArray:passingTest:", v14, v7);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_13;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_13:

  return v15;
}

+ (id)techniquesByReplacingOriginalTechniques:(id)a3 withReplacementTechniques:(id)a4 passingTest:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __objc2_class **v13;
  void *v14;
  __objc2_class *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  id v34;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  v7 = a5;
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v9 = objc_msgSend(v8, "count");
  v37 = v7;
  if (!v9)
    goto LABEL_21;
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = off_1E666E000;
  do
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13[6];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __99__ARParentTechnique_techniquesByReplacingOriginalTechniques_withReplacementTechniques_passingTest___block_invoke;
    v43[3] = &unk_1E66741A8;
    v16 = v7;
    v45 = v16;
    v17 = v14;
    v44 = v17;
    -[__objc2_class techinqueInArray:passingTest:](v15, "techinqueInArray:passingTest:", v38, v43);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      _ARLogTechnique_3();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v48 = v21;
        v49 = 2048;
        v50 = v17;
        v51 = 2112;
        v52 = v23;
        v53 = 2048;
        v54 = v18;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "Replacing %@(%p) with %@(%p)", buf, 0x2Au);

        v7 = v37;
      }

      objc_msgSend(v8, "setObject:atIndexedSubscript:", v18, v12);
      v11 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v17;
        objc_msgSend(v24, "techniques");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "techniquesByReplacingOriginalTechniques:withReplacementTechniques:passingTest:", v25, v38, v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v24, "setTechniques:", v26);
          v11 = 1;
        }

        v7 = v37;
      }
    }

    ++v12;
    v13 = off_1E666E000;
  }
  while (v10 != v12);
  if ((v11 & 1) != 0)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = v8;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v33 = (void *)objc_msgSend(v27, "mutableCopy");
          objc_msgSend(v33, "removeObject:", v32);
          objc_msgSend(v32, "siblingTechniquesDidChange:", v33);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v29);
    }

    v34 = v27;
  }
  else
  {
LABEL_21:
    v34 = 0;
  }

  return v34;
}

uint64_t __99__ARParentTechnique_techniquesByReplacingOriginalTechniques_withReplacementTechniques_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

+ (id)techniquesByForceReplacingTechniques:(id)a3 withMatchingClassTechniques:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a1, "techniquesByReplacingOriginalTechniques:withReplacementTechniques:passingTest:", v6, a4, &__block_literal_global_58_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v6;
  v9 = v7;

  return v9;
}

BOOL __86__ARParentTechnique_techniquesByForceReplacingTechniques_withMatchingClassTechniques___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL8 v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_class();
    v6 = v7 == objc_opt_class();
  }

  return v6;
}

- (NSArray)_internalTechniques
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_internalTechniques:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalTechniques, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
