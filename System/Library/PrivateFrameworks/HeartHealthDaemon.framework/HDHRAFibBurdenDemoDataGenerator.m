@implementation HDHRAFibBurdenDemoDataGenerator

- (HDHRAFibBurdenDemoDataGenerator)init
{
  HDHRAFibBurdenDemoDataGenerator *v2;
  HDHRAFibBurdenDemoDataGenerator *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDHRAFibBurdenDemoDataGenerator;
  v2 = -[HDHRAFibBurdenDemoDataGenerator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextAFibBurdenSampleTime = 0.0;
    v2->_nextHeartbeatSeriesSampleTime = 0.0;
    HDDemoData_timeFromDateComponents();
    v3->_heartbeatSeriesSampleFrequency = v4;
    v3->_aFibHistoryFeatureOnboarded = 0;
    v3->_percentAFibChance = 0.25;
  }
  return v3;
}

- (HDHRAFibBurdenDemoDataGenerator)initWithCoder:(id)a3
{
  id v4;
  HDHRAFibBurdenDemoDataGenerator *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHRAFibBurdenDemoDataGenerator;
  v5 = -[HDHRAFibBurdenDemoDataGenerator init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextAFibBurdenSampleTimeKey"));
    v5->_nextAFibBurdenSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextHeartbeatSeriesSampleTimeKey"));
    v5->_nextHeartbeatSeriesSampleTime = v7;
    HDDemoData_timeFromDateComponents();
    v5->_heartbeatSeriesSampleFrequency = v8;
    v5->_aFibHistoryFeatureOnboarded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_AFibHistoryFeatureOnboardedKey"));
    v5->_percentAFibChance = 0.25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[HDHRAFibBurdenDemoDataGenerator nextAFibBurdenSampleTime](self, "nextAFibBurdenSampleTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextAFibBurdenSampleTimeKey"));
  -[HDHRAFibBurdenDemoDataGenerator nextHeartbeatSeriesSampleTime](self, "nextHeartbeatSeriesSampleTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextHeartbeatSeriesSampleTimeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HDHRAFibBurdenDemoDataGenerator aFibHistoryFeatureOnboarded](self, "aFibHistoryFeatureOnboarded"), CFSTR("_AFibHistoryFeatureOnboardedKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  HDDemoDataGeneratorState *v6;
  HDDemoDataGeneratorState *generatorState;

  v6 = (HDDemoDataGeneratorState *)a4;
  objc_storeWeak((id *)&self->_profile, a3);
  generatorState = self->_generatorState;
  self->_generatorState = v6;

}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (objc_msgSend(v8, "profileType") == 4)
    -[HDHRAFibBurdenDemoDataGenerator _completeAFibHistoryOnboardingIfNecessaryForDemoPerson:date:](self, "_completeAFibHistoryOnboardingIfNecessaryForDemoPerson:date:", v8, v7);

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v12, "profileType") == 4)
  {
    if (-[HDHRAFibBurdenDemoDataGenerator aFibHistoryFeatureOnboarded](self, "aFibHistoryFeatureOnboarded"))
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isAppleWatch");

      if ((v16 & 1) == 0)
      {
        -[HDHRAFibBurdenDemoDataGenerator _generateTachogramSamplesForDemoPerson:lastTime:atTime:sampleDate:objectCollection:](self, "_generateTachogramSamplesForDemoPerson:lastTime:atTime:sampleDate:objectCollection:", v12, v13, v14, a4, a5);
        -[HDHRAFibBurdenDemoDataGenerator _generateAFibBurdenSamplesForDemoPerson:lastTime:atTime:sampleDate:objectCollection:](self, "_generateAFibBurdenSamplesForDemoPerson:lastTime:atTime:sampleDate:objectCollection:", v12, v13, v14, a4, a5);
      }
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HDHRAFibBurdenDemoDataGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:].cold.1((uint64_t)self, v17);

    }
  }

}

- (void)_generateAFibBurdenSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
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
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  HDHRAFibBurdenDemoDataGenerator *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  if (self->_nextAFibBurdenSampleTime <= a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRAFibBurdenDemoDataGenerator _currentDateFromCurrentTime:](self, "_currentDateFromCurrentTime:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRAFibBurdenDemoDataGenerator _currentDateFromCurrentTime:](self, "_currentDateFromCurrentTime:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v13, v14, 260);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v13);
    v17 = objc_msgSend(v16, "containsDate:", v15);

    if ((v17 & 1) != 0)
    {
      v18 = HKHRAFibBurdenPreviousWeekDayIndexRange();
      v39 = v10;
      v20 = v19;
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v18, 0, v11);
      v38 = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v18 + v20, 0, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRAFibBurdenDemoDataGenerator _randomlySelectedGaussianWithMean:deviation:](self, "_randomlySelectedGaussianWithMean:deviation:", self->_percentAFibChance, 0.03);
      v24 = v23;
      v25 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26, v24);
      v37 = v13;
      v27 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0CB6A40];
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRAFibBurdenDemoDataGenerator _metadataForSampleWithPercentage:](self, "_metadataForSampleWithPercentage:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v30, v28, v21, v22, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v39;
      objc_msgSend(v39, "addObjectFromPhone:", v33);
      objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7, v27, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v27);
      self->_nextAFibBurdenSampleTime = a4 + v35 * 0.0000115740741;

      v12 = v27;
      v13 = v37;

      v15 = v38;
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v41 = self;
        v42 = 2114;
        v43 = v15;
        v44 = 2114;
        v45 = v12;
        v46 = 2114;
        v47 = v13;
        _os_log_impl(&dword_1CC29C000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Target date %{public}@ not included in date range from %{public}@ to %{public}@", buf, 0x2Au);
      }

    }
  }

}

- (void)_generateTachogramSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  double nextHeartbeatSeriesSampleTime;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  HDHRAFibBurdenDemoDataGenerator *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (self->_nextHeartbeatSeriesSampleTime <= a4)
  {
    if (-[HDDemoDataGeneratorState isExercising](self->_generatorState, "isExercising"))
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not adding background tachograms as person is exercising", buf, 0xCu);
      }

    }
    else
    {
      v23 = v13;
      v24 = v12;
      nextHeartbeatSeriesSampleTime = self->_nextHeartbeatSeriesSampleTime;
      if (nextHeartbeatSeriesSampleTime <= a5)
      {
        v17 = *MEMORY[0x1E0CB72C0];
        v18 = *MEMORY[0x1E0CB7240];
        do
        {
          -[HDHRAFibBurdenDemoDataGenerator _currentDateFromCurrentTime:](self, "_currentDateFromCurrentTime:", nextHeartbeatSeriesSampleTime, v23, v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v17;
          v25[1] = v18;
          v26[0] = &unk_1E87FEFD8;
          v26[1] = &unk_1E87FEFF0;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((double)arc4random_uniform(0x64u) / 100.0 >= self->_percentAFibChance)
            objc_msgSend(MEMORY[0x1E0CB67C0], "_nonAFibSeriesSampleWithStartDate:device:metadata:", v19, v21, v20);
          else
            objc_msgSend(MEMORY[0x1E0CB67C0], "_aFibSeriesSampleWithStartDate:device:metadata:", v19, v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectFromWatch:", v22);
          nextHeartbeatSeriesSampleTime = nextHeartbeatSeriesSampleTime + self->_heartbeatSeriesSampleFrequency;

        }
        while (nextHeartbeatSeriesSampleTime <= a5);
      }
      self->_nextHeartbeatSeriesSampleTime = nextHeartbeatSeriesSampleTime;
      v13 = v23;
      v12 = v24;
    }
  }

}

- (void)_completeAFibHistoryOnboardingIfNecessaryForDemoPerson:(id)a3 date:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  HDHRAFibBurdenDemoDataGenerator *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureAvailabilityProvidingForFeatureIdentifier:", *MEMORY[0x1E0CB4FF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CB6720]);
    v11 = *MEMORY[0x1E0D2FB30];
    v15[0] = *MEMORY[0x1E0CB50C8];
    v15[1] = v11;
    v16[0] = MEMORY[0x1E0C9AAB0];
    v16[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDictionary:", v12);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke;
    v14[3] = &unk_1E87EFB60;
    v14[4] = self;
    objc_msgSend(v7, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v9, 102, v5, v13, v14);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to find AFib History Feature Availability Provider", buf, 0xCu);
    }
  }

}

void __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed AFib History onboarding", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setAFibHistoryFeatureOnboarded:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_setDataTypeAsFavorite");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke_cold_1(a1, v5);

  }
}

- (void)_setDataTypeAsFavorite
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_1CC29C000, v2, v3, "[%{public}@] Error setting favorites: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (double)_randomlySelectedGaussianWithMean:(double)a3 deviation:(double)a4
{
  long double v6;
  double v7;
  double v8;

  v6 = (double)arc4random() / 4294967300.0;
  v7 = (double)arc4random() / 4294967300.0;
  v8 = sqrt(log(v6) * -2.0);
  return a3 + v8 * cos(v7 * 6.28318531) * a4;
}

- (id)_currentDateFromCurrentTime:(double)a3
{
  void *v4;
  void *v5;

  -[HDDemoDataGeneratorState firstSampleDate](self->_generatorState, "firstSampleDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", a3 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_metadataForSampleWithPercentage:(double)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  HKHRAFibBurdenLocalFeatureAttributes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v15[0] = *MEMORY[0x1E0CB7320];
  objc_msgSend(v4, "updateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = *MEMORY[0x1E0CB5478];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "featureVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  v15[2] = *MEMORY[0x1E0CB55E0];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithDictionary:", v12);

  if (a3 <= 0.02)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CB5598]);

  return v13;
}

- (double)nextAFibBurdenSampleTime
{
  return self->_nextAFibBurdenSampleTime;
}

- (void)setNextAFibBurdenSampleTime:(double)a3
{
  self->_nextAFibBurdenSampleTime = a3;
}

- (double)nextHeartbeatSeriesSampleTime
{
  return self->_nextHeartbeatSeriesSampleTime;
}

- (void)setNextHeartbeatSeriesSampleTime:(double)a3
{
  self->_nextHeartbeatSeriesSampleTime = a3;
}

- (double)heartbeatSeriesSampleFrequency
{
  return self->_heartbeatSeriesSampleFrequency;
}

- (void)setHeartbeatSeriesSampleFrequency:(double)a3
{
  self->_heartbeatSeriesSampleFrequency = a3;
}

- (BOOL)aFibHistoryFeatureOnboarded
{
  return self->_aFibHistoryFeatureOnboarded;
}

- (void)setAFibHistoryFeatureOnboarded:(BOOL)a3
{
  self->_aFibHistoryFeatureOnboarded = a3;
}

- (double)percentAFibChance
{
  return self->_percentAFibChance;
}

- (void)setPercentAFibChance:(double)a3
{
  self->_percentAFibChance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorState, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)generateObjectsForDemoPerson:(uint64_t)a1 fromTime:(NSObject *)a2 toTime:currentDate:objectCollection:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] AFib profile selected but AFib History not onboarded.", (uint8_t *)&v2, 0xCu);
}

void __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_1CC29C000, v2, v3, "[%{public}@] Unable to complete AFib History onboarding: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
