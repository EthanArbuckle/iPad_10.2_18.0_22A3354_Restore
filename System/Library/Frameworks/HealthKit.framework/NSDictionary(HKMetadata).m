@implementation NSDictionary(HKMetadata)

+ (uint64_t)hk_acceptsMetadataValue:()HKMetadata allowPrivateMetadata:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a4 & 1) != 0)
    objc_msgSend(a1, "hk_acceptedMetadataValueClasses");
  else
    objc_msgSend(a1, "hk_acceptedPublicMetadataValueClasses");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return v8;
}

+ (id)hk_acceptedMetadataValueClasses
{
  if (hk_acceptedMetadataValueClasses_onceToken != -1)
    dispatch_once(&hk_acceptedMetadataValueClasses_onceToken, &__block_literal_global_30);
  return (id)hk_acceptedMetadataValueClasses_valueClasses;
}

+ (id)hk_secureCodingClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NSDictionary_HKMetadata__hk_secureCodingClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hk_secureCodingClasses_onceToken != -1)
    dispatch_once(&hk_secureCodingClasses_onceToken, block);
  return (id)hk_secureCodingClasses___secureCodingClasses;
}

- (BOOL)hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:()HKMetadata applicationSDKVersionToken:error:
{
  id v6;
  void *v7;
  _QWORD v9[8];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __121__NSDictionary_HKMetadata__hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys_applicationSDKVersionToken_error___block_invoke;
  v9[3] = &unk_1E37EC190;
  v10 = a3;
  v9[4] = a1;
  v9[5] = &v11;
  v9[6] = a2;
  v9[7] = a4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = (id)v12[5];
  v7 = v6;
  if (v6)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError(v6);
  }

  _Block_object_dispose(&v11, 8);
  return v7 == 0;
}

- (id)hk_copyWithoutPrivateMetadataKeys
{
  return (id)objc_msgSend(a1, "_copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:", 0);
}

- (id)hk_copySanitizedForPublicClient
{
  return (id)objc_msgSend(a1, "_copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:", 1);
}

- (id)_copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:()HKMetadata
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v5)
  {

    return a1;
  }
  v7 = v5;
  v8 = 0;
  v9 = *(_QWORD *)v17;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      if (_HKMetadataKeyIsPrivate(v11, v6))
      {
        if (v8)
        {
          if (a3)
            goto LABEL_9;
        }
        else
        {
          v8 = (void *)objc_msgSend(a1, "mutableCopy");
          if (a3)
LABEL_9:
            objc_msgSend((id)objc_opt_class(), "_addDerivedPublicKeyIfNecessaryForPrivateKey:mutableDictionary:", v11, v8);
        }
        objc_msgSend(v8, "removeObjectForKey:", v11);
      }
      ++v10;
    }
    while (v7 != v10);
    v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v7 = v12;
  }
  while (v12);

  if (v8)
  {
    v13 = objc_msgSend(v8, "copy");

    return (id)v13;
  }
  return a1;
}

+ (void)_addDerivedPublicKeyIfNecessaryForPrivateKey:()HKMetadata mutableDictionary:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("_HKPrivateHeartRateContext")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HKHeartRateMotionContextForPrivateHeartRateContext(objc_msgSend(v6, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("HKMetadataKeyHeartRateMotionContext"));

  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("HKAlgorithmVersion"));

  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("_HKPrivateMetadataKeyBackgroundAtrialFibrillationDetectionVersion")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString(v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("HKAlgorithmVersion"));

  }
}

+ (id)hk_acceptedPublicMetadataValueClasses
{
  if (hk_acceptedPublicMetadataValueClasses_onceToken != -1)
    dispatch_once(&hk_acceptedPublicMetadataValueClasses_onceToken, &__block_literal_global_18);
  return (id)hk_acceptedPublicMetadataValueClasses_valueClasses;
}

- (BOOL)_hk_validateMetadataBaseValueContent:()HKMetadata forKey:error:
{
  id v8;
  id v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (_hk_validateMetadataBaseValueContent_forKey_error__onceToken != -1)
    dispatch_once(&_hk_validateMetadataBaseValueContent_forKey_error__onceToken, &__block_literal_global_19);
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v8, v9, _hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase, a5))
  {
    if (objc_msgSend(CFSTR("HKDigitalSignature"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateDigitalSignatureMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateDigitalSignatureMetadataValue:error:", v8, a5);
LABEL_19:
      v11 = v10;
      goto LABEL_20;
    }
    if (objc_msgSend(CFSTR("HKTimeZone"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateTimeZoneMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateTimeZoneMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (objc_msgSend(CFSTR("HKHeartRateSensorLocation"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateHeartRateSensorLocationMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateHeartRateSensorLocationMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (objc_msgSend(CFSTR("HKInsulinDeliveryReason"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateInsulinDeliveryReasonMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateInsulinDeliveryReasonMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (objc_msgSend(CFSTR("HKBloodGlucoseMealTime"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateMealTimeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateMealTimeMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (objc_msgSend(CFSTR("HKBodyTemperatureSensorLocation"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateBodyTemperatureSensorLocationMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateBodyTemperatureSensorLocationMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (objc_msgSend(CFSTR("HKWeatherCondition"), "isEqualToString:", v9))
    {
      v10 = +[HKMetadataValidationUtilities hk_validateWeatherConditionMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateWeatherConditionMetadataValue:error:", v8, a5);
      goto LABEL_19;
    }
    if (!objc_msgSend(CFSTR("HKWeatherTemperature"), "isEqualToString:", v9))
    {
      if (objc_msgSend(CFSTR("HKWeatherHumidity"), "isEqualToString:", v9))
      {
        +[HKUnit percentUnit](HKUnit, "percentUnit");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (objc_msgSend(CFSTR("HKLapLength"), "isEqualToString:", v9))
      {
        +[HKUnit meterUnit](HKUnit, "meterUnit");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (objc_msgSend(CFSTR("HKSwimmingLocationType"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateSwimmingLocationTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateSwimmingLocationTypeMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKSwimmingStrokeStyle"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateSwimmingStrokeStyleMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateSwimmingStrokeStyleMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeySyncIdentifier"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateSyncIdentifierMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateSyncIdentifierMetadataValue:error:", a1, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeySyncVersion"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateSyncVersionMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateSyncVersionMetadataValue:error:", a1, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKVO2MaxTestType"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateVO2MaxTestTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateVO2MaxTestTypeMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("_HKPrivateCoreMotionSourceIdentifier"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateCoreMotionSourceIdentifierMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateCoreMotionSourceIdentifierMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeyUserMotionContext"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateUserMotionContextMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateUserMotionContextMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeyHeartRateRecoveryTestType"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateHeartRateRecoveryTestTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateHeartRateRecoveryTestTypeMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeyHeartRateRecoveryActivityType"), "isEqualToString:", v9))
      {
        v10 = +[HKMetadataValidationUtilities hk_validateHeartRateRecoveryActivityTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateHeartRateRecoveryActivityTypeMetadataValue:error:", v8, a5);
        goto LABEL_19;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeyHeartRateRecoveryActivityDuration"), "isEqualToString:", v9))
      {
        +[HKUnit secondUnit](HKUnit, "secondUnit");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (objc_msgSend(CFSTR("HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate"), "isEqualToString:", v9))
      {
        +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (!objc_msgSend(CFSTR("_HKPrivateMetadataKeySkinSurfaceTemperature"), "isEqualToString:", v9))
      {
        if (objc_msgSend(CFSTR("HKMetadataKeyWaterSalinity"), "isEqualToString:", v9))
        {
          v10 = +[HKMetadataValidationUtilities hk_validateWaterSalinityMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateWaterSalinityMetadataValue:error:", v8, a5);
        }
        else if (objc_msgSend(CFSTR("HKCyclingCyclingFunctionalThresholdPowerTestType"), "isEqualToString:", v9))
        {
          v10 = +[HKMetadataValidationUtilities hk_validateCyclingFTPTestTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateCyclingFTPTestTypeMetadataValue:error:", v8, a5);
        }
        else
        {
          if (!objc_msgSend(CFSTR("HKPhysicalEffortEstimationType"), "isEqualToString:", v9))
          {
            v11 = 1;
            goto LABEL_20;
          }
          v10 = +[HKMetadataValidationUtilities hk_validatePhysicalEffortEstimationTypeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validatePhysicalEffortEstimationTypeMetadataValue:error:", v8, a5);
        }
        goto LABEL_19;
      }
    }
    +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_27:
    v14 = (void *)v13;
    v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", v9, v8, v13, a5);

    goto LABEL_20;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS13WithValue:()HKMetadata forKey:error:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  const __CFString *v13;

  v7 = a3;
  v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__onceToken != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__onceToken, &__block_literal_global_22_0);
  if (!+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v7, v8, _hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon, a5))
  {
    v11 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(CFSTR("HKElevationAscended"), "isEqualToString:", v8)
    || objc_msgSend(CFSTR("HKElevationDescended"), "isEqualToString:", v8))
  {
LABEL_6:
    +[HKUnit meterUnit](HKUnit, "meterUnit");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", v8, v7, v9, a5);

    goto LABEL_9;
  }
  if (objc_msgSend(CFSTR("HKAverageSpeed"), "isEqualToString:", v8)
    || objc_msgSend(CFSTR("HKMaximumSpeed"), "isEqualToString:", v8))
  {
    v13 = CFSTR("m/s");
LABEL_13:
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v13);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("HKAlpineSlopeGrade"), "isEqualToString:", v8))
  {
    +[HKUnit percentUnit](HKUnit, "percentUnit");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("HKFitnessMachineDuration"), "isEqualToString:", v8))
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("HKIndoorBikeDistance"), "isEqualToString:", v8)
    || objc_msgSend(CFSTR("HKCrossTrainerDistance"), "isEqualToString:", v8))
  {
    goto LABEL_6;
  }
  if (objc_msgSend(CFSTR("HKAverageMETs"), "isEqualToString:", v8))
  {
    v13 = CFSTR("kcal/(kg*hr)");
    goto LABEL_13;
  }
  if (objc_msgSend(CFSTR("HKMetadataKeyAudioExposureLevel"), "isEqualToString:", v8))
  {
    +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("_HKPrivateWorkoutActivityMoveMode"), "isEqualToString:", v8))
    v11 = +[HKMetadataValidationUtilities hk_validateActivityMoveModeMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateActivityMoveModeMetadataValue:error:", v7, a5);
  else
    v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS14WithValue:()HKMetadata forKey:error:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;

  v7 = a3;
  v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__onceToken != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__onceToken, &__block_literal_global_27);
  if (!+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v7, v8, _hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul, a5))
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(CFSTR("HKMetadataKeyAudioExposureDuration"), "isEqualToString:", v8))
  {
    if (objc_msgSend(CFSTR("HKMetadataKeyAppleECGAlgorithmVersion"), "isEqualToString:", v8))
    {
      v12 = +[HKMetadataValidationUtilities hk_validateAppleECGAlgorithmValue:error:](HKMetadataValidationUtilities, "hk_validateAppleECGAlgorithmValue:error:", v7, a5);
    }
    else
    {
      if (!objc_msgSend(CFSTR("HKMetadataKeyDevicePlacementSide"), "isEqualToString:", v8))
      {
        if (objc_msgSend(CFSTR("_HKPrivateMetadataKeyAudioExposureLimit"), "isEqualToString:", v8))
        {
          +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(CFSTR("HKVO2MaxValue"), "isEqualToString:", v8)
            && !objc_msgSend(CFSTR("HKLowCardioFitnessEventThreshold"), "isEqualToString:", v8))
          {
            v11 = 1;
            goto LABEL_13;
          }
          +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("ml/kg*min"));
          v9 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_6;
      }
      v12 = +[HKMetadataValidationUtilities hk_validateDevicePlacementSideValue:error:](HKMetadataValidationUtilities, "hk_validateDevicePlacementSideValue:error:", v7, a5);
    }
    v11 = v12;
    goto LABEL_13;
  }
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v9;
  v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", v8, v7, v9, a5);

LABEL_13:
  return v11;
}

- (uint64_t)_hk_validateMetadataIntroducedWithIOS15WithValue:()HKMetadata forKey:error:
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__onceToken != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__onceToken, &__block_literal_global_30);
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v7, v8, _hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky, a5))
  {
    if (objc_msgSend(CFSTR("_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion"), "isEqualToString:", v8))
    {
      v9 = +[HKMetadataValidationUtilities hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:error:", v7, a5);
    }
    else
    {
      if (!objc_msgSend(CFSTR("HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion"), "isEqualToString:", v8))
      {
        v10 = 1;
        goto LABEL_11;
      }
      v9 = +[HKMetadataValidationUtilities hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:error:", v7, a5);
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS16WithValue:()HKMetadata forKey:error:
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;

  v7 = a3;
  v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__onceToken != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__onceToken, &__block_literal_global_31);
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v7, v8, _hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney, a5))
  {
    if (objc_msgSend(CFSTR("HKMetadataKeyHeadphoneGain"), "isEqualToString:", v8))
    {
      +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", v8, v7, v9, a5);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS17WithValue:()HKMetadata forKey:error:
{
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;

  v7 = _hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__onceToken;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__onceToken, &__block_literal_global_32);
  v10 = +[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v9, v8, _hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn, a5);

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS18WithValue:()HKMetadata forKey:error:
{
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;

  v7 = _hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__onceToken;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__onceToken, &__block_literal_global_33);
  v10 = +[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v9, v8, _hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18, a5);

  return v10;
}

- (uint64_t)_hk_validateMetadataValueContent:()HKMetadata forKey:applicationSDKVersionToken:error:
{
  id v10;
  id v11;
  uint64_t v12;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(a1, "_hk_validateMetadataBaseValueContent:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E30901FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS13WithValue:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E40901FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS14WithValue:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E50901FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS15WithValue:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E60901FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS16WithValue:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E70901FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS17WithValue:forKey:error:", v10, v11, a6);
  if (HKProgramSDKTokenAtLeast(a5, 0x7E80000FFFFFFFFLL))
    v12 = v12 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS18WithValue:forKey:error:", v10, v11, a6);

  return v12;
}

@end
