@implementation HDMedicalUserDomainConceptCollapser

+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_opt_self();
  objc_msgSend(v10, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HDDataEntityPredicateForDataUUID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDMedicalUserDomainConceptEntity, "anyInDatabase:predicate:error:", v12, v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "protectedDatabase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDMedicalUserDomainConceptEntity, "anyInDatabase:predicate:error:", v16, v18, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = +[HDMedicalUserDomainConceptMappingEntity migrateMappingsFromUserDomainConceptID:toUserDomainConceptID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "migrateMappingsFromUserDomainConceptID:toUserDomainConceptID:transaction:error:", objc_msgSend(v15, "persistentID"), objc_msgSend(v19, "persistentID"), v10, a6);
    else
      v20 = 0;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "categoryTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "categoryTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hk_addUniqueObjectsFromArray:", v9);
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(v5, "categoryTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 == v12)
  {
    v13 = v5;
  }
  else
  {
    objc_msgSend(v5, "medicalConceptByReplacingCategoryTypes:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

@end
