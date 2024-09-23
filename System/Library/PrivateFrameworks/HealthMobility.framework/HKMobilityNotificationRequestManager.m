@implementation HKMobilityNotificationRequestManager

+ (void)postWalkingSteadinessNotificationWithHealthStore:(id)a3 category:(id)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0CB6730];
  v9 = a5;
  v10 = a4;
  v11 = [v8 alloc];
  v12 = (void *)objc_msgSend(v11, "initWithFeatureIdentifier:healthStore:countryCodeSource:", *MEMORY[0x1E0CB50B8], v7, 0);
  v22 = 0;
  objc_msgSend(v12, "featureStatusWithError:", &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WalkingSteadinessShouldNotShowPregnancyContent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "areAllRequirementsSatisfied");

  }
  else
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB5328];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1D7804000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unable to get featureStatus. error: %{public}@", buf, 0x16u);

    }
    v16 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CEC740], "hkmobility_requestForCategory:shouldHidePregnancyContent:", v10, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6938]), "initWithHealthStore:", v7);
  objc_msgSend(v21, "postNotificationWithRequest:completion:", v20, v9);

}

@end
