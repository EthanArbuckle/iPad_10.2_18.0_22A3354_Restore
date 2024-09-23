@implementation HDMedicationsDemoDataGenerator

- (HDMedicationsDemoDataGenerator)init
{
  HDMedicationsDemoDataGenerator *v2;
  HDMedicationsDemoDataGenerator *v3;
  id v4;
  uint64_t v5;
  NSCalendar *currentCalendar;
  HDMedicationsDemoDataGeneratorState *v7;
  HDMedicationsDemoDataGeneratorState *state;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDMedicationsDemoDataGenerator;
  v2 = -[HDMedicationsDemoDataGenerator init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->isGeneratingDataOnWatch = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0CB6360]);
    objc_msgSend(v4, "currentCalendar");
    v5 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v5;

    v7 = objc_alloc_init(HDMedicationsDemoDataGeneratorState);
    state = v3->_state;
    v3->_state = v7;

    -[HDMedicationsDemoDataGenerator updateDemoDataFileName](v3, "updateDemoDataFileName");
    -[HDMedicationsDemoDataGenerator overrideMedicationShardCheck](v3, "overrideMedicationShardCheck");
  }
  return v3;
}

- (void)updateDemoDataFileName
{
  NSObject *v3;
  int v4;
  __CFString *v5;
  const __CFString *v6;
  NSString *v7;
  NSString *demoDataFileName;
  int v9;
  HDMedicationsDemoDataGenerator *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = objc_msgSend(MEMORY[0x1E0C99DC8], "hk_isUSLocale");
    _os_log_impl(&dword_1B815E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateDemoDataFileName  [NSLocale hk_isUSLocale] %d .", (uint8_t *)&v9, 0x12u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0CB6F18], "runningInStoreDemoModeF201"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0C99DC8], "hk_isUSLocale");
    v5 = CFSTR("medications_store_demo_data_NonUS");
    v6 = CFSTR("medications_store_demo_data_US");
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0C99DC8], "hk_isUSLocale");
    v5 = CFSTR("medications_demo_data_NonUS");
    v6 = CFSTR("medications_demo_data_US");
  }
  if (v4)
    v5 = (__CFString *)v6;
  v7 = v5;
  demoDataFileName = self->_demoDataFileName;
  self->_demoDataFileName = v7;

}

- (void)overrideMedicationShardCheck
{
  void *v2;
  void *v3;
  id v4;

  -[HDMedicationsDemoDataGenerator profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthMedicationsProfileExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setBool:forKey:", 1, *MEMORY[0x1E0D2C348]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_keyValueDomain
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D294B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:profile:", 3, CFSTR("MedicationsDemoData"), WeakRetained);

  return v5;
}

- (BOOL)_saveStateWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[HDMedicationsDemoDataGenerator _keyValueDomain](self, "_keyValueDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMedicationsDemoDataGeneratorState dictionary](self->_state, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "setValuesWithDictionary:error:", v6, a3);

  return (char)a3;
}

- (void)restoreState
{
  void *v3;
  void *v4;
  id v5;
  HDMedicationsDemoDataGeneratorState *v6;
  NSObject *v7;
  HDMedicationsDemoDataGeneratorState *state;
  id v9;
  uint8_t buf[4];
  HDMedicationsDemoDataGenerator *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HDMedicationsDemoDataGenerator _keyValueDomain](self, "_keyValueDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "allValuesWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = -[HDMedicationsDemoDataGeneratorState initWithDictionary:]([HDMedicationsDemoDataGeneratorState alloc], "initWithDictionary:", v4);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v3;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1B815E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Could not load HDMedicationsDemoDataGeneratorState from KeyValueDomain %{public}@  Error: %{public}@", buf, 0x20u);
    }

    v6 = objc_alloc_init(HDMedicationsDemoDataGeneratorState);
  }
  state = self->_state;
  self->_state = v6;

}

- (HDMedicationsDemoDataGenerator)initWithCoder:(id)a3
{
  HDMedicationsDemoDataGenerator *v3;
  HDMedicationsDemoDataGenerator *v4;
  id v5;
  uint64_t v6;
  NSCalendar *currentCalendar;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDMedicationsDemoDataGenerator;
  v3 = -[HDMedicationsDemoDataGenerator init](&v9, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->isGeneratingDataOnWatch = 0;
    v5 = objc_alloc_init(MEMORY[0x1E0CB6360]);
    objc_msgSend(v5, "currentCalendar");
    v6 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v4->_currentCalendar;
    v4->_currentCalendar = (NSCalendar *)v6;

    -[HDMedicationsDemoDataGenerator restoreState](v4, "restoreState");
    -[HDMedicationsDemoDataGenerator updateDemoDataFileName](v4, "updateDemoDataFileName");
    -[HDMedicationsDemoDataGenerator overrideMedicationShardCheck](v4, "overrideMedicationShardCheck");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  -[HDMedicationsDemoDataGenerator _saveStateWithError:](self, "_saveStateWithError:", 0);
}

- (id)doseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v15 = (void *)MEMORY[0x1E0CB68A8];
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(v15, "syncIdentifierForScheduleItemIdentifier:medicationIdentifier:", 0, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68A8], "syncVersionForStatus:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0CB55D8];
  v29[0] = *MEMORY[0x1E0CB55D0];
  v29[1] = v24;
  v30[0] = v22;
  v30[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68A8], "medicationDoseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:metadata:", a3, v21, v20, v19, v18, v17, v16, a10, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)saveMedicationDoseEvents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  char v11;

  v6 = a3;
  -[HDMedicationsDemoDataGenerator profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:error:](HDMedicationsAppSourceSupport, "medicationsAppSourceEntityForProfile:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v6, v8, 0, 0, a4, CFAbsoluteTimeGetCurrent());

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)asNeededDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v9;
  v17 = v11;
  if (a5)
  {
    v12 = 0x800000000;
    v13 = v11;
    do
    {
      -[HDMedicationsDemoDataGenerator doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:](self, "doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:", 1, 0, v8, 0, &unk_1E6E10D60, 0, v13, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

      objc_msgSend(v13, "dateByAddingTimeInterval:", -691200.0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v15 = a5 > v12 >> 32;
      v12 += 0x800000000;
      v13 = v11;
    }
    while (v15);
  }

  return v10;
}

- (id)scheduledDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v9;
  v20 = v11;
  if (a5)
  {
    v12 = 0;
    v13 = v11;
    do
    {
      objc_msgSend(MEMORY[0x1E0D2C4A8], "makeStableIdentifierFromScheduledDateTime:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 0x7FFFFFF7) != 0)
        v15 = 4;
      else
        v15 = 5;
      if ((v12 & 0x7FFFFFF7) != 0)
        v16 = 300.0;
      else
        v16 = 0.0;
      objc_msgSend(v13, "dateByAddingTimeInterval:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMedicationsDemoDataGenerator doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:](self, "doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:", 2, v14, v8, &unk_1E6E10D60, &unk_1E6E10D60, v13, v17, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v18);

      ++v12;
      objc_msgSend(v13, "dateByAddingTimeInterval:", -86400.0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v11;
    }
    while (a5 != v12);
  }

  return v10;
}

- (id)doseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5 logOrigin:(int64_t)a6
{
  if (a6 == 2)
    -[HDMedicationsDemoDataGenerator scheduledDoseEventsForMedication:startDateTime:historyDayCount:](self, "scheduledDoseEventsForMedication:startDateTime:historyDayCount:", a3, a4, a5);
  else
    -[HDMedicationsDemoDataGenerator asNeededDoseEventsForMedication:startDateTime:historyDayCount:](self, "asNeededDoseEventsForMedication:startDateTime:historyDayCount:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dailyScheduleForMedicationIdentifier:(id)a3 isAMSchedule:(BOOL)a4
{
  _BOOL4 v4;
  NSCalendar *currentCalendar;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v4 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  currentCalendar = self->_currentCalendar;
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a3;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar startOfDayForDate:](currentCalendar, "startOfDayForDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v12 = v11;
  if (v4)
    v13 = 8;
  else
    v13 = 20;
  objc_msgSend(v11, "setHour:", v13);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4A0]), "initWithStartTimeComponent:daysOfWeek:cycleIndex:cycleIntervalDays:dose:", v12, 0, 0, 0, &unk_1E6E10D60);
  v15 = objc_alloc(MEMORY[0x1E0D2C480]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar timeZone](self->_currentCalendar, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v16, v8, v17, v10, 0, v18, 2, 0, 0);

  return v19;
}

- (id)medicationWithDetail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  HDMedicationsDemoDataGenerator *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("VisualConfigFileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->isGeneratingDataOnWatch)
    goto LABEL_2;
  objc_msgSend(v4, "objectForKey:", CFSTR("OntologyCoding"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_2;
  v20 = (void *)v19;
  objc_msgSend(v4, "objectForKey:", CFSTR("OntologyCoding"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("OntologyCoding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB6D20];
    objc_msgSend(v4, "objectForKey:", CFSTR("NickName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "propertyCollectionWithUserSpecifiedName:userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:", v24, 0, v10, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0D295B0];
    objc_msgSend(MEMORY[0x1E0CB64B0], "identifierWithNumber:", v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMedicationsDemoDataGenerator profile](self, "profile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v27, "createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:additionalProperties:userDomainConceptTypeIdentifier:profile:error:", v39, v26, v28, v29, &v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v41;

    _HKInitializeLogging();
    HKLogMedication();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v43 = self;
      v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_1B815E000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Medication generated from ontology code %{public}@ .", buf, 0x16u);
    }
  }
  else
  {
LABEL_2:
    objc_msgSend(v4, "objectForKey:", CFSTR("Strength"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("Strength"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("Strength"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", CFSTR("isStrengthInMCG"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "BOOLValue"))
          v16 = 3;
        else
          v16 = 4;

        v17 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
    }
    v33 = (void *)MEMORY[0x1E0CB6D20];
    objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("DoseFormCode"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "userDomainConceptPropertyListWithFreeTextMedicationName:freeTextFormCode:freeTextStrengthQuantity:", v34, (int)objc_msgSend(v35, "intValue"), v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_alloc(MEMORY[0x1E0D2C4D8]);
    objc_msgSend(v4, "objectForKey:", CFSTR("NickName"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v36, "initWithOntologyCoding:userSpecifiedName:userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:", 0, v37, 0, v10, v26);

    _HKInitializeLogging();
    HKLogMedication();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v43 = self;
      v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_1B815E000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Medication generated as free text med %{public}@ .", buf, 0x16u);
    }
    v31 = 0;
  }

  return v30;
}

- (BOOL)saveMedications:(id)a3 schedules:(id)a4 logHistory:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29498], "contextForWritingProtectedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__HDMedicationsDemoDataGenerator_saveMedications_schedules_logHistory___block_invoke;
  v21[3] = &unk_1E6E00268;
  v21[4] = self;
  v14 = v8;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v16 = v10;
  v24 = v16;
  v17 = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, &v25, v21, 0);
  v18 = v25;

  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HDMedicationsDemoDataGenerator saveMedications:schedules:logHistory:].cold.1();

  }
  return v17;
}

uint64_t __71__HDMedicationsDemoDataGenerator_saveMedications_schedules_logHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "userDomainConceptManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "updateUserDomainConcepts:error:", *(_QWORD *)(a1 + 40), a3);

  if (!v7)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "insertMedicationSchedules:error:", *(_QWORD *)(a1 + 48), a3)
    && objc_msgSend(*(id *)(a1 + 32), "saveMedicationDoseEvents:error:", *(_QWORD *)(a1 + 56), a3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDidSaveIntialData:", 1);
    v11 = objc_msgSend(*(id *)(a1 + 32), "_saveStateWithError:", a3);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)loadDemoDataObjectsFrom:(id)a3 medications:(id)a4 schedules:(id)a5 logHistory:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  id v38;
  id v39;
  id obj;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v39 = a5;
  v38 = a6;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v13)
  {
    v14 = v13;
    v41 = v11;
    v42 = *(_QWORD *)v44;
    obj = v12;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v44 != v42)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[HDMedicationsDemoDataGenerator medicationWithDetail:](self, "medicationWithDetail:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          _HKInitializeLogging();
          HKLogMedication();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[HDMedicationsDemoDataGenerator loadDemoDataObjectsFrom:medications:schedules:logHistory:].cold.1();

          v35 = 0;
          v12 = obj;
          v34 = obj;
          goto LABEL_27;
        }
        v18 = (void *)v17;
        objc_msgSend(v11, "addObject:", v17);
        objc_msgSend(v18, "semanticIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "objectForKey:", CFSTR("hasSchedule"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
        {
          objc_msgSend(v16, "objectForKey:", CFSTR("isAMSchedule"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDMedicationsDemoDataGenerator dailyScheduleForMedicationIdentifier:isAMSchedule:](self, "dailyScheduleForMedicationIdentifier:isAMSchedule:", v20, objc_msgSend(v23, "BOOLValue"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "addObject:", v24);
          -[HDMedicationsDemoDataGeneratorState setHasScheduledMedications:](self->_state, "setHasScheduledMedications:", 1);

          v11 = v41;
          v25 = 2;
        }
        else
        {
          v25 = 1;
        }
        if (!self->isGeneratingDataOnWatch)
        {
          objc_msgSend(v16, "objectForKey:", CFSTR("shouldGenerateLogHistory"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          v11 = v41;
          if (v27)
          {
            if (v22)
            {
              objc_msgSend(v16, "objectForKey:", CFSTR("isAMSchedule"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "BOOLValue"))
                v29 = 8;
              else
                v29 = 20;

            }
            else
            {
              v29 = 15;
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDMedicationsDemoDataGenerator dayBeforeDate:withHour:](self, "dayBeforeDate:withHour:", v30, v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            -[HDMedicationsDemoDataGeneratorState setLatestLogDate:](self->_state, "setLatestLogDate:", v31);
            -[HDMedicationsDemoDataGenerator doseEventsForMedication:startDateTime:historyDayCount:logOrigin:](self, "doseEventsForMedication:startDateTime:historyDayCount:logOrigin:", v20, v31, 30, v25);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "count"))
            {
              -[HDMedicationsDemoDataGeneratorState setLatestLogDate:](self->_state, "setLatestLogDate:", v31);
              -[HDMedicationsDemoDataGeneratorState setLatestTakenLogDate:](self->_state, "setLatestTakenLogDate:", v31);
            }
            objc_msgSend(v38, "addObjectsFromArray:", v32);

          }
        }

      }
      v12 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v14)
        continue;
      break;
    }
  }

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6800]), "initWithListType:listName:", 2, CFSTR("Active Medications"));
  objc_msgSend(v33, "listByAddingUserDomainConcepts:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", v34);
  v35 = 1;
LABEL_27:

  return v35;
}

- (void)generateIntitialDemoDataIfRequired
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  HDMedicationsDemoDataGenerator *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[HDMedicationsDemoDataGeneratorState didSaveIntialData](self->_state, "didSaveIntialData"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", self->_demoDataFileName, CFSTR("json"));
    v3 = objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    HKLogMedication();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = (uint64_t)v3;
      _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateDemoData JSON path %{public}@", (uint8_t *)&v20, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !objc_msgSend(v7, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = (uint64_t)v3;
        _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not decode JSON file %{public}@", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_21;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = (uint64_t)v8;
      _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateDemoData medicationDetails from JSON %{public}@", (uint8_t *)&v20, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[HDMedicationsDemoDataGenerator loadDemoDataObjectsFrom:medications:schedules:logHistory:](self, "loadDemoDataObjectsFrom:medications:schedules:logHistory:", v8, v10, v11, v12))
    {
      if (!-[HDMedicationsDemoDataGenerator saveMedications:schedules:logHistory:](self, "saveMedications:schedules:logHistory:", v10, v11, v12))
      {
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      _HKInitializeLogging();
      HKLogMedication();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[NSObject count](v10, "count");
        v15 = objc_msgSend(v11, "count");
        v16 = objc_msgSend(v12, "count");
        v20 = 138544130;
        v21 = self;
        v22 = 2048;
        v23 = v14;
        v24 = 2048;
        v25 = v15;
        v26 = 2048;
        v27 = v16;
        v17 = "[%{public}@] Complete generateDemoData UDC Count %lu schdule count %lu logHistory count %lu";
        v18 = v13;
        v19 = 42;
LABEL_18:
        _os_log_impl(&dword_1B815E000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = (uint64_t)v8;
        v17 = "[%{public}@] Could not create objects from Medication details %{public}@";
        v18 = v13;
        v19 = 22;
        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = self;
    _os_log_impl(&dword_1B815E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initial Medications Demo Data is already setup.", (uint8_t *)&v20, 0xCu);
  }
LABEL_22:

}

- (BOOL)setupOntologyContentIfRequired
{
  char v3;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  HDMedicationsDemoDataGenerator *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->isGeneratingDataOnWatch
    && objc_msgSend(MEMORY[0x1E0D2C448], "supportsOntologyBackedMedications")
    && !-[HDMedicationsDemoDataGeneratorState didSetupOntologyData](self->_state, "didSetupOntologyData"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("MedsDemoData-MercuryZipTSV-002-27000024"), CFSTR("zip"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ontologyUpdateCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB5708];
    v11 = *MEMORY[0x1E0CB5750];
    v18 = 0;
    v3 = objc_msgSend(v9, "updateOntologyWithShardIdentifier:schemaType:schemaVersion:localShardURL:shardVersion:error:", v10, v11, HKCurrentSchemaVersionForShardIdentifier(), v6, 27000024, &v18);
    v12 = v18;

    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v3 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = self;
        _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully updated ontology shard.", buf, 0xCu);
      }

      -[HDMedicationsDemoDataGeneratorState setDidSetupOntologyData:](self->_state, "setDidSetupOntologyData:", 1);
      v17 = v12;
      v15 = -[HDMedicationsDemoDataGenerator _saveStateWithError:](self, "_saveStateWithError:", &v17);
      v16 = v17;

      if (v15)
        goto LABEL_16;
      _HKInitializeLogging();
      HKLogMedication();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[HDMedicationsDemoDataGenerator setupOntologyContentIfRequired].cold.1();
      v12 = v16;
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[HDMedicationsDemoDataGenerator setupOntologyContentIfRequired].cold.2();
    }

    v16 = v12;
LABEL_16:

    return v3;
  }
  return 1;
}

- (id)_scheduleItemsForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  HDMedicationsDemoDataGenerator *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HDMedicationScheduleItemPredicateForScheduledDateTime(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke;
  v17[3] = &unk_1E6E00240;
  v9 = v5;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, &v20, v17);
  v12 = v20;

  if (v12)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2114;
      v24 = v4;
      v25 = 2114;
      v26 = v12;
      _os_log_error_impl(&dword_1B815E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Could not read schedule items for %{public}@ Error: %{public}@", buf, 0x20u);
    }

  }
  if (v11)
    v14 = v10;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

BOOL __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke_2;
  v8[3] = &unk_1E6E00290;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", v5, 0, a2, a3, v8);

  return v6;
}

uint64_t __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)doseEventsForScheduleItems:(id)a3 withStatus:(int64_t)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v27;
  void *v29;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v5);
        objc_msgSend(v6, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "scheduledDateTime");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v24 = v5;
        if (a4 == 4)
        {
          objc_msgSend(v7, "dateByAddingTimeInterval:", 300.0);
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v6, "doses");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v25);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v14, "medicationIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "dose");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "dose");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "scheduledDateTime");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDMedicationsDemoDataGenerator doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:](self, "doseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:", 2, v29, v15, v16, v17, v18, v8, a4);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v19);

            }
            v11 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v11);
        }

        v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

  return v27;
}

- (id)scheduledDoseEventsWithCurrentDate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HDMedicationsDemoDataGenerator dayBeforeDate:withHour:](self, "dayBeforeDate:withHour:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (-[HDMedicationsDemoDataGeneratorState hasScheduledMedications](self->_state, "hasScheduledMedications"))
  {
    -[HDMedicationsDemoDataGeneratorState latestLogDate](self->_state, "latestLogDate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          -[HDMedicationsDemoDataGeneratorState latestLogDate](self->_state, "latestLogDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8 >= v4))
    {
      v5 = 0;
    }
    else
    {
      -[HDMedicationsDemoDataGeneratorState latestTakenLogDate](self->_state, "latestTakenLogDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HDMedicationsDemoDataGeneratorState latestTakenLogDate](self->_state, "latestTakenLogDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)-[HDMedicationsDemoDataGenerator dayDifferenceFrom:to:](self, "dayDifferenceFrom:to:", v10, v4) <= 7)v11 = 4;
        else
          v11 = 5;

      }
      else
      {
        v11 = 4;
      }

      -[HDMedicationsDemoDataGenerator _scheduleItemsForDate:](self, "_scheduleItemsForDate:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMedicationsDemoDataGenerator doseEventsForScheduleItems:withStatus:](self, "doseEventsForScheduleItems:withStatus:", v12, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDMedicationsDemoDataGeneratorState setLatestLogDate:](self->_state, "setLatestLogDate:", v14);

        if (v11 == 4)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDMedicationsDemoDataGeneratorState setLatestTakenLogDate:](self->_state, "setLatestTakenLogDate:", v16);

        }
      }

    }
  }

  return v5;
}

- (void)generateDemoDataForCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  HDMedicationsDemoDataGenerator *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->isGeneratingDataOnWatch)
  {
    -[HDMedicationsDemoDataGenerator scheduledDoseEventsWithCurrentDate:](self, "scheduledDoseEventsWithCurrentDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29498], "contextForWritingProtectedData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__HDMedicationsDemoDataGenerator_generateDemoDataForCurrentDate___block_invoke;
      v14[3] = &unk_1E6E00240;
      v14[4] = self;
      v15 = v6;
      v10 = objc_msgSend(v8, "performTransactionWithContext:error:block:inaccessibilityHandler:", v9, &v16, v14, 0);
      v11 = v16;

      _HKInitializeLogging();
      HKLogMedication();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v10 & 1) != 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v18 = self;
          v19 = 2114;
          v20 = v4;
          _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, " [%{public}@] Completed dose events generation for current date %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v18 = self;
        v19 = 2114;
        v20 = v4;
        v21 = 2114;
        v22 = v11;
        _os_log_error_impl(&dword_1B815E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Could not Demodata for Date  %{public}@ Error: %{public}@", buf, 0x20u);
      }

    }
  }

}

uint64_t __65__HDMedicationsDemoDataGenerator_generateDemoDataForCurrentDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "saveMedicationDoseEvents:error:", *(_QWORD *)(a1 + 40), a3);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_saveStateWithError:", a3);
  return result;
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  HDMedicationsDemoDataGenerator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, " [%{public}@] setDemoDataGenerationContext", (uint8_t *)&v7, 0xCu);
  }

  objc_storeWeak((id *)&self->_profile, v5);
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  NSObject *v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  HDMedicationsDemoDataGenerator *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v22 = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = WeakRetained;
    _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateFirstRunObjectsForDemoPerson _profile %{public}@", (uint8_t *)&v22, 0x16u);

  }
  v8 = objc_loadWeakRetained((id *)&self->_profile);

  if (v8)
  {
    -[HDMedicationsDemoDataGenerator restoreState](self, "restoreState");
    if (-[HDMedicationsDemoDataGenerator setupOntologyContentIfRequired](self, "setupOntologyContentIfRequired"))
    {
      -[HDMedicationsDemoDataGenerator generateIntitialDemoDataIfRequired](self, "generateIntitialDemoDataIfRequired");
      return;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationsDemoDataGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:].cold.2((uint64_t)self, v9, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationsDemoDataGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a6;
  -[HDMedicationsDemoDataGenerator restoreState](self, "restoreState");
  if (-[HDMedicationsDemoDataGeneratorState didSaveIntialData](self->_state, "didSaveIntialData"))
  {
    -[HDMedicationsDemoDataGenerator generateDemoDataForCurrentDate:](self, "generateDemoDataForCurrentDate:", v8);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationsDemoDataGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (int64_t)dayDifferenceFrom:(id)a3 to:(id)a4
{
  NSCalendar *currentCalendar;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  currentCalendar = self->_currentCalendar;
  v7 = a3;
  -[NSCalendar components:fromDate:](currentCalendar, "components:fromDate:", 16, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](self->_currentCalendar, "components:fromDate:", 16, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "day");
  v11 = v10 - objc_msgSend(v9, "day");

  return v11;
}

- (id)dayBeforeDate:(id)a3 withHour:(int64_t)a4
{
  void *v6;
  void *v7;

  -[NSCalendar components:fromDate:](self->_currentCalendar, "components:fromDate:", 28, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - 1);
  objc_msgSend(v6, "setHour:", a4);
  -[NSCalendar dateFromComponents:](self->_currentCalendar, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_demoDataFileName, 0);
}

- (void)saveMedications:schedules:logHistory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: Could not save Medication Initial Date Error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)loadDemoDataObjectsFrom:medications:schedules:logHistory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not create medication with detail : %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)setupOntologyContentIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not update ontology shard Error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)generateFirstRunObjectsForDemoPerson:(uint64_t)a3 firstDate:(uint64_t)a4 objectCollection:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B815E000, a2, a3, "[%{public}@]: Profile not set. Can't proceed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)generateFirstRunObjectsForDemoPerson:(uint64_t)a3 firstDate:(uint64_t)a4 objectCollection:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B815E000, a2, a3, "[%{public}@]: Ontology content is required. Can't proceed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)generateObjectsForDemoPerson:(uint64_t)a3 fromTime:(uint64_t)a4 toTime:(uint64_t)a5 currentDate:(uint64_t)a6 objectCollection:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B815E000, a2, a3, "[%{public}@] Does not have initial setup for Medications Demo data. So skipping Dose event sample generation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
