@implementation HKMedicationSchedule(HDCodingSupport)

+ (id)hd_medicationSchedulesFromCodables:()HDCodingSupport profile:ignoreDuplicates:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)MEMORY[0x1E0D295A8];
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__HKMedicationSchedule_HDCodingSupport__hd_medicationSchedulesFromCodables_profile_ignoreDuplicates___block_invoke;
  v16[3] = &unk_1E6DFFFF8;
  v11 = v7;
  v17 = v11;
  v20 = a5;
  v12 = v8;
  v18 = v12;
  v19 = &v22;
  objc_msgSend(v9, "performWriteTransactionWithHealthDatabase:error:block:", v10, &v21, v16);
  v13 = v21;

  v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

+ (id)hd_medicationScheduleFromCodable:()HDCodingSupport
{
  id v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "endDateTime");
  if (fabs(v5) < 2.22044605e-16)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "endDateTime");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "compatibilityVersionRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "compatibilityVersionRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v9, "minimum");
    objc_msgSend(v4, "compatibilityVersionRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v10, "origin");

  }
  else
  {
    v42 = 0;
    v43 = 0;
  }
  objc_msgSend(v4, "medicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {

    v11 = 0;
  }
  v44 = v11;
  v45 = (void *)v7;
  if (objc_msgSend(v4, "hasScheduleType"))
  {
    v12 = objc_msgSend(v4, "scheduleType");
  }
  else
  {
    objc_msgSend(v4, "frequencyType");
    v12 = (uint64_t)v13;
  }
  v14 = objc_alloc(MEMORY[0x1E0D2C480]);
  objc_msgSend(v4, "decodedUUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodedMedicationUUID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(v4, "createdTimeZone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeZoneWithName:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "startDateTime");
  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intervalDatas");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = a1;
  +[HKMedicationSchedule _medicationScheduleIntervalDataFromCodable:](a1, v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "displayOptions");
  v20 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(v4, "cycleStartDateComponents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hk_dateComponentsWithCodableDateComponents:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "deleted");
  objc_msgSend(v4, "creationDate");
  v25 = v24;
  objc_msgSend(v4, "note");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = v23;
  v27 = v14;
  v28 = (void *)v15;
  v29 = (void *)objc_msgSend(v27, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v40, v15, v44, v38, v37, v45, v25, v18, v12, v19, v22, v35, v26, v43, v42);

  if (objc_msgSend(v29, "isUnavailable"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v47 = v36;
      v48 = 2114;
      v49 = v29;
      _os_log_impl(&dword_1B815E000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Receiving a schedule that has already been marked as unavailable. %{public}@", buf, 0x16u);
    }

LABEL_23:
    v32 = v29;
    goto LABEL_24;
  }
  if ((objc_msgSend(v29, "isDeleted") & 1) == 0 && !objc_msgSend(v29, "scheduleType"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[HKMedicationSchedule(HDCodingSupport) hd_medicationScheduleFromCodable:].cold.1(v36, (uint64_t)v29, v31);

  }
  if (objc_msgSend(v29, "compatibilityRange") <= 1)
    goto LABEL_23;
  objc_msgSend(v29, "unavailableSchedule");
  v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v33 = v32;

  return v33;
}

- (HDCodableMedicationSchedule)hd_codableMedicationSchedule
{
  HDCodableMedicationSchedule *v2;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HDCodableMedicationScheduleCompatibilityVersionRange *v20;
  uint64_t v21;

  v2 = objc_alloc_init(HDCodableMedicationSchedule);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setUuid:](v2, "setUuid:", v4);

  objc_msgSend(a1, "medicationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dataForUUIDBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setMedicationUUID:](v2, "setMedicationUUID:", v6);

  objc_msgSend(a1, "medicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "medicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationSchedule setMedicationIdentifier:](v2, "setMedicationIdentifier:", v8);

  }
  else
  {
    -[HDCodableMedicationSchedule setMedicationIdentifier:](v2, "setMedicationIdentifier:", &stru_1E6E01EA0);
  }

  objc_msgSend(a1, "startDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  -[HDCodableMedicationSchedule setStartDateTime:](v2, "setStartDateTime:");

  objc_msgSend(a1, "endDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  -[HDCodableMedicationSchedule setEndDateTime:](v2, "setEndDateTime:");

  objc_msgSend(a1, "createdUTCOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setCreatedTimeZone:](v2, "setCreatedTimeZone:", v12);

  -[HDCodableMedicationSchedule setFrequencyType:](v2, "setFrequencyType:", (double)objc_msgSend(a1, "frequencyType"));
  -[HDCodableMedicationSchedule setScheduleType:](v2, "setScheduleType:", objc_msgSend(a1, "scheduleType"));
  objc_msgSend(a1, "cycleStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_codableDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setCycleStartDateComponents:](v2, "setCycleStartDateComponents:", v14);

  objc_msgSend(a1, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setNote:](v2, "setNote:", v15);

  v16 = MEMORY[0x1E0D2C480];
  objc_msgSend(a1, "timeIntervals");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationSchedule _codableArrayForMedicationScheduleIntervalDatas:](v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  -[HDCodableMedicationSchedule setIntervalDatas:](v2, "setIntervalDatas:", v19);

  objc_msgSend(a1, "creationTimestamp");
  -[HDCodableMedicationSchedule setCreationDate:](v2, "setCreationDate:");
  -[HDCodableMedicationSchedule setDeleted:](v2, "setDeleted:", objc_msgSend(a1, "isDeleted"));
  v20 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
  -[HDCodableMedicationScheduleCompatibilityVersionRange setMinimum:](v20, "setMinimum:", objc_msgSend(a1, "compatibilityRange"));
  objc_msgSend(a1, "compatibilityRange");
  -[HDCodableMedicationScheduleCompatibilityVersionRange setOrigin:](v20, "setOrigin:", v21);
  -[HDCodableMedicationSchedule setCompatibilityVersionRange:](v2, "setCompatibilityVersionRange:", v20);

  return v2;
}

+ (void)hd_medicationScheduleFromCodable:()HDCodingSupport .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B815E000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Received unexepcted schedule with type null: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
