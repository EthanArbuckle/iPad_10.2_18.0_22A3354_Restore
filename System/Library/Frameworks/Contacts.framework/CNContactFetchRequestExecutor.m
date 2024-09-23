@implementation CNContactFetchRequestExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMapper, 0);
}

- (void)observableForFetchRequest:(void *)a1
{
  void **v2;
  id v3;
  id *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = -[CNContactFetchRequestExecutorPredicateEvaluator initWithFetchRequestPrototype:dataMapper:]((id *)[CNContactFetchRequestExecutorPredicateEvaluator alloc], v3, v2[1]);
    objc_msgSend(v3, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactFetchRequestExecutorPredicateEvaluator evaluatePredicate:](v4, v5);
    -[CNContactFetchRequestExecutorPredicateEvaluator observable](v4);
    v2 = (void **)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)initWithDataMapper:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)CNContactFetchRequestExecutor;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

@end
