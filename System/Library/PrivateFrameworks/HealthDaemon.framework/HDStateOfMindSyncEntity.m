@implementation HDStateOfMindSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 64);
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
  return (id)objc_msgSend(MEMORY[0x1E0CB6C48], "createWithCodable:", a3, a4);
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

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "supportsSampleExpiration") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "features");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "chamomile");

  if (!v10)
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "stateOfMindType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v13, v5, *MEMORY[0x1E0CB6148]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v14;
}

@end
