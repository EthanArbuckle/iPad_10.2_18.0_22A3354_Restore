@implementation HKQuerySortConstraint

+ (id)sortConstraintWithSortDescriptor:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(v7, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKQuerySortConstraint.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sortDescriptor.key isEqualToString:predicate.leftExpression.keyPath]"));

    }
    if (objc_msgSend(v8, "predicateOperatorType") != 4
      && objc_msgSend(v8, "predicateOperatorType") != 2
      && objc_msgSend(v8, "predicateOperatorType"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKQuerySortConstraint.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate.predicateOperatorType == NSEqualToPredicateOperatorType || predicate.predicateOperatorType == NSGreaterThanPredicateOperatorType || predicate.predicateOperatorType == NSLessThanPredicateOperatorType"));

    }
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSortDescriptor:predicate:", v7, v8);

  return v13;
}

+ (id)sortConstraintByRelaxingSortConstraint:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "predicateOperatorType");

    if (v8 == 4)
    {
      v9 = (void *)MEMORY[0x1E0CB3518];
      objc_msgSend(v5, "sortDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rightExpression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constantValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_inequalityPredicateWithKey:value:ascending:", v11, v14, objc_msgSend(v15, "ascending"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "sortDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuerySortConstraint sortConstraintWithSortDescriptor:predicate:](HKQuerySortConstraint, "sortConstraintWithSortDescriptor:predicate:", v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "sortDescriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuerySortConstraint sortConstraintWithSortDescriptor:predicate:](HKQuerySortConstraint, "sortConstraintWithSortDescriptor:predicate:", v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to relax sort constraint"));
    v18 = 0;
  }

  return v18;
}

- (BOOL)canRelax
{
  void *v2;
  BOOL v3;

  -[HKQuerySortConstraint predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HKQuerySortConstraint)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKQuerySortConstraint)initWithSortDescriptor:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  HKQuerySortConstraint *v8;
  uint64_t v9;
  NSSortDescriptor *sortDescriptor;
  uint64_t v11;
  NSComparisonPredicate *predicate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKQuerySortConstraint;
  v8 = -[HKQuerySortConstraint init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sortDescriptor = v8->_sortDescriptor;
    v8->_sortDescriptor = (NSSortDescriptor *)v9;

    v11 = objc_msgSend(v7, "copy");
    predicate = v8->_predicate;
    v8->_predicate = (NSComparisonPredicate *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p sortDescriptor = %@, predicate = %@>"), v5, self, self->_sortDescriptor, self->_predicate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKQuerySortConstraint sortDescriptor](self, "sortDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKQuerySortConstraint predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKQuerySortConstraint *v4;
  HKQuerySortConstraint *v5;
  NSSortDescriptor *sortDescriptor;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSSortDescriptor *v11;
  void *v12;
  BOOL v13;
  NSComparisonPredicate *predicate;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSComparisonPredicate *v18;
  void *v19;

  v4 = (HKQuerySortConstraint *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sortDescriptor = self->_sortDescriptor;
      -[HKQuerySortConstraint sortDescriptor](v5, "sortDescriptor");
      v7 = objc_claimAutoreleasedReturnValue();
      if (sortDescriptor == (NSSortDescriptor *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKQuerySortConstraint sortDescriptor](v5, "sortDescriptor");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        v11 = self->_sortDescriptor;
        -[HKQuerySortConstraint sortDescriptor](v5, "sortDescriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[NSSortDescriptor isEqual:](v11, "isEqual:", v12);

        if (!(_DWORD)v11)
          goto LABEL_15;
      }
      predicate = self->_predicate;
      -[HKQuerySortConstraint predicate](v5, "predicate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (predicate == (NSComparisonPredicate *)v15)
      {

LABEL_17:
        v13 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKQuerySortConstraint predicate](v5, "predicate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v18 = self->_predicate;
        -[HKQuerySortConstraint predicate](v5, "predicate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = -[NSComparisonPredicate isEqual:](v18, "isEqual:", v19);

        if ((v18 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v13 = 0;
  }
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuerySortConstraint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HKQuerySortConstraint *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SortDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Predicate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKQuerySortConstraint initWithSortDescriptor:predicate:](self, "initWithSortDescriptor:predicate:", v5, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSSortDescriptor *sortDescriptor;
  id v5;

  sortDescriptor = self->_sortDescriptor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sortDescriptor, CFSTR("SortDescriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predicate, CFSTR("Predicate"));

}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (NSComparisonPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
}

@end
