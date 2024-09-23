@implementation HDMedicationExposableDoseEventEngine

+ (id)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__HDMedicationExposableDoseEventEngine_doseEventsForDateInterval_medicationIdentifier_profile_error___block_invoke;
  v22[3] = &unk_1E6E00118;
  v26 = v13;
  v27 = a1;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  LODWORD(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v22);

  if ((_DWORD)a6)
    v19 = v15;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

BOOL __101__HDMedicationExposableDoseEventEngine_doseEventsForDateInterval_medicationIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  +[HDMedicationExposableDoseEventEngine _allExposableDoseEventsForTransaction:dateInterval:medicationIdentifier:profile:error:](*(_QWORD *)(a1 + 64), a2, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v4);

  return v4 != 0;
}

+ (id)_allExposableDoseEventsForTransaction:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_opt_self();
  +[HDMedicationExposableDoseEventEngine _createPredicateForDateInterval:medicationIdentifier:](v14, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationExposableDoseEventEngine _getDoseEventsForProfile:predicate:error:](v14, v13, v15, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    +[HDMedicationExposableDoseEventEngine _createExposableDoseEventsFromDoseEvents:](v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);

    +[HDMedicationExposableDoseEventEngine _getMatchingScheduleItemDoseEventsForExistingDoseEvents:dateInterval:medicationIdentifier:transaction:profile:error:](v14, v16, v11, v12, v10, v20, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v19, "addObjectsFromArray:", v21);
      v22 = v19;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (BOOL)writeDoseEvents:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a4;
  +[HDMedicationExposableDoseEventEngine _createDoseEventsFromExposableEvents:profile:error:]((uint64_t)a1, a3, v8, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:error:](HDMedicationsAppSourceSupport, "medicationsAppSourceEntityForProfile:error:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "dataManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v9, v10, 0, 0, a5, CFAbsoluteTimeGetCurrent());

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_createDoseEventsFromExposableEvents:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  id v27;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__2;
  v26[4] = __Block_byref_object_dispose__2;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke;
  v16[3] = &unk_1E6E001D0;
  v18 = v26;
  v20 = v8;
  v10 = v7;
  v21 = a4;
  v17 = v10;
  v19 = &v22;
  objc_msgSend(v6, "hk_map:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (*((_BYTE *)v23 + 24))
  {
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke_2;
    v15[3] = &__block_descriptor_40_e63___HKMedicationDoseEvent_16__0__HKMedicationExposableDoseEvent_8l;
    v15[4] = v8;
    objc_msgSend(v11, "hk_map:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

  return v13;
}

+ (id)_createPredicateForDateInterval:(void *)a3 medicationIdentifier:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForEndDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v16[0] = v7;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  if (v4)
  {
    HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_getDoseEventsForProfile:(void *)a3 predicate:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v8 = (void *)MEMORY[0x1E0D294D8];
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v9, v7, 0, v6, 0, 0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_createExposableDoseEventsFromDoseEvents:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_getMatchingScheduleItemDoseEventsForExistingDoseEvents:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 transaction:(uint64_t)a6 profile:(uint64_t)a7 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a3;
  v15 = objc_opt_self();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[HDMedicationExposableDoseEventEngine _scheuduleItemsPredicateForDateInterval:](v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __156__HDMedicationExposableDoseEventEngine__getMatchingScheduleItemDoseEventsForExistingDoseEvents_dateInterval_medicationIdentifier_transaction_profile_error___block_invoke;
  v24[3] = &unk_1E6E00140;
  v25 = v12;
  v26 = v11;
  v27 = v16;
  v28 = v15;
  v18 = v16;
  v19 = v11;
  v20 = v12;
  LODWORD(a7) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", v17, 0, v13, a7, v24);

  if ((_DWORD)a7)
    v21 = v18;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

+ (id)_scheuduleItemsPredicateForDateInterval:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationScheduleItemPredicateForScheduledDateTime(5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationScheduleItemPredicateForScheduledDateTime(3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D29840];
  v11[0] = v4;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __156__HDMedicationExposableDoseEventEngine__getMatchingScheduleItemDoseEventsForExistingDoseEvents_dateInterval_medicationIdentifier_transaction_profile_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  +[HDMedicationExposableDoseEventEngine _createDoseEventsForScheduleItem:medicationIdentifier:existingDoseEvents:](*(_QWORD *)(a1 + 56), a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  +[HDMedicationExposableDoseEventEngine _createExposableDoseEventsFromDoseEvents:]((uint64_t)HDMedicationExposableDoseEventEngine, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return 1;
}

+ (id)_createDoseEventsForScheduleItem:(void *)a3 medicationIdentifier:(void *)a4 existingDoseEvents:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  objc_msgSend(v6, "doses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__HDMedicationExposableDoseEventEngine__createDoseEventsForScheduleItem_medicationIdentifier_existingDoseEvents___block_invoke;
  v16[3] = &unk_1E6E00168;
  v17 = v7;
  v18 = v6;
  v19 = v8;
  v20 = v9;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v10, "hk_map:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __113__HDMedicationExposableDoseEventEngine__createDoseEventsForScheduleItem_medicationIdentifier_existingDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB68B8]);
  objc_msgSend(v3, "medicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSemanticIdentifierString:", v5);

  v7 = *(void **)(a1 + 32);
  if (!v7 || v6 == v7 || objc_msgSend(v6, "isEqual:"))
  {
    +[HDMedicationExposableDoseEventEngine _doseEventForScheduleDose:scheduleItem:](*(_QWORD *)(a1 + 56), v3, *(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if ((+[HDMedicationExposableDoseEventEngine _dosesEqualExceptStatusForDoseEvent:doseEvent2:](*(_QWORD *)(a1 + 56), v8, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13)) & 1) != 0)
          {

            v14 = 0;
            goto LABEL_14;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }

    v14 = v8;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_doseEventForScheduleDose:(void *)a3 scheduleItem:
{
  id v4;
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
  void *v16;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationExposableDoseEventEngine _generateMetadataForScheduleItemIdentifier:semanticId:status:isLastScheduledDose:](v6, v7, v8, 1, objc_msgSend(v5, "isLastScheduledDose"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB68A8];
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dose");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scheduledDateTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduledDateTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "medicationDoseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:metadata:", 2, v11, v12, v13, 0, v14, v15, 2, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)_dosesEqualExceptStatusForDoseEvent:(void *)a3 doseEvent2:
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(v6, "medicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    objc_msgSend(v7, "medicationIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v20 = 0;
      goto LABEL_43;
    }
    v3 = (void *)v10;
    objc_msgSend(v6, "medicationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqual:", v11))
    {
      v20 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v43 = v11;
  }
  objc_msgSend(v6, "scheduleItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduleItemIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 == (void *)v13)
  {
    v46 = (void *)v13;
  }
  else
  {
    objc_msgSend(v7, "scheduleItemIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v20 = 0;
      goto LABEL_33;
    }
    v16 = (void *)v15;
    v44 = v3;
    v46 = v14;
    v17 = v4;
    objc_msgSend(v6, "scheduleItemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleItemIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
    {

      v20 = 0;
      v11 = v43;
      v4 = v17;
      v3 = v44;
      if (v8 == v9)
        goto LABEL_43;
      goto LABEL_42;
    }
    v39 = v19;
    v40 = v18;
    v41 = v16;
    v4 = v17;
    v3 = v44;
  }
  objc_msgSend(v6, "scheduledDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduledDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 == v22)
  {
    v42 = v4;
    v45 = v3;
  }
  else
  {
    objc_msgSend(v7, "scheduledDate");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v20 = 0;
      goto LABEL_38;
    }
    v38 = (void *)v23;
    objc_msgSend(v6, "scheduledDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduledDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      v20 = 0;
LABEL_31:

      v14 = v46;
      if (v12 == v46)
      {

        goto LABEL_41;
      }

LABEL_33:
      goto LABEL_41;
    }
    v42 = v4;
    v45 = v3;
  }
  objc_msgSend(v6, "scheduledDoseQuantity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduledDoseQuantity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 == v26)
  {
    v34 = v22;
    v35 = v21;
  }
  else
  {
    objc_msgSend(v7, "scheduledDoseQuantity");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

      goto LABEL_36;
    }
    v33 = v25;
    objc_msgSend(v6, "scheduledDoseQuantity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduledDoseQuantity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v27;
    v34 = v22;
    v35 = v21;
    v32 = (void *)v20;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      v20 = 0;
      goto LABEL_35;
    }
    v25 = v33;
  }
  v28 = objc_msgSend(v6, "logOrigin");
  v20 = v28 == objc_msgSend(v7, "logOrigin");
  if (v25 != v26)
  {
    v33 = v25;
LABEL_35:

    v22 = v34;
    v21 = v35;
LABEL_36:
    v3 = v45;
    v4 = v42;
    if (v21 != v22)
    {

    }
    goto LABEL_38;
  }

  v22 = v34;
  v21 = v35;
  v3 = v45;
  v4 = v42;
  if (v35 != v34)
    goto LABEL_31;
LABEL_38:

  if (v12 != v46)
  {

  }
LABEL_41:

  v11 = v43;
  if (v8 != v9)
    goto LABEL_42;
LABEL_43:

  return v20;
}

+ (id)_generateMetadataForScheduleItemIdentifier:(void *)a3 semanticId:(uint64_t)a4 status:(uint64_t)a5 isLastScheduledDose:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB68A8], "syncIdentifierForScheduleItemIdentifier:medicationIdentifier:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB68A8], "syncVersionForStatus:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68A8], "_metadataWithSyncIdentifier:syncVersion:isLastScheduledDose:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __81__HDMedicationExposableDoseEventEngine__createExposableDoseEventsFromDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D2C450];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDoseEvent:", v3);

  return v4;
}

id __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "semanticIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v3;
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      +[HDMedicationExposableDoseEventEngine _getActiveListMedicationsForProfile:error:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32), *(_QWORD *)(a1 + 64));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v12)
      {
        v5 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        goto LABEL_11;
      }
      if (!objc_msgSend(v12, "count"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", *(_QWORD *)(a1 + 64), 126, CFSTR("User has no active medications, thus attempts to write dose events are invalid."));
        v5 = 0;
        goto LABEL_11;
      }
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    +[HDMedicationExposableDoseEventEngine _populateSemanticIdentifierForExposableEvent:activeMedications:error:](*(_QWORD *)(a1 + 56), v3, v6, *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
      v8 = v7;
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

  }
LABEL_11:

  return v5;
}

+ (id)_getActiveListMedicationsForProfile:(uint64_t)a3 error:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "userDomainConceptManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__HDMedicationExposableDoseEventEngine__getActiveListMedicationsForProfile_error___block_invoke;
  v12[3] = &unk_1E6E00218;
  v13 = v6;
  v8 = v6;
  LODWORD(a3) = objc_msgSend(v7, "enumerateUserDomainConceptsWithPredicate:error:enumerationHandler:", v5, a3, v12);

  if ((_DWORD)a3)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

+ (id)_populateSemanticIdentifierForExposableEvent:(void *)a3 activeMedications:(uint64_t)a4 error:
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  id obj;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v7;
  v37 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v40;
    v32 = a4;
    obj = v8;
    v34 = v6;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v11 = objc_alloc(MEMORY[0x1E0CB68B8]);
        objc_msgSend(v10, "semanticIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v11, "initWithSemanticIdentifierString:", v13);

        objc_msgSend(v14, "underlyingIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "medicationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "underlyingIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v17)
        {
          v35 = v10;

LABEL_15:
          objc_msgSend(v35, "semanticIdentifier");
          v27 = v14;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "updateForSemanticIdentifier:", v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v6;
          v8 = obj;
          v26 = obj;
          goto LABEL_16;
        }
        v18 = (void *)v17;
        objc_msgSend(v6, "medicationIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "underlyingIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v35 = v10;
          objc_msgSend(v14, "underlyingIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "medicationIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "underlyingIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v21, "isEqualToString:", v23);

          v6 = v34;
          if ((v38 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v8 = obj;
      a4 = v32;
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v37)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v6, "medicationIdentifier");
  v25 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "underlyingIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_assignError:code:format:", a4, 118, CFSTR("Unable to find a HKMedicationUserDomainConcept with a semantic identifier that matches the HKMedicationExposableDoseEvent's hashed identifier: %@. Cancelling saving dose events."), v27);
  v28 = 0;
LABEL_16:

  return v28;
}

id __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "scheduleItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "semanticIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationExposableDoseEventEngine _generateMetadataForScheduleItemIdentifier:semanticId:status:isLastScheduledDose:](v2, v4, v5, objc_msgSend(v3, "status"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB68A8];
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "logOrigin");
  objc_msgSend(v3, "scheduleItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "semanticIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduledDoseQuantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v3, "doseQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v3, "scheduledDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "status");

  objc_msgSend(v6, "medicationDoseEventWithType:startDate:endDate:device:metadata:logOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:status:medicationUuid:", v7, v22, v8, 0, v23, v21, v13, v16, v9, v10, v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __82__HDMedicationExposableDoseEventEngine__getActiveListMedicationsForProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

@end
