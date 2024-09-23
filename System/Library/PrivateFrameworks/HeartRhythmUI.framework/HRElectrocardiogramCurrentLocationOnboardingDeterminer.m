@implementation HRElectrocardiogramCurrentLocationOnboardingDeterminer

- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)initWithHealthStore:(id)a3
{
  id v5;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v6;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v7;
  uint64_t v8;
  HKRegulatoryDomainProvider *mobileCountryCodeManager;
  id v10;
  uint64_t v11;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HRElectrocardiogramCurrentLocationOnboardingDeterminer;
  v6 = -[HRElectrocardiogramCurrentLocationOnboardingDeterminer init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    HKPreferredRegulatoryDomainProvider();
    v8 = objc_claimAutoreleasedReturnValue();
    mobileCountryCodeManager = v7->_mobileCountryCodeManager;
    v7->_mobileCountryCodeManager = (HKRegulatoryDomainProvider *)v8;

    v10 = objc_alloc(MEMORY[0x24BDD3918]);
    v11 = objc_msgSend(v10, "initWithLoggingCategory:healthDataSource:", *MEMORY[0x24BDD3010], v5);
    analyticsEventSubmissionManager = v7->_analyticsEventSubmissionManager;
    v7->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v11;

  }
  return v7;
}

- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD3D78];
  v5 = a3;
  objc_msgSend(v4, "activeNonFamilySetupDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramCurrentLocationOnboardingDeterminer isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch:completion:]((uint64_t)self, v6, v5);

}

- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch:(void *)a3 completion:
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char *v9;

  v4 = a3;
  v5 = v4;
  if (a1)
  {
    v6 = *(void **)(a1 + 16);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke;
    v7[3] = &unk_24D34AC28;
    v7[4] = a1;
    v9 = sel_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion_;
    v8 = v4;
    objc_msgSend(v6, "fetchMobileCountryCodeFromCellularWithCompletion:", v7);

  }
}

void __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void (*v31)(void);
  void *v32;
  id v33;
  char v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "ISOCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
      {
        v21 = a1[4];
        v22 = (const char *)a1[6];
        v23 = v20;
        NSStringFromSelector(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v21;
        v45 = 2114;
        v46 = v24;
        _os_log_impl(&dword_215454000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@] -> Country code is nil. Set error.", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 122, CFSTR("Location is invalid or unavailable"));
      v25 = objc_claimAutoreleasedReturnValue();

      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, (void *)*MEMORY[0x24BDD2788], 0);
      (*(void (**)(void))(a1[5] + 16))();
      v6 = (id)v25;
      goto LABEL_36;
    }
    if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD2BC8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "unsignedIntegerValue");
      if (v10)
      {
        v11 = objc_msgSend(MEMORY[0x24BDD3B70], "algorithmVersionForOnboardingVersion:", v10);
        _HKInitializeLogging();
        v12 = (void *)*MEMORY[0x24BDD3010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
        {
          v13 = a1[4];
          v14 = (const char *)a1[6];
          v15 = v12;
          NSStringFromSelector(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v44 = v13;
          v45 = 2114;
          v46 = v16;
          v47 = 2114;
          v48 = v9;
          v49 = 2114;
          v50 = v5;
          _os_log_impl(&dword_215454000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Algorithm Version was overridden via HKECGOnboardingVersionOverrideKey -> %{public}@, Country Code: %{public}@", buf, 0x2Au);

        }
        v17 = a1[5];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, id))(v17 + 16))(v17, v7, v18, v6);

        goto LABEL_35;
      }

    }
    v26 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v27 = a1[4];
    if (v27)
      v28 = *(_QWORD *)(v27 + 8);
    else
      v28 = 0;
    v9 = (void *)objc_msgSend(v26, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2DE8], v28);
    v42 = 0;
    objc_msgSend(v9, "onboardingEligibilityForCountryCode:error:", v7, &v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v42;
    if (!v29)
    {
      _HKInitializeLogging();
      v32 = (void *)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      {
        v38 = a1[4];
        v39 = (const char *)a1[6];
        v40 = v32;
        NSStringFromSelector(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v44 = v38;
        v45 = 2114;
        v46 = v41;
        v47 = 2114;
        v48 = v7;
        v49 = 2114;
        v50 = v30;
        _os_log_error_impl(&dword_215454000, v40, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Could not establish eligibility for ECG2 countryCode: %{public}@, Error: %{public}@", buf, 0x2Au);

      }
      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_24D357F10, 0);
      v31 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_23;
    }
    if (objc_msgSend(v29, "isEligible"))
    {
      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_24D357F10, v29);
      v31 = *(void (**)(void))(a1[5] + 16);
LABEL_23:
      v31();
LABEL_34:

LABEL_35:
LABEL_36:

      goto LABEL_37;
    }

    v33 = v29;
    v34 = objc_msgSend(v33, "ineligibilityReasons");
    if ((v34 & 2) == 0 && (v34 & 4) == 0)
    {
      if ((v34 & 8) != 0)
        goto LABEL_38;
      if ((v34 & 0x10) == 0)
      {
        if ((v34 & 0x20) == 0)
        {
          if ((v34 & 0x40) != 0)
          {
            v36 = (void *)MEMORY[0x24BDD1540];
            v35 = CFSTR("Feature disabled");
            v37 = 111;
            goto LABEL_33;
          }
          if (v34 < 0)
          {
            v35 = CFSTR("Feature seed expired");
            v36 = (void *)MEMORY[0x24BDD1540];
            v37 = 113;
            goto LABEL_33;
          }
          v35 = CFSTR("Feature unavailable");
          v36 = (void *)MEMORY[0x24BDD1540];
          goto LABEL_39;
        }
LABEL_38:
        v36 = (void *)MEMORY[0x24BDD1540];
        v35 = CFSTR("Feature unavailable");
LABEL_39:
        v37 = 110;
        goto LABEL_33;
      }
    }
    v36 = (void *)MEMORY[0x24BDD1540];
    v35 = CFSTR("Device not supported");
    v37 = 112;
LABEL_33:
    objc_msgSend(v36, "hk_error:description:", v37, v35);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_24D357F10, v33);
    (*(void (**)(void))(a1[5] + 16))();

    goto LABEL_34;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
    __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke_cold_1((uint64_t)a1, v19, (uint64_t)v6);
  -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], 0, (void *)*MEMORY[0x24BDD2788], 0);
  (*(void (**)(void))(a1[5] + 16))();
LABEL_37:

}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(void *)a3 algorithmVersion:(void *)a4 onboardingEligibility:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  if (a1)
  {
    v7 = (objc_class *)MEMORY[0x24BE4A770];
    v8 = a4;
    v9 = a3;
    v10 = a2;
    v11 = [v7 alloc];
    v12 = *MEMORY[0x24BDD2DE0];
    objc_msgSend(v9, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "ISOCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(v11, "initWithFeatureIdentifier:featureVersion:countryCode:step:onboardingEligibility:", v12, v13, v14, CFSTR("Intro"), v8);
    v16 = *(void **)(a1 + 24);
    v20 = 0;
    v17 = v16;
    LOBYTE(v8) = objc_msgSend(v17, "submitEvent:error:", v15, &v20);
    v18 = v20;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:].cold.1(v19, a1, (uint64_t)v18);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(const char **)(a1 + 48);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v4;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = 0;
  v14 = 2114;
  v15 = a3;
  _os_log_error_impl(&dword_215454000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Location not found, Country Code: %{public}@, Error: %{public}@", (uint8_t *)&v8, 0x2Au);

}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(void *)a1 algorithmVersion:(uint64_t)a2 onboardingEligibility:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_215454000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error submitting onboarding errors analytics event: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
