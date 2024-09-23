@implementation _HKCompoundFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "subfilters", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "predicateWithProfile:", v5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          _HKInitializeLogging();
          v16 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v22 = v16;
            HKLogSafeDescription();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v23;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Unable to construct predicate for filter: %{public}@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
        v13 = (void *)v12;
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = objc_msgSend(a1, "compoundPredicateType");
  if (v14)
  {
    if (v14 == 2)
    {
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v6);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKFilter+HealthDaemon.m"), 73, CFSTR("Unreachable code has been executed"));

        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      }
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(v6, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "negatedPredicate:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v17;
}

- (id)filterIgnoringPrivateMetadata
{
  return -[_HKCompoundFilter _filterByApplyingTransformationToSubfilters:](a1, &__block_literal_global_91);
}

- (id)filterIgnoringActivityCacheIndexFilter
{
  return -[_HKCompoundFilter _filterByApplyingTransformationToSubfilters:](a1, &__block_literal_global_194_0);
}

@end
