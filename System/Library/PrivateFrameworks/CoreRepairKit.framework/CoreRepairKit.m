void sub_1D1405250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D1405260(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D1405270(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D14052C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1D1405310(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1D1405710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D140574C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D140575C(uint64_t a1)
{

}

void sub_1D1405764(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1D140D0F8((uint64_t)v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_1D14057D4(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  handleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109120;
    LODWORD(v22) = a2;
    _os_log_impl(&dword_1D1401000, v9, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v21, 8u);
  }

  handleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v7;
    _os_log_impl(&dword_1D1401000, v10, OS_LOG_TYPE_DEFAULT, "systemhealth %@", (uint8_t *)&v21, 0xCu);
  }

  handleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1D1401000, v11, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v21, 0xCu);
  }

  v12 = *(_QWORD *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v7;
  v17 = v7;

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1[7] + 8) + 40), v18, v19, v20);
}

void sub_1D14061F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

__CFString *getDeviceChemID()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v3;
  __CFString *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v0 = sub_1D14074CC("IOPMPowerSource", 0, 0);
  if (v0)
  {
    v1 = v0;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v0, CFSTR("BatteryData"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v3 = CFProperty;
      CFDictionaryGetValue(CFProperty, CFSTR("AlgoChemID"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      handleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          v32 = 138412546;
          v33 = CFSTR("AlgoChemID");
          v34 = 2112;
          v35 = v4;
LABEL_11:
          _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "Found %@; returning chemID with value %@",
            (uint8_t *)&v32,
            0x16u);
        }
      }
      else
      {
        if (v6)
        {
          v32 = 138412546;
          v33 = CFSTR("AlgoChemID");
          v34 = 2112;
          v35 = CFSTR("ChemID");
          _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "%@ not found in battery data; looking for %@",
            (uint8_t *)&v32,
            0x16u);
        }

        CFDictionaryGetValue(v3, CFSTR("ChemID"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        handleForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        v5 = v7;
        if (!v4)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_1D140D904(v5, v25, v26, v27, v28, v29, v30, v31);
          v4 = 0;
          goto LABEL_12;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v32 = 138412546;
          v33 = CFSTR("ChemID");
          v34 = 2112;
          v35 = v4;
          goto LABEL_11;
        }
      }
LABEL_12:

      IOObjectRelease(v1);
      CFRelease(v3);
      return v4;
    }
    handleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1D140D894(v17, v18, v19, v20, v21, v22, v23, v24);

    IOObjectRelease(v1);
  }
  else
  {
    handleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D140D824(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return (__CFString *)0;
}

CFMutableDictionaryRef sub_1D14074CC(const char *a1, void *a2, const void *a3)
{
  CFMutableDictionaryRef result;
  __CFDictionary *v5;
  CFDictionaryRef v6;
  const void *v7;
  void *keys;

  v7 = a3;
  keys = a2;
  result = IOServiceMatching(a1);
  if (result)
  {
    v5 = result;
    if (a2)
    {
      v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&keys, &v7, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(v5, CFSTR("IOPropertyMatch"), v6);
      if (v6)
        CFRelease(v6);
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v5);
  }
  return result;
}

id hasHadBatteryRepairUsingCBCC()
{
  io_registry_entry_t v0;
  io_object_t v1;
  void *CFProperty;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t isEqualToString;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (MGGetProductType() != 1234705395)
  {
    handleForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1D140DA14();

    goto LABEL_18;
  }
  v0 = sub_1D14074CC("AppleSPUHIDInterface", CFSTR("name"), CFSTR("compass"));
  if (!v0)
  {
    handleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1D140D974(v21, v22, v23, v24, v25, v26, v27, v28);

LABEL_18:
    v17 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_11;
  }
  v1 = v0;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, CFSTR("compass-battery-compensation"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = CFProperty;
  if (CFProperty)
  {
    objc_msgSend_convertToHexString(CFProperty, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    handleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = v7;
      _os_log_impl(&dword_1D1401000, v8, OS_LOG_TYPE_DEFAULT, "CBCC attribute is %@", (uint8_t *)&v37, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend_isEqualToString_(v7, v10, (uint64_t)CFSTR("01000000DB000000B1FFFFFFCEFFFFFF91000000CBFFFFFFE6FFFFFF"), v11) & 1) != 0)
    {
      objc_msgSend_numberWithBool_(v9, v12, 1, v13);
    }
    else
    {
      isEqualToString = objc_msgSend_isEqualToString_(v7, v12, (uint64_t)CFSTR("0100000075100000CDFFFFFFDCFFFFFFA0100000D6FFFFFFE0FFFFFF"), v13);
      objc_msgSend_numberWithBool_(v9, v15, isEqualToString, v16);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    handleForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1D140D9E4(v29, v30, v31, v32, v33, v34, v35, v36);

    v7 = 0;
    v17 = 0;
  }
  IOObjectRelease(v1);
LABEL_11:
  v18 = v17;

  return v18;
}

id hasHadBatteryRepair()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  uint64_t hasHadAuthorizedRepairForComponent;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;

  if (MGGetProductType() == 1234705395)
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    hasHadAuthorizedRepairForComponent = objc_msgSend_hasHadAuthorizedRepairForComponent_(CRRepairStatus, v0, 0, v1);
    objc_msgSend_numberWithBool_(v2, v4, hasHadAuthorizedRepairForComponent, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    handleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D140DA14();

    v6 = 0;
  }
  return v6;
}

void sub_1D1407840(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_1D1407960(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  mach_port_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const __CFDictionary *v14;
  uint64_t MatchingService;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E9223290, a2, (uint64_t)&v20, (uint64_t)v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v5 = *MEMORY[0x1E0CBBAA8];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(&unk_1E9223290);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        handleForCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v7;
          _os_log_impl(&dword_1D1401000, v8, OS_LOG_TYPE_DEFAULT, "Matching service %@", buf, 0xCu);
        }

        v9 = objc_retainAutorelease(v7);
        v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
        v14 = IOServiceMatching(v13);
        MatchingService = IOServiceGetMatchingService(v5, v14);
        if ((_DWORD)MatchingService)
        {
          v17 = MatchingService;
          handleForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_impl(&dword_1D1401000, v18, OS_LOG_TYPE_DEFAULT, "Found service %@", buf, 0xCu);
          }

          return v17;
        }
      }
      v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E9223290, v16, (uint64_t)&v20, (uint64_t)v26, 16);
      if (v3)
        continue;
      break;
    }
  }
  return 0;
}

void sub_1D1407EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D140808C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D14080AC(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint8_t buf[4];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    v2 = 0;
    do
    {
      handleForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v2;
        _os_log_impl(&dword_1D1401000, v3, OS_LOG_TYPE_DEFAULT, "Retry Count:%d", buf, 8u);
      }

      sleep(0xAu);
      result = objc_msgSend_copyComponentStatus(*(void **)(v1 + 32), v4, v5, v6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
        v7 = 1;
      else
        v7 = v2 >= 9;
      ++v2;
    }
    while (!v7);
  }
  return result;
}

void sub_1D14085B8()
{
  dispatch_semaphore_t v0;
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v0 = dispatch_semaphore_create(0);
  v1 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v3 = (void *)objc_msgSend_initWithMachServiceName_options_(v1, v2, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v4, (uint64_t)&unk_1EFC5DB08, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  objc_msgSend_resume(v3, v9, v10, v11);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D1408748;
  v26[3] = &unk_1E9220728;
  v13 = v0;
  v27 = v13;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v3, v14, (uint64_t)v26, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = sub_1D14087B0;
  v23[3] = &unk_1E9220750;
  v24 = v3;
  v17 = v13;
  v25 = v17;
  v18 = v3;
  objc_msgSend_queryRepairDeltaWithReply_(v16, v19, (uint64_t)v23, v20);

  v21 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v17, v21))
  {
    handleForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1D140DB3C();

  }
}

void sub_1D1408748(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  handleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1D140DB68((uint64_t)v3, v4);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1D14087B0(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (v7 && !v8 && (a2 & 1) != 0)
  {
    v52 = a1;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v53 = v7;
    obj = v7;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v55, (uint64_t)v61, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v56 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v21, v16, (uint64_t)CFSTR("key"), v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v23, (uint64_t)CFSTR("identifier"), v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v25;
          if (v22)
            v29 = v25 == 0;
          else
            v29 = 1;
          if (!v29)
          {
            objc_msgSend_objectForKeyedSubscript_(v13, v26, (uint64_t)v22, v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v13, v35, (uint64_t)v34, (uint64_t)v22);

            }
            v36 = objc_alloc(MEMORY[0x1E0CB3940]);
            v37 = objc_alloc(MEMORY[0x1E0C99D50]);
            v39 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v37, v38, (uint64_t)v28, 0);
            v41 = (void *)objc_msgSend_initWithData_encoding_(v36, v40, (uint64_t)v39, 4);

            objc_msgSend_objectForKeyedSubscript_(v13, v42, (uint64_t)v22, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v44, v45, (uint64_t)v41, v46);

          }
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v55, (uint64_t)v61, 16);
      }
      while (v18);
    }

    handleForCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v13;
      _os_log_impl(&dword_1D1401000, v47, OS_LOG_TYPE_DEFAULT, "delta components: %@", buf, 0xCu);
    }

    v48 = qword_1ED932168;
    qword_1ED932168 = (uint64_t)v13;
    a1 = v52;
    v7 = v53;
    v12 = 0;
  }
  else
  {
    handleForCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_1D140DBDC(a2, (uint64_t)v12, v48);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v49, v50, v51);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1D1408E98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1409260(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D140B4F0(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (sub_1D140BF6C((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t sub_1D140B564(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = sub_1D140BD74((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = sub_1D140C204(&v7, 4u, (uint64_t)&unk_1D140E968, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (sub_1D140B4F0(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D140B644(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = sub_1D140C204(a1, 2u, (uint64_t)&unk_1D140EC80, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = sub_1D140BF6C(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D140B6C4(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = sub_1D140C13C(a1, 7u, (uint64_t)&unk_1D140EA58, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (sub_1D140B4F0(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u, v8 = 0u,
                            result = sub_1D140B644((unint64_t *)(a2 + 80), (char **)&v7),
                            !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = sub_1D140B77C(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D140B77C(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = sub_1D140C13C(result, 2u, (uint64_t)&unk_1D140EC50, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (sub_1D140B4F0(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1D140B7F8(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 6;
  if (a1 && a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = sub_1D140B6C4(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = sub_1D140C13C(a1, 6u, (uint64_t)&unk_1D140E9C8, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (sub_1D140B4F0(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = sub_1D140B644(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t sub_1D140B900(_QWORD *a1, unint64_t a2)
{
  return sub_1D140B91C(a1, 5uLL, (uint64_t)&unk_1D140EB00, a2, 0x494D344Du);
}

uint64_t sub_1D140B91C(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = sub_1D140C13C((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (sub_1D140B4F0(a4, a5))
        return 2;
      v9 = 0;
      result = sub_1D140BF6C((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t sub_1D140B9C8(_QWORD *a1, unint64_t a2)
{
  return sub_1D140B91C(a1, 3uLL, (uint64_t)&unk_1D140EBD8, a2, 0x494D344Du);
}

uint64_t sub_1D140B9E4(_QWORD *a1, unint64_t a2)
{
  return sub_1D140B91C(a1, 4uLL, (uint64_t)&unk_1D140EB78, a2, 0x494D3443u);
}

uint64_t sub_1D140BA00(_QWORD *a1, unint64_t a2)
{
  return sub_1D140B91C(a1, 3uLL, (uint64_t)&unk_1D140EBD8, a2, 0x494D3443u);
}

uint64_t sub_1D140BA1C(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = sub_1D140C13C(result, 2u, (uint64_t)&unk_1D140EC20, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (sub_1D140B4F0(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1D140BA98(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_1D140BAD0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = sub_1D140BA98(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

double sub_1D140BB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!sub_1D140B564(v9, (unint64_t)&v5)
        && !sub_1D140B7F8((uint64_t)&v6, a3 + 88)
        && !sub_1D140B900(&v7, a3 + 232)
        && !sub_1D140BA1C((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

uint64_t sub_1D140BC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D140BC38(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_1D140BC38(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = sub_1D140B9E4(&v15, v10);
      else
        result = sub_1D140BA00(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = sub_1D140B900(&v15, v9);
      else
        result = sub_1D140B9C8(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = sub_1D140BD7C((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t sub_1D140BD74(uint64_t a1, unint64_t *a2)
{
  return sub_1D140BD7C(a1, a2, 0);
}

uint64_t sub_1D140BD7C(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_1D140BF6C(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = sub_1D140BFEC(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_1D140BFEC(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

unint64_t *sub_1D140C054(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_1D140C080(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = sub_1D140BD7C((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_1D140C13C(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  memset(v12, 170, 24);
  result = sub_1D140BD7C(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return sub_1D140C204(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t sub_1D140C204(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = sub_1D140C080(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t sub_1D140C4D4(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFAllocator *v27;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), (const void *)*MEMORY[0x1E0C9AE50]);
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAB8], v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        v27 = v5;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = v27;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

void sub_1D140C8D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D1405310(*MEMORY[0x1E0C80C00]);
  sub_1D1405304();
  sub_1D1405260(&dword_1D1401000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140C938()
{
  uint64_t v0;
  os_log_t v1;

  sub_1D14052E0();
  sub_1D1405270(&dword_1D1401000, v0, v1, "Failed to verify local %@ data; error: %@");
  sub_1D14052BC();
}

void sub_1D140C99C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1D14052E0();
  sub_1D1405270(&dword_1D1401000, v0, v1, "Failed to read local %@ data; error: %@");
  sub_1D14052BC();
}

void sub_1D140CA00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052D4();
  sub_1D1405260(&dword_1D1401000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140CA60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D14052C4(&dword_1D1401000, a2, a3, "Failed to get payload; stat: %d", a5, a6, a7, a8, 0);
  sub_1D1405284();
}

void sub_1D140CAC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D14052C4(&dword_1D1401000, a2, a3, "Failed to parse cert as img4; stat: %d", a5, a6, a7, a8, 0);
  sub_1D1405284();
}

void sub_1D140CB28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CB54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D1405310(*MEMORY[0x1E0C80C00]);
  sub_1D1405304();
  sub_1D1405260(&dword_1D1401000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140CBB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D1405310(*MEMORY[0x1E0C80C00]);
  sub_1D1405304();
  sub_1D1405260(&dword_1D1401000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140CC14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052D4();
  sub_1D1405260(&dword_1D1401000, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140CC74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CCA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CCCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CCF8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend_localizedDescription(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1D14052D4();
  _os_log_error_impl(&dword_1D1401000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@", v6, 0xCu);

  sub_1D14052A4();
}

void sub_1D140CD80()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_1D14052F8();
  sub_1D140528C();
  sub_1D1405270(&dword_1D1401000, v1, v2, "Failed to read sealed property of %@: %@");

  sub_1D14052A4();
}

void sub_1D140CDE8()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_1D14052F8();
  sub_1D140528C();
  sub_1D1405270(&dword_1D1401000, v1, v2, "Failed to read live property of %@: %@");

  sub_1D14052A4();
}

void sub_1D140CE50()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_1D14052F8();
  sub_1D140528C();
  sub_1D1405270(&dword_1D1401000, v1, v2, "Failed to read sealed instances of %@: %@");

  sub_1D14052A4();
}

void sub_1D140CEB8()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_1D14052F8();
  sub_1D140528C();
  sub_1D1405270(&dword_1D1401000, v1, v2, "Failed to read live instances of %@: %@");

  sub_1D14052A4();
}

void sub_1D140CF20(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;

  v8 = *a1;
  sub_1D1405260(&dword_1D1401000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);

  sub_1D14052A4();
}

void sub_1D140CF90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140CFE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D06C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D1405310(*MEMORY[0x1E0C80C00]);
  sub_1D1405304();
  sub_1D1405260(&dword_1D1401000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140D0F8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D1401000, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1D140D16C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a2, a3, "Failed to obatin FW path:%@", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D1D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_1D14061F4(&dword_1D1401000, a3, (uint64_t)a3, "Faild to read OS Boot Hash from %@; error: %@", (uint8_t *)&v3);
  sub_1D14052BC();
}

void sub_1D140D248(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a1, a3, "Failed to obatin FW path:%@", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D2B0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("diagnostic-boot-intent");
  v5 = 2112;
  v6 = a1;
  sub_1D14061F4(&dword_1D1401000, a2, a3, "readNVRAMValueForKey %@ failed: %@", (uint8_t *)&v3);
  sub_1D14052BC();
}

void sub_1D140D32C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a2, a3, "Failed to deserialize data for boot intent dictionary, error %@", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Failed to get boot intent purpose", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D3BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "SSR boot intent not found", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Unexpected SSR boot intent purpose format", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Unexpected SSR boot intent format", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D440(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D1401000, a2, OS_LOG_TYPE_ERROR, "Unable to find Application after:%d retries", (uint8_t *)v2, 8u);
}

void sub_1D140D4B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D1401000, log, OS_LOG_TYPE_ERROR, "re building DB failed", v1, 2u);
}

void sub_1D140D4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D520(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D1401000, a2, OS_LOG_TYPE_ERROR, "SecTrustSetAnchorCertificates failed: %d", (uint8_t *)v2, 8u);
  sub_1D1405284();
}

void sub_1D140D590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "No policy.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D5BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "No server trust.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D5E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "No protection space.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140D614(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a2, a3, "Component %llu in MRComponentType enum is not supported for authorized repair for this device", a5, a6, a7, a8, 0);
  sub_1D14052BC();
}

void sub_1D140D678(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a2, a3, "Failed to copy key RepairStatus, error: %@", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D6E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405250(&dword_1D1401000, a1, a3, "rpcp can't be parsed", a5, a6, a7, a8, 0);
  sub_1D1405284();
}

void sub_1D140D710(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a2, a3, "%@ not in repair status", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D774(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D1401000, log, OS_LOG_TYPE_DEBUG, "SpTS:\n %@\n %@", (uint8_t *)&v3, 0x16u);
  sub_1D14052BC();
}

void sub_1D140D7F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405250(&dword_1D1401000, a1, a3, " failed to get version info", a5, a6, a7, a8, 0);
  sub_1D1405284();
}

void sub_1D140D824(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a1, a3, "Cannot find matching service to %s", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D894(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a1, a3, "Cannot find property entry to %@", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D904(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a1, a3, "Cannot find entry %@ in battery data", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D974(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405260(&dword_1D1401000, a1, a3, "Cannot find matching service to %s with name:compass", a5, a6, a7, a8, 2u);
  sub_1D14052BC();
}

void sub_1D140D9E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D1405250(&dword_1D1401000, a1, a3, "Cannot find property \"compass-battery-compensation\" in compass node", a5, a6, a7, a8, 0);
  sub_1D1405284();
}

void sub_1D140DA14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D1407820();
  sub_1D1407840(&dword_1D1401000, v0, v1, "Product type %lx is not the expected product type %x", v2, v3, v4, v5, v6);
  sub_1D14052BC();
}

void sub_1D140DA74(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D1401000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", (uint8_t *)v2, 8u);
  sub_1D1405284();
}

void sub_1D140DAE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "IOREG Auth Component Timeout", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DB10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "IOREG Auth Component Not Populated", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DB3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "queryRepairDelta timeout", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DB68(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D1401000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1D140DBDC(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1D1401000, log, OS_LOG_TYPE_ERROR, "queryRepairDelta failed: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_1D140DC64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Cannot find camera service", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DC90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Audio failed with Speaker issue.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DCBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Audio failed with Codec issue.", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

void sub_1D140DCE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D14052B0();
  sub_1D1405250(&dword_1D1401000, v0, v1, "Cannot find matched camera service", v2, v3, v4, v5, v6);
  sub_1D1405284();
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x1E0DE00A0]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x1E0DE00A8]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x1E0DE00B0]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x1E0DE00B8]();
}

uint64_t AMFDRSealingManifestCopyDataClassesInstancesAndProperties()
{
  return MEMORY[0x1E0DE00C0]();
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return MEMORY[0x1E0DE00C8]();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return MEMORY[0x1E0DE00D0]();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x1E0DE00D8]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x1E0DE00E0]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x1E0DE00E8]();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return MEMORY[0x1E0DE00F0]();
}

uint64_t AMFDRSealingMapCopyPropertyWithTag()
{
  return MEMORY[0x1E0DE00F8]();
}

uint64_t AMFDRSealingMapGetEntriesForDevice()
{
  return MEMORY[0x1E0DE0100]();
}

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x1E0DE0108]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x1E0DE0110]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x1E0DE3B88]();
}

uint64_t BC__getInfo()
{
  return MEMORY[0x1E0DF2300]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

uint64_t SecPolicyCreateAppleAST2Service()
{
  return MEMORY[0x1E0CD6460]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66E8](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

uint64_t ZhuGeCopyValue()
{
  return MEMORY[0x1E0CFCE28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t handleForCategory()
{
  return MEMORY[0x1E0D18328]();
}

uint64_t isVeridianUpdateRequired()
{
  return MEMORY[0x1E0DF2308]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

