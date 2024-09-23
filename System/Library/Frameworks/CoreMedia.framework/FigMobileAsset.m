@implementation FigMobileAsset

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke(uint64_t a1)
{
  const void *Value;
  const __CFArray *v3;
  CFIndex v4;
  CFIndex Count;
  __CFArray *v6;
  _QWORD *ValueAtIndex;
  const __CFArray *v8;
  CFRange v9;
  char *v10;
  CFTypeRef v11;
  CFTypeRef v12;
  CFTypeRef v13;
  int v14;
  CFPropertyListRef v15;
  const void *v16;
  CFTypeID v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  _BYTE *v29;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  os_log_type_t type;
  int v42;
  _QWORD v43[4];
  __int128 v44;
  __int128 v45;
  int v46;
  _QWORD handler[4];
  __int128 v48;
  __int128 v49;
  int v50;
  int v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  _BYTE v61[128];
  int name[25];
  int buffer;
  const char *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    v3 = (const __CFArray *)*((_QWORD *)Value + 3);
    if (v3)
    {
      v4 = 0;
      while (1)
      {
        Count = CFArrayGetCount(v3);
        v6 = (__CFArray *)*((_QWORD *)Value + 3);
        if (Count <= v4)
          break;
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)Value + 3), v4);
        if (*ValueAtIndex == *(_QWORD *)(a1 + 64) && ValueAtIndex[1] == *(_QWORD *)(a1 + 72))
          goto LABEL_44;
        ++v4;
        v3 = (const __CFArray *)*((_QWORD *)Value + 3);
        if (!v3)
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      v6 = 0;
    }
    v8 = *(const __CFArray **)(a1 + 56);
    if (v8)
      v9.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    else
      v9.length = 0;
    v9.location = 0;
    CFArrayAppendArray(v6, v8, v9);
    if (dword_1EE141E68)
    {
      name[0] = 0;
      LOBYTE(v51) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, name, &v51);
      v31 = name[0];
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)v51))
        v33 = v31;
      else
        v33 = v31 & 0xFFFFFFFE;
      if (v33)
      {
        v34 = *(_QWORD *)(a1 + 32);
        v35 = *(_QWORD *)(a1 + 64);
        buffer = 136315650;
        v64 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
        v65 = 2112;
        v66 = v34;
        v67 = 2048;
        v68 = v35;
        v36 = (_BYTE *)_os_log_send_and_compose_impl();
        LOBYTE(v31) = name[0];
      }
      else
      {
        v36 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v36, v36 != v61, v31, 0, v32);
    }
  }
  else
  {
    v10 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10600408109E9C4uLL);
    *(_DWORD *)v10 = *(_DWORD *)(a1 + 80);
    v11 = *(CFTypeRef *)(a1 + 40);
    if (v11)
      v11 = CFRetain(v11);
    *((_QWORD *)v10 + 1) = v11;
    v12 = *(CFTypeRef *)(a1 + 48);
    if (v12)
      v12 = CFRetain(v12);
    *((_QWORD *)v10 + 2) = v12;
    v13 = *(CFTypeRef *)(a1 + 56);
    if (v13)
      v13 = CFRetain(v13);
    v14 = *(_DWORD *)(a1 + 84);
    *((_QWORD *)v10 + 4) = -1;
    *((_QWORD *)v10 + 5) = 0x10000000000000;
    *((_QWORD *)v10 + 3) = v13;
    *((double *)v10 + 6) = (double)(3600 * v14);
    v15 = CFPreferencesCopyValue(CFSTR("mobileAssetUpdateTimes"), CFSTR("com.apple.celestial"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v16 = v15;
    if (v15)
    {
      v17 = CFGetTypeID(v15);
      if (v17 == CFDictionaryGetTypeID()
        && !FigCFDictionaryGetDoubleIfPresent((uint64_t)v16, *(const void **)(a1 + 32), v10 + 40))
      {
        *((_QWORD *)v10 + 5) = 0x10000000000000;
      }
    }
    CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)&buffer, 100, 0x8000100u);
    __strlcat_chk();
    if (figMobileAsset_GetNotificationQueue_onceToken != -1)
      dispatch_once(&figMobileAsset_GetNotificationQueue_onceToken, &__block_literal_global_34);
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __FigMobileAsset_RegisterForAssetUpdates_block_invoke_2;
    handler[3] = &__block_descriptor_68_e8_v12__0i8l;
    v50 = *(_DWORD *)(a1 + 80);
    v19 = *(_OWORD *)(a1 + 48);
    v48 = *(_OWORD *)(a1 + 32);
    v49 = v19;
    notify_register_dispatch((const char *)&buffer, (int *)v10 + 8, (dispatch_queue_t)figMobileAsset_GetNotificationQueue_mobileAssetNotificationQueue, handler);
    CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)name, 100, 0x8000100u);
    __strlcat_chk();
    if (figMobileAsset_GetNotificationQueue_onceToken != -1)
      dispatch_once(&figMobileAsset_GetNotificationQueue_onceToken, &__block_literal_global_34);
    v43[0] = v18;
    v43[1] = 3221225472;
    v43[2] = __FigMobileAsset_RegisterForAssetUpdates_block_invoke_6;
    v43[3] = &__block_descriptor_68_e8_v12__0i8l;
    v46 = *(_DWORD *)(a1 + 80);
    v20 = *(_OWORD *)(a1 + 48);
    v44 = *(_OWORD *)(a1 + 32);
    v45 = v20;
    notify_register_dispatch((const char *)name, (int *)v10 + 9, (dispatch_queue_t)figMobileAsset_GetNotificationQueue_mobileAssetNotificationQueue, v43);
    CFDictionarySetValue((CFMutableDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32), v10);
    if (dword_1EE141E68)
    {
      v42 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, &v42, &type);
      v22 = v42;
      if (os_log_type_enabled(v21, type))
        v24 = v22;
      else
        v24 = v22 & 0xFFFFFFFE;
      if (v24)
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 64);
        v28 = *(_DWORD *)(a1 + 80);
        v27 = *(_DWORD *)(a1 + 84);
        v51 = 136316163;
        v52 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
        v53 = 2113;
        v54 = v25;
        v55 = 2048;
        v56 = v26;
        v57 = 1024;
        v58 = v27;
        v59 = 1024;
        v60 = v28;
        v29 = (_BYTE *)_os_log_send_and_compose_impl();
        LOBYTE(v22) = v42;
      }
      else
      {
        v29 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v29, v29 != v61, v22, 0, v23);
    }
    if (v16)
      CFRelease(v16);
  }
LABEL_44:
  if (CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32)))
    figMobileAsset_DownloadCatalogAndRequery(*(CFTypeRef *)(a1 + 32), 0);
  v37 = *(const void **)(a1 + 32);
  if (v37)
    CFRelease(v37);
  v38 = *(const void **)(a1 + 40);
  if (v38)
    CFRelease(v38);
  v39 = *(const void **)(a1 + 48);
  if (v39)
    CFRelease(v39);
  v40 = *(const void **)(a1 + 56);
  if (v40)
    CFRelease(v40);
}

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  os_log_type_t type;
  int v9[2];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141E68)
  {
    v9[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, v9, &type);
    v3 = v9[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9[1] = 136315395;
      v10 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke_2";
      v11 = 2113;
      v12 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v3) = v9[0];
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v7, v7 != &v13, v3, 0, v4);
  }
  figMobileAsset_QueryMostRecentAsset(*(const void **)(a1 + 32), 0, *(_DWORD *)(a1 + 64), 1, *(const __CFDictionary **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
}

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke_6(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  os_log_type_t type;
  int v9[2];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141E68)
  {
    v9[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, v9, &type);
    v3 = v9[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9[1] = 136315395;
      v10 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
      v11 = 2113;
      v12 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v3) = v9[0];
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v7, v7 != &v13, v3, 0, v4);
  }
  figMobileAsset_QueryMostRecentAsset(*(const void **)(a1 + 32), 0, *(_DWORD *)(a1 + 64), 1, *(const __CFDictionary **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
}

void __FigMobileAsset_UnregisterFromAssetUpdates_block_invoke(uint64_t a1)
{
  _DWORD *Value;
  int v3;
  int v4;
  const void *v5;
  const void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char *v12;
  const void *v13;
  os_log_type_t type;
  int v15[2];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    CFDictionaryRemoveValue((CFMutableDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    v3 = Value[8];
    if (v3 != -1)
    {
      notify_cancel(v3);
      Value[8] = -1;
    }
    v4 = Value[9];
    if (v4 != -1)
    {
      notify_cancel(v4);
      Value[9] = -1;
    }
    v5 = (const void *)*((_QWORD *)Value + 1);
    if (v5)
    {
      CFRelease(v5);
      *((_QWORD *)Value + 1) = 0;
    }
    v6 = (const void *)*((_QWORD *)Value + 2);
    if (v6)
      CFRelease(v6);
    free(Value);
    if (dword_1EE141E68)
    {
      v15[0] = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, v15, &type);
      v8 = v15[0];
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v10 = v8;
      else
        v10 = v8 & 0xFFFFFFFE;
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        v15[1] = 136315395;
        v16 = "FigMobileAsset_UnregisterFromAssetUpdates_block_invoke";
        v17 = 2113;
        v18 = v11;
        v12 = (char *)_os_log_send_and_compose_impl();
        LOBYTE(v8) = v15[0];
      }
      else
      {
        v12 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v12, v12 != &v19, v8, 0, v9);
    }
  }
  v13 = *(const void **)(a1 + 32);
  if (v13)
    CFRelease(v13);
}

void __FigMobileAsset_UnregisterCallbackFromAssetUpdates_block_invoke(uint64_t a1)
{
  const void *Value;
  const __CFArray *v3;
  CFIndex v4;
  _QWORD *ValueAtIndex;
  const void *v6;

  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    v3 = (const __CFArray *)*((_QWORD *)Value + 3);
    if (v3)
    {
      v4 = 0;
      while (CFArrayGetCount(v3) > v4)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)Value + 3), v4);
        if (*ValueAtIndex == *(_QWORD *)(a1 + 40) && ValueAtIndex[1] == *(_QWORD *)(a1 + 48))
        {
          CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)Value + 3), v4);
          break;
        }
        ++v4;
        v3 = (const __CFArray *)*((_QWORD *)Value + 3);
        if (!v3)
          break;
      }
    }
  }
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

@end
