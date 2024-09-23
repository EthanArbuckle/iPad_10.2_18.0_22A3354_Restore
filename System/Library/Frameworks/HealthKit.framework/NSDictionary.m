@implementation NSDictionary

void __59__NSDictionary_HKMetadata__hk_acceptedMetadataValueClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)hk_acceptedMetadataValueClasses_valueClasses;
  hk_acceptedMetadataValueClasses_valueClasses = v5;

}

void __50__NSDictionary_HKMetadata__hk_secureCodingClasses__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "hk_acceptedMetadataValueClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", objc_opt_class());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hk_secureCodingClasses___secureCodingClasses;
  hk_secureCodingClasses___secureCodingClasses = v1;

}

uint64_t __51__NSDictionary_HealthKit__hk_allValuesBySortedKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __56__NSDictionary_HealthKit__hk_filteredDictionaryForKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __37__NSDictionary_HealthKit__hk_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __34__NSDictionary_HealthKit__hk_map___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__NSDictionary_HealthKit__hk_map___block_invoke_2;
  v6[3] = &unk_1E37E9E48;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, a2, a3, v6);

}

uint64_t __34__NSDictionary_HealthKit__hk_map___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a3, a2);
  }
  return result;
}

void __121__NSDictionary_HKMetadata__hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys_applicationSDKVersionToken_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;

  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0C99D80], "hk_acceptsMetadataValue:allowPrivateMetadata:", v8, *(unsigned __int8 *)(a1 + 64)) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (*(_BYTE *)(a1 + 64)
       || (_HKMetadataKeyIsPrivate(v7, v9) & 1) == 0 && !_HKMetadataKeyIsReadOnly(v7)))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v11, "_hk_validateMetadataValueContent:forKey:applicationSDKVersionToken:error:", v8, v7, v10, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if ((v13 & 1) != 0)
        goto LABEL_12;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Invalid metadata key: %@"), v7, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Invalid metadata value: %@, for key: %@"), v8, v7);
  }
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_11:
  *a4 = 1;
LABEL_12:

}

void __65__NSDictionary_HKMetadata__hk_acceptedPublicMetadataValueClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hk_acceptedPublicMetadataValueClasses_valueClasses;
  hk_acceptedPublicMetadataValueClasses_valueClasses = v4;

}

void __78__NSDictionary_HKMetadata___hk_validateMetadataBaseValueContent_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[51];
  _QWORD v3[52];

  v3[51] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_HKPrivateCoreMotionSourceIdentifier");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("_HKPrivateFallActionRequested");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("_HKPrivateHeartRateContext");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("_HKPrivateMetadataKeyInternalLiveOnAlgorithmVersion");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("_HKPrivateMetadataKeySkinSurfaceTemperature");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("HKActivityType");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("HKMetadataKeyAppleFitnessPlusSession");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("HKBloodGlucoseMealTime");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("HKBodyTemperatureSensorLocation");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("HKCoachedWorkout");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("HKCyclingCyclingFunctionalThresholdPowerTestType");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("HKDeviceManufacturerName");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("HKDeviceName");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("HKDeviceSerialNumber");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("HKDigitalSignature");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("HKExternalUUID");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("HKFoodType");
  v3[16] = objc_opt_class();
  v2[17] = CFSTR("HKGroupFitness");
  v3[17] = objc_opt_class();
  v2[18] = CFSTR("HKHeartRateEventThreshold");
  v3[18] = objc_opt_class();
  v2[19] = CFSTR("HKMetadataKeyHeartRateMotionContext");
  v3[19] = objc_opt_class();
  v2[20] = CFSTR("HKMetadataKeyHeartRateRecoveryActivityDuration");
  v3[20] = objc_opt_class();
  v2[21] = CFSTR("HKMetadataKeyHeartRateRecoveryActivityType");
  v3[21] = objc_opt_class();
  v2[22] = CFSTR("HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate");
  v3[22] = objc_opt_class();
  v2[23] = CFSTR("HKMetadataKeyHeartRateRecoveryTestType");
  v3[23] = objc_opt_class();
  v2[24] = CFSTR("HKHeartRateSensorLocation");
  v3[24] = objc_opt_class();
  v2[25] = CFSTR("HKIndoorWorkout");
  v3[25] = objc_opt_class();
  v2[26] = CFSTR("HKInsulinDeliveryReason");
  v3[26] = objc_opt_class();
  v2[27] = CFSTR("HKLapLength");
  v3[27] = objc_opt_class();
  v2[28] = CFSTR("HKMetadataKeyMaximumLightIntensity");
  v3[28] = objc_opt_class();
  v2[29] = CFSTR("HKMenstrualCycleStart");
  v3[29] = objc_opt_class();
  v2[30] = CFSTR("HKPhysicalEffortEstimationType");
  v3[30] = objc_opt_class();
  v2[31] = CFSTR("HKMetadataKeyQuantityClampedToLowerBound");
  v3[31] = objc_opt_class();
  v2[32] = CFSTR("HKMetadataKeyQuantityClampedToUpperBound");
  v3[32] = objc_opt_class();
  v2[33] = CFSTR("HKReferenceRangeLowerLimit");
  v3[33] = objc_opt_class();
  v2[34] = CFSTR("HKReferenceRangeUpperLimit");
  v3[34] = objc_opt_class();
  v2[35] = CFSTR("HKMetadataKeySessionEstimate");
  v3[35] = objc_opt_class();
  v2[36] = CFSTR("HKSwimmingLocationType");
  v3[36] = objc_opt_class();
  v2[37] = CFSTR("HKSwimmingStrokeStyle");
  v3[37] = objc_opt_class();
  v2[38] = CFSTR("HKMetadataKeySyncIdentifier");
  v3[38] = objc_opt_class();
  v2[39] = CFSTR("HKMetadataKeySyncVersion");
  v3[39] = objc_opt_class();
  v2[40] = CFSTR("HKTimeZone");
  v3[40] = objc_opt_class();
  v2[41] = CFSTR("HKUDIDeviceIdentifier");
  v3[41] = objc_opt_class();
  v2[42] = CFSTR("HKUDIProductionIdentifier");
  v3[42] = objc_opt_class();
  v2[43] = CFSTR("HKMetadataKeyUserMotionContext");
  v3[43] = objc_opt_class();
  v2[44] = CFSTR("HKWasTakenInLab");
  v3[44] = objc_opt_class();
  v2[45] = CFSTR("HKWasUserEntered");
  v3[45] = objc_opt_class();
  v2[46] = CFSTR("HKMetadataKeyWaterSalinity");
  v3[46] = objc_opt_class();
  v2[47] = CFSTR("HKWeatherCondition");
  v3[47] = objc_opt_class();
  v2[48] = CFSTR("HKWeatherHumidity");
  v3[48] = objc_opt_class();
  v2[49] = CFSTR("HKWeatherTemperature");
  v3[49] = objc_opt_class();
  v2[50] = CFSTR("HKWorkoutBrandName");
  v3[50] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 51);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase;
  _hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKElevationAscended");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("HKElevationDescended");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("HKSexualActivityProtectionUsed");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKAverageSpeed");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("HKMaximumSpeed");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("HKAlpineSlopeGrade");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("HKFitnessMachineDuration");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("HKIndoorBikeDistance");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("HKCrossTrainerDistance");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("HKAverageMETs");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("HKMetadataKeyAudioExposureLevel");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("_HKPrivateWorkoutActivityMoveMode");
  v3[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon;
  _hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKMetadataKeyAudioExposureDuration");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("HKMetadataKeyAppleECGAlgorithmVersion");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("HKMetadataKeyDevicePlacementSide");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKMetadataKeyAppleDeviceCalibrated");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("HKVO2MaxValue");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("HKLowCardioFitnessEventThreshold");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("_HKPrivateMetadataKeyUserOnBetaBlocker");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("_HKPrivateMetadataKeySessionUUID");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("_HKPrivateMetadataKeyRepeatNotification");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("_HKPrivateMetadataKeyAudioExposureLimit");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("_HKPrivateMetadataKeyHeadphoneAudioDataIsTransient");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("_HKPrivateMetadataKeyNotificationIncludesPrunableData");
  v3[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul;
  _hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("HKDateOfEarliestDataUsedForEstimate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKAlgorithmVersion");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky;
  _hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKSWOLFScore");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("_HKPrivateWorkoutWeatherSourceName");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("_HKPrivateWorkoutExtendedMode");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKMetadataKeyHeadphoneGain");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney;
  _hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKCyclingCyclingFunctionalThresholdPowerTestType");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("HKActivityType");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("HKPhysicalEffortEstimationType");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKMetadataKeyWaterSalinity");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("HKMetadataKeyAppleFitnessPlusSession");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("HKMetadataKeyMaximumLightIntensity");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn;
  _hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn = v0;

}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_HKPrivateMetadataKeyPregnancyStartSourceMethod");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("_HKPrivateMetadataKeyPregnancyEmbryoAgeDays");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("_HKPrivateMetadataKeyPregnancyDetailsRecordedDate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("_HKPrivateMetadataKeyWorkoutActivityUUID");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("_HKPrivateMetadataKeyTransientRatingOfEstimatedExertion");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("_HKPrivateMetadataKeySessionIncomplete");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18;
  _hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18 = v0;

}

void __121__NSDictionary_HKWorkoutEventMetadata__hk_validateMetadataKeysAndValuesForWorkoutEvent_applicationSDKVersionToken_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;

  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0C99D80], "hk_acceptsMetadataValue:allowPrivateMetadata:", v8, 1) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)a1[4];
      v10 = a1[5];
      v11 = a1[8];
      v12 = *(_QWORD *)(a1[6] + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v9, "_hk_validateMetadataValueForWorkoutEvent:valueContent:forKey:applicationSDKVersionToken:error:", v10, v8, v7, v11, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if ((v13 & 1) != 0)
        goto LABEL_9;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Invalid metadata key: %@"), v7, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Invalid metadata value: %@, for key: %@"), v8, v7);
  }
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_8:
  *a4 = 1;
LABEL_9:

}

void __109__NSDictionary_HKWorkoutEventMetadata___hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKElevationAscended");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("HKElevationDescended");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("HKAverageSpeed");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("HKMaximumSpeed");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("HKAlpineSlopeGrade");
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon;
  _hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon = v0;

}

void __90__NSDictionary_HKAttachmentMetadata__hk_validateAttachmentMetadataKeysAndValuesWithError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Invalid metadata key: %@"), v13, v12);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_acceptedAttachmentMetadataValueClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Invalid metadata value: %@, for key: %@"), v7, v13);
LABEL_5:
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

void __79__NSDictionary_HKAttachmentMetadata__hk_acceptedAttachmentMetadataValueClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hk_acceptedAttachmentMetadataValueClasses_valueClasses;
  hk_acceptedAttachmentMetadataValueClasses_valueClasses = v3;

}

void __70__NSDictionary_HKAttachmentMetadata__hk_secureAttachmentCodingClasses__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "hk_acceptedAttachmentMetadataValueClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", objc_opt_class());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hk_secureAttachmentCodingClasses__secureCodingClasses;
  hk_secureAttachmentCodingClasses__secureCodingClasses = v1;

}

@end
