@implementation LSFeatureFlagPredicateEvaluator

- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;

  +[LSFeatureFlagPredicate featureFlagPredicateForBundle:bundleData:database:error:](LSFeatureFlagPredicate, "featureFlagPredicateForBundle:bundleData:database:error:", *(_QWORD *)&a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LSFeatureFlagPredicateEvaluator evaluatePredicate:](self, "evaluatePredicate:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LSFeatureFlagPredicateEvaluator)initWithResolver:(id)a3
{
  id v5;
  LSFeatureFlagPredicateEvaluator *v6;
  LSFeatureFlagPredicateEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSFeatureFlagPredicateEvaluator;
  v6 = -[LSFeatureFlagPredicateEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolver, a3);

  return v7;
}

- (BOOL)evaluatePredicate:(id)a3
{
  return objc_msgSend(a3, "evaluateWithFeatureFlagResolver:", self->_resolver);
}

+ (id)defaultResolver
{
  return +[_LSDefaultFeatureFlagResolver sharedInstance](_LSDefaultFeatureFlagResolver, "sharedInstance");
}

+ (id)defaultEvaluator
{
  if (+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken != -1)
    dispatch_once(&+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken, &__block_literal_global_56_1);
  return (id)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;
}

void __51__LSFeatureFlagPredicateEvaluator_defaultEvaluator__block_invoke()
{
  LSFeatureFlagPredicateEvaluator *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [LSFeatureFlagPredicateEvaluator alloc];
  +[_LSDefaultFeatureFlagResolver sharedInstance](_LSDefaultFeatureFlagResolver, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[LSFeatureFlagPredicateEvaluator initWithResolver:](v0, "initWithResolver:");
  v2 = (void *)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;
  +[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
