@implementation EMFIndexStrategyFactory

+ (id)inferStrategyForIndex:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;

  v3 = a3;
  v4 = _strategyClassForIndex(v3);
  if (!v4)
  {
    emf_logging_get_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[EMFIndexStrategyFactory inferStrategyForIndex:].cold.1(v10);

    __assert_rtn("+[EMFIndexStrategyFactory inferStrategyForIndex:]", "EMFIndexStrategyFactory.m", 49, "strategyClass");
  }
  v5 = [v4 alloc];
  objc_msgSend(v3, "termIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTermIndex:andDocumentIndex:", v6, v7);

  return v8;
}

+ (id)defaultStrategyWithTermIndex:(id)a3 andDocumentIndex:(id)a4
{
  id v5;
  id v6;
  EMFIndexStrategyDefault *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[EMFAbstractIndexStrategy initWithTermIndex:andDocumentIndex:]([EMFIndexStrategyDefault alloc], "initWithTermIndex:andDocumentIndex:", v6, v5);

  return v7;
}

+ (void)inferStrategyForIndex:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3DE1000, log, OS_LOG_TYPE_ERROR, "Could not infer strategy for index", v1, 2u);
}

@end
