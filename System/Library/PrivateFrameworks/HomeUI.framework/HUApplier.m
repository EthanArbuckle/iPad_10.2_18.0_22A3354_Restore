@implementation HUApplier

+ (void)registerStandaloneApplier:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = _MergedGlobals_615;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_MergedGlobals_615, &__block_literal_global_32);
    v5 = v6;
  }
  objc_msgSend((id)qword_1ED580A68, "addObject:", v5);

}

void __39__HUApplier_registerStandaloneApplier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580A68;
  qword_1ED580A68 = v0;

}

+ (void)unregisterStandaloneApplier:(id)a3
{
  objc_msgSend((id)qword_1ED580A68, "removeObject:", a3);
}

- (HUApplier)init
{
  HUApplier *v2;
  uint64_t v3;
  NSMutableArray *applierBlocks;
  uint64_t v5;
  NSMutableArray *completionBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUApplier;
  v2 = -[HUApplier init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    applierBlocks = v2->_applierBlocks;
    v2->_applierBlocks = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = (NSMutableArray *)v5;

  }
  return v2;
}

- (BOOL)isInteractive
{
  return 0;
}

- (void)addApplierBlock:(id)a3
{
  NSMutableArray *applierBlocks;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUApplier.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applier"));

  }
  if (-[HUApplier state](self, "state"))
  {
    -[HUApplier progress](self, "progress");
    v9[2]();
  }
  if (!-[HUApplier _hasCompleted](self, "_hasCompleted"))
  {
    applierBlocks = self->_applierBlocks;
    v6 = (void *)objc_msgSend(v9, "copy");
    v7 = _Block_copy(v6);
    -[NSMutableArray addObject:](applierBlocks, "addObject:", v7);

  }
}

- (void)addCompletionBlock:(id)a3
{
  NSMutableArray *completionBlocks;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, BOOL);

  v9 = (void (**)(id, BOOL))a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUApplier.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (-[HUApplier _hasCompleted](self, "_hasCompleted"))
  {
    v9[2](v9, -[HUApplier state](self, "state") == 3);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    v6 = (void *)objc_msgSend(v9, "copy");
    v7 = _Block_copy(v6);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v7);

  }
}

- (BOOL)start
{
  unint64_t v3;

  v3 = -[HUApplier state](self, "state");
  if (!v3)
    self->_state = 1;
  return v3 == 0;
}

- (void)updateProgress:(double)a3
{
  NSMutableArray *v5;
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
  if (-[HUApplier state](self, "state") == 1)
  {
    self->_progress = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_applierBlocks;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))(a3);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)cancel
{
  return -[HUApplier complete:](self, "complete:", 0);
}

- (BOOL)_hasCompleted
{
  return -[HUApplier state](self, "state") == 2 || -[HUApplier state](self, "state") == 3;
}

- (BOOL)complete:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[HUApplier _hasCompleted](self, "_hasCompleted");
  if (!v5)
  {
    v6 = 2;
    if (v3)
      v6 = 3;
    self->_state = v6;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_completionBlocks;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v13);
  }
  return !v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_applierBlocks, 0);
}

@end
