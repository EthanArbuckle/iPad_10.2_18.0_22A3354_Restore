@implementation HDSQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

+ (id)compoundPredicateWithPredicate:(id)a3 otherPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = v5;
    v12[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:](HDSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
      v10 = v5;
    else
      v10 = v6;
    v9 = v10;
  }

  return v9;
}

+ (id)disjunctionWithPredicate:(id)a3 otherPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = v5;
    v12[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:](HDSQLiteCompoundPredicate, "predicateMatchingAnyPredicates:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
      v10 = v5;
    else
      v10 = v6;
    v9 = v10;
  }

  return v9;
}

+ (id)BOOLeanPredicateWithValue:(BOOL)a3
{
  if (a3)
    objc_msgSend(a1, "truePredicate");
  else
    objc_msgSend(a1, "falsePredicate");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)falsePredicate
{
  if (falsePredicate_onceToken != -1)
    dispatch_once(&falsePredicate_onceToken, &__block_literal_global_460);
  return (id)falsePredicate_falsePredicate;
}

void __48__HDSQLitePredicate_Convenience__falsePredicate__block_invoke()
{
  HDSQLiteFalsePredicate *v0;
  void *v1;

  v0 = objc_alloc_init(HDSQLiteFalsePredicate);
  v1 = (void *)falsePredicate_falsePredicate;
  falsePredicate_falsePredicate = (uint64_t)v0;

}

+ (id)truePredicate
{
  if (truePredicate_onceToken != -1)
    dispatch_once(&truePredicate_onceToken, &__block_literal_global_462);
  return (id)truePredicate_truePredicate;
}

void __47__HDSQLitePredicate_Convenience__truePredicate__block_invoke()
{
  HDSQLiteTruePredicate *v0;
  void *v1;

  v0 = objc_alloc_init(HDSQLiteTruePredicate);
  v1 = (void *)truePredicate_truePredicate;
  truePredicate_truePredicate = (uint64_t)v0;

}

@end
