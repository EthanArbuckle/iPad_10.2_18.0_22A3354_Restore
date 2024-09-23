@implementation _CNForkJoinProgressiveResultObservationStrategy

- (_CNForkJoinProgressiveResultObservationStrategy)initWithCapacity:(unint64_t)a3
{
  _CNForkJoinProgressiveResultObservationStrategy *v4;
  void *i;
  void *v6;
  uint64_t v7;
  NSArray *results;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *finishedObservables;
  _CNForkJoinProgressiveResultObservationStrategy *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CNForkJoinProgressiveResultObservationStrategy;
  v4 = -[_CNForkJoinProgressiveResultObservationStrategy init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v6);

    }
    v7 = objc_msgSend(i, "copy");
    results = v4->_results;
    v4->_results = (NSArray *)v7;

    v4->_activeObservableIdx = 0;
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    finishedObservables = v4->_finishedObservables;
    v4->_finishedObservables = v9;

    v11 = v4;
  }

  return v4;
}

- (void)receiveResult:(id)a3 fromObservableAtIndex:(unint64_t)a4 observer:(id)a5
{
  id v8;
  _CNForkJoinProgressiveResultObservationStrategy *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_activeObservableIdx == a4)
  {
    objc_sync_exit(v9);

    objc_msgSend(v8, "observerDidReceiveResult:", v11);
  }
  else
  {
    -[NSArray objectAtIndex:](v9->_results, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_sync_exit(v9);
  }

}

- (void)observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4
{
  id v6;
  void *v7;
  _CNForkJoinProgressiveResultObservationStrategy *v8;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableIndexSet addIndex:](v8->_finishedObservables, "addIndex:", a3);
  for (i = v8->_activeObservableIdx;
        -[NSMutableIndexSet containsIndex:](v8->_finishedObservables, "containsIndex:", i);
        ++i)
  {
    -[NSArray objectAtIndexedSubscript:](v8->_results, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v10);

    -[NSArray objectAtIndexedSubscript:](v8->_results, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

  }
  v8->_activeObservableIdx = i;
  if (i < -[NSArray count](v8->_results, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](v8->_results, "objectAtIndexedSubscript:", v8->_activeObservableIdx);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v12);

    -[NSArray objectAtIndexedSubscript:](v8->_results, "objectAtIndexedSubscript:", v8->_activeObservableIdx);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

  }
  v14 = -[NSMutableIndexSet count](v8->_finishedObservables, "count");
  v15 = -[NSArray count](v8->_results, "count");
  objc_sync_exit(v8);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(v6, "observerDidReceiveResult:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

  if (v14 == v15)
    objc_msgSend(v6, "observerDidComplete");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedObservables, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
