@implementation FCMultiStepFetchOperation

void __53__FCMultiStepFetchOperation_addNonCriticalFetchStep___block_invoke(uint64_t a1)
{
  void *v2;
  FCMultiStepFetchOperationStep *v3;

  v3 = objc_alloc_init(FCMultiStepFetchOperationStep);
  -[FCMultiStepFetchOperationStep setFetchSelector:](v3, "setFetchSelector:", *(_QWORD *)(a1 + 40));
  -[FCMultiStepFetchOperationStep setIsCritical:](v3, "setIsCritical:", 0);
  objc_msgSend(*(id *)(a1 + 32), "steps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __42__FCMultiStepFetchOperation_addFetchStep___block_invoke(uint64_t a1)
{
  void *v2;
  FCMultiStepFetchOperationStep *v3;

  v3 = objc_alloc_init(FCMultiStepFetchOperationStep);
  -[FCMultiStepFetchOperationStep setFetchSelector:](v3, "setFetchSelector:", *(_QWORD *)(a1 + 40));
  -[FCMultiStepFetchOperationStep setIsCritical:](v3, "setIsCritical:", 1);
  objc_msgSend(*(id *)(a1 + 32), "steps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)addFetchStep:(SEL)a3
{
  void *v5;
  _QWORD v6[6];

  -[FCMultiStepFetchOperation accessLock](self, "accessLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FCMultiStepFetchOperation_addFetchStep___block_invoke;
  v6[3] = &unk_1E4640A20;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performWithLockSync:", v6);

}

- (FCMultiStepFetchOperation)init
{
  FCMultiStepFetchOperation *v2;
  NSMutableArray *v3;
  NSMutableArray *steps;
  NSMutableArray *v5;
  NSMutableArray *stepResults;
  uint64_t v7;
  NFMutexLock *accessLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCMultiStepFetchOperation;
  v2 = -[FCFetchOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    steps = v2->_steps;
    v2->_steps = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stepResults = v2->_stepResults;
    v2->_stepResults = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AE0]), "initWithOptions:", 1);
    accessLock = v2->_accessLock;
    v2->_accessLock = (NFMutexLock *)v7;

  }
  return v2;
}

- (void)_performNextStep
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(FCMultiStepFetchOperation *, uint64_t, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  FCMultiStepFetchOperation *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[FCMultiStepFetchOperation accessLock](self, "accessLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!-[FCOperation isFinished](self, "isFinished"))
  {
    -[FCMultiStepFetchOperation steps](self, "steps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[FCMultiStepFetchOperation steps](self, "steps");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCMultiStepFetchOperation steps](self, "steps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

      v9 = (void (*)(FCMultiStepFetchOperation *, uint64_t, void *))-[FCMultiStepFetchOperation methodForSelector:](self, "methodForSelector:", objc_msgSend(v7, "fetchSelector"));
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __45__FCMultiStepFetchOperation__performNextStep__block_invoke_2;
      v21 = &unk_1E463A9C0;
      v22 = self;
      v10 = v7;
      v23 = v10;
      v11 = _Block_copy(&v18);
      v9(self, objc_msgSend(v10, "fetchSelector", v18, v19, v20, v21, v22), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[FCOperation associateChildOperation:](self, "associateChildOperation:", v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[FCMultiStepFetchOperation customizeChildOperation:forFetchStep:](self, "customizeChildOperation:forFetchStep:", v12, objc_msgSend(v10, "fetchSelector"));
          objc_msgSend(v12, "setCanSendFetchCompletionSynchronously:", 1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isExecuting")
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("child operation shouldn't be executing yet"));
            *(_DWORD *)buf = 136315906;
            v25 = "-[FCMultiStepFetchOperation _performNextStep]";
            v26 = 2080;
            v27 = "FCMultiStepFetchOperation.m";
            v28 = 1024;
            v29 = 149;
            v30 = 2114;
            v31 = v17;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(v12, "start");
        }
      }

    }
    else
    {
      -[FCMultiStepFetchOperation completeFetchOperation](self, "completeFetchOperation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v10, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCMultiStepFetchOperation stepResults](self, "stepResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fc_setByCollectingObjectsWithBlock:", &__block_literal_global_72);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMissingObjectDescriptions:", v15);

      -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v13);
    }

  }
  -[FCMultiStepFetchOperation accessLock](self, "accessLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

}

- (NSMutableArray)steps
{
  return self->_steps;
}

- (NFMutexLock)accessLock
{
  return self->_accessLock;
}

void __45__FCMultiStepFetchOperation__performNextStep__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stepResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    if (objc_msgSend(*(id *)(a1 + 40), "isCritical") && objc_msgSend(v4, "status"))
      objc_msgSend(*(id *)(a1 + 32), "finishExecutingWithResult:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "isCritical");
  }
  objc_msgSend(*(id *)(a1 + 32), "_performNextStep");

}

- (NSMutableArray)stepResults
{
  return self->_stepResults;
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  objc_msgSend(a3, "takeInputsFromFetchOperation:", self, a4);
}

uint64_t __45__FCMultiStepFetchOperation__performNextStep__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "missingObjectDescriptions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_stepResults, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

- (void)addNonCriticalFetchStep:(SEL)a3
{
  void *v5;
  _QWORD v6[6];

  -[FCMultiStepFetchOperation accessLock](self, "accessLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__FCMultiStepFetchOperation_addNonCriticalFetchStep___block_invoke;
  v6[3] = &unk_1E4640A20;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performWithLockSync:", v6);

}

- (id)completeFetchOperation
{
  return 0;
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (void)setStepResults:(id)a3
{
  objc_storeStrong((id *)&self->_stepResults, a3);
}

- (void)setAccessLock:(id)a3
{
  objc_storeStrong((id *)&self->_accessLock, a3);
}

@end
