@implementation HKMCSettingsManager

- (int64_t)cycleLengthModificationDayIndexOverriding:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleInternalInstall");

  if (v6)
  {
    -[HKMCSettingsManager userDefaults](self, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "hkmc_integerForKey:defaultValue:", CFSTR("CycleLengthModificationDayOverride"), a3);

  }
  return a3;
}

- (int64_t)periodLengthModificationDayIndexOverriding:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleInternalInstall");

  if (v6)
  {
    -[HKMCSettingsManager userDefaults](self, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "hkmc_integerForKey:defaultValue:", CFSTR("PeriodLengthModificationDayOverride"), a3);

  }
  return a3;
}

- (id)historicalAnalyzerOverridesForCycles
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    -[HKMCSettingsManager userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("HistoricalCyclesPredictionPrimarySource"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HKMCSettingsManager historicalAnalyzerOverridesForCycles](self, "historicalAnalyzerOverridesForCycles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_historicalAnalyzerNumericalOverrideAtIndex:(int64_t)a3 forCycleAtReverseChronologicalIndex:(int64_t)a4 description:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[HKMCSettingsManager historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:](self, "historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return -[HKMCSettingsManager _historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:](self, "_historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:", 0, a3, CFSTR("historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex"));
}

- (id)historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return -[HKMCSettingsManager _historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:](self, "_historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:", 1, a3, CFSTR("historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex"));
}

- (id)historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return -[HKMCSettingsManager _historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:](self, "_historicalAnalyzerNumericalOverrideAtIndex:forCycleAtReverseChronologicalIndex:description:", 2, a3, CFSTR("historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex"));
}

- (id)dayStreamProcessorPredictionPrimarySourceOverride
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    -[HKMCSettingsManager userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("OngoingCyclePredictionPrimarySource"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)dayStreamProcessorAlgorithmVersion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (!v4)
    return HKHAMenstrualAlgorithmsDayStreamProcessorAlgorithmVersion();
  -[HKMCSettingsManager userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("MenstrualAlgorithmsDayStreamProcessorAlgorithmVersion"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return HKHAMenstrualAlgorithmsDayStreamProcessorAlgorithmVersion();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (BOOL)menstruationProjectionsEnabledAndSupported
{
  _BOOL4 v3;

  v3 = -[HKMCSettingsManager menstruationProjectionsEnabled](self, "menstruationProjectionsEnabled");
  if (v3)
    LOBYTE(v3) = -[HKMCSettingsManager areAllMenstruationPredictionAlgorithmAttributesSupported](self, "areAllMenstruationPredictionAlgorithmAttributesSupported");
  return v3;
}

- (BOOL)fertileWindowProjectionsEnabledAndSupported
{
  _BOOL4 v3;

  v3 = -[HKMCSettingsManager fertileWindowProjectionsEnabled](self, "fertileWindowProjectionsEnabled");
  if (v3)
    LOBYTE(v3) = -[HKMCSettingsManager areAllFertileWindowPredictionAlgorithmAttributesSupported](self, "areAllFertileWindowPredictionAlgorithmAttributesSupported");
  return v3;
}

- (BOOL)someNotificationsEnabled
{
  return -[HKMCSettingsManager menstruationNotificationsEnabled](self, "menstruationNotificationsEnabled")
      || -[HKMCSettingsManager fertileWindowNotificationsEnabled](self, "fertileWindowNotificationsEnabled");
}

- (BOOL)someNotificationsEnabledAndSupported
{
  return -[HKMCSettingsManager menstruationProjectionNotificationsEnabledAndSupported](self, "menstruationProjectionNotificationsEnabledAndSupported")|| -[HKMCSettingsManager fertileWindowProjectionNotificationsEnabledAndSupported](self, "fertileWindowProjectionNotificationsEnabledAndSupported");
}

- (BOOL)menstruationProjectionNotificationsEnabledAndSupported
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[HKMCSettingsManager menstruationNotificationsEnabled](self, "menstruationNotificationsEnabled");
  if (v3)
  {
    v4 = -[HKMCSettingsManager areAllMenstruationPredictionAlgorithmAttributesSupported](self, "areAllMenstruationPredictionAlgorithmAttributesSupported");
    LOBYTE(v3) = v4 & !-[HKMCSettingsManager algorithmVersionMismatchOnWatch](self, "algorithmVersionMismatchOnWatch");
  }
  return v3;
}

- (BOOL)fertileWindowProjectionNotificationsEnabledAndSupported
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[HKMCSettingsManager fertileWindowNotificationsEnabled](self, "fertileWindowNotificationsEnabled");
  if (v3)
  {
    v4 = -[HKMCSettingsManager areAllFertileWindowPredictionAlgorithmAttributesSupported](self, "areAllFertileWindowPredictionAlgorithmAttributesSupported");
    LOBYTE(v3) = v4 & !-[HKMCSettingsManager algorithmVersionMismatchOnWatch](self, "algorithmVersionMismatchOnWatch");
  }
  return v3;
}

- (BOOL)areAllMenstruationPredictionAlgorithmAttributesSupported
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
    return !-[HKMCSettingsManager _areAlgorithmAttributesOnPhone:aheadOfAlgorithmAttributesOnWatch:](self, "_areAlgorithmAttributesOnPhone:aheadOfAlgorithmAttributesOnWatch:", -[HKMCSettingsManager menstruationProjectionsAlgorithmAttributesPhone](self, "menstruationProjectionsAlgorithmAttributesPhone"), -[HKMCSettingsManager menstruationProjectionsAlgorithmAttributesWatch](self, "menstruationProjectionsAlgorithmAttributesWatch"));
  else
    return 1;
}

- (BOOL)_areAlgorithmAttributesOnPhone:(unint64_t)a3 aheadOfAlgorithmAttributesOnWatch:(unint64_t)a4
{
  return a3 > a4;
}

- (BOOL)areAllFertileWindowPredictionAlgorithmAttributesSupported
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
    return !-[HKMCSettingsManager _areAlgorithmAttributesOnPhone:aheadOfAlgorithmAttributesOnWatch:](self, "_areAlgorithmAttributesOnPhone:aheadOfAlgorithmAttributesOnWatch:", -[HKMCSettingsManager fertileWindowProjectionsAlgorithmAttributesPhone](self, "fertileWindowProjectionsAlgorithmAttributesPhone"), -[HKMCSettingsManager fertileWindowProjectionsAlgorithmAttributesWatch](self, "fertileWindowProjectionsAlgorithmAttributesWatch"));
  else
    return 1;
}

- (NSString)localizedTextForVersionMismatchAndDisabledProjectionsFromAlgorithmAttributes
{
  void *v3;

  if (-[HKMCSettingsManager areAllMenstruationPredictionAlgorithmAttributesSupported](self, "areAllMenstruationPredictionAlgorithmAttributesSupported")&& -[HKMCSettingsManager areAllFertileWindowPredictionAlgorithmAttributesSupported](self, "areAllFertileWindowPredictionAlgorithmAttributesSupported"))
  {
    v3 = 0;
  }
  else
  {
    -[HKMCSettingsManager localizedTextForVersionMismatchAndDisabledProjections](self, "localizedTextForVersionMismatchAndDisabledProjections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (void)setProjectionAttributesOnWatchFromUseHeartRateInput:(BOOL)a3 useWristTemperatureInput:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if ((v8 & 1) != 0)
  {
    v9 = 3;
    if (!v5)
      v9 = 1;
    if (v4)
      v10 = v9 | 4;
    else
      v10 = v9;
    -[HKMCSettingsManager setFertileWindowProjectionsAlgorithmAttributesWatch:](self, "setFertileWindowProjectionsAlgorithmAttributesWatch:", v10);
    -[HKMCSettingsManager setMenstruationProjectionsAlgorithmAttributesWatch:](self, "setMenstruationProjectionsAlgorithmAttributesWatch:", v10);
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_FAULT))
      -[HKMCSettingsManager(Support) setProjectionAttributesOnWatchFromUseHeartRateInput:useWristTemperatureInput:].cold.1(v11);
  }
}

- (void)_setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3
{
  -[HKMCSettingsManager setMenstruationProjectionsDisabledOnWatchForVersionMismatch:](self, "setMenstruationProjectionsDisabledOnWatchForVersionMismatch:", a3 != 0);
  -[HKMCSettingsManager setMenstruationProjectionsAlgorithmAttributesPhone:](self, "setMenstruationProjectionsAlgorithmAttributesPhone:", a3);
}

- (void)_setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3
{
  -[HKMCSettingsManager setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:](self, "setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:", a3 != 0);
  -[HKMCSettingsManager setFertileWindowProjectionsAlgorithmAttributesPhone:](self, "setFertileWindowProjectionsAlgorithmAttributesPhone:", a3);
}

- (void)forceDisableProjectionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(v12);
  v14 = HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(v12);
  v15 = v14;
  v16 = v13 | 2;
  if (v8)
    v15 = v14 | 2;
  else
    v16 = v13;
  if (v7)
    v17 = v15 | 4;
  else
    v17 = v15;
  if (v7)
    v18 = v16 | 4;
  else
    v18 = v16;
  -[HKMCSettingsManager _setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:](self, "_setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:", v18);
  -[HKMCSettingsManager _setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:](self, "_setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:", v17);
  -[HKMCSettingsManager _localizedTextForVersionMismatchFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:](self, "_localizedTextForVersionMismatchFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:", v12, v10, v9, v8, v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[HKMCSettingsManager setLocalizedTextForVersionMismatchAndDisabledProjections:](self, "setLocalizedTextForVersionMismatchAndDisabledProjections:", v19);
}

- (id)_localizedTextForVersionMismatchFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v10;
  id v11;
  int v12;
  char v13;
  int v14;
  char v15;
  void *v16;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v11 = a3;
  v12 = HKMCAlgorithmSuppressPeriodPredictionsFromCycleFactorSamples(v11);
  v13 = HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(v11);
  v14 = HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(v11);

  if (!v10 || v12)
    v15 = !a5 | v13;
  else
    v15 = 0;
  v16 = 0;
  if ((v15 & 1) == 0 && (v8 || v7) | v14 & (v12 ^ 1))
  {
    HKMCLocalizedString(CFSTR("PROJECTIONS_DISABLED_FOR_VERSION_MISMATCH"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (HKMCSettingsManager)init
{
  void *v3;
  HKMCSettingsManager *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKMCSettingsManager initWithUserDefaults:observationEnabled:](self, "initWithUserDefaults:observationEnabled:", v3, 1);

  return v4;
}

- (HKMCSettingsManager)initWithObservationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HKMCSettingsManager *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKMCSettingsManager initWithUserDefaults:observationEnabled:](self, "initWithUserDefaults:observationEnabled:", v5, v3);

  return v6;
}

- (HKMCSettingsManager)initWithUserDefaults:(id)a3
{
  return -[HKMCSettingsManager initWithUserDefaults:observationEnabled:](self, "initWithUserDefaults:observationEnabled:", a3, 1);
}

- (HKMCSettingsManager)initWithUserDefaults:(id)a3 observationEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  HKMCSettingsManager *v8;
  HKMCSettingsManager *v9;
  id v10;
  uint64_t v11;
  HKObserverSet *observers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *allSettingsToObserve;
  objc_super v22;

  v4 = a4;
  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKMCSettingsManager;
  v8 = -[HKMCSettingsManager init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_observationEnabled = v4;
    v10 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v11 = objc_msgSend(v10, "initWithName:loggingCategory:", CFSTR("HKMCSettingsManagerObservers"), *MEMORY[0x24BDD3030]);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    _AnalysisSettingKeys();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _NotificationSettingKeys();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HiddenDisplayTypeSettingKeys();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _AlgorithmVersionMismatchSettingKeys();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    allSettingsToObserve = v9->_allSettingsToObserve;
    v9->_allSettingsToObserve = (NSArray *)v19;

    if (v4)
    {
      -[HKMCSettingsManager _startObservingDefaults](v9, "_startObservingDefaults");
      -[HKMCSettingsManager _startObservingNPSNotifications](v9, "_startObservingNPSNotifications");
    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_observationEnabled)
  {
    -[HKMCSettingsManager _stopObservingAllDefaults](self, "_stopObservingAllDefaults");
    -[HKMCSettingsManager _stopObservingNPSNotifications](self, "_stopObservingNPSNotifications");
  }
  v3.receiver = self;
  v3.super_class = (Class)HKMCSettingsManager;
  -[HKMCSettingsManager dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_hiddenDisplayTypesDidUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__HKMCSettingsManager__hiddenDisplayTypesDidUpdate__block_invoke;
  v3[3] = &unk_24D99DFC0;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __51__HKMCSettingsManager__hiddenDisplayTypesDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settingsManagerDidUpdateHiddenDisplayTypes:", *(_QWORD *)(a1 + 32));

}

- (void)_analysisSettingsDidUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__HKMCSettingsManager__analysisSettingsDidUpdate__block_invoke;
  v3[3] = &unk_24D99DFC0;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __49__HKMCSettingsManager__analysisSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settingsManagerDidUpdateAnalysisSettings:", *(_QWORD *)(a1 + 32));

}

- (void)_notificationSettingsDidUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__HKMCSettingsManager__notificationSettingsDidUpdate__block_invoke;
  v3[3] = &unk_24D99DFC0;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __53__HKMCSettingsManager__notificationSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settingsManagerDidUpdateNotificationSettings:", *(_QWORD *)(a1 + 32));

}

- (void)_algorithmVersionMismatchSettingsDidUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__HKMCSettingsManager__algorithmVersionMismatchSettingsDidUpdate__block_invoke;
  v3[3] = &unk_24D99DFC0;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __65__HKMCSettingsManager__algorithmVersionMismatchSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settingsManagerDidUpdateAlgorithmVersionMismatchSettings:", *(_QWORD *)(a1 + 32));

}

- (void)_startObservingDefaults
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_allSettingsToObserve;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 3, 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingAllDefaults
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_allSettingsToObserve;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = *MEMORY[0x24BDD0E80];
    v14 = v12;
    objc_msgSend(v9, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138544130;
    v26 = v12;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v15;
    v31 = 2114;
    v32 = v16;
    _os_log_impl(&dword_218A9C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", (uint8_t *)&v25, 0x2Au);

  }
  _AnalysisSettingKeys();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v8);

  if (v18)
    -[HKMCSettingsManager _analysisSettingsDidUpdate](self, "_analysisSettingsDidUpdate");
  _NotificationSettingKeys();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", v8);

  if (v20)
    -[HKMCSettingsManager _notificationSettingsDidUpdate](self, "_notificationSettingsDidUpdate");
  _HiddenDisplayTypeSettingKeys();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v8);

  if (v22)
    -[HKMCSettingsManager _hiddenDisplayTypesDidUpdate](self, "_hiddenDisplayTypesDidUpdate");
  _AlgorithmVersionMismatchSettingKeys();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", v8);

  if (v24)
    -[HKMCSettingsManager _algorithmVersionMismatchSettingsDidUpdate](self, "_algorithmVersionMismatchSettingsDidUpdate");

}

- (void)_startObservingNPSNotifications
{
  const char *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD handler[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  self->_notificationSettingsNotifyToken = -1;
  v3 = (const char *)objc_msgSend(CFSTR("HKMCNotificationSettingsDidUpdate"), "UTF8String");
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke;
  handler[3] = &unk_24D99DFE8;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_notificationSettingsNotifyToken, v4, handler);

  self->_algorithmVersionMismatchSettingsNotifyToken = -1;
  v7 = (const char *)objc_msgSend(CFSTR("HKMCAlgorithmVersionMismatchSettingsDidUpdate"), "UTF8String");
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke_2;
  v8[3] = &unk_24D99DFE8;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v7, &self->_algorithmVersionMismatchSettingsNotifyToken, MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notificationSettingsDidUpdate");

}

void __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_algorithmVersionMismatchSettingsDidUpdate");

}

- (void)_stopObservingNPSNotifications
{
  int notificationSettingsNotifyToken;
  int algorithmVersionMismatchSettingsNotifyToken;

  notificationSettingsNotifyToken = self->_notificationSettingsNotifyToken;
  if (notificationSettingsNotifyToken != -1)
    notify_cancel(notificationSettingsNotifyToken);
  algorithmVersionMismatchSettingsNotifyToken = self->_algorithmVersionMismatchSettingsNotifyToken;
  if (algorithmVersionMismatchSettingsNotifyToken != -1)
    notify_cancel(algorithmVersionMismatchSettingsNotifyToken);
}

- (void)_setTestDefaults:(id)a3
{
  NSUserDefaults *v4;
  NSUserDefaults *userDefaults;

  v4 = (NSUserDefaults *)a3;
  -[HKMCSettingsManager _stopObservingAllDefaults](self, "_stopObservingAllDefaults");
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;

  -[HKMCSettingsManager _startObservingDefaults](self, "_startObservingDefaults");
}

- (void)_unitTest_setAlgorithmVersionMismatchOnWatchOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_algorithmVersionMismatchOnWatch, a3);
}

- (void)_unitTest_setWatchMenstruationPredictionAlgorithmAttributesSupportedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported, a3);
}

- (void)_unitTest_setWatchFertileWindowPredictionAlgorithmAttributesSupportedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported, a3);
}

- (unint64_t)menstruationProjectionsAlgorithmAttributesWatch
{
  void *v3;
  NSObject *v4;
  id v5;
  unint64_t result;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)v7 = 138543362;
      *(_QWORD *)&v7[4] = objc_opt_class();
      v5 = *(id *)&v7[4];
      _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -watchMenstruationPredictionWatchAlgorithmAttributesSupported", v7, 0xCu);

    }
    return -[NSNumber unsignedIntegerValue](self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported, "unsignedIntegerValue", *(_OWORD *)v7);
  }
  else
  {
    result = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("MenstruationProjectionsAlgorithmAttributesWatch"));
    if (!result)
      return 7;
  }
  return result;
}

- (void)setMenstruationProjectionsAlgorithmAttributesWatch:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation projections algorithm attributes on watch: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, CFSTR("MenstruationProjectionsAlgorithmAttributesWatch"));
}

- (unint64_t)fertileWindowProjectionsAlgorithmAttributesWatch
{
  void *v3;
  NSObject *v4;
  id v5;
  unint64_t result;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)v7 = 138543362;
      *(_QWORD *)&v7[4] = objc_opt_class();
      v5 = *(id *)&v7[4];
      _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -watchFertileWindowPredictionAlgorithmAttributesSupported", v7, 0xCu);

    }
    return -[NSNumber unsignedIntegerValue](self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported, "unsignedIntegerValue", *(_OWORD *)v7);
  }
  else
  {
    result = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("FertileWindowProjectionsAlgorithmAttributesWatch"));
    if (!result)
      return 7;
  }
  return result;
}

- (void)setFertileWindowProjectionsAlgorithmAttributesWatch:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window projections algorithm attributes on watch: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, CFSTR("FertileWindowProjectionsAlgorithmAttributesWatch"));
}

- (BOOL)algorithmVersionMismatchOnWatch
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  _BYTE v17[22];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_unitTest_algorithmVersionMismatchOnWatch)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)v17 = 138543362;
      *(_QWORD *)&v17[4] = objc_opt_class();
      v5 = *(id *)&v17[4];
      _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -algorithmVersionMismatchOnWatch", v17, 0xCu);

    }
    return -[NSNumber BOOLValue](self->_unitTest_algorithmVersionMismatchOnWatch, "BOOLValue", *(_OWORD *)v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppleWatch");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getActivePairedDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HKMCIsAlgorithmsVersionSameOnPairedDevice(v10);

      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = (void *)objc_opt_class();
        v15 = CFSTR("NO");
        if (v11)
          v15 = CFSTR("YES");
        *(_DWORD *)v17 = 138543618;
        *(_QWORD *)&v17[4] = v14;
        *(_WORD *)&v17[12] = 2114;
        *(_QWORD *)&v17[14] = v15;
        v16 = v14;
        _os_log_impl(&dword_218A9C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Algorithm version same on paired device: %{public}@", v17, 0x16u);

      }
      return v11 ^ 1;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)menstruationProjectionsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("MenstruationProjectionsEnabled"));
}

- (void)setMenstruationProjectionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation predictions enabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("MenstruationProjectionsEnabled"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MenstruationProjectionsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)fertileWindowProjectionsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("FertileWindowProjectionsEnabled"));
}

- (void)setFertileWindowProjectionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window predictions enabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("FertileWindowProjectionsEnabled"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FertileWindowProjectionsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)menstruationProjectionsDisabledOnWatchForVersionMismatch
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("MenstruationProjectionsDisabledForVersionMismatch"));
}

- (void)setMenstruationProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation predictions force disabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("MenstruationProjectionsDisabledForVersionMismatch"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MenstruationProjectionsDisabledForVersionMismatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)fertileWindowProjectionsDisabledOnWatchForVersionMismatch
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("FertileWindowProjectionsDisabledForVersionMismatch"));
}

- (void)setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window predictions force disabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("FertileWindowProjectionsDisabledForVersionMismatch"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FertileWindowProjectionsDisabledForVersionMismatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (NSString)localizedTextForVersionMismatchAndDisabledProjections
{
  return -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("LocalizedTextForVersionMismatchAndDisabledProjections"));
}

- (void)setLocalizedTextForVersionMismatchAndDisabledProjections:(id)a3
{
  void *v3;
  char v4;
  id v5;

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, CFSTR("LocalizedTextForVersionMismatchAndDisabledProjections"));
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("LocalizedTextForVersionMismatchAndDisabledProjections"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)heartRateBasedProjectionsEnabled
{
  void *v3;

  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCSettingsManager heartRateBasedProjectionsEnabled].cold.1(v3);
  return -[NSUserDefaults hk_BOOLForKey:defaultValue:](self->_userDefaults, "hk_BOOLForKey:defaultValue:", CFSTR("SensorBasedProjectionsEnabled"), 1);
}

- (void)setHeartRateBasedProjectionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCSettingsManager heartRateBasedProjectionsEnabled].cold.1(v5);
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("SensorBasedProjectionsEnabled"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SensorBasedProjectionsEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (BOOL)wristTemperatureBasedProjectionsEnabled
{
  void *v3;

  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCSettingsManager wristTemperatureBasedProjectionsEnabled].cold.1(v3);
  return -[NSUserDefaults hk_BOOLForKey:defaultValue:](self->_userDefaults, "hk_BOOLForKey:defaultValue:", CFSTR("WristTemperatureBasedProjectionsEnabled"), 1);
}

- (void)setWristTemperatureBasedProjectionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCSettingsManager wristTemperatureBasedProjectionsEnabled].cold.1(v5);
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("WristTemperatureBasedProjectionsEnabled"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("WristTemperatureBasedProjectionsEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (BOOL)internalCycleFactorsOverrideEnabled
{
  return -[NSUserDefaults hk_BOOLForKey:defaultValue:](self->_userDefaults, "hk_BOOLForKey:defaultValue:", CFSTR("InternalCycleFactorsOverrideEnabled"), 0);
}

- (void)setInternalCycleFactorsOverrideEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSUserDefaults *userDefaults;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v12 = 138543618;
    *(_QWORD *)&v12[4] = v7;
    *(_WORD *)&v12[12] = 2114;
    *(_QWORD *)&v12[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set internal cycle factors override enabled: %{public}@", v12, 0x16u);

  }
  userDefaults = self->_userDefaults;
  if (v3)
    -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", 1, CFSTR("InternalCycleFactorsOverrideEnabled"));
  else
    -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:", CFSTR("InternalCycleFactorsOverrideEnabled"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("InternalCycleFactorsOverrideEnabled"), *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (BOOL)internalIgnoreOvulationTestResultsEnabled
{
  return -[NSUserDefaults hk_BOOLForKey:defaultValue:](self->_userDefaults, "hk_BOOLForKey:defaultValue:", CFSTR("InternalIgnoreOvulationTestResultsEnabled"), 0);
}

- (void)setInternalIgnoreOvulationTestResultsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSUserDefaults *userDefaults;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v12 = 138543618;
    *(_QWORD *)&v12[4] = v7;
    *(_WORD *)&v12[12] = 2114;
    *(_QWORD *)&v12[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set internal ignore ovulation test results enabled: %{public}@", v12, 0x16u);

  }
  userDefaults = self->_userDefaults;
  if (v3)
    -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", 1, CFSTR("InternalIgnoreOvulationTestResultsEnabled"));
  else
    -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:", CFSTR("InternalIgnoreOvulationTestResultsEnabled"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("InternalIgnoreOvulationTestResultsEnabled"), *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (unint64_t)menstruationProjectionsAlgorithmAttributesPhone
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("MenstruationProjectionsAlgorithmAttributesPhone"));
}

- (void)setMenstruationProjectionsAlgorithmAttributesPhone:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation projections algorithm attributes: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, CFSTR("MenstruationProjectionsAlgorithmAttributesPhone"));
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppleWatch");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MenstruationProjectionsAlgorithmAttributesPhone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (unint64_t)fertileWindowProjectionsAlgorithmAttributesPhone
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("FertileWindowProjectionsAlgorithmAttributesPhone"));
}

- (void)setFertileWindowProjectionsAlgorithmAttributesPhone:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window projections algorithm attributes: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, CFSTR("FertileWindowProjectionsAlgorithmAttributesPhone"));
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppleWatch");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FertileWindowProjectionsAlgorithmAttributesPhone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)menstruationNotificationsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("MenstruationNotificationsEnabled"));
}

- (void)setMenstruationNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation notifications enabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("MenstruationNotificationsEnabled"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MenstruationNotificationsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (NSDateComponents)menstruationNotificationTimeOfDay
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4
    && (v5 = (void *)MEMORY[0x24BDD1620],
        v6 = objc_opt_class(),
        -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", CFSTR("MenstruationNotificationTimeOfDay")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, 0),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCSettingsManager menstruationNotificationTimeOfDay].cold.1(v9);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCalendar:", v10);

    objc_msgSend(v8, "setHour:", 20);
  }
  return (NSDateComponents *)v8;
}

- (void)setMenstruationNotificationTimeOfDay:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MenstruationNotificationTimeOfDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)fertileWindowNotificationsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("FertileWindowNotificationsEnabled"));
}

- (void)setFertileWindowNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window notifications enabled: %{public}@", v13, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("FertileWindowNotificationsEnabled"), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FertileWindowNotificationsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (NSDateComponents)fertileWindowNotificationTimeOfDay
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4
    && (v5 = (void *)MEMORY[0x24BDD1620],
        v6 = objc_opt_class(),
        -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", CFSTR("FertileWindowNotificationTimeOfDay")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, 0),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCSettingsManager fertileWindowNotificationTimeOfDay].cold.1(v9);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCalendar:", v10);

    objc_msgSend(v8, "setHour:", 20);
  }
  return (NSDateComponents *)v8;
}

- (void)setFertileWindowNotificationTimeOfDay:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FertileWindowNotificationTimeOfDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (BOOL)deviationDetectionEnabledSetExplicitlyForAnyType
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("IrregularDeviationDetectionEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("InfrequentDeviationDetectionEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ProlongedDeviationDetectionEnabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("SpottingDeviationDetectionEnabled"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return v4;
}

- (BOOL)deviationDetectionEnabledForType:(int64_t)a3
{
  NSUserDefaults *userDefaults;
  const __CFString *v4;

  userDefaults = self->_userDefaults;
  if ((unint64_t)(a3 - 1) > 2)
    v4 = CFSTR("ProlongedDeviationDetectionEnabled");
  else
    v4 = off_24D99E008[a3 - 1];
  return -[NSUserDefaults hk_BOOLForKey:defaultValue:](userDefaults, "hk_BOOLForKey:defaultValue:", v4, 1);
}

- (void)setDeviationDetectionEnabled:(BOOL)a3 forType:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  char v16;
  void *v17;
  _BYTE v18[22];
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromDeviationType(a4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    *(_DWORD *)v18 = 138543874;
    *(_QWORD *)&v18[4] = v9;
    *(_WORD *)&v18[12] = 2114;
    if (v5)
      v13 = CFSTR("YES");
    *(_QWORD *)&v18[14] = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@ deviation detection enabled: %{public}@", v18, 0x20u);

  }
  if ((unint64_t)(a4 - 1) > 2)
    v14 = CFSTR("ProlongedDeviationDetectionEnabled");
  else
    v14 = off_24D99E008[a4 - 1];
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v5, v14, *(_OWORD *)v18);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isAppleWatch");

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (NSDate)cycleTrackingOnboardingTileDismissedDate
{
  void *v3;
  void *v4;

  if (-[NSUserDefaults hk_keyExists:](self->_userDefaults, "hk_keyExists:", CFSTR("CycleTrackingOnboardingTileDismissedDate")))
  {
    v3 = (void *)MEMORY[0x24BDBCE60];
    -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", CFSTR("CycleTrackingOnboardingTileDismissedDate"));
    objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setCycleTrackingOnboardingTileDismissedDate:(id)a3
{
  NSUserDefaults *userDefaults;

  userDefaults = self->_userDefaults;
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[NSUserDefaults setDouble:forKey:](userDefaults, "setDouble:forKey:", CFSTR("CycleTrackingOnboardingTileDismissedDate"));
  }
  else
  {
    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("CycleTrackingOnboardingTileDismissedDate"));
  }
}

- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifiers:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v30 = v9;
    v31 = 2114;
    if (v4)
      v10 = CFSTR("YES");
    v32 = v10;
    v33 = 2114;
    v34 = v6;
    v11 = v9;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set hidden = %{public}@ for display types: %{public}@", buf, 0x20u);

  }
  -[NSUserDefaults dictionaryForKey:](self->_userDefaults, "dictionaryForKey:", CFSTR("ShouldHideByDisplayTypeIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "mutableCopy");

  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v13, CFSTR("ShouldHideByDisplayTypeIdentifier"));
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAppleWatch");

  if ((v22 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ShouldHideByDisplayTypeIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifier:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMCSettingsManager setHidden:forDisplayTypeIdentifiers:](self, "setHidden:forDisplayTypeIdentifiers:", v4, v8, v9, v10);
}

- (void)setMenstruationTrackingDisplayTypesHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  _HKMCMenstruationDisplayTypeIdentifiers();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMCSettingsManager setHidden:forDisplayTypeIdentifiers:](self, "setHidden:forDisplayTypeIdentifiers:", v3, v5);

}

- (void)setFertilityTrackingDisplayTypesHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  _HKMCFertilityDisplayTypeIdentifiers();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMCSettingsManager setHidden:forDisplayTypeIdentifiers:](self, "setHidden:forDisplayTypeIdentifiers:", v3, v5);

}

- (BOOL)hiddenForDisplayTypeIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (__CFString *)a3;
  -[NSUserDefaults dictionaryForKey:](self->_userDefaults, "dictionaryForKey:", CFSTR("ShouldHideByDisplayTypeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (CFSTR("DisplayTypeIdentifierMenstrualFlow") == v4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "BOOLValue");

    }
  }

  return (char)v7;
}

- (void)resetAllSettings
{
  void *v3;
  NSObject *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v23 = (id)objc_opt_class();
    v5 = v23;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reset all settings", buf, 0xCu);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_allSettingsToObserve;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("CycleTrackingOnboardingTileDismissedDate"));

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAppleWatch");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_allSettingsToObserve);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported, 0);
  objc_storeStrong((id *)&self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported, 0);
  objc_storeStrong((id *)&self->_unitTest_algorithmVersionMismatchOnWatch, 0);
  objc_storeStrong((id *)&self->_allSettingsToObserve, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)heartRateBasedProjectionsEnabled
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2_1();
  v3 = OUTLINED_FUNCTION_3_1(v2);
  OUTLINED_FUNCTION_0_2(&dword_218A9C000, v4, v5, "[%{public}@] -heartRateBasedProjectionsEnabled is deprecated. Please move to using HKFeatureSettingsKeyEnabled for HKFeatureIdentifierMenstrualCyclesHeartRateInput", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)wristTemperatureBasedProjectionsEnabled
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2_1();
  v3 = OUTLINED_FUNCTION_3_1(v2);
  OUTLINED_FUNCTION_0_2(&dword_218A9C000, v4, v5, "[%{public}@] -wristTemperatureBasedProjectionsEnabled is deprecated. Please move to using HKFeatureSettingsKeyEnabled for HKFeatureIdentifierMenstrualCyclesWristTemperatureInput", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)menstruationNotificationTimeOfDay
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Using overridden menstruation notification time: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)fertileWindowNotificationTimeOfDay
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Using overridden fertile window notification time: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
