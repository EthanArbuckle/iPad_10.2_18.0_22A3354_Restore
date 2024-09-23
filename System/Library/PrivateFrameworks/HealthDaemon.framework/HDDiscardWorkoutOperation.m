@implementation HDDiscardWorkoutOperation

- (HDDiscardWorkoutOperation)initWithBuilderIdentifier:(id)a3
{
  id v4;
  HDDiscardWorkoutOperation *v5;
  uint64_t v6;
  NSUUID *builderIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDiscardWorkoutOperation;
  v5 = -[HDDiscardWorkoutOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    builderIdentifier = v5->_builderIdentifier;
    v5->_builderIdentifier = (NSUUID *)v6;

  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  NSUUID *builderIdentifier;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  builderIdentifier = self->_builderIdentifier;
  v7 = a3;
  HDPredicateForWorkoutBuilderWithIdentifier((uint64_t)builderIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v9, "deleteEntitiesWithPredicate:healthDatabase:error:", v8, v10, a5);
  return (char)a5;
}

- (NSUUID)builderIdentifier
{
  return self->_builderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builderIdentifier, 0);
}

@end
