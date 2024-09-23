@implementation HDMedicationTimeZoneDetectionOperation

- (HDMedicationTimeZoneDetectionOperation)init
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

- (HDMedicationTimeZoneDetectionOperation)initWithMotive:(unint64_t)a3
{
  HDMedicationTimeZoneDetectionOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDMedicationTimeZoneDetectionOperation;
  result = -[HDMedicationTimeZoneDetectionOperation init](&v5, sel_init);
  if (result)
    result->_motive = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMedicationTimeZoneDetectionOperation)initWithCoder:(id)a3
{
  return -[HDMedicationTimeZoneDetectionOperation initWithMotive:](self, "initWithMotive:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("Motive")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_motive, CFSTR("Motive"));
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  void *v17;
  int64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  char v35;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint8_t buf[4];
  HDMedicationTimeZoneDetectionOperation *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "healthMedicationsProfileExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "medicationScheduleManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZoneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "_isAuthorizedToFireTimeZoneNotificationWithProfile:", v8) & 1) != 0)
  {
    v45 = 0;
    +[HDMedicationScheduleEntity allActiveMedicationSchedulesWithTransaction:error:](HDMedicationScheduleEntity, "allActiveMedicationSchedulesWithTransaction:error:", v9, &v45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v45;
    if (v14)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.4();

      if (a5)
      {
        v16 = 0;
        *a5 = objc_retainAutorelease(v14);
      }
      else
      {
        _HKLogDroppedError();
        v16 = 0;
      }
      goto LABEL_56;
    }
    if (!objc_msgSend(v13, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
        _os_log_impl(&dword_1B815E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No schedules found, disabling timezone experience", buf, 0xCu);
      }

      v16 = objc_msgSend(v12, "_updateTimeZoneExperienceAsEnabled:transaction:error:", 0, v9, a5);
      goto LABEL_56;
    }
    if (self->_motive != 1)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
      }

      v16 = 1;
      goto LABEL_56;
    }
    v44 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v18 = +[HDMedicationScheduleEntity allActiveSchedulesCreatedWithinTimeZone:transaction:offsetChange:error:](HDMedicationScheduleEntity, "allActiveSchedulesCreatedWithinTimeZone:transaction:offsetChange:error:", v17, v9, &v44, &v43);
    v42 = v43;
    if (v18 == 1)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
        _os_log_impl(&dword_1B815E000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Timezone has changed, but all scheduled medications match were created in the new timezone", buf, 0xCu);
      }

      v16 = objc_msgSend(v12, "_updateTimeZoneExperienceAsEnabled:transaction:error:", 0, v9, a5);
      v20 = v42;
      goto LABEL_55;
    }
    if (!v18)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v42;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.3();

      v21 = v42;
      if (v21)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

      v16 = 0;
      goto LABEL_55;
    }
    objc_msgSend(v12, "_mostRecentTimeZoneOffsetWithProfile:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v44 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 1;
      v20 = v42;
LABEL_54:

LABEL_55:
LABEL_56:

      goto LABEL_57;
    }
    v41 = v25;
    v27 = objc_msgSend(v25, "integerValue");
    if (v27 == v44)
    {
      v16 = 1;
      v20 = v42;
LABEL_53:
      v26 = v41;
      goto LABEL_54;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v47 = self;
      _os_log_impl(&dword_1B815E000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Timezone has changed with new offset. updating offset", buf, 0xCu);
    }

    if ((objc_msgSend(v12, "_updateTimeZoneOffsetOffset:transaction:error:", v44, v9, a5) & 1) != 0)
    {
      if (!v41)
      {
        objc_msgSend(v8, "healthMedicationsProfileExtension");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "medicationUserDefaults");
        v29 = objc_claimAutoreleasedReturnValue();

        v39 = v29;
        -[NSObject stringForKey:](v29, "stringForKey:", CFSTR("MedicationsTimeZoneLastChangeFromTimeZone"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v37 = v30;
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "secondsFromGMT");
          if (v32 == objc_msgSend(v17, "secondsFromGMT"))
          {
            _HKInitializeLogging();
            HKLogMedication();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v47 = self;
              _os_log_impl(&dword_1B815E000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Timezone change has been detected, but has already been handled using old time zone detection mechanism. Bailing out!", buf, 0xCu);
            }

            v34 = v39;
            -[NSObject removeObjectForKey:](v39, "removeObjectForKey:", CFSTR("MedicationsTimeZoneLastChangeFromTimeZone"));

            v16 = 1;
            goto LABEL_59;
          }

          v30 = v37;
        }

      }
      v16 = 1;
      v35 = objc_msgSend(v12, "_updateTimeZoneExperienceAsEnabled:transaction:error:", 1, v9, a5);
      v26 = v41;
      v20 = v42;
      if ((v35 & 1) != 0)
        goto LABEL_54;
      _HKInitializeLogging();
      HKLogMedication();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v34 = v40;
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.1();
        v16 = 0;
        goto LABEL_52;
      }
      v16 = 0;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v34 = v40;
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.2();
        v16 = 0;
LABEL_59:
        v20 = v42;
        goto LABEL_52;
      }
      v16 = 0;
      v20 = v42;
    }
    v34 = v40;
LABEL_52:

    goto LABEL_53;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = self;
    _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not authorized to fire timezone notification", buf, 0xCu);
  }
  v16 = 1;
LABEL_57:

  return v16;
}

- (unint64_t)motive
{
  return self->_motive;
}

- (void)performWithProfile:transaction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: Timezone has changed, but we failed to update experience with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)performWithProfile:transaction:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: Timezone has changed, but we failed to update offset in Key-Value Domain with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)performWithProfile:transaction:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: Timezone has changed, but fetching schedules failed with '%{public}@'");
  OUTLINED_FUNCTION_2();
}

- (void)performWithProfile:transaction:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch schedules with error: '%{public}@'");
  OUTLINED_FUNCTION_2();
}

@end
