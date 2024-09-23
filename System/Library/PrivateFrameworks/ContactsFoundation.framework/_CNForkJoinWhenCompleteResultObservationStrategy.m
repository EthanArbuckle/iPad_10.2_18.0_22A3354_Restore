@implementation _CNForkJoinWhenCompleteResultObservationStrategy

- (_CNForkJoinWhenCompleteResultObservationStrategy)initWithCapacity:(unint64_t)a3
{
  _CNForkJoinWhenCompleteResultObservationStrategy *v4;
  NSMutableArray *v5;
  NSMutableArray *results;
  NSMutableArray *v7;
  void *v8;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *finishedObservables;
  _CNForkJoinWhenCompleteResultObservationStrategy *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CNForkJoinWhenCompleteResultObservationStrategy;
  v4 = -[_CNForkJoinWhenCompleteResultObservationStrategy init](&v13, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v4->_results;
    v4->_results = v5;

    for (; a3; --a3)
    {
      v7 = v4->_results;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v7, "addObject:", v8);

    }
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
  _CNForkJoinWhenCompleteResultObservationStrategy *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  -[NSMutableArray replaceObjectAtIndex:withObject:](v9->_results, "replaceObjectAtIndex:withObject:", a4, v10);
  objc_sync_exit(v9);

}

- (void)observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4
{
  void *v6;
  _CNForkJoinWhenCompleteResultObservationStrategy *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_results, "count"));
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableIndexSet addIndex:](v7->_finishedObservables, "addIndex:", a3);
  v8 = -[NSMutableIndexSet count](v7->_finishedObservables, "count");
  if (v8 == -[NSMutableArray count](self->_results, "count"))
  {
    objc_msgSend(v6, "setArray:", self->_results);
    objc_sync_exit(v7);

    objc_msgSend(v9, "observerDidReceiveResult:", v6);
    objc_msgSend(v9, "observerDidComplete");
  }
  else
  {
    objc_sync_exit(v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedObservables, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
