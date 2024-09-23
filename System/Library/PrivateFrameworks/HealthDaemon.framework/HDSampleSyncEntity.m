@implementation HDSampleSyncEntity

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

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
    objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v5, *MEMORY[0x1E0CB6120]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (Class)_syncedSampleTypeClass
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)_predicateForSyncSession:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___HDSampleSyncEntity;
  objc_msgSendSuper2(&v27, sel__predicateForSyncSession_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_opt_self();
  objc_msgSend(v7, "syncPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", -*MEMORY[0x1E0CB5E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForEndDate(6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D29840];
    v28[0] = v11;
    v28[1] = v14;
    v28[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateMatchingAllPredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(a1, "_syncedSampleTypeClass");
  if (v21)
  {
    v22 = v21;
    if ((objc_msgSend(v21, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataSyncEntity.m"), 391, CFSTR("%@ isn't an object type class"), v22);

    }
    objc_msgSend(a1, "_predicateForSampleAgeInSyncSession:sampleTypeClass:", v7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v20, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = v20;
  }

  return v24;
}

+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a3;
  objc_msgSend(v6, "syncPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumObjectAgeByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HDSampleSyncEntity__predicateForSampleAgeInSyncSession_sampleTypeClass___block_invoke;
  v15[3] = &__block_descriptor_40_e35_B24__0__HKObjectType_8__NSNumber_16lu32l8;
  v15[4] = a4;
  objc_msgSend(v8, "hk_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "syncPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultMaximumObjectAge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSampleSyncEntity _predicateForSampleAgeWithMaximumObjectAgeByType:defaultMaxAge:sessionStartDate:]((uint64_t)a1, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __74__HDSampleSyncEntity__predicateForSampleAgeInSyncSession_sampleTypeClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)_predicateForSampleAgeWithMaximumObjectAgeByType:(void *)a3 defaultMaxAge:(void *)a4 sessionStartDate:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v9 = objc_msgSend(v6, "count");
  if (v7 || v9)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke;
    v28[3] = &unk_1E6D10838;
    v13 = v11;
    v29 = v13;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v28);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke_2;
    v25[3] = &unk_1E6D10860;
    v15 = v8;
    v26 = v15;
    v16 = v14;
    v27 = v16;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (v7)
    {
      objc_msgSend(v6, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDSampleEntityPredicateForDataTypes(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v15, "dateByAddingTimeInterval:", -v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HDSampleEntityPredicateForEndDate(5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v19, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v23);

    }
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

void __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a2;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HDSampleEntityPredicateForDataType(v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v7;
  }
  else
  {
    HDSampleEntityPredicateForDataTypes(v5);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  objc_msgSend(v8, "dateByAddingTimeInterval:", -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v15, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

}

@end
