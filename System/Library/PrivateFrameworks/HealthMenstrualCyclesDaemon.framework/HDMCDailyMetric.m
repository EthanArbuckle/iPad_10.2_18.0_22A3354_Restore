@implementation HDMCDailyMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.Daily");
}

- (HDMCDailyMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  HDMCDailyMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDMCDailyMetric;
  result = -[HDMCDailyMetric init](&v5, sel_init);
  if (result)
    result->_improveHealthAndActivityAllowed = a3;
  return result;
}

- (NSDictionary)eventPayload
{
  id v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HDMCDailyMetric age](self, "age");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("age"));

  -[HDMCDailyMetric _biologicalSexString](self, "_biologicalSexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("biologicalSex"));

  -[HDMCDailyMetric countPairediPhone](self, "countPairediPhone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD27C8]);

  -[HDMCDailyMetric countPairedWatch](self, "countPairedWatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD27D8]);

  -[HDMCDailyMetric countPairediPad](self, "countPairediPad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD27E0]);

  -[HDMCDailyMetric countPairedVisionPro](self, "countPairedVisionPro");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD27D0]);

  -[HDMCDailyMetric isSleepScheduleEnabled](self, "isSleepScheduleEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isSleepScheduleEnabled"));

  -[HDMCDailyMetric isSleepScreenEnabled](self, "isSleepScreenEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isSleepScreenEnabled"));

  -[HDMCDailyMetric cycleLengthVariationLowerPercentile](self, "cycleLengthVariationLowerPercentile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cycleLengthVariation15thPercentile"));

  -[HDMCDailyMetric cycleLengthVariationUpperPercentile](self, "cycleLengthVariationUpperPercentile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cycleLengthVariation85thPercentile"));

  -[HDMCDailyMetric hasCompatiblePairedAppleWatch](self, "hasCompatiblePairedAppleWatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasCompatiblePairedAppleWatch"));

  -[HDMCDailyMetric hasWristTemperatureCompatiblePairedWatch](self, "hasWristTemperatureCompatiblePairedWatch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasWristTemperatureCompatiblePairedWatch"));

  -[HDMCDailyMetric hasFirstPartySleepSamplesPast48Hours](self, "hasFirstPartySleepSamplesPast48Hours");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasFirstPartySleepSamplesPast48Hours"));

  -[HDMCDailyMetric hasSameAlgorithmVersionOnPairedWatch](self, "hasSameAlgorithmVersionOnPairedWatch");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasSameAlgorithmVersionOnPairedWatch"));

  -[HDMCDailyMetric hasSleepSamplesPast48Hours](self, "hasSleepSamplesPast48Hours");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasSleepSamplesPast48Hours"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDMCDailyMetric isImproveHealthAndActivityAllowed](self, "isImproveHealthAndActivityAllowed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isImproveHealthAndActivityAllowed"));

  -[HDMCDailyMetric areHealthNotificationsAuthorized](self, "areHealthNotificationsAuthorized");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("areHealthNotificationsAuthorized"));

  -[HDMCDailyMetric isOnboardingCompleted](self, "isOnboardingCompleted");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isOnboarded"));

  -[HDMCDailyMetric numberOfCyclesSinceLastDayOfLogging](self, "numberOfCyclesSinceLastDayOfLogging");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numberOfCyclesSinceLastDayOfLogging"));

  -[HDMCDailyMetric numberOfCyclesSinceLastDayOfLoggingInCycleTracking](self, "numberOfCyclesSinceLastDayOfLoggingInCycleTracking");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numberOfCyclesSinceLastDayOfLoggingInCycleTracking"));

  -[HDMCDailyMetric numberOfDailyAwakeHeartRateStatisticsForPast100Days](self, "numberOfDailyAwakeHeartRateStatisticsForPast100Days");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numberOfDailyAwakeHeartRateStatisticsForPast100Days"));

  -[HDMCDailyMetric numberOfDailySleepHeartRateStatisticsForPast100Days](self, "numberOfDailySleepHeartRateStatisticsForPast100Days");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfDailySleepHeartRateStatisticsForPast100Days"));

  -[HDMCDailyMetric numberOfDaysSinceLastFiredUpdateFertileWindowNotification](self, "numberOfDaysSinceLastFiredUpdateFertileWindowNotification");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numberOfDaysSinceLastFiredUpdateFertileWindowNotification"));

  -[HDMCDailyMetric onboardedVersion](self, "onboardedVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("onboardedVersion"));

  -[HDMCDailyMetric isOngoingContraception](self, "isOngoingContraception");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("ongoingContraception"));

  -[HDMCDailyMetric isOngoingLactation](self, "isOngoingLactation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("ongoingLactation"));

  -[HDMCDailyMetric isOngoingPregnancy](self, "isOngoingPregnancy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("ongoingPregnancy"));

  -[HDMCDailyMetric fertilityNotificationEnabled](self, "fertilityNotificationEnabled");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("settings_fertilityNotificationEnabled"));

  -[HDMCDailyMetric fertilityPredictionEnabled](self, "fertilityPredictionEnabled");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("settings_fertilityPredictionEnabled"));

  -[HDMCDailyMetric logBasalBodyTemperatureEnabled](self, "logBasalBodyTemperatureEnabled");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("settings_logBasalBodyTemperatureEnabled"));

  -[HDMCDailyMetric logCervicalMucusQualityEnabled](self, "logCervicalMucusQualityEnabled");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("settings_logCervicalMucusQualityEnabled"));

  -[HDMCDailyMetric logFactorsEnabled](self, "logFactorsEnabled");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("settings_logFactorsEnabled"));

  -[HDMCDailyMetric logOvulationTestResultEnabled](self, "logOvulationTestResultEnabled");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("settings_logOvulationTestResultEnabled"));

  -[HDMCDailyMetric logPregnancyTestResultEnabled](self, "logPregnancyTestResultEnabled");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("settings_logPregnancyTestResultEnabled"));

  -[HDMCDailyMetric logProgesteroneTestResultEnabled](self, "logProgesteroneTestResultEnabled");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("settings_logProgesteroneTestResultEnabled"));

  -[HDMCDailyMetric logSexualActivityEnabled](self, "logSexualActivityEnabled");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("settings_logSexualActivityEnabled"));

  -[HDMCDailyMetric logSpottingEnabled](self, "logSpottingEnabled");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("settings_logSpottingEnabled"));

  -[HDMCDailyMetric logSymptomsEnabled](self, "logSymptomsEnabled");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("settings_logSymptomsEnabled"));

  -[HDMCDailyMetric periodNotificationEnabled](self, "periodNotificationEnabled");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("settings_periodNotificationEnabled"));

  -[HDMCDailyMetric periodPredictionEnabled](self, "periodPredictionEnabled");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("settings_periodPredictionEnabled"));

  -[HDMCDailyMetric sensorBasedPredictionEnabled](self, "sensorBasedPredictionEnabled");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("settings_sensorBasedPredictionEnabled"));

  -[HDMCDailyMetric wristTemperatureBasedPredictionEnabled](self, "wristTemperatureBasedPredictionEnabled");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("settings_wristTemperatureBasedPredictionEnabled"));

  -[HDMCDailyMetric wasHeartRateInputDelivered](self, "wasHeartRateInputDelivered");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("wasHeartRateInputDelivered"));

  -[HDMCDailyMetric heartRateInputDeliveryCountryCode](self, "heartRateInputDeliveryCountryCode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("heartRateInputDeliveryCountryCode"));

  -[HDMCDailyMetric wasWristTemperatureInputDelivered](self, "wasWristTemperatureInputDelivered");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("wasWristTemperatureInputDelivered"));

  -[HDMCDailyMetric wristTemperatureInputDeliveryCountryCode](self, "wristTemperatureInputDeliveryCountryCode");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("wristTemperatureInputDeliveryCountryCode"));

  -[HDMCDailyMetric weeksSinceOnboarded](self, "weeksSinceOnboarded");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("weeksSinceOnboarded"));

  -[HDMCDailyMetric weeksSinceOnboarded](self, "weeksSinceOnboarded");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("weeksSinceOnboardedV2"));

  -[HDMCDailyMetric weeksSinceOnboardedWristTemperatureOvulationPrediction](self, "weeksSinceOnboardedWristTemperatureOvulationPrediction");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("weeksSinceOnboardedWristTempOvulationPrediction"));

  -[HDMCDailyMetric countWatchesWithWristTempMeasurementDataInLast45Days](self, "countWatchesWithWristTempMeasurementDataInLast45Days");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("countWatchesWithWristTempMeasurementDataInLast45Days"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles](self, "countWristTempEligibleHistoricalCycles");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("countWristTempEligibleHistoricalCycles"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles_ConfirmedOPK](self, "countWristTempEligibleHistoricalCycles_ConfirmedOPK");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("countWristTempEligibleHistoricalCycles_ConfirmedOPK"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles_ConfirmedWristTemp](self, "countWristTempEligibleHistoricalCycles_ConfirmedWristTemp");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("countWristTempEligibleHistoricalCycles_ConfirmedWristTemp"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles_FailedAvailability](self, "countWristTempEligibleHistoricalCycles_FailedAvailability");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("countWristTempEligibleHistoricalCycles_FailedAvailability"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles_FailedNoise](self, "countWristTempEligibleHistoricalCycles_FailedNoise");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("countWristTempEligibleHistoricalCycles_FailedNoise"));

  -[HDMCDailyMetric countWristTempEligibleHistoricalCycles_FailedOther](self, "countWristTempEligibleHistoricalCycles_FailedOther");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("countWristTempEligibleHistoricalCycles_FailedOther"));

  -[HDMCDailyMetric daysBeforeFertileWindowEnd](self, "daysBeforeFertileWindowEnd");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("daysBeforeFertileWindowEnd"));

  -[HDMCDailyMetric daysBeforeMostLikelyPeriodPredictionStart](self, "daysBeforeMostLikelyPeriodPredictionStart");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("daysBeforeMostLikelyPeriodPredictionStart"));

  -[HDMCDailyMetric daysFertileWindowShifted](self, "daysFertileWindowShifted");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("daysFertileWindowShifted"));

  -[HDMCDailyMetric daysFirstPeriodPredictionShifted](self, "daysFirstPeriodPredictionShifted");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("daysFirstPeriodPredictionShifted"));

  -[HDMCDailyMetric daysSinceCycleStart](self, "daysSinceCycleStart");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("daysSinceCycleStart"));

  -[HDMCDailyMetric didFirstPeriodPredictionShift](self, "didFirstPeriodPredictionShift");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("didFirstPeriodPredictionShift"));

  -[HDMCDailyMetric predictionPrimarySourceTypeFertileWindow](self, "predictionPrimarySourceTypeFertileWindow");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("predictionPrimarySourceTypeFertileWindow"));

  -[HDMCDailyMetric predictionPrimarySourceTypeFirstPeriodPrediction](self, "predictionPrimarySourceTypeFirstPeriodPrediction");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("predictionPrimarySourceTypeFirstPeriodPrediction"));

  -[HDMCDailyMetric daysWithWristTempIn10DaysBeforeCalendarOvulation](self, "daysWithWristTempIn10DaysBeforeCalendarOvulation");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("daysWithWristTempIn10DaysBeforeCalendarOvulation"));

  -[HDMCDailyMetric daysWithWristTempIn6DaysBeforeCalendarOvulation](self, "daysWithWristTempIn6DaysBeforeCalendarOvulation");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("daysWithWristTempIn6DaysBeforeCalendarOvulation"));

  -[HDMCDailyMetric daysWithWristTempIn3DaysAfterCalendarOvulation](self, "daysWithWristTempIn3DaysAfterCalendarOvulation");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("daysWithWristTempIn3DaysAfterCalendarOvulation"));

  -[HDMCDailyMetric daysWithWristTempIn6DaysAfterCalendarOvulation](self, "daysWithWristTempIn6DaysAfterCalendarOvulation");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("daysWithWristTempIn6DaysAfterCalendarOvulation"));

  -[HDMCDailyMetric daysWithWristTempIn10DaysAfterOvulation](self, "daysWithWristTempIn10DaysAfterOvulation");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("daysWithWristTempIn10DaysAfterOvulation"));

  -[HDMCDailyMetric daysWithWristTempIn45DaysBeforeFertileWindowEnd](self, "daysWithWristTempIn45DaysBeforeFertileWindowEnd");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("daysWithWristTempIn45DaysBeforeFertileWindowEnd"));

  -[HDMCDailyMetric daysWithWristTempInPast45Days](self, "daysWithWristTempInPast45Days");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("daysWithWristTempInPast45Days"));

  -[HDMCDailyMetric daysWornWatchToSleepInLast45Days](self, "daysWornWatchToSleepInLast45Days");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("daysWornWatchToSleepInLast45Days"));

  -[HDMCDailyMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("internalLiveOnCycleFactorOverride"));

  -[HDMCDailyMetric isSleepConfiguredToAllowWristTemperatureMeasurements](self, "isSleepConfiguredToAllowWristTemperatureMeasurements");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("isSleepConfiguredToAllowWristTemperatureMeasurements"));

  -[HDMCDailyMetric wasDeviationDetectionDelivered](self, "wasDeviationDetectionDelivered");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("wasCycleDeviationsDelivered"));

  -[HDMCDailyMetric countConfirmedInfrequentDeviationPastYear](self, "countConfirmedInfrequentDeviationPastYear");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("countConfirmedInfrequentDeviationsPastYear"));

  -[HDMCDailyMetric countConfirmedIrregularDeviationPastYear](self, "countConfirmedIrregularDeviationPastYear");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("countConfirmedIrregularDeviationsInPastYear"));

  -[HDMCDailyMetric countConfirmedProlongedDeviationPastYear](self, "countConfirmedProlongedDeviationPastYear");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("countConfirmedProlongedDeviationsPastYear"));

  -[HDMCDailyMetric countConfirmedSpottingDeviationPastYear](self, "countConfirmedSpottingDeviationPastYear");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("countConfirmedSpottingDeviationsPastYear"));

  -[HDMCDailyMetric countTotalConfirmedDeviationsPastYear](self, "countTotalConfirmedDeviationsPastYear");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("countTotalConfirmedDeviationsPastYear"));

  -[HDMCDailyMetric hasConfirmedInfrequentDeviationPastMonth](self, "hasConfirmedInfrequentDeviationPastMonth");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("hasConfirmedInfrequentDeviationPastMonth"));

  -[HDMCDailyMetric hasConfirmedIrregularDeviationPastMonth](self, "hasConfirmedIrregularDeviationPastMonth");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("hasConfirmedIrregularDeviationPastMonth"));

  -[HDMCDailyMetric hasConfirmedProlongedDeviationPastMonth](self, "hasConfirmedProlongedDeviationPastMonth");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("hasConfirmedProlongedDeviationPastMonth"));

  -[HDMCDailyMetric hasConfirmedSpottingDeviationPastMonth](self, "hasConfirmedSpottingDeviationPastMonth");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("hasConfirmedSpottingDeviationPastMonth"));

  -[HDMCDailyMetric countTotalConfirmedDeviationsPastMonth](self, "countTotalConfirmedDeviationsPastMonth");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("countTotalConfirmedDeviationsPastMonth"));

  -[HDMCDailyMetric countDetectedSpottingDeviationsPastYear](self, "countDetectedSpottingDeviationsPastYear");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("countDetectedSpottingDeviationsPastYear"));

  -[HDMCDailyMetric countDetectedProlongedDeviationsPastYear](self, "countDetectedProlongedDeviationsPastYear");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("countDetectedProlongedDeviationsPastYear"));

  -[HDMCDailyMetric countDetectedIrregularDeviationsInPastYear](self, "countDetectedIrregularDeviationsInPastYear");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("countDetectedIrregularDeviationsInPastYear"));

  -[HDMCDailyMetric countDetectedInfrequentDeviationsPastYear](self, "countDetectedInfrequentDeviationsPastYear");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("countDetectedInfrequentDeviationsPastYear"));

  -[HDMCDailyMetric countTotalDetectedDeviationsPastMonth](self, "countTotalDetectedDeviationsPastMonth");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("countTotalDetectedDeviationsPastMonth"));

  -[HDMCDailyMetric countTotalDetectedDeviationsPastYear](self, "countTotalDetectedDeviationsPastYear");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("countTotalDetectedDeviationsPastYear"));

  -[HDMCDailyMetric daysSinceDeviationTilePosted](self, "daysSinceDeviationTilePosted");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("daysSinceDeviationTilePosted"));

  -[HDMCDailyMetric deviationDetectionProlongedEnabled](self, "deviationDetectionProlongedEnabled");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("settings_prolongedDeviationEnabled"));

  -[HDMCDailyMetric deviationDetectionSpottingEnabled](self, "deviationDetectionSpottingEnabled");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("settings_spottingDeviationEnabled"));

  -[HDMCDailyMetric deviationDetectionInfrequentEnabled](self, "deviationDetectionInfrequentEnabled");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("settings_infrequentDeviationEnabled"));

  -[HDMCDailyMetric deviationDetectionIrregularEnabled](self, "deviationDetectionIrregularEnabled");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("settings_irregularDeviationEnabled"));

  -[HDMCDailyMetric isEligibleForCycleFactorsReminder](self, "isEligibleForCycleFactorsReminder");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("isEligibleForCycleFactorsReminder"));

  -[HDMCDailyMetric activeWatchProductType](self, "activeWatchProductType");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("activeWatchProductType"));

  -[HDMCDailyMetric gestationalAge](self, "gestationalAge");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("gestationalAge"));

  -[HDMCDailyMetric pregnancyModeState](self, "pregnancyModeState");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("pregnancyModeState"));

  -[HDMCDailyMetric hasOnboardedPregnancyMode](self, "hasOnboardedPregnancyMode");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("hasOnboardedPregnancyMode"));

  -[HDMCDailyMetric hasPregnancyInMedicalID](self, "hasPregnancyInMedicalID");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("hasPregnancyInMedicalID"));

  -[HDMCDailyMetric weeksSinceOnboardedPregnancyMode](self, "weeksSinceOnboardedPregnancyMode");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("weeksSinceOnboardedPregnancyMode"));

  v107 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v107;
}

- (id)_biologicalSexString
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HDMCDailyMetric biologicalSex](self, "biologicalSex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[HDMCDailyMetric biologicalSex](self, "biologicalSex"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "integerValue"),
        v4,
        v5 <= 3))
  {
    return off_24DB22670[v5];
  }
  else
  {
    return 0;
  }
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSNumber)isOnboardingCompleted
{
  return self->_onboardingCompleted;
}

- (void)setOnboardingCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingCompleted, a3);
}

- (NSNumber)onboardedVersion
{
  return self->_onboardedVersion;
}

- (void)setOnboardedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_onboardedVersion, a3);
}

- (NSNumber)weeksSinceOnboarded
{
  return self->_weeksSinceOnboarded;
}

- (void)setWeeksSinceOnboarded:(id)a3
{
  objc_storeStrong((id *)&self->_weeksSinceOnboarded, a3);
}

- (NSNumber)hasCompatiblePairedAppleWatch
{
  return self->_hasCompatiblePairedAppleWatch;
}

- (void)setHasCompatiblePairedAppleWatch:(id)a3
{
  objc_storeStrong((id *)&self->_hasCompatiblePairedAppleWatch, a3);
}

- (NSNumber)hasSameAlgorithmVersionOnPairedWatch
{
  return self->_hasSameAlgorithmVersionOnPairedWatch;
}

- (void)setHasSameAlgorithmVersionOnPairedWatch:(id)a3
{
  objc_storeStrong((id *)&self->_hasSameAlgorithmVersionOnPairedWatch, a3);
}

- (NSNumber)wasHeartRateInputDelivered
{
  return self->_wasHeartRateInputDelivered;
}

- (void)setWasHeartRateInputDelivered:(id)a3
{
  objc_storeStrong((id *)&self->_wasHeartRateInputDelivered, a3);
}

- (NSNumber)wasDeviationDetectionDelivered
{
  return self->_wasDeviationDetectionDelivered;
}

- (void)setWasDeviationDetectionDelivered:(id)a3
{
  objc_storeStrong((id *)&self->_wasDeviationDetectionDelivered, a3);
}

- (NSString)heartRateInputDeliveryCountryCode
{
  return self->_heartRateInputDeliveryCountryCode;
}

- (void)setHeartRateInputDeliveryCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateInputDeliveryCountryCode, a3);
}

- (NSNumber)wasWristTemperatureInputDelivered
{
  return self->_wasWristTemperatureInputDelivered;
}

- (void)setWasWristTemperatureInputDelivered:(id)a3
{
  objc_storeStrong((id *)&self->_wasWristTemperatureInputDelivered, a3);
}

- (NSString)wristTemperatureInputDeliveryCountryCode
{
  return self->_wristTemperatureInputDeliveryCountryCode;
}

- (void)setWristTemperatureInputDeliveryCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_wristTemperatureInputDeliveryCountryCode, a3);
}

- (NSNumber)daysWithWristTempIn45DaysBeforeFertileWindowEnd
{
  return self->_daysWithWristTempIn45DaysBeforeFertileWindowEnd;
}

- (void)setDaysWithWristTempIn45DaysBeforeFertileWindowEnd:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn45DaysBeforeFertileWindowEnd, a3);
}

- (NSNumber)daysWithWristTempInPast45Days
{
  return self->_daysWithWristTempInPast45Days;
}

- (void)setDaysWithWristTempInPast45Days:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempInPast45Days, a3);
}

- (NSNumber)daysWornWatchToSleepInLast45Days
{
  return self->_daysWornWatchToSleepInLast45Days;
}

- (void)setDaysWornWatchToSleepInLast45Days:(id)a3
{
  objc_storeStrong((id *)&self->_daysWornWatchToSleepInLast45Days, a3);
}

- (NSNumber)countWatchesWithWristTempMeasurementDataInLast45Days
{
  return self->_countWatchesWithWristTempMeasurementDataInLast45Days;
}

- (void)setCountWatchesWithWristTempMeasurementDataInLast45Days:(id)a3
{
  objc_storeStrong((id *)&self->_countWatchesWithWristTempMeasurementDataInLast45Days, a3);
}

- (NSNumber)hasWristTemperatureCompatiblePairedWatch
{
  return self->_hasWristTemperatureCompatiblePairedWatch;
}

- (void)setHasWristTemperatureCompatiblePairedWatch:(id)a3
{
  objc_storeStrong((id *)&self->_hasWristTemperatureCompatiblePairedWatch, a3);
}

- (NSNumber)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, a3);
}

- (NSNumber)isSleepConfiguredToAllowWristTemperatureMeasurements
{
  return self->_isSleepConfiguredToAllowWristTemperatureMeasurements;
}

- (void)setIsSleepConfiguredToAllowWristTemperatureMeasurements:(id)a3
{
  objc_storeStrong((id *)&self->_isSleepConfiguredToAllowWristTemperatureMeasurements, a3);
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, a3);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
  objc_storeStrong((id *)&self->_biologicalSex, a3);
}

- (NSNumber)countPairediPhone
{
  return self->_countPairediPhone;
}

- (void)setCountPairediPhone:(id)a3
{
  objc_storeStrong((id *)&self->_countPairediPhone, a3);
}

- (NSNumber)countPairedWatch
{
  return self->_countPairedWatch;
}

- (void)setCountPairedWatch:(id)a3
{
  objc_storeStrong((id *)&self->_countPairedWatch, a3);
}

- (NSNumber)countPairediPad
{
  return self->_countPairediPad;
}

- (void)setCountPairediPad:(id)a3
{
  objc_storeStrong((id *)&self->_countPairediPad, a3);
}

- (NSNumber)countPairedVisionPro
{
  return self->_countPairedVisionPro;
}

- (void)setCountPairedVisionPro:(id)a3
{
  objc_storeStrong((id *)&self->_countPairedVisionPro, a3);
}

- (NSNumber)isSleepScheduleEnabled
{
  return self->_isSleepScheduleEnabled;
}

- (void)setIsSleepScheduleEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_isSleepScheduleEnabled, a3);
}

- (NSNumber)isSleepScreenEnabled
{
  return self->_isSleepScreenEnabled;
}

- (void)setIsSleepScreenEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_isSleepScreenEnabled, a3);
}

- (NSNumber)numberOfCyclesSinceLastDayOfLogging
{
  return self->_numberOfCyclesSinceLastDayOfLogging;
}

- (void)setNumberOfCyclesSinceLastDayOfLogging:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLogging, a3);
}

- (NSNumber)numberOfCyclesSinceLastDayOfLoggingInCycleTracking
{
  return self->_numberOfCyclesSinceLastDayOfLoggingInCycleTracking;
}

- (void)setNumberOfCyclesSinceLastDayOfLoggingInCycleTracking:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLoggingInCycleTracking, a3);
}

- (NSNumber)isOngoingContraception
{
  return self->_ongoingContraception;
}

- (void)setOngoingContraception:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingContraception, a3);
}

- (NSNumber)isOngoingLactation
{
  return self->_ongoingLactation;
}

- (void)setOngoingLactation:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingLactation, a3);
}

- (NSNumber)isOngoingPregnancy
{
  return self->_ongoingPregnancy;
}

- (void)setOngoingPregnancy:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingPregnancy, a3);
}

- (NSNumber)cycleLengthVariationLowerPercentile
{
  return self->_cycleLengthVariationLowerPercentile;
}

- (void)setCycleLengthVariationLowerPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_cycleLengthVariationLowerPercentile, a3);
}

- (NSNumber)cycleLengthVariationUpperPercentile
{
  return self->_cycleLengthVariationUpperPercentile;
}

- (void)setCycleLengthVariationUpperPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_cycleLengthVariationUpperPercentile, a3);
}

- (NSNumber)numberOfDaysSinceLastFiredUpdateFertileWindowNotification
{
  return self->_numberOfDaysSinceLastFiredUpdateFertileWindowNotification;
}

- (void)setNumberOfDaysSinceLastFiredUpdateFertileWindowNotification:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDaysSinceLastFiredUpdateFertileWindowNotification, a3);
}

- (NSNumber)numberOfDailySleepHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailySleepHeartRateStatisticsForPast100Days;
}

- (void)setNumberOfDailySleepHeartRateStatisticsForPast100Days:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDailySleepHeartRateStatisticsForPast100Days, a3);
}

- (NSNumber)numberOfDailyAwakeHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days;
}

- (void)setNumberOfDailyAwakeHeartRateStatisticsForPast100Days:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles
{
  return self->_countWristTempEligibleHistoricalCycles;
}

- (void)setCountWristTempEligibleHistoricalCycles:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedOPK
{
  return self->_countWristTempEligibleHistoricalCycles_ConfirmedOPK;
}

- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedOPK:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedOPK, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedWristTemp
{
  return self->_countWristTempEligibleHistoricalCycles_ConfirmedWristTemp;
}

- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedWristTemp:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedWristTemp, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedAvailability
{
  return self->_countWristTempEligibleHistoricalCycles_FailedAvailability;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedAvailability, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedNoise
{
  return self->_countWristTempEligibleHistoricalCycles_FailedNoise;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedNoise:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedNoise, a3);
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedOther
{
  return self->_countWristTempEligibleHistoricalCycles_FailedOther;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedOther:(id)a3
{
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedOther, a3);
}

- (NSNumber)daysBeforeFertileWindowEnd
{
  return self->_daysBeforeFertileWindowEnd;
}

- (void)setDaysBeforeFertileWindowEnd:(id)a3
{
  objc_storeStrong((id *)&self->_daysBeforeFertileWindowEnd, a3);
}

- (NSNumber)daysBeforeMostLikelyPeriodPredictionStart
{
  return self->_daysBeforeMostLikelyPeriodPredictionStart;
}

- (void)setDaysBeforeMostLikelyPeriodPredictionStart:(id)a3
{
  objc_storeStrong((id *)&self->_daysBeforeMostLikelyPeriodPredictionStart, a3);
}

- (NSNumber)daysFertileWindowShifted
{
  return self->_daysFertileWindowShifted;
}

- (void)setDaysFertileWindowShifted:(id)a3
{
  objc_storeStrong((id *)&self->_daysFertileWindowShifted, a3);
}

- (NSNumber)daysFirstPeriodPredictionShifted
{
  return self->_daysFirstPeriodPredictionShifted;
}

- (void)setDaysFirstPeriodPredictionShifted:(id)a3
{
  objc_storeStrong((id *)&self->_daysFirstPeriodPredictionShifted, a3);
}

- (NSNumber)daysSinceCycleStart
{
  return self->_daysSinceCycleStart;
}

- (void)setDaysSinceCycleStart:(id)a3
{
  objc_storeStrong((id *)&self->_daysSinceCycleStart, a3);
}

- (NSNumber)daysWithWristTempIn10DaysBeforeCalendarOvulation
{
  return self->_daysWithWristTempIn10DaysBeforeCalendarOvulation;
}

- (void)setDaysWithWristTempIn10DaysBeforeCalendarOvulation:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysBeforeCalendarOvulation, a3);
}

- (NSNumber)daysWithWristTempIn6DaysBeforeCalendarOvulation
{
  return self->_daysWithWristTempIn6DaysBeforeCalendarOvulation;
}

- (void)setDaysWithWristTempIn6DaysBeforeCalendarOvulation:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysBeforeCalendarOvulation, a3);
}

- (NSNumber)daysWithWristTempIn3DaysAfterCalendarOvulation
{
  return self->_daysWithWristTempIn3DaysAfterCalendarOvulation;
}

- (void)setDaysWithWristTempIn3DaysAfterCalendarOvulation:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn3DaysAfterCalendarOvulation, a3);
}

- (NSNumber)daysWithWristTempIn6DaysAfterCalendarOvulation
{
  return self->_daysWithWristTempIn6DaysAfterCalendarOvulation;
}

- (void)setDaysWithWristTempIn6DaysAfterCalendarOvulation:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysAfterCalendarOvulation, a3);
}

- (NSNumber)daysWithWristTempIn10DaysAfterOvulation
{
  return self->_daysWithWristTempIn10DaysAfterOvulation;
}

- (void)setDaysWithWristTempIn10DaysAfterOvulation:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysAfterOvulation, a3);
}

- (NSNumber)didFirstPeriodPredictionShift
{
  return self->_didFirstPeriodPredictionShift;
}

- (void)setDidFirstPeriodPredictionShift:(id)a3
{
  objc_storeStrong((id *)&self->_didFirstPeriodPredictionShift, a3);
}

- (NSString)predictionPrimarySourceTypeFertileWindow
{
  return self->_predictionPrimarySourceTypeFertileWindow;
}

- (void)setPredictionPrimarySourceTypeFertileWindow:(id)a3
{
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFertileWindow, a3);
}

- (NSString)predictionPrimarySourceTypeFirstPeriodPrediction
{
  return self->_predictionPrimarySourceTypeFirstPeriodPrediction;
}

- (void)setPredictionPrimarySourceTypeFirstPeriodPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFirstPeriodPrediction, a3);
}

- (NSNumber)weeksSinceOnboardedWristTemperatureOvulationPrediction
{
  return self->_weeksSinceOnboardedWristTemperatureOvulationPrediction;
}

- (void)setWeeksSinceOnboardedWristTemperatureOvulationPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_weeksSinceOnboardedWristTemperatureOvulationPrediction, a3);
}

- (NSNumber)periodPredictionEnabled
{
  return self->_periodPredictionEnabled;
}

- (void)setPeriodPredictionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_periodPredictionEnabled, a3);
}

- (NSNumber)periodNotificationEnabled
{
  return self->_periodNotificationEnabled;
}

- (void)setPeriodNotificationEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_periodNotificationEnabled, a3);
}

- (NSNumber)fertilityPredictionEnabled
{
  return self->_fertilityPredictionEnabled;
}

- (void)setFertilityPredictionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_fertilityPredictionEnabled, a3);
}

- (NSNumber)fertilityNotificationEnabled
{
  return self->_fertilityNotificationEnabled;
}

- (void)setFertilityNotificationEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_fertilityNotificationEnabled, a3);
}

- (NSNumber)deviationDetectionIrregularEnabled
{
  return self->_deviationDetectionIrregularEnabled;
}

- (void)setDeviationDetectionIrregularEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_deviationDetectionIrregularEnabled, a3);
}

- (NSNumber)deviationDetectionInfrequentEnabled
{
  return self->_deviationDetectionInfrequentEnabled;
}

- (void)setDeviationDetectionInfrequentEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_deviationDetectionInfrequentEnabled, a3);
}

- (NSNumber)deviationDetectionSpottingEnabled
{
  return self->_deviationDetectionSpottingEnabled;
}

- (void)setDeviationDetectionSpottingEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_deviationDetectionSpottingEnabled, a3);
}

- (NSNumber)deviationDetectionProlongedEnabled
{
  return self->_deviationDetectionProlongedEnabled;
}

- (void)setDeviationDetectionProlongedEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_deviationDetectionProlongedEnabled, a3);
}

- (NSNumber)sensorBasedPredictionEnabled
{
  return self->_sensorBasedPredictionEnabled;
}

- (void)setSensorBasedPredictionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_sensorBasedPredictionEnabled, a3);
}

- (NSNumber)wristTemperatureBasedPredictionEnabled
{
  return self->_wristTemperatureBasedPredictionEnabled;
}

- (void)setWristTemperatureBasedPredictionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_wristTemperatureBasedPredictionEnabled, a3);
}

- (NSNumber)logFactorsEnabled
{
  return self->_logFactorsEnabled;
}

- (void)setLogFactorsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logFactorsEnabled, a3);
}

- (NSNumber)logSymptomsEnabled
{
  return self->_logSymptomsEnabled;
}

- (void)setLogSymptomsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logSymptomsEnabled, a3);
}

- (NSNumber)logSpottingEnabled
{
  return self->_logSpottingEnabled;
}

- (void)setLogSpottingEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logSpottingEnabled, a3);
}

- (NSNumber)logSexualActivityEnabled
{
  return self->_logSexualActivityEnabled;
}

- (void)setLogSexualActivityEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logSexualActivityEnabled, a3);
}

- (NSNumber)logCervicalMucusQualityEnabled
{
  return self->_logCervicalMucusQualityEnabled;
}

- (void)setLogCervicalMucusQualityEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logCervicalMucusQualityEnabled, a3);
}

- (NSNumber)logBasalBodyTemperatureEnabled
{
  return self->_logBasalBodyTemperatureEnabled;
}

- (void)setLogBasalBodyTemperatureEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logBasalBodyTemperatureEnabled, a3);
}

- (NSNumber)logOvulationTestResultEnabled
{
  return self->_logOvulationTestResultEnabled;
}

- (void)setLogOvulationTestResultEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logOvulationTestResultEnabled, a3);
}

- (NSNumber)logPregnancyTestResultEnabled
{
  return self->_logPregnancyTestResultEnabled;
}

- (void)setLogPregnancyTestResultEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logPregnancyTestResultEnabled, a3);
}

- (NSNumber)logProgesteroneTestResultEnabled
{
  return self->_logProgesteroneTestResultEnabled;
}

- (void)setLogProgesteroneTestResultEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_logProgesteroneTestResultEnabled, a3);
}

- (NSNumber)hasFirstPartySleepSamplesPast48Hours
{
  return self->_hasFirstPartySleepSamplesPast48Hours;
}

- (void)setHasFirstPartySleepSamplesPast48Hours:(id)a3
{
  objc_storeStrong((id *)&self->_hasFirstPartySleepSamplesPast48Hours, a3);
}

- (NSNumber)hasSleepSamplesPast48Hours
{
  return self->_hasSleepSamplesPast48Hours;
}

- (void)setHasSleepSamplesPast48Hours:(id)a3
{
  objc_storeStrong((id *)&self->_hasSleepSamplesPast48Hours, a3);
}

- (NSNumber)countConfirmedProlongedDeviationPastYear
{
  return self->_countConfirmedProlongedDeviationPastYear;
}

- (void)setCountConfirmedProlongedDeviationPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countConfirmedProlongedDeviationPastYear, a3);
}

- (NSNumber)countConfirmedInfrequentDeviationPastYear
{
  return self->_countConfirmedInfrequentDeviationPastYear;
}

- (void)setCountConfirmedInfrequentDeviationPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countConfirmedInfrequentDeviationPastYear, a3);
}

- (NSNumber)countConfirmedIrregularDeviationPastYear
{
  return self->_countConfirmedIrregularDeviationPastYear;
}

- (void)setCountConfirmedIrregularDeviationPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countConfirmedIrregularDeviationPastYear, a3);
}

- (NSNumber)countConfirmedSpottingDeviationPastYear
{
  return self->_countConfirmedSpottingDeviationPastYear;
}

- (void)setCountConfirmedSpottingDeviationPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countConfirmedSpottingDeviationPastYear, a3);
}

- (NSNumber)hasConfirmedProlongedDeviationPastMonth
{
  return self->_hasConfirmedProlongedDeviationPastMonth;
}

- (void)setHasConfirmedProlongedDeviationPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_hasConfirmedProlongedDeviationPastMonth, a3);
}

- (NSNumber)hasConfirmedInfrequentDeviationPastMonth
{
  return self->_hasConfirmedInfrequentDeviationPastMonth;
}

- (void)setHasConfirmedInfrequentDeviationPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_hasConfirmedInfrequentDeviationPastMonth, a3);
}

- (NSNumber)hasConfirmedIrregularDeviationPastMonth
{
  return self->_hasConfirmedIrregularDeviationPastMonth;
}

- (void)setHasConfirmedIrregularDeviationPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_hasConfirmedIrregularDeviationPastMonth, a3);
}

- (NSNumber)hasConfirmedSpottingDeviationPastMonth
{
  return self->_hasConfirmedSpottingDeviationPastMonth;
}

- (void)setHasConfirmedSpottingDeviationPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_hasConfirmedSpottingDeviationPastMonth, a3);
}

- (NSNumber)countTotalConfirmedDeviationsPastMonth
{
  return self->_countTotalConfirmedDeviationsPastMonth;
}

- (void)setCountTotalConfirmedDeviationsPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastMonth, a3);
}

- (NSNumber)countTotalConfirmedDeviationsPastYear
{
  return self->_countTotalConfirmedDeviationsPastYear;
}

- (void)setCountTotalConfirmedDeviationsPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastYear, a3);
}

- (NSNumber)countDetectedInfrequentDeviationsPastYear
{
  return self->_countDetectedInfrequentDeviationsPastYear;
}

- (void)setCountDetectedInfrequentDeviationsPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countDetectedInfrequentDeviationsPastYear, a3);
}

- (NSNumber)countDetectedIrregularDeviationsInPastYear
{
  return self->_countDetectedIrregularDeviationsInPastYear;
}

- (void)setCountDetectedIrregularDeviationsInPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countDetectedIrregularDeviationsInPastYear, a3);
}

- (NSNumber)countDetectedProlongedDeviationsPastYear
{
  return self->_countDetectedProlongedDeviationsPastYear;
}

- (void)setCountDetectedProlongedDeviationsPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countDetectedProlongedDeviationsPastYear, a3);
}

- (NSNumber)countDetectedSpottingDeviationsPastYear
{
  return self->_countDetectedSpottingDeviationsPastYear;
}

- (void)setCountDetectedSpottingDeviationsPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countDetectedSpottingDeviationsPastYear, a3);
}

- (NSNumber)countTotalDetectedDeviationsPastMonth
{
  return self->_countTotalDetectedDeviationsPastMonth;
}

- (void)setCountTotalDetectedDeviationsPastMonth:(id)a3
{
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastMonth, a3);
}

- (NSNumber)countTotalDetectedDeviationsPastYear
{
  return self->_countTotalDetectedDeviationsPastYear;
}

- (void)setCountTotalDetectedDeviationsPastYear:(id)a3
{
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastYear, a3);
}

- (NSNumber)daysSinceDeviationTilePosted
{
  return self->_daysSinceDeviationTilePosted;
}

- (void)setDaysSinceDeviationTilePosted:(id)a3
{
  objc_storeStrong((id *)&self->_daysSinceDeviationTilePosted, a3);
}

- (NSNumber)isEligibleForCycleFactorsReminder
{
  return self->_isEligibleForCycleFactorsReminder;
}

- (void)setIsEligibleForCycleFactorsReminder:(id)a3
{
  objc_storeStrong((id *)&self->_isEligibleForCycleFactorsReminder, a3);
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
  objc_storeStrong((id *)&self->_activeWatchProductType, a3);
}

- (NSNumber)gestationalAge
{
  return self->_gestationalAge;
}

- (void)setGestationalAge:(id)a3
{
  objc_storeStrong((id *)&self->_gestationalAge, a3);
}

- (NSNumber)pregnancyModeState
{
  return self->_pregnancyModeState;
}

- (void)setPregnancyModeState:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyModeState, a3);
}

- (NSNumber)hasOnboardedPregnancyMode
{
  return self->_hasOnboardedPregnancyMode;
}

- (void)setHasOnboardedPregnancyMode:(id)a3
{
  objc_storeStrong((id *)&self->_hasOnboardedPregnancyMode, a3);
}

- (NSNumber)hasPregnancyInMedicalID
{
  return self->_hasPregnancyInMedicalID;
}

- (void)setHasPregnancyInMedicalID:(id)a3
{
  objc_storeStrong((id *)&self->_hasPregnancyInMedicalID, a3);
}

- (NSNumber)weeksSinceOnboardedPregnancyMode
{
  return self->_weeksSinceOnboardedPregnancyMode;
}

- (void)setWeeksSinceOnboardedPregnancyMode:(id)a3
{
  objc_storeStrong((id *)&self->_weeksSinceOnboardedPregnancyMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeksSinceOnboardedPregnancyMode, 0);
  objc_storeStrong((id *)&self->_hasPregnancyInMedicalID, 0);
  objc_storeStrong((id *)&self->_hasOnboardedPregnancyMode, 0);
  objc_storeStrong((id *)&self->_pregnancyModeState, 0);
  objc_storeStrong((id *)&self->_gestationalAge, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_isEligibleForCycleFactorsReminder, 0);
  objc_storeStrong((id *)&self->_daysSinceDeviationTilePosted, 0);
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastMonth, 0);
  objc_storeStrong((id *)&self->_countDetectedSpottingDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedProlongedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedIrregularDeviationsInPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedInfrequentDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedSpottingDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedIrregularDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedInfrequentDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedProlongedDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_countConfirmedSpottingDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedIrregularDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedInfrequentDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedProlongedDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_hasSleepSamplesPast48Hours, 0);
  objc_storeStrong((id *)&self->_hasFirstPartySleepSamplesPast48Hours, 0);
  objc_storeStrong((id *)&self->_logProgesteroneTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logPregnancyTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logOvulationTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logBasalBodyTemperatureEnabled, 0);
  objc_storeStrong((id *)&self->_logCervicalMucusQualityEnabled, 0);
  objc_storeStrong((id *)&self->_logSexualActivityEnabled, 0);
  objc_storeStrong((id *)&self->_logSpottingEnabled, 0);
  objc_storeStrong((id *)&self->_logSymptomsEnabled, 0);
  objc_storeStrong((id *)&self->_logFactorsEnabled, 0);
  objc_storeStrong((id *)&self->_wristTemperatureBasedPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_sensorBasedPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionProlongedEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionSpottingEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionInfrequentEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionIrregularEnabled, 0);
  objc_storeStrong((id *)&self->_fertilityNotificationEnabled, 0);
  objc_storeStrong((id *)&self->_fertilityPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_periodNotificationEnabled, 0);
  objc_storeStrong((id *)&self->_periodPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedWristTemperatureOvulationPrediction, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFirstPeriodPrediction, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFertileWindow, 0);
  objc_storeStrong((id *)&self->_didFirstPeriodPredictionShift, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysAfterOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysAfterCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn3DaysAfterCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysBeforeCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysBeforeCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysSinceCycleStart, 0);
  objc_storeStrong((id *)&self->_daysFirstPeriodPredictionShifted, 0);
  objc_storeStrong((id *)&self->_daysFertileWindowShifted, 0);
  objc_storeStrong((id *)&self->_daysBeforeMostLikelyPeriodPredictionStart, 0);
  objc_storeStrong((id *)&self->_daysBeforeFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedOther, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedNoise, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedAvailability, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedWristTemp, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedOPK, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles, 0);
  objc_storeStrong((id *)&self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days, 0);
  objc_storeStrong((id *)&self->_numberOfDailySleepHeartRateStatisticsForPast100Days, 0);
  objc_storeStrong((id *)&self->_numberOfDaysSinceLastFiredUpdateFertileWindowNotification, 0);
  objc_storeStrong((id *)&self->_cycleLengthVariationUpperPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthVariationLowerPercentile, 0);
  objc_storeStrong((id *)&self->_ongoingPregnancy, 0);
  objc_storeStrong((id *)&self->_ongoingLactation, 0);
  objc_storeStrong((id *)&self->_ongoingContraception, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLoggingInCycleTracking, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLogging, 0);
  objc_storeStrong((id *)&self->_isSleepScreenEnabled, 0);
  objc_storeStrong((id *)&self->_isSleepScheduleEnabled, 0);
  objc_storeStrong((id *)&self->_countPairedVisionPro, 0);
  objc_storeStrong((id *)&self->_countPairediPad, 0);
  objc_storeStrong((id *)&self->_countPairedWatch, 0);
  objc_storeStrong((id *)&self->_countPairediPhone, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_isSleepConfiguredToAllowWristTemperatureMeasurements, 0);
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, 0);
  objc_storeStrong((id *)&self->_hasWristTemperatureCompatiblePairedWatch, 0);
  objc_storeStrong((id *)&self->_countWatchesWithWristTempMeasurementDataInLast45Days, 0);
  objc_storeStrong((id *)&self->_daysWornWatchToSleepInLast45Days, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempInPast45Days, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn45DaysBeforeFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputDeliveryCountryCode, 0);
  objc_storeStrong((id *)&self->_wasWristTemperatureInputDelivered, 0);
  objc_storeStrong((id *)&self->_heartRateInputDeliveryCountryCode, 0);
  objc_storeStrong((id *)&self->_wasDeviationDetectionDelivered, 0);
  objc_storeStrong((id *)&self->_wasHeartRateInputDelivered, 0);
  objc_storeStrong((id *)&self->_hasSameAlgorithmVersionOnPairedWatch, 0);
  objc_storeStrong((id *)&self->_hasCompatiblePairedAppleWatch, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboarded, 0);
  objc_storeStrong((id *)&self->_onboardedVersion, 0);
  objc_storeStrong((id *)&self->_onboardingCompleted, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
