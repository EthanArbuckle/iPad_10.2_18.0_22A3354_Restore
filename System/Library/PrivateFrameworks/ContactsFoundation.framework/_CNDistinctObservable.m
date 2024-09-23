@implementation _CNDistinctObservable

- (_CNDistinctObservable)initWithObservable:(id)a3
{
  id v5;
  _CNDistinctObservable *v6;
  _CNDistinctObservable *v7;
  NSMutableSet *v8;
  NSMutableSet *previouslyObservedResults;
  _CNDistinctObservable *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNDistinctObservable;
  v6 = -[_CNDistinctObservable init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    previouslyObservedResults = v7->_previouslyObservedResults;
    v7->_previouslyObservedResults = v8;

    v10 = v7;
  }

  return v7;
}

- (id)subscribe:(id)a3
{
  id v4;
  CNObservable *observable;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  observable = self->_observable;
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35___CNDistinctObservable_subscribe___block_invoke;
  v19[3] = &unk_1E29BA058;
  v19[4] = self;
  v20 = v4;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __35___CNDistinctObservable_subscribe___block_invoke_2;
  v17[3] = &unk_1E29B9358;
  v18 = v20;
  v12 = v7;
  v13 = 3221225472;
  v14 = __35___CNDistinctObservable_subscribe___block_invoke_3;
  v15 = &unk_1E29B9558;
  v16 = v18;
  v8 = v18;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v19, v17, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable subscribe:](observable, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_resultIsDistinct:(id)a3
{
  id v4;
  _CNDistinctObservable *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](v5->_previouslyObservedResults, "containsObject:", v4);
  if ((v6 & 1) == 0)
    -[NSMutableSet addObject:](v5->_previouslyObservedResults, "addObject:", v4);
  objc_sync_exit(v5);

  return v6 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyObservedResults, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
