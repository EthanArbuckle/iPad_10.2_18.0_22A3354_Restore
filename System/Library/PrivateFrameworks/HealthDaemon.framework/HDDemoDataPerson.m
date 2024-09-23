@implementation HDDemoDataPerson

- (HDDemoDataPerson)initWithFirstName:(id)a3 lastName:(id)a4 description:(id)a5 birthDateComponents:(id)a6 biologicalSex:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HDDemoDataPerson *v17;
  HDDemoDataPerson *v18;
  _HKMedicalIDData *v19;
  _HKMedicalIDData *medicalIDData;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HDDemoDataPerson;
  v17 = -[HDDemoDataPerson init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_firstName, a3);
    objc_storeStrong((id *)&v18->_lastName, a4);
    objc_storeStrong((id *)&v18->_personDescription, a5);
    objc_storeStrong((id *)&v18->_birthDateComponents, a6);
    v18->_biologicalSex = a7;
    v19 = (_HKMedicalIDData *)objc_alloc_init(MEMORY[0x1E0CB6FD8]);
    medicalIDData = v18->_medicalIDData;
    v18->_medicalIDData = v19;

  }
  return v18;
}

+ (id)defaultPersonWithBiologicalSex:(int64_t)a3
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  HDDemoDataPerson *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDDemoDataSleepParameters *v34;
  HDDemoDataSleepParameters *v35;
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
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  _QWORD v78[3];
  void *v79;
  _QWORD v80[3];
  void *v81;
  _QWORD v82[3];
  void *v83;
  _QWORD v84[3];
  void *v85;
  _QWORD v86[3];
  void *v87;
  _QWORD v88[3];
  void *v89;
  _QWORD v90[2];
  void *v91;
  _QWORD v92[7];
  _QWORD v93[9];

  v93[7] = *MEMORY[0x1E0C80C00];
  v4 = a3 == 2;
  if (a3 == 2)
    v5 = CFSTR("Dave");
  else
    v5 = CFSTR("Lani");
  v6 = CFSTR("Knox");
  if (a3 != 2)
    v6 = CFSTR("Martinez");
  v7 = (objc_class *)MEMORY[0x1E0C99D78];
  if (a3 == 2)
    v8 = 1971;
  else
    v8 = 1985;
  if (a3 == 2)
    v9 = 73;
  else
    v9 = 65;
  if (a3 == 2)
    v10 = 180;
  else
    v10 = 140;
  if (a3 == 2)
    v11 = 74;
  else
    v11 = 58;
  v12 = 150.0;
  if (a3 == 2)
    v12 = 200.0;
  v63 = v12;
  v13 = 250.0;
  if (a3 != 2)
    v13 = 200.0;
  v65 = v13;
  if (a3 == 2)
    v14 = 80.0;
  else
    v14 = 70.0;
  v15 = 5.0;
  if (a3 == 2)
    v15 = 7.0;
  v67 = v14;
  v69 = v15;
  v16 = 6.0;
  if (a3 == 2)
    v16 = 4.0;
  v71 = v16;
  if (a3 == 2)
    v17 = 3.3;
  else
    v17 = 4.0;
  v18 = 1.0;
  if (a3 == 2)
    v18 = 2.5;
  v73 = v17;
  v75 = v18;
  if (a3 == 2)
    v19 = 31;
  else
    v19 = 26;
  v20 = v6;
  v21 = v5;
  v22 = objc_alloc_init(v7);
  objc_msgSend(v22, "setMonth:", 2);
  objc_msgSend(v22, "setDay:", 10);
  objc_msgSend(v22, "setYear:", v8);
  objc_msgSend(v22, "setEra:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v22;
  objc_msgSend(v22, "setCalendar:", v23);

  v24 = -[HDDemoDataPerson initWithFirstName:lastName:description:birthDateComponents:biologicalSex:]([HDDemoDataPerson alloc], "initWithFirstName:lastName:description:birthDateComponents:biologicalSex:", v21, v20, CFSTR("Default Person"), v22, a3);
  -[HDDemoDataPerson setBloodType:](v24, "setBloodType:", arc4random_uniform(7u) + 1);
  -[HDDemoDataPerson setFitzpatrickSkinType:](v24, "setFitzpatrickSkinType:", 3);
  -[HDDemoDataPerson setTimeIncrement:](v24, "setTimeIncrement:", 0.0208333333);
  -[HDDemoDataPerson setTimeIncrementDuringExercise:](v24, "setTimeIncrementDuringExercise:", 0.000347222222);
  -[HDDemoDataPerson setDawnTime:](v24, "setDawnTime:", 0.25);
  -[HDDemoDataPerson setSunsetTime:](v24, "setSunsetTime:", 0.8125);
  -[HDDemoDataPerson setGenericSampleTimeNoiseStdDev:](v24, "setGenericSampleTimeNoiseStdDev:");
  -[HDDemoDataPerson setUvIndexSampleFrequency:](v24, "setUvIndexSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setWaistCircumferenceInInches:](v24, "setWaistCircumferenceInInches:", 33.0);
  -[HDDemoDataPerson setWristCircumferenceInInches:](v24, "setWristCircumferenceInInches:", 0.0);
  -[HDDemoDataPerson setForearmCircumferenceInInches:](v24, "setForearmCircumferenceInInches:", 0.0);
  -[HDDemoDataPerson setHipCircumferenceInInches:](v24, "setHipCircumferenceInInches:", 0.0);
  -[HDDemoDataPerson setHeightTargetInCm:](v24, "setHeightTargetInCm:", (double)v9 * 2.53999996);
  -[HDDemoDataPerson setHeightSampleTime:](v24, "setHeightSampleTime:", 0.416666667);
  -[HDDemoDataPerson setHeightSampleTimeFrequency:](v24, "setHeightSampleTimeFrequency:", 80.0);
  -[HDDemoDataPerson setHeightSampleNoiseStdDev:](v24, "setHeightSampleNoiseStdDev:");
  -[HDDemoDataPerson setWeightTargetInKg:](v24, "setWeightTargetInKg:", (double)v10 * 0.453592933);
  -[HDDemoDataPerson setWeightSampleTime:](v24, "setWeightSampleTime:", 0.375);
  -[HDDemoDataPerson setWeightSampleTimeFrequency:](v24, "setWeightSampleTimeFrequency:", 1.0);
  -[HDDemoDataPerson setWeightLossStartDay:](v24, "setWeightLossStartDay:", 110.0);
  -[HDDemoDataPerson setWeightSampleNoiseStdDev:](v24, "setWeightSampleNoiseStdDev:", 0.47627258);
  -[HDDemoDataPerson setWeightDailyChangeStdDev:](v24, "setWeightDailyChangeStdDev:", 0.226796467);
  -[HDDemoDataPerson setWeightChangePercentageMax:](v24, "setWeightChangePercentageMax:");
  -[HDDemoDataPerson setWeightDailyMaxLoss:](v24, "setWeightDailyMaxLoss:", 0.317515053);
  -[HDDemoDataPerson setWeightGainHolidayDaysInYear:](v24, "setWeightGainHolidayDaysInYear:", &unk_1E6DF8E10);
  -[HDDemoDataPerson setRestingHeartRate:](v24, "setRestingHeartRate:", 65);
  -[HDDemoDataPerson setRestingHeartRateMaxDailyDifference:](v24, "setRestingHeartRateMaxDailyDifference:", 1);
  -[HDDemoDataPerson setRestingHeartRateMaxTotalDifference:](v24, "setRestingHeartRateMaxTotalDifference:", 3);
  -[HDDemoDataPerson setWalkingHeartRateAverage:](v24, "setWalkingHeartRateAverage:", 110);
  -[HDDemoDataPerson setWalkingHeartRateAverageMaxDailyDifference:](v24, "setWalkingHeartRateAverageMaxDailyDifference:", 5);
  -[HDDemoDataPerson setWalkingHeartRateAverageMaxTotalDifference:](v24, "setWalkingHeartRateAverageMaxTotalDifference:", 15);
  -[HDDemoDataPerson setHeartRateSampleFrequency:](v24, "setHeartRateSampleFrequency:", 0.00555555556);
  -[HDDemoDataPerson setHeartRateSampleFrequencyStdDev:](v24, "setHeartRateSampleFrequencyStdDev:", 0.0138888889);
  -[HDDemoDataPerson setHeartRateSampleNoiseStdDev:](v24, "setHeartRateSampleNoiseStdDev:", 13.0);
  -[HDDemoDataPerson setHeartRateRecovery:](v24, "setHeartRateRecovery:", 50.0);
  -[HDDemoDataPerson setHeartRateRecoveryValueStdDev:](v24, "setHeartRateRecoveryValueStdDev:", 5.0);
  -[HDDemoDataPerson setHeartRateRecoveryValueMaxConsecutiveDifference:](v24, "setHeartRateRecoveryValueMaxConsecutiveDifference:", 10.0);
  -[HDDemoDataPerson setHeartRateRecoveryValueMaxTotalDifference:](v24, "setHeartRateRecoveryValueMaxTotalDifference:", 50.0);
  -[HDDemoDataPerson setVo2MaxValueStdDev:](v24, "setVo2MaxValueStdDev:", 1.0);
  -[HDDemoDataPerson setVo2MaxValueMaxConsecutiveDifference:](v24, "setVo2MaxValueMaxConsecutiveDifference:", 1.0);
  -[HDDemoDataPerson setVo2MaxValueMaxTotalDifference:](v24, "setVo2MaxValueMaxTotalDifference:", 3.0);
  -[HDDemoDataPerson setVo2MaxSampleTimeNoiseStdDev:](v24, "setVo2MaxSampleTimeNoiseStdDev:", 0.0208333333);
  -[HDDemoDataPerson setRestingRespirationRate:](v24, "setRestingRespirationRate:", 13);
  -[HDDemoDataPerson setRestingRespirationRateSampleFrequency:](v24, "setRestingRespirationRateSampleFrequency:", 0.166666667);
  -[HDDemoDataPerson setRestingRespirationRateSampleFrequencyDuringSleep:](v24, "setRestingRespirationRateSampleFrequencyDuringSleep:", 0.00694444444);
  -[HDDemoDataPerson setRestingRespirationRateSampleNoiseStdDev:](v24, "setRestingRespirationRateSampleNoiseStdDev:", 3.0);
  -[HDDemoDataPerson setBloodPressureSampleFrequency:](v24, "setBloodPressureSampleFrequency:", 0.5);
  -[HDDemoDataPerson setRestingSystolicBloodPressure:](v24, "setRestingSystolicBloodPressure:", 127);
  -[HDDemoDataPerson setRestingDiastolicBloodPressure:](v24, "setRestingDiastolicBloodPressure:", 84);
  -[HDDemoDataPerson setRestingSystolicBloodPressureSampleNoiseStdDev:](v24, "setRestingSystolicBloodPressureSampleNoiseStdDev:", 2.0);
  -[HDDemoDataPerson setRestingDiastolicBloodPressureSampleNoiseStdDev:](v24, "setRestingDiastolicBloodPressureSampleNoiseStdDev:", 1.0);
  -[HDDemoDataPerson setBodyTempSampleFrequency:](v24, "setBodyTempSampleFrequency:", 0.5);
  -[HDDemoDataPerson setBodyTempSampleNoiseStdDev:](v24, "setBodyTempSampleNoiseStdDev:");
  -[HDDemoDataPerson setBodyTempFeverMultiplier:](v24, "setBodyTempFeverMultiplier:", 0.0);
  -[HDDemoDataPerson setBodyTempExerciseMultiplier:](v24, "setBodyTempExerciseMultiplier:", 0.015);
  -[HDDemoDataPerson setBaseCorrectedWristSkinTemperatureInCelsius:](v24, "setBaseCorrectedWristSkinTemperatureInCelsius:", 36.0);
  -[HDDemoDataPerson setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:](v24, "setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:", 0.25);
  -[HDDemoDataPerson setOxygenSaturationSampleFrequency:](v24, "setOxygenSaturationSampleFrequency:", 0.0222222222);
  -[HDDemoDataPerson setOxygenSaturationMean:](v24, "setOxygenSaturationMean:", 98.0);
  -[HDDemoDataPerson setOxygenSaturationStdDev:](v24, "setOxygenSaturationStdDev:", 3.0);
  -[HDDemoDataPerson setOxygenSaturationMeanAtElevation:](v24, "setOxygenSaturationMeanAtElevation:", 93.5);
  -[HDDemoDataPerson setOxygenSaturationStdDevAtElevation:](v24, "setOxygenSaturationStdDevAtElevation:", 1.5);
  -[HDDemoDataPerson setOxygenSaturationMeasuringSuccessRate:](v24, "setOxygenSaturationMeasuringSuccessRate:", 0.2);
  -[HDDemoDataPerson setOxygenSaturationMeasuringSuccessRateDuringSleep:](v24, "setOxygenSaturationMeasuringSuccessRateDuringSleep:");
  -[HDDemoDataPerson setPeripheralPerfusionIndexMean:](v24, "setPeripheralPerfusionIndexMean:", 4.0);
  -[HDDemoDataPerson setPeripheralPerfusionIndexStdDev:](v24, "setPeripheralPerfusionIndexStdDev:", 0.5);
  -[HDDemoDataPerson setPeripheralPerfusionIndexSampleFrequency:](v24, "setPeripheralPerfusionIndexSampleFrequency:", 0.000347222222);
  -[HDDemoDataPerson setSexualActivityProbabilityPercentage:](v24, "setSexualActivityProbabilityPercentage:", 0.2);
  -[HDDemoDataPerson setSexualActivityProtectionProbabilityPercentage:](v24, "setSexualActivityProtectionProbabilityPercentage:", 0.6);
  -[HDDemoDataPerson setSexualActivityProtectionDocumentationProbabilityPercentage:](v24, "setSexualActivityProtectionDocumentationProbabilityPercentage:", 0.8);
  -[HDDemoDataPerson setSexualActivityIsTryingToConceive:](v24, "setSexualActivityIsTryingToConceive:", 0);
  -[HDDemoDataPerson setMenstrualPeriodFrequency:](v24, "setMenstrualPeriodFrequency:", 28.0);
  -[HDDemoDataPerson setOvulationIndeterminateProbabilityPercentage:](v24, "setOvulationIndeterminateProbabilityPercentage:");
  -[HDDemoDataPerson setToothbrushingDurationMean:](v24, "setToothbrushingDurationMean:");
  -[HDDemoDataPerson setToothbrushingDurationMeanStdDev:](v24, "setToothbrushingDurationMeanStdDev:", 20.0);
  -[HDDemoDataPerson setHandwashingDurationMean:](v24, "setHandwashingDurationMean:", 21.0);
  -[HDDemoDataPerson setHandwashingDurationMeanStdDev:](v24, "setHandwashingDurationMeanStdDev:", 6.0);
  -[HDDemoDataPerson setHandwashingSampleFrequency:](v24, "setHandwashingSampleFrequency:", 0.0555555556);
  -[HDDemoDataPerson setHandwashingSampleFrequencyStdDev:](v24, "setHandwashingSampleFrequencyStdDev:", 0.0208333333);
  -[HDDemoDataPerson setTimeInDaylightSampleFrequency:](v24, "setTimeInDaylightSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setTimeInDaylightSampleFrequencyStdDev:](v24, "setTimeInDaylightSampleFrequencyStdDev:", 0.00833333333);
  -[HDDemoDataPerson timeIncrementDuringExercise](v24, "timeIncrementDuringExercise");
  -[HDDemoDataPerson setActiveCaloriesSampleFrequency:](v24, "setActiveCaloriesSampleFrequency:");
  -[HDDemoDataPerson setRestingCaloriesSampleFrequency:](v24, "setRestingCaloriesSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson timeIncrement](v24, "timeIncrement");
  -[HDDemoDataPerson setStepsSampleFrequency:](v24, "setStepsSampleFrequency:");
  -[HDDemoDataPerson timeIncrementDuringExercise](v24, "timeIncrementDuringExercise");
  -[HDDemoDataPerson setStepsSampleFrequencyDuringExercise:](v24, "setStepsSampleFrequencyDuringExercise:");
  -[HDDemoDataPerson setSedentarySampleFrequency:](v24, "setSedentarySampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setRunningPowerMean:](v24, "setRunningPowerMean:", 200.0);
  -[HDDemoDataPerson setRunningPowerMeanStdDev:](v24, "setRunningPowerMeanStdDev:", 40.0);
  -[HDDemoDataPerson setRunningStrideLengthMean:](v24, "setRunningStrideLengthMean:", (double)v11 * 2.53999996 / 100.0);
  -[HDDemoDataPerson setRunningStrideLengthMeanStdDev:](v24, "setRunningStrideLengthMeanStdDev:", 0.5);
  -[HDDemoDataPerson setRunningVerticalOscillationMean:](v24, "setRunningVerticalOscillationMean:", 0.11);
  -[HDDemoDataPerson setRunningVerticalOscillationMeanStdDev:](v24, "setRunningVerticalOscillationMeanStdDev:", 0.02);
  -[HDDemoDataPerson setRunningGroundContactTimeMean:](v24, "setRunningGroundContactTimeMean:", 200.0);
  -[HDDemoDataPerson setRunningGroundContactTimeMeanStdDev:](v24, "setRunningGroundContactTimeMeanStdDev:", 25.0);
  -[HDDemoDataPerson setSwimmingStrokesPerYard:](v24, "setSwimmingStrokesPerYard:", 0.727272727);
  -[HDDemoDataPerson setCyclingPowerMean:](v24, "setCyclingPowerMean:", v63);
  -[HDDemoDataPerson setCyclingPowerMeanStdDev:](v24, "setCyclingPowerMeanStdDev:", 40.0);
  -[HDDemoDataPerson setCyclingFTPMean:](v24, "setCyclingFTPMean:", v65);
  -[HDDemoDataPerson setCyclingFTPMeanStdDev:](v24, "setCyclingFTPMeanStdDev:", 50.0);
  -[HDDemoDataPerson setCyclingCadenceMean:](v24, "setCyclingCadenceMean:", v67);
  -[HDDemoDataPerson setCyclingCadenceMeanStdDev:](v24, "setCyclingCadenceMeanStdDev:", 20.0);
  -[HDDemoDataPerson setSpeedMeanStdDev:](v24, "setSpeedMeanStdDev:", 0.5);
  -[HDDemoDataPerson setCyclingSpeedMean:](v24, "setCyclingSpeedMean:", v69);
  -[HDDemoDataPerson setCrossCountrySkiingSpeedMean:](v24, "setCrossCountrySkiingSpeedMean:", v71);
  -[HDDemoDataPerson setRowingSpeedMean:](v24, "setRowingSpeedMean:", v73);
  -[HDDemoDataPerson setPaddleSportsSpeedMean:](v24, "setPaddleSportsSpeedMean:", v75);
  -[HDDemoDataPerson setUnderwaterDivingWaterTemperatureMean:](v24, "setUnderwaterDivingWaterTemperatureMean:", 25.0);
  -[HDDemoDataPerson setUnderwaterDivingWaterTemperatureStdDev:](v24, "setUnderwaterDivingWaterTemperatureStdDev:", 1.0);
  -[HDDemoDataPerson setExerciseIntensityPercentage:](v24, "setExerciseIntensityPercentage:", 0.8);
  -[HDDemoDataPerson setExerciseStartTime:](v24, "setExerciseStartTime:", 0.34375);
  -[HDDemoDataPerson setExerciseStopTime:](v24, "setExerciseStopTime:", 0.368055556);
  -[HDDemoDataPerson setExerciseStartTimeStdDev:](v24, "setExerciseStartTimeStdDev:", 0.00833333333);
  -[HDDemoDataPerson setExerciseStopTimeStdDev:](v24, "setExerciseStopTimeStdDev:", 0.00625);
  -[HDDemoDataPerson setExerciseCooldownTime:](v24, "setExerciseCooldownTime:", 0.00763888889);
  -[HDDemoDataPerson setExerciseWeeklyWorkoutsMean:](v24, "setExerciseWeeklyWorkoutsMean:", 2.0);
  -[HDDemoDataPerson setExerciseWeeklyWorkoutsStdDev:](v24, "setExerciseWeeklyWorkoutsStdDev:", 0.5);
  -[HDDemoDataPerson setExercisePostDietWeeklyWorkoutsMean:](v24, "setExercisePostDietWeeklyWorkoutsMean:", 3.8);
  -[HDDemoDataPerson setExercisePostDietWeeklyWorkoutsStdDev:](v24, "setExercisePostDietWeeklyWorkoutsStdDev:", 0.5);
  -[HDDemoDataPerson setFlightsClimbedDailyMean:](v24, "setFlightsClimbedDailyMean:", 7.0);
  -[HDDemoDataPerson setFlightsClimbedStdDev:](v24, "setFlightsClimbedStdDev:", 3.0);
  -[HDDemoDataPerson setFlightsClimbedSampleTime:](v24, "setFlightsClimbedSampleTime:", 0.0131944444);
  -[HDDemoDataPerson setFlightsClimbedSampleFrequency:](v24, "setFlightsClimbedSampleFrequency:", 0.0104166667);
  -[HDDemoDataPerson setFlightsClimbedSampleFrequencyStdDev:](v24, "setFlightsClimbedSampleFrequencyStdDev:", 0.000694444444);
  -[HDDemoDataPerson setRehabLogarithmicConstant:](v24, "setRehabLogarithmicConstant:", 2.0);
  -[HDDemoDataPerson setWalkingSpeedMean:](v24, "setWalkingSpeedMean:", 1.5);
  -[HDDemoDataPerson setWalkingSpeedStdDev:](v24, "setWalkingSpeedStdDev:", 0.1);
  -[HDDemoDataPerson setWalkingSpeedSampleFrequency:](v24, "setWalkingSpeedSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setWalkingSpeedSampleFrequencyStdDev:](v24, "setWalkingSpeedSampleFrequencyStdDev:", 0.0104166667);
  -[HDDemoDataPerson setStepLengthMean:](v24, "setStepLengthMean:", (double)v19 * 2.53999996 / 100.0);
  -[HDDemoDataPerson setStepLengthStdDev:](v24, "setStepLengthStdDev:", 0.02);
  -[HDDemoDataPerson setStepLengthSampleFrequency:](v24, "setStepLengthSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setStepLengthSampleFrequencyStdDev:](v24, "setStepLengthSampleFrequencyStdDev:", 0.0104166667);
  -[HDDemoDataPerson setAsymmetryPercentageMean:](v24, "setAsymmetryPercentageMean:", 0.03);
  -[HDDemoDataPerson setAsymmetryPercentageStdDev:](v24, "setAsymmetryPercentageStdDev:", 0.01);
  -[HDDemoDataPerson setAsymmetryPercentageSampleFrequency:](v24, "setAsymmetryPercentageSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setAsymmetryPercentageSampleFrequencyStdDev:](v24, "setAsymmetryPercentageSampleFrequencyStdDev:", 0.0104166667);
  -[HDDemoDataPerson setDoubleSupportPercentageMean:](v24, "setDoubleSupportPercentageMean:", 0.2);
  -[HDDemoDataPerson setDoubleSupportPercentageStdDev:](v24, "setDoubleSupportPercentageStdDev:", 0.03);
  -[HDDemoDataPerson setDoubleSupportPercentageSampleFrequency:](v24, "setDoubleSupportPercentageSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setDoubleSupportPercentageSampleFrequencyStdDev:](v24, "setDoubleSupportPercentageSampleFrequencyStdDev:", 0.0104166667);
  -[HDDemoDataPerson setSixMinuteWalkTestDistanceMean:](v24, "setSixMinuteWalkTestDistanceMean:", dbl_1B7F3E9F0[v4]);
  -[HDDemoDataPerson setSixMinuteWalkTestDistanceStdDev:](v24, "setSixMinuteWalkTestDistanceStdDev:", 12.0);
  -[HDDemoDataPerson setSixMinuteWalkTestDistanceSampleFrequency:](v24, "setSixMinuteWalkTestDistanceSampleFrequency:", 7.0);
  -[HDDemoDataPerson setSixMinuteWalkTestDistanceSampleFrequencyStdDev:](v24, "setSixMinuteWalkTestDistanceSampleFrequencyStdDev:", 0.0416666667);
  -[HDDemoDataPerson setStairAscentSpeedMean:](v24, "setStairAscentSpeedMean:", 0.2936);
  -[HDDemoDataPerson setStairAscentSpeedStdDev:](v24, "setStairAscentSpeedStdDev:", 0.1134);
  -[HDDemoDataPerson setStairAscentSpeedSampleFrequency:](v24, "setStairAscentSpeedSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setStairAscentSpeedSampleFrequencyStdDev:](v24, "setStairAscentSpeedSampleFrequencyStdDev:", 0.0208333333);
  -[HDDemoDataPerson setStairDescentSpeedMean:](v24, "setStairDescentSpeedMean:", 0.3109);
  -[HDDemoDataPerson setStairDescentSpeedStdDev:](v24, "setStairDescentSpeedStdDev:", 0.1006);
  -[HDDemoDataPerson setStairDescentSpeedSampleFrequency:](v24, "setStairDescentSpeedSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setStairDescentSpeedSampleFrequencyStdDev:](v24, "setStairDescentSpeedSampleFrequencyStdDev:", 0.0208333333);
  -[HDDemoDataPerson setWalkingSteadinessMean:](v24, "setWalkingSteadinessMean:", 0.85);
  -[HDDemoDataPerson setWalkingSteadinessStdDev:](v24, "setWalkingSteadinessStdDev:", 0.05);
  -[HDDemoDataPerson setWalkingSteadinessSampleFrequency:](v24, "setWalkingSteadinessSampleFrequency:", 7.0);
  -[HDDemoDataPerson setWalkingSteadinessSampleFrequencyStdDev:](v24, "setWalkingSteadinessSampleFrequencyStdDev:", 0.0104166667);
  -[HDDemoDataPerson setMoveGoal:](v24, "setMoveGoal:", 800.0);
  -[HDDemoDataPerson setExerciseGoal:](v24, "setExerciseGoal:", (double)(uint64_t)*MEMORY[0x1E0CB7170]);
  -[HDDemoDataPerson setStandGoal:](v24, "setStandGoal:", (double)(uint64_t)*MEMORY[0x1E0CB7168]);
  v92[0] = &unk_1E6DFB198;
  +[HDDemoDataWorkoutPrototype HIITPrototype](HDDemoDataWorkoutPrototype, "HIITPrototype");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v76;
  +[HDDemoDataWorkoutPrototype functionalStrengthTrainingPrototype](HDDemoDataWorkoutPrototype, "functionalStrengthTrainingPrototype");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v72);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v68;
  v92[1] = &unk_1E6DFB1B0;
  +[HDDemoDataWorkoutPrototype dancePrototype](HDDemoDataWorkoutPrototype, "dancePrototype");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v66;
  +[HDDemoDataWorkoutPrototype yogaPrototype](HDDemoDataWorkoutPrototype, "yogaPrototype");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v64;
  +[HDDemoDataWorkoutPrototype rowingPrototype](HDDemoDataWorkoutPrototype, "rowingPrototype");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v59;
  v92[2] = &unk_1E6DFB1C8;
  +[HDDemoDataWorkoutPrototype swimmingPrototype](HDDemoDataWorkoutPrototype, "swimmingPrototype");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v58;
  +[HDDemoDataWorkoutPrototype coolDownPrototype](HDDemoDataWorkoutPrototype, "coolDownPrototype");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v57;
  +[HDDemoDataWorkoutPrototype skatingSportsPrototype](HDDemoDataWorkoutPrototype, "skatingSportsPrototype");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v53;
  v92[3] = &unk_1E6DFB1E0;
  +[HDDemoDataWorkoutPrototype runningPrototype](HDDemoDataWorkoutPrototype, "runningPrototype");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v52;
  +[HDDemoDataWorkoutPrototype walkingPrototype](HDDemoDataWorkoutPrototype, "walkingPrototype");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v51;
  +[HDDemoDataWorkoutPrototype soccerPrototype](HDDemoDataWorkoutPrototype, "soccerPrototype");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v47;
  v92[4] = &unk_1E6DFB1F8;
  +[HDDemoDataWorkoutPrototype ellipticalPrototype](HDDemoDataWorkoutPrototype, "ellipticalPrototype");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v46;
  +[HDDemoDataWorkoutPrototype coreTrainingPrototype](HDDemoDataWorkoutPrototype, "coreTrainingPrototype");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v45;
  +[HDDemoDataWorkoutPrototype golfPrototype](HDDemoDataWorkoutPrototype, "golfPrototype");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v41;
  v92[5] = &unk_1E6DFB210;
  +[HDDemoDataWorkoutPrototype cyclingPrototype](HDDemoDataWorkoutPrototype, "cyclingPrototype");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v40;
  +[HDDemoDataWorkoutPrototype paddleSportsPrototype](HDDemoDataWorkoutPrototype, "paddleSportsPrototype");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v39;
  +[HDDemoDataWorkoutPrototype downhillSnowSportsPrototype](HDDemoDataWorkoutPrototype, "downhillSnowSportsPrototype");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v26;
  v92[6] = &unk_1E6DFB228;
  +[HDDemoDataWorkoutPrototype hikingPrototype](HDDemoDataWorkoutPrototype, "hikingPrototype");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v27;
  +[HDDemoDataWorkoutPrototype underwaterDivingPrototype](HDDemoDataWorkoutPrototype, "underwaterDivingPrototype");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v28;
  +[HDDemoDataWorkoutPrototype crossCountrySkiingPrototype](HDDemoDataWorkoutPrototype, "crossCountrySkiingPrototype");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:](HDDemoDataWorkoutPrototype, "pickRandomWorkoutFrom:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson setWorkoutPrototypesByCalendarDay:](v24, "setWorkoutPrototypesByCalendarDay:", v33);

  -[HDDemoDataPerson setMealTimeSampleNoiseStdDev:](v24, "setMealTimeSampleNoiseStdDev:", 0.03125);
  -[HDDemoDataPerson setBreakfastTimeSampleNoiseStdDev:](v24, "setBreakfastTimeSampleNoiseStdDev:", 0.00625);
  -[HDDemoDataPerson setBreakfastTime:](v24, "setBreakfastTime:", 0.302083333);
  -[HDDemoDataPerson setLunchTime:](v24, "setLunchTime:", 0.5);
  -[HDDemoDataPerson setSnackTime:](v24, "setSnackTime:", 0.625);
  -[HDDemoDataPerson setDinnerTime:](v24, "setDinnerTime:", 0.791666667);
  -[HDDemoDataPerson setPreDietIntakeMultiplier:](v24, "setPreDietIntakeMultiplier:", 1.07);
  -[HDDemoDataPerson setNumCupsOfCoffeeDailyMean:](v24, "setNumCupsOfCoffeeDailyMean:", 1.0);
  -[HDDemoDataPerson setNumCupsOfCoffeeStdDev:](v24, "setNumCupsOfCoffeeStdDev:", 0.5);
  -[HDDemoDataPerson setWaterConsumedSampleFrequency:](v24, "setWaterConsumedSampleFrequency:", 0.01875);
  -[HDDemoDataPerson setWaterConsumedDailyMean:](v24, "setWaterConsumedDailyMean:", 1000.0);
  -[HDDemoDataPerson setWaterConsumedStdDev:](v24, "setWaterConsumedStdDev:", 125.0);
  -[HDDemoDataPerson setWaterConsumedIntervalMean:](v24, "setWaterConsumedIntervalMean:", 300.0);
  -[HDDemoDataPerson setWaterConsumedIntervalStdDev:](v24, "setWaterConsumedIntervalStdDev:", 225.0);
  -[HDDemoDataPerson setWaterConsumedSampleTime:](v24, "setWaterConsumedSampleTime:", 0.0416666667);
  v34 = objc_alloc_init(HDDemoDataSleepParameters);
  -[HDDemoDataSleepParameters setBedtime:](v34, "setBedtime:", 0.951388889);
  -[HDDemoDataSleepParameters setWakeUpTime:](v34, "setWakeUpTime:", 0.25);
  -[HDDemoDataSleepParameters setBedtimeGoalHour:](v34, "setBedtimeGoalHour:", 23);
  -[HDDemoDataSleepParameters setWakeUpTimeGoalHour:](v34, "setWakeUpTimeGoalHour:", 6);
  -[HDDemoDataPerson setWeekdaySleepParameters:](v24, "setWeekdaySleepParameters:", v34);
  v35 = objc_alloc_init(HDDemoDataSleepParameters);
  -[HDDemoDataSleepParameters setBedtime:](v35, "setBedtime:", 0.0);
  -[HDDemoDataSleepParameters setWakeUpTime:](v35, "setWakeUpTime:", 0.298611111);
  -[HDDemoDataSleepParameters setBedtimeGoalHour:](v35, "setBedtimeGoalHour:", 0);
  -[HDDemoDataSleepParameters setWakeUpTimeGoalHour:](v35, "setWakeUpTimeGoalHour:", 7);
  -[HDDemoDataPerson setWeekendSleepParameters:](v24, "setWeekendSleepParameters:", v35);
  -[HDDemoDataPerson setWakeUpTimeNoiseStdDev:](v24, "setWakeUpTimeNoiseStdDev:", 0.0277777778);
  -[HDDemoDataPerson setBedtimeNoiseStdDev:](v24, "setBedtimeNoiseStdDev:", 0.0201388889);
  -[HDDemoDataPerson setInBedTimeStdDev:](v24, "setInBedTimeStdDev:", 0.0107638889);
  -[HDDemoDataPerson setFallSampleFrequency:](v24, "setFallSampleFrequency:", 0.0416666667);
  -[HDDemoDataPerson setFallsDailyMean:](v24, "setFallsDailyMean:", 0.2);
  -[HDDemoDataPerson setFallsDailyStdDev:](v24, "setFallsDailyStdDev:", 0.15);
  -[HDDemoDataPerson setUseContinuousGlucoseMonitoring:](v24, "setUseContinuousGlucoseMonitoring:", 1);
  -[HDDemoDataPerson setContinuousGlucoseMonitoringSampleFrequency:](v24, "setContinuousGlucoseMonitoringSampleFrequency:", 0.00347222222);
  -[HDDemoDataPerson setNumDailyFingerSticksAdherence:](v24, "setNumDailyFingerSticksAdherence:", 0.9);
  -[HDDemoDataPerson setInsulinSensitivity:](v24, "setInsulinSensitivity:", 1.0);
  -[HDDemoDataPerson setInsulinProduction:](v24, "setInsulinProduction:", 1.0);
  -[HDDemoDataPerson setInsulinAdherence:](v24, "setInsulinAdherence:", 1.0);
  -[HDDemoDataPerson setInsulinTherapy:](v24, "setInsulinTherapy:", 0);
  -[HDDemoDataPerson setSpirometrySampleFrequency:](v24, "setSpirometrySampleFrequency:", 170.0);
  -[HDDemoDataPerson setSpirometrySampleTime:](v24, "setSpirometrySampleTime:", 80.6);
  -[HDDemoDataPerson setAsthmaSeverity:](v24, "setAsthmaSeverity:", 2);
  -[HDDemoDataPerson setMindfulSessionFrequency:](v24, "setMindfulSessionFrequency:", 0.395833333);
  -[HDDemoDataPerson setMindfulSessionMean:](v24, "setMindfulSessionMean:", 2);
  -[HDDemoDataPerson setMindfulSessionStdDev:](v24, "setMindfulSessionStdDev:", 1);
  -[HDDemoDataPerson setNutritionTrackingType:](v24, "setNutritionTrackingType:", 1);
  -[HDDemoDataPerson setResultsTrackingType:](v24, "setResultsTrackingType:", 1);
  -[HDDemoDataPerson updateMedicalIDData](v24, "updateMedicalIDData");

  return v24;
}

- (double)exerciseTimeSampleFrequency
{
  return 0.000694444444;
}

- (id)fullName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[HDDemoDataPerson firstName](self, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v4);

  -[HDDemoDataPerson lastName](self, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v5);

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v3, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)applyProfileType:(int64_t)a3
{
  id v5;
  void *v6;
  long double v7;
  long double v8;
  double v9;
  long double v10;
  long double v11;
  double v12;
  id v13;

  -[HDDemoDataPerson setProfileType:](self, "setProfileType:");
  switch(a3)
  {
    case 4:
      objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v5, "setMonth:", 2);
      objc_msgSend(v5, "setDay:", 10);
      objc_msgSend(v5, "setYear:", 1962);
      objc_msgSend(v5, "setEra:", 1);
      objc_msgSend(v5, "setCalendar:", v13);
      -[HDDemoDataPerson setBirthDateComponents:](self, "setBirthDateComponents:", v5);
      objc_msgSend(v13, "dateFromComponents:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDemoDataPerson setBirthDate:](self, "setBirthDate:", v6);

      break;
    case 3:
      -[HDDemoDataPerson rehabLogarithmicConstant](self, "rehabLogarithmicConstant");
      v8 = 2.0 - log(v7);
      -[HDDemoDataPerson asymmetryPercentageMean](self, "asymmetryPercentageMean");
      -[HDDemoDataPerson setAsymmetryPercentageMean:](self, "setAsymmetryPercentageMean:", (double)(v9 * v8));
      -[HDDemoDataPerson rehabLogarithmicConstant](self, "rehabLogarithmicConstant");
      v11 = 2.0 - log(v10);
      -[HDDemoDataPerson doubleSupportPercentageMean](self, "doubleSupportPercentageMean");
      -[HDDemoDataPerson setDoubleSupportPercentageMean:](self, "setDoubleSupportPercentageMean:", (double)(v12 * v11));
      break;
    case 2:
      -[HDDemoDataPerson setInsulinProduction:](self, "setInsulinProduction:", 0.0);
      -[HDDemoDataPerson setInsulinAdherence:](self, "setInsulinAdherence:", 1.0);
      -[HDDemoDataPerson setInsulinTherapy:](self, "setInsulinTherapy:", 1);
      -[HDDemoDataPerson setUseContinuousGlucoseMonitoring:](self, "setUseContinuousGlucoseMonitoring:", 1);
      break;
  }
}

- (void)setHighFidelityGeneration:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  v5 = 0.0204050926;
  if (a3)
  {
    v5 = 0.00998842593;
    v6 = 0.00304398148;
  }
  else
  {
    v6 = 0.00555555556;
  }
  if (a3)
    v7 = 0.0000347222222;
  else
    v7 = 0.0138888889;
  -[HDDemoDataPerson setTimeIncrement:](self, "setTimeIncrement:", v5);
  -[HDDemoDataPerson setHeartRateSampleFrequency:](self, "setHeartRateSampleFrequency:", v6);
  -[HDDemoDataPerson setHeartRateSampleFrequencyStdDev:](self, "setHeartRateSampleFrequencyStdDev:", v7);
  -[HDDemoDataPerson setCreateHighFidelityData:](self, "setCreateHighFidelityData:", v3);
}

- (void)updateMedicalIDData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson heightTargetInCm](self, "heightTargetInCm");
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson weightTargetInKg](self, "weightTargetInKg");
  objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDDemoDataPerson biologicalSex](self, "biologicalSex") == 2)
    v10 = CFSTR("DaveKnox");
  else
    v10 = CFSTR("LaniMartinez");
  objc_msgSend(v9, "URLForResource:withExtension:", v10, CFSTR("png"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v11);
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPictureData:", v12);

  v14 = objc_alloc_init(MEMORY[0x1E0CB6F88]);
  if (-[HDDemoDataPerson biologicalSex](self, "biologicalSex") == 2)
    v15 = CFSTR("Lani Martinez");
  else
    v15 = CFSTR("Dave Knox");
  objc_msgSend(v14, "setName:", v15);
  objc_msgSend(v14, "setPhoneNumber:", CFSTR("(555) 555-0100"));
  objc_msgSend(v14, "setRelationship:", CFSTR("spouse"));
  v31[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEmergencyContacts:", v16);

  -[HDDemoDataPerson fullName](self, "fullName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", v18);

  -[HDDemoDataPerson birthDateComponents](self, "birthDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setGregorianBirthday:", v20);

  v22 = -[HDDemoDataPerson bloodType](self, "bloodType");
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBloodType:", v22);

  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMedicalConditions:", CFSTR("Hypertension"));

  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAllergyInfo:", CFSTR("Peanuts"));

  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMedicationInfo:", CFSTR("Lisinopril (10mg by mouth once a day)"));

  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHeight:", v5);

  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWeight:", v8);

  if (-[HDDemoDataPerson biologicalSex](self, "biologicalSex") == 2)
    v29 = CFSTR("en");
  else
    v29 = CFSTR("es");
  -[HDDemoDataPerson medicalIDData](self, "medicalIDData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPrimaryLanguageCode:", v29);

}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)personDescription
{
  return self->_personDescription;
}

- (void)setPersonDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)birthDateComponents
{
  return self->_birthDateComponents;
}

- (void)setBirthDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_birthDateComponents, a3);
}

- (NSDate)birthDate
{
  return self->_birthDate;
}

- (void)setBirthDate:(id)a3
{
  objc_storeStrong((id *)&self->_birthDate, a3);
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)bloodType
{
  return self->_bloodType;
}

- (void)setBloodType:(int64_t)a3
{
  self->_bloodType = a3;
}

- (int64_t)fitzpatrickSkinType
{
  return self->_fitzpatrickSkinType;
}

- (void)setFitzpatrickSkinType:(int64_t)a3
{
  self->_fitzpatrickSkinType = a3;
}

- (double)timeIncrement
{
  return self->_timeIncrement;
}

- (void)setTimeIncrement:(double)a3
{
  self->_timeIncrement = a3;
}

- (double)timeIncrementDuringExercise
{
  return self->_timeIncrementDuringExercise;
}

- (void)setTimeIncrementDuringExercise:(double)a3
{
  self->_timeIncrementDuringExercise = a3;
}

- (double)dawnTime
{
  return self->_dawnTime;
}

- (void)setDawnTime:(double)a3
{
  self->_dawnTime = a3;
}

- (double)sunsetTime
{
  return self->_sunsetTime;
}

- (void)setSunsetTime:(double)a3
{
  self->_sunsetTime = a3;
}

- (double)genericSampleTimeNoiseStdDev
{
  return self->_genericSampleTimeNoiseStdDev;
}

- (void)setGenericSampleTimeNoiseStdDev:(double)a3
{
  self->_genericSampleTimeNoiseStdDev = a3;
}

- (BOOL)createHighFidelityData
{
  return self->_createHighFidelityData;
}

- (void)setCreateHighFidelityData:(BOOL)a3
{
  self->_createHighFidelityData = a3;
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(int64_t)a3
{
  self->_profileType = a3;
}

- (double)uvIndexSampleFrequency
{
  return self->_uvIndexSampleFrequency;
}

- (void)setUvIndexSampleFrequency:(double)a3
{
  self->_uvIndexSampleFrequency = a3;
}

- (double)waistCircumferenceInInches
{
  return self->_waistCircumferenceInInches;
}

- (void)setWaistCircumferenceInInches:(double)a3
{
  self->_waistCircumferenceInInches = a3;
}

- (double)wristCircumferenceInInches
{
  return self->_wristCircumferenceInInches;
}

- (void)setWristCircumferenceInInches:(double)a3
{
  self->_wristCircumferenceInInches = a3;
}

- (double)forearmCircumferenceInInches
{
  return self->_forearmCircumferenceInInches;
}

- (void)setForearmCircumferenceInInches:(double)a3
{
  self->_forearmCircumferenceInInches = a3;
}

- (double)hipCircumferenceInInches
{
  return self->_hipCircumferenceInInches;
}

- (void)setHipCircumferenceInInches:(double)a3
{
  self->_hipCircumferenceInInches = a3;
}

- (double)heightSampleTime
{
  return self->_heightSampleTime;
}

- (void)setHeightSampleTime:(double)a3
{
  self->_heightSampleTime = a3;
}

- (double)heightTargetInCm
{
  return self->_heightTargetInCm;
}

- (void)setHeightTargetInCm:(double)a3
{
  self->_heightTargetInCm = a3;
}

- (double)heightSampleTimeFrequency
{
  return self->_heightSampleTimeFrequency;
}

- (void)setHeightSampleTimeFrequency:(double)a3
{
  self->_heightSampleTimeFrequency = a3;
}

- (double)heightSampleNoiseStdDev
{
  return self->_heightSampleNoiseStdDev;
}

- (void)setHeightSampleNoiseStdDev:(double)a3
{
  self->_heightSampleNoiseStdDev = a3;
}

- (double)weightSampleTime
{
  return self->_weightSampleTime;
}

- (void)setWeightSampleTime:(double)a3
{
  self->_weightSampleTime = a3;
}

- (double)weightTargetInKg
{
  return self->_weightTargetInKg;
}

- (void)setWeightTargetInKg:(double)a3
{
  self->_weightTargetInKg = a3;
}

- (double)weightSampleTimeFrequency
{
  return self->_weightSampleTimeFrequency;
}

- (void)setWeightSampleTimeFrequency:(double)a3
{
  self->_weightSampleTimeFrequency = a3;
}

- (double)weightSampleNoiseStdDev
{
  return self->_weightSampleNoiseStdDev;
}

- (void)setWeightSampleNoiseStdDev:(double)a3
{
  self->_weightSampleNoiseStdDev = a3;
}

- (double)weightLossStartDay
{
  return self->_weightLossStartDay;
}

- (void)setWeightLossStartDay:(double)a3
{
  self->_weightLossStartDay = a3;
}

- (double)weightDailyChangeStdDev
{
  return self->_weightDailyChangeStdDev;
}

- (void)setWeightDailyChangeStdDev:(double)a3
{
  self->_weightDailyChangeStdDev = a3;
}

- (double)weightDailyMaxLoss
{
  return self->_weightDailyMaxLoss;
}

- (void)setWeightDailyMaxLoss:(double)a3
{
  self->_weightDailyMaxLoss = a3;
}

- (double)weightChangePercentageMax
{
  return self->_weightChangePercentageMax;
}

- (void)setWeightChangePercentageMax:(double)a3
{
  self->_weightChangePercentageMax = a3;
}

- (NSArray)weightGainHolidayDaysInYear
{
  return self->_weightGainHolidayDaysInYear;
}

- (void)setWeightGainHolidayDaysInYear:(id)a3
{
  objc_storeStrong((id *)&self->_weightGainHolidayDaysInYear, a3);
}

- (int64_t)restingHeartRate
{
  return self->_restingHeartRate;
}

- (void)setRestingHeartRate:(int64_t)a3
{
  self->_restingHeartRate = a3;
}

- (int64_t)restingHeartRateMaxDailyDifference
{
  return self->_restingHeartRateMaxDailyDifference;
}

- (void)setRestingHeartRateMaxDailyDifference:(int64_t)a3
{
  self->_restingHeartRateMaxDailyDifference = a3;
}

- (int64_t)restingHeartRateMaxTotalDifference
{
  return self->_restingHeartRateMaxTotalDifference;
}

- (void)setRestingHeartRateMaxTotalDifference:(int64_t)a3
{
  self->_restingHeartRateMaxTotalDifference = a3;
}

- (int64_t)walkingHeartRateAverage
{
  return self->_walkingHeartRateAverage;
}

- (void)setWalkingHeartRateAverage:(int64_t)a3
{
  self->_walkingHeartRateAverage = a3;
}

- (int64_t)walkingHeartRateAverageMaxDailyDifference
{
  return self->_walkingHeartRateAverageMaxDailyDifference;
}

- (void)setWalkingHeartRateAverageMaxDailyDifference:(int64_t)a3
{
  self->_walkingHeartRateAverageMaxDailyDifference = a3;
}

- (int64_t)walkingHeartRateAverageMaxTotalDifference
{
  return self->_walkingHeartRateAverageMaxTotalDifference;
}

- (void)setWalkingHeartRateAverageMaxTotalDifference:(int64_t)a3
{
  self->_walkingHeartRateAverageMaxTotalDifference = a3;
}

- (double)heartRateSampleFrequency
{
  return self->_heartRateSampleFrequency;
}

- (void)setHeartRateSampleFrequency:(double)a3
{
  self->_heartRateSampleFrequency = a3;
}

- (double)heartRateSampleFrequencyStdDev
{
  return self->_heartRateSampleFrequencyStdDev;
}

- (void)setHeartRateSampleFrequencyStdDev:(double)a3
{
  self->_heartRateSampleFrequencyStdDev = a3;
}

- (double)heartRateSampleNoiseStdDev
{
  return self->_heartRateSampleNoiseStdDev;
}

- (void)setHeartRateSampleNoiseStdDev:(double)a3
{
  self->_heartRateSampleNoiseStdDev = a3;
}

- (double)heartRateRecovery
{
  return self->_heartRateRecovery;
}

- (void)setHeartRateRecovery:(double)a3
{
  self->_heartRateRecovery = a3;
}

- (double)heartRateRecoveryValueStdDev
{
  return self->_heartRateRecoveryValueStdDev;
}

- (void)setHeartRateRecoveryValueStdDev:(double)a3
{
  self->_heartRateRecoveryValueStdDev = a3;
}

- (double)heartRateRecoveryValueMaxConsecutiveDifference
{
  return self->_heartRateRecoveryValueMaxConsecutiveDifference;
}

- (void)setHeartRateRecoveryValueMaxConsecutiveDifference:(double)a3
{
  self->_heartRateRecoveryValueMaxConsecutiveDifference = a3;
}

- (double)heartRateRecoveryValueMaxTotalDifference
{
  return self->_heartRateRecoveryValueMaxTotalDifference;
}

- (void)setHeartRateRecoveryValueMaxTotalDifference:(double)a3
{
  self->_heartRateRecoveryValueMaxTotalDifference = a3;
}

- (double)vo2MaxValueStdDev
{
  return self->_vo2MaxValueStdDev;
}

- (void)setVo2MaxValueStdDev:(double)a3
{
  self->_vo2MaxValueStdDev = a3;
}

- (double)vo2MaxValueMaxConsecutiveDifference
{
  return self->_vo2MaxValueMaxConsecutiveDifference;
}

- (void)setVo2MaxValueMaxConsecutiveDifference:(double)a3
{
  self->_vo2MaxValueMaxConsecutiveDifference = a3;
}

- (double)vo2MaxValueMaxTotalDifference
{
  return self->_vo2MaxValueMaxTotalDifference;
}

- (void)setVo2MaxValueMaxTotalDifference:(double)a3
{
  self->_vo2MaxValueMaxTotalDifference = a3;
}

- (double)vo2MaxSampleTimeNoiseStdDev
{
  return self->_vo2MaxSampleTimeNoiseStdDev;
}

- (void)setVo2MaxSampleTimeNoiseStdDev:(double)a3
{
  self->_vo2MaxSampleTimeNoiseStdDev = a3;
}

- (int64_t)restingRespirationRate
{
  return self->_restingRespirationRate;
}

- (void)setRestingRespirationRate:(int64_t)a3
{
  self->_restingRespirationRate = a3;
}

- (double)restingRespirationRateSampleFrequency
{
  return self->_restingRespirationRateSampleFrequency;
}

- (void)setRestingRespirationRateSampleFrequency:(double)a3
{
  self->_restingRespirationRateSampleFrequency = a3;
}

- (double)restingRespirationRateSampleFrequencyDuringSleep
{
  return self->_restingRespirationRateSampleFrequencyDuringSleep;
}

- (void)setRestingRespirationRateSampleFrequencyDuringSleep:(double)a3
{
  self->_restingRespirationRateSampleFrequencyDuringSleep = a3;
}

- (double)restingRespirationRateSampleNoiseStdDev
{
  return self->_restingRespirationRateSampleNoiseStdDev;
}

- (void)setRestingRespirationRateSampleNoiseStdDev:(double)a3
{
  self->_restingRespirationRateSampleNoiseStdDev = a3;
}

- (double)bloodPressureSampleFrequency
{
  return self->_bloodPressureSampleFrequency;
}

- (void)setBloodPressureSampleFrequency:(double)a3
{
  self->_bloodPressureSampleFrequency = a3;
}

- (int64_t)restingSystolicBloodPressure
{
  return self->_restingSystolicBloodPressure;
}

- (void)setRestingSystolicBloodPressure:(int64_t)a3
{
  self->_restingSystolicBloodPressure = a3;
}

- (int64_t)restingDiastolicBloodPressure
{
  return self->_restingDiastolicBloodPressure;
}

- (void)setRestingDiastolicBloodPressure:(int64_t)a3
{
  self->_restingDiastolicBloodPressure = a3;
}

- (double)restingSystolicBloodPressureSampleNoiseStdDev
{
  return self->_restingSystolicBloodPressureSampleNoiseStdDev;
}

- (void)setRestingSystolicBloodPressureSampleNoiseStdDev:(double)a3
{
  self->_restingSystolicBloodPressureSampleNoiseStdDev = a3;
}

- (double)restingDiastolicBloodPressureSampleNoiseStdDev
{
  return self->_restingDiastolicBloodPressureSampleNoiseStdDev;
}

- (void)setRestingDiastolicBloodPressureSampleNoiseStdDev:(double)a3
{
  self->_restingDiastolicBloodPressureSampleNoiseStdDev = a3;
}

- (double)bodyTempFeverMultiplier
{
  return self->_bodyTempFeverMultiplier;
}

- (void)setBodyTempFeverMultiplier:(double)a3
{
  self->_bodyTempFeverMultiplier = a3;
}

- (double)bodyTempExerciseMultiplier
{
  return self->_bodyTempExerciseMultiplier;
}

- (void)setBodyTempExerciseMultiplier:(double)a3
{
  self->_bodyTempExerciseMultiplier = a3;
}

- (double)bodyTempSampleFrequency
{
  return self->_bodyTempSampleFrequency;
}

- (void)setBodyTempSampleFrequency:(double)a3
{
  self->_bodyTempSampleFrequency = a3;
}

- (double)bodyTempSampleNoiseStdDev
{
  return self->_bodyTempSampleNoiseStdDev;
}

- (void)setBodyTempSampleNoiseStdDev:(double)a3
{
  self->_bodyTempSampleNoiseStdDev = a3;
}

- (double)baseCorrectedWristSkinTemperatureInCelsius
{
  return self->_baseCorrectedWristSkinTemperatureInCelsius;
}

- (void)setBaseCorrectedWristSkinTemperatureInCelsius:(double)a3
{
  self->_baseCorrectedWristSkinTemperatureInCelsius = a3;
}

- (double)dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius
{
  return self->_dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius;
}

- (void)setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:(double)a3
{
  self->_dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius = a3;
}

- (double)oxygenSaturationMean
{
  return self->_oxygenSaturationMean;
}

- (void)setOxygenSaturationMean:(double)a3
{
  self->_oxygenSaturationMean = a3;
}

- (double)oxygenSaturationStdDev
{
  return self->_oxygenSaturationStdDev;
}

- (void)setOxygenSaturationStdDev:(double)a3
{
  self->_oxygenSaturationStdDev = a3;
}

- (double)oxygenSaturationMeanAtElevation
{
  return self->_oxygenSaturationMeanAtElevation;
}

- (void)setOxygenSaturationMeanAtElevation:(double)a3
{
  self->_oxygenSaturationMeanAtElevation = a3;
}

- (double)oxygenSaturationStdDevAtElevation
{
  return self->_oxygenSaturationStdDevAtElevation;
}

- (void)setOxygenSaturationStdDevAtElevation:(double)a3
{
  self->_oxygenSaturationStdDevAtElevation = a3;
}

- (double)oxygenSaturationMeasuringSuccessRate
{
  return self->_oxygenSaturationMeasuringSuccessRate;
}

- (void)setOxygenSaturationMeasuringSuccessRate:(double)a3
{
  self->_oxygenSaturationMeasuringSuccessRate = a3;
}

- (double)oxygenSaturationMeasuringSuccessRateDuringSleep
{
  return self->_oxygenSaturationMeasuringSuccessRateDuringSleep;
}

- (void)setOxygenSaturationMeasuringSuccessRateDuringSleep:(double)a3
{
  self->_oxygenSaturationMeasuringSuccessRateDuringSleep = a3;
}

- (double)oxygenSaturationSampleFrequency
{
  return self->_oxygenSaturationSampleFrequency;
}

- (void)setOxygenSaturationSampleFrequency:(double)a3
{
  self->_oxygenSaturationSampleFrequency = a3;
}

- (double)peripheralPerfusionIndexMean
{
  return self->_peripheralPerfusionIndexMean;
}

- (void)setPeripheralPerfusionIndexMean:(double)a3
{
  self->_peripheralPerfusionIndexMean = a3;
}

- (double)peripheralPerfusionIndexSampleFrequency
{
  return self->_peripheralPerfusionIndexSampleFrequency;
}

- (void)setPeripheralPerfusionIndexSampleFrequency:(double)a3
{
  self->_peripheralPerfusionIndexSampleFrequency = a3;
}

- (double)peripheralPerfusionIndexStdDev
{
  return self->_peripheralPerfusionIndexStdDev;
}

- (void)setPeripheralPerfusionIndexStdDev:(double)a3
{
  self->_peripheralPerfusionIndexStdDev = a3;
}

- (double)sexualActivityProbabilityPercentage
{
  return self->_sexualActivityProbabilityPercentage;
}

- (void)setSexualActivityProbabilityPercentage:(double)a3
{
  self->_sexualActivityProbabilityPercentage = a3;
}

- (double)sexualActivityProtectionProbabilityPercentage
{
  return self->_sexualActivityProtectionProbabilityPercentage;
}

- (void)setSexualActivityProtectionProbabilityPercentage:(double)a3
{
  self->_sexualActivityProtectionProbabilityPercentage = a3;
}

- (double)sexualActivityProtectionDocumentationProbabilityPercentage
{
  return self->_sexualActivityProtectionDocumentationProbabilityPercentage;
}

- (void)setSexualActivityProtectionDocumentationProbabilityPercentage:(double)a3
{
  self->_sexualActivityProtectionDocumentationProbabilityPercentage = a3;
}

- (double)menstrualPeriodFrequency
{
  return self->_menstrualPeriodFrequency;
}

- (void)setMenstrualPeriodFrequency:(double)a3
{
  self->_menstrualPeriodFrequency = a3;
}

- (BOOL)sexualActivityIsTryingToConceive
{
  return self->_sexualActivityIsTryingToConceive;
}

- (void)setSexualActivityIsTryingToConceive:(BOOL)a3
{
  self->_sexualActivityIsTryingToConceive = a3;
}

- (double)ovulationIndeterminateProbabilityPercentage
{
  return self->_ovulationIndeterminateProbabilityPercentage;
}

- (void)setOvulationIndeterminateProbabilityPercentage:(double)a3
{
  self->_ovulationIndeterminateProbabilityPercentage = a3;
}

- (double)fitzpatrickSkinTypeSampleTime
{
  return self->_fitzpatrickSkinTypeSampleTime;
}

- (void)setFitzpatrickSkinTypeSampleTime:(double)a3
{
  self->_fitzpatrickSkinTypeSampleTime = a3;
}

- (int64_t)fitzpatrickSkinTypeScore
{
  return self->_fitzpatrickSkinTypeScore;
}

- (void)setFitzpatrickSkinTypeScore:(int64_t)a3
{
  self->_fitzpatrickSkinTypeScore = a3;
}

- (double)toothbrushingDurationMean
{
  return self->_toothbrushingDurationMean;
}

- (void)setToothbrushingDurationMean:(double)a3
{
  self->_toothbrushingDurationMean = a3;
}

- (double)toothbrushingDurationMeanStdDev
{
  return self->_toothbrushingDurationMeanStdDev;
}

- (void)setToothbrushingDurationMeanStdDev:(double)a3
{
  self->_toothbrushingDurationMeanStdDev = a3;
}

- (double)handwashingDurationMean
{
  return self->_handwashingDurationMean;
}

- (void)setHandwashingDurationMean:(double)a3
{
  self->_handwashingDurationMean = a3;
}

- (double)handwashingDurationMeanStdDev
{
  return self->_handwashingDurationMeanStdDev;
}

- (void)setHandwashingDurationMeanStdDev:(double)a3
{
  self->_handwashingDurationMeanStdDev = a3;
}

- (double)handwashingSampleFrequency
{
  return self->_handwashingSampleFrequency;
}

- (void)setHandwashingSampleFrequency:(double)a3
{
  self->_handwashingSampleFrequency = a3;
}

- (double)handwashingSampleFrequencyStdDev
{
  return self->_handwashingSampleFrequencyStdDev;
}

- (void)setHandwashingSampleFrequencyStdDev:(double)a3
{
  self->_handwashingSampleFrequencyStdDev = a3;
}

- (double)timeInDaylightDurationMean
{
  return self->_timeInDaylightDurationMean;
}

- (void)setTimeInDaylightDurationMean:(double)a3
{
  self->_timeInDaylightDurationMean = a3;
}

- (double)timeInDaylightDurationMeanStdDev
{
  return self->_timeInDaylightDurationMeanStdDev;
}

- (void)setTimeInDaylightDurationMeanStdDev:(double)a3
{
  self->_timeInDaylightDurationMeanStdDev = a3;
}

- (double)timeInDaylightSampleFrequency
{
  return self->_timeInDaylightSampleFrequency;
}

- (void)setTimeInDaylightSampleFrequency:(double)a3
{
  self->_timeInDaylightSampleFrequency = a3;
}

- (double)timeInDaylightSampleFrequencyStdDev
{
  return self->_timeInDaylightSampleFrequencyStdDev;
}

- (void)setTimeInDaylightSampleFrequencyStdDev:(double)a3
{
  self->_timeInDaylightSampleFrequencyStdDev = a3;
}

- (double)activeCaloriesSampleFrequency
{
  return self->_activeCaloriesSampleFrequency;
}

- (void)setActiveCaloriesSampleFrequency:(double)a3
{
  self->_activeCaloriesSampleFrequency = a3;
}

- (double)restingCaloriesSampleFrequency
{
  return self->_restingCaloriesSampleFrequency;
}

- (void)setRestingCaloriesSampleFrequency:(double)a3
{
  self->_restingCaloriesSampleFrequency = a3;
}

- (double)stepsSampleFrequency
{
  return self->_stepsSampleFrequency;
}

- (void)setStepsSampleFrequency:(double)a3
{
  self->_stepsSampleFrequency = a3;
}

- (double)stepsSampleFrequencyDuringExercise
{
  return self->_stepsSampleFrequencyDuringExercise;
}

- (void)setStepsSampleFrequencyDuringExercise:(double)a3
{
  self->_stepsSampleFrequencyDuringExercise = a3;
}

- (double)sedentarySampleFrequency
{
  return self->_sedentarySampleFrequency;
}

- (void)setSedentarySampleFrequency:(double)a3
{
  self->_sedentarySampleFrequency = a3;
}

- (void)setExerciseTimeSampleFrequency:(double)a3
{
  self->_exerciseTimeSampleFrequency = a3;
}

- (double)moveGoal
{
  return self->_moveGoal;
}

- (void)setMoveGoal:(double)a3
{
  self->_moveGoal = a3;
}

- (double)exerciseGoal
{
  return self->_exerciseGoal;
}

- (void)setExerciseGoal:(double)a3
{
  self->_exerciseGoal = a3;
}

- (double)standGoal
{
  return self->_standGoal;
}

- (void)setStandGoal:(double)a3
{
  self->_standGoal = a3;
}

- (double)runningPowerMean
{
  return self->_runningPowerMean;
}

- (void)setRunningPowerMean:(double)a3
{
  self->_runningPowerMean = a3;
}

- (double)runningPowerMeanStdDev
{
  return self->_runningPowerMeanStdDev;
}

- (void)setRunningPowerMeanStdDev:(double)a3
{
  self->_runningPowerMeanStdDev = a3;
}

- (double)runningStrideLengthMean
{
  return self->_runningStrideLengthMean;
}

- (void)setRunningStrideLengthMean:(double)a3
{
  self->_runningStrideLengthMean = a3;
}

- (double)runningStrideLengthMeanStdDev
{
  return self->_runningStrideLengthMeanStdDev;
}

- (void)setRunningStrideLengthMeanStdDev:(double)a3
{
  self->_runningStrideLengthMeanStdDev = a3;
}

- (double)runningVerticalOscillationMean
{
  return self->_runningVerticalOscillationMean;
}

- (void)setRunningVerticalOscillationMean:(double)a3
{
  self->_runningVerticalOscillationMean = a3;
}

- (double)runningVerticalOscillationMeanStdDev
{
  return self->_runningVerticalOscillationMeanStdDev;
}

- (void)setRunningVerticalOscillationMeanStdDev:(double)a3
{
  self->_runningVerticalOscillationMeanStdDev = a3;
}

- (double)runningGroundContactTimeMean
{
  return self->_runningGroundContactTimeMean;
}

- (void)setRunningGroundContactTimeMean:(double)a3
{
  self->_runningGroundContactTimeMean = a3;
}

- (double)runningGroundContactTimeMeanStdDev
{
  return self->_runningGroundContactTimeMeanStdDev;
}

- (void)setRunningGroundContactTimeMeanStdDev:(double)a3
{
  self->_runningGroundContactTimeMeanStdDev = a3;
}

- (double)swimmingStrokesPerYard
{
  return self->_swimmingStrokesPerYard;
}

- (void)setSwimmingStrokesPerYard:(double)a3
{
  self->_swimmingStrokesPerYard = a3;
}

- (double)cyclingPowerMean
{
  return self->_cyclingPowerMean;
}

- (void)setCyclingPowerMean:(double)a3
{
  self->_cyclingPowerMean = a3;
}

- (double)cyclingPowerMeanStdDev
{
  return self->_cyclingPowerMeanStdDev;
}

- (void)setCyclingPowerMeanStdDev:(double)a3
{
  self->_cyclingPowerMeanStdDev = a3;
}

- (double)cyclingFTPMean
{
  return self->_cyclingFTPMean;
}

- (void)setCyclingFTPMean:(double)a3
{
  self->_cyclingFTPMean = a3;
}

- (double)cyclingFTPMeanStdDev
{
  return self->_cyclingFTPMeanStdDev;
}

- (void)setCyclingFTPMeanStdDev:(double)a3
{
  self->_cyclingFTPMeanStdDev = a3;
}

- (double)cyclingCadenceMean
{
  return self->_cyclingCadenceMean;
}

- (void)setCyclingCadenceMean:(double)a3
{
  self->_cyclingCadenceMean = a3;
}

- (double)cyclingCadenceMeanStdDev
{
  return self->_cyclingCadenceMeanStdDev;
}

- (void)setCyclingCadenceMeanStdDev:(double)a3
{
  self->_cyclingCadenceMeanStdDev = a3;
}

- (double)cyclingSpeedMean
{
  return self->_cyclingSpeedMean;
}

- (void)setCyclingSpeedMean:(double)a3
{
  self->_cyclingSpeedMean = a3;
}

- (double)speedMeanStdDev
{
  return self->_speedMeanStdDev;
}

- (void)setSpeedMeanStdDev:(double)a3
{
  self->_speedMeanStdDev = a3;
}

- (double)underwaterDivingWaterTemperatureMean
{
  return self->_underwaterDivingWaterTemperatureMean;
}

- (void)setUnderwaterDivingWaterTemperatureMean:(double)a3
{
  self->_underwaterDivingWaterTemperatureMean = a3;
}

- (double)underwaterDivingWaterTemperatureStdDev
{
  return self->_underwaterDivingWaterTemperatureStdDev;
}

- (void)setUnderwaterDivingWaterTemperatureStdDev:(double)a3
{
  self->_underwaterDivingWaterTemperatureStdDev = a3;
}

- (double)crossCountrySkiingSpeedMean
{
  return self->_crossCountrySkiingSpeedMean;
}

- (void)setCrossCountrySkiingSpeedMean:(double)a3
{
  self->_crossCountrySkiingSpeedMean = a3;
}

- (double)rowingSpeedMean
{
  return self->_rowingSpeedMean;
}

- (void)setRowingSpeedMean:(double)a3
{
  self->_rowingSpeedMean = a3;
}

- (double)paddleSportsSpeedMean
{
  return self->_paddleSportsSpeedMean;
}

- (void)setPaddleSportsSpeedMean:(double)a3
{
  self->_paddleSportsSpeedMean = a3;
}

- (double)exerciseStartTime
{
  return self->_exerciseStartTime;
}

- (void)setExerciseStartTime:(double)a3
{
  self->_exerciseStartTime = a3;
}

- (double)exerciseStopTime
{
  return self->_exerciseStopTime;
}

- (void)setExerciseStopTime:(double)a3
{
  self->_exerciseStopTime = a3;
}

- (double)exerciseCooldownTime
{
  return self->_exerciseCooldownTime;
}

- (void)setExerciseCooldownTime:(double)a3
{
  self->_exerciseCooldownTime = a3;
}

- (double)exerciseStartTimeStdDev
{
  return self->_exerciseStartTimeStdDev;
}

- (void)setExerciseStartTimeStdDev:(double)a3
{
  self->_exerciseStartTimeStdDev = a3;
}

- (double)exerciseStopTimeStdDev
{
  return self->_exerciseStopTimeStdDev;
}

- (void)setExerciseStopTimeStdDev:(double)a3
{
  self->_exerciseStopTimeStdDev = a3;
}

- (double)exerciseIntensityPercentage
{
  return self->_exerciseIntensityPercentage;
}

- (void)setExerciseIntensityPercentage:(double)a3
{
  self->_exerciseIntensityPercentage = a3;
}

- (NSDictionary)workoutPrototypesByCalendarDay
{
  return self->_workoutPrototypesByCalendarDay;
}

- (void)setWorkoutPrototypesByCalendarDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (double)exerciseWeeklyWorkoutsMean
{
  return self->_exerciseWeeklyWorkoutsMean;
}

- (void)setExerciseWeeklyWorkoutsMean:(double)a3
{
  self->_exerciseWeeklyWorkoutsMean = a3;
}

- (double)exerciseWeeklyWorkoutsStdDev
{
  return self->_exerciseWeeklyWorkoutsStdDev;
}

- (void)setExerciseWeeklyWorkoutsStdDev:(double)a3
{
  self->_exerciseWeeklyWorkoutsStdDev = a3;
}

- (double)exercisePostDietWeeklyWorkoutsMean
{
  return self->_exercisePostDietWeeklyWorkoutsMean;
}

- (void)setExercisePostDietWeeklyWorkoutsMean:(double)a3
{
  self->_exercisePostDietWeeklyWorkoutsMean = a3;
}

- (double)exercisePostDietWeeklyWorkoutsStdDev
{
  return self->_exercisePostDietWeeklyWorkoutsStdDev;
}

- (void)setExercisePostDietWeeklyWorkoutsStdDev:(double)a3
{
  self->_exercisePostDietWeeklyWorkoutsStdDev = a3;
}

- (double)flightsClimbedDailyMean
{
  return self->_flightsClimbedDailyMean;
}

- (void)setFlightsClimbedDailyMean:(double)a3
{
  self->_flightsClimbedDailyMean = a3;
}

- (double)flightsClimbedStdDev
{
  return self->_flightsClimbedStdDev;
}

- (void)setFlightsClimbedStdDev:(double)a3
{
  self->_flightsClimbedStdDev = a3;
}

- (double)flightsClimbedSampleTime
{
  return self->_flightsClimbedSampleTime;
}

- (void)setFlightsClimbedSampleTime:(double)a3
{
  self->_flightsClimbedSampleTime = a3;
}

- (double)flightsClimbedSampleFrequency
{
  return self->_flightsClimbedSampleFrequency;
}

- (void)setFlightsClimbedSampleFrequency:(double)a3
{
  self->_flightsClimbedSampleFrequency = a3;
}

- (double)flightsClimbedSampleFrequencyStdDev
{
  return self->_flightsClimbedSampleFrequencyStdDev;
}

- (void)setFlightsClimbedSampleFrequencyStdDev:(double)a3
{
  self->_flightsClimbedSampleFrequencyStdDev = a3;
}

- (double)rehabLogarithmicConstant
{
  return self->_rehabLogarithmicConstant;
}

- (void)setRehabLogarithmicConstant:(double)a3
{
  self->_rehabLogarithmicConstant = a3;
}

- (double)walkingSpeedMean
{
  return self->_walkingSpeedMean;
}

- (void)setWalkingSpeedMean:(double)a3
{
  self->_walkingSpeedMean = a3;
}

- (double)walkingSpeedStdDev
{
  return self->_walkingSpeedStdDev;
}

- (void)setWalkingSpeedStdDev:(double)a3
{
  self->_walkingSpeedStdDev = a3;
}

- (double)walkingSpeedSampleFrequency
{
  return self->_walkingSpeedSampleFrequency;
}

- (void)setWalkingSpeedSampleFrequency:(double)a3
{
  self->_walkingSpeedSampleFrequency = a3;
}

- (double)walkingSpeedSampleFrequencyStdDev
{
  return self->_walkingSpeedSampleFrequencyStdDev;
}

- (void)setWalkingSpeedSampleFrequencyStdDev:(double)a3
{
  self->_walkingSpeedSampleFrequencyStdDev = a3;
}

- (double)stepLengthMean
{
  return self->_stepLengthMean;
}

- (void)setStepLengthMean:(double)a3
{
  self->_stepLengthMean = a3;
}

- (double)stepLengthStdDev
{
  return self->_stepLengthStdDev;
}

- (void)setStepLengthStdDev:(double)a3
{
  self->_stepLengthStdDev = a3;
}

- (double)stepLengthSampleFrequency
{
  return self->_stepLengthSampleFrequency;
}

- (void)setStepLengthSampleFrequency:(double)a3
{
  self->_stepLengthSampleFrequency = a3;
}

- (double)stepLengthSampleFrequencyStdDev
{
  return self->_stepLengthSampleFrequencyStdDev;
}

- (void)setStepLengthSampleFrequencyStdDev:(double)a3
{
  self->_stepLengthSampleFrequencyStdDev = a3;
}

- (double)asymmetryPercentageMean
{
  return self->_asymmetryPercentageMean;
}

- (void)setAsymmetryPercentageMean:(double)a3
{
  self->_asymmetryPercentageMean = a3;
}

- (double)asymmetryPercentageStdDev
{
  return self->_asymmetryPercentageStdDev;
}

- (void)setAsymmetryPercentageStdDev:(double)a3
{
  self->_asymmetryPercentageStdDev = a3;
}

- (double)asymmetryPercentageSampleFrequency
{
  return self->_asymmetryPercentageSampleFrequency;
}

- (void)setAsymmetryPercentageSampleFrequency:(double)a3
{
  self->_asymmetryPercentageSampleFrequency = a3;
}

- (double)asymmetryPercentageSampleFrequencyStdDev
{
  return self->_asymmetryPercentageSampleFrequencyStdDev;
}

- (void)setAsymmetryPercentageSampleFrequencyStdDev:(double)a3
{
  self->_asymmetryPercentageSampleFrequencyStdDev = a3;
}

- (double)doubleSupportPercentageMean
{
  return self->_doubleSupportPercentageMean;
}

- (void)setDoubleSupportPercentageMean:(double)a3
{
  self->_doubleSupportPercentageMean = a3;
}

- (double)doubleSupportPercentageStdDev
{
  return self->_doubleSupportPercentageStdDev;
}

- (void)setDoubleSupportPercentageStdDev:(double)a3
{
  self->_doubleSupportPercentageStdDev = a3;
}

- (double)doubleSupportPercentageSampleFrequency
{
  return self->_doubleSupportPercentageSampleFrequency;
}

- (void)setDoubleSupportPercentageSampleFrequency:(double)a3
{
  self->_doubleSupportPercentageSampleFrequency = a3;
}

- (double)doubleSupportPercentageSampleFrequencyStdDev
{
  return self->_doubleSupportPercentageSampleFrequencyStdDev;
}

- (void)setDoubleSupportPercentageSampleFrequencyStdDev:(double)a3
{
  self->_doubleSupportPercentageSampleFrequencyStdDev = a3;
}

- (double)sixMinuteWalkTestDistanceMean
{
  return self->_sixMinuteWalkTestDistanceMean;
}

- (void)setSixMinuteWalkTestDistanceMean:(double)a3
{
  self->_sixMinuteWalkTestDistanceMean = a3;
}

- (double)sixMinuteWalkTestDistanceStdDev
{
  return self->_sixMinuteWalkTestDistanceStdDev;
}

- (void)setSixMinuteWalkTestDistanceStdDev:(double)a3
{
  self->_sixMinuteWalkTestDistanceStdDev = a3;
}

- (double)sixMinuteWalkTestDistanceSampleFrequency
{
  return self->_sixMinuteWalkTestDistanceSampleFrequency;
}

- (void)setSixMinuteWalkTestDistanceSampleFrequency:(double)a3
{
  self->_sixMinuteWalkTestDistanceSampleFrequency = a3;
}

- (double)sixMinuteWalkTestDistanceSampleFrequencyStdDev
{
  return self->_sixMinuteWalkTestDistanceSampleFrequencyStdDev;
}

- (void)setSixMinuteWalkTestDistanceSampleFrequencyStdDev:(double)a3
{
  self->_sixMinuteWalkTestDistanceSampleFrequencyStdDev = a3;
}

- (double)stairAscentSpeedMean
{
  return self->_stairAscentSpeedMean;
}

- (void)setStairAscentSpeedMean:(double)a3
{
  self->_stairAscentSpeedMean = a3;
}

- (double)stairAscentSpeedStdDev
{
  return self->_stairAscentSpeedStdDev;
}

- (void)setStairAscentSpeedStdDev:(double)a3
{
  self->_stairAscentSpeedStdDev = a3;
}

- (double)stairAscentSpeedSampleFrequency
{
  return self->_stairAscentSpeedSampleFrequency;
}

- (void)setStairAscentSpeedSampleFrequency:(double)a3
{
  self->_stairAscentSpeedSampleFrequency = a3;
}

- (double)stairAscentSpeedSampleFrequencyStdDev
{
  return self->_stairAscentSpeedSampleFrequencyStdDev;
}

- (void)setStairAscentSpeedSampleFrequencyStdDev:(double)a3
{
  self->_stairAscentSpeedSampleFrequencyStdDev = a3;
}

- (double)stairDescentSpeedMean
{
  return self->_stairDescentSpeedMean;
}

- (void)setStairDescentSpeedMean:(double)a3
{
  self->_stairDescentSpeedMean = a3;
}

- (double)stairDescentSpeedStdDev
{
  return self->_stairDescentSpeedStdDev;
}

- (void)setStairDescentSpeedStdDev:(double)a3
{
  self->_stairDescentSpeedStdDev = a3;
}

- (double)stairDescentSpeedSampleFrequency
{
  return self->_stairDescentSpeedSampleFrequency;
}

- (void)setStairDescentSpeedSampleFrequency:(double)a3
{
  self->_stairDescentSpeedSampleFrequency = a3;
}

- (double)stairDescentSpeedSampleFrequencyStdDev
{
  return self->_stairDescentSpeedSampleFrequencyStdDev;
}

- (void)setStairDescentSpeedSampleFrequencyStdDev:(double)a3
{
  self->_stairDescentSpeedSampleFrequencyStdDev = a3;
}

- (double)walkingSteadinessMean
{
  return self->_walkingSteadinessMean;
}

- (void)setWalkingSteadinessMean:(double)a3
{
  self->_walkingSteadinessMean = a3;
}

- (double)walkingSteadinessStdDev
{
  return self->_walkingSteadinessStdDev;
}

- (void)setWalkingSteadinessStdDev:(double)a3
{
  self->_walkingSteadinessStdDev = a3;
}

- (double)walkingSteadinessSampleFrequency
{
  return self->_walkingSteadinessSampleFrequency;
}

- (void)setWalkingSteadinessSampleFrequency:(double)a3
{
  self->_walkingSteadinessSampleFrequency = a3;
}

- (double)walkingSteadinessSampleFrequencyStdDev
{
  return self->_walkingSteadinessSampleFrequencyStdDev;
}

- (void)setWalkingSteadinessSampleFrequencyStdDev:(double)a3
{
  self->_walkingSteadinessSampleFrequencyStdDev = a3;
}

- (double)breakfastTime
{
  return self->_breakfastTime;
}

- (void)setBreakfastTime:(double)a3
{
  self->_breakfastTime = a3;
}

- (double)lunchTime
{
  return self->_lunchTime;
}

- (void)setLunchTime:(double)a3
{
  self->_lunchTime = a3;
}

- (double)snackTime
{
  return self->_snackTime;
}

- (void)setSnackTime:(double)a3
{
  self->_snackTime = a3;
}

- (double)dinnerTime
{
  return self->_dinnerTime;
}

- (void)setDinnerTime:(double)a3
{
  self->_dinnerTime = a3;
}

- (double)mealTimeSampleNoiseStdDev
{
  return self->_mealTimeSampleNoiseStdDev;
}

- (void)setMealTimeSampleNoiseStdDev:(double)a3
{
  self->_mealTimeSampleNoiseStdDev = a3;
}

- (double)breakfastTimeSampleNoiseStdDev
{
  return self->_breakfastTimeSampleNoiseStdDev;
}

- (void)setBreakfastTimeSampleNoiseStdDev:(double)a3
{
  self->_breakfastTimeSampleNoiseStdDev = a3;
}

- (double)preDietIntakeMultiplier
{
  return self->_preDietIntakeMultiplier;
}

- (void)setPreDietIntakeMultiplier:(double)a3
{
  self->_preDietIntakeMultiplier = a3;
}

- (double)numCupsOfCoffeeDailyMean
{
  return self->_numCupsOfCoffeeDailyMean;
}

- (void)setNumCupsOfCoffeeDailyMean:(double)a3
{
  self->_numCupsOfCoffeeDailyMean = a3;
}

- (double)numCupsOfCoffeeStdDev
{
  return self->_numCupsOfCoffeeStdDev;
}

- (void)setNumCupsOfCoffeeStdDev:(double)a3
{
  self->_numCupsOfCoffeeStdDev = a3;
}

- (double)waterConsumedSampleTime
{
  return self->_waterConsumedSampleTime;
}

- (void)setWaterConsumedSampleTime:(double)a3
{
  self->_waterConsumedSampleTime = a3;
}

- (double)waterConsumedSampleFrequency
{
  return self->_waterConsumedSampleFrequency;
}

- (void)setWaterConsumedSampleFrequency:(double)a3
{
  self->_waterConsumedSampleFrequency = a3;
}

- (double)waterConsumedDailyMean
{
  return self->_waterConsumedDailyMean;
}

- (void)setWaterConsumedDailyMean:(double)a3
{
  self->_waterConsumedDailyMean = a3;
}

- (double)waterConsumedStdDev
{
  return self->_waterConsumedStdDev;
}

- (void)setWaterConsumedStdDev:(double)a3
{
  self->_waterConsumedStdDev = a3;
}

- (double)waterConsumedIntervalMean
{
  return self->_waterConsumedIntervalMean;
}

- (void)setWaterConsumedIntervalMean:(double)a3
{
  self->_waterConsumedIntervalMean = a3;
}

- (double)waterConsumedIntervalStdDev
{
  return self->_waterConsumedIntervalStdDev;
}

- (void)setWaterConsumedIntervalStdDev:(double)a3
{
  self->_waterConsumedIntervalStdDev = a3;
}

- (HDDemoDataSleepParameters)weekdaySleepParameters
{
  return self->_weekdaySleepParameters;
}

- (void)setWeekdaySleepParameters:(id)a3
{
  objc_storeStrong((id *)&self->_weekdaySleepParameters, a3);
}

- (HDDemoDataSleepParameters)weekendSleepParameters
{
  return self->_weekendSleepParameters;
}

- (void)setWeekendSleepParameters:(id)a3
{
  objc_storeStrong((id *)&self->_weekendSleepParameters, a3);
}

- (double)wakeUpTimeNoiseStdDev
{
  return self->_wakeUpTimeNoiseStdDev;
}

- (void)setWakeUpTimeNoiseStdDev:(double)a3
{
  self->_wakeUpTimeNoiseStdDev = a3;
}

- (double)bedtimeNoiseStdDev
{
  return self->_bedtimeNoiseStdDev;
}

- (void)setBedtimeNoiseStdDev:(double)a3
{
  self->_bedtimeNoiseStdDev = a3;
}

- (double)inBedTimeStdDev
{
  return self->_inBedTimeStdDev;
}

- (void)setInBedTimeStdDev:(double)a3
{
  self->_inBedTimeStdDev = a3;
}

- (double)fallSampleFrequency
{
  return self->_fallSampleFrequency;
}

- (void)setFallSampleFrequency:(double)a3
{
  self->_fallSampleFrequency = a3;
}

- (double)fallsDailyMean
{
  return self->_fallsDailyMean;
}

- (void)setFallsDailyMean:(double)a3
{
  self->_fallsDailyMean = a3;
}

- (double)fallsDailyStdDev
{
  return self->_fallsDailyStdDev;
}

- (void)setFallsDailyStdDev:(double)a3
{
  self->_fallsDailyStdDev = a3;
}

- (double)spirometrySampleFrequency
{
  return self->_spirometrySampleFrequency;
}

- (void)setSpirometrySampleFrequency:(double)a3
{
  self->_spirometrySampleFrequency = a3;
}

- (double)spirometrySampleTime
{
  return self->_spirometrySampleTime;
}

- (void)setSpirometrySampleTime:(double)a3
{
  self->_spirometrySampleTime = a3;
}

- (int64_t)asthmaSeverity
{
  return self->_asthmaSeverity;
}

- (void)setAsthmaSeverity:(int64_t)a3
{
  self->_asthmaSeverity = a3;
}

- (BOOL)useContinuousGlucoseMonitoring
{
  return self->_useContinuousGlucoseMonitoring;
}

- (void)setUseContinuousGlucoseMonitoring:(BOOL)a3
{
  self->_useContinuousGlucoseMonitoring = a3;
}

- (double)continuousGlucoseMonitoringSampleFrequency
{
  return self->_continuousGlucoseMonitoringSampleFrequency;
}

- (void)setContinuousGlucoseMonitoringSampleFrequency:(double)a3
{
  self->_continuousGlucoseMonitoringSampleFrequency = a3;
}

- (double)numDailyFingerSticksAdherence
{
  return self->_numDailyFingerSticksAdherence;
}

- (void)setNumDailyFingerSticksAdherence:(double)a3
{
  self->_numDailyFingerSticksAdherence = a3;
}

- (double)insulinSensitivity
{
  return self->_insulinSensitivity;
}

- (void)setInsulinSensitivity:(double)a3
{
  self->_insulinSensitivity = a3;
}

- (double)insulinProduction
{
  return self->_insulinProduction;
}

- (void)setInsulinProduction:(double)a3
{
  self->_insulinProduction = a3;
}

- (double)insulinAdherence
{
  return self->_insulinAdherence;
}

- (void)setInsulinAdherence:(double)a3
{
  self->_insulinAdherence = a3;
}

- (unint64_t)insulinTherapy
{
  return self->_insulinTherapy;
}

- (void)setInsulinTherapy:(unint64_t)a3
{
  self->_insulinTherapy = a3;
}

- (double)mindfulSessionFrequency
{
  return self->_mindfulSessionFrequency;
}

- (void)setMindfulSessionFrequency:(double)a3
{
  self->_mindfulSessionFrequency = a3;
}

- (int64_t)mindfulSessionMean
{
  return self->_mindfulSessionMean;
}

- (void)setMindfulSessionMean:(int64_t)a3
{
  self->_mindfulSessionMean = a3;
}

- (int64_t)mindfulSessionStdDev
{
  return self->_mindfulSessionStdDev;
}

- (void)setMindfulSessionStdDev:(int64_t)a3
{
  self->_mindfulSessionStdDev = a3;
}

- (int64_t)nutritionTrackingType
{
  return self->_nutritionTrackingType;
}

- (void)setNutritionTrackingType:(int64_t)a3
{
  self->_nutritionTrackingType = a3;
}

- (int64_t)resultsTrackingType
{
  return self->_resultsTrackingType;
}

- (void)setResultsTrackingType:(int64_t)a3
{
  self->_resultsTrackingType = a3;
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_weekendSleepParameters, 0);
  objc_storeStrong((id *)&self->_weekdaySleepParameters, 0);
  objc_storeStrong((id *)&self->_workoutPrototypesByCalendarDay, 0);
  objc_storeStrong((id *)&self->_weightGainHolidayDaysInYear, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_personDescription, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
