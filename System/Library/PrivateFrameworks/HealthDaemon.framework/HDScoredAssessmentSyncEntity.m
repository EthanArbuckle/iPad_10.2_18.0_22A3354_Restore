@implementation HDScoredAssessmentSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 65);
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "sample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataType");

  if (_HKValidDataTypeCode())
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "dataObjectClass");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "createWithCodable:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "supportsSampleExpiration"))
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "features");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "chamomile");

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "_allScoredAssessmentTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v7, v5, *MEMORY[0x1E0CB6120]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "chamomile");

  return v5;
}

@end
