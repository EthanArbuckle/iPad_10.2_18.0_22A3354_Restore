@implementation HKMCProjectionAccuracyAnalytics

+ (BOOL)shouldSubmit
{
  int v3;

  v3 = objc_msgSend(a1, "_isMetricEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "_isAllowed");
  return v3;
}

+ (BOOL)_isMetricEnabled
{
  void *v2;
  char v3;
  void *v4;

  +[HKMCProjectionAccuracyMetric eventName](HKMCProjectionAccuracyMetric, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AnalyticsIsEventUsed() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hkmc_analyticsDebugModeEnabled");

  }
  return v3;
}

+ (id)_closestProjectionToLoggedDayIndex:(int64_t)a3 analysis:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a4, "menstruationProjections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HKMCProjectionAccuracyAnalytics__closestProjectionToLoggedDayIndex_analysis___block_invoke;
  v8[3] = &__block_descriptor_40_e24_d16__0__HKMCProjection_8l;
  v8[4] = a3;
  objc_msgSend(v5, "hk_firstObjectWithMinimumValueUsingEvaluationBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double __79__HKMCProjectionAccuracyAnalytics__closestProjectionToLoggedDayIndex_analysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "mostLikelyDays") - *(_QWORD *)(a1 + 32);
  if (v2 < 0)
    return (double)-v2;
  return (double)v2;
}

+ (void)submitMetricWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7 periodPredictionEnabled:(BOOL)a8 heartRateBasedPredictionEnabled:(BOOL)a9 wristTemperatureBasedPredictionEnabled:(BOOL)a10 isWristTemperatureInputDelivered:(BOOL)a11 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a12 cycles:(id)a13
{
  void *v13;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  _BOOL4 v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  _BOOL8 v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  HKMCProjectionAccuracyMetric *v55;
  uint64_t v56;
  void *v57;
  HKMCProjectionAccuracyMetric *v58;
  HKMCProjectionAccuracyMetric *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  _BOOL4 v75;
  BOOL v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD v84[5];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v18 = a6;
  v19 = a13;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    v76 = a7;
    objc_msgSend(v18, "menstruationProjections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x24BDAC760];
    v84[1] = 3221225472;
    v84[2] = __301__HKMCProjectionAccuracyAnalytics_submitMetricWithDayIndex_oldMenstrualFlow_newMenstrualFlow_analysis_isLoggingMultipleDays_periodPredictionEnabled_heartRateBasedPredictionEnabled_wristTemperatureBasedPredictionEnabled_isWristTemperatureInputDelivered_internalLiveOnCycleFactorOverrideEnabled_cycles___block_invoke;
    v84[3] = &__block_descriptor_40_e24_B16__0__HKMCProjection_8l;
    v84[4] = a3;
    objc_msgSend(v20, "hk_firstObjectPassingTest:", v84);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "mostLikelyDays");
    v25 = a3 >= v22 && a3 - v22 < v23;
    v75 = v25;
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = HKMCTodayIndex(v26);

    if (v19)
    {
      v27 = a1;
      v28 = (void *)MEMORY[0x24BDD16E0];
      v29 = objc_msgSend(v19, "count");
      if (v29)
      {
        objc_msgSend(v19, "firstObject");
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "menstruationSegment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = a3 - objc_msgSend(v13, "days") < 11;
      }
      else
      {
        v30 = 0;
      }
      objc_msgSend(v28, "numberWithInt:", v30);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

      }
      a1 = v27;
    }
    else
    {
      v82 = 0;
    }
    v77 = a8;
    if (v21)
    {
      v39 = v21;
    }
    else
    {
      objc_msgSend(a1, "_closestProjectionToLoggedDayIndex:analysis:", a3, v18);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        v48 = 0;
        v79 = 0;
        v80 = 0;
        v81 = 0;
LABEL_26:
        NSStringFromPredictionPrimarySource(objc_msgSend(v39, "predictionPrimarySource"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "allDays");
        v51 = v50;
        v72 = objc_msgSend(v39, "isPartiallyLogged");
        v83 = 0;
        objc_msgSend(a1, "_isSleepConfiguredForWristTemperatureMeasurementsWithError:", &v83);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v83;
        v78 = v53;
        if (v52 || !v53)
        {
          v70 = v49;
          v71 = v21;
          v55 = [HKMCProjectionAccuracyMetric alloc];
          v56 = v73 - a3;
          HKMCActiveWatchPairedProductType();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v52;
          BYTE3(v68) = a12;
          BYTE2(v68) = objc_msgSend(v52, "BOOLValue");
          LOWORD(v68) = __PAIR16__(a11, a10);
          v74 = v48;
          BYTE2(v67) = v76;
          BYTE1(v67) = a9;
          LOBYTE(v67) = v77;
          v58 = v55;
          v49 = v70;
          v59 = -[HKMCProjectionAccuracyMetric initWithOverlapMostLikelyDays:overlapProjectedDays:overlapNone:predictionPrimarySource:totalDayRange:partiallyLogged:periodPredictionEnabled:heartRateBasedPredictionEnabled:isLoggingMultipleDays:daysAgoLogged:isOngoingPeriod:activePairedWatchProductType:daysFromMostLikelyStart:daysFromMostLikelyEnd:daysFromProjectedStart:daysFromProjectedEnd:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:isSleepConfiguredForWristTemperatureMeasurements:internalLiveOnCycleFactorOverrideEnabled:](v58, "initWithOverlapMostLikelyDays:overlapProjectedDays:overlapNone:predictionPrimarySource:totalDayRange:partiallyLogged:periodPredictionEnabled:heartRateBasedPredictionEnabled:isLoggingMultipleDays:daysAgoLogged:isOngoingPeriod:activePairedWatchProductType:daysFromMostLikelyStart:daysFromMostLikelyEnd:daysFromProjectedStart:daysFromProjectedEnd:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:isSleepConfiguredForWristTemperatureMeasurements:internalLiveOnCycleFactorOverrideEnabled:", v75, v21 != 0, v21 == 0, v70, v51, v72, v67, v56, v82, v57, v81, v80, v79,
                  v48,
                  v68);

          +[HKMCProjectionAccuracyMetric eventName](HKMCProjectionAccuracyMetric, "eventName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCProjectionAccuracyMetric eventPayload](v59, "eventPayload");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          _HKInitializeLogging();
          v62 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
          {
            v63 = v62;
            v64 = (void *)objc_opt_class();
            v65 = v64;
            HKSensitiveLogItem();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v86 = v64;
            v87 = 2114;
            v88 = v66;
            _os_log_impl(&dword_218A9C000, v63, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", buf, 0x16u);

          }
          v21 = v71;
          v48 = v74;
          v52 = v69;
        }
        else
        {
          _HKInitializeLogging();
          v54 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
            +[HKMCProjectionAccuracyAnalytics submitMetricWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:].cold.1(v54);
        }

        goto LABEL_34;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 - objc_msgSend(v39, "mostLikelyDays"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDD16E0];
    v41 = objc_msgSend(v39, "mostLikelyDays");
    v43 = v42 + v41 - 1;
    if (v42 <= 0)
      v43 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v40, "numberWithInteger:", a3 - v43);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 - objc_msgSend(v39, "allDays"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x24BDD16E0];
    v45 = objc_msgSend(v39, "allDays");
    v47 = v46 + v45 - 1;
    if (v46 <= 0)
      v47 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v44, "numberWithInteger:", a3 - v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = (void *)objc_opt_class();
    v34 = a1;
    v35 = (void *)MEMORY[0x24BDD16E0];
    v36 = v33;
    objc_msgSend(v35, "numberWithBool:", objc_msgSend(v34, "_isMetricEnabled"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v34, "_isAllowed"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v86 = v33;
    v87 = 2114;
    v88 = v37;
    v89 = 2114;
    v90 = v38;
    _os_log_impl(&dword_218A9C000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

  }
LABEL_34:

}

BOOL __301__HKMCProjectionAccuracyAnalytics_submitMetricWithDayIndex_oldMenstrualFlow_newMenstrualFlow_analysis_isLoggingMultipleDays_periodPredictionEnabled_heartRateBasedPredictionEnabled_wristTemperatureBasedPredictionEnabled_isWristTemperatureInputDelivered_internalLiveOnCycleFactorOverrideEnabled_cycles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_msgSend(a2, "allDays");
  return v2 >= v3 && v2 - v3 < v4;
}

+ (id)_isSleepConfiguredForWristTemperatureMeasurementsWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v15;
  uint64_t v16;
  id v18;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:healthStore:options:", CFSTR("HKMCProjectionAccuracyAnalytics"), 0, 2);
  v18 = 0;
  objc_msgSend(v4, "currentSleepEventRecordWithError:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    objc_msgSend(v5, "sleepCoachingOnboardingFirstCompletedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepTrackingOnboardingFirstCompletedDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
      v16 = 0;
    else
      v16 = objc_msgSend(v4, "hasSleepFocusMode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HKMCProjectionAccuracyAnalytics _isSleepConfiguredForWristTemperatureMeasurementsWithError:].cold.1(v13);
    if (a3)
    {
      v15 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }

  return v15;
}

+ (void)submitMetricWithDayIndex:(void *)a1 oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error computing if sleep is configured for wrist temperature: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

+ (void)_isSleepConfiguredForWristTemperatureMeasurementsWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error retrieving sleep event record: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
