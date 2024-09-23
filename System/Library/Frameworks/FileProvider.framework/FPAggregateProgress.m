@implementation FPAggregateProgress

- (void)addChild:(id)a3
{
  NSMutableArray *childProgresses;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[FPAggregateProgress totalUnitCount](self, "totalUnitCount")
    && -[FPAggregateProgress totalUnitCount](self, "totalUnitCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPAggregateProgress.m"), 20, CFSTR("addChild: method should only be invoked while progress is indeterminate"));

  }
  if (-[FPAggregateProgress isCancelled](self, "isCancelled"))
  {
    objc_msgSend(v10, "cancel");
  }
  else
  {
    childProgresses = self->_childProgresses;
    v6 = v10;
    if (!childProgresses)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      v8 = self->_childProgresses;
      self->_childProgresses = v7;

      v6 = v10;
      childProgresses = self->_childProgresses;
    }
    -[NSMutableArray addObject:](childProgresses, "addObject:", v6);
  }

}

- (void)cancel
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  v3 = self->_childProgresses;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FPAggregateProgress;
  -[FPAggregateProgress cancel](&v8, sel_cancel);
}

- (void)startReportingProgress
{
  NSMutableArray *childProgresses;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[FPAggregateProgress totalUnitCount](self, "totalUnitCount") <= 0
    && (-[FPAggregateProgress isCancelled](self, "isCancelled") & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    childProgresses = self->_childProgresses;
    v4 = 0;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childProgresses, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(childProgresses);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (!objc_msgSend(v8, "totalUnitCount"))
          {
            v21 = 0;
            v22 = &v21;
            v23 = 0x3032000000;
            v24 = __Block_byref_object_copy__8;
            v25 = __Block_byref_object_dispose__8;
            v26 = 0;
            objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v8, "totalUnitCount");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __45__FPAggregateProgress_startReportingProgress__block_invoke;
            v20[3] = &unk_1E444C350;
            v20[5] = self;
            v20[6] = &v21;
            v20[4] = v8;
            objc_msgSend(v13, "addObserverBlock:", v20);
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v22[5];
            v22[5] = v14;

            _Block_object_dispose(&v21, 8);
            goto LABEL_20;
          }
          v4 += objc_msgSend(v8, "totalUnitCount");
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childProgresses, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v5)
          continue;
        break;
      }
    }

    -[FPAggregateProgress setTotalUnitCount:](self, "setTotalUnitCount:", v4);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_childProgresses;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          -[FPAggregateProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "totalUnitCount", (_QWORD)v16));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
      }
      while (v10);
    }

    childProgresses = self->_childProgresses;
    self->_childProgresses = 0;
LABEL_20:

  }
}

uint64_t __45__FPAggregateProgress_startReportingProgress__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "totalUnitCount");
  if (result >= 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishObserving");
    return objc_msgSend(*(id *)(a1 + 40), "startReportingProgress");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childProgresses, 0);
}

@end
