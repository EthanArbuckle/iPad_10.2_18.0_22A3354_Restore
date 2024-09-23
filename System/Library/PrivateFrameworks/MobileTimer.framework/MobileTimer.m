__CFString *MTAlarmRepeatString(uint64_t a1)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  switch(a1)
  {
    case 127:
      return CFSTR("Every Day");
    case 96:
      return CFSTR("Weekends");
    case 31:
      return CFSTR("Weekdays");
  }
  v3 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __MTAlarmRepeatString_block_invoke;
  v5[3] = &unk_1E39CCCD8;
  v4 = v3;
  v6 = v4;
  MTAlarmRepeatScheduleEnumerateDays(a1, v5);

  return (__CFString *)v4;
}

void MTAlarmRepeatScheduleEnumerateDays(uint64_t a1, void *a2)
{
  unint64_t i;
  uint64_t v4;
  void (**v5)(id, unint64_t);

  v5 = a2;
  for (i = 0; i != 7; ++i)
  {
    if (i > 6)
      v4 = 0;
    else
      v4 = qword_19ACFEFA0[i];
    if ((v4 & a1) != 0)
      v5[2](v5, i);
  }

}

id MTLogForCategory(uint64_t a1)
{
  if (MTLogForCategory_onceToken != -1)
    dispatch_once(&MTLogForCategory_onceToken, &__block_literal_global_30);
  return (id)MTLogForCategory_logObjects[a1];
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t MTShouldHandleForEucalyptus()
{
  return 1;
}

id MTCurrentDateProvider()
{
  if (MTCurrentDateProvider_onceToken != -1)
    dispatch_once(&MTCurrentDateProvider_onceToken, &__block_literal_global_26);
  return (id)MEMORY[0x19AED0080](MTCurrentDateProvider_currentDateProvider);
}

void sub_19AC564C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC566B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC56828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MTIdiomIpad()
{
  const __CFString *v0;

  v0 = (const __CFString *)MGGetStringAnswer();
  return CFStringCompare(v0, CFSTR("iPad"), 0) == kCFCompareEqualTo;
}

void sub_19AC59544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC5A778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19AC5A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19AC5ABE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC5ADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC5AF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC5B2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC5B3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *DetailDateMaskToString(int a1)
{
  char v1;
  __CFString *v2;
  __CFString *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
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
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;

  if (a1)
  {
    v1 = a1;
    if (a1 == 1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_MONDAY");
LABEL_19:
      LocStrWithUILanguage(v2);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    v4 = a1 & 2;
    if (v4 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_TUESDAY");
      goto LABEL_19;
    }
    v5 = a1 & 4;
    if (v5 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_WEDNESDAY");
      goto LABEL_19;
    }
    v6 = a1 & 8;
    if (v6 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_THURSDAY");
      goto LABEL_19;
    }
    v7 = a1 & 0x10;
    if (v7 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_FRIDAY");
      goto LABEL_19;
    }
    v8 = a1 & 0x20;
    if (v8 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_SATURDAY");
      goto LABEL_19;
    }
    v9 = a1 & 0x40;
    if (v9 == a1)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_SUNDAY");
      goto LABEL_19;
    }
    if (a1 == 127)
    {
      v2 = CFSTR("ALARM_DETAIL_EVERY_DAY");
      goto LABEL_19;
    }
    v11 = (void *)objc_opt_new();
    daysOfWeekPlaceholder();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v1 & 1) != 0)
    {
      LocStrWithUILanguage(CFSTR("ALARM_SHORT_MONDAY"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 1, v19);

      if (!v4)
      {
LABEL_23:
        if (!v5)
          goto LABEL_24;
        goto LABEL_33;
      }
    }
    else if (!v4)
    {
      goto LABEL_23;
    }
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_TUESDAY"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 2, v21);

    if (!v5)
    {
LABEL_24:
      if (!v6)
        goto LABEL_25;
      goto LABEL_34;
    }
LABEL_33:
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_WEDNESDAY"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 3, v23);

    if (!v6)
    {
LABEL_25:
      if (!v7)
        goto LABEL_26;
      goto LABEL_35;
    }
LABEL_34:
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_THURSDAY"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 4, v25);

    if (!v7)
    {
LABEL_26:
      if (!v8)
        goto LABEL_27;
      goto LABEL_36;
    }
LABEL_35:
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_FRIDAY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 5, v27);

    if (!v8)
    {
LABEL_27:
      if (!v9)
        goto LABEL_29;
      goto LABEL_28;
    }
LABEL_36:
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_SATURDAY"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 6, v29);

    if (!v9)
    {
LABEL_29:
      daysOfWeekWeekdays();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "isEqualToArray:", v15);

      if (v16)
      {
        v17 = CFSTR("ALARM_DETAIL_WEEKDAYS");
      }
      else
      {
        daysOfWeekWeekends();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v12, "isEqualToArray:", v30);

        if (!v31)
        {
          if (objc_msgSend(v11, "count") != 1)
          {
            v33 = objc_alloc_init(MEMORY[0x1E0CB3738]);
            orderedWeekdaySymbols((uint64_t)v11, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");
            if (v35 == objc_msgSend(v11, "count"))
              v36 = v34;
            else
              v36 = v11;
            objc_msgSend(v33, "stringFromItems:", v36);
            v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_42;
          }
          objc_msgSend(v11, "firstObject");
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_41:
          v3 = (__CFString *)v32;
LABEL_42:

          return v3;
        }
        v17 = CFSTR("ALARM_DETAIL_WEEKENDS");
      }
      LocStrWithUILanguage(v17);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_28:
    LocStrWithUILanguage(CFSTR("ALARM_SHORT_SUNDAY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 0, v14);

    goto LABEL_29;
  }
  v3 = &stru_1E39CF258;
  return v3;
}

id LocStrWithUILanguage(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E39CF258, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id daysOfWeekWeekdays()
{
  void *v0;
  void *v1;
  uint64_t i;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)_daysOfWeekWeekdays;
  if (!_daysOfWeekWeekdays)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    for (i = 1; i != 8; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D0C2B0], "weekdayIsWeekend:", i) ^ 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v3);

    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v1);
    v5 = (void *)_daysOfWeekWeekdays;
    _daysOfWeekWeekdays = v4;

    v0 = (void *)_daysOfWeekWeekdays;
  }
  return v0;
}

id daysOfWeekPlaceholder()
{
  int v0;
  void *v1;
  void *v2;

  v0 = 7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObject:", v2);

    --v0;
  }
  while (v0);
  return v1;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_19AC5D2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MTSessionServerInterface()
{
  if (MTSessionServerInterface_onceToken != -1)
    dispatch_once(&MTSessionServerInterface_onceToken, &__block_literal_global_150);
  return (id)MTSessionServerInterface_sessionServerInterface;
}

id MTSessionClientInterface()
{
  if (MTSessionClientInterface_onceToken != -1)
    dispatch_once(&MTSessionClientInterface_onceToken, &__block_literal_global_153);
  return (id)MTSessionClientInterface_sessionClientInterface;
}

void sub_19AC5D640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MTStopwatchServerInterface()
{
  if (MTStopwatchServerInterface_onceToken != -1)
    dispatch_once(&MTStopwatchServerInterface_onceToken, &__block_literal_global_161);
  return (id)MTStopwatchServerInterface_stopwatchServerInterface;
}

id MTStopwatchClientInterface()
{
  if (MTStopwatchClientInterface_onceToken != -1)
    dispatch_once(&MTStopwatchClientInterface_onceToken, &__block_literal_global_191);
  return (id)MTStopwatchClientInterface_stopwatchClientInterface;
}

void sub_19AC5D8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC5DA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC5DBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MTAlarmServerInterface()
{
  if (MTAlarmServerInterface_onceToken != -1)
    dispatch_once(&MTAlarmServerInterface_onceToken, &__block_literal_global_43);
  return (id)MTAlarmServerInterface_alarmServerInterface;
}

id MTAlarmClientInterface()
{
  if (MTAlarmClientInterface_onceToken != -1)
    dispatch_once(&MTAlarmClientInterface_onceToken, &__block_literal_global_79);
  return (id)MTAlarmClientInterface_alarmClientInterface;
}

void sub_19AC5E974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MTTimerServerInterface()
{
  if (MTTimerServerInterface_onceToken != -1)
    dispatch_once(&MTTimerServerInterface_onceToken, &__block_literal_global_96);
  return (id)MTTimerServerInterface_timerServerInterface;
}

id MTTimerClientInterface()
{
  if (MTTimerClientInterface_onceToken != -1)
    dispatch_once(&MTTimerClientInterface_onceToken, &__block_literal_global_128_0);
  return (id)MTTimerClientInterface_timerClientInterface;
}

void sub_19AC5F708(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

__CFString *MTSleepSessionEndReasonDescription(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E39CB3B0[a1];
}

uint64_t AlarmDayFromDayOfWeek(uint64_t a1)
{
  return RepeatDayMap[a1];
}

id AlarmSoundForMediaItemId(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "unsignedLongLongValue"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_19AC64434(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 136), 8);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_19AC64CA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19AC652CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getCHSWidgetConfigurationReaderClass_block_invoke(uint64_t a1)
{
  Class result;

  ChronoServicesLibrary();
  result = objc_getClass("CHSWidgetConfigurationReader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCHSWidgetConfigurationReaderClass_block_invoke_cold_1();
  getCHSWidgetConfigurationReaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ChronoServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E39CB6B0;
    v2 = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChronoServicesLibraryCore_frameworkLibrary)
    ChronoServicesLibrary_cold_1(&v0);
}

Class __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  ChronoServicesLibrary();
  result = objc_getClass("CHSTimelineController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCHSTimelineControllerClass_block_invoke_cold_1();
  getCHSTimelineControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MTIsAlarmReconciliationAllowed()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobiletimer"));
  return v2;
}

void sub_19AC68578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC686D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t _handleLiveNotification(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_handleNotificationWithName:type:", a3, 0);
}

uint64_t MTPBAlarmReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MTPBAlarmProperties *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MTPBAlarmProperties);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (MTPBAlarmPropertiesReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19AC72390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC72744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC72AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC72E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC73248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC735F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC739A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _handleLifeCycleNotification(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "didReceiveLifecycleNotification");
  return result;
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_19AC75F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetTimeFormats()
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x1E0C80C00];
  v1[0] = __formatHourMinSecSubsec;
  v1[1] = __formatHourMinSec;
  v1[2] = __formatMinSecSubsec;
  v1[3] = __formatMinSec;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void ResetTimeFormatter()
{
  id v0;
  void *v1;
  void *v2;
  const __CFAllocator *v3;
  CFStringRef DateFormatFromTemplate;
  void *v5;
  CFStringRef v6;
  void *v7;
  CFStringRef v8;
  void *v9;
  CFStringRef v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFLocale *locale;

  v0 = objc_alloc(MEMORY[0x1E0C99DC8]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  locale = (const __CFLocale *)objc_msgSend(v0, "initWithLocaleIdentifier:", v2);

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("HHmmssSS"), 0, locale);
  v5 = (void *)__formatHourMinSecSubsec;
  __formatHourMinSecSubsec = (uint64_t)DateFormatFromTemplate;

  v6 = CFDateFormatterCreateDateFormatFromTemplate(v3, CFSTR("HHmmss"), 0, locale);
  v7 = (void *)__formatHourMinSec;
  __formatHourMinSec = (uint64_t)v6;

  v8 = CFDateFormatterCreateDateFormatFromTemplate(v3, CFSTR("mmssSS"), 0, locale);
  v9 = (void *)__formatMinSecSubsec;
  __formatMinSecSubsec = (uint64_t)v8;

  v10 = CFDateFormatterCreateDateFormatFromTemplate(v3, CFSTR("mmss"), 0, locale);
  v11 = (void *)__formatMinSec;
  __formatMinSec = (uint64_t)v10;

  -[__CFLocale localeIdentifier](locale, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = objc_msgSend(v12, "hasPrefix:", CFSTR("ee_"));

  if ((_DWORD)v1)
  {
    if (objc_msgSend((id)__formatMinSecSubsec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
    {
      objc_msgSend((id)__formatMinSecSubsec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)__formatMinSecSubsec;
      __formatMinSecSubsec = v13;

    }
    if (objc_msgSend((id)__formatMinSec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
    {
      objc_msgSend((id)__formatMinSec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)__formatMinSec;
      __formatMinSec = v15;

    }
  }
  v17 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v18 = (void *)__numberFormatter;
  __numberFormatter = (uint64_t)v17;

  objc_msgSend((id)__numberFormatter, "setNumberStyle:", 0);
  v19 = (void *)__numFormatHour;
  __numFormatHour = (uint64_t)CFSTR("0");

  v20 = (void *)__numFormatMinSec;
  __numFormatMinSec = (uint64_t)CFSTR("00");

  v21 = (void *)__numFormatMinNoLeadingZero;
  __numFormatMinNoLeadingZero = (uint64_t)CFSTR("0");

  v22 = (void *)__numFormatSubsec;
  __numFormatSubsec = (uint64_t)CFSTR("00");

}

id FormatTime(_BYTE *a1, int a2, long double a3)
{
  return FormatTimeWithConfig(a1, a2, 1, a3);
}

id FormatTimeWithConfig(_BYTE *a1, int a2, int a3, long double a4)
{
  _BOOL4 TimeComponentsWithConfig;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  id v26;

  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  TimeComponentsWithConfig = GetTimeComponentsWithConfig(a2, a3, &v26, &v25, &v24, (uint64_t)&v23, a4);
  v7 = v26;
  v8 = v25;
  v9 = v24;
  v10 = v23;
  v11 = &__formatHourMinSecSubsec;
  if (!TimeComponentsWithConfig)
    v11 = &__formatMinSecSubsec;
  v12 = &__formatHourMinSec;
  if (!TimeComponentsWithConfig)
    v12 = &__formatMinSec;
  if (!a2)
    v11 = v12;
  v13 = (id)*v11;
  if (a1)
    *a1 = TimeComponentsWithConfig;
  if (!TimeComponentsWithConfig)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HH%@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v14;
  }
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("HH"), CFSTR("%1$@"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("H"), CFSTR("%1$@"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mm"), CFSTR("%2$@"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("m"), CFSTR("%2$@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ss"), CFSTR("%3$@"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SS"), CFSTR("%4$@"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v7, v8, v9, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL GetTimeComponentsWithConfig(int a1, int a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, uint64_t a6, long double a7)
{
  void *v11;
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  uint64_t v29;
  _QWORD *v30;

  v11 = (void *)__numberFormatter;
  if (!__numberFormatter)
  {
    ResetTimeFormatter();
    v11 = (void *)__numberFormatter;
  }
  v12 = fmod(a7, 1.0);
  v13 = (unint64_t)a7;
  objc_msgSend(v11, "setPositiveFormat:", __numFormatHour);
  v29 = a6;
  if ((uint64_t)a7 < 3600)
  {
    v16 = &stru_1E39CF258;
  }
  else
  {
    v14 = (void *)__numberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 / 0xE10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromNumber:", v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v13 > 0xE0F)
    v17 = 1;
  else
    v17 = a2;
  if (v17)
    v18 = &__numFormatMinSec;
  else
    v18 = &__numFormatMinNoLeadingZero;
  objc_msgSend((id)__numberFormatter, "setPositiveFormat:", *v18, v29);
  v19 = (void *)__numberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)a7 / 0x3C- 60 * ((unint64_t)(((unint64_t)a7 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromNumber:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__numberFormatter, "setPositiveFormat:", __numFormatMinSec);
  v22 = (void *)__numberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)a7 % 0x3C);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringFromNumber:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__numberFormatter, "setPositiveFormat:", __numFormatSubsec);
  if (a1)
  {
    v25 = (void *)__numberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v12 * 100.0));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringFromNumber:", v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = &stru_1E39CF258;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v16);
  if (a4)
    *a4 = objc_retainAutorelease(v21);
  if (a5)
    *a5 = objc_retainAutorelease(v24);
  if (v30)
    *v30 = objc_retainAutorelease(v27);

  return (uint64_t)a7 > 3599;
}

BOOL GetTimeComponents(int a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t a5, long double a6)
{
  return GetTimeComponentsWithConfig(a1, 1, a2, a3, a4, a5, a6);
}

void sub_19AC76E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC7B090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7B274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MTPBAlarmDeleteReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_19AC7E530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7E8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7EA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7EB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7ECEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC7EECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMDiscoverabilitySignalEventClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDiscoverabilitySignalEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1();
  getBMDiscoverabilitySignalEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E39CC5C0;
    v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibrary_cold_1(&v0);
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMStreamsClass_block_invoke_cold_1();
  getBMStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_5_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_19AC85CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_19AC86200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CC8D0;
    v5 = 0;
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaRemoteLibraryCore_frameworkLibrary)
    __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MediaRemoteLibraryCore_frameworkLibrary, "MRMediaRemoteGetNowPlayingApplicationPlaybackState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t MTPBSoundReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  int v34;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              break;
            case 2u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 24;
              goto LABEL_33;
            case 3u:
              *(_BYTE *)(a1 + 40) |= 1u;
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
                *(_QWORD *)(a2 + v28) = v29 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v30 = 0;
              }
              *(_QWORD *)(a1 + 8) = v30;
              goto LABEL_45;
            case 4u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 32;
LABEL_33:
              v31 = *(void **)(a1 + v27);
              *(_QWORD *)(a1 + v27) = v26;

              goto LABEL_45;
            case 5u:
              *(_BYTE *)(a1 + 40) |= 2u;
              v32 = *v3;
              v33 = *(_QWORD *)(a2 + v32);
              if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v34 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v33);
                *(_QWORD *)(a2 + v32) = v33 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v34 = 0;
              }
              *(_DWORD *)(a1 + 20) = v34;
              goto LABEL_45;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_45:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_38;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_40;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_38:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_40:
          *(_DWORD *)(a1 + 16) = v20;
          goto LABEL_45;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getMTSessionsManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMTSessionsManagerClass_softClass;
  v7 = getMTSessionsManagerClass_softClass;
  if (!getMTSessionsManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMTSessionsManagerClass_block_invoke;
    v3[3] = &unk_1E39CB690;
    v3[4] = &v4;
    __getMTSessionsManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19AC882D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC885E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC8A544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19AC8A6BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19AC8B980(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

Class __getMTSessionsManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileTimerSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CCB00;
    v5 = 0;
    MobileTimerSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerSupportLibraryCore_frameworkLibrary)
    __getMTSessionsManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("MTSessionsManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTSessionsManagerClass_block_invoke_cold_2();
  getMTSessionsManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_19AC8F9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t MTPBAlarmAddReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MTPBAlarm *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MTPBAlarm);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (MTPBAlarmReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MTRepeatDaysForAlarmRepeatSchedule(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a1)
  {
    v3 = 0;
LABEL_18:
    _MTRepeatDayForAlarmRepeatSchedule(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v10);

    return v2;
  }
  if ((a1 & 0x40) != 0)
  {
    _MTRepeatDayForAlarmRepeatSchedule(64);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    if ((a1 & 1) == 0)
    {
LABEL_4:
      if ((a1 & 2) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_4;
  }
  _MTRepeatDayForAlarmRepeatSchedule(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  _MTRepeatDayForAlarmRepeatSchedule(2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  if ((a1 & 4) == 0)
  {
LABEL_6:
    if ((a1 & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  _MTRepeatDayForAlarmRepeatSchedule(4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  if ((a1 & 8) == 0)
  {
LABEL_7:
    if ((a1 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  _MTRepeatDayForAlarmRepeatSchedule(8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  if ((a1 & 0x10) == 0)
  {
LABEL_8:
    if ((a1 & 0x20) == 0)
      return v2;
    goto LABEL_17;
  }
LABEL_16:
  _MTRepeatDayForAlarmRepeatSchedule(16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v9);

  if ((a1 & 0x20) != 0)
  {
LABEL_17:
    v3 = 32;
    goto LABEL_18;
  }
  return v2;
}

MTIntentRepeatDay *_MTRepeatDayForAlarmRepeatSchedule(uint64_t a1)
{
  void *v2;
  MTIntentRepeatDay *v3;
  void *v4;

  DateMaskToString(a1, 1, 0, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MTIntentRepeatDay initWithIdentifier:displayString:]([MTIntentRepeatDay alloc], "initWithIdentifier:displayString:", 0, v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIntentRepeatDay setValue:](v3, "setValue:", v4);

  return v3;
}

void sub_19AC9473C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchableIndexClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CCCF8;
    v5 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
    __getCSSearchableIndexClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CSSearchableIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchableIndexClass_block_invoke_cold_2();
  getCSSearchableIndexClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19AC958A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E39CCD40;
    v3 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibrary_cold_1(&v1);
  return HealthKitLibraryCore_frameworkLibrary;
}

char *OUTLINED_FUNCTION_0_2()
{
  return dlerror();
}

id LocStrWithAssistantLanguage(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantUILocalizedStringForKey:table:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id daysOfWeekWeekends()
{
  void *v0;
  void *v1;
  uint64_t i;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)_daysOfWeekWeekends;
  if (!_daysOfWeekWeekends)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    for (i = 1; i != 8; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D0C2B0], "weekdayIsWeekend:", i));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v3);

    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v1);
    v5 = (void *)_daysOfWeekWeekends;
    _daysOfWeekWeekends = v4;

    v0 = (void *)_daysOfWeekWeekends;
  }
  return v0;
}

id dateFormatter()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)_dateFormatter;
  if (!_dateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)_dateFormatter;
    _dateFormatter = (uint64_t)v1;

    v3 = (void *)_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocale:", v4);

    v0 = (void *)_dateFormatter;
  }
  return v0;
}

id orderedWeekdaySymbols(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    objc_msgSend(v4, "weekdaySymbols");
  else
    objc_msgSend(v4, "shortWeekdaySymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *DateMaskToString(int a1, int a2, char a3, int a4, int a5)
{
  return DateMaskToCasedString(a1, a2, a3, a4, 1, a5);
}

__CFString *DateMaskToCasedString(int a1, int a2, char a3, int a4, char a5, int a6)
{
  void (*v9)(void);
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  __CFString *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  char v56;
  _QWORD v57[4];
  char v58;

  if (a6)
    v9 = (void (*)(void))LocStrWithAssistantLanguage;
  else
    v9 = (void (*)(void))LocStrWithUILanguage;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __DateMaskToCasedString_block_invoke;
  v57[3] = &__block_descriptor_33_e41___NSString_24__0__NSString_8__NSString_16l;
  v58 = a5;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __DateMaskToCasedString_block_invoke_2;
  v54[3] = &unk_1E39CCD80;
  v56 = a3;
  v10 = (id)MEMORY[0x19AED0080](v57);
  v55 = v10;
  v11 = MEMORY[0x19AED0080](v54);
  v12 = (void *)v11;
  if (a1)
  {
    if (a1 == 1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_MONDAY"), CFSTR("ALARM_DETAIL_EVERY_MONDAY"), CFSTR("ALARM_MONDAY"));
LABEL_22:
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
    v13 = a1 & 2;
    if (v13 == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_TUESDAY"), CFSTR("ALARM_DETAIL_EVERY_TUESDAY"), CFSTR("ALARM_TUESDAY"));
      goto LABEL_22;
    }
    v15 = a1 & 4;
    if (v15 == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_WEDNESDAY"), CFSTR("ALARM_DETAIL_EVERY_WEDNESDAY"), CFSTR("ALARM_WEDNESDAY"));
      goto LABEL_22;
    }
    v16 = a1 & 8;
    if (v16 == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_THURSDAY"), CFSTR("ALARM_DETAIL_EVERY_THURSDAY"), CFSTR("ALARM_THURSDAY"));
      goto LABEL_22;
    }
    v17 = a1 & 0x10;
    if (v17 == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_FRIDAY"), CFSTR("ALARM_DETAIL_EVERY_FRIDAY"), CFSTR("ALARM_FRIDAY"));
      goto LABEL_22;
    }
    if ((a1 & 0x20) == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_SATURDAY"), CFSTR("ALARM_DETAIL_EVERY_SATURDAY"), CFSTR("ALARM_SATURDAY"));
      goto LABEL_22;
    }
    if ((a1 & 0x40) == a1)
    {
      (*(void (**)(uint64_t, const __CFString *, const __CFString *, const __CFString *))(v11 + 16))(v11, CFSTR("ALARM_EVERY_SUNDAY"), CFSTR("ALARM_DETAIL_EVERY_SUNDAY"), CFSTR("ALARM_SUNDAY"));
      goto LABEL_22;
    }
    if (a1 == 127)
    {
      (*((void (**)(id, const __CFString *, const __CFString *))v10 + 2))(v10, CFSTR("ALARM_EVERY_DAY"), CFSTR("ALARM_DETAIL_EVERY_DAY"));
      goto LABEL_22;
    }
    v51 = a1 & 0x20;
    v52 = a1 & 0x40;
    v18 = (void *)objc_opt_new();
    daysOfWeekPlaceholder();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1 & 1) != 0)
    {
      if (a2)
        v20 = CFSTR("ALARM_MONDAY");
      else
        v20 = CFSTR("ALARM_SHORT_MONDAY");
      ((void (*)(const __CFString *))v9)(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 1, v22);

    }
    if (v13)
    {
      if (a2)
        v23 = CFSTR("ALARM_TUESDAY");
      else
        v23 = CFSTR("ALARM_SHORT_TUESDAY");
      ((void (*)(const __CFString *))v9)(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v24);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 2, v25);

    }
    if (v15)
    {
      if (a2)
        v38 = CFSTR("ALARM_WEDNESDAY");
      else
        v38 = CFSTR("ALARM_SHORT_WEDNESDAY");
      ((void (*)(const __CFString *))v9)(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v39);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 3, v40);

      if (!v16)
      {
LABEL_39:
        if (!v17)
          goto LABEL_44;
        goto LABEL_40;
      }
    }
    else if (!v16)
    {
      goto LABEL_39;
    }
    if (a2)
      v41 = CFSTR("ALARM_THURSDAY");
    else
      v41 = CFSTR("ALARM_SHORT_THURSDAY");
    ((void (*)(const __CFString *))v9)(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v42);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 4, v43);

    if (!v17)
    {
LABEL_44:
      if (v51)
      {
        if (a2)
          v29 = CFSTR("ALARM_SATURDAY");
        else
          v29 = CFSTR("ALARM_SHORT_SATURDAY");
        ((void (*)(const __CFString *))v9)(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v30);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 6, v31);

      }
      if (v52)
      {
        if (a2)
          v32 = CFSTR("ALARM_SUNDAY");
        else
          v32 = CFSTR("ALARM_SHORT_SUNDAY");
        ((void (*)(const __CFString *))v9)(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v33);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 0, v34);

      }
      daysOfWeekWeekdays();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v53, "isEqualToArray:", v35);

      if (v36)
      {
        v37 = CFSTR("ALARM_WEEKDAYS");
      }
      else
      {
        daysOfWeekWeekends();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v53, "isEqualToArray:", v44);

        if (!v45)
        {
          if (objc_msgSend(v18, "count") != 1)
          {
            v47 = objc_alloc_init(MEMORY[0x1E0CB3738]);
            orderedWeekdaySymbols((uint64_t)v18, a2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "count");
            if (v49 == objc_msgSend(v18, "count"))
              v50 = v48;
            else
              v50 = v18;
            objc_msgSend(v47, "stringFromItems:", v50);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_69;
          }
          objc_msgSend(v18, "firstObject");
          v46 = objc_claimAutoreleasedReturnValue();
LABEL_68:
          v14 = (__CFString *)v46;
LABEL_69:

          goto LABEL_23;
        }
        v37 = CFSTR("ALARM_WEEKENDS");
      }
      ((void (*)(const __CFString *))v9)(v37);
      v46 = objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    }
LABEL_40:
    if (a2)
      v26 = CFSTR("ALARM_FRIDAY");
    else
      v26 = CFSTR("ALARM_SHORT_FRIDAY");
    ((void (*)(const __CFString *))v9)(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "replaceObjectAtIndex:withObject:", 5, v28);

    goto LABEL_44;
  }
  if (a4)
  {
    (*((void (**)(id, const __CFString *, const __CFString *))v10 + 2))(v10, CFSTR("ALARM_REPEAT_NEVER"), CFSTR("ALARM_DETAIL_REPEAT_NEVER"));
    goto LABEL_22;
  }
  v14 = &stru_1E39CF258;
LABEL_24:

  return v14;
}

id MTDictionaryRepresentationOfAlarm(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if ((objc_msgSend(v3, "isFiring") & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isSnoozed"))
  {
    v4 = 1;
  }
  else
  {
    v4 = 2;
  }
  objc_msgSend(v3, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      MTDictionaryRepresentationOfAlarm_cold_1(v6, v7, v8);

  }
  objc_msgSend(MEMORY[0x1E0D15C58], "alarmIDKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  objc_msgSend(v3, "alarmID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0D15C58], "stateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0D15C58], "modifiedDateKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(v3, "lastModifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v15;
  v22[3] = CFSTR("transition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = CFSTR("isSleepAlarm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isSleepAlarm"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  if (!v10)

  return v18;
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_19AC9C82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CCF00;
    v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    __getNPSManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNPSManagerClass_block_invoke_cold_2();
  getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MTPBSyncMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  MTPBSnoozeAction *v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *v5;
    v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(_BYTE *)(a2 + v16))
      v10 = 0;
LABEL_14:
    if (v17 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 5u:
        v19 = objc_alloc_init(MTPBSnoozeAction);
        objc_storeStrong((id *)(a1 + 32), v19);
        if (PBReaderPlaceMark() && (MTPBSnoozeActionReadFrom((uint64_t)v19, a2) & 1) != 0)
          goto LABEL_26;
        goto LABEL_41;
      case 6u:
        v19 = objc_alloc_init(MTPBDismissAction);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (PBReaderPlaceMark() && (MTPBDismissActionReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      case 7u:
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0;
        }
        v28 = 8;
        goto LABEL_38;
      case 8u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v24;

        goto LABEL_39;
      case 9u:
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0;
        }
        v28 = 16;
LABEL_38:
        *(_QWORD *)(a1 + v28) = v23;
        goto LABEL_39;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

unint64_t NSGregorianCalendarDayForMTDay(unint64_t a1)
{
  if (a1 < 7)
    return a1 + 1;
  else
    return 0;
}

unint64_t MTDayFromDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;

  v1 = (void *)MEMORY[0x1E0C99D48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 512, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "weekday");
  if (v5 < 7)
    return v5 + 1;
  else
    return 0;
}

uint64_t MTAlarmRepeatScheduleFromDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 8)
    return 0;
  else
    return qword_19ACFEF58[a1 + 2];
}

id MTAlarmStandardSort()
{
  if (MTAlarmStandardSort_onceToken != -1)
    dispatch_once(&MTAlarmStandardSort_onceToken, &__block_literal_global_22);
  return (id)MEMORY[0x19AED0080](MTAlarmStandardSort_comparator);
}

void sub_19ACA6CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *MTDismissAlarmActionDescription(unint64_t a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_1E39CD408[a1];
}

uint64_t MTDismissAlarmActionCountsAsWakeUp(unint64_t a1)
{
  return (a1 < 0xC) & (0xDE1u >> a1);
}

BOOL MTDismissAlarmActionIsForBedtime(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *MTSnoozeAlarmActionDescription(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E39CD468[a1];
}

void sub_19ACA8E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACAA134(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id getHKObjectTypeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHKObjectTypeClass_softClass;
  v7 = getHKObjectTypeClass_softClass;
  if (!getHKObjectTypeClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKObjectTypeClass_block_invoke;
    v3[3] = &unk_1E39CB690;
    v3[4] = &v4;
    __getHKObjectTypeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19ACAABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKCategoryTypeIdentifierSleepAnalysis()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getHKCategoryTypeIdentifierSleepAnalysisSymbolLoc_ptr;
  v6 = getHKCategoryTypeIdentifierSleepAnalysisSymbolLoc_ptr;
  if (!getHKCategoryTypeIdentifierSleepAnalysisSymbolLoc_ptr)
  {
    v1 = (void *)HealthKitLibrary_0();
    v0 = (id *)dlsym(v1, "HKCategoryTypeIdentifierSleepAnalysis");
    v4[3] = (uint64_t)v0;
    getHKCategoryTypeIdentifierSleepAnalysisSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getHKCategoryTypeIdentifierSleepAnalysis_cold_1();
  return *v0;
}

void sub_19ACAAC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19ACAB0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary_0();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKHealthStoreClass_block_invoke_cold_1();
  getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HealthKitLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_1E39CD548;
    v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary_0)
    HealthKitLibrary_cold_1_0(&v1);
  return HealthKitLibraryCore_frameworkLibrary_0;
}

Class __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary_0();
  result = objc_getClass("HKObjectType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKObjectTypeClass_block_invoke_cold_1();
  getHKObjectTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKCategorySampleClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary_0();
  result = objc_getClass("HKCategorySample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKCategorySampleClass_block_invoke_cold_1();
  getHKCategorySampleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary_0();
  result = objc_getClass("HKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKDeviceClass_block_invoke_cold_1();
  getHKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id MTIntegerIsPositive()
{
  if (MTIntegerIsPositive_onceToken != -1)
    dispatch_once(&MTIntegerIsPositive_onceToken, &__block_literal_global_24);
  return (id)MEMORY[0x19AED0080](MTIntegerIsPositive_block);
}

id MTTimeIntervalIsPositive()
{
  if (MTTimeIntervalIsPositive_onceToken != -1)
    dispatch_once(&MTTimeIntervalIsPositive_onceToken, &__block_literal_global_4_0);
  return (id)MEMORY[0x19AED0080](MTTimeIntervalIsPositive_block);
}

void sub_19ACAD358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MTShouldHideForSensitivity(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MTSensitiveUIMonitor sharedMonitor](MTSensitiveUIMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHideForSensitivity:", a1);

  return v3;
}

BOOL MTShouldAllowToneStore()
{
  uint64_t (*v0)(_QWORD);
  int v1;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v8 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v4[3] = &unk_1E39CB690;
    v4[4] = &v5;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (uint64_t (*)(_QWORD))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
    MTShouldAllowToneStore_cold_1();
  v1 = v0(0);
  return !v1 || v1 == 3;
}

void sub_19ACAE894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MTIsHorseman()
{
  if (MTIsHorseman_onceToken != -1)
    dispatch_once(&MTIsHorseman_onceToken, &__block_literal_global_202);
  return MTIsHorseman_isHorseman;
}

uint64_t MTShouldHandleForBedtime()
{
  return 0;
}

id MTNilify(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if ((v3 & 1) != 0)
    v4 = 0;
  else
    v4 = v1;

  return v4;
}

id MTNullify(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void sub_19ACAED4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACAFB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CD860;
    v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MobileKeyBagLibraryCore_frameworkLibrary, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CD878;
    v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
    __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)SpringBoardUIServicesLibraryCore_frameworkLibrary, "SBUIIsSystemApertureEnabled");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUIIsSystemApertureEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19ACB2120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ACB317C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ACB3690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getTUCallCenterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTUCallCenterClass_softClass;
  v7 = getTUCallCenterClass_softClass;
  if (!getTUCallCenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTUCallCenterClass_block_invoke;
    v3[3] = &unk_1E39CB690;
    v3[4] = &v4;
    __getTUCallCenterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19ACB3750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACB4840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallCenterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CDA40;
    v5 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    __getTUCallCenterClass_block_invoke_cold_1(&v3);
  result = objc_getClass("TUCallCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getTUCallCenterClass_block_invoke_cold_2();
  getTUCallCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMRMediaRemoteSendCommandSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E39CDA58;
    v5 = 0;
    MediaRemoteLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MediaRemoteLibraryCore_frameworkLibrary_0)
    __getMRMediaRemoteSendCommandSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MediaRemoteLibraryCore_frameworkLibrary_0, "MRMediaRemoteSendCommand");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMRMediaRemoteSendCommandSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BulletinDistributorCompanionLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CDA70;
    v5 = 0;
    BulletinDistributorCompanionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BulletinDistributorCompanionLibraryCore_frameworkLibrary)
    __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)BulletinDistributorCompanionLibraryCore_frameworkLibrary, "BLTBulletinContextKeyWatchLegacyMapKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id MTActivityForName(uint64_t a1)
{
  if (MTActivityForName_onceToken != -1)
    dispatch_once(&MTActivityForName_onceToken, &__block_literal_global_11_0);
  return (id)MTActivityForName_activityObjects[a1];
}

os_activity_t MTNewChildActivityForName(uint64_t a1)
{
  NSObject *v1;
  const char *v2;
  os_activity_t v3;

  switch(a1)
  {
    case 0:
      MTActivityForName(0);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Add Alarm";
      goto LABEL_22;
    case 1:
      MTActivityForName(1);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Update Alarm";
      goto LABEL_22;
    case 2:
      MTActivityForName(2);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Remove Alarm";
      goto LABEL_22;
    case 3:
      MTActivityForName(3);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Dismiss Alarm";
      goto LABEL_22;
    case 4:
      MTActivityForName(4);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Snooze Alarm";
      goto LABEL_22;
    case 5:
      MTActivityForName(5);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Sync Add Alarm";
      goto LABEL_22;
    case 6:
      MTActivityForName(6);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Sync Update Alarm";
      goto LABEL_22;
    case 7:
      MTActivityForName(7);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Sync Remove Alarm";
      goto LABEL_22;
    case 8:
      MTActivityForName(8);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Sync Dismiss Alarm";
      goto LABEL_22;
    case 9:
      MTActivityForName(9);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Sync Snooze Alarm";
      goto LABEL_22;
    case 10:
      MTActivityForName(10);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Fire Alarm";
      goto LABEL_22;
    case 11:
      MTActivityForName(11);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Schedule Alarm";
      goto LABEL_22;
    case 12:
      MTActivityForName(12);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Add Timer";
      goto LABEL_22;
    case 13:
      MTActivityForName(13);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Update Timer";
      goto LABEL_22;
    case 14:
      MTActivityForName(14);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Remove Timer";
      goto LABEL_22;
    case 15:
      MTActivityForName(15);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Dismiss Timer";
      goto LABEL_22;
    case 16:
      MTActivityForName(16);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Repeat Timer";
      goto LABEL_22;
    case 17:
      MTActivityForName(17);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Schedule Timer";
      goto LABEL_22;
    case 18:
      MTActivityForName(18);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = "Fire Timer";
LABEL_22:
      v3 = _os_activity_create(&dword_19AC4E000, v2, v1, OS_ACTIVITY_FLAG_DEFAULT);

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

uint64_t MTPBDismissActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19ACB93F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ACBA4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACBA660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t IOKitLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!IOKitLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E39CDC50;
    v3 = 0;
    IOKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IOKitLibraryCore_frameworkLibrary)
    IOKitLibrary_cold_1(&v1);
  return IOKitLibraryCore_frameworkLibrary;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t MTCompareTimerTimes(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  objc_msgSend(a1, "remainingTime");
  v5 = round(v4);
  objc_msgSend(v3, "remainingTime");
  v7 = v6;

  v8 = round(v7);
  if (v5 < v8)
    return -1;
  else
    return v5 > v8;
}

BOOL MTTimerTimesAreEqual(void *a1, void *a2)
{
  return MTCompareTimerTimes(a1, a2) == 0;
}

void sub_19ACBB338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACBCC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACBCE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC0344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC0418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC0CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ACC1504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC1CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC2314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC2498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC2570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC2678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACC2798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MTPBAlarmStateReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MTPBAlarm *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MTPBAlarm);
        objc_msgSend(a1, "addAlarms:", v17);
        if (!PBReaderPlaceMark() || (MTPBAlarmReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19ACC7410(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_19ACCA1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getGSSendAppPreferencesChangedSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!GraphicsServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CE710;
    v5 = 0;
    GraphicsServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!GraphicsServicesLibraryCore_frameworkLibrary)
    __getGSSendAppPreferencesChangedSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)GraphicsServicesLibraryCore_frameworkLibrary, "GSSendAppPreferencesChanged");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getGSSendAppPreferencesChangedSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19ACCCF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACCD100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_19ACD0C3C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  uint64_t *v3;
  id v4;
  NSObject *v5;

  if (a2 == 1)
  {
    v4 = objc_begin_catch(exception_object);
    MTLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_1(v3);

    objc_msgSend((id)*v3, "_removeSyncDataFile");
    objc_msgSend(*(id *)(v2 + 40), "finishWithResult:", MEMORY[0x1E0C9AA60]);

    objc_end_catch();
    JUMPOUT(0x19ACD0BF4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _MTPairedDevicePreferences_HandlePreferencesChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handlePrefsChanged");
}

void sub_19ACD31A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACD3898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTStopwatchStorageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileTimerSupportLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E39CE9F0;
    v5 = 0;
    MobileTimerSupportLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MobileTimerSupportLibraryCore_frameworkLibrary_0)
    __getMTStopwatchStorageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("MTStopwatchStorage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTStopwatchStorageClass_block_invoke_cold_2();
  getMTStopwatchStorageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19ACD8EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACD9100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E39CEB08;
    v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MobileKeyBagLibraryCore_frameworkLibrary_0)
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MobileKeyBagLibraryCore_frameworkLibrary_0, "MKBDeviceUnlockedSinceBoot");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MTPBAlarmUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MTPBAlarmProperties *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MTPBAlarmProperties);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (MTPBAlarmPropertiesReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getHKHealthStoreClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHKHealthStoreClass_softClass_0;
  v7 = getHKHealthStoreClass_softClass_0;
  if (!getHKHealthStoreClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKHealthStoreClass_block_invoke_0;
    v3[3] = &unk_1E39CB690;
    v3[4] = &v4;
    __getHKHealthStoreClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19ACD9958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACD9A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  HealthKitLibrary_1();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKHealthStoreClass_block_invoke_cold_1_0();
  getHKHealthStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HealthKitLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_1E39CEC88;
    v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary_1)
    HealthKitLibrary_cold_1_1(&v1);
  return HealthKitLibraryCore_frameworkLibrary_1;
}

void sub_19ACDC968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACDCA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sortPriorityForTimerState(unint64_t a1)
{
  if (a1 > 4)
    return 3;
  else
    return qword_19ACFF058[a1];
}

uint64_t MTTimerIntentResultsComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "state");
  if (v6 > 4)
    v7 = 3;
  else
    v7 = qword_19ACFF058[v6];
  v8 = objc_msgSend(v5, "state");
  if (v8 > 4)
    v9 = 3;
  else
    v9 = qword_19ACFF058[v8];
  if (objc_msgSend(v5, "type") != 2)
  {
    if (v7 > v9)
      goto LABEL_19;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v4, "type");
  v11 = -1;
  if (v7 <= v9 && v10 == 2)
  {
LABEL_12:
    if (v7 < v9)
    {
LABEL_13:
      v11 = 1;
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "state") != 3)
    {
      objc_msgSend(v5, "lastModifiedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastModifiedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "compare:", v13);

      if (v11)
        goto LABEL_20;
    }
    objc_msgSend(v4, "remainingTime");
    v15 = v14;
    objc_msgSend(v5, "remainingTime");
    if (v15 >= v16)
    {
      objc_msgSend(v4, "remainingTime");
      v18 = v17;
      objc_msgSend(v5, "remainingTime");
      if (v18 > v19)
        goto LABEL_13;
      objc_msgSend(v4, "duration");
      v21 = v20;
      objc_msgSend(v5, "duration");
      if (v21 >= v22)
      {
        objc_msgSend(v4, "duration");
        v25 = v24;
        objc_msgSend(v5, "duration");
        v11 = v25 > v26;
        goto LABEL_20;
      }
    }
LABEL_19:
    v11 = -1;
  }
LABEL_20:

  return v11;
}

uint64_t MTPBSnoozeActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19ACE5274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void _CFUserNotificationCallback(const void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___CFUserNotificationCallback_block_invoke;
  v17[3] = &__block_descriptor_40_e30_B16__0__MTCFUserNotification_8l;
  v17[4] = a1;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ calling handler for %{public}@", buf, 0x16u);

    }
    objc_msgSend(v8, "handler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v12)[2](v12, a2 == 0);

    +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject notifications](v13, "notifications");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
  else
  {
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CFUserNotificationCallback_cold_1(v16, (uint64_t)a1, buf, v13);
    }
  }

  CFRelease(a1);
  objc_sync_exit(v4);

}

void sub_19ACE54D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ACE5594(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MTIntentsTimerTypeFromSiriContext(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v2 = 1;

  return v2;
}

id MTIntentsTimerForTimer(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CBDC88];
    v2 = a1;
    v3 = [v1 alloc];
    v4 = objc_alloc(MEMORY[0x1E0CBDC00]);
    objc_msgSend(v2, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSpokenPhrase:", v5);
    objc_msgSend(v2, "duration");
    v8 = v7;
    objc_msgSend(v2, "remainingTime");
    v10 = v9;
    objc_msgSend(v2, "timerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v2, "state");
    if (v13 > 4)
      v14 = 2;
    else
      v14 = qword_19ACFF088[v13];
    objc_msgSend(v2, "siriContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(v3, "initWithLabel:duration:remainingTime:identifier:state:type:", v6, v12, v14, MTIntentsTimerTypeFromSiriContext(v16), v8, v10);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

uint64_t MTIntentsTimerStateForTimerState(unint64_t a1)
{
  if (a1 > 4)
    return 2;
  else
    return qword_19ACFF088[a1];
}

BOOL MTTimerConflictsWithTimer(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "timerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_11;
    if (objc_msgSend(v3, "type") == 2 && objc_msgSend(v5, "type") == 2)
    {
      v6 = 1;
      goto LABEL_21;
    }
    v10 = objc_msgSend(v3, "type");
    if (v10 != objc_msgSend(v5, "type"))
    {
LABEL_11:
      v6 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v3, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_msgSend(v3, "title"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "title"),
          v9 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "caseInsensitiveCompare:", v9)))
    {
      objc_msgSend(v3, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v5, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v6 = 0;
        }
        else
        {
          objc_msgSend(v3, "duration");
          v15 = v14;
          objc_msgSend(v5, "duration");
          v6 = v15 == v16;
        }

      }
      if (!v11)
        goto LABEL_20;
    }
    else
    {
      v6 = 1;
    }

LABEL_20:
  }
LABEL_21:

  return v6;
}

uint64_t MTTimerMatchesIntentsTimer(void *a1, void *a2, char a3, BOOL *a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "duration");
    if (v10 >= 0.0)
    {
      v13 = v10;
      objc_msgSend(v7, "duration");
      v15 = v14;
      objc_msgSend(v9, "remainingTime");
      if (v13 != v15)
      {
        objc_msgSend(v9, "state");
LABEL_21:
        objc_msgSend(v9, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v9, "remainingTime");
    }
    v16 = v11;
    if ((a3 & 1) != 0 || v11 < 0.0)
    {
      v19 = objc_msgSend(v9, "state");
    }
    else
    {
      objc_msgSend(v7, "remainingTime");
      v18 = v17;
      v19 = objc_msgSend(v9, "state");
      if (v16 != v18)
        goto LABEL_21;
    }
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v7, "state");
      v22 = v21 > 4 ? 2 : qword_19ACFF088[v21];
      if (v20 != v22)
        goto LABEL_21;
    }
    if (objc_msgSend(v9, "type"))
    {
      v23 = objc_msgSend(v9, "type");
      v24 = objc_msgSend(v7, "type");
      objc_msgSend(v9, "identifier");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v23 != v24)
      {
LABEL_22:
        v12 = 0;
        goto LABEL_23;
      }
      if (v25)
      {
LABEL_19:
        objc_msgSend(v7, "timerID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v26, "isEqualToString:", v28);

        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v9, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        goto LABEL_19;
    }
    v12 = 1;
LABEL_23:
    objc_msgSend(v9, "label");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "spokenPhrase");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if ((_DWORD)v12)
    {
      if (!v30)
      {
        v12 = 1;
        if (a4)
          goto LABEL_27;
        goto LABEL_34;
      }
      v12 = objc_msgSend(v31, "localizedCaseInsensitiveContainsString:", v30);
    }
    if (a4)
    {
LABEL_27:
      if (v32)
        v33 = v12;
      else
        v33 = 0;
      v34 = v33 == 1 && objc_msgSend(v32, "caseInsensitiveCompare:", v30) == 0;
      *a4 = v34;
    }
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

void sub_19ACE6A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACE6B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACE6D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ACE7714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

Class __getSYServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  CompanionSyncLibrary();
  result = objc_getClass("SYService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSYServiceClass_block_invoke_cold_1();
  getSYServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CompanionSyncLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CompanionSyncLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E39CF1C8;
    v3 = 0;
    CompanionSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CompanionSyncLibraryCore_frameworkLibrary)
    CompanionSyncLibrary_cold_1(&v1);
  return CompanionSyncLibraryCore_frameworkLibrary;
}

void *__getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E39CF1E0;
    v5 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IDSLibraryCore_frameworkLibrary)
    __getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)IDSLibraryCore_frameworkLibrary, "IDSSendMessageOptionBypassDuetKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MTPBAlarmPropertiesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  MTPBSound *v47;
  uint64_t result;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char v130;
  char v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  char v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_35;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x4000u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if (v26 < 0)
            {
              v20 += 7;
              v15 = v21++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_180;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_180:
        v156 = 104;
        goto LABEL_250;
      case 3u:
        v27 = 0;
        v28 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x8000u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v22 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_184;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_184:
        v156 = 108;
        goto LABEL_250;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 136;
LABEL_35:
        v33 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_268;
      case 5u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_DWORD *)(a1 + 152) |= 0x80000u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v36 = 0;
                goto LABEL_188;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_188:
        v157 = v36 != 0;
        v158 = 144;
        goto LABEL_241;
      case 6u:
        v41 = 0;
        v42 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x1000u;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          v45 = v44 + 1;
          if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v22 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              v15 = v42++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_192:
        v156 = 96;
        goto LABEL_250;
      case 7u:
        v47 = objc_alloc_init(MTPBSound);
        objc_storeStrong((id *)(a1 + 128), v47);
        if (PBReaderPlaceMark() && (MTPBSoundReadFrom((uint64_t)v47, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_268:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0xCu:
        v49 = 0;
        v50 = 0;
        v51 = 0;
        *(_DWORD *)(a1 + 152) |= 0x200000u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          v54 = v53 + 1;
          if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                v51 = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v51 = 0;
LABEL_196:
        v157 = v51 != 0;
        v158 = 146;
        goto LABEL_241;
      case 0xDu:
        v56 = 0;
        v57 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x200u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          v60 = v59 + 1;
          if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v22 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              v15 = v57++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_200:
        v156 = 84;
        goto LABEL_250;
      case 0xEu:
        v62 = 0;
        v63 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x400u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          v66 = v65 + 1;
          if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v22 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v15 = v63++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_204;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_204:
        v156 = 88;
        goto LABEL_250;
      case 0xFu:
        v68 = 0;
        v69 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x800u;
        while (2)
        {
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          v72 = v71 + 1;
          if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v22 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_208;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_208:
        v156 = 92;
        goto LABEL_250;
      case 0x10u:
        v74 = 0;
        v75 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x20000u;
        while (2)
        {
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          v78 = v77 + 1;
          if (v77 == -1 || v78 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v78;
            v22 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              v15 = v75++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_212;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_212:
        v156 = 116;
        goto LABEL_250;
      case 0x11u:
        *(_DWORD *)(a1 + 152) |= 0x40u;
        v80 = *v3;
        v81 = *(_QWORD *)(a2 + v80);
        if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v81);
          *(_QWORD *)(a2 + v80) = v81 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 56;
        goto LABEL_267;
      case 0x12u:
        *(_DWORD *)(a1 + 152) |= 0x80u;
        v83 = *v3;
        v84 = *(_QWORD *)(a2 + v83);
        if (v84 <= 0xFFFFFFFFFFFFFFF7 && v84 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v84);
          *(_QWORD *)(a2 + v83) = v84 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 64;
        goto LABEL_267;
      case 0x14u:
        *(_DWORD *)(a1 + 152) |= 4u;
        v85 = *v3;
        v86 = *(_QWORD *)(a2 + v85);
        if (v86 <= 0xFFFFFFFFFFFFFFF7 && v86 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v86);
          *(_QWORD *)(a2 + v85) = v86 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 24;
        goto LABEL_267;
      case 0x15u:
        v87 = 0;
        v88 = 0;
        v89 = 0;
        *(_DWORD *)(a1 + 152) |= 0x100000u;
        while (2)
        {
          v90 = *v3;
          v91 = *(_QWORD *)(a2 + v90);
          v92 = v91 + 1;
          if (v91 == -1 || v92 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v91);
            *(_QWORD *)(a2 + v90) = v92;
            v89 |= (unint64_t)(v93 & 0x7F) << v87;
            if (v93 < 0)
            {
              v87 += 7;
              v15 = v88++ >= 9;
              if (v15)
              {
                v89 = 0;
                goto LABEL_216;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v89 = 0;
LABEL_216:
        v157 = v89 != 0;
        v158 = 145;
        goto LABEL_241;
      case 0x16u:
        *(_DWORD *)(a1 + 152) |= 0x10u;
        v94 = *v3;
        v95 = *(_QWORD *)(a2 + v94);
        if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v95);
          *(_QWORD *)(a2 + v94) = v95 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 40;
        goto LABEL_267;
      case 0x17u:
        *(_DWORD *)(a1 + 152) |= 8u;
        v96 = *v3;
        v97 = *(_QWORD *)(a2 + v96);
        if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v97);
          *(_QWORD *)(a2 + v96) = v97 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 32;
        goto LABEL_267;
      case 0x1Bu:
        v98 = 0;
        v99 = 0;
        v100 = 0;
        *(_DWORD *)(a1 + 152) |= 0x400000u;
        while (2)
        {
          v101 = *v3;
          v102 = *(_QWORD *)(a2 + v101);
          v103 = v102 + 1;
          if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
            *(_QWORD *)(a2 + v101) = v103;
            v100 |= (unint64_t)(v104 & 0x7F) << v98;
            if (v104 < 0)
            {
              v98 += 7;
              v15 = v99++ >= 9;
              if (v15)
              {
                v100 = 0;
                goto LABEL_220;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v100 = 0;
LABEL_220:
        v157 = v100 != 0;
        v158 = 147;
        goto LABEL_241;
      case 0x1Eu:
        v105 = 0;
        v106 = 0;
        v107 = 0;
        *(_DWORD *)(a1 + 152) |= 0x1000000u;
        while (2)
        {
          v108 = *v3;
          v109 = *(_QWORD *)(a2 + v108);
          v110 = v109 + 1;
          if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v109);
            *(_QWORD *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              v15 = v106++ >= 9;
              if (v15)
              {
                v107 = 0;
                goto LABEL_224;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v107 = 0;
LABEL_224:
        v157 = v107 != 0;
        v158 = 149;
        goto LABEL_241;
      case 0x1Fu:
        v112 = 0;
        v113 = 0;
        v114 = 0;
        *(_DWORD *)(a1 + 152) |= 0x800000u;
        while (2)
        {
          v115 = *v3;
          v116 = *(_QWORD *)(a2 + v115);
          v117 = v116 + 1;
          if (v116 == -1 || v117 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v118 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v116);
            *(_QWORD *)(a2 + v115) = v117;
            v114 |= (unint64_t)(v118 & 0x7F) << v112;
            if (v118 < 0)
            {
              v112 += 7;
              v15 = v113++ >= 9;
              if (v15)
              {
                v114 = 0;
                goto LABEL_228;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v114 = 0;
LABEL_228:
        v157 = v114 != 0;
        v158 = 148;
        goto LABEL_241;
      case 0x20u:
        v119 = 0;
        v120 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x10000u;
        while (2)
        {
          v121 = *v3;
          v122 = *(_QWORD *)(a2 + v121);
          v123 = v122 + 1;
          if (v122 == -1 || v123 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v124 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v122);
            *(_QWORD *)(a2 + v121) = v123;
            v22 |= (unint64_t)(v124 & 0x7F) << v119;
            if (v124 < 0)
            {
              v119 += 7;
              v15 = v120++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_232;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_232:
        v156 = 112;
        goto LABEL_250;
      case 0x21u:
        v125 = 0;
        v126 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x40000u;
        while (2)
        {
          v127 = *v3;
          v128 = *(_QWORD *)(a2 + v127);
          v129 = v128 + 1;
          if (v128 == -1 || v129 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v130 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v128);
            *(_QWORD *)(a2 + v127) = v129;
            v22 |= (unint64_t)(v130 & 0x7F) << v125;
            if (v130 < 0)
            {
              v125 += 7;
              v15 = v126++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_236;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_236:
        v156 = 120;
        goto LABEL_250;
      case 0x22u:
        v131 = 0;
        v132 = 0;
        v133 = 0;
        *(_DWORD *)(a1 + 152) |= 0x2000000u;
        while (2)
        {
          v134 = *v3;
          v135 = *(_QWORD *)(a2 + v134);
          v136 = v135 + 1;
          if (v135 == -1 || v136 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v137 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v135);
            *(_QWORD *)(a2 + v134) = v136;
            v133 |= (unint64_t)(v137 & 0x7F) << v131;
            if (v137 < 0)
            {
              v131 += 7;
              v15 = v132++ >= 9;
              if (v15)
              {
                v133 = 0;
                goto LABEL_240;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v133 = 0;
LABEL_240:
        v157 = v133 != 0;
        v158 = 150;
LABEL_241:
        *(_BYTE *)(a1 + v158) = v157;
        goto LABEL_268;
      case 0x24u:
        v138 = 0;
        v139 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x2000u;
        while (2)
        {
          v140 = *v3;
          v141 = *(_QWORD *)(a2 + v140);
          v142 = v141 + 1;
          if (v141 == -1 || v142 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v143 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v141);
            *(_QWORD *)(a2 + v140) = v142;
            v22 |= (unint64_t)(v143 & 0x7F) << v138;
            if (v143 < 0)
            {
              v138 += 7;
              v15 = v139++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_245:
        v156 = 100;
        goto LABEL_250;
      case 0x25u:
        *(_DWORD *)(a1 + 152) |= 2u;
        v144 = *v3;
        v145 = *(_QWORD *)(a2 + v144);
        if (v145 <= 0xFFFFFFFFFFFFFFF7 && v145 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v145);
          *(_QWORD *)(a2 + v144) = v145 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 16;
        goto LABEL_267;
      case 0x27u:
        *(_DWORD *)(a1 + 152) |= 1u;
        v146 = *v3;
        v147 = *(_QWORD *)(a2 + v146);
        if (v147 <= 0xFFFFFFFFFFFFFFF7 && v147 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v147);
          *(_QWORD *)(a2 + v146) = v147 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 8;
        goto LABEL_267;
      case 0x28u:
        v148 = 0;
        v149 = 0;
        v22 = 0;
        *(_DWORD *)(a1 + 152) |= 0x100u;
        while (2)
        {
          v150 = *v3;
          v151 = *(_QWORD *)(a2 + v150);
          v152 = v151 + 1;
          if (v151 == -1 || v152 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v153 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v151);
            *(_QWORD *)(a2 + v150) = v152;
            v22 |= (unint64_t)(v153 & 0x7F) << v148;
            if (v153 < 0)
            {
              v148 += 7;
              v15 = v149++ >= 9;
              if (v15)
              {
                LODWORD(v22) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_249:
        v156 = 80;
LABEL_250:
        *(_DWORD *)(a1 + v156) = v22;
        goto LABEL_268;
      case 0x29u:
        *(_DWORD *)(a1 + 152) |= 0x20u;
        v154 = *v3;
        v155 = *(_QWORD *)(a2 + v154);
        if (v155 <= 0xFFFFFFFFFFFFFFF7 && v155 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v82 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v155);
          *(_QWORD *)(a2 + v154) = v155 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v82 = 0;
        }
        v159 = 48;
LABEL_267:
        *(_QWORD *)(a1 + v159) = v82;
        goto LABEL_268;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_268;
    }
  }
}

void __getCHSWidgetConfigurationReaderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHSWidgetConfigurationReaderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTWidgetUtilities.m"), 12, CFSTR("Unable to find class %s"), "CHSWidgetConfigurationReader");

  __break(1u);
}

void ChronoServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ChronoServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTWidgetUtilities.m"), 11, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCHSTimelineControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHSTimelineControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTWidgetUtilities.m"), 14, CFSTR("Unable to find class %s"), "CHSTimelineController");

  __break(1u);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDiscoverabilitySignalEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTAlarmStorage.m"), 49, CFSTR("Unable to find class %s"), "BMDiscoverabilitySignalEvent");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTAlarmStorage.m"), 48, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTAlarmStorage.m"), 51, CFSTR("Unable to find class %s"), "BMStreams");

  __break(1u);
}

void __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaRemoteLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTCreateTimerIntentHandler.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTSessionsManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileTimerSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTSessionsCoordinator.m"), 43, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTSessionsManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTSessionsManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSessionsCoordinator.m"), 44, CFSTR("Unable to find class %s"), "MTSessionsManager");

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTAlarmIntent.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchableIndexClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTAlarmIntent.m"), 24, CFSTR("Unable to find class %s"), "CSSearchableIndex");

  __break(1u);
}

void HealthKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTTimeInBedSessionTracker.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void MTDictionaryRepresentationOfAlarm_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_7_0(&dword_19AC4E000, a1, a3, "alarm id not present", v3);
}

void __getNPSManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WorldClockManager.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNPSManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WorldClockManager.m"), 30, CFSTR("Unable to find class %s"), "NPSManager");

  __break(1u);
}

void getHKCategoryTypeIdentifierSleepAnalysis_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKCategoryTypeIdentifier getHKCategoryTypeIdentifierSleepAnalysis(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepSessionManager.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getHKHealthStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKHealthStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepSessionManager.m"), 23, CFSTR("Unable to find class %s"), "HKHealthStore");

  __break(1u);
}

void HealthKitLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTSleepSessionManager.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHKObjectTypeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKObjectTypeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepSessionManager.m"), 25, CFSTR("Unable to find class %s"), "HKObjectType");

  __break(1u);
}

void __getHKCategorySampleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKCategorySampleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepSessionManager.m"), 24, CFSTR("Unable to find class %s"), "HKCategorySample");

  __break(1u);
}

void __getHKDeviceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKDeviceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepSessionManager.m"), 26, CFSTR("Unable to find class %s"), "HKDevice");

  __break(1u);
}

void MTShouldAllowToneStore_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int MTGetDeviceLockState(CFDictionaryRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTUtilities.m"), 41, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileKeyBagLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTUtilities.m"), 40, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTUtilities.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTUCallCenterClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTUserNotificationCenter.m"), 59, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTUCallCenterClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTUCallCenterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTUserNotificationCenter.m"), 60, CFSTR("Unable to find class %s"), "TUCallCenter");

  __break(1u);
}

void __getMRMediaRemoteSendCommandSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaRemoteLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTUserNotificationCenter.m"), 57, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BulletinDistributorCompanionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTUserNotificationCenter_Internal.h"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void IOKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IOKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTPowerAssertion.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getGSSendAppPreferencesChangedSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *GraphicsServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTLegacyManager.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTStopwatchStorageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileTimerSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTStopwatchHeaders.h"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTStopwatchStorageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTStopwatchStorageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTStopwatchHeaders.h"), 15, CFSTR("Unable to find class %s"), "MTStopwatchStorage");

  __break(1u);
}

void __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileKeyBagLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTDeviceListener.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHKHealthStoreClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKHealthStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepManager.m"), 32, CFSTR("Unable to find class %s"), "HKHealthStore");

  __break(1u);
}

void HealthKitLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTSleepManager.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void _CFUserNotificationCallback_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ couldn't find callback for notification %{public}@", buf, 0x16u);

}

void __getSYServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSYServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTCompanionSyncService.m"), 26, CFSTR("Unable to find class %s"), "SYService");

  __break(1u);
}

void CompanionSyncLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CompanionSyncLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTCompanionSyncService.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IDSLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTCompanionSyncService.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
  AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1E0C98468](allocator, tmplate, options, locale);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99548](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1E0D51970]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t SBSLockDevice()
{
  return MEMORY[0x1E0DAB798]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CPLog()
{
  return MEMORY[0x1E0CFA9F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

