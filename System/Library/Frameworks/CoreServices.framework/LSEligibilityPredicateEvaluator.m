@implementation LSEligibilityPredicateEvaluator

- (LSEligibilityPredicateEvaluator)initWithResolver:(id)a3
{
  id v5;
  LSEligibilityPredicateEvaluator *v6;
  LSEligibilityPredicateEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSEligibilityPredicateEvaluator;
  v6 = -[LSEligibilityPredicateEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolver, a3);

  return v7;
}

- (id)evaluatePredicate:(id)a3 error:(id *)a4
{
  objc_msgSend(a3, "evaluateWithDomainEligibilityResolver:error:", self->_resolver, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

+ (id)sharedCachingEligibilityPredicateEvaluator
{
  if (+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::onceToken != -1)
    dispatch_once(&+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::onceToken, &__block_literal_global_10);
  return (id)+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result;
}

void __105__LSEligibilityPredicateEvaluator_LSInternalCachingEvaluator__sharedCachingEligibilityPredicateEvaluator__block_invoke()
{
  LSEligibilityPredicateEvaluator *v0;
  void *v1;
  LSEligibilityCacheEligibilityResolver *v2;

  v2 = objc_alloc_init(LSEligibilityCacheEligibilityResolver);
  v0 = -[LSEligibilityPredicateEvaluator initWithResolver:]([LSEligibilityPredicateEvaluator alloc], "initWithResolver:", v2);
  v1 = (void *)+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result;
  +[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result = (uint64_t)v0;

}

- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v14 = 0;
  v15 = 0;
  if (+[LSEligibilityPredicate getInstallationPredicate:uninstallationPredicate:forBundle:bundleData:database:error:](LSEligibilityPredicate, "getInstallationPredicate:uninstallationPredicate:forBundle:bundleData:database:error:", &v15, &v14, *(_QWORD *)&a3, a4, a5, a6))
  {
    if (v15)
    {
      v13 = 0;
      -[LSEligibilityPredicateEvaluator evaluatePredicate:error:](self, "evaluatePredicate:error:", v15, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      if (!v7)
      {
        v9 = 0;
        goto LABEL_17;
      }
      if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
      {
        v9 = (void *)MEMORY[0x1E0C9AAA0];
        goto LABEL_17;
      }

    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)MEMORY[0x1E0C9AAB0];
    if (!v14)
    {
LABEL_18:

      goto LABEL_19;
    }
    v12 = v8;
    -[LSEligibilityPredicateEvaluator evaluatePredicate:error:](self, "evaluatePredicate:error:", v14, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;

    if (v7)
    {
      if (objc_msgSend(v7, "BOOLValue"))
        v9 = (void *)MEMORY[0x1E0C9AAA0];
    }
    else
    {
      v9 = 0;
    }
    v8 = v10;
LABEL_17:

    goto LABEL_18;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

@end
