@implementation HKMetadataValidationUtilities

+ (BOOL)hk_validateMetadataValueClass:(id)a3 forKey:(id)a4 expectedClassLookupTable:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  BOOL v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  if (v11 && (v12 = (objc_class *)v11, (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_assignError:code:format:", a6, 3, CFSTR("Invalid class %@ for metadata key: %@. Expected %@."), v16, v10, v17);

    v13 = 0;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (BOOL)hk_validateDigitalSignatureMetadataValue:(id)a3 error:(id *)a4
{
  char v5;

  v5 = objc_msgSend(a3, "hk_isBase64");
  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: value is not a Base64 string"), CFSTR("HKDigitalSignature"));
  return v5;
}

+ (BOOL)hk_validateTimeZoneMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: \"%@\" is not a valid time zone name string"), CFSTR("HKTimeZone"), v5);

  return v6 != 0;
}

+ (BOOL)hk_validateHeartRateSensorLocationMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 7)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKHeartRateSensorLocation"), v5);

  return v6 < 7;
}

+ (BOOL)hk_validateInsulinDeliveryReasonMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKInsulinDeliveryReason"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateMealTimeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKBloodGlucoseMealTime"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateBodyTemperatureSensorLocationMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 0xC)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKBodyTemperatureSensorLocation"), v5);

  return v6 < 0xC;
}

+ (BOOL)hk_validateWeatherConditionMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 0x1C)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKWeatherCondition"), v5);

  return v6 < 0x1C;
}

+ (BOOL)hk_validateQuantityMetadataValue:(id)a3 value:(id)a4 compatibleUnit:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  const __CFString *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = CFSTR("Invalid metadata value for %@: '%@' is not a quantity");
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, v13, v9, v10);
    v12 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "isCompatibleWithUnit:", v11) & 1) == 0)
  {
    v13 = CFSTR("Invalid metadata value for %@: %@ has an incompatible unit");
    goto LABEL_6;
  }
  v12 = 1;
LABEL_7:

  return v12;
}

+ (BOOL)hk_validateSwimmingLocationTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKSwimmingLocationType"), v5);

  return v6 < 3;
}

+ (BOOL)hk_validateSwimmingStrokeStyleMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 7)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKSwimmingStrokeStyle"), v5);

  return v6 < 7;
}

+ (BOOL)hk_validateSyncIdentifierMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("%@ must contain at least one character"), CFSTR("HKMetadataKeySyncIdentifier"), v11);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("%@ must be provided if %@ is provided in the metadata"), CFSTR("HKMetadataKeySyncVersion"), CFSTR("HKMetadataKeySyncIdentifier"));
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

+ (BOOL)hk_validateSyncVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    v9 = v8 >= 0;
    if (v8 < 0)
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("%@ must greater than or equal to 0"), CFSTR("HKMetadataKeySyncVersion"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("%@ may not be provided if %@ is not provided in the metadata"), CFSTR("HKMetadataKeySyncVersion"), CFSTR("HKMetadataKeySyncIdentifier"));
    v9 = 0;
  }

  return v9;
}

+ (BOOL)hk_validateVO2MaxTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKVO2MaxTestType"), v5);

  return v6 < 3;
}

+ (BOOL)hk_validateActivityMoveModeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("_HKPrivateWorkoutActivityMoveMode"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateAppleECGAlgorithmValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyAppleECGAlgorithmVersion"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateDevicePlacementSideValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 4)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyDevicePlacementSide"), v5);

  return v6 < 4;
}

+ (BOOL)hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateCoreMotionSourceIdentifierMetadataValue:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "length");
  if (!v5)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("%@ must contain at least one character"), CFSTR("_HKPrivateCoreMotionSourceIdentifier"));
  return v5 != 0;
}

+ (BOOL)hk_validateHeartRateRecoveryTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyHeartRateRecoveryTestType"), v5);

  return v6 < 3;
}

+ (BOOL)hk_validateHeartRateRecoveryActivityTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  char IsValid;

  v5 = a3;
  IsValid = _HKWorkoutActivityTypeIsValid((int)objc_msgSend(v5, "intValue"));
  if ((IsValid & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyHeartRateRecoveryActivityType"), v5);

  return IsValid;
}

+ (BOOL)hk_validateUserMotionContextMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "intValue");
  if (v6 >= 3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyUserMotionContext"), v5);

  return v6 < 3;
}

+ (BOOL)hk_validateWaterSalinityMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKMetadataKeyWaterSalinity"), v5);

  return v6 < 2;
}

+ (BOOL)hk_validateCyclingFTPTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 4)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKCyclingCyclingFunctionalThresholdPowerTestType"), v5);

  return v6 < 4;
}

+ (BOOL)hk_validatePhysicalEffortEstimationTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  v6 = (int)objc_msgSend(v5, "intValue") - 1;
  if (v6 >= 2)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid metadata value for %@: %@"), CFSTR("HKPhysicalEffortEstimationType"), v5);

  return v6 < 2;
}

@end
