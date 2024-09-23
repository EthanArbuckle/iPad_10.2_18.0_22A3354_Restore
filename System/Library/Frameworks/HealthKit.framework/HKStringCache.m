@implementation HKStringCache

+ (id)_initialStrings
{
  _QWORD v1[168];

  v1[167] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("HKUDIDeviceIdentifier");
  v1[1] = CFSTR("HKUDIProductionIdentifier");
  v1[2] = CFSTR("HKDeviceSerialNumber");
  v1[3] = CFSTR("HKBodyTemperatureSensorLocation");
  v1[4] = CFSTR("HKHeartRateSensorLocation");
  v1[5] = CFSTR("HKFoodType");
  v1[6] = CFSTR("HKDigitalSignature");
  v1[7] = CFSTR("HKExternalUUID");
  v1[8] = CFSTR("HKMetadataKeySyncIdentifier");
  v1[9] = CFSTR("HKMetadataKeySyncVersion");
  v1[10] = CFSTR("HKTimeZone");
  v1[11] = CFSTR("HKDeviceName");
  v1[12] = CFSTR("HKDeviceManufacturerName");
  v1[13] = CFSTR("HKWasTakenInLab");
  v1[14] = CFSTR("HKReferenceRangeLowerLimit");
  v1[15] = CFSTR("HKReferenceRangeUpperLimit");
  v1[16] = CFSTR("HKWasUserEntered");
  v1[17] = CFSTR("HKWorkoutBrandName");
  v1[18] = CFSTR("HKGroupFitness");
  v1[19] = CFSTR("HKMetadataKeyAppleFitnessPlusSession");
  v1[20] = CFSTR("HKIndoorWorkout");
  v1[21] = CFSTR("HKCoachedWorkout");
  v1[22] = CFSTR("HKSexualActivityProtectionUsed");
  v1[23] = CFSTR("HKMenstrualCycleStart");
  v1[24] = CFSTR("HKInsulinDeliveryReason");
  v1[25] = CFSTR("HKBloodGlucoseMealTime");
  v1[26] = CFSTR("HKVO2MaxTestType");
  v1[27] = CFSTR("HKHeartRateEventThreshold");
  v1[28] = CFSTR("HKVO2MaxValue");
  v1[29] = CFSTR("HKLowCardioFitnessEventThreshold");
  v1[30] = CFSTR("HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion");
  v1[31] = CFSTR("HKDateOfEarliestDataUsedForEstimate");
  v1[32] = CFSTR("HKAlgorithmVersion");
  v1[33] = CFSTR("HKActivityType");
  v1[34] = CFSTR("HKPhysicalEffortEstimationType");
  v1[35] = CFSTR("HKWeatherCondition");
  v1[36] = CFSTR("HKWeatherTemperature");
  v1[37] = CFSTR("HKWeatherHumidity");
  v1[38] = CFSTR("HKLapLength");
  v1[39] = CFSTR("HKSwimmingLocationType");
  v1[40] = CFSTR("HKSwimmingStrokeStyle");
  v1[41] = CFSTR("HKAverageSpeed");
  v1[42] = CFSTR("HKMaximumSpeed");
  v1[43] = CFSTR("HKAlpineSlopeGrade");
  v1[44] = CFSTR("HKElevationAscended");
  v1[45] = CFSTR("HKElevationDescended");
  v1[46] = CFSTR("HKFitnessMachineDuration");
  v1[47] = CFSTR("HKIndoorBikeDistance");
  v1[48] = CFSTR("HKCrossTrainerDistance");
  v1[49] = CFSTR("HKAverageMETs");
  v1[50] = CFSTR("HKSWOLFScore");
  v1[51] = CFSTR("HKCyclingCyclingFunctionalThresholdPowerTestType");
  v1[52] = CFSTR("HKMetadataKeyGlassesPrescriptionDescription");
  v1[53] = CFSTR("HKdr");
  v1[54] = CFSTR("HKdt");
  v1[55] = CFSTR("HKgt");
  v1[56] = CFSTR("HKrg");
  v1[57] = CFSTR("HKng");
  v1[58] = CFSTR("_HKPrivateWeatherCondition");
  v1[59] = CFSTR("_HKPrivateWorkoutWasInDaytime");
  v1[60] = CFSTR("_HKPrivateWorkoutLocationSeriesIsSmoothed");
  v1[61] = CFSTR("_HKPrivateWorkoutAssociatedUUID");
  v1[62] = CFSTR("_HKPrivateWorkoutUnsmoothedCopyAssociatedUUID");
  v1[63] = CFSTR("_HKPrivateWorkoutElevationAscendedQuantity");
  v1[64] = CFSTR("_HKPrivateWorkoutWeatherLocationCoordinatesLatitude");
  v1[65] = CFSTR("_HKPrivateWorkoutWeatherLocationCoordinatesLongitude");
  v1[66] = CFSTR("_HKPrivateWorkoutWeatherSourceName");
  v1[67] = CFSTR("_HKPrivateWorkoutStrideCount");
  v1[68] = CFSTR("_HKPrivateWorkoutStepCount");
  v1[69] = CFSTR("_HKPrivateWorkoutAverageSpeed");
  v1[70] = CFSTR("_HKPrivateWorkoutAveragePace");
  v1[71] = CFSTR("_HKPrivateWorkoutAveragePower");
  v1[72] = CFSTR("_HKPrivateWorkoutInstantaneousCadence");
  v1[73] = CFSTR("_HKPrivateWorkoutAverageCadence");
  v1[74] = CFSTR("_HKPrivateWorkoutInstantaneousPower");
  v1[75] = CFSTR("_HKPrivateWorkoutMachineBrand");
  v1[76] = CFSTR("_HKPrivateWorkoutMachineType");
  v1[77] = CFSTR("_HKPrivateWorkoutActivityMoveMode");
  v1[78] = CFSTR("_HKPrivateWorkoutExtendedMode");
  v1[79] = CFSTR("_HKPrivateMetadataKeyRaceReferenceRouteWorkoutUUID");
  v1[80] = CFSTR("_HKPrivateMetadataKeyRaceStartOnRouteDate");
  v1[81] = CFSTR("_HKPrivateMetadataKeyRaceStartOnRouteDistance");
  v1[82] = CFSTR("_HKPrivateMetadataKeyRaceStartOnRouteDuration");
  v1[83] = CFSTR("_HKPrivateMetadataKeyRaceFinishRouteDate");
  v1[84] = CFSTR("_HKPrivateMetadataKeyRaceFinishRouteDistance");
  v1[85] = CFSTR("_HKPrivateMetadataKeyRaceFinishRouteDuration");
  v1[86] = CFSTR("_HKPrivateDeepBreathingEndReason");
  v1[87] = CFSTR("_HKPrivateDeepBreathingFinalHeartRate");
  v1[88] = CFSTR("_HKPrivateSleepAlarmUserSetBedtime");
  v1[89] = CFSTR("_HKPrivateSleepAlarmUserWakeTime");
  v1[90] = CFSTR("_HKPrivateBloodOxygenContext");
  v1[91] = CFSTR("HKMetadataKeyUserMotionContext");
  v1[92] = CFSTR("HKMetadataKeyHeartRateMotionContext");
  v1[93] = CFSTR("_HKPrivateHeartRateContext");
  v1[94] = CFSTR("_HKPrivateHeartbeatSequenceContext");
  v1[95] = CFSTR("_HKPrivateMetadataKeyHeartbeatLongestSubsequenceStart");
  v1[96] = CFSTR("_HKPrivateMetadataKeyHeartbeatLongestSubsequenceDuration");
  v1[97] = CFSTR("HKMetadataKeyHeartRateRecoveryTestType");
  v1[98] = CFSTR("HKMetadataKeyHeartRateRecoveryActivityType");
  v1[99] = CFSTR("HKMetadataKeyHeartRateRecoveryActivityDuration");
  v1[100] = CFSTR("HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate");
  v1[101] = CFSTR("HKMetadataKeySessionEstimate");
  v1[102] = CFSTR("_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion");
  v1[103] = CFSTR("_HKPrivateMetadataKeyHeartRateEventThreshold");
  v1[104] = CFSTR("_HKPrivateMetadataKeyHeartRateEventMinMaxHeartRates");
  v1[105] = CFSTR("_HKPrivateMetadataKeyHeartRateDiscordanceThreshold");
  v1[106] = CFSTR("_HKPrivateMetadataKeyRegulatedUpdateVersion");
  v1[107] = CFSTR("_HKPrivateActivitySummaryIndex");
  v1[108] = CFSTR("_HKPrivateExtractionFailureInfo");
  v1[109] = CFSTR("_HKPrivateOriginalSignedClinicalDataSyncIdentifier");
  v1[110] = CFSTR("_HKPrivateMetadataKeyOriginalFHIRResourceROWID");
  v1[111] = CFSTR("_HKPrivateMedicalRecordUUID");
  v1[112] = CFSTR("_HKPrivateMetadataKeyClassification");
  v1[113] = CFSTR("_HKPrivateMetadataKeyElectrocardiogramSymptoms");
  v1[114] = CFSTR("_HKPrivateMetadataKeyElectrocardiogramHeartRate");
  v1[115] = CFSTR("HKMetadataKeyAppleECGAlgorithmVersion");
  v1[116] = CFSTR("_HKPrivateMetadataKeyBackgroundAtrialFibrillationDetectionVersion");
  v1[117] = CFSTR("_HKPrivateWasEnteredFromCycleTracking");
  v1[118] = CFSTR("HKMetadataKeyAudioExposureLevel");
  v1[119] = CFSTR("HKMetadataKeyAudioExposureDuration");
  v1[120] = CFSTR("HKMetadataKeyHeadphoneGain");
  v1[121] = CFSTR("_HKPrivateMetadataKeyAudioExposureLimit");
  v1[122] = CFSTR("_HKPrivateMediaSourceBundleIdentifier");
  v1[123] = CFSTR("_HKPrivateMetadataKeyHeadphoneAudioDataIsTransient");
  v1[124] = CFSTR("_HKPrivateMetadataKeyNotificationIncludesPrunableData");
  v1[125] = CFSTR("_HKPrivateMetadataKeyRepeatNotification");
  v1[126] = CFSTR("HKMetadataKeyDevicePlacementSide");
  v1[127] = CFSTR("HKMetadataKeyAppleDeviceCalibrated");
  v1[128] = CFSTR("_HKPrivateAutomaticTimeZone");
  v1[129] = CFSTR("_HKPrivateFallActionRequested");
  v1[130] = CFSTR("_HKPrivateMetadataKeyUserOnBetaBlocker");
  v1[131] = CFSTR("_HKPrivateMetadataKeySessionUUID");
  v1[132] = CFSTR("_HKPrivateMetadataKeySessionIncomplete");
  v1[133] = CFSTR("HKMetadataKeyQuantityClampedToLowerBound");
  v1[134] = CFSTR("HKMetadataKeyQuantityClampedToUpperBound");
  v1[135] = CFSTR("_HKPrivateCoreMotionSourceIdentifier");
  v1[136] = CFSTR("_HKPrivateMetadataKeySkinSurfaceTemperature");
  v1[137] = CFSTR("_HKPrivateMetadataKeyInternalLiveOnAlgorithmVersion");
  v1[138] = CFSTR("HKMetadataKeyMaximumLightIntensity");
  v1[139] = CFSTR("HKMetadataKeyWaterSalinity");
  v1[140] = CFSTR("_HKPrivateMetadataKeyVisionACCPayload");
  v1[141] = CFSTR("_HKPrivateMetadataKeyVisionDeviceType");
  v1[142] = CFSTR("_HKPrivateMetadataKeyVisionColorCode");
  v1[143] = CFSTR("_HKPrivateMetadataKeyVisionSerialNumber");
  v1[144] = CFSTR("_HKPrivateMetadataMindfulnessSessionType");
  v1[145] = CFSTR("_HKPrivateMetadataKeyIsLastScheduledDose");
  v1[146] = CFSTR("_HKPrivateWorkoutSegmentEventSubtype");
  v1[147] = CFSTR("_HKPrivateMetadataSplitMeasuringSystem");
  v1[148] = CFSTR("_HKPrivateMetadataSplitDistanceQuantity");
  v1[149] = CFSTR("_HKPrivateMetadataSplitActiveDurationQuantity");
  v1[150] = CFSTR("_HKPrivateMetadataIsPartialSplit");
  v1[151] = CFSTR("_HKPrivateMetadataTotalDistanceQuantity");
  v1[152] = CFSTR("_HKPrivateWorkoutSegmentDistance");
  v1[153] = CFSTR("_HKPrivateWorkoutSegmentDuration");
  v1[154] = CFSTR("_HKPrivateWorkoutMarkerEventSubtype");
  v1[155] = CFSTR("_HKPrivateWorkoutSegmentActiveEnergyBurn");
  v1[156] = CFSTR("_HKPrivateWorkoutSegmentIndex");
  v1[157] = CFSTR("_HKPrivateWorkoutAverageHeartRate");
  v1[158] = CFSTR("_HKPrivateWorkoutMaxHeartRate");
  v1[159] = CFSTR("_HKPrivateWorkoutMinHeartRate");
  v1[160] = CFSTR("_HKPrivateMetadataSplitAveragePowerQuantity");
  v1[161] = CFSTR("_HKPrivateWorkoutMaxGroundElevation");
  v1[162] = CFSTR("_HKPrivateWorkoutMinGroundElevation");
  v1[163] = CFSTR("_HKPrivateWorkoutConfiguration");
  v1[164] = CFSTR("_HKPrivateWorkoutHeartRateZonesConfigurationType");
  v1[165] = CFSTR("_HKPrivateWorkoutHeartRateZones");
  v1[166] = CFSTR("_HKPrivateWorkoutElapsedTimeInHeartRateZones");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 167);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_buildDefaultDictionary
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  +[HKStringCache _initialStrings]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v0, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v1, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_DWORD)initInternal
{
  _DWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)HKStringCache;
  v1 = objc_msgSendSuper2(&v6, sel_init);
  v2 = v1;
  if (v1)
  {
    v1[2] = 0;
    +[HKStringCache _buildDefaultDictionary]();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

  }
  return v2;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_77);
  return (id)sharedCache_cache;
}

void __28__HKStringCache_sharedCache__block_invoke()
{
  _DWORD *v0;
  void *v1;

  v0 = -[HKStringCache initInternal]([HKStringCache alloc]);
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;

}

- (id)cachedStringIfAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stringCache");

  if ((v7 & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_cacheDictionary, "objectForKeyedSubscript:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v4;
    v11 = v10;

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (id)dictionaryReplacingKeysFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSDictionary *v8;
  void *v9;
  id v10;
  NSDictionary *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSDictionary *v16;
  id v17;

  v4 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stringCache");

  if ((v7 & 1) != 0)
  {
    v8 = self->_cacheDictionary;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__HKStringCache_dictionaryReplacingKeysFromDictionary___block_invoke;
    v15[3] = &unk_1E37F12F8;
    v16 = v8;
    v10 = v9;
    v17 = v10;
    v11 = v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v15);
    v12 = v17;
    v13 = v10;

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

void __55__HKStringCache_dictionaryReplacingKeysFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v10 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v7;
  else
    v8 = v10;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v9);
}

- (void)updateCacheWithStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *v11;
  NSDictionary *cacheDictionary;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_cacheDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cacheDictionary = self->_cacheDictionary;
  self->_cacheDictionary = v11;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)unittest_resetCache
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;
  NSDictionary *cacheDictionary;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[HKStringCache _buildDefaultDictionary]();
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cacheDictionary = self->_cacheDictionary;
  self->_cacheDictionary = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDictionary, 0);
}

@end
