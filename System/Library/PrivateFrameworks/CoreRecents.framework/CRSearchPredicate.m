@implementation CRSearchPredicate

+ (id)predicateSatisfyingAllSubpredicates:(id)a3
{
  id v3;
  _CRAndConjunctionPredicate *v4;

  v3 = a3;
  v4 = -[_CRAndConjunctionPredicate initWithSubpredicates:]([_CRAndConjunctionPredicate alloc], "initWithSubpredicates:", v3);

  return v4;
}

+ (id)predicateSatisfyingAnySubpredicate:(id)a3
{
  id v3;
  _CROrConjunctionPredicate *v4;

  v3 = a3;
  v4 = -[_CROrConjunctionPredicate initWithSubpredicates:]([_CROrConjunctionPredicate alloc], "initWithSubpredicates:", v3);

  return v4;
}

+ (NSSet)secureCodableSubclasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)predicateForKey:(id)a3 matchingText:(id)a4 comparison:(unint64_t)a5
{
  id v7;
  id v8;
  _CRMatchTextPredicate *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_CRMatchTextPredicate initWithKey:text:comparison:]([_CRMatchTextPredicate alloc], "initWithKey:text:comparison:", v8, v7, a5);

  return v9;
}

- (CRSearchPredicate)init
{
  CRSearchPredicate *v2;
  CRSearchPredicate *v3;
  CRSearchPredicate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRSearchPredicate;
  v2 = -[CRSearchPredicate init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)predicateForKey:(id)a3 inCollection:(id)a4
{
  id v5;
  id v6;
  _CRSearchCollectionPredicate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CRSearchCollectionPredicate initWithKey:collection:]([_CRSearchCollectionPredicate alloc], "initWithKey:collection:", v6, v5);

  return v7;
}

- (id)asNSPredicate
{
  CRSearchPredicate *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSearchPredicate)initWithCoder:(id)a3
{
  id v4;
  CRSearchPredicate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CRSearchPredicate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end
