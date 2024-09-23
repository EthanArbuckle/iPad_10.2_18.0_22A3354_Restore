@implementation HDHRIrregularRhythmNotificationsFeatureAvailabilityManager

- (id)featureOnboardingRecordWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v17;
  id v18;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v18 = 0;
  -[HDFeatureAvailabilityExtension featureOnboardingRecordWithError:](v1FeatureAvailabilityManager, "featureOnboardingRecordWithError:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.2();
  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17 = 0;
  -[HDFeatureAvailabilityExtension featureOnboardingRecordWithError:](v2FeatureAvailabilityManager, "featureOnboardingRecordWithError:", &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v9)
  {
    if (v6)
    {
      v11 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", objc_msgSend(v6, "onboardingState"), objc_msgSend(v9, "onboardingState"));
      if (objc_msgSend(v9, "onboardingState") == v11)
        v12 = v9;
      else
        v12 = v6;
      v13 = v12;
      goto LABEL_20;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  }
  if (v7)
    v14 = v7;
  else
    v14 = v10;
  v15 = v14;
  if (v15)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  v13 = 0;
LABEL_20:

  return v13;
}

- (int64_t)_featureSupportedStateForOnboardedV1CountryCodeSupportedState:(int64_t)a3 onboardedV2CountryCodeSupportedState:(int64_t)a4
{
  int64_t result;
  int64_t v5;
  _QWORD *v6;

  switch(a3)
  {
    case 1:
      if ((unint64_t)(a4 - 1) >= 5)
        return 5;
      else
        return a4;
    case 2:
      v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5)
        goto LABEL_12;
      v6 = &unk_1CC2E77A8;
      goto LABEL_11;
    case 3:
      v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5)
        goto LABEL_12;
      v6 = &unk_1CC2E77D0;
      goto LABEL_11;
    case 4:
      v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5)
        goto LABEL_12;
      v6 = &unk_1CC2E77F8;
LABEL_11:
      result = v6[v5];
      break;
    default:
LABEL_12:
      result = 5;
      break;
  }
  return result;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  id v7;
  void *v8;
  id v9;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v32 = 0;
  v7 = a3;
  -[HDFeatureAvailabilityExtension onboardingEligibilityForCountryCode:error:](v1FeatureAvailabilityManager, "onboardingEligibilityForCountryCode:error:", v7, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v31 = 0;
  -[HDFeatureAvailabilityExtension onboardingEligibilityForCountryCode:error:](v2FeatureAvailabilityManager, "onboardingEligibilityForCountryCode:error:", v7, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v31;
  v13 = v12;
  if (v8)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    if (objc_msgSend(v11, "ineligibilityReasons"))
    {
      if (objc_msgSend(v8, "ineligibilityReasons"))
      {
        v19 = objc_msgSend(v8, "ineligibilityReasons");
        v20 = objc_msgSend(v11, "ineligibilityReasons") & v19;
        if (v20)
        {
          objc_msgSend(v11, "countryAvailabilityVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66D0]), "initWithIneligibilityReasons:countryAvailabilityVersion:", v20, v21);

LABEL_23:
          -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eligibilityRespectingOverridesForFeatureIdentifier:", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
        _HKInitializeLogging();
        v23 = (void *)*MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        {
          v26 = v23;
          v27 = (void *)objc_opt_class();
          v28 = v27;
          objc_msgSend(v8, "ineligibilityReasonsDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "ineligibilityReasonsDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v27;
          v35 = 2114;
          v36 = v29;
          v37 = 2114;
          v38 = v30;
          _os_log_error_impl(&dword_1CC29C000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] No intersection of unavailability reasons for IRN1 and IRN2: %{public}@ (v1) | %{public}@ (v2)", buf, 0x20u);

        }
      }
      v22 = v8;
    }
    else
    {
      v22 = v11;
    }
    v17 = v22;
    goto LABEL_23;
  }
  if (v9)
    v15 = v9;
  else
    v15 = v12;
  v16 = v15;
  v17 = v16;
  if (!v16)
    goto LABEL_18;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_18:
    v18 = 0;
    goto LABEL_24;
  }
  v17 = objc_retainAutorelease(v16);
  v18 = 0;
  *a4 = v17;
LABEL_24:

  return v18;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB5038];
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E87EF6F0;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithProfile:(id)a3 v2PairedFeaturePropertiesSyncManager:(id)a4 notificationSettingDefaults:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *v15;
  void *v16;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v17;

  v8 = (objc_class *)MEMORY[0x1E0D29510];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  objc_msgSend(v11, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDaemon:remoteDisableCondition:seedExpirationCondition:", v13, *MEMORY[0x1E0CB5DF8], *MEMORY[0x1E0CB5E08]);

  v15 = -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager initWithProfile:disableAndExpiryProvider:notificationSettingDefaults:]([HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager alloc], "initWithProfile:disableAndExpiryProvider:notificationSettingDefaults:", v11, v14, v9);
  objc_msgSend(MEMORY[0x1E0D294A0], "hdhr_irregularRhythmNotificationsV2FeatureAvailabilityManagerWithProfile:disableAndExpiryProvider:pairedFeaturePropertiesSyncManager:", v11, v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:](self, "initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:", v15, v16);
  return v17;
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4
{
  id v7;
  id v8;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v9;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  HKObserverSet *observers;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDHRIrregularRhythmNotificationsFeatureAvailabilityManager;
  v9 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v10->_v2FeatureAvailabilityManager, a4);
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithName:loggingCategory:", v13, *MEMORY[0x1E0CB52F0]);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;

  }
  return v10;
}

- (id)highestAvailableOnboardedAlgorithmVersionWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  id v18;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v18 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    goto LABEL_18;
  }
  if (-[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", objc_msgSend(v6, "integerValue"), objc_msgSend(v9, "integerValue")) != 2)
  {
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v9, "integerValue") == 2)
    v15 = &unk_1E87FF8D8;
  else
    v15 = &unk_1E87FF8F0;
LABEL_19:

  return v15;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  id v7;
  void *v8;
  id v9;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v22 = 0;
  v7 = a3;
  -[HDFeatureAvailabilityExtension canCompleteOnboardingForCountryCode:error:](v1FeatureAvailabilityManager, "canCompleteOnboardingForCountryCode:error:", v7, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v21 = 0;
  -[HDFeatureAvailabilityExtension canCompleteOnboardingForCountryCode:error:](v2FeatureAvailabilityManager, "canCompleteOnboardingForCountryCode:error:", v7, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v21;
  v13 = v12;
  if (v8)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v9)
      v15 = v9;
    else
      v15 = v12;
    v16 = v15;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
      v18 = 1;
    else
      v18 = objc_msgSend(v11, "BOOLValue");
    objc_msgSend(v17, "numberWithInt:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v18 = 0;
  -[HDFeatureAvailabilityExtension earliestDateLowestOnboardingVersionCompletedWithError:](v1FeatureAvailabilityManager, "earliestDateLowestOnboardingVersionCompletedWithError:", &v18);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v18;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17 = 0;
  -[HDFeatureAvailabilityExtension earliestDateLowestOnboardingVersionCompletedWithError:](v2FeatureAvailabilityManager, "earliestDateLowestOnboardingVersionCompletedWithError:", &v17);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v6 | v9)
  {
    if (v6)
    {
      if (v9)
      {
        objc_msgSend((id)v6, "earlierDate:", v9);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (id)v6;
      }
    }
    else
    {
      v14 = (id)v9;
    }
    v15 = v14;
  }
  else
  {
    if (v7)
      v12 = v7;
    else
      v12 = v10;
    v13 = v12;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }

  return v15;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v7;
  NSObject *v8;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v5 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__6;
  v32[4] = __Block_byref_object_dispose__6;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__6;
  v30[4] = __Block_byref_object_dispose__6;
  v31 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v26[3] = &unk_1E87F0780;
  v28 = v32;
  v29 = v30;
  v8 = v5;
  v27 = v8;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithCompletion:](v1FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithCompletion:", v26);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__6;
  v22[4] = __Block_byref_object_dispose__6;
  v23 = 0;
  dispatch_group_enter(v8);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v18[3] = &unk_1E87F0780;
  v20 = v24;
  v21 = v22;
  v10 = v8;
  v19 = v10;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithCompletion:](v2FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithCompletion:", v18);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3;
  v12[3] = &unk_1E87F07A8;
  v13 = v4;
  v14 = v32;
  v15 = v24;
  v16 = v30;
  v17 = v22;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v2 && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "BOOLValue");
    v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (!v4)
      v4 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], 0, v4);
  }
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithError:](v1FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v19 = 0;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithError:](v2FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v15, "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension isFeatureCapabilitySupportedOnActivePairedDeviceWithError:](v1FeatureAvailabilityManager, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v19 = 0;
  -[HDFeatureAvailabilityExtension isFeatureCapabilitySupportedOnActivePairedDeviceWithError:](v2FeatureAvailabilityManager, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v15, "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  id v32;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v32 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v32);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v32;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v31 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v31);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v31;
  v11 = v10;
  if (v6 | v9)
  {
    if (v6)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", objc_msgSend((id)v6, "integerValue"), objc_msgSend((id)v9, "integerValue")));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
          -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.2((uint64_t)v11, v23, v24, v25, v26, v27, v28, v29);
        v14 = (id)v6;
      }
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.1((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
      v14 = (id)v9;
    }
    v22 = v14;
  }
  else
  {
    if (v7)
      v12 = v7;
    else
      v12 = v10;
    v13 = v12;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v22 = 0;
  }

  return v22;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  int64_t v15;
  NSObject *v16;
  HDFeatureAvailabilityExtension *v17;
  void *v18;
  id v20;
  id v21;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v21 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }
    goto LABEL_25;
  }
  v15 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", objc_msgSend(v6, "integerValue"), objc_msgSend(v9, "integerValue"));
  if (v15 == 1)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager pairedFeatureAttributesWithError:].cold.1(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("Unable to determine paired feature attributes for IRN without onboarding completion"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend(v9, "integerValue") == v15)
    v17 = self->_v2FeatureAvailabilityManager;
  else
    v17 = self->_v1FeatureAvailabilityManager;
  -[HDFeatureAvailabilityExtension pairedFeatureAttributesWithError:](v17, "pairedFeatureAttributesWithError:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v18;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)-[HDFeatureAvailabilityExtension regionAvailabilityWithError:](self->_v2FeatureAvailabilityManager, "regionAvailabilityWithError:", a3);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v17;
  void *v18;
  int64_t v19;
  NSObject *v20;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  HDFeatureAvailabilityExtension *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  char v37;
  id v38;
  id v39;
  _QWORD block[4];
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t *v45;
  char v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD *v49;
  uint64_t *v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[3];
  char v59;
  _QWORD v60[4];
  NSObject *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[3];
  char v67;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v39 = a7;
  v15 = dispatch_group_create();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__6;
  v64[4] = __Block_byref_object_dispose__6;
  v65 = 0;
  dispatch_group_enter(v15);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v60[3] = &unk_1E87F07D0;
  v62 = v66;
  v63 = v64;
  v17 = v13;
  v18 = v14;
  v19 = a4;
  v20 = v15;
  v61 = v20;
  -[HDFeatureAvailabilityExtension setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](v1FeatureAvailabilityManager, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v12, a4, v13, v18, v60);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__6;
  v56 = __Block_byref_object_dispose__6;
  v57 = 0;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v51 = 0;
  -[HDFeatureAvailabilityExtension onboardingEligibilityForCountryCode:error:](v2FeatureAvailabilityManager, "onboardingEligibilityForCountryCode:error:", v12, &v51);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = (void *)v22;
  v25 = v51;
  if (v24)
  {
    if (!objc_msgSend(v24, "isEligible"))
    {
      v37 = 0;
      goto LABEL_9;
    }
    dispatch_group_enter(v20);
    v26 = self->_v2FeatureAvailabilityManager;
    v47[0] = v23;
    v47[1] = 3221225472;
    v47[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_198;
    v47[3] = &unk_1E87F07D0;
    v49 = v58;
    v50 = &v52;
    v48 = v20;
    -[HDFeatureAvailabilityExtension setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](v26, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v12, v19, v17, v18, v47);
    v27 = v48;
  }
  else
  {
    _HKInitializeLogging();
    v28 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:].cold.1((uint64_t)v25, v28, v29, v30, v31, v32, v33, v34);
    v35 = v53;
    v36 = v25;
    v27 = v35[5];
    v35[5] = (uint64_t)v36;
  }

  v37 = 1;
LABEL_9:
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  block[3] = &unk_1E87F07F8;
  v41 = v39;
  v42 = v66;
  v43 = v58;
  v44 = v64;
  v45 = &v52;
  v46 = v37;
  v38 = v39;
  dispatch_group_notify(v20, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_198(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
LABEL_5:
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      _HKInitializeLogging();
      v9 = (os_log_t *)MEMORY[0x1E0CB52F0];
      v10 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_INFO))
      {
        v11 = *(unsigned __int8 *)(a1 + 72);
        v22[0] = 67240192;
        v22[1] = v11;
        _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_INFO, "Completed onboarding for IRN 1.0, but did not complete onboarding for 2.0 with expectation: %{public}d", (uint8_t *)v22, 8u);
      }
      if (*(_BYTE *)(a1 + 72))
      {
        _HKInitializeLogging();
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_1(a1, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);
    goto LABEL_5;
  }
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v21)
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v20 + 16))(v20, 0, v21);
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1(v6);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Saving HKOnboardingCompletion directly is not supported for IRN's combined feature identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingData:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown data setting for IRN"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingString:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown string setting for IRN"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v12;
  id v13;
  HDFeatureAvailabilityExtension *v14;
  NSObject *v15;
  void *v16;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v18;
  id v19;
  HDFeatureAvailabilityExtension *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[5];
  NSObject *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];
  char v47;
  id v48;
  _QWORD v49[5];
  NSObject *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[3];
  char v56;
  id v57;
  _BYTE v58[32];
  _BYTE v59[32];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_group_create();
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v57 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v57);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v57;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__6;
  v53[4] = __Block_byref_object_dispose__6;
  v54 = 0;
  if (v12)
  {
    if (objc_msgSend(v12, "integerValue") != 1)
    {
      dispatch_group_enter(v10);
      v14 = self->_v1FeatureAvailabilityManager;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke;
      v49[3] = &unk_1E87F0820;
      v49[4] = self;
      v51 = v55;
      v52 = v53;
      v50 = v10;
      -[HDFeatureAvailabilityExtension setFeatureSettingNumber:forKey:completion:](v14, "setFeatureSettingNumber:forKey:completion:", v28, v8, v49);

    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.2(v16, (uint64_t)v13, (uint64_t)v59);
    }

  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v48 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v48;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 1;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__6;
  v44[4] = __Block_byref_object_dispose__6;
  v45 = 0;
  if (v18)
  {
    if (objc_msgSend(v18, "integerValue") != 1)
    {
      dispatch_group_enter(v10);
      v20 = self->_v2FeatureAvailabilityManager;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_205;
      v40[3] = &unk_1E87F0820;
      v40[4] = self;
      v42 = v46;
      v43 = v44;
      v41 = v10;
      -[HDFeatureAvailabilityExtension setFeatureSettingNumber:forKey:completion:](v20, "setFeatureSettingNumber:forKey:completion:", v28, v8, v40);

    }
  }
  else
  {
    _HKInitializeLogging();
    v21 = (id)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1(v22, (uint64_t)v19, (uint64_t)v58);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_206;
  block[3] = &unk_1E87F0848;
  v30 = v12;
  v31 = v18;
  v32 = v13;
  v33 = v19;
  v36 = v55;
  v37 = v46;
  v38 = v53;
  v39 = v44;
  v34 = self;
  v35 = v9;
  v23 = v19;
  v24 = v13;
  v25 = v9;
  v26 = v18;
  v27 = v12;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_cold_1(a1, v6);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_205(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_205_cold_1(a1, v6);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_206(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (*v7)(void);

  if (!*(_QWORD *)(a1 + 32) || (v2 = *(void **)(a1 + 40)) == 0)
  {
    v6 = *(_QWORD *)(a1 + 72);
LABEL_12:
    v7 = *(void (**)(void))(v6 + 16);
LABEL_13:
    v7();
    return;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v6 = *(_QWORD *)(a1 + 72);
    goto LABEL_12;
  }
  if (objc_msgSend(v2, "integerValue") != 1 || objc_msgSend(*(id *)(a1 + 32), "integerValue") != 1)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_13;
  }
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_FAULT))
    __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_206_cold_1(a1, v3);
  v4 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Unable to update setting for IRN with neither version onboarded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  NSObject *v10;
  void *v11;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[3];
  char v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[3];
  char v37;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 1;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__6;
  v34[4] = __Block_byref_object_dispose__6;
  v35 = 0;
  dispatch_group_enter(v8);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke;
  v30[3] = &unk_1E87F0820;
  v30[4] = self;
  v32 = v36;
  v33 = v34;
  v10 = v8;
  v31 = v10;
  v11 = v6;
  -[HDFeatureAvailabilityExtension removeFeatureSettingValueForKey:completion:](v1FeatureAvailabilityManager, "removeFeatureSettingValueForKey:completion:", v6, v30);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 1;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__6;
  v26[4] = __Block_byref_object_dispose__6;
  v27 = 0;
  dispatch_group_enter(v10);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_209;
  v22[3] = &unk_1E87F0820;
  v22[4] = self;
  v24 = v28;
  v25 = v26;
  v14 = v10;
  v23 = v14;
  -[HDFeatureAvailabilityExtension removeFeatureSettingValueForKey:completion:](v2FeatureAvailabilityManager, "removeFeatureSettingValueForKey:completion:", v11, v22);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_210;
  v16[3] = &unk_1E87F07A8;
  v17 = v7;
  v18 = v36;
  v19 = v28;
  v20 = v34;
  v21 = v26;
  v15 = v7;
  dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v16);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_cold_1(a1, v6);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_209(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_209_cold_1(a1, v6);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_210(_QWORD *a1)
{
  uint64_t v2;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v2)
    v2 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], 0, v2);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v7;
  NSObject *v8;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;

  v4 = a3;
  v5 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__6;
  v30[4] = __Block_byref_object_dispose__6;
  v31 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v26[3] = &unk_1E87F07D0;
  v28 = v32;
  v29 = v30;
  v8 = v5;
  v27 = v8;
  -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](v1FeatureAvailabilityManager, "resetOnboardingWithCompletion:", v26);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__6;
  v22[4] = __Block_byref_object_dispose__6;
  v23 = 0;
  dispatch_group_enter(v8);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2;
  v18[3] = &unk_1E87F07D0;
  v20 = v24;
  v21 = v22;
  v10 = v8;
  v19 = v10;
  -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](v2FeatureAvailabilityManager, "resetOnboardingWithCompletion:", v18);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3;
  v12[3] = &unk_1E87F07A8;
  v13 = v4;
  v14 = v32;
  v15 = v24;
  v16 = v30;
  v17 = v22;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v2)
    v2 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], 0, v2);
}

void __85__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  id v2;

  HKCreateSerialDispatchQueue();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerObserver:queue:", *(_QWORD *)(a1 + 32), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerObserver:queue:", *(_QWORD *)(a1 + 32), v2);

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E87EF6F0;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __81__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unregisterObserver:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unregisterObserver:");
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __120__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v4[3] = &unk_1E87EF678;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

uint64_t __120__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v4[3] = &unk_1E87EF678;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

void __108__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __122__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke;
  v4[3] = &unk_1E87EF678;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

void __122__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __118__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke;
  v4[3] = &unk_1E87EF678;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

void __118__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionDidUpdateRegionAvailability:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __133__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke;
  v4[3] = &unk_1E87EF678;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

void __133__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Failed to retrieve onboarding record for IRN2: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Failed to retrieve onboarding record for IRN1: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)onboardedCountryCodeSupportedStateWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Error checking onboarded country code supported state for IRN 1.0, returning supported state for 2.0: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)onboardedCountryCodeSupportedStateWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Error checking onboarded country code supported state for IRN 2.0, returning supported state for 1.0: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)pairedFeatureAttributesWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "Unable to determine paired feature attributes for IRN without onboarding completion", v1, 2u);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(uint64_t)a3 countryCodeProvenance:(uint64_t)a4 date:(uint64_t)a5 settings:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Could not validate IRN 2.0 eligibility with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Failed to complete onboarding for IRN 2.0 with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Completed onboarding for IRN 2.0, but failed to complete for 1.0: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  _os_log_error_impl(&dword_1CC29C000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion directly is not supported for IRN's combined feature identifier", v4, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown data setting for IRN: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown string setting for IRN: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingNumber:(void *)a1 forKey:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_6_3(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_8_2(&dword_1CC29C000, v4, v5, "[%{public}@] Unable to determine whether IRN2 is onboarded: %{public}@");

  OUTLINED_FUNCTION_7_1();
}

- (void)setFeatureSettingNumber:(void *)a1 forKey:(uint64_t)a2 completion:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_6_3(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_8_2(&dword_1CC29C000, v4, v5, "[%{public}@] Unable to determine whether IRN1 is onboarded: %{public}@");

  OUTLINED_FUNCTION_7_1();
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to update feature setting for IRN1: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_205_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to update feature setting for IRN2: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_206_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_9();
  v5 = OUTLINED_FUNCTION_7(v4);
  _os_log_fault_impl(&dword_1CC29C000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] Attempt to update setting failed; neither version of IRN is onboarded",
    v6,
    0xCu);

  OUTLINED_FUNCTION_8();
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to remove feature setting for IRN1: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_209_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to remove feature setting for IRN2: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
