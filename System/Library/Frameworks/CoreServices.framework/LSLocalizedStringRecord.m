@implementation LSLocalizedStringRecord

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  LaunchServices::LocalizedString::localizeUnsafely(a5, *a2, *(void **)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke(uint64_t a1, _LSDatabase **a2, int a3, int a4, LaunchServices::LocalizedString *this)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  LaunchServices::LocalizedString::getDefaultValueUnsafely(this, *a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *Name;
  const __CFArray *v9;
  CFArrayRef v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[16];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resolvedPropertyValueForGetter:", sel__allUnsanitizedStringValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_17;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_resolvedPropertyValueForGetter:", sel__missingBundleLocs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      Name = sel_getName(*(SEL *)(a1 + 56));
      __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2((uint64_t)Name, (uint64_t)v34, v7);
    }

  }
  if (v4)
  {
    v9 = (const __CFArray *)*(id *)(a1 + 40);
    if (v9
      || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferredLocalizations"),
          (v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_10:
      v10 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v4, v9);
LABEL_11:
      if (-[__CFArray count](v10, "count"))
      {
        -[__CFArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      goto LABEL_14;
    }
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      v9 = 0;
    }
    else
    {
      if (_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken != -1)
        dispatch_once(&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken, &__block_literal_global_49);
      os_unfair_lock_lock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (!_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache
        || mach_absolute_time()
         - _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime > _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::maxCacheTimeAbsolute)
      {
        v31 = 0;
        v32[0] = &v31;
        v32[1] = 0x3032000000;
        v32[2] = __Block_byref_object_copy__32;
        v32[3] = __Block_byref_object_dispose__32;
        v33 = 0;
        v25 = 0;
        v26 = &v25;
        v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__32;
        v29 = __Block_byref_object_dispose__32;
        v18 = 11;
        v30 = 0;
        v19 = MEMORY[0x1E0C809B0];
        while (1)
        {
          +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v19;
          v24[1] = 3221225472;
          v24[2] = ___ZL78_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcessesv_block_invoke_43;
          v24[3] = &unk_1E10444D0;
          v24[4] = &v25;
          v24[5] = &v31;
          objc_msgSend(v20, "getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:", v24);
          if (v26[5] || !_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v32[0] + 40)))
            break;

          if (--v18 <= 1)
            goto LABEL_30;
        }

LABEL_30:
        v21 = (void *)v26[5];
        if (!v21)
        {
          _LSDefaultLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1((uint64_t)v32, v22, v23);

          v21 = (void *)v26[5];
        }
        objc_storeStrong((id *)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache, v21);
        _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime = mach_absolute_time();
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
      }
      v9 = (const __CFArray *)(id)_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache;
      os_unfair_lock_unlock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (v9)
        goto LABEL_10;
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_14:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LSDefaultLocalizedValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
LABEL_17:

}

void __43___LSLocalizedStringRecord_allStringValues__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "sanitizeString:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_resolvedPropertyValueForGetter:", sel__allUnsanitizedStringValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LSDefaultLocalizedValue"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "could not fetch preferred locales for LSLocalizedStringRecord: %@", (uint8_t *)&v4);
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "Could not find missing localizations computing string value in %s... resulting locale may be unexpected!", (uint8_t *)a2);
}

@end
