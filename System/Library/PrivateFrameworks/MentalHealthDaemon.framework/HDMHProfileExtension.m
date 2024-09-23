@implementation HDMHProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E90]) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2DD8]) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E50]) & 1) != 0)
  {
    v5 = 32;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E98]))
    {
      v6 = 0;
      goto LABEL_10;
    }
    v5 = 48;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_10:

  return v6;
}

- (HDMHProfileExtension)initWithProfile:(id)a3
{
  return -[HDMHProfileExtension initWithProfile:typicalDayProvider:](self, "initWithProfile:typicalDayProvider:", a3, 0);
}

- (HDMHProfileExtension)initWithProfile:(id)a3 typicalDayProvider:(id)a4
{
  id v6;
  id v7;
  HDMHProfileExtension *v8;
  HDMHProfileExtension *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  HDFeatureAvailabilityManager *stateOfMindLoggingFeatureAvailabilityManager;
  void *v15;
  id WeakRetained;
  uint64_t v17;
  HDFeatureAvailabilityManager *depressionAndAnxietyAssessmentsFeatureAvailabilityManager;
  id v19;
  id v20;
  os_log_t *v21;
  uint64_t v22;
  HDBackgroundFeatureDeliveryManager *depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager;
  void *v24;
  id v25;
  uint64_t v26;
  HDFeatureAvailabilityManager *periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager;
  id v28;
  id v29;
  uint64_t v30;
  HDBackgroundFeatureDeliveryManager *periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager;
  void *v32;
  id v33;
  uint64_t v34;
  HDFeatureAvailabilityManager *stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager;
  id v36;
  id v37;
  uint64_t v38;
  HDBackgroundFeatureDeliveryManager *stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager;
  HKMHSettingsManager *v40;
  HKMHSettingsManager *settingsManager;
  id v42;
  uint64_t v43;
  HDMHSOMNotificationManager *v44;
  HDMHSOMNotificationManager *somNotificationManager;
  HDMHAssessmentsNotificationManager *v46;
  HDMHAssessmentsNotificationManager *assessmentsNotificationManager;
  void *v48;
  char v49;
  void *v50;
  HKMHSettingsManager *v51;
  id v52;
  os_log_t v53;
  HKMHSettingsManager *v54;
  uint64_t v55;
  HDAnalyticsDailyEventManager *mentalHealthDailyEventManager;
  os_log_t v57;
  NSObject *v58;
  void *v59;
  id v60;
  _QWORD v62[4];
  HKMHSettingsManager *v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)HDMHProfileExtension;
  v8 = -[HDMHProfileExtension init](&v64, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_profile, v6);
    v11 = (void *)MEMORY[0x24BE40AB8];
    v12 = v10;
    objc_msgSend(v11, "hdmh_stateOfMindLoggingAvailabilityManagerWithProfile:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    stateOfMindLoggingFeatureAvailabilityManager = v9->_stateOfMindLoggingFeatureAvailabilityManager;
    v9->_stateOfMindLoggingFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v13;

    v15 = (void *)MEMORY[0x24BE40AB8];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v15, "hdmh_depressionAndAnxietyAssessmentsAvailabilityManagerWithProfile:", WeakRetained);
    v17 = objc_claimAutoreleasedReturnValue();
    depressionAndAnxietyAssessmentsFeatureAvailabilityManager = v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager;
    v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v17;

    v19 = objc_alloc(MEMORY[0x24BE40A48]);
    v20 = objc_loadWeakRetained((id *)&v9->_profile);
    v21 = (os_log_t *)MEMORY[0x24BDD3038];
    v22 = objc_msgSend(v19, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v20, v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager, *MEMORY[0x24BDD3038]);
    depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager = v9->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager;
    v9->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v22;

    v24 = (void *)MEMORY[0x24BE40AB8];
    v25 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v24, "hdmh_periodicDepressionAndAnxietyAssessmentPromptsAvailabilityManagerWithProfile:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager = v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager;
    v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v26;

    v28 = objc_alloc(MEMORY[0x24BE40A48]);
    v29 = objc_loadWeakRetained((id *)&v9->_profile);
    v30 = objc_msgSend(v28, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v29, v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager, *v21);
    periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager = v9->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager;
    v9->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v30;

    v32 = (void *)MEMORY[0x24BE40AB8];
    v33 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v32, "hdmh_stateOfMindLoggingPatternEscalationsAvailabilityManagerWithProfile:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager = v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager;
    v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v34;

    v36 = objc_alloc(MEMORY[0x24BE40A48]);
    v37 = objc_loadWeakRetained((id *)&v9->_profile);
    v38 = objc_msgSend(v36, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v37, v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager, *v21);
    stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager = v9->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager;
    v9->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v38;

    v40 = (HKMHSettingsManager *)objc_alloc_init(MEMORY[0x24BE65DF0]);
    settingsManager = v9->_settingsManager;
    v9->_settingsManager = v40;

    v42 = objc_loadWeakRetained((id *)&v9->_profile);
    v43 = objc_msgSend(v42, "profileType");

    if (v43 == 1)
    {
      v44 = -[HDMHSOMNotificationManager initWithProfile:settingsManager:typicalDayProvider:]([HDMHSOMNotificationManager alloc], "initWithProfile:settingsManager:typicalDayProvider:", v6, v9->_settingsManager, v7);
      somNotificationManager = v9->_somNotificationManager;
      v9->_somNotificationManager = v44;

      v46 = -[HDMHAssessmentsNotificationManager initWithProfile:settingsManager:]([HDMHAssessmentsNotificationManager alloc], "initWithProfile:settingsManager:", v6, v9->_settingsManager);
      assessmentsNotificationManager = v9->_assessmentsNotificationManager;
      v9->_assessmentsNotificationManager = v46;

      objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isAppleWatch");

      if ((v49 & 1) == 0)
      {
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3918]), "initWithLoggingCategory:healthDataSource:", *v21, v6);
        v51 = v9->_settingsManager;
        v52 = objc_alloc(MEMORY[0x24BE40A28]);
        v53 = *v21;
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __59__HDMHProfileExtension_initWithProfile_typicalDayProvider___block_invoke;
        v62[3] = &unk_2511A20C8;
        v63 = v51;
        v54 = v51;
        v55 = objc_msgSend(v52, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v6, v50, v53, v62);
        mentalHealthDailyEventManager = v9->_mentalHealthDailyEventManager;
        v9->_mentalHealthDailyEventManager = (HDAnalyticsDailyEventManager *)v55;

      }
    }
    _HKInitializeLogging();
    v57 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v66 = v59;
      v60 = v59;
      _os_log_impl(&dword_2416F5000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);

    }
  }

  return v9;
}

HDMHMentalHealthDailyAnalyticsEvent *__59__HDMHProfileExtension_initWithProfile_typicalDayProvider___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  HDMHMentalHealthDailyAnalyticsEvent *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x24BDD45F0]);
  v7 = -[HDMHMentalHealthDailyAnalyticsEvent initWithProfile:settingsManager:userDefaults:]([HDMHMentalHealthDailyAnalyticsEvent alloc], "initWithProfile:settingsManager:userDefaults:", v4, *(_QWORD *)(a1 + 32), v6);

  return v7;
}

- (HDPrimaryProfile)profile
{
  return (HDPrimaryProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKMHSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (HDMHSOMNotificationManager)somNotificationManager
{
  return self->_somNotificationManager;
}

- (HDMHAssessmentsNotificationManager)assessmentsNotificationManager
{
  return self->_assessmentsNotificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assessmentsNotificationManager, 0);
  objc_storeStrong((id *)&self->_somNotificationManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_mentalHealthDailyEventManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingFeatureAvailabilityManager, 0);
}

@end
