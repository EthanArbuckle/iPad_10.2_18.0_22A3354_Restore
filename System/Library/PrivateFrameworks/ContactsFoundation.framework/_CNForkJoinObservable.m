@implementation _CNForkJoinObservable

+ (id)forkJoin:(id)a3
{
  id v4;
  _CNForkJoinWhenCompleteResultObservationStrategy *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNForkJoinWhenCompleteResultObservationStrategy initWithCapacity:]([_CNForkJoinWhenCompleteResultObservationStrategy alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObservables:reportingStrategy:", v4, v5);

  return v6;
}

+ (id)progressiveForkJoin:(id)a3
{
  id v4;
  _CNForkJoinProgressiveResultObservationStrategy *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNForkJoinProgressiveResultObservationStrategy initWithCapacity:]([_CNForkJoinProgressiveResultObservationStrategy alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObservables:reportingStrategy:", v4, v5);

  return v6;
}

- (_CNForkJoinObservable)initWithObservables:(id)a3 reportingStrategy:(id)a4
{
  id v6;
  id v7;
  _CNForkJoinObservable *v8;
  uint64_t v9;
  NSArray *observables;
  _CNForkJoinObservable *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNForkJoinObservable;
  v8 = -[_CNForkJoinObservable init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    observables = v8->_observables;
    v8->_observables = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_resultReportingStrategy, a4);
    v11 = v8;
  }

  return v8;
}

- (id)subscribe:(id)a3
{
  id v4;
  CNCancelationToken *v5;
  CNForkJoinResultReportingStrategy *v6;
  NSArray *observables;
  CNCancelationToken *v8;
  id v9;
  CNForkJoinResultReportingStrategy *v10;
  CNCancelationToken *v11;
  CNCancelationToken *v12;
  _QWORD v14[4];
  CNForkJoinResultReportingStrategy *v15;
  id v16;
  CNCancelationToken *v17;

  v4 = a3;
  v5 = objc_alloc_init(CNCancelationToken);
  v6 = self->_resultReportingStrategy;
  observables = self->_observables;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __35___CNForkJoinObservable_subscribe___block_invoke;
  v14[3] = &unk_1E29BC978;
  v15 = v6;
  v16 = v4;
  v8 = v5;
  v17 = v8;
  v9 = v4;
  v10 = v6;
  -[NSArray enumerateObjectsUsingBlock:](observables, "enumerateObjectsUsingBlock:", v14);
  v11 = v17;
  v12 = v8;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultReportingStrategy, 0);
  objc_storeStrong((id *)&self->_observables, 0);
}

@end
