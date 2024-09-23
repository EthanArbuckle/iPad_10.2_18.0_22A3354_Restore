@implementation HDQuantitySampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 2;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 4);
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sample");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dataType");

  if ((_HKValidDataTypeCode() & 1) == 0)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      objc_msgSend(v6, "sample");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = a1;
      v27 = 2048;
      v28 = objc_msgSend(v18, "dataType");
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v25, 0x16u);

    }
    goto LABEL_12;
  }
  if (v9 != 258)
  {
    if (v9 != 272)
      goto LABEL_13;
    objc_msgSend(v7, "provenance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originBuild");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("20R0"), CFSTR("20R239")))
    {
      objc_msgSend(v7, "provenance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originBuild");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("20A236");
      goto LABEL_11;
    }
LABEL_9:

LABEL_12:
    v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v7, "provenance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("20R0"), CFSTR("20R279")))goto LABEL_9;
  objc_msgSend(v7, "provenance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "originBuild");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = CFSTR("20A275");
LABEL_11:
  v19 = objc_msgSend(v13, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("20A0"), v15);

  if ((v19 & 1) != 0)
    goto LABEL_12;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB6A40], "createWithCodable:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6A40], "migrateCodableObject:", v6);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v23;

LABEL_17:
  return v20;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
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
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[7];
  _QWORD v88[4];
  _QWORD v89[2];
  uint64_t v90;
  _QWORD v91[5];
  _QWORD v92[3];
  _QWORD v93[2];
  uint64_t v94;
  _QWORD v95[2];
  void *v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsSampleExpiration");

  if (v10)
  {
    v82 = a1;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 249);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)v11;
    v94 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v13, v6, *MEMORY[0x1E0CB6158]);
    v81 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 90);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 256);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "behavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "features");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "extendedLocalWatchData");

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 139);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v21;
      objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v22;
      objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 61);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v25;
    }
    v83 = v16;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v16, v6, *MEMORY[0x1E0CB6130]);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6A70], "calorieGoal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v31;
    objc_msgSend(MEMORY[0x1E0CB6A70], "moveMinuteGoal");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 105);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v33;
    objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 104);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v34;
    objc_msgSend(MEMORY[0x1E0CB6A70], "sleepDurationGoalType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 118);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v36;
    v38 = v36;
    v80 = (void *)v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v39, v6, *MEMORY[0x1E0CB6138]);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 298);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v40;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 304);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v42 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)v42;
    objc_msgSend(v43, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v42, v6, *MEMORY[0x1E0CB6160]);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = *MEMORY[0x1E0CB6120];
    objc_msgSend(v44, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v6);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v45;
    v88[1] = v85;
    v88[2] = v38;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 283);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "arrayByAddingObjectsFromArray:", v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "arrayByAddingObjectsFromArray:", v78);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v42);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0D29840];
    HDSampleEntityPredicateForDataTypes(v76);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "negatedPredicate:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "compoundPredicateWithPredicate:otherPredicate:", v75, v52);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = (void *)MEMORY[0x1E0D29840];
    v28 = (void *)v81;
    v87[0] = v72;
    v87[1] = v81;
    v87[2] = v74;
    v87[3] = v84;
    +[HDQuantitySampleSyncEntity _headphoneAudioExposureSamplesExpirationPredicateForNowDate:]((uint64_t)v82, v6);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v71;
    v53 = v6;
    objc_opt_self();
    +[HDQuantitySampleSyncEntity _sedentaryAndBackgroundHeartRateContextPredicate]();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v69);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "heartRateType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v57, v53, *MEMORY[0x1E0CB6110]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "heartRateType");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v61, v53, v73);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v54, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)MEMORY[0x1E0D29840];
    v95[0] = v58;
    v95[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "predicateMatchingAnyPredicates:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v87[5] = v66;
    v87[6] = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "predicateMatchingAnyPredicates:", v67);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v85;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0D29840];
    +[HDQuantitySampleSyncEntity _headphoneAudioExposureSamplesExpirationPredicateForNowDate:]((uint64_t)a1, v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateMatchingAnyPredicates:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

+ (id)_headphoneAudioExposureSamplesExpirationPredicateForNowDate:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 173);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v5, v2, *MEMORY[0x1E0CB5108]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", MEMORY[0x1E0C9AAB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMetadataValueEntityPredicate predicateWithMetadataKey:allowedValues:](HDMetadataValueEntityPredicate, "predicateWithMetadataKey:allowedValues:", *MEMORY[0x1E0CB7290], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_sedentaryAndBackgroundHeartRateContextPredicate
{
  void *v0;
  void *v1;

  objc_opt_self();
  _HKBackgroundAndSedentaryPrivateHeartRateContexts();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMetadataValueEntityPredicate predicateWithMetadataKey:allowedValues:](HDMetadataValueEntityPredicate, "predicateWithMetadataKey:allowedValues:", *MEMORY[0x1E0CB7298], v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  if (a3 < 12)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_opt_class();
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSyncEntity;
  objc_msgSendSuper2(&v17, sel__predicateForSampleAgeInSyncSession_sampleTypeClass_, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[HDQuantitySampleSyncEntity _sedentaryAndBackgroundHeartRateContextPredicate]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "heartRateType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v11, v12, *MEMORY[0x1E0CB6110]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "disjunctionWithPredicate:otherPredicate:", v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
