@implementation HDMedicationUserDomainConceptDailyAnalytics

- (HDMedicationUserDomainConceptDailyAnalytics)initWithProfile:(id)a3 medicationsKeyValueDomain:(id)a4 calendar:(id)a5 currentDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDMedicationUserDomainConceptDailyAnalytics *v14;
  HDMedicationUserDomainConceptDailyAnalytics *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMedicationUserDomainConceptDailyAnalytics;
  v14 = -[HDMedicationUserDomainConceptDailyAnalytics init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_medicationsKeyValueDomain, a4);
    objc_storeStrong((id *)&v15->_calendar, a5);
    objc_storeStrong((id *)&v15->_currentDate, a6);
  }

  return v15;
}

- (BOOL)isEventSubmissionIHAGated
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 1;
}

- (NSString)eventName
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HDMedicationUserDomainConceptDailyAnalytics *v15;
  id v16;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__HDMedicationUserDomainConceptDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v13[3] = &unk_1E6E00240;
  v14 = v5;
  v15 = self;
  v8 = v5;
  LODWORD(v5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, &v16, v13);
  v9 = v16;

  if ((_DWORD)v5)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __96__HDMedicationUserDomainConceptDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "_hasAddedMedsInPastUnrestrictedPayloadWithTransaction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hasMedsListPayloadWithTransaction:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hasAnyLifestyleFactorEnabledPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_addEntriesFromNonNilDictionary:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_weeksSinceFirstAddedMedPayloadWithTransaction:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hk_addEntriesFromNonNilDictionary:", v12);
  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HDMedicationUserDomainConceptDailyAnalytics *v15;
  id v16;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__HDMedicationUserDomainConceptDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke;
  v13[3] = &unk_1E6E00240;
  v14 = v5;
  v15 = self;
  v8 = v5;
  LODWORD(v5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, &v16, v13);
  v9 = v16;

  if ((_DWORD)v5)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __92__HDMedicationUserDomainConceptDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "_hasAddedMedsInPastIHAGatedPayloadWithTransaction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_medsCountPayloadWithTransaction:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_archivedMedsCountPayloadWithTransaction:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_addEntriesFromNonNilDictionary:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_medsInteractionsPayloadWithTransaction:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hk_addEntriesFromNonNilDictionary:", v12);
  return 1;
}

- (id)_weeksSinceFirstAddedMedPayloadWithTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSCalendar *calendar;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  HDMedicationUserDomainConceptDailyAnalytics *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D293A8], objc_opt_class(), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  v28 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userDomainConceptManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__HDMedicationUserDomainConceptDailyAnalytics__weeksSinceFirstAddedMedPayloadWithTransaction___block_invoke;
  v21[3] = &unk_1E6E01308;
  v21[4] = &v23;
  v12 = objc_msgSend(v11, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:error:enumerationHandler:", v7, 1, v9, &v22, v21);
  v13 = v22;

  if ((v12 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HDMedicationUserDomainConceptDailyAnalytics _weeksSinceFirstAddedMedPayloadWithTransaction:].cold.1();
    goto LABEL_8;
  }
  if (!v24[5])
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] No error when fetching oldest medications added, but also no value", buf, 0xCu);
    }
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", self->_currentDate);
  v14 = objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  objc_msgSend((id)v24[5], "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar startOfDayForDate:](calendar, "startOfDayForDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HKMedicationAnalyticsWeeksBetweenDates();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("weeksSinceFirstAddedMed"));

  v19 = v5;
LABEL_9:

  _Block_object_dispose(&v23, 8);
  return v19;
}

uint64_t __94__HDMedicationUserDomainConceptDailyAnalytics__weeksSinceFirstAddedMedPayloadWithTransaction___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

- (id)_hasAnyLifestyleFactorEnabledPayload
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C280]))
  {
    objc_msgSend(v4, "addObject:", &unk_1E6E110C0);
  }
  if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C2E8]))
  {
    objc_msgSend(v4, "addObject:", &unk_1E6E110D8);
  }
  if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C380]))
  {
    objc_msgSend(v4, "addObject:", &unk_1E6E110F0);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "count") != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasAnyLifestyleFactorEnabled"));

  return v3;
}

- (id)_medsInteractionsPayloadWithTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
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
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _QWORD v63[5];
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _QWORD v73[5];

  v73[3] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "appleOntologySystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForMedicalCodingSystem();
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D29840];
  v73[0] = v47;
  v73[1] = v45;
  v73[2] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingAllPredicates:", v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__10;
  v69 = __Block_byref_object_dispose__10;
  v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userDomainConceptManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __87__HDMedicationUserDomainConceptDailyAnalytics__medsInteractionsPayloadWithTransaction___block_invoke;
  v63[3] = &unk_1E6E01330;
  v63[4] = &v65;
  v9 = objc_msgSend(v8, "enumerateUserDomainConceptsWithPredicate:error:enumerationHandler:", v44, &v64, v63);
  v50 = v64;

  if ((v9 & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C280]))
    {
      -[NSObject addObject:](v10, "addObject:", &unk_1E6E110C0);
    }
    if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C2E8]))
    {
      -[NSObject addObject:](v10, "addObject:", &unk_1E6E110D8);
    }
    if (-[HDKeyValueDomain hdmd_numberValueAsBoolForKey:](self->_medicationsKeyValueDomain, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C380]))
    {
      -[NSObject addObject:](v10, "addObject:", &unk_1E6E110F0);
    }
    v42 = v10;

    v11 = v66[5];
    v12 = objc_loadWeakRetained((id *)&self->_profile);
    v62 = 0;
    +[HDDrugInteractionEngine interactionResultsForMedications:lifestyleFactors:profile:error:](HDDrugInteractionEngine, "interactionResultsForMedications:lifestyleFactors:profile:error:", v11, v42, v12, &v62);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v62;

    if (v41)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v41;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      if (v13)
      {
        v52 = *(_QWORD *)v59;
        do
        {
          v53 = v13;
          for (i = 0; i != v53; ++i)
          {
            if (*(_QWORD *)v59 != v52)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            objc_msgSend(v18, "interactions");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v55;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v55 != v21)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "severity");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "severityLevel");

                  switch(v24)
                  {
                    case 1:
                      ++v14;
                      break;
                    case 2:
                      ++v15;
                      break;
                    case 3:
                      ++v16;
                      break;
                  }
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
              }
              while (v20);
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
        }
        while (v13);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15 + v14 + v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v26, CFSTR("numberOfMedsInteractions"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v28, CFSTR("numberOfSevereMedsInteractions"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v30, CFSTR("numberOfCriticalMedsInteractions"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v32, CFSTR("numberOfMajorMedsInteractions"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v34, CFSTR("numberOfSeriousMedsInteractions"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v36, CFSTR("numberOfModerateMedsInteractions"));

      v37 = v49;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[HDMedicationUserDomainConceptDailyAnalytics _medsInteractionsPayloadWithTransaction:].cold.1();

      v37 = 0;
    }

    v38 = v42;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[HDMedicationUserDomainConceptDailyAnalytics _medsInteractionsPayloadWithTransaction:].cold.2();
    v37 = 0;
  }

  _Block_object_dispose(&v65, 8);
  return v37;
}

uint64_t __87__HDMedicationUserDomainConceptDailyAnalytics__medsInteractionsPayloadWithTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (id)_hasAddedMedsInPastIHAGatedPayloadWithTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -1, self->_currentDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_medicationsAddedCountSinceDate:transaction:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "integerValue") >= 1)
    {
      v9 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasAddedMedsInPast24hrs"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPastWeek"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPastMonth"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPast6Months"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPastYear"));
      goto LABEL_11;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasAddedMedsInPast24hrs"));
  }
  -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -7, self->_currentDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_medicationsAddedCountSinceDate:transaction:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "integerValue") < 1)
    {
      v16 = MEMORY[0x1E0C9AAA0];
      v14 = CFSTR("hasAddedMedsInPastWeek");
      v15 = v5;
    }
    else
    {
      v13 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasAddedMedsInPastWeek"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("hasAddedMedsInPastMonth"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("hasAddedMedsInPast6Months"));
      v14 = CFSTR("hasAddedMedsInPastYear");
      v15 = v5;
      v16 = v13;
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v14);
  }

LABEL_11:
  return v5;
}

- (id)_hasAddedMedsInPastUnrestrictedPayloadWithTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -30, self->_currentDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_medicationsAddedCountSinceDate:transaction:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
LABEL_5:
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -180, self->_currentDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_medicationsAddedCountSinceDate:transaction:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "integerValue") >= 1)
      {
        v14 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasAddedMedsInPast6Months"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasAddedMedsInPastYear"));
        v15 = v5;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasAddedMedsInPast6Months"));
    }
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -365, self->_currentDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_medicationsAddedCountSinceDate:transaction:", v16, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "integerValue") > 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("hasAddedMedsInPastYear"));

    }
    v20 = v5;

    goto LABEL_12;
  }
  if (objc_msgSend(v7, "integerValue") < 1)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasAddedMedsInPastMonth"));
    goto LABEL_5;
  }
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasAddedMedsInPastMonth"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPast6Months"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasAddedMedsInPastYear"));
  v10 = v5;
LABEL_13:

  return v5;
}

- (id)_medsCountPayloadWithTransaction:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D295B8], "countOfUserDomainConceptsMatchingPredicate:options:transaction:error:", v6, 0, v4, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
  {
    HDMedicationDailyAnalyticsBucketForCount(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfMedsInList"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationUserDomainConceptDailyAnalytics _medsCountPayloadWithTransaction:].cold.1();
  }

  return v5;
}

- (id)_archivedMedsCountPayloadWithTransaction:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_countOfUserDomainConceptsWithPredicate:transaction:error:", 0, v3, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v5)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    objc_msgSend(v7, "_countOfUserDomainConceptsWithPredicate:transaction:error:", v8, v3, &v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue") - -[NSObject intValue](v9, "intValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HDMedicationDailyAnalyticsBucketForCount(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfArchivedMeds"));

      v13 = v4;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[HDMedicationUserDomainConceptDailyAnalytics _archivedMedsCountPayloadWithTransaction:].cold.2();

      v13 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationUserDomainConceptDailyAnalytics _archivedMedsCountPayloadWithTransaction:].cold.1();
    v13 = 0;
    v10 = v6;
  }

  return v13;
}

- (id)_hasMedsListPayloadWithTransaction:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D295B8], "countOfUserDomainConceptsMatchingPredicate:options:transaction:error:", v6, 0, v4, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "integerValue") > 0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasMedsList"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationUserDomainConceptDailyAnalytics _medsCountPayloadWithTransaction:].cold.1();
  }

  return v5;
}

+ (id)_medicationsAddedCountSinceDate:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_predicateForMedicationsSinceDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_countOfUserDomainConceptsWithPredicate:transaction:error:", v8, v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = a1;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_1B815E000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error when determining if user added medications since date: %{public}@, continuing daily analytics submission: %{public}@", buf, 0x20u);
    }

  }
  return v9;
}

+ (id)_countOfUserDomainConceptsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  v10 = *MEMORY[0x1E0D293E8];
  objc_msgSend(v7, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "countDistinctForProperty:predicate:database:error:", v10, v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_predicateForMedicationsSinceDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB6D48];
  v4 = a3;
  objc_msgSend(v3, "medicationUserDomainConceptTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", *MEMORY[0x1E0D293A8], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D29840];
  v12[0] = v6;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateMatchingAllPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_medicationsKeyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_weeksSinceFirstAddedMedPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error fetching oldest medication while determening weeks since first med added, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_medsInteractionsPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error fetching interaction results, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_medsInteractionsPayloadWithTransaction:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error fetching medications while determining interactions, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_medsCountPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error when determining if user has active medications in the database, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_archivedMedsCountPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to get all medications with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_archivedMedsCountPayloadWithTransaction:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to get active medications with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
