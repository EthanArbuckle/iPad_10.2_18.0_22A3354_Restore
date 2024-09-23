@implementation HDFitnessFriendAchievementSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 49);
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 0;
}

+ (Class)_syncedSampleTypeClass
{
  return 0;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "fitnessFriendAchievementType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v8, v5, 11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
