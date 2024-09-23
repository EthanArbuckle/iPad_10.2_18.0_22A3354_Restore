@implementation _EFCombineLatestObservableSubscription

- (void)_observableAtIndex:(unint64_t)a3 receivedResult:(id)a4 observer:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_results, "replaceObjectAtIndex:withObject:", a3, v10);
  -[NSMutableIndexSet removeIndex:](self->_silentIndexes, "removeIndex:", a3);
  if (-[NSMutableIndexSet count](self->_silentIndexes, "count"))
    v9 = 0;
  else
    v9 = (void *)-[NSMutableArray copy](self->_results, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  if (v9)
    objc_msgSend(v8, "observerDidReceiveResult:", v9);

}

- (id)subscribe:(id)a3
{
  id v4;
  EFCancelationToken *v5;
  void *v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  EFCancelationToken *v10;
  _QWORD v12[4];
  EFCancelationToken *v13;
  _EFCombineLatestObservableSubscription *v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(EFCancelationToken);
  -[_EFCombineLatestObservableSubscription observables](self, "observables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke;
  v12[3] = &unk_1E62A5798;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

- (NSArray)observables
{
  return self->_observables;
}

- (_EFCombineLatestObservableSubscription)initWithObservables:(id)a3
{
  id v4;
  _EFCombineLatestObservableSubscription *v5;
  NSLock *v6;
  NSLock *lock;
  uint64_t v8;
  NSArray *observables;
  void *v10;
  uint64_t v11;
  NSMutableArray *results;
  void *v13;
  uint64_t v14;
  NSMutableArray *tokens;
  uint64_t v16;
  NSMutableIndexSet *activeIndexes;
  uint64_t v18;
  NSMutableIndexSet *silentIndexes;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_EFCombineLatestObservableSubscription;
  v5 = -[_EFCombineLatestObservableSubscription init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v5->_lock;
    v5->_lock = v6;

    objc_msgSend(v4, "ef_map:", &__block_literal_global);
    v8 = objc_claimAutoreleasedReturnValue();
    observables = v5->_observables;
    v5->_observables = (NSArray *)v8;

    objc_msgSend(v4, "ef_map:", &__block_literal_global_4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    results = v5->_results;
    v5->_results = (NSMutableArray *)v11;

    objc_msgSend(v4, "ef_map:", &__block_literal_global_6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    tokens = v5->_tokens;
    v5->_tokens = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    activeIndexes = v5->_activeIndexes;
    v5->_activeIndexes = (NSMutableIndexSet *)v16;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
    v18 = objc_claimAutoreleasedReturnValue();
    silentIndexes = v5->_silentIndexes;
    v5->_silentIndexes = (NSMutableIndexSet *)v18;

  }
  return v5;
}

- (void)_observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4
{
  NSMutableArray *tokens;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  -[NSLock lock](self->_lock, "lock");
  tokens = self->_tokens;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](tokens, "replaceObjectAtIndex:withObject:", a3, v7);

  -[NSMutableIndexSet removeIndex:](self->_activeIndexes, "removeIndex:", a3);
  v8 = -[NSMutableIndexSet count](self->_activeIndexes, "count");
  -[NSLock unlock](self->_lock, "unlock");
  if (!v8)
    objc_msgSend(v9, "observerDidComplete");

}

- (void)_observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 observer:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  -[NSLock lock](self->_lock, "lock");
  v9 = (void *)-[NSMutableIndexSet mutableCopy](self->_activeIndexes, "mutableCopy");
  objc_msgSend(v9, "removeIndex:", a3);
  -[NSMutableArray objectsAtIndexes:](self->_tokens, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeObjectsPerformSelector:", sel_cancel);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(v8, "observerDidFailWithError:", v11);

}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void)setObservables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (NSMutableIndexSet)activeIndexes
{
  return self->_activeIndexes;
}

- (void)setActiveIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_activeIndexes, a3);
}

- (NSMutableIndexSet)silentIndexes
{
  return self->_silentIndexes;
}

- (void)setSilentIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_silentIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silentIndexes, 0);
  objc_storeStrong((id *)&self->_activeIndexes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observables, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
