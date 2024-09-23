@implementation INIntent

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_titleWithLocalizer:fromBundleURL:", 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E82C0108;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);

}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_6_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_titleWithLocalizer:fromBundleURL:", 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E82C0108;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_8_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_title");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_subtitle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_9_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_subtitle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__INIntent_HelperService__atx_indexingHash__block_invoke_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_indexingHash");
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__INIntent_HelperService__atx_indexingHash__block_invoke_10_cold_1();

    a2 = objc_msgSend(*(id *)(a1 + 32), "_indexingHash");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_codableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "isEligibleForWidgets");

}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_12(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_12_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "isEligibleForWidgets");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_supportsBackgroundExecution");
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_14(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_14_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_supportsBackgroundExecution");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  __atxlog_handle_intents_helper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_cold_1();

  INIntentCreate();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_15_cold_1();

    INIntentCreate();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_intents_helper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_cold_1();

}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_17_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_titleWithoutLocalizing unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_titleWithoutLocalizing unable to get a valid unlocalized title: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_titleWithEfficientLocalization unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_titleWithEfficientLocalization unable to get a valid title: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_subtitleWithEfficientLocalization unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_subtitleWithEfficientLocalization error encountered while requesting subtitle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_indexingHash unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_indexingHash error encountered while requesting indexing hash: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_isEligibleForWidgets unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_isEligibleForWidgets error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_supportsBackgroundExecution unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "atx_supportsBackgroundExecution error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "createdIntentWithIntentType unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "createdIntentWithIntentType error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "createEventIntentWithCurrentDate unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "createEventIntentWithCurrentDate error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

@end
