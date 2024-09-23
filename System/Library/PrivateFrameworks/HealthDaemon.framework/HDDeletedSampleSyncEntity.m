@implementation HDDeletedSampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 19;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 19);
}

+ (Class)_syncedSampleTypeClass
{
  return 0;
}

+ (id)_predicateForSyncSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v68;
  _QWORD v69[3];
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];
  _QWORD v74[5];

  v74[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HDDataEntityPredicateForType(2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v6;
  if (!v6)
    goto LABEL_8;
  v65 = v3;
  v7 = v4;
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate(4);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -*MEMORY[0x1E0CB5E70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate(6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D29840];
  v64 = (void *)v9;
  v74[0] = v9;
  v74[1] = v12;
  v74[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqualToDate:", v19))
    goto LABEL_5;
  objc_msgSend(v6, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToDate:", v21);

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("start_date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v18;
    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("end_date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v19;
    v73[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateMatchingAnyPredicates:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v25;
LABEL_5:

  }
  v26 = (void *)MEMORY[0x1E0D29840];
  v72[0] = v7;
  v72[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateMatchingAllPredicates:", v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v65;
LABEL_8:
  objc_msgSend(v3, "syncPredicate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "defaultMaximumTombstoneAge");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v66 = v4;
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v29, "doubleValue");
    objc_msgSend(v31, "dateWithTimeIntervalSinceNow:", -v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HDDeletedObjectPredicateForDeletionDate(6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v34);

    v35 = v3;
    objc_msgSend(MEMORY[0x1E0CB6978], "activityGoalScheduleType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v36;
    objc_msgSend(MEMORY[0x1E0CB6978], "pauseRingsScheduleType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataTypes(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v30;
    objc_msgSend(v30, "addObject:", v39);

    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v30);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("end_date"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v41);

    objc_msgSend(v3, "syncPredicate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "maximumObjectAgeByType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncPredicate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "defaultMaximumObjectAge");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSampleSyncEntity _predicateForSampleAgeWithMaximumObjectAgeByType:defaultMaxAge:sessionStartDate:]((uint64_t)a1, v43, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hk_addNonNilObject:", v47);

    v48 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("data_type"), &unk_1E6DFE960);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "compoundPredicateWithPredicate:otherPredicate:", v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v51);

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "heartRateType");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "startDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v54, v55, *MEMORY[0x1E0CB6110]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v56);

    v4 = v66;
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v40);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x1E0D29840];
    v69[0] = v66;
    v69[1] = v62;
    v69[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "predicateMatchingAllPredicates:", v59);
    v60 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v35;
  }
  else
  {
    v60 = v4;
  }

  return v60;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDDataSyncUtilities insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", a3, a1, a4, a5, a6);
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hd_predicateForDeletedObjectsCreatedBeforeDate:minusDays:", v5, *MEMORY[0x1E0CB4BE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSyncToInitialShard
{
  return 1;
}

@end
