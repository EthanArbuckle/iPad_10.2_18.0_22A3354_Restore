@implementation HKMedicationsNotificationAction

+ (int64_t)identifierWithRawValue:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEC808]) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RecordAllMedications")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SkipAllMedications")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SnoozeAllMedications")) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RecordMedication")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SkipMedication")) & 1) != 0)
  {
    v5 = 6;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[HKMedicationsNotificationAction identifierWithRawValue:].cold.1((uint64_t)a1, (uint64_t)v4, v6);

    v5 = 0;
  }

  return v5;
}

+ (id)rawValueWithIdentifier:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 2:
      result = CFSTR("SkipAllMedications");
      break;
    case 3:
      result = CFSTR("SnoozeAllMedications");
      break;
    case 4:
      result = (id)*MEMORY[0x1E0CEC808];
      break;
    case 5:
      result = CFSTR("RecordMedication");
      break;
    case 6:
      result = CFSTR("SkipMedication");
      break;
    default:
      result = CFSTR("RecordAllMedications");
      break;
  }
  return result;
}

+ (void)identifierWithRawValue:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B77D4000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot map unhandled raw value: %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end
