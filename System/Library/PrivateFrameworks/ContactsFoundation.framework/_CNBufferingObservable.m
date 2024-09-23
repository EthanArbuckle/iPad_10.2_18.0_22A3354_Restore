@implementation _CNBufferingObservable

- (_CNBufferingObservable)initWithLength:(unint64_t)a3 observable:(id)a4
{
  id v6;
  void *v7;
  _CNBufferingObservable *v8;

  v6 = a4;
  +[_CNBufferingStrategy strategyWithCapacity:](_CNBufferingStrategy, "strategyWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CNBufferingObservable initWithBufferingStrategy:observable:](self, "initWithBufferingStrategy:observable:", v7, v6);

  return v8;
}

- (_CNBufferingObservable)initWithTimeInterval:(double)a3 scheduler:(id)a4 observable:(id)a5
{
  id v8;
  void *v9;
  _CNBufferingObservable *v10;

  v8 = a5;
  +[_CNBufferingStrategy strategyWithTimeInterval:scheduler:](_CNBufferingStrategy, "strategyWithTimeInterval:scheduler:", a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_CNBufferingObservable initWithBufferingStrategy:observable:](self, "initWithBufferingStrategy:observable:", v9, v8);

  return v10;
}

- (_CNBufferingObservable)initWithLength:(unint64_t)a3 timeInterval:(double)a4 scheduler:(id)a5 observable:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _CNBufferingObservable *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  +[_CNBufferingStrategy strategyWithCapacity:](_CNBufferingStrategy, "strategyWithCapacity:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CNBufferingStrategy strategyWithTimeInterval:scheduler:](_CNBufferingStrategy, "strategyWithTimeInterval:scheduler:", v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CNBufferingStrategy combine:](_CNBufferingStrategy, "combine:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_CNBufferingObservable initWithBufferingStrategy:observable:](self, "initWithBufferingStrategy:observable:", v15, v10);
  return v16;
}

- (_CNBufferingObservable)initWithBufferingStrategy:(id)a3 observable:(id)a4
{
  id v7;
  id v8;
  _CNBufferingObservable *v9;
  _CNBufferingObservable *v10;
  NSMutableArray *v11;
  NSMutableArray *results;
  _CNBufferingObservable *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNBufferingObservable;
  v9 = -[_CNBufferingObservable init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strategy, a3);
    objc_storeStrong((id *)&v10->_observable, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v10->_results;
    v10->_results = v11;

    v13 = v10;
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[_CNBufferingObservable observable](self, "observable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36___CNBufferingObservable_subscribe___block_invoke;
  v16[3] = &unk_1E29BA058;
  v16[4] = self;
  v17 = v4;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __36___CNBufferingObservable_subscribe___block_invoke_2;
  v14[3] = &unk_1E29B8C10;
  v14[4] = self;
  v15 = v17;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __36___CNBufferingObservable_subscribe___block_invoke_3;
  v12[3] = &unk_1E29B9558;
  v13 = v15;
  v8 = v15;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v16, v14, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)sendBufferedResultsToObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_CNBufferingObservable results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "observerDidReceiveResult:", v6);

  -[_CNBufferingObservable strategy](self, "strategy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bufferDidSendResults:", self);

  -[_CNBufferingObservable results](self, "results");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (_CNBufferingStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_strategy, a3);
}

- (CNObservable)observable
{
  return self->_observable;
}

- (void)setObservable:(id)a3
{
  objc_storeStrong((id *)&self->_observable, a3);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end
