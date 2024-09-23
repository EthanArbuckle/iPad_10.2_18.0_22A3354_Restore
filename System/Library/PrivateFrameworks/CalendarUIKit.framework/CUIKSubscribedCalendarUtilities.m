@implementation CUIKSubscribedCalendarUtilities

+ (id)checkSubscriptionURL:(id)a3 missingSchemeBlock:(id)a4 unsupportedSchemeBlock:(id)a5
{
  void (**v8)(id, void *);
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  id v24;

  v8 = (void (**)(id, void *))a4;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "scheme");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v11, "scheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "length"))
        goto LABEL_7;
      objc_msgSend(v11, "host");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_7;
      v16 = (void *)v15;
      objc_msgSend(v11, "host");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        objc_msgSend(v11, "CDVRawPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "CDVStringByAddingPercentEscapesForHREF");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "CDVURLWithPath:", v14);
        v19 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v19;
LABEL_7:

      }
    }
  }
  objc_msgSend(v11, "scheme");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20
    && (v21 = (void *)v20,
        objc_msgSend(v11, "scheme"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "isEqualToString:", &stru_1E6EBAE30),
        v22,
        v21,
        !v23))
  {
    if ((objc_msgSend(a1, "canHandleURL:", v11) & 1) != 0)
    {
      v24 = v11;
      goto LABEL_13;
    }
    if (v9)
      v9[2](v9, v11);
  }
  else if (v8)
  {
    v8[2](v8, v11);
  }
  v24 = 0;
LABEL_13:

  return v24;
}

+ (BOOL)canHandleURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("webcal"), 1))
  {
    v4 = 1;
    if (objc_msgSend(v3, "compare:options:", CFSTR("http"), 1))
      v4 = objc_msgSend(v3, "compare:options:", CFSTR("https"), 1) == 0;
  }

  return v4;
}

+ (id)subscriptionURLForCalendar:(id)a3 inStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a4;
  objc_msgSend(a3, "subcalAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D1C240], "daAccountSubclassWithBackingAccountInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2079E0) & 1) != 0)
    {
      objc_msgSend(v8, "subscriptionURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CUIKSubscribedCalendarUtilities subscriptionURLForCalendar:inStore:].cold.1((uint64_t)v8, v7, v10);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)subscriptionURL:(id)a3 usingHTTPS:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = CFSTR("https");
  else
    v8 = CFSTR("http");
  if (objc_msgSend(v6, "compare:options:", v8, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScheme:", v8);
    objc_msgSend(v9, "URL");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (void)unsubscribeFromCalendar:(id)a3
{
  objc_msgSend(a1, "unsubscribeFromCalendar:reportAsJunk:", a3, 0);
}

+ (void)unsubscribeFromCalendar:(id)a3 reportAsJunk:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "subcalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subcalAccountID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v9, "accountWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeInteractionsForCalendar:", v6);

  objc_msgSend(v6, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sourceType");

  if (v13 == 2)
  {
    objc_msgSend(v10, "parentAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "calIsiCloudCalDAVAccount");

    if (!v4)
      goto LABEL_15;
    goto LABEL_12;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_DEFAULT, "Deleting account %{public}@ to delete subscribed calendar %@", buf, 0x16u);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke;
    v22[3] = &unk_1E6EB5B08;
    v23 = v8;
    v24 = v6;
    objc_msgSend(v9, "removeAccount:withCompletionHandler:", v10, v22);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CUIKSubscribedCalendarUtilities unsubscribeFromCalendar:reportAsJunk:].cold.1((uint64_t)v8, (uint64_t)v6, v17);

  }
  v15 = 0;
  if (v4)
  {
LABEL_12:
    if (v15)
    {
      objc_msgSend(v6, "setIsSubscribedCalendarJunk:", 1);
      objc_msgSend(v6, "eventStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "saveCalendar:commit:error:", v6, 1, 0);

    }
    else
    {
      objc_msgSend(a1, "reportLocalSubscribedCalendarAsJunkWithoutRemoval:", v7);
    }
  }
LABEL_15:
  objc_msgSend(v6, "eventStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v19, "removeCalendar:commit:error:", v6, 1, &v21);
  v20 = v21;

}

void __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1B8A6A000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed account %{public}@ for delete of subscribed calendar %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

}

+ (void)reportLocalSubscribedCalendarAsJunkWithoutRemoval:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D1C3F8];
    v4 = a3;
    objc_msgSend(v3, "sharedConnection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportSubscriptionCalendarAsJunk:", v4);

  }
}

+ (void)fetchAvailableHolidayCalendarsWithCompletion:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD aBlock[5];
  _QWORD v17[5];
  id v18;

  v5 = a3;
  v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__10;
  v17[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18 = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke;
  aBlock[3] = &unk_1E6EB73E0;
  aBlock[4] = v17;
  v9 = _Block_copy(aBlock);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2;
  v13[3] = &unk_1E6EB7428;
  v15 = v17;
  v10 = v5;
  v14 = v10;
  v11 = _Block_copy(v13);
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAvailableHolidayCalendarsWithResultsBlock:completionBlock:queue:", v9, v11, v6);

  _Block_object_dispose(v17, 8);
}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CUIKSubscribedHolidayCalendar *v20;
  uint64_t v21;
  id v22;
  void *v23;
  CUIKSubscribedHolidayCalendar *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v26 = a1;
  v37 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v31;
    v28 = *MEMORY[0x1E0C997B0];
    v29 = *MEMORY[0x1E0C997E8];
    do
    {
      v6 = 0;
      v27 = v4;
      do
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        objc_msgSend(v7, "language", v26);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(v7, "region");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v7, "URLString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              goto LABEL_15;
            v34[0] = v29;
            objc_msgSend(v7, "language");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v28;
            v35[0] = v13;
            objc_msgSend(v7, "region");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v7, "URLString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "URLWithString:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                v20 = [CUIKSubscribedHolidayCalendar alloc];
                objc_msgSend(v7, "language");
                v21 = v5;
                v22 = v2;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[CUIKSubscribedHolidayCalendar initWithLocale:languageCode:URL:](v20, "initWithLocale:languageCode:URL:", v16, v23, v19);

                v2 = v22;
                v5 = v21;
                v4 = v27;
                objc_msgSend(v7, "region");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[CUIKSubscribedHolidayCalendar setCountryCode:](v24, "setCountryCode:", v25);

                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v26 + 32) + 8) + 40), "addObject:", v24);
              }

            }
          }

        }
LABEL_15:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v4);
  }

}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (v3)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_20);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

+ (void)checkURLForSpam:(id)a3 completionHandler:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0D1C3F8];
    v10 = a5;
    objc_msgSend(v9, "sharedConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke;
    v21[3] = &unk_1E6EB7450;
    v13 = &v23;
    v23 = v8;
    v14 = &v22;
    v22 = v7;
    v15 = v8;
    -[NSObject checkSubscriptionCalendarIsJunk:queue:completionBlock:](v11, "checkSubscriptionCalendarIsJunk:queue:completionBlock:", v12, v10, v21);

  }
  else
  {
    v11 = a5;
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CUIKSubscribedCalendarUtilities checkURLForSpam:completionHandler:queue:].cold.1(v16);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_93;
    v18[3] = &unk_1E6EB6BD0;
    v13 = &v20;
    v14 = (id *)&v19;
    v19 = 0;
    v20 = v8;
    v17 = v8;
    dispatch_async(v11, v18);
  }

}

void __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  if (v6)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a3 > 0);

}

uint64_t __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)subscriptionURLForCalendar:(NSObject *)a3 inStore:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_12(&dword_1B8A6A000, a3, v8, "Unexpected DAAccount implementation (%{public}@) for account %{public}@", (uint8_t *)&v9);

}

+ (void)unsubscribeFromCalendar:(NSObject *)a3 reportAsJunk:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_12(&dword_1B8A6A000, a3, (uint64_t)a3, "Couldn't find account with ID %{public}@ to remove while deleting subscribed calendar %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "Failed to remove account %{public}@ while deleting subscribed calendar %@: %@", (uint8_t *)&v5, 0x20u);
}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "Error when fetching available holiday calendars: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)checkURLForSpam:(os_log_t)log completionHandler:queue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "Asked to check a nil URL for spam", v1, 2u);
}

void __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "Received error when checking URL for junk: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
