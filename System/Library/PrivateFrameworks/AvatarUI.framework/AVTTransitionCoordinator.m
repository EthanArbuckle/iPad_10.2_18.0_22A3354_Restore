@implementation AVTTransitionCoordinator

+ (id)synchronousTransitionCoordinator
{
  AVTTransitionCoordinator *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(AVTTransitionCoordinator);
  objc_msgSend(a1, "eventHandlerForCoordinator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTTransitionSchedulerFactory synchronousTransitionSchedulerWithEventHandler:](AVTTransitionSchedulerFactory, "synchronousTransitionSchedulerWithEventHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransitionCoordinator setScheduler:](v3, "setScheduler:", v5);

  return v3;
}

+ (id)concurrentTransitionCoordinatorWithDelay:(double)a3
{
  AVTTransitionCoordinator *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(AVTTransitionCoordinator);
  objc_msgSend(a1, "eventHandlerForCoordinator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTTransitionSchedulerFactory concurrentTransitionSchedulerWithEventHandler:delay:](AVTTransitionSchedulerFactory, "concurrentTransitionSchedulerWithEventHandler:delay:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransitionCoordinator setScheduler:](v5, "setScheduler:", v7);

  return v5;
}

+ (id)eventHandlerForCoordinator:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AVTTransitionCoordinator_eventHandlerForCoordinator___block_invoke;
  v9[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v10, &location);
  v3 = (void *)MEMORY[0x1DF0D0754](v9);
  v7 = (void *)MEMORY[0x1DF0D0754](v3, v4, v5, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __55__AVTTransitionCoordinator_eventHandlerForCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startNextTransition");

}

- (AVTTransitionCoordinator)init
{
  AVTTransitionCoordinator *v2;
  uint64_t v3;
  NSMutableArray *pendingTransitions;
  uint64_t v5;
  NSMutableArray *runningTransitions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTTransitionCoordinator;
  v2 = -[AVTTransitionCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingTransitions = v2->_pendingTransitions;
    v2->_pendingTransitions = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    runningTransitions = v2->_runningTransitions;
    v2->_runningTransitions = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVTTransitionCoordinator scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  v4.receiver = self;
  v4.super_class = (Class)AVTTransitionCoordinator;
  -[AVTTransitionCoordinator dealloc](&v4, sel_dealloc);
}

- (void)addTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[AVTTransitionCoordinator scheduler](self, "scheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleEvent");

}

- (void)didCompleteRunningTransition:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVTTransitionCoordinator runningTransitions](self, "runningTransitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    -[AVTTransitionCoordinator runningTransitions](self, "runningTransitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v8);

    -[AVTTransitionCoordinator scheduler](self, "scheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCompleteEvent");

  }
}

- (void)startNextTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  AVTTransitionCoordinator *v13;
  id v14;
  id v15;
  id location;

  -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "completionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __47__AVTTransitionCoordinator_startNextTransition__block_invoke;
    v12 = &unk_1EA51FB10;
    v6 = v5;
    v14 = v6;
    objc_copyWeak(&v15, &location);
    v13 = self;
    objc_msgSend(v4, "setCompletionHandler:", &v9);
    -[AVTTransitionCoordinator runningTransitions](self, "runningTransitions", v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

    -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v4);

    objc_msgSend(v4, "start");
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  else
  {
    -[AVTTransitionCoordinator scheduler](self, "scheduler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");
  }

}

void __47__AVTTransitionCoordinator_startNextTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "didCompleteRunningTransition:", WeakRetained);
    WeakRetained = v4;
  }

}

- (id)transitionsMatchingModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AVTTransitionCoordinator allTransitions](self, "allTransitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__AVTTransitionCoordinator_transitionsMatchingModel___block_invoke;
  v10[3] = &unk_1EA51FB38;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "objectsAtIndexes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __53__AVTTransitionCoordinator_transitionsMatchingModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)allTransitions
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransitionCoordinator runningTransitions](self, "runningTransitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cancelTransitionsMatchingModel:(id)a3
{
  void *v4;
  id v5;

  -[AVTTransitionCoordinator transitionsMatchingModel:](self, "transitionsMatchingModel:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsInArray:", v5);

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_28);
}

uint64_t __59__AVTTransitionCoordinator_cancelTransitionsMatchingModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)cancelAllTransitions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AVTTransitionCoordinator allTransitions](self, "allTransitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransitionCoordinator pendingTransitions](self, "pendingTransitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[AVTTransitionCoordinator runningTransitions](self, "runningTransitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "cancel", (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[AVTTransitionCoordinator scheduler](self, "scheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVTTransitionCoordinator scheduler](self, "scheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stop");

  }
}

- (double)delay
{
  return self->_delay;
}

- (AVTTransitionScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (NSMutableArray)pendingTransitions
{
  return self->_pendingTransitions;
}

- (NSMutableArray)runningTransitions
{
  return self->_runningTransitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTransitions, 0);
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
