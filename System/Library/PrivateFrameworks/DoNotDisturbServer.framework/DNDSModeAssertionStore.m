@implementation DNDSModeAssertionStore

+ ($41ECE2D185AABD1EF15975168DB4548E)syncMessageKeys
{
  return ($41ECE2D185AABD1EF15975168DB4548E *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)&kSyncRecordKeys);
}

+ (id)newWithSyncDictionaryRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "bs_safeDictionaryForKey:", CFSTR("c"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionStoreRecord recordForDictionary:keys:](DNDSModeAssertionStoreRecord, "recordForDictionary:keys:", v3, &kSyncRecordKeys);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)messageDateForSyncDictionaryRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "bs_safeNumberForKey:", CFSTR("b"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)syncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[DNDSModeAssertionStoreRecord recordForAssertionStore:](DNDSModeAssertionStoreRecord, "recordForAssertionStore:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithKeys:options:", &kSyncRecordKeys, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("a");
  objc_msgSend(v6, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  v17[1] = CFSTR("b");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(v11, "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = CFSTR("c");
  v18[1] = v14;
  v18[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ ($41ECE2D185AABD1EF15975168DB4548E)backingRecordKeys
{
  return ($41ECE2D185AABD1EF15975168DB4548E *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)kBackingStoreRecordKeys);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;

  +[DNDSModeAssertionStoreRecord recordForDictionary:keys:](DNDSModeAssertionStoreRecord, "recordForDictionary:keys:", a3, kBackingStoreRecordKeys);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v3;
  void *v4;

  +[DNDSModeAssertionStoreRecord recordForAssertionStore:](DNDSModeAssertionStoreRecord, "recordForAssertionStore:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithKeys:options:", kBackingStoreRecordKeys, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)upgradeDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  void *v7;
  uint64_t v8;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v7 = (void *)objc_msgSend(v36, "mutableCopy");
  if (a4 <= 1 && a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (a4 <= 2 && a5 >= 3)
  {
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeAssertionRecords"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, CFSTR("storeAssertionRecords"));
  }
  if (a4 <= 3 && a5 >= 4)
  {
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeAssertionRecords"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bs_mapNoNulls:", &__block_literal_global_9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, CFSTR("storeAssertionRecords"));
  }
  if (a4 <= 4 && a5 >= 5)
  {
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeAssertionRecords"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, CFSTR("storeAssertionRecords"));
  }
  if (a4 <= 5 && a5 >= 6)
  {
    objc_msgSend(v7, "bs_safeNumberForKey:", CFSTR("storeLastCompleteInvalidationTimestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v7, "setObject:forKey:", CFSTR("user-changed-state"), CFSTR("storeLastCompleteInvalidationReason"));
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__4;
      v46 = __Block_byref_object_dispose__4;
      v16 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v15, "doubleValue");
      objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__4;
      v46 = __Block_byref_object_dispose__4;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    }
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeAssertionRecords"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_28;
    v41[3] = &unk_1E86A66D8;
    v41[4] = &v42;
    objc_msgSend(v17, "bs_mapNoNulls:", v41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v18, CFSTR("storeAssertionRecords"));
    objc_msgSend((id)v43[5], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("storeLastUpdateDate"));

    _Block_object_dispose(&v42, 8);
  }
  if (a4 <= 7 && a5 >= 8)
  {
    objc_msgSend(v7, "bs_safeNumberForKey:", CFSTR("storeLastCompleteInvalidationTimestamp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_safeStringForKey:", CFSTR("storeLastCompleteInvalidationReason"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_safeStringForKey:", CFSTR("storeLastCompleteInvalidationSourceClientIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v35 && v20 && v21)
    {
      objc_msgSend(v7, "bs_safeStringForKey:", CFSTR("storeLastCompleteInvalidationSourceDeviceIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("assertionClientIdentifier"));
      objc_msgSend(v24, "bs_setSafeObject:forKey:", v23, CFSTR("assertionSourceDeviceIdentifier"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("invalidationRequestUUID"));

      objc_msgSend(v25, "setObject:forKey:", &unk_1E86DEA68, CFSTR("invalidationRequestPredicate"));
      objc_msgSend(v25, "setObject:forKey:", v35, CFSTR("invalidationRequestDateTimestamp"));
      objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("invalidationRequestSource"));
      objc_msgSend(v25, "setObject:forKey:", v20, CFSTR("invalidationRequestReason"));
      v48[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v28, CFSTR("storeInvalidationRequestRecords"));

    }
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("storeLastCompleteInvalidationTimestamp"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("storeLastCompleteInvalidationReason"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("storeLastCompleteInvalidationSourceClientIdentifier"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("storeLastCompleteInvalidationSourceDeviceIdentifier"));
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeAssertionRecords"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3_90;
    v39[3] = &unk_1E86A6740;
    v40 = &__block_literal_global_65;
    objc_msgSend(v29, "bs_mapNoNulls:", v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v31, CFSTR("storeAssertionRecords"));
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("storeInvalidationRecords"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v30;
    v37[1] = 3221225472;
    v37[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_4;
    v37[3] = &unk_1E86A6740;
    v38 = &__block_literal_global_65;
    objc_msgSend(v32, "bs_mapNoNulls:", v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v33, CFSTR("storeInvalidationRecords"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("storeLastUpdateDate"));

  }
  return v7;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  else
    v3 = 0;
  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("assertionDetailsLifetimeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("user-requested")))
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("assertionDetailsLifetimeType"));
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("assertionDetailsUserRequested"));
  }

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  else
    v3 = 0;
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("assertionDetailsUserRequested"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("assertionDetailsLifetimeType"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && !v6)
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("schedule"), CFSTR("assertionDetailsLifetimeType"));
    objc_msgSend(v3, "setObject:forKey:", CFSTR("com.apple.donotdisturb.schedule.default"), CFSTR("assertionDetailsScheduleLifetimeScheduleIdentifier"));
    objc_msgSend(v3, "setObject:forKey:", CFSTR("expire-on-end"), CFSTR("assertionDetailsScheduleLifetimeBehavior"));
  }

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  else
    v3 = 0;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("assertionDetailsUserRequested"));

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v4 = 0;
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("assertionDetailsSyncSuppressionOptions"));
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("assertionStartDateTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0C99D68];
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "laterDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return v4;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_2_63(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsLifetimeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("assertionDetailsLifetimeType"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsCalendarEventLifetimeEventUniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("assertionDetailsCalendarEventLifetimeEventUniqueIdentifier"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsCalendarEventLifetimeOccurrenceDateTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("assertionDetailsCalendarEventLifetimeOccurrenceDateTimestamp"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsCalendarEventLifetimeOnlyDuringEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, CFSTR("assertionDetailsCalendarEventLifetimeOnlyDuringEvent"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsDateIntervalLifetimeStartDateTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, CFSTR("assertionDetailsDateIntervalLifetimeStartDateTimestamp"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsDateIntervalLifetimeEndDateTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, CFSTR("assertionDetailsDateIntervalLifetimeEndDateTimestamp"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsScheduleLifetimeScheduleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, CFSTR("assertionDetailsScheduleLifetimeScheduleIdentifier"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsScheduleLifetimeBehavior"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, CFSTR("assertionDetailsScheduleLifetimeBehavior"));

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v13, CFSTR("assertionDetailsIdentifier"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsModeIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v14, CFSTR("assertionDetailsModeIdentifier"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionDetailsUserVisibleEndDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v15, CFSTR("assertionDetailsUserVisibleEndDate"));

  objc_msgSend(v12, "bs_setSafeObject:forKey:", v3, CFSTR("assertionDetailsLifetime"));
  if (!objc_msgSend(v12, "count"))
  {

    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionClientIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bs_setSafeObject:forKey:", v17, CFSTR("assertionClientIdentifier"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionSourceDeviceIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bs_setSafeObject:forKey:", v18, CFSTR("assertionSourceDeviceIdentifier"));

  if (!objc_msgSend(v16, "count"))
  {

    v16 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionUUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v20, CFSTR("assertionUUID"));

  objc_msgSend(v2, "bs_takeObjectForKey:", CFSTR("assertionStartDateTimestamp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v21, CFSTR("assertionStartDateTimestamp"));

  objc_msgSend(v19, "bs_setSafeObject:forKey:", v12, CFSTR("assertionDetails"));
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v16, CFSTR("assertionSource"));

  return v19;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3_90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v4 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v5, CFSTR("invalidationAssertion"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_takeObjectForKey:", CFSTR("invalidationSourceClientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, CFSTR("assertionClientIdentifier"));

  objc_msgSend(v4, "bs_takeObjectForKey:", CFSTR("invalidationSourceDeviceIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v8, CFSTR("assertionSourceDeviceIdentifier"));

  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v6, CFSTR("invalidationSource"));

  return v4;
}

+ ($41ECE2D185AABD1EF15975168DB4548E)sysdiagnoseRecordKeys
{
  return ($41ECE2D185AABD1EF15975168DB4548E *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)kSysdiagnoseRecordKeys);
}

- (id)sysdiagnoseDictionaryRepresentation
{
  void *v2;
  void *v3;

  +[DNDSModeAssertionStoreRecord recordForAssertionStore:](DNDSModeAssertionStoreRecord, "recordForAssertionStore:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithKeys:options:", kSysdiagnoseRecordKeys, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)newWithPeaceSyncDictionaryRepresentation:(id)a3
{
  id v3;
  DNDSModeAssertionStoreRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(DNDSModeAssertionStoreRecord);
  objc_msgSend(v3, "bs_safeDictionaryForKey:", CFSTR("d"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("b"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionStoreRecord setAssertions:](v4, "setAssertions:", v7);
  objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("a"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dnds_dateValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion](DNDSModeAssertionInvalidationPredicate, "predicateForAnyAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.legacy-watch-toggle"), 0);
    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v10, v9, v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationRequestRecord recordForInvalidationRequest:](DNDSModeAssertionInvalidationRequestRecord, "recordForInvalidationRequest:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionStoreRecord setInvalidationRequests:](v4, "setInvalidationRequests:", v15);

    }
  }
  -[DNDSModeAssertionStoreRecord object](v4, "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

DNDSModeAssertionRecord *__85__DNDSModeAssertionStore_PeaceSyncMessage__newWithPeaceSyncDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  DNDSModeAssertionLifetimeRecord *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DNDSModeAssertionRecord *v16;
  void *v17;
  DNDSModeAssertionDetailsRecord *v18;
  void *v19;
  void *v20;
  DNDSModeAssertionSourceRecord *v21;
  void *v22;
  void *v23;
  void *v24;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("f"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("l"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v7)
    {
      v10 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
      -[DNDSModeAssertionLifetimeRecord setLifetimeType:](v10, "setLifetimeType:", v7);
      objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("g"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setEventUniqueID:](v10, "setEventUniqueID:", v11);

      objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("h"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setOnlyDuringEvent:](v10, "setOnlyDuringEvent:", v12);

      objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("k"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setOccurrenceDate:](v10, "setOccurrenceDate:", v13);

      objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("i"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setStartDate:](v10, "setStartDate:", v14);

      objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("j"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setEndDate:](v10, "setEndDate:", v15);
    }
    else
    {
      if (!v9)
      {
        v10 = 0;
        goto LABEL_14;
      }
      v10 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
      objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForLifetimeType:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setLifetimeType:](v10, "setLifetimeType:", v17);

      -[DNDSModeAssertionLifetimeRecord setScheduleIdentifier:](v10, "setScheduleIdentifier:", *MEMORY[0x1E0D1D3C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForScheduleLifetimeBehavior:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord setBehavior:](v10, "setBehavior:", v15);
    }

LABEL_14:
    v18 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("d"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setIdentifier:](v18, "setIdentifier:", v19);

    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("e"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setModeIdentifier:](v18, "setModeIdentifier:", v20);

    -[DNDSModeAssertionDetailsRecord setLifetime:](v18, "setLifetime:", v10);
    v21 = objc_alloc_init(DNDSModeAssertionSourceRecord);
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("c"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionSourceRecord setClientIdentifier:](v21, "setClientIdentifier:", v22);

    v16 = objc_alloc_init(DNDSModeAssertionRecord);
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("a"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setUUID:](v16, "setUUID:", v23);

    objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("b"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setStartDate:](v16, "setStartDate:", v24);

    -[DNDSModeAssertionRecord setDetails:](v16, "setDetails:", v18);
    -[DNDSModeAssertionRecord setSource:](v16, "setSource:", v21);

    goto LABEL_15;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

+ (id)messageDateForPeaceSyncDictionaryRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "bs_safeNumberForKey:", CFSTR("b"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)peaceSyncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4 userRequestedClientIdentifierHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32 = a4;
  v8 = a5;
  +[DNDSModeAssertionStoreRecord recordForAssertionStore:](DNDSModeAssertionStoreRecord, "recordForAssertionStore:", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "assertions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __135__DNDSModeAssertionStore_PeaceSyncMessage__peaceSyncDictionaryRepresentationWithDate_messageUUID_userRequestedClientIdentifierHandler___block_invoke;
  v38[3] = &unk_1E86A6A28;
  v10 = v8;
  v39 = v10;
  objc_msgSend(v9, "bs_mapNoNulls:", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v18, "predicate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "predicateType");

        if (!v20)
        {
          objc_msgSend(v18, "requestDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "laterDate:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("a"));

  objc_msgSend(v23, "bs_setSafeObject:forKey:", v11, CFSTR("b"));
  v40[0] = CFSTR("a");
  objc_msgSend(v32, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v26;
  v40[1] = CFSTR("b");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = CFSTR("d");
  v41[1] = v28;
  v41[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

id __135__DNDSModeAssertionStore_PeaceSyncMessage__peaceSyncDictionaryRepresentationWithDate_messageUUID_userRequestedClientIdentifierHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v5, CFSTR("a"));

  objc_msgSend(v3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v6, CFSTR("b"));

  objc_msgSend(v3, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v8, CFSTR("d"));

  objc_msgSend(v7, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v9, CFSTR("e"));

  objc_msgSend(v7, "lifetime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lifetimeType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForLifetimeType:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("l"));
  }
  else
  {
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v11, CFSTR("f"));
    objc_msgSend(v10, "eventUniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v14, CFSTR("g"));

    objc_msgSend(v10, "onlyDuringEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v15, CFSTR("h"));

    objc_msgSend(v10, "occurrenceDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v16, CFSTR("k"));

    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v17, CFSTR("i"));

    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v18, CFSTR("j"));

  }
  objc_msgSend(v3, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v20, CFSTR("c"));
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("l"));

  return v4;
}

- (DNDSModeAssertionStore)init
{
  return (DNDSModeAssertionStore *)-[DNDSModeAssertionStore _initWithStore:](self, "_initWithStore:", 0);
}

- (id)_initWithStore:(id)a3
{
  id v4;
  DNDSModeAssertionStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDSModeAssertionStore;
  v5 = -[DNDSModeAssertionStore init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "assertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v10 = (void *)v7;
    else
      v10 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_assertions, v10);

    objc_msgSend(v4, "invalidations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v9;
    objc_storeStrong((id *)&v5->_invalidations, v14);

    objc_msgSend(v4, "invalidationRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v9;
    objc_storeStrong((id *)&v5->_invalidationRequests, v18);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DNDSModeAssertionStore assertions](self, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSModeAssertionStore *v5;
  DNDSModeAssertionStore *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
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

  v5 = (DNDSModeAssertionStore *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSModeAssertionStore assertions](self, "assertions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionStore assertions](v6, "assertions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSModeAssertionStore assertions](self, "assertions");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_37;
        }
        v10 = (void *)v9;
        -[DNDSModeAssertionStore assertions](v6, "assertions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[DNDSModeAssertionStore assertions](self, "assertions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionStore assertions](v6, "assertions");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      -[DNDSModeAssertionStore invalidations](self, "invalidations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionStore invalidations](v6, "invalidations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSModeAssertionStore invalidations](self, "invalidations");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSModeAssertionStore invalidations](v6, "invalidations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v35 = v14;
            -[DNDSModeAssertionStore invalidations](self, "invalidations");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeAssertionStore invalidations](v6, "invalidations");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v3) & 1) != 0)
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSModeAssertionStore invalidationRequests](v6, "invalidationRequests");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v20 == (void *)v21)
              {

                v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[DNDSModeAssertionStore invalidationRequests](v6, "invalidationRequests");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v30 = v25;
                    -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSModeAssertionStore invalidationRequests](v6, "invalidationRequests");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v29, "isEqual:", v26);

                    v25 = v30;
                  }
                  else
                  {
                    v13 = 0;
                  }

                }
                else
                {

                  v13 = 0;
                }
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {

              }
LABEL_34:
              v11 = v38;
              v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8)
                goto LABEL_35;
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }

        }
        v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; assertions: %@; invalidations: %@; invalidationRequests: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSModeAssertionStore _initWithStore:]([DNDSMutableModeAssertionStore alloc], "_initWithStore:", self);
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (NSArray)invalidationRequests
{
  return self->_invalidationRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationRequests, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (id)lastUpdateDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v8), "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "laterDate:", v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      v16 = v3;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "invalidationDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "laterDate:", v17);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v3;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      v23 = v3;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22), "requestDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "laterDate:", v24);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v22;
        v23 = v3;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  return v3;
}

@end
