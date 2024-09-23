@implementation CNTestableObserver

+ (id)observerWithScheduler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduler:", v4);

  return v5;
}

- (CNTestableObserver)initWithScheduler:(id)a3
{
  id v5;
  CNTestableObserver *v6;
  CNTestableObserver *v7;
  NSMutableArray *v8;
  NSMutableArray *results;
  CNObservableContractEnforcement *v10;
  CNObservableContractEnforcement *enforcement;
  CNTestableObserver *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNTestableObserver;
  v6 = -[CNTestableObserver init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v7->_results;
    v7->_results = v8;

    v10 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v7->_enforcement;
    v7->_enforcement = v10;

    v12 = v7;
  }

  return v7;
}

- (NSArray)resultValues
{
  void *v2;
  void *v3;
  void *v4;

  -[CNTestableObserver results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", CNObservedResultIsResultFilter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", CNObservedResultValueTransform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)observerDidReceiveResult:(id)a3
{
  CNObservableContractEnforcement *enforcement;
  id v5;
  NSMutableArray *results;
  id v7;

  enforcement = self->_enforcement;
  v5 = a3;
  -[CNObservableContractEnforcement observerDidReceiveResult:](enforcement, "observerDidReceiveResult:", v5);
  results = self->_results;
  +[CNObservedResult resultWithTime:value:](CNObservedResult, "resultWithTime:value:", -[CNVirtualScheduler clock](self->_scheduler, "clock"), v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](results, "addObject:", v7);
}

- (void)observerDidComplete
{
  NSMutableArray *results;
  id v4;

  -[CNObservableContractEnforcement observerDidComplete](self->_enforcement, "observerDidComplete");
  results = self->_results;
  +[CNObservedResult completionResultWithTime:](CNObservedResult, "completionResultWithTime:", -[CNVirtualScheduler clock](self->_scheduler, "clock"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](results, "addObject:", v4);

}

- (void)observerDidFailWithError:(id)a3
{
  CNObservableContractEnforcement *enforcement;
  id v5;
  NSMutableArray *results;
  id v7;

  enforcement = self->_enforcement;
  v5 = a3;
  -[CNObservableContractEnforcement observerDidFailWithError:](enforcement, "observerDidFailWithError:", v5);
  results = self->_results;
  +[CNObservedResult failureWithError:time:](CNObservedResult, "failureWithError:time:", v5, -[CNVirtualScheduler clock](self->_scheduler, "clock"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](results, "addObject:", v7);
}

- (NSArray)results
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
