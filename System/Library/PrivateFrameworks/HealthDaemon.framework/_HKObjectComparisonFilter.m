@implementation _HKObjectComparisonFilter

- (id)_associationPredicateWithProfile:(uint64_t)a3 type:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB58D8]);
  v7 = (void *)objc_opt_class();

  objc_msgSend(a1, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HDDataEntityPredicateForDataUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v7, "anyWithPredicate:healthDatabase:error:", v10, v11, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;

  if (v12)
  {
    HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObjectForType(objc_msgSend(v12, "persistentID"), a3);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to find sample with UUID %{public}@, error: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;

  return v16;
}

- (id)_appleWatchSourcePredicate
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "value");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForObjectsFromAppleWatchSources(objc_msgSend(v1, "BOOLValue"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_OSBuildPredicate
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "operatorType");
    v2 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(v1, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForOriginBuild(v2, v3);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_contributorPredicateWithProfile:(id)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v2 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    +[HDContributorEntity contributorEntityWithUUID:profile:includeDeleted:error:](HDContributorEntity, "contributorEntityWithUUID:profile:includeDeleted:error:", v4, v3, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "persistentID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForContributorIdentifier((uint64_t)v7);
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v12 = v2;
        v13 = 2114;
        v14 = v4;
        v15 = 2114;
        v16 = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find contributor with UUID %{public}@, error %{public}@", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v2;
}

- (id)_creationDatePredicate
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "operatorType");
    v2 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(v1, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForCreationDate(v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_productTypePredicate
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "operatorType");
    v2 = HDSQLiteComparisonTypeForPredicateOperator();
    objc_msgSend(v1, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForOriginProductType(v2, (uint64_t)v3);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_devicePropertyPredicateWithProfile:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a2;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E0CB57D8], "length") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "value");
  v17 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v3;
  objc_opt_self();
  objc_msgSend(v8, "deviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "deviceEntitiesWithProperty:matchingValues:error:", v7, v6, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "hk_map:", &__block_literal_global_218);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  v12 = v17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("data_provenances.device_id"), v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to find devices: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  return v15;
}

- (id)_metadataPredicateWithProfile:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    -[_HKObjectComparisonFilter _metadataKeyFromMetadataKeyPath](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "operatorType");
    objc_msgSend(v3, "metadataManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 10)
      objc_msgSend(v6, "predicateWithMetadataKey:allowedValues:", v4, v7);
    else
      objc_msgSend(v6, "predicateWithMetadataKey:value:operatorType:", v4, v7, objc_msgSend(a1, "operatorType"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (id)_metadataKeyFromMetadataKeyPath
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "keyPath");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E0CB5828], "length") + 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
