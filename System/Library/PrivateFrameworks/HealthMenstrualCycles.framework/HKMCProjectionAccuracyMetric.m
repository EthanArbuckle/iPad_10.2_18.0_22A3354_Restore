@implementation HKMCProjectionAccuracyMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.ProjectionAccuracy");
}

- (HKMCProjectionAccuracyMetric)initWithOverlapMostLikelyDays:(BOOL)a3 overlapProjectedDays:(BOOL)a4 overlapNone:(BOOL)a5 predictionPrimarySource:(id)a6 totalDayRange:(int64_t)a7 partiallyLogged:(BOOL)a8 periodPredictionEnabled:(BOOL)a9 heartRateBasedPredictionEnabled:(BOOL)a10 isLoggingMultipleDays:(BOOL)a11 daysAgoLogged:(int64_t)a12 isOngoingPeriod:(id)a13 activePairedWatchProductType:(id)a14 daysFromMostLikelyStart:(id)a15 daysFromMostLikelyEnd:(id)a16 daysFromProjectedStart:(id)a17 daysFromProjectedEnd:(id)a18 wristTemperatureBasedPredictionEnabled:(BOOL)a19 isWristTemperatureInputDelivered:(BOOL)a20 isSleepConfiguredForWristTemperatureMeasurements:(BOOL)a21 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a22
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HKMCProjectionAccuracyMetric *v28;
  HKMCProjectionAccuracyMetric *v29;
  id v37;
  id v38;
  objc_super v39;

  v23 = a6;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v38 = a17;
  v37 = a18;
  v39.receiver = self;
  v39.super_class = (Class)HKMCProjectionAccuracyMetric;
  v28 = -[HKMCProjectionAccuracyMetric init](&v39, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_overlapMostLikelyDays = a3;
    v28->_overlapProjectedDays = a4;
    v28->_overlapNone = a5;
    objc_storeStrong((id *)&v28->_predictionPrimarySource, a6);
    v29->_partiallyLogged = a8;
    v29->_periodPredictionEnabled = a9;
    v29->_heartRateBasedPredictionEnabled = a10;
    v29->_isLoggingMultipleDays = a11;
    v29->_totalDayRange = a7;
    v29->_daysAgoLogged = a12;
    objc_storeStrong((id *)&v29->_isOngoingPeriod, a13);
    objc_storeStrong((id *)&v29->_activePairedWatchProductType, a14);
    objc_storeStrong((id *)&v29->_daysFromMostLikelyStart, a15);
    objc_storeStrong((id *)&v29->_daysFromMostLikelyEnd, a16);
    objc_storeStrong((id *)&v29->_daysFromProjectedStart, a17);
    objc_storeStrong((id *)&v29->_daysFromProjectedEnd, a18);
    v29->_wristTemperatureBasedPredictionEnabled = a19;
    v29->_isWristTemperatureInputDelivered = a20;
    v29->_isSleepConfiguredForWristTemperatureMeasurements = a21;
    v29->_internalLiveOnCycleFactorOverrideEnabled = a22;
  }

  return v29;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapMostLikelyDays](self, "overlapMostLikelyDays"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("overlapMostLikelyDays"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapProjectedDays](self, "overlapProjectedDays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("overlapProjectedDays"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapNone](self, "overlapNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("overlapNone"));

  -[HKMCProjectionAccuracyMetric predictionPrimarySource](self, "predictionPrimarySource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("predictionPrimarySource"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCProjectionAccuracyMetric totalDayRange](self, "totalDayRange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("totalDayRange"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric partiallyLogged](self, "partiallyLogged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("partiallyLogged"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric periodPredictionEnabled](self, "periodPredictionEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("settings_periodPredictionEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric heartRateBasedPredictionEnabled](self, "heartRateBasedPredictionEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("settings_heartRateBasedPredictionEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isLoggingMultipleDays](self, "isLoggingMultipleDays"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isLoggingMultipleDays"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCProjectionAccuracyMetric daysAgoLogged](self, "daysAgoLogged"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("daysAgoLogged"));

  -[HKMCProjectionAccuracyMetric isOngoingPeriod](self, "isOngoingPeriod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isOngoingPeriod"));

  -[HKMCProjectionAccuracyMetric activePairedWatchProductType](self, "activePairedWatchProductType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("activePairedWatchProductType"));

  -[HKMCProjectionAccuracyMetric daysFromMostLikelyStart](self, "daysFromMostLikelyStart");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("daysFromMostLikelyStart"));

  -[HKMCProjectionAccuracyMetric daysFromMostLikelyEnd](self, "daysFromMostLikelyEnd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("daysFromMostLikelyEnd"));

  -[HKMCProjectionAccuracyMetric daysFromProjectedStart](self, "daysFromProjectedStart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("daysFromProjectedStart"));

  -[HKMCProjectionAccuracyMetric daysFromProjectedEnd](self, "daysFromProjectedEnd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("daysFromProjectedEnd"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric wristTemperatureBasedPredictionEnabled](self, "wristTemperatureBasedPredictionEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("settings_wristTemperatureBasedPredictionEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isWristTemperatureInputDelivered](self, "isWristTemperatureInputDelivered"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isWristTemperatureInputDelivered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isSleepConfiguredForWristTemperatureMeasurements](self, "isSleepConfiguredForWristTemperatureMeasurements"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isSleepConfiguredForWristTemperatureMeasurements"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("internalLiveOnCycleFactorOverride"));

  v24 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v19 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapMostLikelyDays](self, "overlapMostLikelyDays"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapProjectedDays](self, "overlapProjectedDays"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapNone](self, "overlapNone"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric predictionPrimarySource](self, "predictionPrimarySource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCProjectionAccuracyMetric totalDayRange](self, "totalDayRange"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric partiallyLogged](self, "partiallyLogged"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric periodPredictionEnabled](self, "periodPredictionEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric heartRateBasedPredictionEnabled](self, "heartRateBasedPredictionEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isLoggingMultipleDays](self, "isLoggingMultipleDays"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCProjectionAccuracyMetric daysAgoLogged](self, "daysAgoLogged"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric isOngoingPeriod](self, "isOngoingPeriod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric activePairedWatchProductType](self, "activePairedWatchProductType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric daysFromMostLikelyStart](self, "daysFromMostLikelyStart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric daysFromMostLikelyEnd](self, "daysFromMostLikelyEnd");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric daysFromProjectedStart](self, "daysFromProjectedStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCProjectionAccuracyMetric daysFromProjectedEnd](self, "daysFromProjectedEnd");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric wristTemperatureBasedPredictionEnabled](self, "wristTemperatureBasedPredictionEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isWristTemperatureInputDelivered](self, "isWristTemperatureInputDelivered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric isSleepConfiguredForWristTemperatureMeasurements](self, "isSleepConfiguredForWristTemperatureMeasurements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMCProjectionAccuracyMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@:%p overlapMostLikelyDays:%@ overlapProjectedDays:%@ overlapNone:%@ predictionPrimarySource:%@ totalDayRange:%@ partiallyLogged:%@ periodPredictionEnabled:%@ sensorBasedPredictionEnabled:%@ isLoggingMultipleDays:%@ daysAgoLogged:%@ isOngoingPeriod:%@ activePairedWatchProductType:%@ daysFromMostLikelyStart:%@ daysFromMostLikelyEnd:%@ daysFromProjectedStart:%@ daysFromProjectedEnd:%@ wristTemperatureBasedPredictionEnabled:%@ isWristTemperatureInputDelivered:%@ isSleepConfiguredForWristTemperatureMeasurements:%@ internalLiveOnCycleFactorOverride:%@>"), v18, self, v26, v24, v25, v23, v17, v22, v16, v21, v15, v20, v13, v12, v11, v14,
    v3,
    v10,
    v4,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)overlapMostLikelyDays
{
  return self->_overlapMostLikelyDays;
}

- (void)setOverlapMostLikelyDays:(BOOL)a3
{
  self->_overlapMostLikelyDays = a3;
}

- (BOOL)overlapProjectedDays
{
  return self->_overlapProjectedDays;
}

- (void)setOverlapProjectedDays:(BOOL)a3
{
  self->_overlapProjectedDays = a3;
}

- (BOOL)overlapNone
{
  return self->_overlapNone;
}

- (void)setOverlapNone:(BOOL)a3
{
  self->_overlapNone = a3;
}

- (NSString)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(id)a3
{
  objc_storeStrong((id *)&self->_predictionPrimarySource, a3);
}

- (int64_t)totalDayRange
{
  return self->_totalDayRange;
}

- (void)setTotalDayRange:(int64_t)a3
{
  self->_totalDayRange = a3;
}

- (BOOL)partiallyLogged
{
  return self->_partiallyLogged;
}

- (void)setPartiallyLogged:(BOOL)a3
{
  self->_partiallyLogged = a3;
}

- (BOOL)periodPredictionEnabled
{
  return self->_periodPredictionEnabled;
}

- (void)setPeriodPredictionEnabled:(BOOL)a3
{
  self->_periodPredictionEnabled = a3;
}

- (BOOL)heartRateBasedPredictionEnabled
{
  return self->_heartRateBasedPredictionEnabled;
}

- (void)setHeartRateBasedPredictionEnabled:(BOOL)a3
{
  self->_heartRateBasedPredictionEnabled = a3;
}

- (BOOL)isLoggingMultipleDays
{
  return self->_isLoggingMultipleDays;
}

- (void)setIsLoggingMultipleDays:(BOOL)a3
{
  self->_isLoggingMultipleDays = a3;
}

- (int64_t)daysAgoLogged
{
  return self->_daysAgoLogged;
}

- (void)setDaysAgoLogged:(int64_t)a3
{
  self->_daysAgoLogged = a3;
}

- (NSNumber)isOngoingPeriod
{
  return self->_isOngoingPeriod;
}

- (void)setIsOngoingPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_isOngoingPeriod, a3);
}

- (NSString)activePairedWatchProductType
{
  return self->_activePairedWatchProductType;
}

- (void)setActivePairedWatchProductType:(id)a3
{
  objc_storeStrong((id *)&self->_activePairedWatchProductType, a3);
}

- (NSNumber)daysFromMostLikelyStart
{
  return self->_daysFromMostLikelyStart;
}

- (void)setDaysFromMostLikelyStart:(id)a3
{
  objc_storeStrong((id *)&self->_daysFromMostLikelyStart, a3);
}

- (NSNumber)daysFromMostLikelyEnd
{
  return self->_daysFromMostLikelyEnd;
}

- (void)setDaysFromMostLikelyEnd:(id)a3
{
  objc_storeStrong((id *)&self->_daysFromMostLikelyEnd, a3);
}

- (NSNumber)daysFromProjectedStart
{
  return self->_daysFromProjectedStart;
}

- (void)setDaysFromProjectedStart:(id)a3
{
  objc_storeStrong((id *)&self->_daysFromProjectedStart, a3);
}

- (NSNumber)daysFromProjectedEnd
{
  return self->_daysFromProjectedEnd;
}

- (void)setDaysFromProjectedEnd:(id)a3
{
  objc_storeStrong((id *)&self->_daysFromProjectedEnd, a3);
}

- (BOOL)wristTemperatureBasedPredictionEnabled
{
  return self->_wristTemperatureBasedPredictionEnabled;
}

- (void)setWristTemperatureBasedPredictionEnabled:(BOOL)a3
{
  self->_wristTemperatureBasedPredictionEnabled = a3;
}

- (BOOL)isWristTemperatureInputDelivered
{
  return self->_isWristTemperatureInputDelivered;
}

- (void)setIsWristTemperatureInputDelivered:(BOOL)a3
{
  self->_isWristTemperatureInputDelivered = a3;
}

- (BOOL)isSleepConfiguredForWristTemperatureMeasurements
{
  return self->_isSleepConfiguredForWristTemperatureMeasurements;
}

- (void)setIsSleepConfiguredForWristTemperatureMeasurements:(BOOL)a3
{
  self->_isSleepConfiguredForWristTemperatureMeasurements = a3;
}

- (BOOL)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(BOOL)a3
{
  self->_internalLiveOnCycleFactorOverrideEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysFromProjectedEnd, 0);
  objc_storeStrong((id *)&self->_daysFromProjectedStart, 0);
  objc_storeStrong((id *)&self->_daysFromMostLikelyEnd, 0);
  objc_storeStrong((id *)&self->_daysFromMostLikelyStart, 0);
  objc_storeStrong((id *)&self->_activePairedWatchProductType, 0);
  objc_storeStrong((id *)&self->_isOngoingPeriod, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySource, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
