@implementation CPLResetTracker

- (CPLResetTracker)initWithResetReasons:(id)a3
{
  id v4;
  CPLResetTracker *v5;
  void *v6;
  uint64_t v7;
  NSArray *resetReasons;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLResetTracker;
  v5 = -[CPLResetTracker init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_5501);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    resetReasons = v5->_resetReasons;
    v5->_resetReasons = (NSArray *)v7;

  }
  return v5;
}

- (NSDate)earliestReasonDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSArray firstObject](self->_resetReasons, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (id)likelyResetReasonWithImmediateReason:(id)a3
{
  NSArray *resetReasons;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  resetReasons = self->_resetReasons;
  v4 = a3;
  -[NSArray firstObject](resetReasons, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (NSDate)likelyResetDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSArray firstObject](self->_resetReasons, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (BOOL)hasReasons
{
  return -[NSArray count](self->_resetReasons, "count") != 0;
}

- (CPLResetTracker)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CPLResetTracker *v6;
  CPLResetTracker *v7;
  CPLResetTracker *v8;
  objc_super v10;

  v4 = a3;
  if (initWithCoder__onceToken_5495 != -1)
    dispatch_once(&initWithCoder__onceToken_5495, &__block_literal_global_11_5496);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__arrayForResetReasonClasses, CFSTR("r"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLResetTracker;
    v6 = -[CPLResetTracker init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_resetReasons, v5);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_resetReasons, CFSTR("r"));
}

- (NSArray)resetReasons
{
  return self->_resetReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetReasons, 0);
}

void __33__CPLResetTracker_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__arrayForResetReasonClasses;
  initWithCoder__arrayForResetReasonClasses = v2;

}

uint64_t __40__CPLResetTracker_initWithResetReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  CPLResetReason *v15;
  CPLResetReason *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_queue_create("com.apple.cpl.resettracker", 0);
  v3 = (void *)_CPLResetTrackerQueue;
  _CPLResetTrackerQueue = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", CFSTR("CPLResetReasons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  v7 = (void *)_currentReasons;
  _currentReasons = v6;

  if (objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v15 = [CPLResetReason alloc];
          v16 = -[CPLResetReason initWithPlist:](v15, "initWithPlist:", v14, (_QWORD)v17);
          if (v16)
          {
            objc_msgSend((id)_currentReasons, "addObject:", v16);
            if (++v11 == 10)
            {

              goto LABEL_13;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

+ (void)_storeReasonsLocked
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)_currentReasons, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v4 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend((id)_currentReasons, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (id)_currentReasons;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "asPlist", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("CPLResetReasons"));
  }
  else
  {
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("CPLResetReasons"));
  }
  objc_msgSend(v2, "synchronize", (_QWORD)v11);

}

+ (void)_registerReasonLocked:(id)a3
{
  id v4;

  v4 = a3;
  if ((unint64_t)objc_msgSend((id)_currentReasons, "count") <= 9)
  {
    objc_msgSend((id)_currentReasons, "addObject:", v4);
    objc_msgSend(a1, "_storeReasonsLocked");
  }

}

+ (void)registerLikelyResetReason:(id)a3
{
  uint64_t v3;

  objc_msgSend(a1, "registerLikelyResetReason:arguments:", a3, &v3);
}

+ (void)registerLikelyResetReason:(id)a3 arguments:(char *)a4
{
  objc_class *v6;
  id v7;
  CPLResetReason *v8;
  void *v9;
  CPLResetReason *v10;
  NSObject *v11;
  CPLResetReason *v12;
  id v13;
  _QWORD block[4];
  CPLResetReason *v15;
  id v16;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v13 = (id)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a4);

  v8 = [CPLResetReason alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CPLResetReason initWithDate:reason:](v8, "initWithDate:reason:", v9, v13);

  v11 = _CPLResetTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CPLResetTracker_registerLikelyResetReason_arguments___block_invoke;
  block[3] = &unk_1E60D6DF8;
  v15 = v10;
  v16 = a1;
  v12 = v10;
  dispatch_sync(v11, block);

}

+ (CPLResetTracker)currentTracker
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5522;
  v9 = __Block_byref_object_dispose__5523;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CPLResetTracker_currentTracker__block_invoke;
  block[3] = &unk_1E60D7240;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_CPLResetTrackerQueue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLResetTracker *)v2;
}

+ (void)discardTracker:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = _CPLResetTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CPLResetTracker_discardTracker___block_invoke;
  block[3] = &unk_1E60D6DF8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (NSArray)currentReasonDescriptions
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5522;
  v14 = __Block_byref_object_dispose__5523;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _CPLResetTrackerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CPLResetTracker_currentReasonDescriptions__block_invoke;
  v7[3] = &unk_1E60D64C8;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSArray *)v5;
}

+ (id)registerTentativeResetReasonIfCrashing:(id)a3
{
  id v4;
  CPLResetReason *v5;
  void *v6;
  CPLResetReason *v7;
  NSObject *v8;
  CPLResetReason *v9;
  _QWORD v11[4];
  CPLResetReason *v12;
  id v13;

  v4 = a3;
  v5 = [CPLResetReason alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPLResetReason initWithDate:reason:](v5, "initWithDate:reason:", v6, v4);

  -[CPLResetReason setTentative:](v7, "setTentative:", 1);
  v8 = _CPLResetTrackerQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CPLResetTracker_registerTentativeResetReasonIfCrashing___block_invoke;
  v11[3] = &unk_1E60D6DF8;
  v13 = a1;
  v9 = v7;
  v12 = v9;
  dispatch_sync(v8, v11);

  return v9;
}

+ (void)discardTentativeResetReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = _CPLResetTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CPLResetTracker_discardTentativeResetReason___block_invoke;
  block[3] = &unk_1E60D6DF8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldIgnoreDefaultsCPLKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("CPLResetReasons"));
}

uint64_t __47__CPLResetTracker_discardTentativeResetReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)_currentReasons, "indexOfObject:", *(_QWORD *)(a1 + 32));
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)_currentReasons, "removeObject:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "_storeReasonsLocked");
  }
  return result;
}

uint64_t __58__CPLResetTracker_registerTentativeResetReasonIfCrashing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_registerReasonLocked:", *(_QWORD *)(a1 + 32));
}

void __44__CPLResetTracker_currentReasonDescriptions__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)_currentReasons, "count"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)_currentReasons;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "tentative", (_QWORD)v14) & 1) == 0)
        {
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v11, "reasonDescriptionWithNow:", *(_QWORD *)(a1 + 32));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

void __34__CPLResetTracker_discardTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "resetReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    v10 = (void *)_currentReasons;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__CPLResetTracker_discardTracker___block_invoke_2;
    v13[3] = &unk_1E60D87C0;
    v11 = v3;
    v14 = v11;
    objc_msgSend(v10, "indexesOfObjectsPassingTest:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend((id)_currentReasons, "removeObjectsAtIndexes:", v12);
      objc_msgSend(*(id *)(a1 + 40), "_storeReasonsLocked");
    }

  }
}

uint64_t __34__CPLResetTracker_discardTracker___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __33__CPLResetTracker_currentTracker__block_invoke(uint64_t a1)
{
  CPLResetTracker *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = [CPLResetTracker alloc];
  v3 = -[CPLResetTracker initWithResetReasons:](v2, "initWithResetReasons:", _currentReasons);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __55__CPLResetTracker_registerLikelyResetReason_arguments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_registerReasonLocked:", *(_QWORD *)(a1 + 32));
}

@end
