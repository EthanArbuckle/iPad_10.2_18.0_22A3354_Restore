@implementation ATXUserActivityStream

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  return -[ATXUserActivityStream getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:](self, "getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:", a3, a4, 0);
}

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  return -[ATXUserActivityStream getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:limit:](self, "getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:limit:", a3, a4, a5, 100);
}

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  unint64_t v23;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __94__ATXUserActivityStream_getActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_limit___block_invoke;
  v21 = &unk_1E4D59958;
  v22 = v13;
  v23 = a6;
  v14 = v13;
  -[ATXUserActivityStream _enumerateActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:reversed:block:](self, "_enumerateActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:reversed:block:", v12, v11, v10, 1, &v18);

  objc_msgSend(v14, "reverseObjectEnumerator", v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

BOOL __94__ATXUserActivityStream_getActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 40);
}

- (unint64_t)numberOfActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__ATXUserActivityStream_numberOfActivityEventsBetweenStartDate_endDate___block_invoke;
  v10[3] = &unk_1E4D59980;
  v10[4] = &v11;
  -[ATXUserActivityStream _enumerateActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:reversed:block:](self, "_enumerateActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:reversed:block:", v6, v7, 0, 0, v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __72__ATXUserActivityStream_numberOfActivityEventsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (void)_enumerateActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 reversed:(BOOL)a6 block:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  ATXUserActivityStream *v31;
  id v32;
  id v33;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1A85A4F90]();
  BiomeLibrary();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "App");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "Activity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v8)
    v21 = v13;
  else
    v21 = v12;
  if (v8)
    v22 = v12;
  else
    v22 = v13;
  objc_msgSend(v19, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v21, v22, 0, 0, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXIntentGlobals sharedInstance](ATXIntentGlobals, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_6;
  v29[3] = &unk_1E4D5C700;
  v30 = v24;
  v31 = self;
  v25 = v14;
  v32 = v25;
  v26 = v15;
  v33 = v26;
  v27 = v24;
  v28 = (id)objc_msgSend(v23, "sinkWithCompletion:shouldContinue:", &__block_literal_global_82, v29);

  objc_autoreleasePoolPop(v16);
}

void __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_cold_1(v2, v4);

  }
}

uint64_t __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if ((!objc_msgSend(*(id *)(a1 + 32), "onlyUseEligibleForPrediction")
     || (objc_msgSend(v3, "eventBody"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         v5 = objc_msgSend(v4, "isEligibleForPrediction"),
         v4,
         v5))
    && (objc_msgSend(*(id *)(a1 + 40), "_getActivityEventFromBMAppActivity:bundleIdFilter:", v3, *(_QWORD *)(a1 + 48)),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_getActivityEventFromBMAppActivity:(id)a3 bundleIdFilter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  ATXAction *v27;
  void *v28;
  void *v29;
  ATXAction *v30;
  void *v31;
  ATXIntentEvent *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "userActivityUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  if (v10)
  {
    objc_msgSend(v7, "bundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v11, "length"))
    {
      if (v6 && (objc_msgSend(v6, "isEqualToString:", v11) & 1) == 0)
      {
        __atxlog_handle_default();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.7();
      }
      else
      {
        +[ATXIntentGlobals sharedInstance](ATXIntentGlobals, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "onlyAcceptBecomeCurrentNSUAs");

        if (!v13
          || (objc_msgSend(v7, "beginningOfActivity") & 1) != 0
          || (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
        {
          objc_msgSend(v7, "userActivityRequiredString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_alloc(MEMORY[0x1E0CA5920]);
            objc_msgSend(v7, "userActivityRequiredString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "_initWithUserActivityStrings:secondaryString:optionalData:", v16, 0, 0);

            -[NSObject activityType](v17, "activityType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
            {
              __atxlog_handle_default();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.4();
              v32 = 0;
              goto LABEL_40;
            }
            v19 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v5, "timestamp");
            objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v39, v39);
            objc_msgSend(v7, "itemIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              __atxlog_handle_default();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.5();
              v32 = 0;
              goto LABEL_39;
            }
            objc_msgSend(v7, "itemRelatedContentURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v18;
            if (v21
              || (objc_msgSend(v7, "itemRelatedUniqueIdentifier"),
                  (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {

            }
            else
            {
              objc_msgSend(v7, "contentDescription");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v36)
              {
                v23 = 0;
                goto LABEL_15;
              }
            }
            v22 = objc_alloc(MEMORY[0x1E0CA6B50]);
            v23 = objc_msgSend(v22, "initWithContentType:", *MEMORY[0x1E0CEC498]);
            objc_msgSend(v7, "itemRelatedUniqueIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setRelatedUniqueIdentifier:](v23, "setRelatedUniqueIdentifier:", v24);

            objc_msgSend(v7, "itemRelatedContentURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setContentURL:](v23, "setContentURL:", v25);

            objc_msgSend(v7, "contentDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setContentDescription:](v23, "setContentDescription:", v26);

LABEL_15:
            v27 = [ATXAction alloc];
            objc_msgSend(v7, "userActivityRequiredString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "itemIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v37) = 0;
            v30 = -[ATXAction initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:](v27, "initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:", v28, v10, v11, v29, v23, 0, 0, v37, 0, 0);

            if (-[ATXAction hasActionTitle](v30, "hasActionTitle"))
            {
              +[ATXAction getNSUATypefromActivityType:](ATXAction, "getNSUATypefromActivityType:", v38);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:action:]([ATXIntentEvent alloc], "initWithBundleId:intentType:dateInterval:action:", v11, v31, v40, v30);

              v18 = v38;
            }
            else
            {
              __atxlog_handle_default();
              v34 = objc_claimAutoreleasedReturnValue();
              v18 = v38;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.6();

              v32 = 0;
            }

LABEL_39:
            v33 = v39;

LABEL_40:
            goto LABEL_41;
          }
          __atxlog_handle_default();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.3();
        }
        else
        {
          __atxlog_handle_default();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v11;
            _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_INFO, "Donation Processing (NSUA) - skipping non-beginning activity for bundleId: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.2(v7, v17);
    }
    v32 = 0;
LABEL_41:

    goto LABEL_42;
  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.1(v11);
  v32 = 0;
LABEL_42:

  return v32;
}

void __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v4, "ATXUserActivityStream: Can't read App.Activity stream with error: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)_getActivityEventFromBMAppActivity:(os_log_t)log bundleIdFilter:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "Donation Processing (NSUA) - Unable to parse UUID", v1, 2u);
}

- (void)_getActivityEventFromBMAppActivity:(void *)a1 bundleIdFilter:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userActivityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v4, "Donation Processing (NSUA) - No bundleId found for eventUUID: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Donation Processing (NSUA) - Nil requiredString for bundleId: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Donation Processing (NSUA) - Nil activityType for NSUserActivity: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Donation Processing (NSUA) - No item identifier for activity: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Donation Processing (NSUA) - Nil or empty title attached to event of activityType: %@ -- filtering out", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_DEBUG, "Donation Processing (NSUA) - Rejected: filtered out bundle id %@ that doesn't match %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
