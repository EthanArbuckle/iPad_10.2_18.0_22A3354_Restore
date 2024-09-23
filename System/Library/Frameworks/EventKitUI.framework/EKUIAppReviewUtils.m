@implementation EKUIAppReviewUtils

void __40__EKUIAppReviewUtils__sharedStoreReview__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CFDC28], "bagSubProfile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDC28], "bagSubProfileVersion");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", v4, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC28]), "initWithBag:", v1);
  v3 = (void *)_sharedStoreReview_sharedStoreReview;
  _sharedStoreReview_sharedStoreReview = v2;

}

void __46__EKUIAppReviewUtils_applicationDidForeground__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_sharedStoreReview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationDidForeground");

}

+ (id)_sharedStoreReview
{
  if (_sharedStoreReview_onceToken != -1)
    dispatch_once(&_sharedStoreReview_onceToken, &__block_literal_global_25);
  return (id)_sharedStoreReview_sharedStoreReview;
}

void __28__EKUIAppReviewUtils__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("EKUIAppReviewUtils", 0);
  v1 = (void *)_queue_queue;
  _queue_queue = (uint64_t)v0;

}

+ (void)applicationDidForeground
{
  NSObject *v3;
  _QWORD block[5];

  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    objc_msgSend(a1, "_queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EKUIAppReviewUtils_applicationDidForeground__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v3, block);

  }
}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_7);
  return (id)_queue_queue;
}

+ (void)displayReviewPromptIfNeededInScene:(id)a3 calendarModel:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = _os_feature_enabled_impl();
  if (v7 && (v8 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(a1, "_queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke;
    block[3] = &unk_1E601A7F0;
    v13 = a1;
    v11 = v7;
    v12 = v6;
    dispatch_async(v9, block);

  }
LABEL_7:

}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (NavdRecentLocationsEntitlment_block_invoke_previousAttempt
    && (objc_msgSend(v2, "timeIntervalSinceReferenceDate"),
        v5 = v4,
        objc_msgSend((id)NavdRecentLocationsEntitlment_block_invoke_previousAttempt, "timeIntervalSinceReferenceDate"),
        v5 - v6 < 600.0))
  {
    logHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_INFO, "Skipping app store review prompt because it is too soon", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&NavdRecentLocationsEntitlment_block_invoke_previousAttempt, v3);
    logHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_INFO, "Asking whether we should attempt an app store review prompt", buf, 2u);
    }

    objc_msgSend(a1[6], "_sharedStoreReview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldAttemptReview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_13;
    v11[3] = &unk_1E601A7C8;
    v14 = a1[6];
    v12 = a1[4];
    v13 = a1[5];
    objc_msgSend(v10, "addFinishBlock:", v11);

    v7 = v12;
  }

}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_13(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[6], "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2;
  block[3] = &unk_1E6018968;
  v11 = v6;
  v12 = v5;
  v15 = a1[6];
  v13 = a1[4];
  v14 = a1[5];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v2;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[16];

  v1 = (uint64_t *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 64), "_shouldDisplayReviewPromptWithCalendarModel:", *(_QWORD *)(a1 + 48)) & 1) != 0)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_14;
        v7[3] = &unk_1E6018FC8;
        v4 = *(id *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 64);
        v8 = v4;
        v9 = v5;
        dispatch_async(MEMORY[0x1E0C80D38], v7);
        v2 = v8;
        goto LABEL_4;
      }
      logHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        goto LABEL_4;
      *(_WORD *)buf = 0;
      v6 = "Not attempting to ask for app store review because our filtering says this is not a good candidate";
    }
    else
    {
      logHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        goto LABEL_4;
      *(_WORD *)buf = 0;
      v6 = "Not attempting to ask for app store review because -[AMSSharedStoreReview shouldAttemptReview] said NO";
    }
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_INFO, v6, buf, 2u);
    goto LABEL_4;
  }
  logHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2_cold_1(v1, v2);
LABEL_4:

}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  logHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to prompt for an app store review", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CD8078], "requestReviewInScene:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_sharedStoreReview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didAttemptPromptReview");

}

+ (BOOL)_shouldDisplayReviewPromptWithCalendarModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "_upcomingEventCountMeetsThresholdInCalendarModel:", v4) & 1) == 0)
  {
    logHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.5();
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v7)
  {
LABEL_10:

LABEL_17:
    logHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.1();
    goto LABEL_19;
  }
  v8 = v7;
  v9 = *(_QWORD *)v30;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
    v12 = (void *)MEMORY[0x1E0D0C240];
    objc_msgSend(v11, "externalID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v12, "isiCloudAccount:", v13);

    if ((v12 & 1) != 0)
      break;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v14 = v11;

  if (!v14)
    goto LABEL_17;
  -[NSObject allCalendars](v14, "allCalendars");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v15;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v16);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "sharingStatus", (_QWORD)v25) == 1)
            ++v21;
          if (v21 >= 2)
          {
            logHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.4();

            goto LABEL_37;
          }
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v20)
          continue;
        break;
      }
    }

    logHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.3();
    v17 = 0;
  }
  else
  {
    logHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.2();
LABEL_37:
    v17 = 1;
  }

LABEL_20:
  return v17;
}

+ (BOOL)_upcomingEventCountMeetsThresholdInCalendarModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;

  v3 = a3;
  CUIKTodayDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CalCopyCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 7, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "sectionForCachedOccurrencesOnDate:", v4);
  v9 = objc_msgSend(v3, "sectionForCachedOccurrencesOnDate:", v7);
  objc_msgSend(v3, "dateForCachedOccurrencesInSection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateForCachedOccurrencesInSection:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 + objc_msgSend(v10, "CalIsBeforeDate:", v4);
  v13 = v9 - objc_msgSend(v11, "CalIsAfterDate:", v7);
  if (v12 <= v13)
  {
    v15 = 0;
    do
    {
      v15 += objc_msgSend(v3, "numberOfCachedOccurrencesInSection:", v12);
      v14 = v15 > 0xD;
      ++v12;
    }
    while (v15 <= 0xD && v12 <= v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AF84D000, a2, OS_LOG_TYPE_ERROR, "Error returned from -[AMSSharedStoreReview shouldAttemptReview]: %@", (uint8_t *)&v3, 0xCu);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF84D000, v0, v1, "This user is not a good candidate for an app store review prompt because they do not have an iCloud Calendar account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF84D000, v0, v1, "This user is a good candidate for an app store review prompt because they have enough iCloud calendars", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF84D000, v0, v1, "This user is a not a good candidate for an app store review prompt. They had enough events, but did not meet other criteria", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF84D000, v0, v1, "This user is a good candidate for an app store review prompt because they have enough shared iCloud calendars", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF84D000, v0, v1, "This user is not a good candidate for an app store review prompt because they do not have enough events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
