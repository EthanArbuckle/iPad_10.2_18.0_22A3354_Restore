@implementation SFCalendarEventDetector

void __76___SFCalendarEventDetector_containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_containsCalendarEventForPageWithSchemaOrgMarkup:", *(unsigned __int8 *)(a1 + 40));

}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D19970], "serviceForEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2;
  v9[3] = &unk_1E4AC3950;
  v10 = v3;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v2;
  v8 = v2;
  objc_msgSend(v8, "isEventCandidateForURL:andTitle:containsSchemaOrg:withCompletion:", v10, v4, v5, v9);

}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_1;
    v7[3] = &unk_1E4AC06B8;
    v3 = *(void **)(a1 + 56);
    v7[4] = *(_QWORD *)(a1 + 48);
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "Page was not a candidate for event extraction", buf, 2u);
    }
    v5 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2_cold_1(a1, v5, v6);
  }
}

uint64_t __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_service:didFindEventCandidateForURL:pageTitle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    if (v7)
    {
      v9 = a1[4];
      v8 = (void *)a1[5];
      v10 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4;
      v23[3] = &unk_1E4AC39A0;
      v23[4] = a1[7];
      objc_msgSend(v8, "suggestionsFromURL:title:HTMLPayload:withCompletion:", v9, v10, v11, v23);

    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_3(v20, v6);
      v21 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = a1[4];
        *(_DWORD *)buf = 138739971;
        v25 = v22;
        _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_INFO, "Page URL: %{sensitive}@", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_2(v12, v6);
    v13 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_1((uint64_t)a1, v13, v14, v15, v16, v17, v18, v19);
  }

}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4_cold_1(v7, v6);
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_foundCalendarEvents:", v5);
  }

}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138478083;
  v6 = v3;
  v7 = 2113;
  v8 = v4;
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, a2, a3, "Page URL: %{private}@ and title: '%{private}@'", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3_2();
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, a2, a3, "Page URL: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_3_2();
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to get the source code for the page with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_3(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to get bytes of source code for the page with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to detect calendar events: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

@end
