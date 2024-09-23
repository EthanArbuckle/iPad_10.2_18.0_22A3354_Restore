@implementation HKMedicationSchedule

- (HKMedicationSchedule)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicationSchedule)initWithUUID:(id)a3 medicationUUID:(id)a4 medicationIdentifier:(id)a5 createdUTCOffset:(id)a6 startDateTime:(id)a7 endDateTime:(id)a8 timeIntervals:(id)a9 scheduleType:(int64_t)a10 displayOptions:(unint64_t)a11 cycleStartDateComponents:(id)a12 deleted:(BOOL)a13 creationTimestamp:(double)a14 note:(id)a15 compatibilityVersionRange:(id)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  objc_super v53;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v30 = a12;
  v31 = a15;
  v53.receiver = self;
  v53.super_class = (Class)HKMedicationSchedule;
  v32 = -[HKMedicationSchedule init](&v53, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v23, "copy");
    v34 = (void *)*((_QWORD *)v32 + 3);
    *((_QWORD *)v32 + 3) = v33;

    v35 = objc_msgSend(v24, "copy");
    v36 = (void *)*((_QWORD *)v32 + 1);
    *((_QWORD *)v32 + 1) = v35;

    v37 = objc_msgSend(v25, "copy");
    v38 = (void *)*((_QWORD *)v32 + 4);
    *((_QWORD *)v32 + 4) = v37;

    v39 = objc_msgSend(v26, "copy");
    v40 = (void *)*((_QWORD *)v32 + 5);
    *((_QWORD *)v32 + 5) = v39;

    v41 = objc_msgSend(v27, "copy");
    v42 = (void *)*((_QWORD *)v32 + 6);
    *((_QWORD *)v32 + 6) = v41;

    v43 = objc_msgSend(v28, "copy");
    v44 = (void *)*((_QWORD *)v32 + 7);
    *((_QWORD *)v32 + 7) = v43;

    v45 = objc_msgSend(v29, "copy");
    v46 = (void *)*((_QWORD *)v32 + 8);
    *((_QWORD *)v32 + 8) = v45;

    if ((unint64_t)a10 > 8)
      v47 = 4;
    else
      v47 = qword_1B77F1968[a10];
    *((_QWORD *)v32 + 9) = v47;
    *((_QWORD *)v32 + 11) = a11;
    v48 = objc_msgSend(v30, "copy");
    v49 = (void *)*((_QWORD *)v32 + 12);
    *((_QWORD *)v32 + 12) = v48;

    v50 = objc_msgSend(v31, "copy");
    v51 = (void *)*((_QWORD *)v32 + 13);
    *((_QWORD *)v32 + 13) = v50;

    *((double *)v32 + 14) = a14;
    v32[16] = a13;
    *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v32 + 120) = a16;
    *((_QWORD *)v32 + 10) = a10;
  }

  return (HKMedicationSchedule *)v32;
}

- (HKMedicationSchedule)initWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 scheduleType:(int64_t)a9 cycleStartDateComponents:(id)a10 note:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  HKMedicationSchedule *v26;
  uint64_t v28;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = HKMedicationScheduleCompatibilityVersionForMedicationScheduleType(a9, (uint64_t)v20);
  LOBYTE(v28) = 0;
  v26 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](self, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v24, 0, v23, v22, v21, v20, CFAbsoluteTimeGetCurrent(), v19, a9, 0, v18, v28, v17, v25, 1);

  return v26;
}

- (BOOL)isUnavailable
{
  return self->_compatibilityRange.minimum > self->_compatibilityRange.origin;
}

- (id)copyByRemovingEndDateAndSetStartDateToToday
{
  HKMedicationSchedule *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  HKMedicationSchedule *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = [HKMedicationSchedule alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule medicationUUID](self, "medicationUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule medicationIdentifier](self, "medicationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule createdUTCOffset](self, "createdUTCOffset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule timeIntervals](self, "timeIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicationSchedule scheduleType](self, "scheduleType");
  v8 = -[HKMedicationSchedule displayOptions](self, "displayOptions");
  -[HKMedicationSchedule cycleStartDate](self, "cycleStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKMedicationSchedule isDeleted](self, "isDeleted");
  -[HKMedicationSchedule creationTimestamp](self, "creationTimestamp");
  v12 = v11;
  -[HKMedicationSchedule note](self, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKMedicationSchedule compatibilityRange](self, "compatibilityRange");
  LOBYTE(v17) = v10;
  v15 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v3, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v23, v22, v20, v19, v5, 0, v12, v6, v7, v8, v9, v17, v13, v18, v14);

  return v15;
}

- (id)copyScheduleForMedication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  HKMedicationSchedule *v15;
  HKMedicationSchedule *v17;

  v4 = a3;
  v17 = [HKMedicationSchedule alloc];
  -[HKMedicationSchedule UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule createdUTCOffset](self, "createdUTCOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule startDateTime](self, "startDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule endDateTime](self, "endDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule timeIntervals](self, "timeIntervals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKMedicationSchedule scheduleType](self, "scheduleType");
  -[HKMedicationSchedule cycleStartDate](self, "cycleStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:](v17, "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v5, v7, v8, v9, v10, v11, v12, v13, v14);

  return v15;
}

- (id)_copyByReplacingCompatibilityVersionRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  HKMedicationSchedule *v16;
  uint64_t v18;
  void *v19;
  int64_t var1;
  int64_t var0;
  void *v22;
  HKMedicationSchedule *v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v23 = [HKMedicationSchedule alloc];
  -[HKMedicationSchedule UUID](self, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule medicationUUID](self, "medicationUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule medicationIdentifier](self, "medicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule createdUTCOffset](self, "createdUTCOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule startDateTime](self, "startDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule endDateTime](self, "endDateTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule timeIntervals](self, "timeIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKMedicationSchedule scheduleType](self, "scheduleType");
  v10 = -[HKMedicationSchedule displayOptions](self, "displayOptions");
  -[HKMedicationSchedule cycleStartDate](self, "cycleStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKMedicationSchedule isDeleted](self, "isDeleted");
  -[HKMedicationSchedule creationTimestamp](self, "creationTimestamp");
  v14 = v13;
  -[HKMedicationSchedule note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = v12;
  v16 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v23, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v22, v19, v4, v5, v6, v7, v14, v8, v9, v10, v11, v18, v15, var0, var1);

  return v16;
}

- (void)updateDisplayOptions:(unint64_t)a3
{
  self->_displayOptions = a3;
}

- (void)_setMedicationUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *medicationUUID;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  medicationUUID = self->_medicationUUID;
  self->_medicationUUID = v4;

}

- (id)deletedSchedule
{
  NSUUID *UUID;
  NSUUID *medicationUUID;
  double Current;
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  HKMedicationSchedule *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  UUID = self->_UUID;
  medicationUUID = self->_medicationUUID;
  Current = CFAbsoluteTimeGetCurrent();
  +[HKMedicationSchedule _deletedScheduleWithUUID:medicationUUID:creationTimestamp:](Current, (uint64_t)HKMedicationSchedule, UUID, medicationUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = objc_opt_class();
    v11 = 2114;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1B77D4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting: %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

+ (HKMedicationSchedule)_deletedScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 creationTimestamp:
{
  id v6;
  id v7;
  HKMedicationSchedule *v8;
  void *v9;
  void *v10;
  void *v11;
  HKMedicationSchedule *v12;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  objc_opt_self();
  v8 = [HKMedicationSchedule alloc];
  v9 = v6;
  if (!v6)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 1;
  v12 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v8, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v7, v9, 0, v10, v11, 0, a1, MEMORY[0x1E0C9AA60], 0, 0, 0, v14, 0, 0, 1);

  if (!v6)
  return v12;
}

- (id)unavailableSchedule
{
  void *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  HKMedicationSchedule *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[HKMedicationSchedule _unavailableScheduleWithUUID:medicationUUID:medicationIdentifier:creationTimestamp:compatibilityRange:](self->_creationTimestamp, (uint64_t)HKMedicationSchedule, self->_UUID, self->_medicationUUID, self->_medicationIdentifier, self->_compatibilityRange.minimum);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543874;
    v7 = objc_opt_class();
    v8 = 2114;
    v9 = self;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1B77D4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] unavailable-ing: %{public}@ -> %{public}@", (uint8_t *)&v6, 0x20u);
  }

  return v3;
}

+ (HKMedicationSchedule)_unavailableScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 medicationIdentifier:(void *)a5 creationTimestamp:(uint64_t)a6 compatibilityRange:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  HKMedicationSchedule *v14;
  void *v15;
  void *v16;
  HKMedicationSchedule *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_opt_self();
  if (a6 <= 1)
  {
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__unavailableScheduleWithUUID_medicationUUID_medicationIdentifier_creationTimestamp_compatibilityRange_, v19, CFSTR("HKMedicationSchedule.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compatibilityRange.minimum > HKMedicationScheduleCompatibilityVersionCurrent"));

  }
  v14 = [HKMedicationSchedule alloc];
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v17 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v14, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v12, v11, v10, v15, v16, 0, a1, MEMORY[0x1E0C9AA60], 0, 0, 0, v21, 0, a6, 1);

  return v17;
}

- (id)dayInCycleFor:(id)a3 calendar:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKMedicationDayInCycleResult *v13;
  NSObject *v14;

  v5 = -[HKMedicationSchedule _daysFromCycleStartForCalendar:toDate:](self, a4, a3);
  if (v5 < 0 || (v6 = v5, -[HKMedicationSchedule frequencyType](self, "frequencyType") != 1))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HKMedicationSchedule dayInCycleFor:calendar:].cold.1();

    v13 = 0;
  }
  else
  {
    -[HKMedicationSchedule _getIntervalLengths](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = -1;
    do
    {
      v9 = (v9 + 1) % objc_msgSend(v7, "count");
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 += objc_msgSend(v10, "integerValue");

    }
    while (v8 <= v6);
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6 - v8 + objc_msgSend(v11, "integerValue") + 1;

    v13 = -[HKMedicationDayInCycleResult initWithDaysIntoCycle:isInPauseInterval:]([HKMedicationDayInCycleResult alloc], "initWithDaysIntoCycle:isInPauseInterval:", v12, v9 == objc_msgSend(v7, "count") - 1);
  }
  return v13;
}

- (uint64_t)_daysFromCycleStartForCalendar:(void *)a3 toDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a2;
  if (a1)
  {
    v6 = a3;
    objc_msgSend(a1, "startDateTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 124, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cycleStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(a1, "cycleStartDate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8;
    }
    v11 = v10;

    objc_msgSend(v5, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v12, v6, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "day");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_getIntervalLengths
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];

  v1 = a1;
  if (a1)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0x8000000000000000;
    objc_msgSend(a1, "timeIntervals");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__HKMedicationSchedule__getIntervalLengths__block_invoke;
    v13[3] = &unk_1E6CD54E0;
    v13[4] = v14;
    objc_msgSend(v2, "hk_map:", v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v1, "scheduleType");
    v6 = v3;
    if (v5 == 8)
    {
      v7 = objc_msgSend(v3, "count");
      v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v9 = v7 - 1;
      if (v7 - 1 < 0)
        v9 = v7;
      v10 = (void *)objc_msgSend(v8, "initWithInt:", (7 * (v9 >> 1)));
      objc_msgSend(v4, "addObject:", v10);

      objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      v6 = v4;
    }
    v1 = v6;

    _Block_object_dispose(v14, 8);
  }
  return v1;
}

id __43__HKMedicationSchedule__getIntervalLengths__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "cycleIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "integerValue") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v6 = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "integerValue");
    objc_msgSend(v3, "cycleIntervalDays");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationSchedule *v4;
  char v5;

  v4 = (HKMedicationSchedule *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSUUID isEqual:](v4->_UUID, "isEqual:", self->_UUID);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isIdenticalToMedicationSchedule:(id)a3
{
  _QWORD *v4;
  NSUUID *UUID;
  NSUUID *v6;
  NSString *medicationIdentifier;
  NSString *v8;
  NSTimeZone *createdUTCOffset;
  NSTimeZone *v10;
  NSDate *startDateTime;
  NSDate *v12;
  NSDate *endDateTime;
  NSDate *v14;
  NSArray *timeIntervals;
  NSArray *v16;
  NSDateComponents *cycleStartDate;
  NSDateComponents *v18;
  NSString *note;
  NSString *v20;
  char v21;

  v4 = a3;
  if (!v4)
    goto LABEL_30;
  if (!-[HKMedicationSchedule isEqual:](self, "isEqual:", v4))
    goto LABEL_30;
  UUID = self->_UUID;
  v6 = (NSUUID *)v4[3];
  if (UUID != v6 && (!v6 || !-[NSUUID isEqual:](UUID, "isEqual:")))
    goto LABEL_30;
  medicationIdentifier = self->_medicationIdentifier;
  v8 = (NSString *)v4[4];
  if (medicationIdentifier != v8 && (!v8 || !-[NSString isEqual:](medicationIdentifier, "isEqual:")))
    goto LABEL_30;
  createdUTCOffset = self->_createdUTCOffset;
  v10 = (NSTimeZone *)v4[5];
  if (createdUTCOffset != v10 && (!v10 || !-[NSTimeZone isEqual:](createdUTCOffset, "isEqual:")))
    goto LABEL_30;
  startDateTime = self->_startDateTime;
  v12 = (NSDate *)v4[6];
  if (startDateTime != v12 && (!v12 || !-[NSDate isEqual:](startDateTime, "isEqual:")))
    goto LABEL_30;
  endDateTime = self->_endDateTime;
  v14 = (NSDate *)v4[7];
  if (endDateTime != v14 && (!v14 || !-[NSDate isEqual:](endDateTime, "isEqual:")))
    goto LABEL_30;
  timeIntervals = self->_timeIntervals;
  v16 = (NSArray *)v4[8];
  if (timeIntervals != v16 && (!v16 || !-[NSArray isEqualToArray:](timeIntervals, "isEqualToArray:")))
    goto LABEL_30;
  if (self->_frequencyType != v4[9])
    goto LABEL_30;
  if (self->_scheduleType != v4[10])
    goto LABEL_30;
  if (self->_displayOptions != v4[11])
    goto LABEL_30;
  cycleStartDate = self->_cycleStartDate;
  v18 = (NSDateComponents *)v4[12];
  if (cycleStartDate != v18 && (!v18 || !-[NSDateComponents isEqual:](cycleStartDate, "isEqual:")))
    goto LABEL_30;
  note = self->_note;
  v20 = (NSString *)v4[13];
  if (note == v20)
  {
    v21 = 1;
    goto LABEL_31;
  }
  if (v20)
    v21 = -[NSString isEqual:](note, "isEqual:");
  else
LABEL_30:
    v21 = 0;
LABEL_31:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicationUUID, CFSTR("medicationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicationIdentifier, CFSTR("medicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdUTCOffset, CFSTR("createdUTCOffset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDateTime, CFSTR("startDateTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDateTime, CFSTR("endDateTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeIntervals, CFSTR("timeIntervals"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frequencyType, CFSTR("frequencyType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleStartDate, CFSTR("cycleStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_note, CFSTR("note"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("creationTimestamp"), self->_creationTimestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_compatibilityRange.minimum, CFSTR("compatibilityVersionMinimum"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_compatibilityRange.origin, CFSTR("compatibilityVersionOrigin"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scheduleType, CFSTR("scheduleType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayOptions, CFSTR("displayOptions"));

}

- (HKMedicationSchedule)initWithCoder:(id)a3
{
  id v4;
  HKMedicationSchedule *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSUUID *medicationUUID;
  uint64_t v10;
  NSString *medicationIdentifier;
  uint64_t v12;
  NSTimeZone *createdUTCOffset;
  uint64_t v14;
  NSDate *startDateTime;
  uint64_t v16;
  NSDate *endDateTime;
  void *v18;
  uint64_t v19;
  NSArray *timeIntervals;
  uint64_t v21;
  NSDateComponents *cycleStartDate;
  uint64_t v23;
  NSString *note;
  double v25;
  uint64_t frequencyType;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HKMedicationSchedule;
  v5 = -[HKMedicationSchedule init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicationUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    medicationUUID = v5->_medicationUUID;
    v5->_medicationUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdUTCOffset"));
    v12 = objc_claimAutoreleasedReturnValue();
    createdUTCOffset = v5->_createdUTCOffset;
    v5->_createdUTCOffset = (NSTimeZone *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDateTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    startDateTime = v5->_startDateTime;
    v5->_startDateTime = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDateTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    endDateTime = v5->_endDateTime;
    v5->_endDateTime = (NSDate *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("timeIntervals"));
    v19 = objc_claimAutoreleasedReturnValue();
    timeIntervals = v5->_timeIntervals;
    v5->_timeIntervals = (NSArray *)v19;

    v5->_frequencyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequencyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cycleStartDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    cycleStartDate = v5->_cycleStartDate;
    v5->_cycleStartDate = (NSDateComponents *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("note"));
    v23 = objc_claimAutoreleasedReturnValue();
    note = v5->_note;
    v5->_note = (NSString *)v23;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("creationTimestamp"));
    v5->_creationTimestamp = v25;
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("scheduleType")))
      frequencyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduleType"));
    else
      frequencyType = v5->_frequencyType;
    v5->_scheduleType = frequencyType;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("displayOptions")))
      v27 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayOptions"));
    else
      v27 = 0;
    v5->_displayOptions = v27;
    v28 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compatibilityVersionMinimum"));
    v29 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compatibilityVersionOrigin"));
    v5->_compatibilityRange.minimum = v28;
    v5->_compatibilityRange.origin = v29;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSInteger v6;
  NSDateComponents *cycleStartDate;
  unint64_t displayOptions;
  double creationTimestamp;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_opt_class();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_medicationUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSTimeZone secondsFromGMT](self->_createdUTCOffset, "secondsFromGMT") / 3600;
  v16 = *(_OWORD *)&self->_startDateTime;
  v15 = *(_OWORD *)&self->_frequencyType;
  displayOptions = self->_displayOptions;
  cycleStartDate = self->_cycleStartDate;
  creationTimestamp = self->_creationTimestamp;
  if (self->_deleted)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  HKMedicationScheduleCompatibilityRangeToString(self->_compatibilityRange.minimum, self->_compatibilityRange.origin);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationSchedule _timeIntervalsString]((id *)&self->super.isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>: UUID: %@, medUUID: %@, medID: %@, timezoneOffset: %ld, startDateTime: %@, endDateTime: %@, frequencyType: %i, scheduleType: %i, displayOptions: %i, cycleStartDate: %@ creationTimestamp: %f, deleted: %@, compatibilityVersionRange: %@, timeIntervals:\n%@"), v17, self, v3, v4, v5, v6, v16, v15, displayOptions, cycleStartDate, *(_QWORD *)&creationTimestamp, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_timeIntervalsString
{
  id *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = v1[8];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@\n"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (NSTimeZone)createdUTCOffset
{
  return self->_createdUTCOffset;
}

- (NSDate)startDateTime
{
  return self->_startDateTime;
}

- (NSDate)endDateTime
{
  return self->_endDateTime;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (int64_t)frequencyType
{
  return self->_frequencyType;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (unint64_t)displayOptions
{
  return self->_displayOptions;
}

- (NSDateComponents)cycleStartDate
{
  return self->_cycleStartDate;
}

- (NSString)note
{
  return self->_note;
}

- (NSUUID)medicationUUID
{
  return self->_medicationUUID;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)compatibilityRange
{
  int64_t origin;
  int64_t minimum;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  origin = self->_compatibilityRange.origin;
  minimum = self->_compatibilityRange.minimum;
  result.var1 = origin;
  result.var0 = minimum;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_cycleStartDate, 0);
  objc_storeStrong((id *)&self->_timeIntervals, 0);
  objc_storeStrong((id *)&self->_endDateTime, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_createdUTCOffset, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_medicationUUID, 0);
}

+ (id)dailyScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKMedicationSchedule *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  +[HKMedicationSchedule _validateDailyScheduleTimeIntervals:]((uint64_t)a1, v17);
  v23 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:]([HKMedicationSchedule alloc], "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v22, v21, v20, v19, v18, v17, 2, 0, v16);

  return v23;
}

+ (void)_validateDailyScheduleTimeIntervals:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertCycleIndexIsNilForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertCycleIntervalDaysIsNilForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertDoseGreaterThanZeroForInterval:scheduleType:](v3, v9, 2uLL);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (id)everyXDaysScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKMedicationSchedule *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  +[HKMedicationSchedule _validateEveryXDaysScheduleTimeIntervals:]((uint64_t)a1, v19);
  v25 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:]([HKMedicationSchedule alloc], "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v24, v23, v22, v21, v20, v19, 1, v18, v17);

  return v25;
}

+ (void)_validateEveryXDaysScheduleTimeIntervals:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v50;
    v7 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v3, v9, 1uLL);
        objc_msgSend(v9, "cycleIndex");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "integerValue"))
        {
          objc_msgSend(v9, "cycleIndex");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "integerValue");

          if (v12 == 1)
            goto LABEL_10;
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = objc_opt_class();
          HKStringFromMedicationScheduleType(1uLL);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cycleIndex");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "raise:format:", v7, CFSTR("%@ with type %@ cannot have an interval with cycle index %ld"), v14, v10, objc_msgSend(v15, "longValue"));

        }
LABEL_10:
        objc_msgSend(v9, "cycleIndex");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (!v17)
        {
          objc_msgSend(v9, "dose");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          v20 = v19;

          if (v20 <= 0.0)
          {
            v21 = (void *)MEMORY[0x1E0C99DA0];
            v22 = objc_opt_class();
            HKStringFromMedicationScheduleType(1uLL);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dose");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            objc_msgSend(v21, "raise:format:", v7, CFSTR("%@ with type %@ cannot have an interval for the on phase with dose %f <= 0"), v22, v23, v25);

          }
          objc_msgSend(v9, "cycleIntervalDays");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "integerValue");

          if (v27 != 1)
          {
            v28 = (void *)MEMORY[0x1E0C99DA0];
            v29 = objc_opt_class();
            HKStringFromMedicationScheduleType(1uLL);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "cycleIntervalDays");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "raise:format:", v7, CFSTR("%@ with type %@ cannot have an interval for the on phase with cycleIntervalDays %ld != 1"), v29, v30, objc_msgSend(v31, "longValue"));

          }
        }
        objc_msgSend(v9, "cycleIndex");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "integerValue");

        if (v33 == 1)
        {
          objc_msgSend(v9, "dose");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "doubleValue");
          v36 = v35;

          if (v36 != 0.0)
          {
            v37 = (void *)MEMORY[0x1E0C99DA0];
            v38 = objc_opt_class();
            HKStringFromMedicationScheduleType(1uLL);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dose");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            objc_msgSend(v37, "raise:format:", v7, CFSTR("%@ with type %@ cannot have an interval for the off phase with dose %f != 0"), v38, v39, v41);

          }
          objc_msgSend(v9, "cycleIntervalDays");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "integerValue");

          if (v43 <= 0)
          {
            v44 = (void *)MEMORY[0x1E0C99DA0];
            v45 = objc_opt_class();
            HKStringFromMedicationScheduleType(1uLL);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "cycleIntervalDays");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "raise:format:", v7, CFSTR("%@ with type %@ cannot have an interval for the off phase with cycleIntervalDays %ld < 1"), v45, v46, objc_msgSend(v47, "longValue"));

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v5);
  }

}

+ (id)daysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKMedicationSchedule *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  +[HKMedicationSchedule _validateDaysOfWeekScheduleTimeIntervals:scheduleType:]((uint64_t)a1, v17, 3uLL);
  v23 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:]([HKMedicationSchedule alloc], "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v22, v21, v20, v19, v18, v17, 3, 0, v16);

  return v23;
}

+ (void)_validateDaysOfWeekScheduleTimeIntervals:(unint64_t)a3 scheduleType:
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_opt_self();
  if (a3 != 3 && a3 != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__validateDaysOfWeekScheduleTimeIntervals_scheduleType_, v5, CFSTR("HKMedicationSchedule+Convenience.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleType == HKMedicationScheduleTypeDaysOfWeek || scheduleType == HKMedicationScheduleTypeDifferentDosesDaysOfWeek"));

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v23 = *(_QWORD *)v25;
    v21 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!objc_msgSend(v11, "daysOfWeek"))
        {
          v12 = (void *)MEMORY[0x1E0C99DA0];
          v13 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HKStringFromReminderWeekdayOptions(objc_msgSend(v11, "daysOfWeek"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "raise:format:", v21, CFSTR("%@ with type %@ cannot have an interval with daysOfWeek %@"), v13, v14, v15);

        }
        +[HKMedicationSchedule _assertCycleIndexIsNilForInterval:scheduleType:](v5, v11, a3);
        +[HKMedicationSchedule _assertCycleIntervalDaysIsNilForInterval:scheduleType:](v5, v11, a3);
        +[HKMedicationSchedule _assertDoseGreaterThanZeroForInterval:scheduleType:](v5, v11, a3);
        if (v9)
        {
          if (a3 == 3 && objc_msgSend(v11, "daysOfWeek") != v9)
          {
            v16 = (void *)MEMORY[0x1E0C99DA0];
            v17 = objc_opt_class();
            HKStringFromMedicationScheduleType(3uLL);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            HKStringFromReminderWeekdayOptions(objc_msgSend(v11, "daysOfWeek"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            HKStringFromReminderWeekdayOptions(v9);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "raise:format:", v21, CFSTR("%@ with type %@ cannot have an interval for days %@. All intervals must be for days %@"), v17, v18, v19, v20);

          }
        }
        else
        {
          v9 = objc_msgSend(v11, "daysOfWeek");
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

+ (id)differentDosesDaysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKMedicationSchedule *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  +[HKMedicationSchedule _validateDaysOfWeekScheduleTimeIntervals:scheduleType:]((uint64_t)a1, v17, 5uLL);
  v23 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:]([HKMedicationSchedule alloc], "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v22, v21, v20, v19, v18, v17, 5, 0, v16);

  return v23;
}

+ (id)activeXDaysPauseYDaysWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  return +[HKMedicationSchedule _activeXDaysPauseYDaysWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:cycleStartDateComponents:note:scheduleType:]((uint64_t)a1, a3, a4, a5, a6, a7, a8, a9, a10, 7uLL);
}

+ (HKMedicationSchedule)_activeXDaysPauseYDaysWithUUID:(void *)a3 medicationIdentifier:(void *)a4 createdUTCOffset:(void *)a5 startDateTime:(void *)a6 endDateTime:(void *)a7 timeIntervals:(void *)a8 cycleStartDateComponents:(void *)a9 note:(unint64_t)a10 scheduleType:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  HKMedicationSchedule *v26;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = a2;
  v25 = objc_opt_self();
  +[HKMedicationSchedule _validateActiveXPauseYScheduleTimeIntervals:scheduleType:](v25, v19, a10);
  v26 = -[HKMedicationSchedule initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:]([HKMedicationSchedule alloc], "initWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:cycleStartDateComponents:note:", v24, v23, v22, v21, v20, v19, a10, v18, v17);

  return v26;
}

+ (id)activeXWeeksPauseYWeeksWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  +[HKMedicationSchedule _validateActiveXWeeksPauseYWeeksTimeIntervals:scheduleType:]((uint64_t)a1, v19, 8uLL);
  +[HKMedicationSchedule _activeXDaysPauseYDaysWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:cycleStartDateComponents:note:scheduleType:]((uint64_t)a1, v24, v23, v22, v21, v20, v19, v18, v17, 8uLL);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)_validateActiveXWeeksPauseYWeeksTimeIntervals:(unint64_t)a3 scheduleType:
{
  id v3;
  unint64_t v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id obj;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_self();
  v4 = objc_msgSend(v3, "count");
  v5 = (uint64_t *)MEMORY[0x1E0C99778];
  if (v4 <= 2)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_opt_class();
    HKStringFromMedicationScheduleType(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ with type %@ must have at least 3 timeInterval objects for 1 day active, 6 days paused, and the week pause object."), v8, v9);

  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cycleIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (objc_msgSend(v3, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cycleIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (v16 > v12)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cycleIndex");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v18, "integerValue");

      }
      ++v13;
    }
    while (objc_msgSend(v3, "count") > v13);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v19)
  {
    v20 = v19;
    v60 = *(_QWORD *)v63;
    v21 = *v5;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v63 != v60)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v23, "cycleIndex");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "integerValue") & 0x8000000000000001) == 1)
        {
          objc_msgSend(v23, "dose");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          if (v27 == 0.0)
            goto LABEL_17;
          v28 = (void *)MEMORY[0x1E0C99DA0];
          v29 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cycleIndex");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "raise:format:", v21, CFSTR("%@ with type %@ cannot have a zero value dose in an odd numbered interval. It must be a pause %ld"), v29, v24, objc_msgSend(v30, "integerValue"));

        }
LABEL_17:
        objc_msgSend(v23, "cycleIndex");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "integerValue") & 0x8000000000000001) == 1)
        {
          objc_msgSend(v23, "cycleIntervalDays");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "integerValue");

          if (v33 == 6)
            goto LABEL_21;
          v34 = (void *)MEMORY[0x1E0C99DA0];
          v35 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cycleIndex");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "raise:format:", v21, CFSTR("%@ with type %@ must have odd numbered intervals of length 6 days. %ld"), v35, v31, objc_msgSend(v36, "integerValue"));

        }
LABEL_21:
        objc_msgSend(v23, "cycleIndex");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "integerValue") & 1) == 0)
        {
          objc_msgSend(v23, "cycleIndex");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "integerValue") != v12)
          {
            objc_msgSend(v23, "dose");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;

            if (v41 > 0.0)
              goto LABEL_27;
            v42 = (void *)MEMORY[0x1E0C99DA0];
            v43 = objc_opt_class();
            HKStringFromMedicationScheduleType(a3);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "dose");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "doubleValue");
            v45 = v44;
            objc_msgSend(v23, "cycleIndex");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "raise:format:", v21, CFSTR("%@ with type %@ and dose value %f must have a non-zero value dose in an even numbered interval. It must be active %ld"), v43, v37, v45, objc_msgSend(v46, "integerValue"));

          }
        }

LABEL_27:
        objc_msgSend(v23, "cycleIndex");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v47, "integerValue") & 1) == 0)
        {
          objc_msgSend(v23, "cycleIndex");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "integerValue") != v12)
          {
            objc_msgSend(v23, "cycleIntervalDays");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "integerValue");

            if (v50 == 1)
              goto LABEL_33;
            v51 = (void *)MEMORY[0x1E0C99DA0];
            v52 = objc_opt_class();
            HKStringFromMedicationScheduleType(a3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "cycleIndex");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "raise:format:", v21, CFSTR("%@ with type %@ must have even numbered intervals of length 1 day. %ld"), v52, v47, objc_msgSend(v48, "integerValue"));
          }

        }
LABEL_33:
        objc_msgSend(v23, "cycleIndex");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "integerValue") == v12)
        {
          objc_msgSend(v23, "cycleIntervalDays");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "integerValue");

          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * v55 + 0x1249249249249249) < 0x2492492492492493)
            continue;
          v56 = (void *)MEMORY[0x1E0C99DA0];
          v57 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cycleIndex");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "raise:format:", v21, CFSTR("%@ with type %@ cannot have a weeks pause interval that is not divisible by 7 days. %ld"), v57, v53, objc_msgSend(v58, "integerValue"));

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v20);
  }

}

+ (void)_validateActiveXPauseYScheduleTimeIntervals:(unint64_t)a3 scheduleType:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_opt_self();
  if (a3 - 9 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__validateActiveXPauseYScheduleTimeIntervals_scheduleType_, v5, CFSTR("HKMedicationSchedule+Convenience.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleType == HKMedicationScheduleTypeActiveXDaysPauseYDays || scheduleType == HKMedicationScheduleTypeActiveXWeeksPauseYWeeks"));

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v35 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v5, v10, a3);
        objc_msgSend(v10, "cycleIndex");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "integerValue"))
          goto LABEL_12;
        objc_msgSend(v10, "cycleIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if (a3 == 7 && v13 != 1)
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = objc_opt_class();
          HKStringFromMedicationScheduleType(7uLL);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cycleIndex");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "raise:format:", v35, CFSTR("%@ with type %@ cannot have an interval with cycleIndex %ld"), v15, v11, objc_msgSend(v16, "integerValue"));

LABEL_12:
        }
        objc_msgSend(v10, "cycleIndex");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "integerValue"))
        {
          objc_msgSend(v10, "dose");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          v20 = v19;

          if (v20 > 0.0)
            goto LABEL_17;
          v21 = (void *)MEMORY[0x1E0C99DA0];
          v22 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dose");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          objc_msgSend(v21, "raise:format:", v35, CFSTR("%@ with type %@ cannot have a %f value dose in cycle 0"), v22, v17, v24);

        }
LABEL_17:
        objc_msgSend(v10, "cycleIndex");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "integerValue") == 1)
        {
          objc_msgSend(v10, "dose");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;

          if (v28 == 0.0)
            continue;
          v29 = (void *)MEMORY[0x1E0C99DA0];
          v30 = objc_opt_class();
          HKStringFromMedicationScheduleType(a3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dose");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          objc_msgSend(v29, "raise:format:", v35, CFSTR("%@ with type %@ cannot have a non-zero value dose %f in cycle 1"), v30, v25, v32);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
  }

}

+ (void)_assertDaysOfTheWeekNoneForInterval:(unint64_t)a3 scheduleType:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_self();
  if (objc_msgSend(v9, "daysOfWeek"))
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = objc_opt_class();
    HKStringFromMedicationScheduleType(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromReminderWeekdayOptions(objc_msgSend(v9, "daysOfWeek"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ with type %@ cannot have an interval with daysOfWeek %@"), v6, v7, v8);

  }
}

+ (void)_assertCycleIndexIsNilForInterval:(unint64_t)a3 scheduleType:
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_self();
  objc_msgSend(v10, "cycleIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = objc_opt_class();
    HKStringFromMedicationScheduleType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cycleIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ with type %@ cannot have an interval with non-nil cycle index %ld"), v7, v8, objc_msgSend(v9, "longValue"));

  }
}

+ (void)_assertCycleIntervalDaysIsNilForInterval:(unint64_t)a3 scheduleType:
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_self();
  objc_msgSend(v10, "cycleIntervalDays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = objc_opt_class();
    HKStringFromMedicationScheduleType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cycleIntervalDays");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ with type %@ cannot have an interval with non-nil cycleIntervalDays %ld"), v7, v8, objc_msgSend(v9, "longValue"));

  }
}

+ (void)_assertDoseGreaterThanZeroForInterval:(unint64_t)a3 scheduleType:
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_opt_self();
  objc_msgSend(v13, "dose");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 <= 0.0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = objc_opt_class();
    HKStringFromMedicationScheduleType(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dose");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@ with type %@ cannot have an interval with dose %f <= 0"), v9, v10, v12);

  }
}

- (void)dayInCycleFor:calendar:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_0(v0);
  OUTLINED_FUNCTION_0_0(&dword_1B77D4000, v2, v3, "[%{public}@] dayInCycle() called for a schedule that has not yet started or a non cyclic schedule type.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
