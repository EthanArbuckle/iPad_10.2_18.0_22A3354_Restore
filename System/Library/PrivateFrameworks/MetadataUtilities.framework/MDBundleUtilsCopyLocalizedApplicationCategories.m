@implementation MDBundleUtilsCopyLocalizedApplicationCategories

double ___MDBundleUtilsCopyLocalizedApplicationCategories_block_invoke()
{
  uint64_t v0;
  __int128 v1;
  unint64_t v2;
  unint64_t spanid;
  const __CFDictionary *v4;
  CFIndex Count;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const __CFDictionary *v9;
  CFIndex v10;
  size_t v11;
  char *v12;
  const __CFArray *v13;
  __CFDictionary *v14;
  double result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v0 = si_tracing_current_span();
  v1 = *(_OWORD *)(v0 + 16);
  v17 = *(_OWORD *)v0;
  v18 = v1;
  v19 = *(_QWORD *)(v0 + 32);
  v2 = si_tracing_calc_traceid();
  spanid = si_tracing_calc_next_spanid();
  *(_QWORD *)v0 = v2;
  *(_QWORD *)(v0 + 8) = spanid;
  *(_QWORD *)(v0 + 16) = 0;
  *(_DWORD *)(v0 + 24) = -1;
  *(_BYTE *)(v0 + 28) = 102;
  *(_QWORD *)(v0 + 32) = "locAppCategories";
  si_tracing_log_span_begin();
  v4 = (const __CFDictionary *)copyAppCategoryMap();
  _MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap = (uint64_t)v4;
  if (v4)
  {
    Count = CFDictionaryGetCount(v4);
    v9 = (const __CFDictionary *)_MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap;
    if (_MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap)
    {
      v10 = Count;
      MEMORY[0x1E0C80A78](v8, Count, 8 * Count, v6, v7);
      v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v12, v11);
      CFDictionaryGetKeysAndValues(v9, (const void **)v12, 0);
      if (getCoreTypesBundleURL_onceToken != -1)
        dispatch_once(&getCoreTypesBundleURL_onceToken, &__block_literal_global_34_0);
      v13 = (const __CFArray *)gCoreTypesBundleLocalizations;
      if (gCoreTypesBundleLocalizations && CFArrayGetCount((CFArrayRef)gCoreTypesBundleLocalizations))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&coreTypesLocalizedPropertiesCopy_sCoreTypesLock);
        if (getCoreTypesBundleURL_onceToken != -1)
          dispatch_once(&getCoreTypesBundleURL_onceToken, &__block_literal_global_34_0);
        v14 = localizedPropertyCopy((const void **)v12, v10, (const __CFURL *)gCoreTypesLocTableURL, 0, v13, 0);
        os_unfair_lock_unlock((os_unfair_lock_t)&coreTypesLocalizedPropertiesCopy_sCoreTypesLock);
      }
      else
      {
        v14 = 0;
      }
      _MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategories = (uint64_t)v14;
    }
  }
  si_tracing_log_span_end(*(_QWORD *)v0);
  result = *(double *)&v17;
  v16 = v18;
  *(_OWORD *)v0 = v17;
  *(_OWORD *)(v0 + 16) = v16;
  *(_QWORD *)(v0 + 32) = v19;
  return result;
}

@end
