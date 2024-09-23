@implementation HDCorrelationSampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 13;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 3);
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6518], "createWithCodable:", a3, a4);
}

+ (id)_predicateForSyncSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleSyncEntity;
  objc_msgSendSuper2(&v10, sel__predicateForSyncSession_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "_allTypesOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HDDataEntityPredicateForType(1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsSampleExpiration");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "_allTypesOfClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v10, v5, *MEMORY[0x1E0CB6120]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
