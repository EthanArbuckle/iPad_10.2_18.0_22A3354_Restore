id CalGenerateRandomDispatchQueueName(__CFString *a1)
{
  __CFString *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v2 = CFSTR("Unknown");
  if (a1)
    v2 = a1;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = v2;
  v5 = a1;
  CalGenerateUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *CalGenerateUUID()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

void sub_18FC156D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC15934(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CalCachedObjectForKeyWithCalculateBlock(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;
    objc_msgSend(v5, "setObject:forKey:", v11, v6);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "isEqual:", v12);

  if (v13)
  {

    v8 = 0;
  }

  return v8;
}

void sub_18FC15AC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t timezonesAreEquivalent(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  UChar s2[2];
  _WORD v15[64];
  _WORD v16[64];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    if ((objc_msgSend(v3, "isEqualToTimeZone:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      if (v8 >= 0x3F)
        v9 = 63;
      else
        v9 = v8;
      objc_msgSend(v7, "getCharacters:range:", v16, 0, v9);
      v16[v9] = 0;

      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      if (v11 >= 0x3F)
        v12 = 63;
      else
        v12 = v11;
      objc_msgSend(v10, "getCharacters:range:", v15, 0, v12);
      v15[v12] = 0;

      *(_DWORD *)s2 = 0;
      ucal_getCanonicalTimeZoneID();
      ucal_getCanonicalTimeZoneID();
      v6 = 0;
    }
  }

  return v6;
}

void sub_18FC19E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC1A004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18FC1AEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC1AF54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _EKSharedGregorianCalendarLock()
{
  if (_EKSharedGregorianCalendarLock_onceToken != -1)
    dispatch_once(&_EKSharedGregorianCalendarLock_onceToken, &__block_literal_global_12);
  return (id)_EKSharedGregorianCalendarLock_sharedGregorianCalendarLock;
}

id _EKSharedGregorianCalendarForTimeZone(void *a1)
{
  id v1;
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;

  v1 = a1;
  objc_msgSend(v1, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (!v2)
    {
      v4 = 0;
      goto LABEL_13;
    }
  }
  else
  {

    v3 = CFSTR("floating");
  }
  v5 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
  if (!_EKSharedGregorianCalendarForTimeZone___calendarCache)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v7 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
    _EKSharedGregorianCalendarForTimeZone___calendarCache = v6;

    v5 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v4 = (void *)v8;
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("floating")))
    {
      objc_msgSend(v4, "timeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEquivalentTo:", v10);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTimeZone:", v12);

      }
    }
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0C99D48]);
    v14 = (void *)objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = v14;
    if (v14)
    {
      objc_msgSend(v14, "setTimeZone:", v1);
      objc_msgSend((id)_EKSharedGregorianCalendarForTimeZone___calendarCache, "setObject:forKeyedSubscript:", v4, v3);
    }
  }
LABEL_13:

  return v4;
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

void sub_18FC1D9F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
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

id EKDateGetDateComponents(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a1;
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  _EKSharedGregorianCalendarLock();
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __EKDateGetDateComponents_block_invoke;
  v12[3] = &unk_1E2A843C8;
  v13 = v5;
  v14 = v6;
  v15 = &v17;
  v16 = a2;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void sub_18FC208E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _phoneNumberDetector()
{
  if (_phoneNumberDetector_onceToken != -1)
    dispatch_once(&_phoneNumberDetector_onceToken, &__block_literal_global_166);
  return (id)_sPhoneNumberDetector;
}

void sub_18FC22030(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("AddressParsing"));
  _Unwind_Resume(a1);
}

void sub_18FC22528(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("AddressParsing"));
  _Unwind_Resume(a1);
}

void ___phoneNumberDetector_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2080, 0);
  v1 = (void *)_sPhoneNumberDetector;
  _sPhoneNumberDetector = v0;

}

double _CalRecurrenceByDayItemCopy(uint64_t a1, double *a2)
{
  _QWORD *v3;
  double result;

  v3 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v3)
  {
    result = *a2;
    *v3 = *(_QWORD *)a2;
  }
  return result;
}

void _CalRecurrenceByDayItemFree(int a1, void *a2)
{
  if (a2)
    free(a2);
}

CFStringRef _CalRecurrenceByDayItemCopyStringRepresentation(unsigned int *a1)
{
  const __CFString *v1;

  v1 = &stru_1E2A86598;
  if ((int)*a1 > 0)
    v1 = CFSTR("+");
  return CFStringCreateWithFormat(0, 0, CFSTR("%@%d%s"), v1, *a1, kCalDayStrings[a1[1]]);
}

BOOL _CalRecurrenceByDayItemEqual(_DWORD *a1, _DWORD *a2)
{
  _BOOL8 result;

  result = a1 == a2;
  if (a2 && a1 && a1 != a2)
    return a1[1] == a2[1] && *a1 == *a2;
  return result;
}

const __CFString *CalDescriptionForCalVirtualConferenceSource(uint64_t a1)
{
  if (a1)
    return CFSTR("Google");
  else
    return CFSTR("Apple");
}

void sub_18FC24A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E2A83FB8;
    v5 = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChronoServicesLibraryCore_frameworkLibrary)
    __getCHSTimelineControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CHSTimelineController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCHSTimelineControllerClass_block_invoke_cold_2();
  getCHSTimelineControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18FC253FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id anonString_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonString_block_invoke_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomeString-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonSummary_block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonSummary_block_invoke_2_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomeSummary-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonDescription_block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonDescription_block_invoke_3_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomeDescription-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonUID_block_invoke_4()
{
  void *v0;
  void *v1;

  CalGenerateUUID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SomeUID-%@"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id anonURNUID_block_invoke_5()
{
  void *v0;
  void *v1;

  CalGenerateUUID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid:SomeURNUID-%@"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id anonName_block_invoke_6()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonName_block_invoke_6_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("Somebody-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonEmail_block_invoke_7()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonEmail_block_invoke_7_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CaliCalendarAnonymizer sharedAnonymizedDomainName](CaliCalendarAnonymizer, "sharedAnonymizedDomainName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomeMr-%@@%@"), v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id anonLocation_block_invoke_8()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonLocation_block_invoke_8_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomeLoc-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonPhoneNumber_block_invoke_9()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ++anonPhoneNumber_block_invoke_9_count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SomePhone-%@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id anonWebURL_block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("//")) != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "appendString:", CFSTR("//"));
  v4 = random();
  if (v4 <= 0)
    v5 = -(uint64_t)-(char)v4;
  else
    v5 = v4;
  v6 = random();
  if (v6 <= 0)
    v7 = -(uint64_t)-(char)v6;
  else
    v7 = v6;
  v8 = random();
  if (v8 <= 0)
    v9 = -(uint64_t)-(char)v8;
  else
    v9 = v8;
  v10 = random();
  if (v10 <= 0)
    v11 = -(uint64_t)-(char)v10;
  else
    v11 = v10;
  objc_msgSend(v3, "appendFormat:", CFSTR("%ld.%ld.%ld.%ld"), v5, v7, v9, v11);
  if (objc_msgSend(v2, "rangeOfString:", CFSTR(".html")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = ((int)random() % 26 + 97);
    v13 = ((int)random() % 26 + 97);
    v14 = ((int)random() % 26 + 97);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), v12, v13, v14, ((int)random() % 26 + 97));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", CFSTR("/"));
    objc_msgSend(v3, "appendString:", v15);
    objc_msgSend(v3, "appendString:", CFSTR(".html"));

  }
  return v3;
}

void sub_18FC26354(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC26754(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *CalXPCErrorTypeAsString(void *a1)
{
  id v1;
  void *v2;
  const char *string;
  void *v4;
  void *v5;
  __CFString *v6;

  v1 = a1;
  v2 = v1;
  if (v1 == (id)MEMORY[0x1E0C81260])
  {
    v6 = CFSTR("XPC_ERROR_CONNECTION_INVALID");
  }
  else if (v1 == (id)MEMORY[0x1E0C81258])
  {
    v6 = CFSTR("XPC_ERROR_CONNECTION_INTERRUPTED");
  }
  else if (v1 == (id)MEMORY[0x1E0C81288])
  {
    v6 = CFSTR("XPC_ERROR_TERMINATION_IMMINENT");
  }
  else if (v1 && (string = xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E0C81270])) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = CFSTR("UNKNOWN");

  }
  else
  {
    v6 = CFSTR("UNKNOWN");
  }

  return v6;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

double EKAbsoluteTimeGetAbsoluteTimeInTimeZone(void *a1, void *a2, double a3)
{
  id v5;
  unint64_t GregorianDate;
  uint64_t v7;
  double AbsoluteTime;

  v5 = a2;
  GregorianDate = EKAbsoluteTimeGetGregorianDate(a1, a3);
  AbsoluteTime = EKGregorianDateGetAbsoluteTime(GregorianDate, v7, v5);

  return AbsoluteTime;
}

uint64_t EKAbsoluteTimeGetGregorianDate(void *a1, double a2)
{
  double v3;
  _QWORD v5[2];

  if (a1)
    objc_msgSend(a1, "secondsFromGMTForAbsoluteTime:", a2);
  else
    v3 = 0.0;
  v5[0] = 0;
  v5[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v5, v3 + a2);
  return v5[0];
}

double EKGregorianDateGetAbsoluteTime(unint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = a3;
  v6 = __EKAbsoluteFromYMD((int)a1, (int)(a1 >> 8) >> 24, (int)(a1 >> 16) >> 24);
  v7 = v6;
  if (v5)
  {
    v8 = v6 + -1.0;
    objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v6 + -1.0);
    v10 = v9;
    v11 = v7 - v9;
    objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v7 - v9);
    if (v10 >= v12)
    {
      v14 = v12;
      objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v8);
      v10 = v15;
    }
    else
    {
      objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v11 + -1.0);
      v14 = v13;
    }
    v7 = v11 + v10 - v14;
  }
  v16 = (double)((uint64_t)a1 >> 56) * 60.0 + (double)((int)(a1 >> 24) >> 24) * 3600.0 + *(double *)&a2 + v7;
  if (v5)
  {
    v17 = v7 + -1.0;
    objc_msgSend(v5, "nextDaylightSavingTimeTransitionAfterAbsoluteTime:", v7 + -1.0);
    if (v16 > v18)
    {
      v19 = v18;
      objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v17);
      v21 = v20;
      objc_msgSend(v5, "secondsFromGMTForAbsoluteTime:", v16);
      v23 = v16 + v21 - v22;
      if (v23 >= v19)
        v16 = v23;
    }
  }

  return v16;
}

double EKGregorianDateGetAbsoluteTimeWithCFTimeZone(unint64_t a1, uint64_t a2)
{
  void *v4;
  double AbsoluteTime;

  +[EKTimeZone timeZoneWithNSTimeZone:](EKTimeZone, "timeZoneWithNSTimeZone:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AbsoluteTime = EKGregorianDateGetAbsoluteTime(a1, a2, v4);

  return AbsoluteTime;
}

double __EKAbsoluteFromYMD(unint64_t a1, int a2, int a3)
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  signed int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 - 1801 > 0x12A)
  {
    v7 = ((10923 * (a2 - 14)) >> 17) + ((10923 * (a2 - 14)) >> 31);
    v8 = a1 + v7;
    v9 = 1461 * v8 + 7012803;
    if ((uint64_t)(1461 * v8 + 7012800) >= 0)
      v9 = 1461 * v8 + 7012800;
    v10 = 715827883 * (367 * (a2 - 12 * v7) - 734);
    v6 = (double)((v9 >> 2)
                + a3
                - 3 * ((uint64_t)(v8 + 4900) / 100) / 4
                + (int)((v10 >> 33) + ((unint64_t)v10 >> 63))
                - 32075);
    v5 = -0.5;
  }
  else
  {
    v3 = 367 * a1
       + a3
       + 275 * a2 / 9
       - ((7 * (a1 + (int)(((10923 * (a2 + 9)) >> 17) + ((10923 * (a2 + 9)) >> 31)))) >> 2);
    if (a1 > 0x76C)
    {
      v6 = (double)v3;
      v5 = 1721013.5;
    }
    else
    {
      v4 = -0.5;
      v5 = 0.5;
      if ((double)(uint64_t)(100 * a1 + a2) + -190002.5 >= 0.0)
        v4 = 0.5;
      v6 = (double)v3 + 1721013.5 - v4;
    }
  }
  return (v6 + v5 + -2451910.5) * *(double *)&CalTimeInterval_OneDayInSeconds;
}

double EKGregorianComponentsGetAbsoluteTime(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v3 = a2;
  v4 = a1;
  v5 = __EKAbsoluteFromYMD(objc_msgSend(v4, "year"), (char)objc_msgSend(v4, "month"), (char)objc_msgSend(v4, "day"));
  v6 = (double)objc_msgSend(v4, "hour");
  v7 = (double)objc_msgSend(v4, "minute") * 60.0 + v6 * 3600.0;
  v8 = objc_msgSend(v4, "second");

  v9 = v5 + v7 + (double)v8;
  if (v3)
  {
    objc_msgSend(v3, "secondsFromGMTForAbsoluteTime:", v9);
    objc_msgSend(v3, "secondsFromGMTForAbsoluteTime:", v9 - v10);
    v9 = v9 - v11;
  }

  return v9;
}

uint64_t AbsoluteToYMDHMS(uint64_t result, double a2)
{
  double v2;
  double v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v2 = a2 / *(double *)&CalTimeInterval_OneDayInSeconds + 2451910.5 + 0.5;
  v3 = (double)(uint64_t)v2;
  v4 = (uint64_t)((v3 + -1867216.25) / 36524.25);
  v5 = v4 + 3;
  if (v4 >= 0)
    v5 = (uint64_t)((v3 + -1867216.25) / 36524.25);
  v6 = (uint64_t)v2 + v4 - (int)(v5 >> 2) + 1525;
  v7 = (uint64_t)(((double)v6 + -122.1) / 365.25);
  v8 = v2 - v3;
  v9 = v6 - (uint64_t)((double)v7 * 365.25);
  v10 = (uint64_t)((double)v9 / 30.6001);
  v11 = -13;
  if (v10 < 14)
    v11 = -1;
  v12 = v11 + v10;
  if (v12 >= 3)
    v13 = -4716;
  else
    v13 = -4715;
  *(_DWORD *)result = v13 + v7;
  *(_BYTE *)(result + 4) = v12;
  *(_BYTE *)(result + 5) = (uint64_t)(v8 + (double)(v9 - (int)((double)(uint64_t)((double)v9 / 30.6001) * 30.6001)));
  _Q1 = vrndmq_f64(vdivq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0), (float64x2_t)xmmword_18FC71090));
  _D4 = 0x404E000000000000;
  __asm { FMLS            D0, D4, V1.D[1] }
  *(int32x2_t *)&_Q1.f64[0] = vcvt_s32_f32(vcvt_f32_f64(vrndmq_f64(vmlsq_f64(_Q1, (float64x2_t)xmmword_18FC710A0, vrndmq_f64(vdivq_f64(_Q1, (float64x2_t)xmmword_18FC710A0))))));
  *(int32x2_t *)&_Q1.f64[0] = vadd_s32((int32x2_t)vand_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&_Q1.f64[0]), (int8x8_t)0x3C00000018), *(int32x2_t *)&_Q1.f64[0]);
  *(_BYTE *)(result + 7) = BYTE4(_Q1.f64[0]);
  *(_BYTE *)(result + 6) = LOBYTE(_Q1.f64[0]);
  if (_D0 < 0.0)
    _D0 = _D0 + 60.0;
  if (_D0 == 0.0)
    _D0 = 0.0;
  *(double *)(result + 8) = _D0;
  return result;
}

uint64_t EKAbsoluteTimeGetDayOfWeek(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "secondsFromGMTForAbsoluteTime:", a2);
  else
    v5 = 0.0;
  v6 = vcvtmd_s64_f64((v5 + a2) / *(double *)&CalTimeInterval_OneDayInSeconds);
  v7 = ((unint64_t)~v6 * (unsigned __int128)0x2492492492492493uLL) >> 64;
  v8 = (~v6 - 7 * ((v7 + ((unint64_t)(~v6 - v7) >> 1)) >> 2)) ^ 7;
  if (v6 >= 0)
    v9 = v6 % 7uLL + 1;
  else
    LODWORD(v9) = v8;
  if (v9 <= 6)
    v10 = (v9 + 1);
  else
    v10 = 1;

  return v10;
}

uint64_t EKAbsoluteTimeGetDayOfYear(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  _BOOL8 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v3 = a1;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "secondsFromGMTForAbsoluteTime:", a2);
  else
    v5 = 0.0;
  v11[0] = 0;
  v11[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v11, (double)(uint64_t)(v5 + a2));
  v6 = 0;
  if ((v11[0] & 3) == 0)
  {
    HIDWORD(v7) = -1030792151 * LODWORD(v11[0]) + 85899344;
    LODWORD(v7) = HIDWORD(v7);
    if ((v7 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v8) = -1030792151 * LODWORD(v11[0]) + 85899344;
      LODWORD(v8) = HIDWORD(v8);
      v6 = (v8 >> 4) < 0xA3D70B;
    }
    else
    {
      v6 = 1;
    }
  }
  v9 = SBYTE5(v11[0]) + daysBeforeMonth[16 * v6 + SBYTE4(v11[0])];

  return v9;
}

uint64_t EKAbsoluteTimeGetWeekOfYear(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  double v12;
  float v13;
  int v14;
  unsigned int v15;
  unint64_t v16;
  _BOOL8 v17;
  int v18;
  _QWORD v20[2];

  v3 = a1;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "secondsFromGMTForAbsoluteTime:", a2);
  else
    v5 = 0.0;
  v20[0] = 0;
  v20[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v20, (double)(uint64_t)floor((v5 + a2) / *(double *)&CalTimeInterval_OneDayInSeconds));
  v6 = SLODWORD(v20[0]);
  v7 = __EKAbsoluteFromYMD(SLODWORD(v20[0]), 1, 1);
  *(float *)&v7 = floor(v7 - floor(v7 / 7.0) * 7.0);
  v8 = (((int)*(float *)&v7 >> 31) & 7) + (int)*(float *)&v7;
  v9 = SBYTE4(v20[0]);
  v10 = SBYTE5(v20[0]);
  if (SBYTE4(v20[0]) == 1 && SBYTE5(v20[0]) <= 3)
  {
    if (v8 == 4 || SBYTE5(v20[0]) <= 2 && v8 == 5 || SBYTE5(v20[0]) < 2 && v8 == 6)
    {
      v11 = 53;
      goto LABEL_24;
    }
  }
  else if (SBYTE4(v20[0]) == 12 && SBYTE5(v20[0]) >= 29)
  {
    v11 = 1;
    v12 = __EKAbsoluteFromYMD(v6 + 1, 1, 1);
    v13 = floor(v12 - floor(v12 / 7.0) * 7.0);
    v14 = ((int)v13 >> 31) & 7;
    if ((int)v13 + v14 == 3 || v10 >= 0x1E && (int)v13 + v14 == 2)
      goto LABEL_24;
    if (v10 >= 0x1F && (int)v13 + v14 == 1)
      goto LABEL_24;
  }
  HIDWORD(v16) = -1030792151 * v6 + 85899344;
  LODWORD(v16) = HIDWORD(v16);
  v15 = v16 >> 2;
  LODWORD(v16) = HIDWORD(v16);
  v17 = (v16 >> 4) < 0xA3D70B;
  if (v15 > 0x28F5C28)
    v17 = 1;
  if ((v6 & 3) != 0)
    v17 = 0;
  v18 = (unint64_t)(2454267027 * (int)(v8 - 10 + v10 + daysBeforeMonth[16 * v17 + v9] - 7 * ((v8 - 10) / 7) + 2)) >> 32;
  v11 = (v18 >> 2) + (v18 >> 31) + 1;
LABEL_24:

  return v11;
}

uint64_t EKAbsoluteTimeGetGregorianDateForWeekStart(void *a1, uint64_t a2, _QWORD *a3, double a4)
{
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  double v11;
  uint64_t GregorianDate;
  __int128 v14;
  int v15;
  uint64_t v16;
  int v17;

  v7 = a1;
  v8 = EKAbsoluteTimeGetDayOfWeek(v7, a4) - 1;
  v9 = 7;
  if (a2 - 1 <= v8)
    v9 = 0;
  v10 = v8 - a2 + v9 + 1;
  if (a3)
    *a3 = v10;
  v16 = 0;
  v15 = 0;
  v17 = 0;
  *(_QWORD *)&v14 = 0;
  *((_QWORD *)&v14 + 1) = -v10;
  v11 = EKAbsoluteTimeAddGregorianDuration(v7, &v14, a4);
  GregorianDate = EKAbsoluteTimeGetGregorianDate(v7, v11);

  return GregorianDate & 0xFFFFFFFFFFFFLL;
}

double EKAbsoluteTimeAddGregorianDuration(void *a1, _OWORD *a2, double a3)
{
  id v5;
  unint64_t GregorianDate;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  double AbsoluteTime;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  unint64_t v18;
  double v19;
  double v20;
  CFGregorianUnits v22;

  v5 = a1;
  GregorianDate = EKAbsoluteTimeGetGregorianDate(v5, a3);
  v7 = a2[1];
  *(_OWORD *)&v22.years = *a2;
  *(_OWORD *)&v22.minutes = v7;
  v9 = EKAddGregorianUnits(GregorianDate, v8, (double *)&v22.years);
  v11 = *(double *)&v10;
  AbsoluteTime = EKGregorianDateGetAbsoluteTime(v9, v10, v5);
  v13 = a2[1];
  *(_OWORD *)&v22.years = *a2;
  *(_OWORD *)&v22.minutes = v13;
  v14 = CFAbsoluteTimeAddGregorianUnits(0.0, 0, &v22);
  if (v14 < 0.0)
  {
    v15 = v14 + a3;
    objc_msgSend(v5, "nextDaylightSavingTimeTransitionAfterAbsoluteTime:", v14 + a3);
    if (v16 <= a3 && v16 > v15)
    {
      v18 = EKAbsoluteTimeGetGregorianDate(v5, AbsoluteTime);
      v20 = v19
          - v11
          + (float)((float)(((int)(v18 >> 24) >> 24) - ((int)(v9 >> 24) >> 24)) * 3600.0)
          + (double)((SHIDWORD(v18) >> 24) - (SHIDWORD(v9) >> 24)) * 60.0;
      if (v20 <= 0.1)
        v20 = 0.0;
      AbsoluteTime = AbsoluteTime - v20;
    }
  }

  return AbsoluteTime;
}

unint64_t EKAddGregorianUnits(unint64_t a1, uint64_t a2, double *a3)
{
  int v3;
  uint64_t v4;
  double v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int i;
  _BOOL4 v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  _BOOL4 v24;
  unsigned int v25;
  unint64_t v26;

  v3 = *((_DWORD *)a3 + 3) + ((int)(a1 >> 24) >> 24);
  v4 = *((_DWORD *)a3 + 4) + ((uint64_t)a1 >> 56);
  v5 = a3[3] + *(double *)&a2;
  if (v5 > 59.0 || v5 < 0.0)
    v4 = ((int)v5 / 60 + v4);
  v6 = (int)(a1 >> 16) >> 24;
  if (v4 >= 0x3C)
  {
    v3 += (int)v4 / 60;
    v4 = ((int)v4 % 60);
  }
  v7 = *((_DWORD *)a3 + 1) + ((int)(a1 >> 8) >> 24);
  if (v3 >= 0x18)
  {
    *((_DWORD *)a3 + 2) += v3 / 24;
    v3 %= 24;
    v6 += v3 >> 31;
    if (v3 < 0)
      LOBYTE(v3) = v3 + 24;
  }
  v8 = *(_DWORD *)a3;
  if (v7 < 13)
  {
    v11 = v8 + a1;
  }
  else
  {
    if (v7 >= 24)
      v9 = 24;
    else
      v9 = v7;
    v10 = (v7 - v9 + 11) / 0xCu;
    v7 = v7 - 12 * v10 - 12;
    v11 = v8 + a1 + v10 + 1;
  }
  if (v7 <= 0)
  {
    if (v7 <= -11)
      v12 = -11;
    else
      v12 = v7;
    if (v7 >= -11)
      v13 = v7;
    else
      v13 = v7 + 1;
    v14 = (v12 - v13) / 0xCu;
    if (v7 < -11)
      ++v14;
    v7 += 12 * v14 + 12;
    v11 += ~v14;
  }
  if ((v11 & 3) != 0)
  {
    v15 = 0;
  }
  else
  {
    HIDWORD(v16) = -1030792151 * v11 + 85899344;
    LODWORD(v16) = HIDWORD(v16);
    if ((v16 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v17) = -1030792151 * v11 + 85899344;
      LODWORD(v17) = HIDWORD(v17);
      v15 = (v17 >> 4) < 0xA3D70B;
    }
    else
    {
      v15 = 1;
    }
  }
  v18 = daysInMonth[16 * v15 + v7];
  if (v6 >= v18)
    v6 = v18;
  for (i = v6 + *((_DWORD *)a3 + 2); i > v18; v18 = daysInMonth[16 * v20 + v7])
  {
    if (v7 <= 11)
    {
      ++v7;
    }
    else
    {
      ++v11;
      v7 = 1;
    }
    if ((v11 & 3) != 0)
    {
      v20 = 0;
    }
    else
    {
      HIDWORD(v22) = 85899344 - 1030792151 * v11;
      LODWORD(v22) = HIDWORD(v22);
      v21 = v22 >> 2;
      LODWORD(v22) = HIDWORD(v22);
      v20 = (v22 >> 4) < 0xA3D70B;
      if (v21 > 0x28F5C28)
        v20 = 1;
    }
    i -= v18;
  }
  if (i <= 0)
  {
    do
    {
      v23 = v7 < 2;
      if (v7 >= 2)
        --v7;
      else
        v7 = 12;
      v11 -= v23;
      if ((v11 & 3) != 0)
      {
        v24 = 0;
      }
      else
      {
        HIDWORD(v26) = 85899344 - 1030792151 * v11;
        LODWORD(v26) = HIDWORD(v26);
        v25 = v26 >> 2;
        LODWORD(v26) = HIDWORD(v26);
        v24 = (v26 >> 4) < 0xA3D70B;
        if (v25 > 0x28F5C28)
          v24 = 1;
      }
      i += daysInMonth[16 * v24 + v7];
    }
    while (i < 1);
  }
  return (v4 << 56) | ((unint64_t)v3 << 48) | ((unint64_t)i << 40) | ((unint64_t)v7 << 32) | v11;
}

double EKAbsoluteTimeAddGregorianUnits(void *a1, uint64_t a2, double a3)
{
  id v5;
  unint64_t GregorianDate;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int i;
  _BOOL4 v21;
  unsigned int v22;
  unint64_t v23;
  int v24;
  _BOOL4 v25;
  unsigned int v26;
  unint64_t v27;
  double v28;

  v5 = a1;
  GregorianDate = EKAbsoluteTimeGetGregorianDate(v5, a3);
  v8 = *(_DWORD *)a2 + GregorianDate;
  v9 = *(_DWORD *)(a2 + 4) + ((int)(GregorianDate >> 8) >> 24);
  if (v9 >= 13)
  {
    if (v9 >= 24)
      v10 = 24;
    else
      v10 = *(_DWORD *)(a2 + 4) + ((int)(GregorianDate >> 8) >> 24);
    v11 = (v9 - v10 + 11) / 0xCu;
    v9 = v9 - 12 * v11 - 12;
    v8 += v11 + 1;
  }
  if (v9 <= 0)
  {
    if (v9 <= -11)
      v12 = -11;
    else
      v12 = v9;
    if (v9 >= -11)
      v13 = v9;
    else
      v13 = v9 + 1;
    v14 = (v12 - v13) / 0xCu;
    if (v9 < -11)
      ++v14;
    v9 += 12 * v14 + 12;
    v8 += ~v14;
  }
  v15 = (int)(GregorianDate >> 16) >> 24;
  if ((v8 & 3) != 0)
  {
    v16 = 0;
  }
  else
  {
    HIDWORD(v17) = -1030792151 * v8 + 85899344;
    LODWORD(v17) = HIDWORD(v17);
    if ((v17 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v18) = -1030792151 * v8 + 85899344;
      LODWORD(v18) = HIDWORD(v18);
      v16 = (v18 >> 4) < 0xA3D70B;
    }
    else
    {
      v16 = 1;
    }
  }
  v19 = daysInMonth[16 * v16 + v9];
  if (v15 >= v19)
    v15 = v19;
  for (i = v15 + *(_DWORD *)(a2 + 8); i > v19; v19 = daysInMonth[16 * v21 + v9])
  {
    if (v9 <= 11)
    {
      ++v9;
    }
    else
    {
      ++v8;
      v9 = 1;
    }
    if ((v8 & 3) != 0)
    {
      v21 = 0;
    }
    else
    {
      HIDWORD(v23) = 85899344 - 1030792151 * v8;
      LODWORD(v23) = HIDWORD(v23);
      v22 = v23 >> 2;
      LODWORD(v23) = HIDWORD(v23);
      v21 = (v23 >> 4) < 0xA3D70B;
      if (v22 > 0x28F5C28)
        v21 = 1;
    }
    i -= v19;
  }
  if (i <= 0)
  {
    do
    {
      v24 = v9 < 2;
      if (v9 >= 2)
        --v9;
      else
        v9 = 12;
      v8 -= v24;
      if ((v8 & 3) != 0)
      {
        v25 = 0;
      }
      else
      {
        HIDWORD(v27) = 85899344 - 1030792151 * v8;
        LODWORD(v27) = HIDWORD(v27);
        v26 = v27 >> 2;
        LODWORD(v27) = HIDWORD(v27);
        v25 = (v27 >> 4) < 0xA3D70B;
        if (v26 > 0x28F5C28)
          v25 = 1;
      }
      i += daysInMonth[16 * v25 + v9];
    }
    while (i < 1);
  }
  v28 = *(double *)(a2 + 24)
      + EKGregorianDateGetAbsoluteTime(GregorianDate & 0xFFFF000000000000 | ((unint64_t)i << 40) | ((unint64_t)v9 << 32) | v8, v7, v5)+ (double)*(int *)(a2 + 12) * 3600.0+ (double)*(int *)(a2 + 16) * 60.0;

  return v28;
}

void EKAbsoluteTimeGetDifferenceAsGregorianUnits(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  id v9;
  uint64_t v10;
  int v11;
  double v12;
  int v13;
  double v14;
  __int128 v15;
  BOOL v16;
  double v17;
  id v18;
  _OWORD v19[2];

  v9 = a1;
  v10 = 0;
  if (a5 < a4)
    v11 = 1;
  else
    v11 = -1;
  *(_OWORD *)a3 = 0uLL;
  *(_OWORD *)(a3 + 16) = 0uLL;
  v12 = a5;
  v18 = v9;
  do
  {
    if (((1 << v10) & a2) != 0)
    {
      v13 = (int)((a4 - v12) / (double)dword_18FC71110[v10]);
      *(_DWORD *)(a3 + 4 * v10) = -3 * v11 + v13;
      do
      {
        v14 = v12;
        *(_DWORD *)(a3 + 4 * v10) = -2 * v11 + v13;
        v15 = *(_OWORD *)(a3 + 16);
        v19[0] = *(_OWORD *)a3;
        v19[1] = v15;
        v12 = EKAbsoluteTimeAddGregorianUnits(v18, (uint64_t)v19, a5);
        v9 = v18;
        v16 = v12 <= a4;
        if (a5 >= a4)
          v16 = v12 >= a4;
        v13 += v11;
      }
      while (v16);
      *(_DWORD *)(a3 + 4 * v10) = -4 * v11 + v13;
      v12 = v14;
    }
    ++v10;
  }
  while (v10 != 5);
  if ((a2 & 0x20) == 0 || (v17 = a4 - v12, *(double *)(a3 + 24) = v17, v17 == 0.0))
    *(_QWORD *)(a3 + 24) = 0;

}

id EKCachedTimeZoneWithName(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v7;
  void *v8;

  v1 = a1;
  if (EKCachedTimeZoneWithName_onceToken != -1)
    dispatch_once(&EKCachedTimeZoneWithName_onceToken, &__block_literal_global_6);
  objc_msgSend((id)EKCachedTimeZoneWithName_timeZoneCache, "objectForKey:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      || (objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", v1),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend((id)EKCachedTimeZoneWithName_timeZoneCache, "setObject:forKey:", v3, v1);
      goto LABEL_10;
    }
    v7 = (void *)EKCachedTimeZoneWithName_timeZoneCache;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v1);

    goto LABEL_6;
  }
  v3 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  if (v5)
  {

LABEL_6:
    v3 = 0;
  }
LABEL_10:

  return v3;
}

id EKDateComponentsGetDate(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v4 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  _EKSharedGregorianCalendarLock();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __EKDateComponentsGetDate_block_invoke;
  block[3] = &unk_1E2A843F0;
  v12 = v4;
  v13 = &v14;
  v11 = v3;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void sub_18FC29924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC2A1B8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;

  if (a2 == 1)
  {
    v4 = objc_begin_catch(exception_object);
    objc_msgSend(v3, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:].cold.2((uint64_t)v4, v5, v6);

    objc_end_catch();
    if (!v2)
      JUMPOUT(0x18FC2A168);
    JUMPOUT(0x18FC2A17CLL);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_18FC2D94C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return v0;
}

void sub_18FC2E90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CalRedactURLString(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  void *v44;
  __CFString *v45;
  unint64_t v46;
  unint64_t v48;
  unint64_t v49;
  BOOL v50;
  int v51;
  _BOOL4 v52;
  __CFString *v53;
  __CFString *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  id v60;
  void *v61;
  id obj;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[134];
  _WORD v77[17];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
    goto LABEL_109;
  }
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("tel:")) & 1) != 0)
  {
    v3 = CFSTR("tel:<private>");
    goto LABEL_109;
  }
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("mailto:")) & 1) != 0)
  {
    v3 = CFSTR("mailto:<private>");
    goto LABEL_109;
  }
  v4 = 0x1E0CB3000uLL;
  v61 = v2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("urn:")))
  {
    v5 = v2;
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v73;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v73 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v10);
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("urn")) & 1) != 0
            || (objc_msgSend(v11, "isEqualToString:", CFSTR("x-uid")) & 1) != 0
            || objc_msgSend(v11, "isEqualToString:", CFSTR("uuid")))
          {
            v12 = v11;
          }
          else
          {
            uuidWithUnknownExtensionsRedacted(v11);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (v12)
            v13 = v12;
          else
            v13 = CFSTR("<private>");
          -[__CFString appendString:](v3, "appendString:", v13);
          -[__CFString appendString:](v3, "appendString:", CFSTR(":"));

          ++v10;
        }
        while (v8 != v10);
        v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        v8 = v14;
      }
      while (v14);
    }
    if (-[__CFString length](v3, "length"))
      -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", -[__CFString length](v3, "length") - 1, 1);

    goto LABEL_108;
  }
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("/"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (getPublicURLParts_onceToken != -1)
    dispatch_once(&getPublicURLParts_onceToken, &__block_literal_global_11);
  v67 = (id)getPublicURLParts_publicURLParts;
  v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (!v18)
  {

    v34 = 0;
LABEL_51:
    if (-[__CFString length](v3, "length"))
      -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", -[__CFString length](v3, "length") - 1, 1);
    if (!v34)
      goto LABEL_107;
    goto LABEL_54;
  }
  v19 = v18;
  v63 = 0;
  v20 = 0;
  v21 = *(_QWORD *)v69;
  do
  {
    v22 = v17;
    v23 = 0;
    v24 = v20;
    do
    {
      if (*(_QWORD *)v69 != v21)
        objc_enumerationMutation(v22);
      v25 = *(id *)(*((_QWORD *)&v68 + 1) + 8 * v23);
      if (v16 == v25)
      {
        v27 = objc_msgSend(v16, "rangeOfString:", CFSTR("?"));
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v26 = v16;
        }
        else
        {
          v28 = v27;
          objc_msgSend(v16, "substringFromIndex:", v27 + 1);
          v29 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "substringToIndex:", v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = (void *)v29;
        }
      }
      else
      {
        v26 = v25;
      }
      objc_msgSend(v26, "lowercaseString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v67, "containsObject:", v30);

      if (v31)
      {
        v32 = v26;
      }
      else
      {
        uuidWithUnknownExtensionsRedacted(v26);
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;
      v20 = v32 == 0;
      if (v32)
      {
        if (v24)
          -[__CFString appendString:](v3, "appendString:", CFSTR("<private>/"));
        -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@/"), v33);
      }

      ++v23;
      v24 = v20;
    }
    while (v19 != v23);
    v17 = v22;
    v19 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  }
  while (v19);

  if (v33)
  {
    v34 = v63;
    v4 = 0x1E0CB3000;
    goto LABEL_51;
  }
  -[__CFString appendString:](v3, "appendString:", CFSTR("<private>"));
  v34 = v63;
  v4 = 0x1E0CB3000;
  if (!v63)
    goto LABEL_107;
LABEL_54:
  v35 = v34;
  v36 = (void *)objc_msgSend(objc_alloc(*(Class *)(v4 + 1952)), "initWithCapacity:", objc_msgSend(v35, "length"));
  objc_msgSend(v35, "componentsSeparatedByString:", CFSTR("&"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v37;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (!v38)
  {
LABEL_101:
    if (objc_msgSend(v36, "length"))
      objc_msgSend(v36, "deleteCharactersInRange:", objc_msgSend(v36, "length") - 1, 1);
    goto LABEL_106;
  }
  v39 = v38;
  v64 = v34;
  v65 = v36;
  v60 = v17;
  v40 = 0;
  v66 = *(_QWORD *)v73;
  do
  {
    v41 = 0;
    v42 = v40;
    do
    {
      if (*(_QWORD *)v73 != v66)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v41);
      objc_msgSend(v43, "lowercaseString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "isEqualToString:", CFSTR("action=split")))
        v45 = v43;
      else
        v45 = 0;
      if (!objc_msgSend(v44, "hasPrefix:", CFSTR("rid=")))
        goto LABEL_89;
      v46 = objc_msgSend(v44, "length");
      if (v46 > 0x14 || ((1 << v46) & 0x181000) == 0)
      {
LABEL_87:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rid=<malformed date or not-a-date, %lu characters>"), objc_msgSend(v43, "length") - 4);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_88;
      }
      v48 = v46 - 4;
      objc_msgSend(v44, "getCharacters:range:", v77, 4, v46 - 4);
      v49 = 0;
      v77[v48] = 0;
      v50 = 1;
      while (1)
      {
        v51 = (unsigned __int16)v77[v49];
        if ((v51 - 48) < 0xA)
          goto LABEL_74;
        if ((_DWORD)v49 != 15)
          break;
        if (v51 != 122)
        {
LABEL_76:
          if (v77[v49])
            goto LABEL_87;
LABEL_77:
          v52 = 1;
          if (!v50)
            goto LABEL_87;
          goto LABEL_78;
        }
LABEL_74:
        v50 = v49++ < 0x10;
        if (v49 == 17)
          goto LABEL_77;
      }
      if ((_DWORD)v49 == 8)
      {
        if (v51 != 116)
          goto LABEL_76;
        goto LABEL_74;
      }
      v52 = (_DWORD)v49 == 16 && v51 == 0;
      if (!v50)
        goto LABEL_87;
LABEL_78:
      if (!v52)
        goto LABEL_87;
      v53 = v43;
LABEL_88:
      v55 = v53;

      v45 = v55;
LABEL_89:
      if (objc_msgSend(v44, "hasPrefix:", CFSTR("uid=")))
      {
        objc_msgSend(v43, "substringFromIndex:", 4);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        uuidWithUnknownExtensionsRedacted(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uid=%@"), v57);
          v58 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = CFSTR("uid=<private>");
        }

        v45 = (__CFString *)v58;
      }
      v40 = v45 == 0;
      if (v45)
      {
        if (v42)
          objc_msgSend(v65, "appendString:", CFSTR("<private>&"));
        objc_msgSend(v65, "appendFormat:", CFSTR("%@&"), v45);
      }

      ++v41;
      v42 = v45 == 0;
    }
    while (v41 != v39);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  }
  while (v39);
  v17 = v60;
  v34 = v64;
  v36 = v65;
  if (v45)
    goto LABEL_101;
  objc_msgSend(v65, "appendString:", CFSTR("<private>"));
LABEL_106:

  -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("?%@"), v36);
LABEL_107:

LABEL_108:
  v2 = v61;
LABEL_109:

  return v3;
}

id uuidWithUnknownExtensionsRedacted(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v15;
  _WORD v17[70];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if ((unint64_t)(v3 - 3) < 0xFFFFFFFFFFFFFFFELL)
  {
    v4 = 0;
    goto LABEL_28;
  }
  if (v3 != 2)
  {
    v6 = 0;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "compare:options:", CFSTR("xml"), 1))
    goto LABEL_8;
  v7 = objc_msgSend(v6, "compare:options:", CFSTR("ics"), 1) != 0;
LABEL_9:
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v4 = 0;
  if ((unint64_t)(v9 - 71) >= 0xFFFFFFFFFFFFFFD9)
  {
    v10 = v9;
    objc_msgSend(v8, "getCharacters:", v17);
    v11 = 0;
    do
    {
      v12 = (unsigned __int16)v17[v11];
      if (((v12 - 65) > 0x25 || ((1 << (v12 - 65)) & 0x3F0000003FLL) == 0)
        && v12 != 45
        && (v12 - 48) > 9)
      {
        v4 = 0;
        goto LABEL_27;
      }
      ++v11;
    }
    while (v10 != v11);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.<private>"), v8);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v1;
    }
    v4 = v15;
  }
LABEL_27:

LABEL_28:
  return v4;
}

void __getPublicURLParts_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2A9B5F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getPublicURLParts_publicURLParts;
  getPublicURLParts_publicURLParts = v0;

}

BOOL UnzipArchive(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  BOMCopierNew();
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "fileSystemRepresentation");

  v6 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "fileSystemRepresentation");

  v7 = *MEMORY[0x1E0C9AE50];
  v10[0] = CFSTR("extractPKZip");
  v10[1] = CFSTR("sequesterResources");
  v11[0] = v7;
  v11[1] = v7;
  v10[2] = CFSTR("copyResources");
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return (_DWORD)v5 == 0;
}

id CalTemporaryDirectory()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "CalTemporaryDirectoryAppropriateForURL:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void fatalBomError(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("*** Couldn't create archive: %@\n"), v2);

}

void fatalBomFileError(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void fatalBomFileError(BOMCopier, const char *, int)");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = __error();
  objc_msgSend(v4, "stringWithUTF8String:", strerror(*v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("*** %@ Couldn't create archive for file %@: %@\n"), v7, v3, v6);

}

id GetStaticAutoUpdatingCurrentLocale()
{
  if (GetStaticAutoUpdatingCurrentLocale_onceToken != -1)
    dispatch_once(&GetStaticAutoUpdatingCurrentLocale_onceToken, &__block_literal_global_12);
  return (id)GetStaticAutoUpdatingCurrentLocale_sLocale;
}

uint64_t CurrentLocaleExpectsSurnameFirst()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  if (CurrentLocaleExpectsSurnameFirst_onceToken != -1)
    dispatch_once(&CurrentLocaleExpectsSurnameFirst_onceToken, &__block_literal_global_1_0);
  v0 = (void *)CurrentLocaleExpectsSurnameFirst_sSurnameFirstCountries;
  GetStaticAutoUpdatingCurrentLocale();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "containsObject:", v2);

  return v3;
}

uint64_t CurrentLocaleExpectsMultipleFamilyNames()
{
  uint64_t v0;
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ca"), CFSTR("es"), 0);
    v1 = (void *)CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages;
    CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages = v0;

  }
  if ((CurrentLocaleExpectsSurnameFirst() & 1) != 0)
    return 0;
  v3 = (void *)CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages;
  GetStaticAutoUpdatingCurrentLocale();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  return v6;
}

id DisplayNameStringForIdentityWithProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    if (CurrentLocaleExpectsSurnameFirst())
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v4, v3);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "length") && !objc_msgSend(v4, "length"))
  {
    v6 = v3;
LABEL_14:
    v5 = v6;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "length") && !objc_msgSend(v3, "length"))
  {
    v6 = v4;
    goto LABEL_14;
  }
  v5 = 0;
LABEL_15:

  return v5;
}

void sub_18FC3371C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  int v11;

  if (v11)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_18FC33B9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC33CF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC33E30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _acquireArrayFromDictionary(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a2;
  v4 = *a1;
  if (!*a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *a1;
    *a1 = (id)v5;

    v4 = *a1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a1, "setObject:forKeyedSubscript:", v7, v3);
  }

  return v7;
}

id _acquireSetFromDictionary(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a2;
  v4 = *a1;
  if (!*a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *a1;
    *a1 = (id)v5;

    v4 = *a1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a1, "setObject:forKeyedSubscript:", v7, v3);
  }

  return v7;
}

id _acquireArrayFromTable(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a2;
  v4 = *a1;
  if (!*a1)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    v6 = *a1;
    *a1 = (id)v5;

    v4 = *a1;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a1, "setObject:forKey:", v7, v3);
  }

  return v7;
}

void sub_18FC348C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC349C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18FC34AE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC34D60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CalAnalyticsSendEvent(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(CFSTR("com.apple.calendar."), "stringByAppendingString:", a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

uint64_t CalAnalyticsSendEventLazy(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v8;

  v3 = a2;
  objc_msgSend(CFSTR("com.apple.calendar."), "stringByAppendingString:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v5 = v3;
  v6 = AnalyticsSendEventLazy();

  return v6;
}

uint64_t CalAnalyticsIsEventUsed(uint64_t a1)
{
  void *v1;
  uint64_t IsEventUsed;

  objc_msgSend(CFSTR("com.apple.calendar."), "stringByAppendingString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

double CalAnalyticsTimeIntervalFromMachTimes(uint64_t a1, uint64_t a2)
{
  if (CalAnalyticsTimeIntervalFromMachTimes_onceToken != -1)
    dispatch_once(&CalAnalyticsTimeIntervalFromMachTimes_onceToken, &__block_literal_global_14);
  return *(double *)&CalAnalyticsTimeIntervalFromMachTimes_timebaseFactor * (double)(unint64_t)(a2 - a1);
}

void sub_18FC36214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void CalendarFoundationPerformBlockOnSharedContactStore(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v1 = a1;
  +[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (CalendarFoundationPerformBlockOnSharedContactStore_onceToken != -1)
    dispatch_once(&CalendarFoundationPerformBlockOnSharedContactStore_onceToken, &__block_literal_global_16);
  v4 = CalendarFoundationPerformBlockOnSharedContactStore__contactStoreQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke_2;
  block[3] = &unk_1E2A84808;
  v8 = v3;
  v9 = v1;
  v5 = v3;
  v6 = v1;
  dispatch_sync(v4, block);

}

void sub_18FC36F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC370B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC3711C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC38388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC385C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC387EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC38FC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_18FC39950(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC39A48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC39B70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC39CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC39E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E2A84A98;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MGGetBoolAnswer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18FC3B19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_18FC3C02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18FC3DB84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CalDateTimeSetTimeZone(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 8);
  if (v3 != cf)
  {
    if (v3)
      CFRelease(v3);
    if (cf)
      CFRetain(cf);
    *(_QWORD *)(a1 + 8) = cf;
  }
}

uint64_t CalGetFloatingTimeZone()
{
  return *MEMORY[0x1E0C9B0D0];
}

void CalSetSystemTimeZone(void *a1, int a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  CFTimeZoneRef v9;
  _BOOL4 v10;
  CFIndex v11;
  void *v12;
  NSObject *v13;
  const __CFDictionary *v14;
  __CFNotificationCenter *LocalCenter;
  const void *v16[2];
  void *keys[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&__GlobalLock);
  if (!__SystemTimeZone)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      CalSetSystemTimeZone_cold_2(a1);

    __SystemTimeZone = (uint64_t)CFRetain(a1);
    goto LABEL_9;
  }
  v4 = CFEqual((CFTypeRef)__SystemTimeZone, a1);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      CalSetSystemTimeZone_cold_4(a1);

LABEL_9:
    v8 = 1;
    goto LABEL_13;
  }
  if (v6)
    CalSetSystemTimeZone_cold_3(a1);

  CFRelease((CFTypeRef)__SystemTimeZone);
  v8 = 0;
  __SystemTimeZone = (uint64_t)CFRetain(a1);
LABEL_13:
  if (__TimeZone)
  {
    v9 = _CalCopyDefaultTimeZone(1);
    v10 = _CalSetTimeZone(v9);
    CFRelease(v9);
    if (v10)
      v11 = 2;
    else
      v11 = 1;
  }
  else
  {
    v11 = 1;
  }
  v12 = (void *)__Calendar;
  if (__Calendar)
  {
    __Calendar = 0;

  }
  pthread_mutex_unlock(&__GlobalLock);
  if (((v8 | a2 ^ 1) & 1) == 0)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      CalSetSystemTimeZone_cold_1();

    *(_OWORD *)keys = xmmword_1E2A84C68;
    v16[0] = (const void *)__SystemTimeZone;
    v16[1] = (const void *)__TimeZone;
    v14 = CFDictionaryCreate(0, (const void **)keys, v16, v11, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, CFSTR("CalTimeZoneChangedNotification"), 0, v14, 1u);
    CFRelease(v14);
  }
}

CFTimeZoneRef _CalCopyDefaultTimeZone(int a1)
{
  uint64_t AppBooleanValue;
  BOOL v3;
  CFTimeZoneRef v4;
  const __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const void *v12;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ViewedTimeZoneAutomatic"), CFSTR("com.apple.mobilecal"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = (_DWORD)AppBooleanValue == 0;
  else
    v3 = 0;
  if (v3)
  {
    v5 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("ViewedTimeZone"), CFSTR("com.apple.mobilecal"));
    if (!v5)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        _CalCopyDefaultTimeZone_cold_5();

      v5 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("CalTimeZoneKey"), CFSTR("com.apple.mobilecal"));
      if (!v5)
        goto LABEL_14;
    }
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      _CalCopyDefaultTimeZone_cold_4();

    v4 = _CalTimeZoneCopyCFTimeZone(v5);
    CFRelease(v5);
    if (!v4)
    {
LABEL_14:
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        _CalCopyDefaultTimeZone_cold_3();

      v4 = (CFTimeZoneRef)((uint64_t (*)(void))_CalCopySystemTimeZone)();
    }
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      _CalCopyDefaultTimeZone_cold_2();
  }
  else
  {
    if (a1)
      v4 = (CFTimeZoneRef)_CalCopySystemTimeZone(AppBooleanValue);
    else
      v4 = 0;
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      _CalCopyDefaultTimeZone_cold_6(v4);
  }

  if (!__SystemTimeZone)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      _CalCopyDefaultTimeZone_cold_1();

    v12 = (const void *)_CalCopySystemTimeZone(v11);
    CFRelease(v12);
  }
  return v4;
}

BOOL _CalSetTimeZone(void *a1)
{
  uint64_t v2;
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 v5;

  v2 = __TimeZone;
  v3 = __TimeZone != 0;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v2)
  {
    if (v5)
      _CalSetTimeZone_cold_2(a1);

    goto LABEL_10;
  }
  if (v5)
    _CalSetTimeZone_cold_1(a1);

  if (!CFEqual(a1, (CFTypeRef)__TimeZone))
  {
    CFRelease((CFTypeRef)__TimeZone);
LABEL_10:
    __TimeZone = (uint64_t)CFRetain(a1);
    return v3;
  }
  return 0;
}

CFTypeRef CalCopySystemTimeZone()
{
  CFTypeRef v0;

  pthread_mutex_lock(&__GlobalLock);
  v0 = _CalCopySystemTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

CFTypeRef _CalCopySystemTimeZone()
{
  const void *v0;
  NSObject *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = (const void *)__SystemTimeZone;
  if (!__SystemTimeZone)
  {
    __SystemTimeZone = (uint64_t)CFTimeZoneCopySystem();
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      _CalCopySystemTimeZone_cold_1();

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_significantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v0 = (const void *)__SystemTimeZone;
  }
  return CFRetain(v0);
}

CFTimeZoneRef CalCopyDefaultTimeZone()
{
  CFTimeZoneRef v0;

  pthread_mutex_lock(&__GlobalLock);
  v0 = _CalCopyDefaultTimeZone(1);
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

CFTimeZoneRef CalCopyDefaultTimeZoneSetting()
{
  CFTimeZoneRef v0;

  pthread_mutex_lock(&__GlobalLock);
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobilecal"));
  v0 = _CalCopyDefaultTimeZone(0);
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

BOOL CalDefaultTimeZoneSettingIsImplicit()
{
  int AppBooleanValue;
  _BOOL8 result;
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ViewedTimeZoneAutomatic"), CFSTR("com.apple.mobilecal"), &keyExistsAndHasValidFormat);
  result = 0;
  if (AppBooleanValue)
    v2 = keyExistsAndHasValidFormat == 0;
  else
    v2 = 1;
  if (v2)
    return !CFPreferencesGetAppBooleanValue(CFSTR("ViewedTimeZoneChosen"), CFSTR("com.apple.mobilecal"), &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
  return result;
}

BOOL CalDefaultTimeZoneSettingIsAutomatic()
{
  BOOL v0;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ViewedTimeZoneAutomatic"), CFSTR("com.apple.mobilecal"), &keyExistsAndHasValidFormat))
  {
    v0 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v0 = 1;
  }
  return !v0;
}

void CalSetDefaultTimeZone(void *a1)
{
  NSObject *v2;
  BOOL v3;
  int v4;
  const __CFString *v5;
  const void *v6;
  const void *v7;
  CFAbsoluteTime Current;
  CFStringRef v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  Boolean keyExistsAndHasValidFormat;

  pthread_mutex_lock(&__GlobalLock);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    CalSetDefaultTimeZone_cold_1(a1);

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ViewedTimeZoneAutomatic"), CFSTR("com.apple.mobilecal"), &keyExistsAndHasValidFormat))
  {
    v3 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = !v3;
  if ((a1 == 0) == v4)
  {
    if (!a1)
    {
      v6 = (const void *)*MEMORY[0x1E0C9AE50];
      CFPreferencesSetAppValue(CFSTR("ViewedTimeZoneAutomatic"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobilecal"));
      goto LABEL_21;
    }
    v5 = CFSTR("UserChangedDefaultTimezone");
  }
  else if (a1)
  {
    v5 = CFSTR("UserEnabledTimezoneSupport");
  }
  else
  {
    v5 = CFSTR("UserDisabledTimezoneSupport");
  }
  CalAnalyticsSendEvent((uint64_t)v5, 0);
  v6 = (const void *)*MEMORY[0x1E0C9AE50];
  if (a1)
    v7 = (const void *)*MEMORY[0x1E0C9AE40];
  else
    v7 = (const void *)*MEMORY[0x1E0C9AE50];
  CFPreferencesSetAppValue(CFSTR("ViewedTimeZoneAutomatic"), v7, CFSTR("com.apple.mobilecal"));
  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = CalCFTimeZoneCopyCalTimeZone((const __CFTimeZone *)a1, Current);
    CFPreferencesSetAppValue(CFSTR("ViewedTimeZone"), v9, CFSTR("com.apple.mobilecal"));
    CFRelease(v9);
  }
LABEL_21:
  CFPreferencesSetAppValue(CFSTR("ViewedTimeZoneChosen"), v6, CFSTR("com.apple.mobilecal"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobilecal"));
  ++__TimeZoneNotificationEchoCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobilecal.timezonechanged"), 0, 0, 1u);
  pthread_mutex_unlock(&__GlobalLock);
  _CalDefaultTimeZoneSettingsChanged();
}

CFStringRef CalCFTimeZoneCopyCalTimeZone(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  const void *v4;
  const void *v5;

  if ((const __CFTimeZone *)*MEMORY[0x1E0C9B0D0] == a1)
    return (CFStringRef)CFRetain(CFSTR("_float"));
  v4 = (const void *)MEMORY[0x194009B08]();
  if (!v4)
    return CFTimeZoneCopyAbbreviation(a1, a2);
  v5 = v4;
  CFRetain(v4);
  return (CFStringRef)v5;
}

void _CalDefaultTimeZoneSettingsChanged()
{
  CFTimeZoneRef v0;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  CFTypeRef v4;
  NSObject *v5;
  const __CFDictionary *v6;
  __CFNotificationCenter *LocalCenter;
  const void *v8;
  void *keys;

  pthread_mutex_lock(&__GlobalLock);
  if (!__TimeZone)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      _CalDefaultTimeZoneSettingsChanged_cold_1();

    goto LABEL_7;
  }
  v0 = _CalCopyDefaultTimeZone(1);
  if (CFEqual(v0, (CFTypeRef)__TimeZone))
  {
    CFRelease(v0);
LABEL_7:
    pthread_mutex_unlock(&__GlobalLock);
    return;
  }
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    _CalDefaultTimeZoneSettingsChanged_cold_3(v0);

  CFRelease((CFTypeRef)__TimeZone);
  __TimeZone = (uint64_t)v0;
  v3 = (void *)__Calendar;
  __Calendar = 0;

  v4 = CFRetain(v0);
  pthread_mutex_unlock(&__GlobalLock);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    _CalDefaultTimeZoneSettingsChanged_cold_2();

  v8 = v4;
  keys = CFSTR("CalTimeZoneKey");
  v6 = CFDictionaryCreate(0, (const void **)&keys, &v8, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("CalTimeZoneChangedNotification"), 0, v6, 1u);
  CFRelease(v6);
  CFRelease(v4);
}

void _CalTimeZoneForceUpdate()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;

  pthread_mutex_lock(&__GlobalLock);
  if (__PAIR128__(__TimeZone, __SystemTimeZone) != 0)
  {
    pthread_mutex_unlock(&__GlobalLock);
LABEL_4:
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      _CalTimeZoneForceUpdate_cold_1();

    _significantTimeChange();
    _CalTimeZonePrefChanged();
    return;
  }
  v0 = __Calendar;
  pthread_mutex_unlock(&__GlobalLock);
  if (v0)
    goto LABEL_4;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    _CalTimeZoneForceUpdate_cold_2();

}

void _significantTimeChange()
{
  NSObject *v0;
  CFTimeZoneRef v1;

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    _significantTimeChange_cold_1();

  CFTimeZoneResetSystem();
  v1 = CFTimeZoneCopySystem();
  CalSetSystemTimeZone(v1, 1);
  CFRelease(v1);
}

void _CalTimeZonePrefChanged()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;

  v0 = __TimeZoneNotificationEchoCount;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG);
  if (v0)
  {
    if (v2)
      _CalTimeZonePrefChanged_cold_2(v1);

    --__TimeZoneNotificationEchoCount;
  }
  else
  {
    if (v2)
      _CalTimeZonePrefChanged_cold_1();

    CFPreferencesAppSynchronize(CFSTR("com.apple.mobilecal"));
    _CalDefaultTimeZoneSettingsChanged();
  }
}

CFTimeZoneRef _CalCopyTimeZone()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  CFTimeZoneRef v2;
  NSObject *v3;

  if (__TimeZone)
    return (CFTimeZoneRef)CFRetain((CFTypeRef)__TimeZone);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CalTimeZonePrefChanged, CFSTR("com.apple.mobilecal.timezonechanged"), 0, CFNotificationSuspensionBehaviorDrop);
  v2 = _CalCopyDefaultTimeZone(1);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    _CalCopyTimeZone_cold_1(v2);

  _CalSetTimeZone(v2);
  return v2;
}

CFTimeZoneRef CalCopyTimeZone()
{
  CFTimeZoneRef v0;

  pthread_mutex_lock(&__GlobalLock);
  v0 = _CalCopyTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

id CalCopyCalendar()
{
  void *v0;

  pthread_mutex_lock(&__GlobalLock);
  _CalCopyCalendar();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

id _CalCopyCalendar()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CFTimeZoneRef v3;

  v0 = (void *)__Calendar;
  if (!__Calendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__Calendar;
    __Calendar = v1;

    v3 = _CalCopyTimeZone();
    if (v3)
      objc_msgSend((id)__Calendar, "setTimeZone:", v3);

    v0 = (void *)__Calendar;
  }
  return (id)objc_msgSend(v0, "copy");
}

CFTimeZoneRef CalTimeZoneCopyCFTimeZone(const __CFString *a1)
{
  CFTimeZoneRef v2;

  pthread_mutex_lock(&__GlobalLock);
  v2 = _CalTimeZoneCopyCFTimeZone(a1);
  pthread_mutex_unlock(&__GlobalLock);
  return v2;
}

CFTimeZoneRef _CalTimeZoneCopyCFTimeZone(const __CFString *key)
{
  const __CFTimeZone *Value;
  CFTimeZoneRef v3;

  if (_CalTimeZoneCopyCFTimeZone___TimeZoneCache)
  {
    Value = (const __CFTimeZone *)CFDictionaryGetValue((CFDictionaryRef)_CalTimeZoneCopyCFTimeZone___TimeZoneCache, key);
    if (Value)
    {
      v3 = Value;
      CFRetain(Value);
      return v3;
    }
  }
  else
  {
    _CalTimeZoneCopyCFTimeZone___TimeZoneCache = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  v3 = CFTimeZoneCreateWithName(0, key, 1u);
  if (v3)
    CFDictionarySetValue((CFMutableDictionaryRef)_CalTimeZoneCopyCFTimeZone___TimeZoneCache, key, v3);
  return v3;
}

void CalDateTimeRelease(int a1, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t CalDateTimeGetGregorianDate(uint64_t a1, const __CFString *a2, const __CFTimeZone *a3)
{
  double AbsoluteTime;

  AbsoluteTime = CalDateTimeGetAbsoluteTime(a1, a2, a3);
  return CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(a3, AbsoluteTime);
}

double CalDateTimeGetAbsoluteTime(uint64_t AbsoluteTime, CFStringRef theString1, const __CFTimeZone *a3)
{
  CFTimeZoneRef v5;
  CFTimeZoneRef v6;
  CFGregorianDate GregorianDate;

  if (theString1 && CFStringCompare(theString1, CFSTR("_float"), 0))
    return *(double *)&AbsoluteTime;
  pthread_mutex_lock(&__GlobalLock);
  v5 = _CalTimeZoneCopyCFTimeZone(CFSTR("GMT"));
  pthread_mutex_unlock(&__GlobalLock);
  v6 = a3;
  if (!a3)
  {
    pthread_mutex_lock(&__GlobalLock);
    v6 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  if (CFEqual(v5, v6))
  {
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  GregorianDate = CFAbsoluteTimeGetGregorianDate(*(CFAbsoluteTime *)&AbsoluteTime, v5);
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v6);
  if (v5)
LABEL_7:
    CFRelease(v5);
LABEL_8:
  if (!a3)
    CFRelease(v6);
  return *(double *)&AbsoluteTime;
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  const __CFTimeZone *v4;
  uint64_t v5;

  if (a1)
    return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, a1);
  pthread_mutex_lock(&__GlobalLock);
  v4 = _CalCopyTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  v5 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, v4);
  CFRelease(v4);
  return v5;
}

uint64_t CalGregorianDateCopyDateTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  double second;
  uint64_t v4;
  const __CFTimeZone *v5;
  CFStringRef v6;
  CFAbsoluteTime v8[2];
  CFGregorianDate v9;

  second = gdate.second;
  v4 = *(_QWORD *)&gdate.year;
  v8[1] = 0.0;
  v5 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    v5 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(_QWORD *)&v9.year = v4;
  v9.second = second;
  v8[0] = CFGregorianDateGetAbsoluteTime(v9, v5);
  v6 = CalCFTimeZoneCopyCalTimeZone(v5, v8[0]);
  CalDateTimeSetTimeZone((uint64_t)v8, v6);
  if (v6)
    CFRelease(v6);
  if (!tz)
    CFRelease(v5);
  return *(_QWORD *)&v8[0];
}

CFAbsoluteTime CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(CFGregorianDate gdate, const __CFTimeZone *a2)
{
  double second;
  uint64_t v3;
  const __CFTimeZone *v5;
  double AbsoluteTime;
  CFGregorianDate v7;

  second = gdate.second;
  v3 = *(_QWORD *)&gdate.year;
  if (a2)
    return CFGregorianDateGetAbsoluteTime(gdate, a2);
  pthread_mutex_lock(&__GlobalLock);
  v5 = _CalCopyTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  *(_QWORD *)&v7.year = v3;
  v7.second = second;
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(v7, v5);
  CFRelease(v5);
  return AbsoluteTime;
}

uint64_t CalAbsoluteTimeGetDayOfWeek(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  unsigned int DayOfWeek;
  const __CFTimeZone *v4;

  if (a1)
  {
    DayOfWeek = CFAbsoluteTimeGetDayOfWeek(a2, a1);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    v4 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
    DayOfWeek = CFAbsoluteTimeGetDayOfWeek(a2, v4);
    CFRelease(v4);
  }
  if (DayOfWeek == 7)
    return 0;
  else
    return DayOfWeek;
}

uint64_t CalGregorianDateGetDayOfWeek(CFGregorianDate gdate, const __CFTimeZone *a2)
{
  double second;
  uint64_t v4;
  const __CFTimeZone *v5;
  CFAbsoluteTime AbsoluteTimeWithFallbackToDefaultTimeZone;
  uint64_t DayOfWeek;
  CFGregorianDate v9;

  second = gdate.second;
  v4 = *(_QWORD *)&gdate.year;
  v5 = a2;
  if (!a2)
  {
    pthread_mutex_lock(&__GlobalLock);
    v5 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(_QWORD *)&v9.year = v4;
  v9.second = second;
  AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v9, v5);
  DayOfWeek = CalAbsoluteTimeGetDayOfWeek(v5, AbsoluteTimeWithFallbackToDefaultTimeZone);
  if (!a2)
    CFRelease(v5);
  return DayOfWeek;
}

double CalAbsoluteTimeGetAbsoluteTimeInTimeZone(CFTimeZoneRef tz, const __CFTimeZone *a2, CFAbsoluteTime a3)
{
  const __CFTimeZone *v6;
  const __CFTimeZone *v7;
  double AbsoluteTime;
  CFGregorianDate GregorianDate;

  v6 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    v6 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  v7 = a2;
  if (!a2)
  {
    pthread_mutex_lock(&__GlobalLock);
    v7 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  GregorianDate = CFAbsoluteTimeGetGregorianDate(a3, v6);
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v7);
  if (!tz)
  {
    CFRelease(v6);
    if (a2)
      return AbsoluteTime;
LABEL_9:
    CFRelease(v7);
    return AbsoluteTime;
  }
  if (!a2)
    goto LABEL_9;
  return AbsoluteTime;
}

double CalAbsoluteTimeGetTimeForStartOfDay(const void *a1, CFAbsoluteTime a2)
{
  const __CFTimeZone *v3;
  double AbsoluteTimeWithFallbackToDefaultTimeZone;
  CFGregorianDate v6;

  if (a1)
  {
    v3 = (const __CFTimeZone *)CFRetain(a1);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    v3 = _CalTimeZoneCopyCFTimeZone(CFSTR("GMT"));
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(_QWORD *)&v6.year = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(v3, a2) & 0xFFFFFFFFFFFFLL;
  v6.second = 0.0;
  AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v6, v3);
  CFRelease(v3);
  return AbsoluteTimeWithFallbackToDefaultTimeZone;
}

uint64_t CalGregorianDateGetGregorianDateForDay(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL;
}

uint64_t CalGregorianDateGetNull()
{
  return 0;
}

BOOL CalGregorianDateEqualToGregorianDate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _BOOL8 result;
  int v6;

  v4 = a3 ^ a1;
  if (((a3 ^ a1) & 0xFF0000000000) != 0)
    return 0;
  v6 = a1;
  result = 0;
  if (v6 == (_DWORD)a3 && (v4 & 0xFFFF00FF00000000) == 0)
    return vabdd_f64(*(double *)&a2, *(double *)&a4) < 2.22044605e-16;
  return result;
}

uint64_t CalGregorianDateGetGregorianDateForEndOfDay(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x3B17000000000000;
}

uint64_t CalGregorianDateGetGregorianDateForMonth(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFLL | 0x10000000000;
}

uint64_t CalGregorianDateGetGregorianDateForYear(unsigned int a1)
{
  return a1 | 0x10100000000;
}

uint64_t CalAbsoluteTimeGetGregorianDateForWeek(const __CFTimeZone *a1, unsigned int a2, _DWORD *a3, CFAbsoluteTime a4)
{
  const __CFTimeZone *v8;
  unsigned int DayOfWeek;
  int v10;
  int v11;
  int v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  CFGregorianUnits v16;

  v8 = a1;
  if (!a1)
  {
    pthread_mutex_lock(&__GlobalLock);
    v8 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  DayOfWeek = CalAbsoluteTimeGetDayOfWeek(v8, a4);
  v10 = DayOfWeek % 7 - a2;
  if (DayOfWeek % 7 >= a2)
    v11 = 0;
  else
    v11 = 7;
  *(_QWORD *)(&v16.minutes + 1) = 0;
  v12 = v10 + v11;
  v16.minutes = 0;
  HIDWORD(v16.seconds) = 0;
  *(_QWORD *)&v16.years = 0;
  *(_QWORD *)&v16.days = -(v10 + v11);
  v13 = CFAbsoluteTimeAddGregorianUnits(a4, v8, &v16);
  v14 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v13, v8);
  if (!a1)
  {
    CFRelease(v8);
    if (!a3)
      return v14 & 0xFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  if (a3)
LABEL_8:
    *a3 = v12;
  return v14 & 0xFFFFFFFFFFFFLL;
}

double CalAbsoluteTimeGetAbsoluteTimeInCalTimeZone(const __CFString *a1, CFAbsoluteTime a2)
{
  const __CFTimeZone *v4;
  CFGregorianDate GregorianDate;
  CFComparisonResult v6;
  CFTimeZoneRef v7;
  const __CFTimeZone *v8;
  double AbsoluteTime;

  pthread_mutex_lock(&__GlobalLock);
  v4 = _CalTimeZoneCopyCFTimeZone(CFSTR("GMT"));
  pthread_mutex_unlock(&__GlobalLock);
  GregorianDate = CFAbsoluteTimeGetGregorianDate(a2, v4);
  v6 = CFStringCompare(a1, CFSTR("_float"), 0);
  pthread_mutex_lock(&__GlobalLock);
  if (v6)
    v7 = _CalTimeZoneCopyCFTimeZone(a1);
  else
    v7 = _CalCopyTimeZone();
  v8 = v7;
  pthread_mutex_unlock(&__GlobalLock);
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v8);
  if (v4)
    CFRelease(v4);
  if (v8)
    CFRelease(v8);
  return AbsoluteTime;
}

uint64_t CalGregorianDateAddUnits(CFGregorianDate gdate, _OWORD *a2, CFTimeZoneRef tz)
{
  double second;
  uint64_t v6;
  const __CFTimeZone *v7;
  CFAbsoluteTime AbsoluteTime;
  __int128 v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  CFGregorianUnits v13;
  CFGregorianDate v14;

  second = gdate.second;
  v6 = *(_QWORD *)&gdate.year;
  v7 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    v7 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(_QWORD *)&v14.year = v6;
  v14.second = second;
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(v14, v7);
  v9 = a2[1];
  *(_OWORD *)&v13.years = *a2;
  *(_OWORD *)&v13.minutes = v9;
  v10 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v7, &v13);
  v11 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v10, v7);
  if (!tz)
    CFRelease(v7);
  return v11;
}

unint64_t CalGregorianDateAddDays(unint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v3 = (int)(a1 >> 8) >> 24;
  v4 = a3 + ((int)(a1 >> 16) >> 24);
  if (v3 - 1 > 0xB)
  {
    v5 = 0;
  }
  else
  {
    v5 = __DaysInMonths[v3];
    if (v3 == 2)
    {
      v6 = ((int)a1 - 2000) % 400;
      if (v6 == 300)
        v7 = __DaysInMonths[v3];
      else
        v7 = v5 + 1;
      if (v6 == 200)
        v7 = __DaysInMonths[v3];
      if (v6 == 100)
        v7 = __DaysInMonths[v3];
      if ((v6 & 3) == 0)
        v5 = v7;
    }
  }
  if (v5 >= v4)
  {
    v8 = a1;
  }
  else
  {
    v8 = a1;
    do
    {
      if (v3 + 1 <= 0xC)
      {
        ++v3;
      }
      else
      {
        ++v8;
        v3 = 1;
      }
      if (v3 - 1 > 0xB)
      {
        v9 = 0;
      }
      else
      {
        v9 = __DaysInMonths[v3];
        if (v3 == 2)
        {
          v10 = (int)(v8 - 2000) % 400;
          if ((v10 & 3) == 0 && v10 != 100 && v10 != 200 && v10 != 300)
            ++v9;
        }
      }
      v4 -= v5;
      v5 = v9;
    }
    while (v9 < v4);
  }
  return a1 & 0xFFFF000000000000 | ((unint64_t)v4 << 40) | ((unint64_t)v3 << 32) | v8;
}

CFIndex CalAbsoluteTimeGetDaysInMonth(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  return _CalAbsoluteTimeGetRangeOfUnit(a1, 0x10uLL, 8uLL, a2);
}

CFIndex _CalAbsoluteTimeGetRangeOfUnit(const __CFTimeZone *a1, CFCalendarUnit a2, CFCalendarUnit a3, CFAbsoluteTime a4)
{
  __CFCalendar *v8;
  __CFCalendar *v9;
  CFIndex length;

  pthread_mutex_lock(&__GlobalLock);
  v8 = (__CFCalendar *)_CalCopyCalendar();
  v9 = v8;
  if (a1)
    CFCalendarSetTimeZone(v8, a1);
  length = CFCalendarGetRangeOfUnit(v9, a2, a3, a4).length;
  pthread_mutex_unlock(&__GlobalLock);
  return length;
}

uint64_t CalGregorianDateGetDaysInMonth(unint64_t a1)
{
  int v1;
  int v2;
  uint64_t result;
  int v4;

  v1 = (int)(a1 >> 8) >> 24;
  if ((v1 - 1) > 0xB)
    return 0;
  v2 = a1;
  result = __DaysInMonths[v1];
  if (v1 == 2)
  {
    v4 = (v2 - 2000) % 400;
    if ((v4 & 3) == 0 && v4 != 100 && v4 != 200 && v4 != 300)
      return (result + 1);
  }
  return result;
}

CFIndex CalAbsoluteTimeGetWeeksInYear(CFAbsoluteTime a1, uint64_t a2, const __CFTimeZone *a3)
{
  return _CalAbsoluteTimeGetRangeOfUnit(a3, 0x100uLL, 4uLL, a1);
}

uint64_t CalAbsoluteTimeGetDaysInYear(CFTimeZoneRef tz, CFAbsoluteTime a2)
{
  const __CFTimeZone *v4;
  CFAbsoluteTime v5;
  uint64_t days;
  CFGregorianUnits v8;

  v4 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    v4 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(_QWORD *)&v8.years = 1;
  memset(&v8.days, 0, 24);
  v5 = CFAbsoluteTimeAddGregorianUnits(a2, v4, &v8);
  CFAbsoluteTimeGetDifferenceAsGregorianUnits(&v8, v5, a2, v4, 4uLL);
  days = v8.days;
  if (!tz)
    CFRelease(v4);
  return days;
}

uint64_t CalAbsoluteTimeGetWeekOfYear(int a1, CFTimeZoneRef tz, CFAbsoluteTime a3)
{
  const __CFTimeZone *v3;
  CFTimeZoneRef v5;
  __CFCalendar *v8;
  __CFCalendar *v9;
  unsigned int v10;

  v3 = tz;
  if (a1 == 1)
  {
    if (!tz)
    {
      pthread_mutex_lock(&__GlobalLock);
      v5 = _CalCopyTimeZone();
      pthread_mutex_unlock(&__GlobalLock);
      v3 = (const __CFTimeZone *)CFAutorelease(v5);
    }
    return CFAbsoluteTimeGetWeekOfYear(a3, v3);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    v8 = (__CFCalendar *)_CalCopyCalendar();
    v9 = v8;
    if (v3)
      CFCalendarSetTimeZone(v8, v3);
    v10 = 0;
    CFCalendarSetFirstWeekday(v9, (a1 + 1));
    CFCalendarSetMinimumDaysInFirstWeek(v9, 4);
    if (!CFCalendarDecomposeAbsoluteTime(v9, a3, "w", &v10))
      v10 = 0;
    pthread_mutex_unlock(&__GlobalLock);
    return v10;
  }
}

BOOL CalGregorianDateIsExtreme(int a1)
{
  return (a1 - 2069) < 0xFFFFFF78;
}

uint64_t CalGregorianDateGetExtremities(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = 1933;
    *(_WORD *)(result + 4) = 257;
  }
  if (a2)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 2067;
    *(_WORD *)(a2 + 4) = 7948;
  }
  return result;
}

double CalAbsoluteTimeAddGregorianUnits(uint64_t a1, _OWORD *a2, double a3)
{
  void *v5;
  __int128 v6;
  double v7;
  _OWORD v9[2];

  +[EKTimeZone timeZoneWithNSTimeZone:](EKTimeZone, "timeZoneWithNSTimeZone:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a2[1];
  v9[0] = *a2;
  v9[1] = v6;
  v7 = EKAbsoluteTimeAddGregorianDuration(v5, v9, a3);

  return v7;
}

uint64_t _CalCompareDates(unint64_t a1, unint64_t a2)
{
  if (a1 < a2)
    return -1;
  else
    return a1 > a2;
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t EKSymbolicColorToRGBMapping()
{
  if (EKSymbolicColorToRGBMapping_onceToken != -1)
    dispatch_once(&EKSymbolicColorToRGBMapping_onceToken, &__block_literal_global_19);
  return EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB;
}

uint64_t EKGetDefaultCalendarColors()
{
  uint64_t result;
  _OWORD v1[3];
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  result = EKGetDefaultCalendarColors___DefaultColors;
  if (!EKGetDefaultCalendarColors___DefaultColors)
  {
    pthread_mutex_lock(&EKGetDefaultCalendarColors___DefaultColorsLock);
    if (!EKGetDefaultCalendarColors___DefaultColors)
    {
      v1[0] = xmmword_1E2A84CD8;
      v1[1] = *(_OWORD *)&off_1E2A84CE8;
      v1[2] = xmmword_1E2A84CF8;
      v2 = CFSTR("#A2845E");
      EKGetDefaultCalendarColors___DefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 7, MEMORY[0x1E0C9B378]);
    }
    pthread_mutex_unlock(&EKGetDefaultCalendarColors___DefaultColorsLock);
    return EKGetDefaultCalendarColors___DefaultColors;
  }
  return result;
}

uint64_t EKGetBrightonCalendarColors()
{
  uint64_t result;
  _OWORD v1[3];
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  result = EKGetBrightonCalendarColors___DefaultColors;
  if (!EKGetBrightonCalendarColors___DefaultColors)
  {
    pthread_mutex_lock(&EKGetBrightonCalendarColors___DefaultColorsLock);
    if (!EKGetBrightonCalendarColors___DefaultColors)
    {
      v1[0] = xmmword_1E2A84D10;
      v1[1] = *(_OWORD *)&off_1E2A84D20;
      v1[2] = xmmword_1E2A84D30;
      v2 = CFSTR("#882F00");
      EKGetBrightonCalendarColors___DefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 7, MEMORY[0x1E0C9B378]);
    }
    pthread_mutex_unlock(&EKGetBrightonCalendarColors___DefaultColorsLock);
    return EKGetBrightonCalendarColors___DefaultColors;
  }
  return result;
}

uint64_t EKGetWildcatDefaultCalendarColors()
{
  uint64_t result;
  _OWORD v1[2];
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  result = EKGetWildcatDefaultCalendarColors___WildcatDefaultColors;
  if (!EKGetWildcatDefaultCalendarColors___WildcatDefaultColors)
  {
    pthread_mutex_lock(&EKGetWildcatDefaultCalendarColors___WildcatDefaultColorsLock);
    if (!EKGetWildcatDefaultCalendarColors___WildcatDefaultColors)
    {
      v1[0] = xmmword_1E2A84D48;
      v1[1] = *(_OWORD *)&off_1E2A84D58;
      v2 = CFSTR("#B90E28");
      EKGetWildcatDefaultCalendarColors___WildcatDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E0C9B378]);
    }
    pthread_mutex_unlock(&EKGetWildcatDefaultCalendarColors___WildcatDefaultColorsLock);
    return EKGetWildcatDefaultCalendarColors___WildcatDefaultColors;
  }
  return result;
}

uint64_t EKGetApexDefaultCalendarColors()
{
  uint64_t result;
  _OWORD v1[2];
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  result = EKGetApexDefaultCalendarColors___ApexDefaultColors;
  if (!EKGetApexDefaultCalendarColors___ApexDefaultColors)
  {
    pthread_mutex_lock(&EKGetApexDefaultCalendarColors___ApexDefaultColorsLock);
    if (!EKGetApexDefaultCalendarColors___ApexDefaultColors)
    {
      v1[0] = xmmword_1E2A84D70;
      v1[1] = *(_OWORD *)&off_1E2A84D80;
      v2 = CFSTR("#B5000D");
      EKGetApexDefaultCalendarColors___ApexDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E0C9B378]);
    }
    pthread_mutex_unlock(&EKGetApexDefaultCalendarColors___ApexDefaultColorsLock);
    return EKGetApexDefaultCalendarColors___ApexDefaultColors;
  }
  return result;
}

uint64_t EKGetSnowLeopardDefaultCalendarColors()
{
  uint64_t result;
  _OWORD v1[2];
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  result = EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors;
  if (!EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors)
  {
    pthread_mutex_lock(&EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColorsLock);
    if (!EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors)
    {
      v1[0] = xmmword_1E2A84D98;
      v1[1] = *(_OWORD *)off_1E2A84DA8;
      v2 = CFSTR("#E51717");
      EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E0C9B378]);
    }
    pthread_mutex_unlock(&EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColorsLock);
    return EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors;
  }
  return result;
}

const __CFString *EKGetFacebookCalendarColor()
{
  return CFSTR("#3064B6");
}

void sub_18FC40364(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id NSDateFromICSValueInTimeZone(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setYear:", objc_msgSend(v5, "year"));
    objc_msgSend(v8, "setMonth:", objc_msgSend(v5, "month"));
    objc_msgSend(v8, "setDay:", objc_msgSend(v5, "day"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));
      objc_msgSend(v8, "setMinute:", objc_msgSend(v9, "minute"));
      v10 = objc_msgSend(v9, "second");

      objc_msgSend(v8, "setSecond:", v10);
    }
    objc_msgSend(v6, "setTimeZone:", v7);
    objc_msgSend(v6, "dateFromComponents:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      NSDateFromICSValueInTimeZone_cold_1(v12);

    v11 = 0;
  }

  return v11;
}

void sub_18FC408C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_18FC42DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC42FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void CalRoundWithSigFigs(unsigned int a1, double a2)
{
  double v4;
  double v5;

  if (fabs(a2) >= 2.22044605e-16)
  {
    v4 = -a2;
    if (a2 >= 0.0)
      v4 = a2;
    v5 = log10(v4);
    __exp10((double)(uint64_t)(a1 - vcvtpd_s64_f64(v5)));
  }
}

uint64_t CalRoundToNearestMultiple(int a1, float a2)
{
  float v2;
  float v3;
  float v4;
  float v5;

  v2 = a2 / (float)a1;
  v3 = ceilf(v2 + -0.5);
  v4 = floorf(v2 + 0.5);
  if (a2 >= 0.0)
    v5 = v4;
  else
    v5 = v3;
  return (int)(float)(v5 * (float)a1);
}

double CalRoundDoubleToNearestMultiple(double a1, double a2)
{
  double v4;
  NSObject *v5;

  v4 = fabs(a2);
  if (v4 >= 2.22044605e-16)
    return v4 * round(a1 / v4);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    CalRoundDoubleToNearestMultiple_cold_1(v5, a2, a1);

  return a1;
}

id CalGenerateQualifiedIdentifierWithClassAndSubdomain(objc_class *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && objc_msgSend(v3, "length"))
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@"), v5, v6, v3);
    else
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v5, v6, v10);
    v8 = (void *)v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t doURLsEmailsPhoneNumbersMatch(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if ((objc_msgSend(v11, "isEqual:", v14) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v11, "stringRemovingMailto");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRemovingMailto");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v15) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", v19) & 1) != 0
      || (objc_msgSend(v18, "isEqualToString:", v15) & 1) != 0
      || (objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v11, "stringRemovingTel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringRemovingTel");
      v22 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
      if ((objc_msgSend(v13, "isEqualToString:", v16) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", v22) & 1) != 0
        || (objc_msgSend(v21, "isEqualToString:", v16) & 1) != 0)
      {
        v23 = v21;
        v17 = 1;
      }
      else
      {
        v23 = v21;
        v17 = objc_msgSend(v21, "isEqualToString:", v24);
      }

    }
  }

  return v17;
}

uint64_t CALPreferenceMajorVersion()
{
  void *v0;
  void *v1;
  uint64_t v2;

  +[CalDefaults shared](CalDefaults, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("iCal version"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "integerValue") >> 24;
  return v2;
}

uint64_t CALMajorVersionNumberFromVersion(void *a1)
{
  return objc_msgSend(a1, "integerValue") >> 24;
}

uint64_t _notificationCallback()
{
  return +[CalDistributedNotificationCenter _handleNotification:](CalDistributedNotificationCenter, "_handleNotification:");
}

void sub_18FC455D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC4571C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalEqualObjects(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqual:", a2);
  else
    return a1 == a2;
}

uint64_t CalEqualStrings(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqualToString:", a2);
  else
    return a1 == a2;
}

void sub_18FC45F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18FC45F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18FC4611C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC46228(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC462E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC46420(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC465D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC4669C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetFormatAnd_d_FieldRangeFor_EEEd(void *a1, uint64_t *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  UChar32 v16;
  void *v18;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEd"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("d"), 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _GetModifiedFormatFromFormat(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _GetModifiedFormatFromFormat(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfString:", v7);
  *a2 = v8;
  a2[1] = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    && (v8 = objc_msgSend(v6, "rangeOfString:", CFSTR("dd")), *a2 = v8, a2[1] = v9, v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = objc_msgSend(v6, "rangeOfString:", CFSTR("d"));
    *a2 = v10;
    a2[1] = v9;
    if (v10 < 0)
      goto LABEL_34;
  }
  else
  {
    v10 = v8;
    if (v8 < 0)
      goto LABEL_34;
  }
  v11 = v9 + v10;
  v12 = objc_msgSend(v6, "length");
  if (v11 < v12 && objc_msgSend(v6, "characterAtIndex:", v11) == 100)
    ++v11;
  if (v11 < v12
    && objc_msgSend(v6, "characterAtIndex:", v11 - 1) == 100
    && objc_msgSend(v6, "characterAtIndex:", v11) == 46)
  {
    ++v11;
  }
  v18 = v4;
  if (v10)
  {
    if (objc_msgSend(v6, "characterAtIndex:", v10 - 1) == 100)
      *a2 = --v10;
    if ((unint64_t)v10 >= 2)
    {
      v13 = objc_msgSend(v6, "characterAtIndex:", v10 - 1);
      if (v13 == 8208 || v13 == 45)
        --v10;
    }
  }
  v14 = 0;
  while (1)
  {
    v15 = v10 - 1;
    if (v10 < 1)
      break;
    v16 = objc_msgSend(v6, "characterAtIndex:", v10 - 1);
    if (u_isUWhiteSpace(v16) || u_ispunct(v16))
    {
      if ((v14 & 1) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
    if (u_isUAlphabetic(v16))
    {
      v14 = 1;
      --v10;
      if ((v16 - 65) > 0x39)
        continue;
      v10 = v15;
      if ((v16 - 97) >= 0xFFFFFFFA)
        continue;
    }
    goto LABEL_33;
  }
  if ((v14 & 1) == 0)
    goto LABEL_33;
  v10 = 0;
LABEL_32:
  *a2 = v10;
LABEL_33:
  a2[1] = v11 - *a2;
  v4 = v18;
LABEL_34:

  return v4;
}

void sub_18FC48020(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetModifiedFormatFromFormat(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  _BOOL4 v9;
  void *v10;
  __int16 v12;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertString:atIndex:", v1, 0);
  v3 = objc_msgSend(v2, "length");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      v12 = 0;
      v7 = objc_msgSend(v2, "characterAtIndex:", v5);
      if (v7 == 39)
      {
        v6 ^= 1u;
      }
      else
      {
        v9 = (v7 - 65) < 0x3A && (v7 - 97) < 0xFFFFFFFA;
        if ((v6 & v9) == 1)
        {
          v12 = v7 - 8257;
          v6 = 1;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v12, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "replaceCharactersInRange:withString:", v5, 1, v10);

        }
      }
      ++v5;
    }
    while (v4 != v5);
  }

  return v2;
}

void sub_18FC484D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CalGetRGBAFromString(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, int *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a1;
  v22 = 0;
  v23 = 0;
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v9, "characterAtIndex:", 0) == 35)
    {
      v10 = objc_msgSend(v9, "length");
      if (v10 == 9 || objc_msgSend(v9, "length") == 7)
      {
        objc_msgSend(v9, "substringWithRange:", 1, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scanHexInt:", (char *)&v23 + 4);

        if (HIDWORD(v23) <= 0xFF)
        {
          objc_msgSend(v9, "substringWithRange:", 3, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scanHexInt:", &v23);

          if (v23 <= 0xFF)
          {
            objc_msgSend(v9, "substringWithRange:", 5, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scanHexInt:", (char *)&v22 + 4);

            if (HIDWORD(v22) <= 0xFF)
            {
              if (v10 == 9)
              {
                objc_msgSend(v9, "substringWithRange:", 7, 2);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "scanHexInt:", &v22);

                v21 = v22;
                if (v22 > 0xFF)
                {
                  v13 = 0;
                  goto LABEL_12;
                }
              }
              else
              {
                v17 = 0;
                v21 = 255;
                LODWORD(v22) = 255;
              }
              if (a2)
                *a2 = HIDWORD(v23);
              if (a3)
                *a3 = v23;
              if (a4)
                *a4 = HIDWORD(v22);
              if (a5)
                *a5 = v21;
              v13 = 1;
              goto LABEL_12;
            }
            v13 = 0;
LABEL_11:
            v17 = 0;
LABEL_12:

            goto LABEL_13;
          }
          v13 = 0;
        }
        else
        {
          v13 = 0;
          v14 = 0;
        }
        v16 = 0;
        goto LABEL_11;
      }
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

uint64_t CalUnsignedIntDiff(unsigned int a1, unsigned int a2)
{
  if (a1 <= a2)
    return a2 - a1;
  else
    return a1 - a2;
}

BOOL CalColorsAreAlmostEqual(void *a1, void *a2)
{
  id v3;
  int RGBAFromString;
  _BOOL8 v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;

  v3 = a2;
  v13 = 0;
  v12 = 0;
  v10 = 0;
  v11 = 0;
  RGBAFromString = CalGetRGBAFromString(a1, &v13, &v12, (_DWORD *)&v11 + 1, 0);
  v5 = 0;
  if (RGBAFromString)
  {
    if (!CalGetRGBAFromString(v3, &v11, (_DWORD *)&v10 + 1, &v10, 0))
      goto LABEL_12;
    v6 = v13 - v11;
    if (v13 <= v11)
      v6 = v11 - v13;
    if (v6 > 1)
      goto LABEL_12;
    v7 = v12 - HIDWORD(v10);
    if (v12 <= HIDWORD(v10))
      v7 = HIDWORD(v10) - v12;
    if (v7 <= 1)
    {
      v8 = HIDWORD(v11) - v10;
      if (HIDWORD(v11) <= v10)
        v8 = v10 - HIDWORD(v11);
      v5 = v8 < 2;
    }
    else
    {
LABEL_12:
      v5 = 0;
    }
  }

  return v5;
}

uint64_t CalColorStringRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), a1, a2, a3, a4);
}

void CalFlagForProfilingStart(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    _startTimes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v4);

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      CalFlagForProfilingStart_cold_1();
  }

}

id _startTimes()
{
  if (_startTimes_onceToken != -1)
    dispatch_once(&_startTimes_onceToken, &__block_literal_global_28);
  return (id)_startTimes_startTimes;
}

void CalFlagForProfilingEnd(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;

  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    _startTimes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" (%g s)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = &stru_1E2A86598;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      CalFlagForProfilingEnd_cold_1();

  }
}

void CalFlagForProfilingPoint(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;

  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    _startTimes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" (%g s)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = &stru_1E2A86598;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      CalFlagForProfilingPoint_cold_1();

  }
}

void CalPerfLogStart(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
    CalPerfLogStart_cold_1();
}

void CalPerfLogEnd(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
    CalPerfLogEnd_cold_1();
}

void CalPerfLogPoint(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
    CalPerfLogPoint_cold_1();
}

void ___startTimes_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_startTimes_startTimes;
  _startTimes_startTimes = v0;

}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_18FC4D864()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_18FC4DD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  void *v25;

  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_18FC4DF00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalDarwinNotificationListener_ObservationCallback(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "_notificationWithNameReceived:");
  return result;
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void sub_18FC518A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC51944(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *EKWeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 0x14
      && (objc_msgSend(&stru_1E2A86598, "stringByAppendingString:", off_1E2A85578[a1]),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = objc_retainAutorelease(v4);
      v6 = dlopen((const char *)objc_msgSend(v5, "UTF8String"), 1);
      if (v6)
      {
        Value = v6;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v6);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v5 = 0;
    }
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __HandleForSource_cold_1(a1, v7);

    Value = 0;
    goto LABEL_12;
  }
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)&__HandlesLock);
  return Value;
}

id EKWeakLinkClass(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *EKWeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id *v3;

  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

const __CFString *__CalSystemRootDirectory()
{
  return &stru_1E2A86598;
}

void sub_18FC54A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CalAddStateCaptureBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  os_state_add_handler();

}

uint64_t _EKRecurrenceByMonthFilter(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v10);
        if (v8 == objc_msgSend(v3, "month"))
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

BOOL _EKRecurrenceByMonthDayFilterPinned(void *a1, void *a2)
{
  return _EKRecurrenceByMonthDayFilterInternal(a1, a2, 1);
}

BOOL _EKRecurrenceByMonthDayFilter(void *a1, void *a2)
{
  return _EKRecurrenceByMonthDayFilterInternal(a1, a2, 0);
}

BOOL _EKRecurrenceByDayMaskFilter(unint64_t a1, void *a2)
{
  return ((1 << (objc_msgSend(a2, "dayOfWeek") - 1)) & a1) != 0;
}

uint64_t _EKRecurrenceByDayMaskFromArrayByDayItems(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(v1, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "weekNumber") || objc_msgSend(v6, "weekNumber") == 1)
        v4 |= 1 << (objc_msgSend(v6, "dayOfTheWeek") - 1);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _EKRecurrenceApplyFiltersToSingleDate(void *a1, uint64_t a2, unint64_t a3, void *a4, char a5)
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;

  v9 = a1;
  v10 = a4;
  if ((a5 & 1) != 0)
  {
    if (!a3)
    {
      v11 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v11 = 1;
    if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0 || !a3)
      goto LABEL_9;
  }
  v12 = (_QWORD *)(a2 + 8);
  v13 = 1;
  do
  {
    v14 = ((uint64_t (*)(_QWORD, id))*(v12 - 1))(*v12, v9);
    v11 = v14;
    if (v13 >= a3)
      break;
    ++v13;
    v12 += 2;
  }
  while ((v14 & 1) != 0);
LABEL_9:

  return v11;
}

BOOL _EKRecurrenceRangeFilter(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;

  objc_msgSend(a2, "absoluteTime");
  v4 = v3;
  objc_msgSend(*(id *)a1, "absoluteTime");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 8), "absoluteTime");
  if (v4 < v6)
    return 0;
  v9 = fabs(v7);
  return v4 < v7 || v9 < 2.22044605e-16 || *(_QWORD *)(a1 + 16) != 0;
}

void _InsertAbsoluteTimeIntoArrayAtIndex(void *a1, CFAbsoluteTime a2)
{
  CFDateRef v3;
  CFDateRef v4;
  __CFArray *theArray;

  theArray = a1;
  v3 = CFDateCreate(0, a2);
  if (v3)
  {
    v4 = v3;
    CFArrayInsertValueAtIndex(theArray, 0, v3);
    CFRelease(v4);
  }

}

void _EKRecurrenceApplyBySetPosToRange(void *a1, void *a2, CFIndex *a3, void *a4, void *a5, void *a6, uint64_t a7, _QWORD *a8)
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex i;
  const void *ValueAtIndex;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  CFIndex v24;
  CFIndex v25;
  CFIndex v26;
  void *v27;
  int v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  CFIndex v32;
  id v34;
  id v35;
  const __CFArray *theArray;
  id v38;

  theArray = a1;
  v13 = a2;
  v34 = a4;
  v38 = a5;
  v35 = a6;
  v32 = a3[1];
  v14 = objc_msgSend(v13, "count");
  if (a3[1] >= 1)
  {
    v15 = v14;
    v16 = 0;
    for (i = *a3; i < *a3 + v29; ++i)
    {
      if (!v38 && !a7)
        goto LABEL_17;
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      v19 = MEMORY[0x194009994](ValueAtIndex);
      objc_msgSend(v35, "absoluteTime");
      if (vabdd_f64(v19, v20) < 2.22044605e-16)
        goto LABEL_17;
      objc_msgSend(v34, "absoluteTime");
      if (v38 && v19 >= v21)
      {
        objc_msgSend(v38, "absoluteTime");
        if (v19 >= v22 && !*a8)
          goto LABEL_17;
      }
      else if (v19 < v21)
      {
        goto LABEL_17;
      }
      if (v15 >= 1)
      {
        v23 = 0;
        v24 = i - *a3 + v16;
        v25 = v24 + 1;
        v26 = v24 - v32;
        while (1)
        {
          objc_msgSend(v13, "objectAtIndex:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "intValue");

          if (v25 == v28 || v26 == v28)
            break;
          if (v15 == ++v23)
            goto LABEL_17;
        }
        if (v38)
        {
          if (*a8)
          {
            objc_msgSend(v38, "absoluteTime");
            if (v19 >= v30)
              --*a8;
          }
        }
        v31 = a7 - 1;
        if (!a7)
          v31 = 0;
        a7 = v31;
        v29 = a3[1];
        continue;
      }
LABEL_17:
      CFArrayRemoveValueAtIndex(theArray, i);
      v29 = a3[1] - 1;
      a3[1] = v29;
      --i;
      ++v16;
    }
  }

}

void _EKRecurrenceByDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  id v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;

  v74 = a1;
  v17 = a3;
  v18 = a7;
  v19 = a8;
  v68 = a9;
  v20 = a6;
  v21 = a4;
  v77 = v20;
  v78 = objc_msgSend(v20, "count");
  v22 = v17;
  objc_msgSend(v21, "calendarDateByAddingDays:", -1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "absoluteTime");
  v25 = v24;
  objc_msgSend(v23, "absoluteTime");
  if (v25 >= v26)
  {
    v66 = 0;
    v28 = 0;
    v52 = v22;
  }
  else
  {
    v67 = v19;
    v27 = 0;
    v28 = 0;
    v75 = 0;
    v71 = 2;
    v72 = v18;
    v69 = v22;
    v70 = v23;
    do
    {
      v29 = v27;
      v30 = objc_msgSend(v22, "dayOfWeek", v67, v68);
      v31 = v30;
      v32 = v71;
      if (!v27)
        v32 = v30;
      v71 = v32;
      objc_msgSend(v22, "calendarDateByAddingMonths:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "calendarDateByAddingDays:", -1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_msgSend(v27, "dayOfWeek");
      if (v78)
      {
        v35 = v34;
        for (i = 0; i != v78; ++i)
        {
          objc_msgSend(v77, "objectAtIndex:", i);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "weekNumber"))
          {
            v38 = objc_msgSend(v37, "weekNumber");
            v39 = objc_msgSend(v37, "dayOfTheWeek");
            v40 = objc_msgSend(v37, "dayOfTheWeek");
            v41 = 7 * objc_msgSend(v37, "weekNumber");
            v42 = v40 - v31;
            if (v39 >= v31)
              v42 = v40 - v31 - 7;
            v43 = v40 - v35;
            if (v39 <= v35)
              v43 = v40 - v35 + 7;
            if (v38 >= 0)
            {
              v44 = v22;
            }
            else
            {
              v42 = v43;
              v44 = v27;
            }
            objc_msgSend(v44, "calendarDateByAddingDays:", v42 + v41);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v45, "absoluteTime");
            v47 = v46;
            objc_msgSend(v22, "absoluteTime");
            if (v47 >= v48)
            {
              objc_msgSend(v45, "absoluteTime");
              v50 = v49;
              objc_msgSend(v27, "absoluteTime");
              if (v50 <= v51)
                _EKRecurrenceResultsAddValueIfNotPresent(v74, a2, v45, a10, a11, v72, a12);
            }
            v28 = v45;
          }
          else
          {
            v75 |= 1 << (objc_msgSend(v37, "dayOfTheWeek") - 1);
          }

        }
      }
      objc_msgSend(v22, "calendarDateByAddingMonths:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "absoluteTime");
      v54 = v53;
      v23 = v70;
      objc_msgSend(v70, "absoluteTime");
      v22 = v52;
    }
    while (v54 < v55);
    v79 = v27;
    v56 = v75;
    if (v75)
    {
      v57 = 1;
      v18 = v72;
      do
      {
        v76 = v56;
        if ((v56 & 1) != 0)
        {
          v58 = 7;
          if (v57 >= v71)
            v58 = 0;
          objc_msgSend(v69, "calendarDateByAddingDays:", v57 - v71 + v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "absoluteTime");
          v61 = v60;
          objc_msgSend(v70, "absoluteTime");
          if (v61 <= v62)
          {
            do
            {
              _EKRecurrenceResultsAddValueIfNotPresent(v74, a2, v59, a10, a11, v72, a12);
              objc_msgSend(v59, "calendarDateByAddingDays:", 7);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "absoluteTime");
              v64 = v63;
              objc_msgSend(v70, "absoluteTime");
              v59 = v28;
            }
            while (v64 <= v65);
          }
          else
          {
            v28 = v59;
          }
        }
        ++v57;
        v56 >>= 1;
      }
      while (v76 > 1);
      v22 = v69;
      v23 = v70;
      v66 = v27;
      v19 = v67;
    }
    else
    {
      v18 = v72;
      v19 = v67;
      v22 = v69;
      v66 = v79;
    }
  }

}

void _EKRecurrenceByMonthDayGeneratorPinned(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  _EKRecurrenceByMonthDayGeneratorInternal(a1, a2, a3, a4, a6, a7, a8, a9, a10, a11, 1u, a12);
}

void _EKRecurrenceByMonthDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  _EKRecurrenceByMonthDayGeneratorInternal(a1, a2, a3, a4, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t _EKRecurrenceApplyGenerator(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, unsigned int a9, unint64_t *a10, _QWORD *a11, char a12)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void (*v24)(id, uint64_t *, id, void *, _QWORD, uint64_t, id, id, id, uint64_t, uint64_t, char);
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v37;
  uint64_t v41;
  uint64_t v42;
  CFRange v43;

  v17 = a1;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v41 = objc_msgSend(v17, "count");
  v42 = 0;
  if (a9 == 4)
    objc_msgSend(v21, "calendarDateByAddingYears:", 1);
  else
    objc_msgSend(v21, "calendarDateByAddingMonths:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(void (**)(id, uint64_t *, id, void *, _QWORD, uint64_t, id, id, id, uint64_t, uint64_t, char))a2;
  v23 = *(_QWORD *)(a2 + 8);
  v25 = v18;
  v24(v17, &v41, v21, v22, a9, v23, v18, v19, v20, a3, a4, a12);
  if (a10)
  {
    v26 = *a10;
    if (*a10)
    {
      v27 = v42;
      if (v42 <= v26
        || (v43.location = v26 + v41,
            v43.length = v42 - v26,
            CFArrayReplaceValues((CFMutableArrayRef)v17, v43, 0, 0),
            v26 = *a10,
            v42 = v26,
            (v27 = v26) != 0))
      {
        *a10 = v26 - v27;
      }
    }
  }
  if (a11 && *a11 && v42 >= 1)
  {
    v28 = v41 + 1;
    while (1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v28 - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceReferenceDate");
      v31 = v30;
      objc_msgSend(v20, "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceReferenceDate");
      v34 = v33;

      if (v31 >= v34 && (*a11)-- == 1)
        break;

      if (v28++ >= v42 + v41)
        goto LABEL_18;
    }
    objc_msgSend(v17, "removeObjectsInRange:", v28, v42 + v41 - v28);

  }
LABEL_18:
  v37 = v42;

  return v37;
}

void _AppendAbsoluteTimeToArray(void *a1, double a2)
{
  void *v3;
  __CFArray *theArray;

  theArray = a1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a2);
  if (v3)
    CFArrayAppendValue(theArray, v3);

}

void _EKRecurrenceByYearDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v37;

  v37 = a1;
  v17 = a3;
  v35 = a4;
  v18 = a7;
  v34 = a8;
  v33 = a9;
  v19 = a6;
  v20 = objc_msgSend(v19, "count");
  v21 = v17;
  v22 = objc_msgSend(v21, "daysInYear");
  v23 = v21;
  if (v20)
  {
    v24 = v22;
    v25 = 0;
    v26 = v22 + 1;
    v23 = v21;
    do
    {
      objc_msgSend(v19, "objectAtIndex:", v25, v33, v34, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intValue");

      if (v28 >= 0)
        v29 = 0;
      else
        v29 = v26;
      v30 = v29 + v28;
      if (v30 >= 1 && v30 <= v24)
      {
        objc_msgSend(v21, "calendarDateByAddingDays:", v30 - 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        _EKRecurrenceResultsAddValueIfNotPresent(v37, a2, v32, a10, a11, v18, a12);
        v23 = v32;
      }
      ++v25;
    }
    while (v20 != v25);
  }

}

uint64_t _EKRecurrenceByDayFilter(void *a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = a2;
  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(v3, "dayOfWeek");
  if (v4)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 1;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "dayOfTheWeek") == v6)
      {
        if (!objc_msgSend(v10, "weekNumber"))
        {

          v16 = 1;
          goto LABEL_25;
        }
        if (objc_msgSend(v10, "weekNumber") < 1)
        {
          if (!v8)
          {
            objc_msgSend(v3, "calendarDateForEndOfMonth");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "dayOfWeek");
            v19 = 7;
            if (v18 >= v6)
              v19 = 0;
            objc_msgSend(v17, "calendarDateByAddingDays:", v18 - v6 + v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = objc_msgSend(v20, "differenceInDays:", v3) / 7 + 1;
          }
          v15 = objc_msgSend(v10, "weekNumber") + v8 == 0;
        }
        else
        {
          if (!v7)
          {
            objc_msgSend(v3, "calendarDateForMonth");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "dayOfWeek");
            v13 = 7;
            if (v6 >= v12)
              v13 = 0;
            objc_msgSend(v11, "calendarDateByAddingDays:", v6 - v12 + v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = objc_msgSend(v3, "differenceInDays:", v14) / 7 + 1;
          }
          v15 = objc_msgSend(v10, "weekNumber") == v7;
        }
        v16 = v15;
      }
      else
      {
        v16 = 0;
      }

      if (v9 < v4)
      {
        ++v9;
        if (!(_DWORD)v16)
          continue;
      }
      goto LABEL_25;
    }
  }
  v16 = 0;
LABEL_25:

  return v16;
}

BOOL _EKRecurrenceByWeekNoFilter(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t ValueAtIndex;
  _BOOL8 v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "weekOfYear");
  v5 = objc_msgSend(*(id *)(a1 + 8), "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    do
    {
      ValueAtIndex = (unint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 8), v8 - 1);
      if ((ValueAtIndex & 0x8000000000000000) != 0)
      {
        if (!v7)
          v7 = objc_msgSend(v3, "weeksInYear");
        ValueAtIndex += v7 + 1;
      }
      v10 = ValueAtIndex == v4;
      if (v8 >= v6)
        break;
      ++v8;
    }
    while (ValueAtIndex != v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL _EKRecurrenceByMonthDayFilterInternal(void *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;

  v5 = a2;
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");
      v12 = v11;
      if (v11 < 0)
        break;
      if (a3)
        goto LABEL_9;
LABEL_13:
      v13 = objc_msgSend(v5, "day");
      v14 = v12 == v13;

      if (v9 < v7)
      {
        ++v9;
        if (v12 != v13)
          continue;
      }
      goto LABEL_17;
    }
    if (!v8)
      v8 = objc_msgSend(v5, "daysInMonth");
    v12 += v8 + 1;
    if (!a3)
      goto LABEL_13;
LABEL_9:
    if (!v8)
      v8 = objc_msgSend(v5, "daysInMonth");
    if (v12 >= v8)
      v12 = v8;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

void _EKRecurrenceResultsAddValueIfNotPresent(void *a1, CFRange *a2, void *a3, uint64_t a4, unint64_t a5, void *a6, char a7)
{
  id v13;
  id v14;
  CFIndex location;
  CFIndex length;
  CFAbsoluteTime v17;
  CFDateRef v18;
  CFIndex v19;
  CFIndex v20;
  const void *ValueAtIndex;
  CFIndex v22;
  const __CFArray *theArray;

  theArray = a1;
  v13 = a3;
  v14 = a6;
  if ((a7 & 1) != 0 || (objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
  {
    location = a2->location;
    length = a2->length;
    if (!a5 || _EKRecurrenceApplyFiltersToSingleDate(v13, a4, a5, v14, a7))
    {
      objc_msgSend(v13, "absoluteTime");
      v18 = CFDateCreate(0, v17);
      v19 = CFArrayBSearchValues(theArray, *a2, v18, MEMORY[0x1E0C98440], 0);
      v20 = v19;
      if (v19 >= length + location
        || v19 < 0
        || (ValueAtIndex = CFArrayGetValueAtIndex(theArray, v19), !CFEqual(ValueAtIndex, v18)))
      {
        if (v20 >= length + location)
          v22 = length + location;
        else
          v22 = v20;
        CFArrayInsertValueAtIndex(theArray, v22, v18);
        ++a2->length;
      }
      CFRelease(v18);
    }
  }

}

void _EKRecurrenceByMonthDayGeneratorInternal(void *a1, CFRange *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, unint64_t a10, unsigned __int8 a11, char a12)
{
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v46;
  id v47;

  v47 = a1;
  v18 = a3;
  v19 = a4;
  v46 = a6;
  v43 = a7;
  v42 = a8;
  v20 = a5;
  v21 = objc_msgSend(v20, "count");
  v22 = v18;
  objc_msgSend(v22, "absoluteTime");
  v24 = v23;
  v44 = v19;
  objc_msgSend(v19, "absoluteTime");
  v41 = v22;
  v25 = 0;
  if (v24 < v26)
  {
    v27 = v22;
    do
    {
      v28 = objc_msgSend(v27, "daysInMonth", v41, v42, v43);
      if (v21)
      {
        v29 = v28;
        v30 = 0;
        v31 = v28 + 1;
        do
        {
          objc_msgSend(v20, "objectAtIndex:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "intValue");

          if (v33 >= 0)
            v34 = 0;
          else
            v34 = v31;
          v35 = v34 + v33;
          if ((a11 & (v35 > v29)) != 0)
            v35 = v29;
          if (v35 >= 1 && v35 <= v29)
          {
            objc_msgSend(v27, "calendarDateByAddingDays:", v35 - 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            _EKRecurrenceResultsAddValueIfNotPresent(v47, a2, v37, a9, a10, v46, a12);
            v25 = v37;
          }
          ++v30;
        }
        while (v21 != v30);
      }
      objc_msgSend(v27, "calendarDateByAddingMonths:", 1);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "absoluteTime");
      v39 = v38;
      objc_msgSend(v44, "absoluteTime");
      v27 = v22;
    }
    while (v39 < v40);
  }

}

void sub_18FC594D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC596E8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18FC59708(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18FC596B8);
}

double CalTimeIntervalConvertToNanoSeconds()
{
  return 0.0;
}

void sub_18FC5A58C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FC5BB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18FC5BCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC5C304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void CalDoNotCallThisInitializer()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Usage of this initializer is forbidden."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

void CalSubclassShouldImplement()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("It is intended for this code to be implemented by subclasses."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

void CalUnimplemented()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("This code has been left unimplemented."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

__CFString *CalBooleanAsString(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

uint64_t CalConvertNSIntegerToNSUInteger(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = a1;
  if (a1 < 0)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      CalConvertNSIntegerToNSUInteger_cold_1(v1, v2);

    return 0;
  }
  return v1;
}

uint64_t CalConvertNSUIntegerToNSInteger(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = a1;
  if (a1 < 0)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      CalConvertNSUIntegerToNSInteger_cold_1(v1, v2);

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v1;
}

uint64_t CalSetForceReminderBridgeEnabled(uint64_t result)
{
  _forceReminderBridgeEnabled = result;
  return result;
}

BOOL CalIsReminderBridgeEnabled()
{
  return _forceReminderBridgeEnabled != 2;
}

uint64_t CalMonotonicTime()
{
  uint64_t result;

  result = override;
  if (!override)
    return mach_absolute_time();
  return result;
}

uint64_t CalTimeSetOverride(uint64_t result)
{
  override = result;
  return result;
}

uint64_t CalContinuousTime()
{
  uint64_t result;

  result = override;
  if (!override)
    return mach_continuous_time();
  return result;
}

uint64_t CalApproximateContinuousTime()
{
  uint64_t result;

  result = override;
  if (!override)
    return mach_continuous_approximate_time();
  return result;
}

double CalContinuousIntervalToNSTimeInterval(unint64_t a1)
{
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;

  if (override)
    return (double)a1 * 0.5;
  info = 0;
  mach_timebase_info(&info);
  LODWORD(v4) = info.denom;
  LODWORD(v3) = info.numer;
  return (double)a1 * (double)v3 / (double)v4 / 1000000000.0;
}

unint64_t CalNSTimeIntervalToContinuousInterval(double a1)
{
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;

  if (override)
  {
    return (unint64_t)(a1 + a1);
  }
  else
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v4) = info.numer;
    return (unint64_t)(a1 * 1000000000.0 * (double)v3 / (double)v4);
  }
}

const char *CalendarFeatureFlags.domain.getter()
{
  return "Calendar";
}

uint64_t CalendarFeatureFlags.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_18FC5EDA0 + 4 * byte_18FC71300[*v0]))("all_on", 6);
}

const char *sub_18FC5EDA0()
{
  return "quick_feature_toggle";
}

const char *sub_18FC5EDB4()
{
  return "resizeable_month";
}

const char *sub_18FC5EDC8()
{
  return "app_intents";
}

BOOL static CalendarFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CalendarFeatureFlags.hash(into:)()
{
  return sub_18FC64A38();
}

uint64_t CalendarFeatureFlags.hashValue.getter()
{
  sub_18FC64A2C();
  sub_18FC64A38();
  return sub_18FC64A44();
}

BOOL sub_18FC5EE5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_18FC5EE70()
{
  sub_18FC64A2C();
  sub_18FC64A38();
  return sub_18FC64A44();
}

uint64_t sub_18FC5EEB4()
{
  return sub_18FC64A38();
}

uint64_t sub_18FC5EEDC()
{
  sub_18FC64A2C();
  sub_18FC64A38();
  return sub_18FC64A44();
}

unint64_t sub_18FC5EF20()
{
  unint64_t result;

  result = qword_1EE1943E8;
  if (!qword_1EE1943E8)
  {
    result = MEMORY[0x19400A39C](&protocol conformance descriptor for CalendarFeatureFlags, &type metadata for CalendarFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EE1943E8);
  }
  return result;
}

const char *sub_18FC5EF64()
{
  return "Calendar";
}

uint64_t sub_18FC5EF78()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_18FC5EFA0 + 4 * byte_18FC71304[*v0]))("all_on", 6);
}

const char *sub_18FC5EFA0()
{
  return "quick_feature_toggle";
}

const char *sub_18FC5EFB4()
{
  return "resizeable_month";
}

const char *sub_18FC5EFC8()
{
  return "app_intents";
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CalendarFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CalendarFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_18FC5F0C8 + 4 * byte_18FC7130D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_18FC5F0FC + 4 * byte_18FC71308[v4]))();
}

uint64_t sub_18FC5F0FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18FC5F104(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18FC5F10CLL);
  return result;
}

uint64_t sub_18FC5F118(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18FC5F120);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_18FC5F124(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18FC5F12C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18FC5F138(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18FC5F144(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CalendarFeatureFlags()
{
  return &type metadata for CalendarFeatureFlags;
}

uint64_t sub_18FC5F15C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getCHSTimelineControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ChronoServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CalWidgetUtils.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCHSTimelineControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHSTimelineControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalWidgetUtils.m"), 17, CFSTR("Unable to find class %s"), "CHSTimelineController");

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libMobileGestaltLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CalContactsProvider.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void CalSetSystemTimeZone_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "CalSetSystemTimeZone: Posting kCalTimeZoneChangedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CalSetSystemTimeZone_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "CalSetSystemTimeZone: setting __SystemTimeZone to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void CalSetSystemTimeZone_cold_3(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)__SystemTimeZone, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v4, v5, "CalSetSystemTimeZone: updating __SystemTimeZone from %@ to %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void CalSetSystemTimeZone_cold_4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "CalSetSystemTimeZone: __SystemTimeZone is the same (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void _CalCopyDefaultTimeZone_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalCopyDefaultTimeZone: No __SystemTimeZone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalCopyDefaultTimeZone_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18FC12000, v0, OS_LOG_TYPE_DEBUG, "_CalCopyDefaultTimeZone: returning %@", v1, 0xCu);
}

void _CalCopyDefaultTimeZone_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalCopyDefaultTimeZone: no value from cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalCopyDefaultTimeZone_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalCopyDefaultTimeZone: no value for kCalTimeZoneKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalCopyDefaultTimeZone_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalCopyDefaultTimeZone: no value for kCalTimeZonePrefKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalCopyDefaultTimeZone_cold_6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "_CalCopyDefaultTimeZone: autoTimeZone %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void _CalSetTimeZone_cold_1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)__TimeZone, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v4, v5, "_CalSetTimeZone: updating __TimeZone from %@ to %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void _CalSetTimeZone_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "_CalSetTimeZone: setting __TimeZone to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void _CalCopySystemTimeZone_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)__SystemTimeZone, "name");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v1, v2, "_CalCopySystemTimeZone: No __SystemTimeZone, setting to %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_12_0();
}

void CalSetDefaultTimeZone_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "CalSetDefaultTimeZone to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void _CalDefaultTimeZoneSettingsChanged_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalDefaultTimeZoneSettingsChanged: __TimeZone hasn't been set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalDefaultTimeZoneSettingsChanged_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalDefaultTimeZoneSettingsChanged: Posting kCalTimeZoneChangedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalDefaultTimeZoneSettingsChanged_cold_3(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)__TimeZone, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v4, v5, "_CalDefaultTimeZoneSettingsChanged: updating __TimeZone from %@ to %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void _CalTimeZoneForceUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalTimeZoneForceUpdate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalTimeZoneForceUpdate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalTimeZoneForceUpdate: update ignored because __SystemTimeZone and __TimeZone are null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _significantTimeChange_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_significantTimeChange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalTimeZonePrefChanged_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "_CalTimeZonePrefChanged: echo count 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _CalTimeZonePrefChanged_cold_2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = __TimeZoneNotificationEchoCount;
  _os_log_debug_impl(&dword_18FC12000, log, OS_LOG_TYPE_DEBUG, "_CalTimeZonePrefChanged: echo count %i", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_2();
}

void _CalCopyTimeZone_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18FC12000, v2, v3, "CalCopyTimeZone: __TimeZone not set yet, setting to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void NSDateFromICSValueInTimeZone_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Invalid value passed to NSDateFromICSValueInTimeZone. Supported types: ICSDateTimeValue, ICSDateValue", v1, 2u);
}

void CalRoundDoubleToNearestMultiple_cold_1(NSObject *a1, double a2, double a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_18FC12000, a1, OS_LOG_TYPE_ERROR, "Passed in a 'multiple' value of [%@].  Will not attempt to round value [%@] to the nearest multiple of that number.", (uint8_t *)&v7, 0x16u);

}

void CalFlagForProfilingStart_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Starting profile of %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void CalFlagForProfilingEnd_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_18FC12000, v0, v1, "Ending profile of %@%@");
  OUTLINED_FUNCTION_4();
}

void CalFlagForProfilingPoint_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_18FC12000, v0, v1, "Point flagged for %@%@");
  OUTLINED_FUNCTION_4();
}

void CalPerfLogStart_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Perf starting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void CalPerfLogEnd_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Perf ending %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void CalPerfLogPoint_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Perf point %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __HandleForSource_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2080;
  v6 = dlerror();
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Error loading source %li: %s", (uint8_t *)&v3, 0x16u);
}

void CalConvertNSIntegerToNSUInteger_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Cannot convert a negative integer [%ld] to an unsigned integer.", (uint8_t *)&v2, 0xCu);
}

void CalConvertNSUIntegerToNSInteger_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Cannot convert an unsigned integer [%lu], which is greater than [%ld], to an integer.", (uint8_t *)&v2, 0x16u);
}

uint64_t sub_18FC64A2C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18FC64A38()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18FC64A44()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1E0D034E8]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1E0D034F0]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1E0D03508]();
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C50](tz, units, at);
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1E0C97C68](tz, at);
}

CFGregorianUnits *__cdecl CFAbsoluteTimeGetDifferenceAsGregorianUnits(CFGregorianUnits *__return_ptr retstr, CFAbsoluteTime at1, CFAbsoluteTime at2, CFTimeZoneRef tz, CFOptionFlags unitFlags)
{
  return (CFGregorianUnits *)MEMORY[0x1E0C97C78](retstr, tz, unitFlags, at1, at2);
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

SInt32 CFAbsoluteTimeGetWeekOfYear(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1E0C97C90](tz, at);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x1E0C98270](calendar, smallerUnit, biggerUnit, at);
  result.length = v5;
  result.location = v4;
  return result;
}

void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy)
{
  MEMORY[0x1E0C98280](calendar, wkdy);
}

void CFCalendarSetMinimumDaysInFirstWeek(CFCalendarRef calendar, CFIndex mwd)
{
  MEMORY[0x1E0C98290](calendar, mwd);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98458](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1E0C98468](allocator, tmplate, options, locale);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1E0C984A8](formatter);
}

CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x1E0C984B0](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0C984C8](formatter, key, value);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C98748](*(_QWORD *)&gdate.year, *(_QWORD *)&gdate.second, tz);
  return result;
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
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

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C99268](tz, at);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99288](allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return (CFStringRef)MEMORY[0x1E0C99298](tz);
}

void CFTimeZoneResetSystem(void)
{
  MEMORY[0x1E0C992A8]();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t ICSDefaultPRODID()
{
  return MEMORY[0x1E0DDB770]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1E0C83C68]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

UBool u_isUAlphabetic(UChar32 c)
{
  return MEMORY[0x1E0DE59F0](*(_QWORD *)&c);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x1E0DE5A08](*(_QWORD *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1E0DE5A48](*(_QWORD *)&c);
}

int32_t u_strcmp(const UChar *s1, const UChar *s2)
{
  return MEMORY[0x1E0DE5AE0](s1, s2);
}

uint64_t ucal_close()
{
  return MEMORY[0x1E0DE5D30]();
}

uint64_t ucal_getCanonicalTimeZoneID()
{
  return MEMORY[0x1E0DE5D48]();
}

uint64_t ucal_getDayOfWeekType()
{
  return MEMORY[0x1E0DE5D58]();
}

uint64_t ucal_open()
{
  return MEMORY[0x1E0DE5DD8]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

