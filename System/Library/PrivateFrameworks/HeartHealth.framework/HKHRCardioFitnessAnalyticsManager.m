@implementation HKHRCardioFitnessAnalyticsManager

- (HKHRCardioFitnessAnalyticsManager)initWithSignalSource:(id)a3
{
  id v5;
  HKHRCardioFitnessAnalyticsManager *v6;
  HKHRCardioFitnessAnalyticsManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRCardioFitnessAnalyticsManager;
  v6 = -[HKHRCardioFitnessAnalyticsManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signalSource, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (id)submitOnboardingEventForStep:(id)a3 acceptDefaults:(BOOL)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  HKHRCardioFitnessAnalyticsResult *v13;
  HKHRCardioFitnessAnalyticsResult *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  HKHRCardioFitnessAnalyticsManager *v20;
  id v21;
  id v22;
  BOOL v23;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke;
  v19 = &unk_1E9C25FA8;
  v23 = a4;
  v20 = self;
  v21 = v9;
  v22 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, &v16);
  v13 = [HKHRCardioFitnessAnalyticsResult alloc];
  v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:](v13, "initWithStatus:error:", 0, 0, v16, v17, v18, v19, v20);

  return v14;
}

void __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();

}

id __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isImproveHealthAndActivityAllowed");
  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "biologicalSexStringWithError:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("biologicalSex"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bucketedAgeWithError:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("age"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("acceptDefaults"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activeWatchProductType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("activeWatchProductType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("isImproveHealthAndActivityAllowed"));

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("countryCode"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("featureVersion"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("step"));
  return v2;
}

- (id)submitClassificationChartOverlaySelectedEventCurrentOverlay:(id)a3 previousOverlay:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  HKHRCardioFitnessAnalyticsResult *v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  HKHRCardioFitnessAnalyticsManager *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[HKHRCardioFitnessAnalyticsSignalSource isImproveHealthAndActivityAllowed](self->_signalSource, "isImproveHealthAndActivityAllowed"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke;
    block[3] = &unk_1E9C25D78;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(queue, block);
    v9 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 0, 0);

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_1D7781000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: IH&A not allowed, will not submit overlay analytics.", buf, 0xCu);
    }
    v9 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 2, 0);
  }

  return v9;
}

void __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();

}

id __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke_2(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1[4] + 8), "bucketedAgeWithError:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("age"));

  objc_msgSend(*(id *)(a1[4] + 8), "biologicalSexStringWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("biologicalSex"));

  objc_msgSend(*(id *)(a1[4] + 8), "featureVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("featureVersion"));

  if (a1[5])
    v6 = (const __CFString *)a1[5];
  else
    v6 = &stru_1E9C26A20;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("currentClassificationOverlay"));
  if (a1[6])
    v7 = (const __CFString *)a1[6];
  else
    v7 = &stru_1E9C26A20;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("previousClassificationOverlay"));
  return v2;
}

- (id)submitDailyEventWithSource:(id)a3 deviceContextsDict:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  id v11;
  HKHRCardioFitnessAnalyticsSignalSource *v12;
  id v13;
  HKHRCardioFitnessAnalyticsResult *v14;
  HKHRCardioFitnessAnalyticsSignalSource *signalSource;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61[2];

  v6 = a3;
  v7 = a4;
  v8 = -[HKHRCardioFitnessAnalyticsSignalSource isImproveHealthAndActivityAllowed](self->_signalSource, "isImproveHealthAndActivityAllowed");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = 0;
  v10 = objc_msgSend(v6, "determineWeeksSinceOnboardingWithCurrentDate:error:", v9, v61);
  v11 = v61[0];
  if (v11
    || (v12 = self->_signalSource,
        v60 = 0,
        -[HKHRCardioFitnessAnalyticsSignalSource bucketedAgeWithError:](v12, "bucketedAgeWithError:", &v60),
        (v11 = v60) != 0))
  {
    v13 = v11;
    v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v11);
  }
  else
  {
    signalSource = self->_signalSource;
    v59 = 0;
    -[HKHRCardioFitnessAnalyticsSignalSource biologicalSexStringWithError:](signalSource, "biologicalSexStringWithError:", &v59);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v59;
    if (v18)
    {
      v13 = v18;
      v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v18);
    }
    else
    {
      v58 = 0;
      objc_msgSend(v6, "determineDaysSinceLastLowNotificationWithCurrentDate:isImproveHealthAndActivityAllowed:error:", v9, v8, &v58);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v58;
      if (v20)
      {
        v13 = v20;
        v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v20);
      }
      else
      {
        v57 = 0;
        objc_msgSend(v6, "determineDaysSinceLastVO2MaxSampleWithCurrentDate:isImproveHealthAndActivityAllowed:error:", v9, v8, &v57);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v57;
        if (v21)
        {
          v13 = v21;
          v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v21);
        }
        else
        {
          v56 = 0;
          objc_msgSend(v6, "determineNumberOfLowNotificationsInPastYearWithCurrentDate:isImproveHealthAndActivityAllowed:error:", v9, v8, &v56);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v56;
          if (v22)
          {
            v13 = v22;
            v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v22);
          }
          else
          {
            v55 = 0;
            objc_msgSend(v6, "determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:error:", v8, &v55);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v55;
            if (v23)
            {
              v13 = v23;
              v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v23);
            }
            else
            {
              v54 = 0;
              objc_msgSend(v6, "latestClassificationWithIsOnboarded:isImproveHealthAndActivityAllowed:error:", v10 >= 0, v8, &v54);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v54;
              if (v13)
              {
                v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 1, v13);
                v24 = v41;
              }
              else
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E998);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  v37 = v25;
                  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E998);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v37;
                }
                else
                {
                  v40 = &unk_1E9C2E9B0;
                }

                objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9C8);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v38 = v26;
                  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9C8);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = v38;
                }
                else
                {
                  v35 = &unk_1E9C2E9B0;
                }

                objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9E0);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  v32 = v27;
                  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9E0);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v32;
                }
                else
                {
                  v39 = &unk_1E9C2E9B0;
                }

                objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9F8);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  v31 = v28;
                  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E9C2E9F8);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v31;
                }
                else
                {
                  v33 = &unk_1E9C2E9B0;
                }

                v45 = v6;
                v46 = v35;
                v47 = v33;
                v48 = v17;
                v49 = v19;
                v50 = v44;
                v51 = v43;
                v24 = v41;
                v52 = v41;
                v53 = v42;
                v34 = v33;
                v36 = v35;
                v29 = v39;
                v30 = v40;
                AnalyticsSendEventLazy();
                v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:]([HKHRCardioFitnessAnalyticsResult alloc], "initWithStatus:error:", 0, 0);

              }
            }

          }
        }

      }
    }

  }
  return v14;
}

id __83__HKHRCardioFitnessAnalyticsManager_submitDailyEventWithSource_deviceContextsDict___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activeWatchProductType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("activeWatchProductType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 144));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("isImproveHealthAndActivityAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "determineIsNotificationsEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("notificationsEnabled"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("onboardedVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 128));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("weeksSinceOnboarding"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("countPairediPhone"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("countPairedWatch"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("countPairediPad"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), CFSTR("countPairedVisionPro"));
  if (*(_BYTE *)(a1 + 144))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 136));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("age"));

    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 80), CFSTR("biologicalSex"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 88), CFSTR("daysSinceLastLowNotification"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 96), CFSTR("daysSinceLastVO2MaxSample"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 104), CFSTR("numberOfLowNotificationsInPastYear"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 112), CFSTR("assignedClassification"));
    objc_msgSend(*(id *)(a1 + 32), "_setKey:value:onPayloadIfPresent:", CFSTR("isBlockersEnabled"), *(_QWORD *)(a1 + 120), v2);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "determineIsHeartRateEnabledWithIsImproveHealthAndActivityAllowed:", *(unsigned __int8 *)(a1 + 144));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setKey:value:onPayloadIfPresent:", CFSTR("isHeartRateEnabled"), v10, v2);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "determineIsWristDetectionEnabledWithIsImproveHealthAndActivityAllowed:", *(unsigned __int8 *)(a1 + 144));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setKey:value:onPayloadIfPresent:", CFSTR("isWristDetectionEnabled"), v12, v2);

  }
  return v2;
}

- (void)_setKey:(id)a3 value:(id)a4 onPayloadIfPresent:(id)a5
{
  if (a4)
    objc_msgSend(a5, "setObject:forKeyedSubscript:", a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signalSource, 0);
}

@end
