void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

_BYTE *OUTLINED_FUNCTION_1_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_2147C41A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147C432C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147C5600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  void *v26;
  uint64_t v27;

  objc_sync_exit(v26);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2147C5844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147C59A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147C6BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id BMItemNormalizedValueFromValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "stringValue");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v1, "UUIDString");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v4;
  }
LABEL_9:

  return v3;
}

id BMItemValueFromNormalizedValue(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a1;
  if (objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "stringByRemovingPercentEncoding");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

void sub_2147C85C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t BMHourSlotForHourOfDay(uint64_t a1)
{
  return a1 / 4;
}

id BMTemporalItemsForDate(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  BMItem *v12;
  void *v13;
  void *v14;
  BMItem *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BMItem *v19;
  void *v20;
  void *v21;
  BMItem *v22;
  void *v23;
  int v24;
  BMItem *v25;
  void *v26;
  void *v27;
  BMItem *v28;
  void *v29;
  int v30;
  uint64_t v31;
  BMItem *v32;
  void *v33;
  void *v34;
  BMItem *v35;
  void *v36;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v6, "components:fromDate:", 544, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType hourOfDay](BMItemType, "hourOfDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "containsObject:", v10);

  if (v11)
  {
    v12 = [BMItem alloc];
    +[BMItemType hourOfDay](BMItemType, "hourOfDay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "hour"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BMItem initWithType:value:](v12, "initWithType:value:", v13, v14);

    objc_msgSend(v8, "addObject:", v15);
  }
  +[BMItemType hourOfDaySlot](BMItemType, "hourOfDaySlot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "containsObject:", v16);

  if (v17)
  {
    v18 = objc_msgSend(v9, "hour") / 4;
    v19 = [BMItem alloc];
    +[BMItemType hourOfDaySlot](BMItemType, "hourOfDaySlot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[BMItem initWithType:value:](v19, "initWithType:value:", v20, v21);

    objc_msgSend(v8, "addObject:", v22);
  }
  +[BMItemType dayOfWeek](BMItemType, "dayOfWeek");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v7, "containsObject:", v23);

  if (v24)
  {
    v25 = [BMItem alloc];
    +[BMItemType dayOfWeek](BMItemType, "dayOfWeek");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "weekday"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[BMItem initWithType:value:](v25, "initWithType:value:", v26, v27);

    objc_msgSend(v8, "addObject:", v28);
  }
  +[BMItemType isWeekend](BMItemType, "isWeekend");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v7, "containsObject:", v29);

  if (v30)
  {
    v31 = objc_msgSend(v6, "isDateInWeekend:", v5);
    v32 = [BMItem alloc];
    +[BMItemType isWeekend](BMItemType, "isWeekend");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[BMItem initWithType:value:](v32, "initWithType:value:", v33, v34);

    objc_msgSend(v8, "addObject:", v35);
  }
  v36 = (void *)objc_msgSend(v8, "copy");

  return v36;
}

BOOL BMIsNotAppExtension(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B020], "extensionHostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v1, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B020], "extensionContainingBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 == 0;

  }
  return v5;
}

uint64_t BMIsShareExtension(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v1 = a1;
  if (BMIsShareExtension_onceToken != -1)
    dispatch_once(&BMIsShareExtension_onceToken, &__block_literal_global_27);
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)BMIsShareExtension_cache, "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (BMIsNotAppExtension(v1))
      {
        v3 = (void *)MEMORY[0x24BDBD1C0];
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v3 = (void *)MEMORY[0x24BDBD1C0];
        if (v5)
        {
          objc_msgSend(v5, "protocol");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.share-services"));

          if (v8)
            v3 = (void *)MEMORY[0x24BDBD1C8];
        }

      }
      objc_msgSend((id)BMIsShareExtension_cache, "setObject:forKey:", v3, v2);
    }
    v4 = objc_msgSend(v3, "BOOLValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id BMCreateShortcutFilter()
{
  void *v0;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D21EAD0;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)getREShortcutFilterClass_softClass;
  v6 = getREShortcutFilterClass_softClass;
  if (!getREShortcutFilterClass_softClass)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __getREShortcutFilterClass_block_invoke;
    v9 = &unk_24D21EAF0;
    v10 = &v3;
    __getREShortcutFilterClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  return objc_alloc_init(v1);
}

void sub_2147CC6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getREShortcutFilterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("REShortcutFilter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getREShortcutFilterClass_block_invoke_cold_1();
    free(v3);
  }
  getREShortcutFilterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id BMEventInterval(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "startDate", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "compare:", v2) == -1)
        {
          v11 = v10;

          v2 = v11;
        }
        objc_msgSend(v9, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "compare:", v3) == 1)
        {
          v13 = v12;

          v3 = v13;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "earlierDate:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "laterDate:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v14, v15);

  return v16;
}

id BMLog()
{
  if (BMLog_onceToken != -1)
    dispatch_once(&BMLog_onceToken, &__block_literal_global_9);
  return (id)BMLog_log;
}

void sub_2147CD568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  uint64_t v15;

  _Block_object_dispose((const void *)(v15 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getTRIClientClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!TrialLibraryCore_frameworkLibrary)
    TrialLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("TRIClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getTRIClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2147CEAC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147CEB48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147CEBC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2147D0D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2147D121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id BMInteractionPredicate(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1758];
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", -2419200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(startDate >= %@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("(mechanism == %@)"), v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD14C0];
  v32[0] = v10;
  v32[1] = v13;
  v32[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v7, "suggestionModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "shareSheetMechanisms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("(mechanism IN %@)"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(targetBundleId IN %@)"), v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD14C0];
  v31[0] = v10;
  v31[1] = v20;
  v31[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDD14C0];
  v30[0] = v16;
  v30[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

Class __getCKContextClientClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ContextKitLibraryCore_frameworkLibrary)
    ContextKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("CKContextClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCKContextClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id BMStorageURLForDomain(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CoreBehavior/%@.sqlite"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library"), "stringByAppendingPathComponent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2147D48BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2147D4AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2147D5008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2147D5328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t __getREShortcutFilterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BMMiningTaskConfig updateFactorLevels].cold.1(v0);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x24BDD9950]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _PSShareSheetExtensionBundleIDToAppBundleIDMapping()
{
  return MEMORY[0x24BE719C8]();
}

uint64_t _PSShareSheetSuggestionBundleIDs()
{
  return MEMORY[0x24BE719D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

