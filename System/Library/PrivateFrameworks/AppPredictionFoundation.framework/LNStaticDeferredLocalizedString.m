@implementation LNStaticDeferredLocalizedString

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke(uint64_t a1, void *a2)
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
    __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "localizedStringForLocaleIdentifier:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_30(uint64_t a1, void *a2, void *a3)
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
      __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_30_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "localizedStringForLocaleIdentifier:", 0);
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

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0(&dword_1C99CA000, v0, v1, "%s: unable to establish XPC connection: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0(&dword_1C99CA000, v0, v1, "%s: unable to get a valid localized string: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

@end
