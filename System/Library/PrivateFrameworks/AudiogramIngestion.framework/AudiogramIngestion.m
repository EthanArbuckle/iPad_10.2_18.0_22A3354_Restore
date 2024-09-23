id aiBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)aiBundle_AIBundle;
  if (!aiBundle_AIBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)aiBundle_AIBundle;
    aiBundle_AIBundle = v1;

    v0 = (void *)aiBundle_AIBundle;
  }
  return v0;
}

id audiogramIngestionImageNamed(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BEBD640];
  v2 = a1;
  aiBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id aiLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  aiBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("AudiogramIngestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id validateHearingLevel(void *a1)
{
  id v1;
  double v2;
  double v3;
  uint64_t v4;
  id v5;
  double v7;

  v1 = a1;
  objc_msgSend(v1, "doubleValue");
  if (v2 <= 120.0 && (objc_msgSend(v1, "doubleValue"), v3 >= -20.0))
  {
    if (v1)
    {
      objc_msgSend(v1, "doubleValue");
      if (v7 == 0.0)
      {
        v5 = &unk_24FD77428;
        goto LABEL_5;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  v5 = v1;
  v1 = v5;
LABEL_5:

  return v5;
}

id snapToValidFrequency(void *a1)
{
  id v1;
  id v2;
  int v3;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v1 = a1;
  if ((objc_msgSend((id)AIAudiogramValidFrequencies, "containsObject:", v1) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    v12 = 0;
    v3 = objc_msgSend(v1, "intValue");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __snapToValidFrequency_block_invoke;
    v5[3] = &unk_24FD6CD10;
    v6 = v3;
    v5[4] = &v7;
    objc_msgSend((id)AIAudiogramValidFrequencies, "enumerateObjectsUsingBlock:", v5);
    v2 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  return v2;
}

void sub_22FB51D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void __snapToValidFrequency_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = *(_DWORD *)(a1 + 40);
  v9 = v8 - objc_msgSend(v7, "intValue");
  if (v9 < 0)
    v9 = -v9;
  if ((double)(int)objc_msgSend(v7, "intValue") * 0.125 >= (double)v9)
  {
    AXLogAudiogram();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_DWORD *)(a1 + 40);
      v13[0] = 67109378;
      v13[1] = v12;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_22FB4F000, v11, OS_LOG_TYPE_INFO, "Shifting frequency %i -> %@", (uint8_t *)v13, 0x12u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    v10 = *(_DWORD *)(a1 + 40);
    if (v10 >= (int)objc_msgSend(v7, "intValue"))
      goto LABEL_10;
  }
  *a4 = 1;
LABEL_10:

}

id labelForSymbolType(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 11)
  {
    v1 = CFSTR("AudiogramIngestionSymbolCrossTitle");
  }
  else
  {
    if (a1 != 4)
      return 0;
    v1 = CFSTR("AudiogramIngestionSymbolCircleTitle");
  }
  aiLocString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id filledImageForSymbolType(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;

  if (a1 == 11)
  {
    v3 = CFSTR("xmark");
  }
  else
  {
    if (a1 != 4)
      return 0;
    v3 = CFSTR("circle.fill");
  }
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v3, v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id unfilledImageForSymbolType(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;

  if (a1 == 11)
  {
    v3 = CFSTR("xmark");
  }
  else
  {
    if (a1 != 4)
      return 0;
    v3 = CFSTR("circle");
  }
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v3, v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id metadataForHKAudiogramSample()
{
  id *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v0 = (id *)getHKMetadataKeyWasUserEnteredSymbolLoc_ptr;
  v13 = getHKMetadataKeyWasUserEnteredSymbolLoc_ptr;
  if (!getHKMetadataKeyWasUserEnteredSymbolLoc_ptr)
  {
    v1 = (void *)HealthKitLibrary();
    v0 = (id *)dlsym(v1, "HKMetadataKeyWasUserEntered");
    v11[3] = (uint64_t)v0;
    getHKMetadataKeyWasUserEnteredSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v10, 8);
  if (!v0)
    goto LABEL_8;
  v2 = *v0;
  v14 = v2;
  v3 = MEMORY[0x24BDBD1C8];
  v16[0] = MEMORY[0x24BDBD1C8];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (id *)get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr;
  v13 = get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr)
  {
    v5 = (void *)HealthKitLibrary();
    v4 = (id *)dlsym(v5, "_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstParty");
    v11[3] = (uint64_t)v4;
    get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
LABEL_8:
    metadataForHKAudiogramSample_cold_1();
    __break(1u);
  }
  v15 = *v4;
  v16[1] = v3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = v15;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v16, &v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_22FB5213C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = HealthKitLibraryCore_frameworkLibrary;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_22FB52B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5449C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB54AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

id getHKUnitClass()
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
  v0 = (void *)getHKUnitClass_softClass;
  v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB54C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5509C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB551C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB55538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass()
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
  v0 = (void *)getHKQuantityClass_softClass;
  v7 = getHKQuantityClass_softClass;
  if (!getHKQuantityClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB555F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    HealthKitLibrary_0();
  }
}

void HealthKitLibrary_0()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_0)
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKAudiogramChartViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthUILibrary();
  result = objc_getClass("HKAudiogramChartViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    return (Class)HealthUILibrary();
  }
  return result;
}

uint64_t HealthUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!HealthUILibraryCore_frameworkLibrary)
    HealthUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = HealthUILibraryCore_frameworkLibrary;
  if (!HealthUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKUnitPreferenceControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary();
  result = objc_getClass("HKUnitPreferenceController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    return (Class)__getHKSampleTypeUpdateControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSampleTypeUpdateControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary();
  result = objc_getClass("HKSampleTypeUpdateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSampleClass_block_invoke(v3);
  }
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKAudiogramSample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKUnitClass_block_invoke(v3);
  }
  return result;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKUnit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKUnitClass_block_invoke_cold_1();
    return (Class)__getHKQuantityClass_block_invoke(v3);
  }
  return result;
}

Class __getHKQuantityClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke(v3);
  }
  return result;
}

void __getHKAudiogramSensitivityPointClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  HealthKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramSensitivityPoint");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_22FB56684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKUnitClass_0()
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
  v0 = (void *)getHKUnitClass_softClass_0;
  v7 = getHKUnitClass_softClass_0;
  if (!getHKUnitClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_0;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB581F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB584E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void __getHKHealthStoreClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    HealthKitLibrary_1();
  }
}

void HealthKitLibrary_1()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_1)
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getHKAudiogramChartViewControllerClass_block_invoke_0(uint64_t a1)
{
  HealthUILibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramChartViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    HealthUILibrary_0();
  }
}

void HealthUILibrary_0()
{
  void *v0;

  if (!HealthUILibraryCore_frameworkLibrary_0)
    HealthUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!HealthUILibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKUnitPreferenceControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary_0();
  result = objc_getClass("HKUnitPreferenceController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    return (Class)__getHKSampleTypeUpdateControllerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKSampleTypeUpdateControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary_0();
  result = objc_getClass("HKSampleTypeUpdateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    return (Class)__getHKUnitClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKUnitClass_block_invoke_0(uint64_t a1)
{
  Class result;
  AIAudiogramCropResult *v3;
  SEL v4;

  HealthKitLibrary_1();
  result = objc_getClass("HKUnit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AIAudiogramCropResult *)__getHKUnitClass_block_invoke_cold_1();
    return (Class)-[AIAudiogramCropResult description](v3, v4);
  }
  return result;
}

void sub_22FB5BBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AX_CGRectGetCenter(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v8 = getAX_CGRectGetCenterSymbolLoc_ptr;
  v15 = getAX_CGRectGetCenterSymbolLoc_ptr;
  if (!getAX_CGRectGetCenterSymbolLoc_ptr)
  {
    v9 = (void *)AccessibilityUtilitiesLibrary();
    v8 = dlsym(v9, "AX_CGRectGetCenter");
    v13[3] = (uint64_t)v8;
    getAX_CGRectGetCenterSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
    v11 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  return ((uint64_t (*)(double, double, double, double))v8)(a1, a2, a3, a4);
}

uint64_t soft_AX_CGPointGetDistanceToPoint(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v8 = getAX_CGPointGetDistanceToPointSymbolLoc_ptr;
  v15 = getAX_CGPointGetDistanceToPointSymbolLoc_ptr;
  if (!getAX_CGPointGetDistanceToPointSymbolLoc_ptr)
  {
    v9 = (void *)AccessibilityUtilitiesLibrary();
    v8 = dlsym(v9, "AX_CGPointGetDistanceToPoint");
    v13[3] = (uint64_t)v8;
    getAX_CGPointGetDistanceToPointSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
    v11 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  return ((uint64_t (*)(double, double, double, double))v8)(a1, a2, a3, a4);
}

void sub_22FB5C7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_22FB5CED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5D730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_22FB5DCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5DF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5E194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB5E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKUnitClass_1()
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
  v0 = (void *)getHKUnitClass_softClass_1;
  v7 = getHKUnitClass_softClass_1;
  if (!getHKUnitClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_1;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB5F29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass_0()
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
  v0 = (void *)getHKQuantityClass_softClass_0;
  v7 = getHKQuantityClass_softClass_0;
  if (!getHKQuantityClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_0;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB5FAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSensitivityPointClass()
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
  v0 = (void *)getHKAudiogramSensitivityPointClass_softClass_0;
  v7 = getHKAudiogramSensitivityPointClass_softClass_0;
  if (!getHKAudiogramSensitivityPointClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSensitivityPointClass_block_invoke_0;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKAudiogramSensitivityPointClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB5FCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSampleClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  id v9;
  uint8_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getHKAudiogramSampleClass_softClass_0;
  v16 = getHKAudiogramSampleClass_softClass_0;
  if (!getHKAudiogramSampleClass_softClass_0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getHKAudiogramSampleClass_block_invoke_0;
    v12[3] = &unk_24FD6CE58;
    v12[4] = &v13;
    __getHKAudiogramSampleClass_block_invoke_0((uint64_t)v12, a2, a3, a4, a5, a6, a7, a8, v11);
    v8 = (void *)v14[3];
  }
  v9 = v8;
  _Block_object_dispose(&v13, 8);
  return v9;
}

void sub_22FB5FD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB61000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_22FB62E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getHKUnitClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_2();
  }
}

void HealthKitLibrary_2()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_2)
    HealthKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_2)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKQuantityClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_2();
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKAudiogramSensitivityPointClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_2();
  result = objc_getClass("HKAudiogramSensitivityPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSampleClass_block_invoke_0(v3);
  }
  return result;
}

void __getHKAudiogramSampleClass_block_invoke_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  HealthKitLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramSample");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getHKAudiogramSampleClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_22FB665D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_22FB666D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FB6680C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_3)
  {
    HealthKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthStoreClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getHKUnitPreferenceControllerClass_block_invoke_1(uint64_t a1)
{
  HealthUILibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnitPreferenceController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    HealthUILibrary_1();
  }
}

void HealthUILibrary_1()
{
  void *v0;

  if (!HealthUILibraryCore_frameworkLibrary_1)
    HealthUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!HealthUILibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKSampleTypeUpdateControllerClass_block_invoke_1(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary_1();
  result = objc_getClass("HKSampleTypeUpdateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramChartViewControllerClass_block_invoke_1(v3);
  }
  return result;
}

AIAudiogramLoadingViewController *__getHKAudiogramChartViewControllerClass_block_invoke_1(uint64_t a1)
{
  AIAudiogramLoadingViewController *result;
  AIAudiogramLoadingViewController *v3;
  SEL v4;
  id v5;
  int64_t v6;

  HealthUILibrary_1();
  result = (AIAudiogramLoadingViewController *)objc_getClass("HKAudiogramChartViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AIAudiogramLoadingViewController *)__getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    return -[AIAudiogramLoadingViewController initWithTitle:style:](v3, v4, v5, v6);
  }
  return result;
}

void sub_22FB680B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  uint64_t v21;

  _Block_object_dispose((const void *)(v21 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id getHKUnitClass_2()
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
  v0 = (void *)getHKUnitClass_softClass_2;
  v7 = getHKUnitClass_softClass_2;
  if (!getHKUnitClass_softClass_2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_2;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB682A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB68E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB6A928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id Soft_HKAudiogramEarLocalizedDisplayNameForEar(uint64_t a1)
{
  void (*v2)(uint64_t, _QWORD);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (void (*)(uint64_t, _QWORD))getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0;
  v9 = getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0;
  if (!getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke;
    v5[3] = &unk_24FD6CE58;
    v5[4] = &v6;
    __getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (void (*)(uint64_t, _QWORD))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  v2(a1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_22FB6B888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass_1()
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
  v0 = (void *)getHKQuantityClass_softClass_1;
  v7 = getHKQuantityClass_softClass_1;
  if (!getHKQuantityClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_1;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB6BA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKUnitClass_block_invoke_2(uint64_t a1)
{
  HealthKitLibrary_3();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_3();
  }
}

void HealthKitLibrary_3()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_4)
    HealthKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_4)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKAudiogramSampleClass_block_invoke_1(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_3();
  result = objc_getClass("HKAudiogramSample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (HealthUILibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)HealthUILibraryCore_frameworkLibrary_2;
  }
  else
  {
    HealthUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
    v2 = (void *)HealthUILibraryCore_frameworkLibrary_2;
    if (!HealthUILibraryCore_frameworkLibrary_2)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "HKAudiogramEarLocalizedDisplayNameForEar");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

Class __getHKQuantityClass_block_invoke_1(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_3();
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_1(v3);
  }
  return result;
}

void __getHKAudiogramSensitivityPointClass_block_invoke_1(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;

  HealthKitLibrary_3();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramSensitivityPoint");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_1(v2, v3, v4, v5, v6);
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_22FB6C5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_22FB6CCFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_22FB6CECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB713C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a43);
  _Unwind_Resume(a1);
}

void sub_22FB71BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

Class __getHKHealthStoreClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_5)
  {
    HealthKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_5)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthStoreClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getHKSampleTypeUpdateControllerClass_block_invoke_2(uint64_t a1)
{
  HealthUILibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKSampleTypeUpdateController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    HealthUILibrary_2();
  }
}

void HealthUILibrary_2()
{
  void *v0;

  if (!HealthUILibraryCore_frameworkLibrary_3)
    HealthUILibraryCore_frameworkLibrary_3 = _sl_dlopen();
  if (!HealthUILibraryCore_frameworkLibrary_3)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKUnitPreferenceControllerClass_block_invoke_2(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary_2();
  result = objc_getClass("HKUnitPreferenceController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramChartViewControllerClass_block_invoke_2(v3);
  }
  return result;
}

Class __getHKAudiogramChartViewControllerClass_block_invoke_2(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthUILibrary_2();
  result = objc_getClass("HKAudiogramChartViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    return (Class)__getAXPerformSafeBlockSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAXPerformSafeBlockSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
  }
  else
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXPerformSafeBlock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXPerformSafeBlockSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22FB74B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_22FB751A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB78070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

id getHKUnitClass_3()
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
  v0 = (void *)getHKUnitClass_softClass_3;
  v7 = getHKUnitClass_softClass_3;
  if (!getHKUnitClass_softClass_3)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_3;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_3((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB78288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB78538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FB78B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB7986C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSampleClass_0()
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
  v0 = (void *)getHKAudiogramSampleClass_softClass_2;
  v7 = getHKAudiogramSampleClass_softClass_2;
  if (!getHKAudiogramSampleClass_softClass_2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSampleClass_block_invoke_2;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKAudiogramSampleClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB7B924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FB7C2A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass_2()
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
  v0 = (void *)getHKQuantityClass_softClass_2;
  v7 = getHKQuantityClass_softClass_2;
  if (!getHKQuantityClass_softClass_2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_2;
    v3[3] = &unk_24FD6CE58;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FB7C358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKUnitClass_block_invoke_3(uint64_t a1)
{
  HealthKitLibrary_4();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_4();
  }
}

void HealthKitLibrary_4()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_6)
    HealthKitLibraryCore_frameworkLibrary_6 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_6)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getPHPickerConfigurationClass_block_invoke(uint64_t a1)
{
  PhotosUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPickerConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPickerConfigurationClass_block_invoke_cold_1();
    PhotosUILibrary();
  }
}

void PhotosUILibrary()
{
  void *v0;

  if (!PhotosUILibraryCore_frameworkLibrary)
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPHPickerFilterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosUILibrary();
  result = objc_getClass("PHPickerFilter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPickerFilterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHPickerFilterClass_block_invoke_cold_1();
    return (Class)__getPHPickerViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getPHPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosUILibrary();
  result = objc_getClass("PHPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSampleClass_block_invoke_2(v3);
  }
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke_2(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_4();
  result = objc_getClass("HKAudiogramSample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKQuantityClass_block_invoke_2(v3);
  }
  return result;
}

Class __getHKQuantityClass_block_invoke_2(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_4();
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_2(v3);
  }
  return result;
}

AIAudiogramAssetManager *__getHKAudiogramSensitivityPointClass_block_invoke_2(uint64_t a1)
{
  AIAudiogramAssetManager *result;
  AIAudiogramAssetManager *v3;
  SEL v4;
  id v5;

  HealthKitLibrary_4();
  result = (AIAudiogramAssetManager *)objc_getClass("HKAudiogramSensitivityPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AIAudiogramAssetManager *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    return -[AIAudiogramAssetManager initWithDelegate:](v3, v4, v5);
  }
  return result;
}

void sub_22FB7D358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
LABEL_6:
      __getAXSettingsClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AXSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22FB7DD58(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22FB7DD78(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_22FB7E44C(a1, &qword_255E3EAC0);
}

uint64_t sub_22FB7DDB4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_22FB7DDF0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22FB7DE10(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_22FB7E44C(a1, &qword_255E3EAC8);
}

id sub_22FB7DE50(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_22FB8D31C();
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v5);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      --v2;
    }
    while (v2);
  }
  sub_22FB7E3E8();
  v6 = (void *)sub_22FB8D1C0();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v6);

  return v7;
}

void sub_22FB7DF60(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v11 = xmmword_22FB904A0;
  v12 = xmmword_22FB904B0;
  v13 = 0uLL;
  switch(a1)
  {
    case 1:
      goto LABEL_12;
    case 2:
      v14 = -1.0;
      v15 = 1.0;
      goto LABEL_7;
    case 3:
      v16 = 3.14159265;
      goto LABEL_10;
    case 4:
      v14 = 1.0;
      goto LABEL_6;
    case 5:
      v14 = -1.0;
LABEL_6:
      v15 = -1.0;
LABEL_7:
      CGAffineTransformMakeScale(&v29, v14, v15);
      goto LABEL_11;
    case 6:
      v16 = -1.57079633;
      goto LABEL_10;
    case 7:
      CGAffineTransformMakeRotation(&v29, 3.14159265);
      CGAffineTransformScale(&v28, &v29, -1.0, -1.0);
      v12 = *(_OWORD *)&v28.a;
      v11 = *(_OWORD *)&v28.c;
      v13 = *(_OWORD *)&v28.tx;
      goto LABEL_12;
    case 8:
      v16 = 1.57079633;
LABEL_10:
      CGAffineTransformMakeRotation(&v29, v16);
LABEL_11:
      v12 = *(_OWORD *)&v29.a;
      v11 = *(_OWORD *)&v29.c;
      v13 = *(_OWORD *)&v29.tx;
LABEL_12:
      v25 = v13;
      v26 = v11;
      v27 = v12;
      CGAffineTransformMakeTranslation(&v29, -0.5, -0.5);
      v30.origin.x = a4;
      v30.origin.y = a5;
      v30.size.width = a6;
      v30.size.height = a7;
      v31 = CGRectApplyAffineTransform(v30, &v29);
      *(_OWORD *)&v29.a = v27;
      *(_OWORD *)&v29.c = v26;
      *(_OWORD *)&v29.tx = v25;
      v32 = CGRectApplyAffineTransform(v31, &v29);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      CGAffineTransformMakeTranslation(&v29, 0.5, 0.5);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = CGRectApplyAffineTransform(v33, &v29);
      v21 = v34.origin.x;
      v22 = v34.origin.y;
      v23 = v34.size.width;
      v24 = v34.size.height;
      CGRectGetMinX(v34);
      v35.origin.x = v21;
      v35.origin.y = v22;
      v35.size.width = v23;
      v35.size.height = v24;
      CGRectGetMinY(v35);
      v36.origin.x = v21;
      v36.origin.y = v22;
      v36.size.width = v23;
      v36.size.height = v24;
      CGRectGetWidth(v36);
      v37.origin.x = v21;
      v37.origin.y = v22;
      v37.size.width = v23;
      v37.size.height = v24;
      CGRectGetHeight(v37);
      break;
    default:
      type metadata accessor for CGImagePropertyOrientation(0);
      sub_22FB8D418();
      __break(1u);
      break;
  }
}

void sub_22FB7E1C8(double a1, double a2)
{
  CGImage *v2;
  size_t BitsPerComponent;
  int64_t BitsPerPixel;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  CGColorSpace *v11;
  uint32_t BitmapInfo;
  CGContext *v13;
  CGContext *v14;

  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if ((*(_QWORD *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_20;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  BitsPerComponent = CGImageGetBitsPerComponent(v2);
  BitsPerPixel = CGImageGetBitsPerPixel(v2);
  v7 = (uint64_t)a1 * BitsPerPixel;
  if ((unsigned __int128)((uint64_t)a1 * (__int128)BitsPerPixel) >> 64 != v7 >> 63)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = CGImageGetBitsPerComponent(v2);
  if (!v8)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  v9 = v8;
  if (v7 == 0x8000000000000000 && v8 == -1)
    goto LABEL_25;
  v11 = CGImageGetColorSpace(v2);
  if (!v11)
  {
    v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    if (!v11)
      goto LABEL_26;
  }
  BitmapInfo = CGImageGetBitmapInfo(v2);
  v13 = CGBitmapContextCreate(0, (uint64_t)a1, (uint64_t)a2, BitsPerComponent, v7 / v9, v11, BitmapInfo);

  if (v13)
  {
    CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
    v14 = v13;
    sub_22FB8D250();

    CGBitmapContextCreateImage(v14);
  }
}

double sub_22FB7E398(double a1, double a2, double a3)
{
  double v3;

  v3 = a1 - a3 * 0.5;
  if (v3 < 0.0)
    v3 = 0.0;
  return fmin(v3, 1.0);
}

unint64_t sub_22FB7E3E8()
{
  unint64_t result;

  result = qword_255E3EB70;
  if (!qword_255E3EB70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E3EB70);
  }
  return result;
}

void type metadata accessor for CGImagePropertyOrientation(uint64_t a1)
{
  sub_22FB7E44C(a1, &qword_255E3EAD0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_22FB7E44C(a1, &qword_255E3EAD8);
}

void sub_22FB7E44C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_22FB7E498()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;

  v1 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency];
  if (v1)
  {
    v35 = v1;
    if (sub_22FB8D22C() < 1000)
    {
      v2 = v35;
      v3 = (void *)sub_22FB8D154();
      v4 = aiLocString(v3);

      v5 = sub_22FB8D160();
      v7 = v6;

LABEL_12:
      v28 = objc_msgSend(v0, sel_textLabel);
      if (v28)
      {
        v29 = v28;
        v30 = (void *)sub_22FB8D154();
        v31 = aiLocString(v30);

        sub_22FB8D160();
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EB18);
        v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_22FB90530;
        *(_QWORD *)(v32 + 56) = sub_22FB7E3E8();
        *(_QWORD *)(v32 + 64) = sub_22FB7EB68();
        *(_QWORD *)(v32 + 32) = v2;
        *(_QWORD *)(v32 + 96) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v32 + 104) = sub_22FB7EB24();
        *(_QWORD *)(v32 + 72) = v5;
        *(_QWORD *)(v32 + 80) = v7;
        v34 = v2;
        sub_22FB8D178();
        swift_bridgeObjectRelease();
        v33 = (void *)sub_22FB8D154();
        swift_bridgeObjectRelease();
        objc_msgSend(v29, sel_setText_, v33);

        v26 = v34;
        goto LABEL_14;
      }

      goto LABEL_17;
    }
    v9 = (void *)sub_22FB8D154();
    v10 = aiLocString(v9);

    v5 = sub_22FB8D160();
    v7 = v11;

    if (__ROR8__(0x1CAC083126E978D5 * sub_22FB8D22C() + 0x10624DD2F1A9FB8, 3) < 0x4189374BC6A7EFuLL)
    {
      v27 = (uint64_t)objc_msgSend(v35, sel_integerValue) / 1000;
      v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v27);
      goto LABEL_12;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EB18);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_22FB90520;
    objc_msgSend(v35, sel_doubleValue);
    v13 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v12 + 64) = v13;
    *(double *)(v12 + 32) = v14 / 1000.0;
    v15 = sub_22FB8D178();
    v17 = v16;
    v18 = objc_msgSend(v0, sel_textLabel);
    if (!v18)
    {
      swift_bridgeObjectRelease();

LABEL_17:
      swift_bridgeObjectRelease();
      return;
    }
    v19 = v18;
    v20 = (void *)sub_22FB8D154();
    v21 = aiLocString(v20);

    sub_22FB8D160();
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_22FB90530;
    v23 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE0D00];
    v24 = sub_22FB7EB24();
    *(_QWORD *)(v22 + 32) = v15;
    *(_QWORD *)(v22 + 40) = v17;
    *(_QWORD *)(v22 + 96) = v23;
    *(_QWORD *)(v22 + 104) = v24;
    *(_QWORD *)(v22 + 64) = v24;
    *(_QWORD *)(v22 + 72) = v5;
    *(_QWORD *)(v22 + 80) = v7;
    sub_22FB8D178();
    swift_bridgeObjectRelease();
    v25 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setText_, v25);

LABEL_9:
    v26 = v35;
LABEL_14:

    return;
  }
  v8 = objc_msgSend(v0, sel_textLabel);
  if (v8)
  {
    v35 = v8;
    objc_msgSend(v8, sel_setText_, 0);
    goto LABEL_9;
  }
}

id sub_22FB7EA84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AudiogramFrequencySelectionCell()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AADE4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22FB7EB24()
{
  unint64_t result;

  result = qword_255E3EB20;
  if (!qword_255E3EB20)
  {
    result = MEMORY[0x2348AADFC](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255E3EB20);
  }
  return result;
}

unint64_t sub_22FB7EB68()
{
  unint64_t result;
  unint64_t v1;

  result = qword_255E3EB80;
  if (!qword_255E3EB80)
  {
    v1 = sub_22FB7E3E8();
    result = MEMORY[0x2348AADFC](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_255E3EB80);
  }
  return result;
}

char *AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:selectedFrequencies:delegate:isModal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(a1, a2, a3, a4, a5, a6, a7);
}

char *AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  char *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  objc_super v36;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  v9 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v9;
  v10 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  v11 = (void *)objc_opt_self();
  v12 = v7;
  *(_QWORD *)&v7[v10] = objc_msgSend(v11, sel_boldButton);
  *(_QWORD *)&v12[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;
  v12[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] = a7;

  v13 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  v36.receiver = v12;
  v36.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  v15 = (char *)objc_msgSendSuper2(&v36, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v13, v14, 0, 1);

  swift_unknownObjectWeakAssign();
  v16 = &v15[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
  swift_beginAccess();
  *(_QWORD *)v16 = a5;
  v17 = v15;
  swift_bridgeObjectRelease();
  v18 = (void *)AIAudiogramValidFrequencies;
  sub_22FB7E3E8();
  v19 = v18;
  sub_22FB8D1CC();

  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 1, v17, sel_cancelTapped_);
  if ((a7 & 1) != 0)
  {
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 0, v17, sel_doneTapped_);
    v22 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton;
    v23 = *(void **)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton];
    *(_QWORD *)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = v21;

    v24 = objc_msgSend(v17, sel_navigationItem);
    v25 = *(id *)&v17[v22];
    objc_msgSend(v24, sel_setRightBarButtonItem_, v25);

    objc_msgSend(v17, sel_setModalInPresentation_, 1);
  }
  else
  {
    v26 = objc_msgSend(v17, sel_navigationItem);
    objc_msgSend(v26, sel_setRightBarButtonItem_, v20);

    v27 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
    v28 = *(id *)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton];
    v29 = (void *)sub_22FB8D154();
    v30 = aiLocString(v29);

    sub_22FB8D160();
    v31 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setTitle_forState_, v31, 0);

    objc_msgSend(*(id *)&v17[v27], sel_addTarget_action_forControlEvents_, v17, sel_continueToIndividualSensitivityPointInput_, 64);
    v32 = objc_msgSend(v17, sel_buttonTray);
    objc_msgSend(v32, sel_addButton_, *(_QWORD *)&v17[v27]);

    sub_22FB7F804();
  }
  v33 = objc_msgSend(v17, sel_navigationItem);
  objc_msgSend(v33, sel_setBackButtonDisplayMode_, 1);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t type metadata accessor for AudiogramFrequencySelectionViewController()
{
  return objc_opt_self();
}

void AudiogramFrequencySelectionViewController.__allocating_init(coder:)()
{
  objc_class *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (char *)objc_allocWithZone(v0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v2;
  v3 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  *(_QWORD *)&v1[v3] = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  *(_QWORD *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;

  sub_22FB8D358();
  __break(1u);
}

void AudiogramFrequencySelectionViewController.init(coder:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v1;
  v2 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  *(_QWORD *)&v0[v2] = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  *(_QWORD *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;

  sub_22FB8D358();
  __break(1u);
}

void sub_22FB7F2E4(char a1)
{
  char *v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  objc_msgSendSuper2(&v9, sel_viewWillAppear_, a1 & 1);
  v3 = (void *)MEMORY[0x2348AAEBC](&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_getCurrentSelectedFrequencies);
    swift_unknownObjectRelease();
    sub_22FB7E3E8();
    v5 = sub_22FB8D1D8();

  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  v6 = (uint64_t *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_tableView);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_reloadData);

    sub_22FB7F804();
  }
  else
  {
    __break(1u);
  }
}

void sub_22FB7F430()
{
  void *v0;
  id v1;
  double v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_class *ObjCClassFromMetadata;
  NSString *v16;
  void *v17;
  objc_super v18;

  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  objc_msgSendSuper2(&v18, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_headerView);
  LODWORD(v2) = 1036831949;
  objc_msgSend(v1, sel_setTitleHyphenationFactor_, v2);

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9F0]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTableView_, v3);

  v4 = objc_msgSend(v0, sel_tableView);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(v4, sel_setDataSource_, v0);

  v6 = objc_msgSend(v0, sel_tableView);
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v7 = v6;
  objc_msgSend(v6, sel_setDelegate_, v0);

  v8 = objc_msgSend(v0, sel_tableView);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v8;
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v10 = objc_msgSend(v0, sel_view);
  if (!v10)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v11 = v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  v13 = objc_msgSend(v0, sel_tableView);
  if (v13)
  {
    v14 = v13;
    type metadata accessor for AudiogramFrequencySelectionCell();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v16 = NSStringFromClass(ObjCClassFromMetadata);
    sub_22FB8D160();

    v17 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v17);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_22FB7F804()
{
  uint64_t v0;
  void *v1;
  unint64_t *v2;
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v1 = *(void **)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton);
  v2 = (unint64_t *)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies);
  swift_beginAccess();
  if (*v2 >> 62)
  {
    v9 = v1;
    swift_bridgeObjectRetain();
    v3 = sub_22FB8D364();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    v4 = v1;
  }
  objc_msgSend(v1, sel_setEnabled_, v3 > 0);

  v5 = *(void **)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton);
  if (v5)
  {
    v6 = *v2;
    if (v6 >> 62)
    {
      v10 = v5;
      swift_bridgeObjectRetain();
      v7 = sub_22FB8D364();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      v8 = v5;
    }
    objc_msgSend(v5, sel_setEnabled_, v7 > 0);

  }
}

unint64_t sub_22FB7F934(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  unint64_t result;
  unint64_t v6;
  uint64_t v7;
  id v8;
  objc_class *ObjCClassFromMetadata;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9F8]), sel_init);
  result = sub_22FB8D0DC();
  v6 = result;
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if ((v7 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v8 = (id)MEMORY[0x2348AA484](v6, v7);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v8 = *(id *)(v7 + 8 * result + 32);
LABEL_5:
  type metadata accessor for AudiogramFrequencySelectionCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v10 = NSStringFromClass(ObjCClassFromMetadata);
  sub_22FB8D160();

  v11 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_22FB8D0C4();
  v13 = objc_msgSend(a1, sel_dequeueReusableCellWithIdentifier_forIndexPath_, v11, v12);

  v14 = swift_dynamicCastClass();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = *(void **)(v14 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency);
    *(_QWORD *)(v14 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = v8;
    v17 = v8;

    sub_22FB7E498();
    v18 = (unint64_t *)(v2 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies);
    swift_beginAccess();
    v19 = *v18;
    swift_bridgeObjectRetain();
    LOBYTE(v16) = sub_22FB7FB50((uint64_t)v17, v19);
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      v20 = 3;
    else
      v20 = 0;
    v21 = v13;
    objc_msgSend(v15, sel_setAccessoryType_, v20);

    return (unint64_t)v15;
  }
  else
  {

  }
  return (unint64_t)v4;
}

uint64_t sub_22FB7FB50(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_22FB8D364())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x2348AA484](0, a2);
LABEL_5:
      v6 = v5;
      sub_22FB7E3E8();
      v7 = sub_22FB8D28C();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_22FB8D28C();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x2348AA484](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_22FB8D28C();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_22FB7FD7C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if (!(v1 >> 62))
    return *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v3 = sub_22FB8D364();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22FB7FE68()
{
  return 1;
}

void sub_22FB7FE78(void *a1)
{
  char *v1;
  char *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  char v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD *v36;
  char *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  const void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t aBlock;
  uint64_t v51;
  void (*v52)(uint64_t, void *);
  void *v53;
  uint64_t (*v54)(uint64_t);
  _QWORD *v55;

  v2 = v1;
  v4 = (void *)sub_22FB8D0C4();
  objc_msgSend(a1, sel_deselectRowAtIndexPath_animated_, v4, 1);

  v5 = (void *)sub_22FB8D0C4();
  v49 = objc_msgSend(a1, sel_cellForRowAtIndexPath_, v5);

  if (v49)
  {
    type metadata accessor for AudiogramFrequencySelectionCell();
    v6 = swift_dynamicCastClass();
    if (v6
      && (v7 = (void *)v6,
          (v8 = *(void **)(v6 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency)) != 0))
    {
      v9 = (unint64_t *)&v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
      swift_beginAccess();
      v10 = *v9;
      v11 = v8;
      swift_bridgeObjectRetain();
      v12 = sub_22FB7FB50((uint64_t)v11, v10);
      swift_bridgeObjectRelease();
      v13 = &unk_255E3E000;
      if ((v12 & 1) != 0)
      {
        v14 = *v9;
        swift_bridgeObjectRetain();
        sub_22FB80550((uint64_t)v11, v14);
        v16 = v15;
        v18 = v17;
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          if (v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
          {
            v19 = (void *)sub_22FB8D154();
            v20 = aiLocString(v19);

            sub_22FB8D160();
            __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EB18);
            v21 = swift_allocObject();
            *(_OWORD *)(v21 + 16) = xmmword_22FB90520;
            *(_QWORD *)(v21 + 56) = sub_22FB7E3E8();
            *(_QWORD *)(v21 + 64) = sub_22FB7EB68();
            *(_QWORD *)(v21 + 32) = v11;
            v22 = v11;
            sub_22FB8D178();
            swift_bridgeObjectRelease();
            v23 = (void *)sub_22FB8D154();
            v24 = aiLocString(v23);

            sub_22FB8D160();
            v25 = (void *)sub_22FB8D154();
            swift_bridgeObjectRelease();
            v26 = (void *)sub_22FB8D154();
            swift_bridgeObjectRelease();
            v27 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v25, v26, 0);

            v28 = (void *)sub_22FB8D154();
            v29 = aiLocString(v28);

            sub_22FB8D160();
            v30 = (void *)sub_22FB8D154();
            swift_bridgeObjectRelease();
            v54 = (uint64_t (*)(uint64_t))nullsub_1;
            v55 = 0;
            aBlock = MEMORY[0x24BDAC760];
            v51 = 1107296256;
            v52 = sub_22FB806DC;
            v53 = &block_descriptor;
            v31 = _Block_copy(&aBlock);
            swift_release();
            v32 = (void *)objc_opt_self();
            v33 = objc_msgSend(v32, sel_actionWithTitle_style_handler_, v30, 1, v31);
            _Block_release(v31);

            objc_msgSend(v27, sel_addAction_, v33);
            v34 = (void *)sub_22FB8D154();
            v35 = aiLocString(v34);

            sub_22FB8D160();
            v36 = (_QWORD *)swift_allocObject();
            v36[2] = v2;
            v36[3] = v16;
            v36[4] = v7;
            v37 = v2;
            v38 = v49;
            v39 = (void *)sub_22FB8D154();
            swift_bridgeObjectRelease();
            v54 = sub_22FB80940;
            v55 = v36;
            aBlock = MEMORY[0x24BDAC760];
            v51 = 1107296256;
            v52 = sub_22FB806DC;
            v53 = &block_descriptor_3;
            v40 = _Block_copy(&aBlock);
            swift_release();
            v41 = objc_msgSend(v32, sel_actionWithTitle_style_handler_, v39, 0, v40);
            v42 = v40;
            v13 = (_QWORD *)&unk_255E3E000;
            _Block_release(v42);

            objc_msgSend(v27, sel_addAction_, v41);
            objc_msgSend(v37, sel_presentViewController_animated_completion_, v27, 1, 0);

          }
          else
          {
            swift_beginAccess();
            v45 = (void *)sub_22FB8081C(v16);
            swift_endAccess();

            objc_msgSend(v7, sel_setAccessoryType_, 0);
          }
        }
      }
      else
      {
        swift_beginAccess();
        v43 = v11;
        MEMORY[0x2348AA358]();
        if (*(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22FB8D1F0();
        sub_22FB8D208();
        sub_22FB8D1E4();
        swift_endAccess();
        objc_msgSend(v7, sel_setAccessoryType_, 3);
        if (v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
        {
          v44 = (void *)MEMORY[0x2348AAEBC](&v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
          if (v44)
          {
            objc_msgSend(v44, sel_didSelectNodeToAddWithSelectedFrequency_, v43);
            swift_unknownObjectRelease();
          }
        }
      }
      sub_22FB7F804();
      v46 = MEMORY[0x2348AAEBC](&v2[v13[358]]);
      if (v46)
      {
        v47 = (void *)v46;
        sub_22FB7E3E8();
        swift_bridgeObjectRetain();
        v48 = (void *)sub_22FB8D1C0();
        swift_bridgeObjectRelease();
        objc_msgSend(v47, sel_updateSelectedFrequenciesWithSelectedFrequencies_, v48);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {

    }
  }
}

void sub_22FB80550(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x2348AA484](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_22FB7E3E8();
      v6 = sub_22FB8D28C();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x2348AA484](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_22FB8D28C();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_22FB8D364();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

void sub_22FB806DC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_22FB8072C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  void *v7;
  uint64_t result;
  void *v9;
  void *v10;

  swift_beginAccess();
  v7 = (void *)sub_22FB8081C(a3);
  swift_endAccess();

  objc_msgSend(a4, sel_setAccessoryType_, 0);
  sub_22FB7F804();
  result = MEMORY[0x2348AAEBC](a2 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  if (result)
  {
    v9 = (void *)result;
    sub_22FB7E3E8();
    swift_bridgeObjectRetain();
    v10 = (void *)sub_22FB8D1C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_updateSelectedFrequenciesWithSelectedFrequencies_, v10);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22FB8081C(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
    sub_22FB82C98(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      sub_22FB8D1E4();
      return v10;
    }
  }
  result = sub_22FB8D37C();
  __break(1u);
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_22FB80914()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22FB80940(uint64_t a1)
{
  uint64_t v1;

  return sub_22FB8072C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

id sub_22FB809FC()
{
  char *v0;
  id result;

  if (v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
    return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
  result = (id)MEMORY[0x2348AAEBC](&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
  if (result)
  {
    objc_msgSend(result, sel_showIndividualFirstSensitivityPointInputViewController);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v9 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v10 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v11 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
LABEL_6:
  v12 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_symbolName_, v9, v10, v11);

  return v12;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:symbolName:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:icon:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  objc_class *v6;
  void *v9;
  void *v10;
  id v11;

  v6 = v5;
  v9 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v10 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_icon_, v9, v10, a5);

  return v11;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:icon:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:symbolName:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = v7;
  v12 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v13 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
LABEL_6:
  v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v12, v13, v14, a7 & 1);

  return v15;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:symbolName:adoptTableViewScrollView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:icon:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  v11 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v11, v12, a5, a6 & 1);

  return v13;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:icon:adoptTableViewScrollView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramFrequencySelectionViewController.__deallocating_deinit()
{
  return sub_22FB80F50((SEL *)&selRef_dealloc);
}

id sub_22FB80F50(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t method lookup function for AudiogramFrequencySelectionViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:selectedFrequencies:delegate:isModal:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:cellForRowAt:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:numberOfRowsInSection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.numberOfSections(in:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:didSelectRowAt:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_22FB810BC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

id AudiogramDetectorResult.graph.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph);
}

uint64_t AudiogramDetectorResult.symbols.getter()
{
  return swift_bridgeObjectRetain();
}

id AudiogramDetectorResult.__allocating_init(graph:symbols:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id AudiogramDetectorResult.init(graph:symbols:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AudiogramDetectorResult();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for AudiogramDetectorResult()
{
  return objc_opt_self();
}

id AudiogramDetectorResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AudiogramDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramDetectorResult.__deallocating_deinit()
{
  return sub_22FB827E8(type metadata accessor for AudiogramDetectorResult);
}

double AudiogramSymbolDetectorResult.box.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
}

uint64_t AudiogramSymbolDetectorResult.labelName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

double AudiogramSymbolDetectorResult.confidence.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence);
}

uint64_t sub_22FB81448()
{
  sub_22FB8D2BC();
  sub_22FB8D190();
  type metadata accessor for CGRect(0);
  sub_22FB8D340();
  sub_22FB8D190();
  swift_bridgeObjectRetain();
  sub_22FB8D190();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  sub_22FB8D214();
  sub_22FB8D190();
  return 0;
}

void sub_22FB815A4(double a1, double a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v7 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  v8 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8);
  v9 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16);
  v10 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 24);
  CGAffineTransformMakeTranslation(&v24, -0.5, -0.5);
  v25.origin.x = v7;
  v25.origin.y = v8;
  v25.size.width = v9;
  v25.size.height = v10;
  v26 = CGRectApplyAffineTransform(v25, &v24);
  v24.a = 1.0;
  v24.b = 0.0;
  v24.c = 0.0;
  v24.d = 1.0;
  v24.tx = 0.0;
  v24.ty = 0.0;
  v27 = CGRectApplyAffineTransform(v26, &v24);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  CGAffineTransformMakeTranslation(&v24, 0.5, 0.5);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectApplyAffineTransform(v28, &v24);
  v15 = v29.origin.x;
  v16 = v29.origin.y;
  v17 = v29.size.width;
  v18 = v29.size.height;
  v19 = CGRectGetMinX(v29) * a1;
  v30.origin.x = v15;
  v30.origin.y = v16;
  v30.size.width = v17;
  v30.size.height = v18;
  v20 = CGRectGetMinY(v30) * a2;
  v31.origin.x = v15;
  v31.origin.y = v16;
  v31.size.width = v17;
  v31.size.height = v18;
  v21 = CGRectGetWidth(v31) * a1;
  v32.origin.x = v15;
  v32.origin.y = v16;
  v32.size.width = v17;
  v32.size.height = v18;
  v33.size.height = CGRectGetHeight(v32) * a2;
  v33.origin.x = v19;
  v33.origin.y = v20;
  v33.size.width = v21;
  CGRectOffset(v33, a3, a4);
}

void AudiogramSymbolDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22FB8197C(char a1)
{
  return qword_22FB909C0[a1];
}

BOOL sub_22FB8199C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22FB819B0()
{
  sub_22FB8D424();
  sub_22FB8D430();
  return sub_22FB8D43C();
}

uint64_t sub_22FB819F4()
{
  return sub_22FB8D430();
}

uint64_t sub_22FB81A1C()
{
  sub_22FB8D424();
  sub_22FB8D430();
  return sub_22FB8D43C();
}

uint64_t sub_22FB81A5C()
{
  char *v0;

  return sub_22FB8197C(*v0);
}

uint64_t sub_22FB81A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22FB845A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22FB81A88()
{
  return 0;
}

void sub_22FB81A94(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_22FB81AA0()
{
  sub_22FB83E64();
  return sub_22FB8D460();
}

uint64_t sub_22FB81AC8()
{
  sub_22FB83E64();
  return sub_22FB8D46C();
}

id AudiogramSymbolDetectorResult.__deallocating_deinit()
{
  return sub_22FB827E8(type metadata accessor for AudiogramSymbolDetectorResult);
}

uint64_t sub_22FB81B10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 v9;
  _BYTE v11[16];
  __int128 v12;
  __int128 v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3ED60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22FB83E64();
  sub_22FB8D454();
  v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16);
  v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_22FB83EA8(&qword_255E3ED70, MEMORY[0x24BDBD828]);
  sub_22FB8D3DC();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_22FB8D3B8();
    LOBYTE(v12) = 2;
    sub_22FB8D3C4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

id AudiogramSymbolDetectorResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AudiogramSymbolDetectorResult.init(from:)(a1);
}

id AudiogramSymbolDetectorResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  char v26;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3ED78);
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22FB83E64();
  v22 = v1;
  v20 = v6;
  sub_22FB8D448();
  if (v2)
  {
    v18 = v22;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    type metadata accessor for AudiogramSymbolDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v7 = v4;
    type metadata accessor for CGRect(0);
    v26 = 0;
    sub_22FB83EA8(&qword_255E3ED80, MEMORY[0x24BDBD838]);
    v8 = v21;
    v9 = v20;
    sub_22FB8D3AC();
    v11 = v22;
    v12 = &v22[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
    *(_OWORD *)v12 = v24;
    *((_OWORD *)v12 + 1) = v25;
    LOBYTE(v24) = 1;
    v13 = sub_22FB8D388();
    v14 = (uint64_t *)&v11[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName];
    *v14 = v13;
    v14[1] = v15;
    LOBYTE(v24) = 2;
    sub_22FB8D394();
    *(_QWORD *)&v11[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence] = v16;

    v17 = (objc_class *)type metadata accessor for AudiogramSymbolDetectorResult();
    v23.receiver = v11;
    v23.super_class = v17;
    v18 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v18;
}

uint64_t sub_22FB81F48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AudiogramSymbolDetectorResult();
  result = sub_22FB8D2D4();
  *a1 = result;
  return result;
}

uint64_t sub_22FB81F84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22FB82C24(a1, type metadata accessor for AudiogramSymbolDetectorResult, (uint64_t (*)(uint64_t))AudiogramSymbolDetectorResult.init(from:), a2);
}

uint64_t sub_22FB81FA8(_QWORD *a1)
{
  return sub_22FB81B10(a1);
}

double sub_22FB82010()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_22FB820CC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22FB82124()
{
  sub_22FB8D2BC();
  sub_22FB8D190();
  swift_beginAccess();
  type metadata accessor for CGRect(0);
  sub_22FB8D340();
  sub_22FB8D190();
  sub_22FB8D214();
  sub_22FB8D190();
  return 0;
}

CGFloat sub_22FB82234(double a1)
{
  uint64_t v1;
  CGFloat *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = (CGFloat *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  CGAffineTransformMakeTranslation(&v18, -0.5, -0.5);
  v19.origin.x = v4;
  v19.origin.y = v5;
  v19.size.width = v6;
  v19.size.height = v7;
  v20 = CGRectApplyAffineTransform(v19, &v18);
  *(_OWORD *)&v18.a = 0x3FF0000000000000uLL;
  v18.c = 0.0;
  v18.d = 1.0;
  *(_OWORD *)&v18.tx = 0uLL;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  CGAffineTransformMakeTranslation(&v18, 0.5, 0.5);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v23 = CGRectApplyAffineTransform(v22, &v18);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  v16 = CGRectGetMinX(v23) * a1;
  v24.origin.x = v12;
  v24.origin.y = v13;
  v24.size.width = v14;
  v24.size.height = v15;
  CGRectGetMinY(v24);
  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  CGRectGetWidth(v25);
  v26.origin.x = v12;
  v26.origin.y = v13;
  v26.size.width = v14;
  v26.size.height = v15;
  CGRectGetHeight(v26);
  return v16;
}

void sub_22FB82410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v15;
  char *v16;
  objc_class *v17;
  id v18;
  CGRect *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  char *v24;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  CGFloat Height;
  CGFloat *v29;
  id v30;
  uint64_t v31;
  objc_super v32;
  objc_super v33;
  CGRect v34;

  v0 = sub_22FB8D0B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8D0AC();
  v4 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
  v7 = v5;
  sub_22FB8D0AC();
  v8 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
  *(_DWORD *)&v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v1 + 24))(v6, v3, v0);
  swift_endAccess();
  *(_DWORD *)&v7[v8] = 0;
  v9 = &v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v9 + 1) = _Q0;
  v15 = &v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
  *(_QWORD *)v15 = 0x6870617267;
  *((_QWORD *)v15 + 1) = 0xE500000000000000;

  v33.receiver = v7;
  v33.super_class = v4;
  v16 = (char *)objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v17 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
  v18 = objc_allocWithZone(v17);
  v19 = (CGRect *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  v20 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  v21 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
  v22 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
  v23 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
  v24 = (char *)v18;
  v34.origin.x = v20;
  v34.origin.y = v21;
  v34.size.width = v22;
  v34.size.height = v23;
  MinX = CGRectGetMinX(v34);
  MinY = CGRectGetMinY(*v19);
  Width = CGRectGetWidth(*v19);
  Height = CGRectGetHeight(*v19);
  v29 = (CGFloat *)&v24[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
  *v29 = MinX;
  v29[1] = MinY;
  v29[2] = Width;
  v29[3] = Height;
  *(double *)&v24[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = *(float *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];

  v32.receiver = v24;
  v32.super_class = v17;
  v30 = objc_msgSendSuper2(&v32, sel_init);

  qword_255E3ED30 = (uint64_t)v30;
}

id static AudiogramGraphDetectorResult.defaultResult.getter()
{
  if (qword_255E3EAB8 != -1)
    swift_once();
  return (id)qword_255E3ED30;
}

void AudiogramGraphDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22FB82708(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E656469666E6F63;
  else
    return 7892834;
}

BOOL sub_22FB8273C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22FB82754()
{
  char *v0;

  return sub_22FB82708(*v0);
}

uint64_t sub_22FB8275C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22FB84CB0(a1, a2);
  *a3 = result;
  return result;
}

void sub_22FB82780(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_22FB8278C()
{
  sub_22FB83F08();
  return sub_22FB8D460();
}

uint64_t sub_22FB827B4()
{
  sub_22FB83F08();
  return sub_22FB8D46C();
}

id AudiogramGraphDetectorResult.__deallocating_deinit()
{
  return sub_22FB827E8(type metadata accessor for AudiogramGraphDetectorResult);
}

id sub_22FB827E8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_22FB8281C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 *v9;
  __int128 v10;
  _BYTE v12[16];
  __int128 v13;
  __int128 v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3ED98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22FB83F08();
  sub_22FB8D454();
  v9 = (__int128 *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  v10 = v9[1];
  v13 = *v9;
  v14 = v10;
  v12[15] = 0;
  type metadata accessor for CGRect(0);
  sub_22FB83EA8(&qword_255E3ED70, MEMORY[0x24BDBD828]);
  sub_22FB8D3DC();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_22FB8D3C4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

char *AudiogramGraphDetectorResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AudiogramGraphDetectorResult.init(from:)(a1);
}

char *AudiogramGraphDetectorResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  char v22;

  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EDA8);
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v18 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_22FB83F08();
  v8 = v1;
  v16 = v6;
  sub_22FB8D448();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    type metadata accessor for AudiogramGraphDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for CGRect(0);
    v22 = 0;
    sub_22FB83EA8(&qword_255E3ED80, MEMORY[0x24BDBD838]);
    v9 = v17;
    v10 = v16;
    sub_22FB8D3AC();
    v11 = &v8[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
    *(_OWORD *)v11 = v20;
    *((_OWORD *)v11 + 1) = v21;
    LOBYTE(v20) = 1;
    sub_22FB8D394();
    *(_QWORD *)&v8[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = v13;

    v14 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
    v19.receiver = v8;
    v19.super_class = v14;
    v8 = (char *)objc_msgSendSuper2(&v19, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  return v8;
}

uint64_t sub_22FB82BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AudiogramGraphDetectorResult();
  result = sub_22FB8D2D4();
  *a1 = result;
  return result;
}

uint64_t sub_22FB82C00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22FB82C24(a1, type metadata accessor for AudiogramGraphDetectorResult, (uint64_t (*)(uint64_t))AudiogramGraphDetectorResult.init(from:), a2);
}

uint64_t sub_22FB82C24@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  id v8;
  uint64_t result;

  v8 = objc_allocWithZone((Class)a2());
  result = a3(a1);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_22FB82C78(_QWORD *a1)
{
  return sub_22FB8281C(a1);
}

void sub_22FB82C9C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_22FB8D364();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2348AA490);
}

uint64_t sub_22FB82D04(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_22FB83C84();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_22FB82E70(v6);
  return sub_22FB8D310();
}

_QWORD *sub_22FB82D7C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EE58);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_22FB83A90((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_22FB8D364();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_22FB82E70(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  char v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *__dst;
  uint64_t v95;

  v2 = v1;
  v4 = a1[1];
  result = sub_22FB8D3F4();
  if (result >= v4)
  {
    if (v4 < 0)
      goto LABEL_129;
    if (v4)
      return sub_22FB834EC(0, v4, 1, a1);
    return result;
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_137;
  v7 = result;
  v89 = a1;
  if (v4 < 2)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v95 = MEMORY[0x24BEE4AF8];
    __dst = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_95:
      v81 = v10;
      if (v13 >= 2)
      {
        v82 = *v89;
        do
        {
          v83 = v13 - 2;
          if (v13 < 2)
            goto LABEL_124;
          if (!v82)
            goto LABEL_136;
          v84 = v81;
          v85 = *(_QWORD *)&v81[16 * v83 + 32];
          v86 = *(_QWORD *)&v81[16 * v13 + 24];
          sub_22FB8355C((char *)(v82 + 8 * v85), (char *)(v82 + 8 * *(_QWORD *)&v81[16 * v13 + 16]), v82 + 8 * v86, __dst);
          if (v2)
            break;
          if (v86 < v85)
            goto LABEL_125;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v84 = sub_22FB83988((uint64_t)v84);
          if (v83 >= *((_QWORD *)v84 + 2))
            goto LABEL_126;
          v87 = &v84[16 * v83 + 32];
          *(_QWORD *)v87 = v85;
          *((_QWORD *)v87 + 1) = v86;
          v88 = *((_QWORD *)v84 + 2);
          if (v13 > v88)
            goto LABEL_127;
          memmove(&v84[16 * v13 + 16], &v84[16 * v13 + 32], 16 * (v88 - v13));
          v81 = v84;
          *((_QWORD *)v84 + 2) = v88 - 1;
          v13 = v88 - 1;
        }
        while (v88 > 2);
      }
LABEL_92:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v95 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_22FB8D1E4();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = v6 >> 1;
    type metadata accessor for AudiogramGraphDetectorResult();
    v9 = sub_22FB8D1FC();
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    __dst = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v95 = v9;
  }
  v11 = 0;
  v12 = *a1;
  v90 = *a1 - 8;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v91 = v7;
  v92 = v4;
  v93 = *a1;
  while (1)
  {
    v14 = v11++;
    if (v11 < v4)
    {
      v15 = *(double *)(*(_QWORD *)(v12 + 8 * v11)
                      + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
      v16 = *(double *)(*(_QWORD *)(v12 + 8 * v14)
                      + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
      v11 = v14 + 2;
      if (v14 + 2 < v4)
      {
        v17 = v15;
        while (1)
        {
          v18 = v17;
          v17 = *(double *)(*(_QWORD *)(v12 + 8 * v11)
                          + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
          if (v16 < v15 == v18 >= v17)
            break;
          if (v4 == ++v11)
          {
            v11 = v4;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v11 < v14)
          goto LABEL_130;
        if (v14 < v11)
        {
          v19 = (uint64_t *)(v90 + 8 * v11);
          v20 = v11;
          v21 = v14;
          v22 = (uint64_t *)(v12 + 8 * v14);
          do
          {
            if (v21 != --v20)
            {
              if (!v12)
                goto LABEL_135;
              v23 = *v22;
              *v22 = *v19;
              *v19 = v23;
            }
            ++v21;
            --v19;
            ++v22;
          }
          while (v21 < v20);
        }
      }
    }
    if (v11 >= v4)
      goto LABEL_45;
    if (__OFSUB__(v11, v14))
      goto LABEL_128;
    if (v11 - v14 >= v7)
      goto LABEL_45;
    v24 = v14 + v7;
    if (__OFADD__(v14, v7))
      goto LABEL_131;
    if (v24 >= v4)
      v24 = v4;
    if (v24 < v14)
      break;
    if (v11 != v24)
    {
      v25 = (uint64_t *)(v90 + 8 * v11);
      do
      {
        v26 = *(_QWORD *)(v12 + 8 * v11);
        v27 = v14;
        v28 = v25;
        do
        {
          v29 = *v28;
          if (*(double *)(*v28 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(v26 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
            break;
          if (!v12)
            goto LABEL_133;
          *v28 = v26;
          v28[1] = v29;
          --v28;
          ++v27;
        }
        while (v11 != v27);
        ++v11;
        ++v25;
      }
      while (v11 != v24);
      v11 = v24;
    }
LABEL_45:
    if (v11 < v14)
      goto LABEL_123;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_22FB837E8(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v31 = *((_QWORD *)v10 + 2);
    v30 = *((_QWORD *)v10 + 3);
    v13 = v31 + 1;
    v12 = v93;
    if (v31 >= v30 >> 1)
    {
      v80 = sub_22FB837E8((char *)(v30 > 1), v31 + 1, 1, v10);
      v12 = v93;
      v10 = v80;
    }
    *((_QWORD *)v10 + 2) = v13;
    v32 = v10 + 32;
    v33 = &v10[16 * v31 + 32];
    *(_QWORD *)v33 = v14;
    *((_QWORD *)v33 + 1) = v11;
    if (v31)
    {
      while (1)
      {
        v34 = v13 - 1;
        if (v13 >= 4)
        {
          v39 = &v32[16 * v13];
          v40 = *((_QWORD *)v39 - 8);
          v41 = *((_QWORD *)v39 - 7);
          v45 = __OFSUB__(v41, v40);
          v42 = v41 - v40;
          if (v45)
            goto LABEL_112;
          v44 = *((_QWORD *)v39 - 6);
          v43 = *((_QWORD *)v39 - 5);
          v45 = __OFSUB__(v43, v44);
          v37 = v43 - v44;
          v38 = v45;
          if (v45)
            goto LABEL_113;
          v46 = v13 - 2;
          v47 = &v32[16 * v13 - 32];
          v49 = *(_QWORD *)v47;
          v48 = *((_QWORD *)v47 + 1);
          v45 = __OFSUB__(v48, v49);
          v50 = v48 - v49;
          if (v45)
            goto LABEL_115;
          v45 = __OFADD__(v37, v50);
          v51 = v37 + v50;
          if (v45)
            goto LABEL_118;
          if (v51 >= v42)
          {
            v69 = &v32[16 * v34];
            v71 = *(_QWORD *)v69;
            v70 = *((_QWORD *)v69 + 1);
            v45 = __OFSUB__(v70, v71);
            v72 = v70 - v71;
            if (v45)
              goto LABEL_122;
            v62 = v37 < v72;
            goto LABEL_82;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v63 = *((_QWORD *)v10 + 4);
            v64 = *((_QWORD *)v10 + 5);
            v45 = __OFSUB__(v64, v63);
            v56 = v64 - v63;
            v57 = v45;
            goto LABEL_76;
          }
          v36 = *((_QWORD *)v10 + 4);
          v35 = *((_QWORD *)v10 + 5);
          v45 = __OFSUB__(v35, v36);
          v37 = v35 - v36;
          v38 = v45;
        }
        if ((v38 & 1) != 0)
          goto LABEL_114;
        v46 = v13 - 2;
        v52 = &v32[16 * v13 - 32];
        v54 = *(_QWORD *)v52;
        v53 = *((_QWORD *)v52 + 1);
        v55 = __OFSUB__(v53, v54);
        v56 = v53 - v54;
        v57 = v55;
        if (v55)
          goto LABEL_117;
        v58 = &v32[16 * v34];
        v60 = *(_QWORD *)v58;
        v59 = *((_QWORD *)v58 + 1);
        v45 = __OFSUB__(v59, v60);
        v61 = v59 - v60;
        if (v45)
          goto LABEL_120;
        if (__OFADD__(v56, v61))
          goto LABEL_121;
        if (v56 + v61 >= v37)
        {
          v62 = v37 < v61;
LABEL_82:
          if (v62)
            v34 = v46;
          goto LABEL_84;
        }
LABEL_76:
        if ((v57 & 1) != 0)
          goto LABEL_116;
        v65 = &v32[16 * v34];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v45 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v45)
          goto LABEL_119;
        if (v68 < v56)
          goto LABEL_14;
LABEL_84:
        v73 = v34 - 1;
        if (v34 - 1 >= v13)
        {
          __break(1u);
LABEL_109:
          __break(1u);
LABEL_110:
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
          goto LABEL_132;
        }
        if (!v12)
          goto LABEL_134;
        v74 = v10;
        v75 = &v32[16 * v73];
        v76 = *(_QWORD *)v75;
        v77 = &v32[16 * v34];
        v78 = *((_QWORD *)v77 + 1);
        sub_22FB8355C((char *)(v12 + 8 * *(_QWORD *)v75), (char *)(v12 + 8 * *(_QWORD *)v77), v12 + 8 * v78, __dst);
        if (v1)
          goto LABEL_92;
        if (v78 < v76)
          goto LABEL_109;
        if (v34 > *((_QWORD *)v74 + 2))
          goto LABEL_110;
        *(_QWORD *)v75 = v76;
        *(_QWORD *)&v32[16 * v73 + 8] = v78;
        v79 = *((_QWORD *)v74 + 2);
        if (v34 >= v79)
          goto LABEL_111;
        v10 = v74;
        v13 = v79 - 1;
        memmove(&v32[16 * v34], v77 + 16, 16 * (v79 - 1 - v34));
        *((_QWORD *)v74 + 2) = v79 - 1;
        v12 = v93;
        if (v79 <= 2)
          goto LABEL_14;
      }
    }
    v13 = 1;
LABEL_14:
    v7 = v91;
    v4 = v92;
    if (v11 >= v92)
    {
      v2 = v1;
      goto LABEL_95;
    }
  }
LABEL_132:
  __break(1u);
LABEL_133:
  __break(1u);
LABEL_134:
  __break(1u);
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  result = sub_22FB8D34C();
  __break(1u);
  return result;
}

uint64_t sub_22FB834EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    v6 = *(_QWORD *)(v4 + 8 * a3);
    v7 = result;
    v8 = (uint64_t *)v5;
    while (1)
    {
      v9 = *v8;
      if (*(double *)(*v8 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
      {
LABEL_4:
        ++a3;
        v5 += 8;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      *v8 = v6;
      v8[1] = v9;
      --v8;
      if (a3 == ++v7)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22FB8355C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst)
        memmove(__dst, a2, 8 * v13);
      v16 = &v4[8 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        v17 = (char *)(a3 - 8);
        while (1)
        {
          v18 = v17 + 8;
          v19 = v6 - 8;
          v20 = *((_QWORD *)v6 - 1);
          if (*(double *)(v20 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(*((_QWORD *)v16 - 1) + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
          {
            v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16)
              *(_QWORD *)v17 = *((_QWORD *)v16 - 1);
            v16 -= 8;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v18 != v6 || v17 >= v6)
              *(_QWORD *)v17 = v20;
            v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7)
              goto LABEL_42;
          }
          v17 -= 8;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[8 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(double *)(*(_QWORD *)v4 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(*(_QWORD *)v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
        {
          if (v7 != v4)
            *(_QWORD *)v7 = *(_QWORD *)v4;
          v4 += 8;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_QWORD *)v7 = *(_QWORD *)v6;
        }
        v7 += 8;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_22FB838E0((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_22FB8D37C();
  __break(1u);
  return result;
}

char *sub_22FB837E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EE70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22FB838E0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_22FB8D37C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_22FB83988(uint64_t a1)
{
  return sub_22FB837E8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*sub_22FB8399C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22FB83A1C(v6, a2, a3);
  return sub_22FB839F0;
}

void sub_22FB839F0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_22FB83A1C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2348AA484](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_22FB83A88;
  }
  __break(1u);
  return result;
}

void sub_22FB83A88(id *a1)
{

}

uint64_t sub_22FB83A90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_22FB8D364();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_22FB8D364();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22FB84D94();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EE60);
          v12 = sub_22FB8399C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for AudiogramGraphDetectorResult();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_22FB8D37C();
  __break(1u);
  return result;
}

void sub_22FB83C84()
{
  JUMPOUT(0x2348AA58CLL);
}

uint64_t _s18AudiogramIngestion0A20SymbolDetectorResultC21boundingBoxForSymbolsySo6CGRectVSayACGFZ_0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  char *v5;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  uint64_t v10;
  char *v11;
  void *v12;
  CGRect v13;
  CGRect v14;

  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_22FB8D364();
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v4 = (char *)MEMORY[0x2348AA484](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_17;
    }
    v4 = (char *)*(id *)(a1 + 32);
  }
  v5 = v4;
  result = swift_bridgeObjectRelease();
  if (v2 >= 1)
  {
    width = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
    height = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 24];
    x = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
    y = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
    swift_bridgeObjectRetain();
    v10 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v11 = (char *)MEMORY[0x2348AA484](v10, a1);
      else
        v11 = (char *)*(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      ++v10;
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      v14 = CGRectUnion(v13, *(CGRect *)&v11[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box]);
      x = v14.origin.x;
      y = v14.origin.y;
      width = v14.size.width;
      height = v14.size.height;

    }
    while (v2 != v10);

    return swift_bridgeObjectRelease();
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AudiogramSymbolDetectorResult()
{
  return objc_opt_self();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_22FB83E64()
{
  unint64_t result;

  result = qword_255E3ED68;
  if (!qword_255E3ED68)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB9096C, &type metadata for AudiogramSymbolDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3ED68);
  }
  return result;
}

uint64_t sub_22FB83EA8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    result = MEMORY[0x2348AADFC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for AudiogramGraphDetectorResult()
{
  return objc_opt_self();
}

unint64_t sub_22FB83F08()
{
  unint64_t result;

  result = qword_255E3EDA0;
  if (!qword_255E3EDA0)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB9091C, &type metadata for AudiogramGraphDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EDA0);
  }
  return result;
}

uint64_t sub_22FB83F4C()
{
  return MEMORY[0x24BEE0948];
}

__n128 sub_22FB83F58@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_22FB83FA8(__n128 *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = *a2 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  result = v6;
  *(__n128 *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

uint64_t method lookup function for AudiogramDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramDetectorResult.__allocating_init(graph:symbols:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for AudiogramSymbolDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.scaledBox(size:offset:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for AudiogramGraphDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.box.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.scaledBox(size:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudiogramGraphDetectorResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudiogramGraphDetectorResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22FB841FC + 4 * byte_22FB905E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22FB84230 + 4 * byte_22FB905E0[v4]))();
}

uint64_t sub_22FB84230(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB84238(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22FB84240);
  return result;
}

uint64_t sub_22FB8424C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22FB84254);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22FB84258(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB84260(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB8426C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22FB84274(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudiogramGraphDetectorResult.CodingKeys()
{
  return &type metadata for AudiogramGraphDetectorResult.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AudiogramSymbolDetectorResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudiogramSymbolDetectorResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22FB8436C + 4 * byte_22FB905EF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22FB843A0 + 4 * byte_22FB905EA[v4]))();
}

uint64_t sub_22FB843A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB843A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22FB843B0);
  return result;
}

uint64_t sub_22FB843BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22FB843C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22FB843C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB843D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22FB843DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudiogramSymbolDetectorResult.CodingKeys()
{
  return &type metadata for AudiogramSymbolDetectorResult.CodingKeys;
}

unint64_t sub_22FB843F8()
{
  unint64_t result;

  result = qword_255E3EE28;
  if (!qword_255E3EE28)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB9083C, &type metadata for AudiogramSymbolDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE28);
  }
  return result;
}

unint64_t sub_22FB84440()
{
  unint64_t result;

  result = qword_255E3EE30;
  if (!qword_255E3EE30)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB908F4, &type metadata for AudiogramGraphDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE30);
  }
  return result;
}

unint64_t sub_22FB84488()
{
  unint64_t result;

  result = qword_255E3EE38;
  if (!qword_255E3EE38)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB90864, &type metadata for AudiogramGraphDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE38);
  }
  return result;
}

unint64_t sub_22FB844D0()
{
  unint64_t result;

  result = qword_255E3EE40;
  if (!qword_255E3EE40)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB9088C, &type metadata for AudiogramGraphDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE40);
  }
  return result;
}

unint64_t sub_22FB84518()
{
  unint64_t result;

  result = qword_255E3EE48;
  if (!qword_255E3EE48)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB907AC, &type metadata for AudiogramSymbolDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE48);
  }
  return result;
}

unint64_t sub_22FB84560()
{
  unint64_t result;

  result = qword_255E3EE50;
  if (!qword_255E3EE50)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB907D4, &type metadata for AudiogramSymbolDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3EE50);
  }
  return result;
}

uint64_t sub_22FB845A4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v3 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D614E6C6562616CLL && a2 == 0xE900000000000065 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_22FB8D40C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_22FB846E8(unint64_t a1, double *a2, double a3)
{
  uint64_t v5;
  CGRect *v6;
  unint64_t i;
  unint64_t v8;
  char *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MinX;
  double v28;
  double MinY;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v36;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v41 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_31;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v6 = (CGRect *)((char *)a2 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  if (v5)
  {
    for (i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v9 = (char *)MEMORY[0x2348AA484](i, a1);
      }
      else
      {
        if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          v5 = sub_22FB8D364();
          goto LABEL_3;
        }
        v9 = (char *)*(id *)(a1 + 8 * i + 32);
      }
      v10 = v9;
      v8 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_30;
      a2 = (double *)&v9[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
      swift_beginAccess();
      v42.origin.x = *a2;
      v11 = a2[1];
      v12 = a2[2];
      v13 = a2[3];
      v53 = *v6;
      y = v53.origin.y;
      x = v6->origin.x;
      width = v53.size.width;
      v36 = *a2;
      height = v53.size.height;
      v42.origin.y = v11;
      v42.size.width = v12;
      v42.size.height = v13;
      v43 = CGRectIntersection(v42, *v6);
      v14 = v43.origin.x;
      v15 = v43.origin.y;
      v16 = v43.size.width;
      v17 = v43.size.height;
      v18 = CGRectGetHeight(v43);
      v44.origin.x = v14;
      v44.origin.y = v15;
      v44.size.width = v16;
      v44.size.height = v17;
      v19 = v18 * CGRectGetWidth(v44);
      v45.origin.x = v36;
      v45.origin.y = v11;
      v45.size.width = v12;
      v45.size.height = v13;
      v20 = CGRectGetHeight(v45);
      v46.origin.x = v36;
      v46.origin.y = v11;
      v46.size.width = v12;
      v46.size.height = v13;
      v21 = v20 * CGRectGetWidth(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v22 = CGRectGetHeight(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      if (v19 / (v21 + v22 * CGRectGetWidth(v48) - v19) <= a3)
      {
        a2 = (double *)&v41;
        sub_22FB8D304();
        sub_22FB8D328();
        v8 = i + 1;
        sub_22FB8D334();
        sub_22FB8D310();
      }
      else
      {
        v49 = CGRectUnion(*v6, *(CGRect *)a2);
        v23 = v49.origin.x;
        v24 = v49.origin.y;
        v25 = v49.size.width;
        v26 = v49.size.height;
        MinX = CGRectGetMinX(v49);
        if (MinX < 0.0)
          MinX = 0.0;
        v28 = fmin(MinX, 1.0);
        v50.origin.x = v23;
        v50.origin.y = v24;
        v50.size.width = v25;
        v50.size.height = v26;
        MinY = CGRectGetMinY(v50);
        if (MinY < 0.0)
          MinY = 0.0;
        v30 = fmin(MinY, 1.0);
        v51.origin.x = v23;
        v51.origin.y = v24;
        v51.size.width = v25;
        v51.size.height = v26;
        v31 = CGRectGetWidth(v51);
        if (v31 < 0.0)
          v31 = 0.0;
        if (v31 >= 1.0 - v28)
          v32 = 1.0 - v28;
        else
          v32 = v31;
        v52.origin.x = v23;
        v52.origin.y = v24;
        v52.size.width = v25;
        v52.size.height = v26;
        v33 = CGRectGetHeight(v52);
        if (v33 < 0.0)
          v33 = 0.0;
        v6->origin.x = v28;
        v6->origin.y = v30;
        if (v33 >= 1.0 - v30)
          v33 = 1.0 - v30;
        v6->size.width = v32;
        v6->size.height = v33;

      }
      if (v8 == v5)
        return v41;
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22FB84A40(unint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a1;
  v19 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_20;
  v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      v17 = v4;
      sub_22FB82D04(&v17);
      v5 = v17;
      v18 = v17;
      if (v17 < 0 || (v17 & 0x4000000000000000) != 0)
        break;
      if (*(uint64_t *)(v17 + 16) < 1)
        goto LABEL_24;
      while (1)
      {
LABEL_7:
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v5 & 0x8000000000000000) != 0
          || (v5 & 0x4000000000000000) != 0)
        {
          sub_22FB82C9C(v5);
        }
        v3 = v5 & 0xFFFFFFFFFFFFFF8;
        v6 = *(_QWORD *)(v3 + 16);
        if (!v6)
          break;
        v7 = v6 - 1;
        v9 = *(void **)(v3 + 32);
        v8 = v3 + 32;
        memmove((void *)v8, (const void *)(v8 + 8), 8 * (v6 - 1));
        *(_QWORD *)(v8 - 16) = v7;
        sub_22FB8D1E4();
        v10 = v9;
        MEMORY[0x2348AA358]();
        if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22FB8D1F0();
        sub_22FB8D208();
        sub_22FB8D1E4();
        v11 = swift_bridgeObjectRetain();
        v5 = sub_22FB846E8(v11, v10, a2);
        swift_bridgeObjectRelease_n();

        v18 = v5;
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain();
          v12 = sub_22FB8D364();
          swift_bridgeObjectRelease();
          if (v12 <= 0)
          {
LABEL_18:
            swift_bridgeObjectRelease();
            return v19;
          }
        }
        else if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
        {
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
      v13 = sub_22FB8D364();
      swift_bridgeObjectRelease();
      if (v13 < 1)
        goto LABEL_22;
      v14 = swift_bridgeObjectRetain();
      v4 = (uint64_t)sub_22FB82D7C(v14);
      swift_bridgeObjectRelease();
    }
    swift_retain();
    v15 = sub_22FB8D364();
    swift_release();
    if (v15 >= 1)
      goto LABEL_7;
LABEL_24:
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_22FB84CB0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v3 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22FB8D40C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_22FB84D94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E3EE68;
  if (!qword_255E3EE68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E3EE60);
    result = MEMORY[0x2348AADFC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255E3EE68);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AADF0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t AudiogramSymbolType.init(rawValue:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 11)
    v1 = 11;
  else
    v1 = 0;
  if (a1 == 4)
    return 4;
  else
    return v1;
}

void *static AudiogramSymbolType.allCases.getter()
{
  return &unk_24FD6DC90;
}

BOOL sub_22FB84E60(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_22FB84E78()
{
  unint64_t result;

  result = qword_255E3EE78;
  if (!qword_255E3EE78)
  {
    result = MEMORY[0x2348AADFC](&protocol conformance descriptor for AudiogramSymbolType, &type metadata for AudiogramSymbolType);
    atomic_store(result, (unint64_t *)&qword_255E3EE78);
  }
  return result;
}

uint64_t sub_22FB84EBC()
{
  sub_22FB8D424();
  sub_22FB8D430();
  return sub_22FB8D43C();
}

uint64_t sub_22FB84F00()
{
  return sub_22FB8D430();
}

uint64_t sub_22FB84F28()
{
  sub_22FB8D424();
  sub_22FB8D430();
  return sub_22FB8D43C();
}

unint64_t sub_22FB84F6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E3EE80;
  if (!qword_255E3EE80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E3EE88);
    result = MEMORY[0x2348AADFC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255E3EE80);
  }
  return result;
}

void sub_22FB84FB8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24FD6DCC0;
}

uint64_t *sub_22FB84FC8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;

  v2 = *result;
  if (*result == 4)
    v3 = 4;
  else
    v3 = 0;
  v4 = v2 == 11;
  if (v2 == 11)
    v5 = 11;
  else
    v5 = v3;
  v6 = !v4 && *result != 4;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v6;
  return result;
}

void sub_22FB84FF8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for AudiogramSymbolType()
{
  return &type metadata for AudiogramSymbolType;
}

uint64_t sub_22FB85014(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = sub_22FB87FE8(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_22FB88098(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

id AudiogramDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(a1, a2, a3, a4);
}

id AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  double *v17;
  objc_class *v18;
  id v19;
  objc_super v21;

  v9 = sub_22FB8D10C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model] = 0;
  v13 = &v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url];
  v14 = sub_22FB8D0A0();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a1, v14);
  v16 = v4;
  sub_22FB8D100();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_logger], v12, v9);
  v17 = (double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  *v17 = a2;
  v17[1] = a3;
  *(float *)&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold] = a4;

  v18 = (objc_class *)type metadata accessor for AudiogramDetectorModel(0);
  v21.receiver = v16;
  v21.super_class = v18;
  v19 = objc_msgSendSuper2(&v21, sel_init);
  sub_22FB853B8();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
  return v19;
}

uint64_t type metadata accessor for AudiogramDetectorModel(uint64_t a1)
{
  return sub_22FB88234(a1, (uint64_t *)&unk_255E3EEE8);
}

void sub_22FB853B8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  os_log_type_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18[2];
  uint64_t v19;

  v1 = v0;
  v2 = sub_22FB8D0A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  sub_22FB884A4(0, &qword_255E3EF80);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url], v2);
  v7 = sub_22FB880F0((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    v17 = *(void **)&v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model];
    *(_QWORD *)&v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model] = v7;

  }
  else
  {
    v8 = sub_22FB8D274();
    v9 = v1;
    v10 = sub_22FB8D0F4();
    v11 = v8;
    if (os_log_type_enabled(v10, v8))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v18[0] = v6;
      v14 = v13;
      v19 = v13;
      *(_DWORD *)v12 = 136315138;
      sub_22FB884DC();
      v15 = sub_22FB8D400();
      v18[1] = (id)sub_22FB87864(v15, v16, &v19);
      sub_22FB8D298();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22FB4F000, v10, v11, "Failed to load model from url %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348AAE74](v14, -1, -1);
      MEMORY[0x2348AAE74](v12, -1, -1);

    }
    else
    {

    }
  }
}

id AudiogramDetectorModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AudiogramDetectorModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudiogramDetectorModel.__deallocating_deinit()
{
  return sub_22FB86A9C(type metadata accessor for AudiogramDetectorModel);
}

id AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, float a6)
{
  objc_class *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  uint64_t v20;

  v13 = sub_22FB8D0A0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v17[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames] = a2;
  *(_QWORD *)&v17[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames] = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v18 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v16, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v18;
}

id AudiogramSymbolDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, float a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v19;

  v13 = sub_22FB8D0A0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames) = a2;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames) = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v17 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v16, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v17;
}

uint64_t sub_22FB85A28(CGImage *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  int64_t Width;
  int64_t Height;
  CGImageRef v24;
  CGImageRef v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t inited;
  id v37;
  id v38;
  id v39;
  id v40;
  os_log_type_t v41;
  NSObject *v42;
  uint8_t *v43;
  uint8_t *v44;
  os_log_type_t v45;
  os_log_type_t v46;
  uint8_t *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  os_log_type_t v53;
  os_log_type_t v54;
  uint8_t *v55;
  os_log_type_t v56;
  NSObject *v57;
  uint8_t *v58;
  id v59;
  void *v60;
  os_log_type_t v61;
  NSObject *v62;
  uint8_t *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v78;
  int64_t v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  os_log_type_t v84;
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  _QWORD *v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  os_log_type_t v94;
  NSObject *v95;
  uint8_t *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104[6];
  CGRect v105;

  v4 = v3;
  v104[4] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model;
  v9 = *(void **)&v3[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model];
  if (!v9)
  {
    sub_22FB853B8();
    v9 = *(void **)&v3[v8];
    if (!v9)
    {
      v53 = sub_22FB8D274();
      v10 = sub_22FB8D0F4();
      v54 = v53;
      if (os_log_type_enabled(v10, v53))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_22FB4F000, v10, v54, "Failed to find symbols, model is nil", v55, 2u);
        MEMORY[0x2348AAE74](v55, -1, -1);
      }
      goto LABEL_21;
    }
  }
  v10 = v9;
  v11 = -[NSObject modelDescription](v10, sel_modelDescription);
  v12 = objc_msgSend(v11, sel_inputDescriptionsByName);

  sub_22FB884A4(0, &qword_255E3EEA8);
  v13 = sub_22FB8D148();

  v14 = sub_22FB85014(v13);
  v16 = v15;
  swift_bridgeObjectRelease();
  if (!v16)
  {
    v41 = sub_22FB8D274();
    v42 = sub_22FB8D0F4();
    if (os_log_type_enabled(v42, v41))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22FB4F000, v42, v41, "Failed to find symbols, no input key names found", v43, 2u);
      v44 = v43;
LABEL_19:
      MEMORY[0x2348AAE74](v44, -1, -1);
    }
LABEL_20:

LABEL_21:
    return 0;
  }
  v17 = (double *)(a3 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  v18 = *v17;
  v19 = v17[1];
  v20 = v17[2];
  v21 = v17[3];
  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  sub_22FB7DF60(a2, (double)Width, (double)Height, v18, v19, v20, v21);
  v24 = CGImageCreateWithImageInRect(a1, v105);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    v45 = sub_22FB8D274();
    v42 = sub_22FB8D0F4();
    v46 = v45;
    if (os_log_type_enabled(v42, v45))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = (void *)swift_slowAlloc();
      v104[0] = v48;
      *(_DWORD *)v47 = 136315138;
      v49 = sub_22FB8D280();
      sub_22FB87864(v49, v50, (uint64_t *)v104);
      sub_22FB8D298();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22FB4F000, v42, v46, "Failed to find symbols, unable to crop image to graph rect %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348AAE74](v48, -1, -1);
      v44 = v47;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v25 = v24;
  v27 = *(double *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  v26 = *(double *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize + 8];
  sub_22FB7E1C8(v27, v26);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    v56 = sub_22FB8D274();
    v57 = sub_22FB8D0F4();
    if (os_log_type_enabled(v57, v56))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_22FB4F000, v57, v56, "Failed to find symbols, unable to resize image", v58, 2u);
      MEMORY[0x2348AAE74](v58, -1, -1);
    }

    return 0;
  }
  if (v27 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_74;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if ((*(_QWORD *)&v27 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v26 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_75;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
  }
  if (v26 >= 9.22337204e18)
    goto LABEL_77;
  v29 = v28;
  v30 = (void *)objc_opt_self();
  v104[0] = 0;
  v31 = v29;
  v32 = objc_msgSend(v30, sel_featureValueWithCGImage_orientation_pixelsWide_pixelsHigh_pixelFormatType_options_error_, v31, a2, (uint64_t)v27, (uint64_t)v26, 32, 0, v104);
  if (!v32)
  {
    v59 = v104[0];
    v60 = (void *)sub_22FB8D07C();

    swift_willThrow();
    goto LABEL_30;
  }
  v33 = v32;
  v34 = v104[0];

  v35 = objc_msgSend(v33, sel_imageBufferValue);
  if (!v35)
  {
LABEL_30:
    v37 = 0;
LABEL_31:
    v61 = sub_22FB8D274();
    swift_bridgeObjectRetain();
    v62 = sub_22FB8D0F4();
    if (os_log_type_enabled(v62, v61))
    {
      v102 = v31;
      v100 = v37;
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = (void *)swift_slowAlloc();
      v104[0] = v64;
      *(_DWORD *)v63 = 136315138;
      swift_bridgeObjectRetain();
      sub_22FB87864(v14, v16, (uint64_t *)v104);
      sub_22FB8D298();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22FB4F000, v62, v61, "Failed to find symbols, unable to create model input with input name %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348AAE74](v64, -1, -1);
      MEMORY[0x2348AAE74](v63, -1, -1);

LABEL_33:
      return 0;
    }
    swift_bridgeObjectRelease_n();

LABEL_35:
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EEB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22FB90520;
  *(_QWORD *)(inited + 32) = v14;
  *(_QWORD *)(inited + 40) = v16;
  v37 = v35;
  swift_bridgeObjectRetain();
  v38 = objc_msgSend(v30, sel_featureValueWithPixelBuffer_, v37);
  *(_QWORD *)(inited + 72) = sub_22FB884A4(0, &qword_255E3EEB8);
  *(_QWORD *)(inited + 48) = v38;
  sub_22FB8669C(inited);
  v39 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v40 = sub_22FB87780();
  v65 = v40;
  if (!v40)
  {

    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  v104[0] = 0;
  v99 = v65;
  v66 = -[NSObject predictionFromFeatures:error:](v10, sel_predictionFromFeatures_error_, v65, v104);
  if (!v66)
  {
    v92 = v104[0];
    v93 = (void *)sub_22FB8D07C();

    swift_willThrow();
    v94 = sub_22FB8D274();
    v95 = sub_22FB8D0F4();
    if (os_log_type_enabled(v95, v94))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v96 = 0;
      _os_log_impl(&dword_22FB4F000, v95, v94, "Failed to find symbols, model output is nil", v96, 2u);
      MEMORY[0x2348AAE74](v96, -1, -1);
    }

    goto LABEL_35;
  }
  v67 = v66;
  v101 = v37;
  v102 = v31;
  v68 = v104[0];
  v103 = v67;
  v69 = objc_msgSend(v67, sel_featureNames);
  v70 = sub_22FB8D220();

  v98 = 0;
  v71 = 0;
  v72 = v70 + 56;
  v73 = 1 << *(_BYTE *)(v70 + 32);
  v74 = -1;
  if (v73 < 64)
    v74 = ~(-1 << v73);
  v75 = v74 & *(_QWORD *)(v70 + 56);
  v76 = (unint64_t)(v73 + 63) >> 6;
  while (1)
  {
    if (v75)
    {
      v75 &= v75 - 1;
      goto LABEL_55;
    }
    if (__OFADD__(v71++, 1))
      goto LABEL_78;
    if (v71 >= v76)
      break;
    v78 = *(_QWORD *)(v72 + 8 * v71);
    if (!v78)
    {
      v79 = v71 + 1;
      if (v71 + 1 >= v76)
        break;
      v78 = *(_QWORD *)(v72 + 8 * v79);
      if (!v78)
      {
        v79 = v71 + 2;
        if (v71 + 2 >= v76)
          break;
        v78 = *(_QWORD *)(v72 + 8 * v79);
        if (!v78)
        {
          v79 = v71 + 3;
          if (v71 + 3 >= v76)
            break;
          v78 = *(_QWORD *)(v72 + 8 * v79);
          if (!v78)
          {
            while (1)
            {
              v71 = v79 + 1;
              if (__OFADD__(v79, 1))
                goto LABEL_79;
              if (v71 >= v76)
                goto LABEL_63;
              v78 = *(_QWORD *)(v72 + 8 * v71);
              ++v79;
              if (v78)
                goto LABEL_54;
            }
          }
        }
      }
      v71 = v79;
    }
LABEL_54:
    v75 = (v78 - 1) & v78;
LABEL_55:
    swift_bridgeObjectRetain();
    if ((sub_22FB867C4() & 1) != 0)
    {
      v80 = (void *)sub_22FB8D154();
      swift_bridgeObjectRelease();
      v81 = objc_msgSend(v103, sel_featureValueForName_, v80);

      if (v81)
      {
        v82 = objc_msgSend(v81, sel_multiArrayValue);

        if (v82)
        {

          v98 = v82;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_63:
  swift_release();
  if (!v98)
  {
    swift_unknownObjectRelease();

    goto LABEL_33;
  }
  v83 = v98;
  v84 = sub_22FB8D268();
  v85 = v4;
  v86 = sub_22FB8D0F4();
  v87 = v84;
  v88 = &unk_255E3E000;
  if (os_log_type_enabled(v86, v84))
  {
    v89 = swift_slowAlloc();
    *(_DWORD *)v89 = 134218240;
    v104[0] = *(id *)(*(_QWORD *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames]
                    + 16);
    sub_22FB8D298();
    *(_WORD *)(v89 + 12) = 2048;
    v90 = v83;
    v91 = *(void **)(*(_QWORD *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames]
                   + 16);

    v104[0] = v91;
    v83 = v90;
    v88 = (_QWORD *)&unk_255E3E000;
    sub_22FB8D298();

    _os_log_impl(&dword_22FB4F000, v86, v87, "Got symbol prediction matrix, processing predictions for %ld classes, %ld collision mitigation classes", (uint8_t *)v89, 0x16u);
    MEMORY[0x2348AAE74](v89, -1, -1);
  }
  else
  {

  }
  sub_22FB8B2C4(v83, *(char ***)&v85[v88[467]], *(_QWORD *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames], *(float *)&v85[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold]);
  v51 = v97;
  swift_unknownObjectRelease();

  return v51;
}

unint64_t sub_22FB8669C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EF68);
  v2 = sub_22FB8D370();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22FB88410(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_22FB87EA4(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22FB88458(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22FB867C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_22FB8D19C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_22FB8D19C();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_22FB8D40C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_22FB8D19C();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_22FB8D19C();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

void AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22FB86A64()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id AudiogramSymbolDetectorModel.__deallocating_deinit()
{
  return sub_22FB86A9C(type metadata accessor for AudiogramSymbolDetectorModel);
}

id sub_22FB86A9C(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_22FB86B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t inited;
  id v25;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  NSObject *v30;
  uint8_t *v31;
  const char *v32;
  uint64_t v33;
  os_log_type_t v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v57;
  int64_t v58;
  void *v59;
  id v60;
  id v61;
  float v62;
  id v63;
  id v64;
  void *v65;
  os_log_type_t v66;
  NSObject *v67;
  uint8_t *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73[3];

  v3 = v2;
  v73[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model;
  v6 = *(void **)(v2 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model);
  if (!v6)
  {
    sub_22FB853B8();
    v6 = *(void **)(v2 + v5);
    if (!v6)
    {
      v35 = sub_22FB8D274();
      v7 = sub_22FB8D0F4();
      v36 = v35;
      if (os_log_type_enabled(v7, v35))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_22FB4F000, v7, v36, "Failed to find graphs, model is nil", v37, 2u);
        MEMORY[0x2348AAE74](v37, -1, -1);
      }
      goto LABEL_20;
    }
  }
  v7 = v6;
  v8 = -[NSObject modelDescription](v7, sel_modelDescription);
  v9 = objc_msgSend(v8, sel_inputDescriptionsByName);

  sub_22FB884A4(0, &qword_255E3EEA8);
  v10 = sub_22FB8D148();

  v11 = sub_22FB85014(v10);
  v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13)
  {
    v29 = sub_22FB8D274();
    v30 = sub_22FB8D0F4();
    if (os_log_type_enabled(v30, v29))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      v32 = "Failed to find graphs, no input key names found";
LABEL_18:
      _os_log_impl(&dword_22FB4F000, v30, v29, v32, v31, 2u);
      MEMORY[0x2348AAE74](v31, -1, -1);
    }
LABEL_19:

LABEL_20:
    return 0;
  }
  v15 = *(double *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize);
  v14 = *(double *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize + 8);
  sub_22FB7E1C8(v15, v14);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    v29 = sub_22FB8D274();
    v30 = sub_22FB8D0F4();
    if (os_log_type_enabled(v30, v29))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      v32 = "Failed to find graphs, unable to resize image";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v15 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_67;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if ((*(_QWORD *)&v15 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v14 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_68;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
  }
  if (v14 >= 9.22337204e18)
    goto LABEL_70;
  v17 = v16;
  v18 = (void *)objc_opt_self();
  v73[0] = 0;
  v19 = v17;
  v20 = objc_msgSend(v18, sel_featureValueWithCGImage_orientation_pixelsWide_pixelsHigh_pixelFormatType_options_error_, v19, a2, (uint64_t)v15, (uint64_t)v14, 32, 0, v73);
  if (!v20)
  {
    v38 = v73[0];
    v39 = (void *)sub_22FB8D07C();

    swift_willThrow();
    goto LABEL_26;
  }
  v21 = v20;
  v22 = v73[0];

  v23 = objc_msgSend(v21, sel_imageBufferValue);
  if (!v23)
  {
LABEL_26:
    v25 = 0;
LABEL_27:
    v40 = sub_22FB8D274();
    swift_bridgeObjectRetain();
    v41 = sub_22FB8D0F4();
    v42 = v40;
    if (os_log_type_enabled(v41, v40))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (void *)swift_slowAlloc();
      v73[0] = v44;
      *(_DWORD *)v43 = 136315138;
      swift_bridgeObjectRetain();
      sub_22FB87864(v11, v13, (uint64_t *)v73);
      sub_22FB8D298();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22FB4F000, v41, v42, "Failed to find graphs, unable to create model input with input name %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348AAE74](v44, -1, -1);
      MEMORY[0x2348AAE74](v43, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EEB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22FB90520;
  *(_QWORD *)(inited + 32) = v11;
  *(_QWORD *)(inited + 40) = v13;
  v25 = v23;
  swift_bridgeObjectRetain();
  v26 = objc_msgSend(v18, sel_featureValueWithPixelBuffer_, v25);
  *(_QWORD *)(inited + 72) = sub_22FB884A4(0, &qword_255E3EEB8);
  *(_QWORD *)(inited + 48) = v26;
  sub_22FB8669C(inited);
  v27 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v28 = sub_22FB87780();
  v45 = v28;
  if (!v28)
  {

    goto LABEL_27;
  }
  v71 = v25;
  swift_bridgeObjectRelease();
  v73[0] = 0;
  v72 = -[NSObject predictionFromFeatures:error:](v7, sel_predictionFromFeatures_error_, v45, v73);
  if (!v72)
  {
    v64 = v73[0];
    v65 = (void *)sub_22FB8D07C();

    swift_willThrow();
    v66 = sub_22FB8D274();
    v67 = sub_22FB8D0F4();
    if (os_log_type_enabled(v67, v66))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_22FB4F000, v67, v66, "Failed to find graphs, model output is nil", v68, 2u);
      MEMORY[0x2348AAE74](v68, -1, -1);
    }

    goto LABEL_65;
  }
  v69 = v45;
  v46 = v19;
  v47 = v73[0];
  v48 = objc_msgSend(v72, sel_featureNames);
  v49 = sub_22FB8D220();

  v70 = 0;
  v50 = 0;
  v51 = v49 + 56;
  v52 = 1 << *(_BYTE *)(v49 + 32);
  v53 = -1;
  if (v52 < 64)
    v53 = ~(-1 << v52);
  v54 = v53 & *(_QWORD *)(v49 + 56);
  v55 = (unint64_t)(v52 + 63) >> 6;
  while (1)
  {
    if (v54)
    {
      v54 &= v54 - 1;
      goto LABEL_50;
    }
    if (__OFADD__(v50++, 1))
      goto LABEL_71;
    v19 = v46;
    if (v50 >= v55)
      break;
    v57 = *(_QWORD *)(v51 + 8 * v50);
    if (!v57)
    {
      v58 = v50 + 1;
      if (v50 + 1 >= v55)
        break;
      v57 = *(_QWORD *)(v51 + 8 * v58);
      if (!v57)
      {
        v58 = v50 + 2;
        if (v50 + 2 >= v55)
          break;
        v57 = *(_QWORD *)(v51 + 8 * v58);
        if (!v57)
        {
          v58 = v50 + 3;
          if (v50 + 3 >= v55)
            break;
          v57 = *(_QWORD *)(v51 + 8 * v58);
          if (!v57)
          {
            while (1)
            {
              v50 = v58 + 1;
              if (__OFADD__(v58, 1))
                goto LABEL_72;
              if (v50 >= v55)
                goto LABEL_58;
              v57 = *(_QWORD *)(v51 + 8 * v50);
              ++v58;
              if (v57)
                goto LABEL_49;
            }
          }
        }
      }
      v50 = v58;
    }
LABEL_49:
    v54 = (v57 - 1) & v57;
LABEL_50:
    swift_bridgeObjectRetain();
    if ((sub_22FB867C4() & 1) != 0)
    {
      v59 = (void *)sub_22FB8D154();
      swift_bridgeObjectRelease();
      v60 = objc_msgSend(v72, sel_featureValueForName_, v59);

      if (v60)
      {
        v61 = objc_msgSend(v60, sel_multiArrayValue);

        if (v61)
        {

          v70 = v61;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_58:
  swift_release();
  if (v70)
  {
    v62 = *(float *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold);
    v63 = v70;
    v33 = sub_22FB8B5C4(v63, v62);
    swift_unknownObjectRelease();

    return v33;
  }
  swift_unknownObjectRelease();

LABEL_65:
  return 0;
}

id AudiogramGraphDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  objc_class *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v16;

  v9 = sub_22FB8D0A0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v14 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v12, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v14;
}

id AudiogramGraphDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v14;

  v8 = sub_22FB8D0A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v12 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v11, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v12;
}

id AudiogramGraphDetectorModel.__deallocating_deinit()
{
  return sub_22FB86A9C(type metadata accessor for AudiogramGraphDetectorModel);
}

id sub_22FB87780()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_22FB8D13C();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_22FB8D07C();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_22FB87864(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22FB87934(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22FB88468((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_22FB88468((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22FB87934(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22FB8D2A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22FB87AEC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_22FB8D2F8();
  if (!v8)
  {
    sub_22FB8D34C();
    __break(1u);
LABEL_17:
    result = sub_22FB8D37C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22FB87AEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22FB87B80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22FB87D58(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22FB87D58(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22FB87B80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_22FB87CF4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22FB8D2C8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22FB8D34C();
      __break(1u);
LABEL_10:
      v2 = sub_22FB8D1A8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22FB8D37C();
    __break(1u);
LABEL_14:
    result = sub_22FB8D34C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22FB87CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EF78);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22FB87D58(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EF78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22FB8D37C();
  __break(1u);
  return result;
}

unint64_t sub_22FB87EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22FB8D424();
  sub_22FB8D184();
  v4 = sub_22FB8D43C();
  return sub_22FB87F08(a1, a2, v4);
}

unint64_t sub_22FB87F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22FB8D40C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22FB8D40C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22FB87FE8(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_22FB88098(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

id sub_22FB880F0(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_22FB8D088();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_22FB8D0A0();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_22FB8D07C();

    swift_willThrow();
    v11 = sub_22FB8D0A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t type metadata accessor for AudiogramSymbolDetectorModel(uint64_t a1)
{
  return sub_22FB88234(a1, (uint64_t *)&unk_255E3EF20);
}

uint64_t type metadata accessor for AudiogramGraphDetectorModel(uint64_t a1)
{
  return sub_22FB88234(a1, (uint64_t *)&unk_255E3EF58);
}

uint64_t sub_22FB88234(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22FB88268()
{
  return type metadata accessor for AudiogramDetectorModel(0);
}

uint64_t sub_22FB88270()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22FB8D0A0();
  if (v1 <= 0x3F)
  {
    result = sub_22FB8D10C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AudiogramDetectorModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_22FB88330()
{
  return type metadata accessor for AudiogramSymbolDetectorModel(0);
}

uint64_t sub_22FB88338()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for AudiogramSymbolDetectorModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorModel.getSymbolDetectorResult(_:orientation:in:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t sub_22FB883AC()
{
  return type metadata accessor for AudiogramGraphDetectorModel(0);
}

uint64_t sub_22FB883B4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for AudiogramGraphDetectorModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudiogramGraphDetectorModel.getGraphDetectorResult(_:orientation:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_22FB88410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22FB88458(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22FB88468(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22FB884A4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_22FB884DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E3EF88;
  if (!qword_255E3EF88)
  {
    v1 = sub_22FB8D0A0();
    result = MEMORY[0x2348AADFC](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_255E3EF88);
  }
  return result;
}

void AudiogramSymbolDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)()
{
  AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)();
}

unint64_t sub_22FB88530(uint64_t a1)
{
  uint64_t v1;
  float v2;
  uint64_t v3;
  float *v4;
  float v5;
  float v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(float *)(a1 + 32);
    v3 = v1 - 1;
    if (v1 != 1)
    {
      v4 = (float *)(a1 + 36);
      do
      {
        v5 = *v4++;
        v6 = v5;
        if (v2 < v5)
          v2 = v6;
        --v3;
      }
      while (v3);
    }
    v7 = LODWORD(v2);
  }
  else
  {
    v7 = 0;
  }
  return v7 | ((unint64_t)(v1 == 0) << 32);
}

uint64_t sub_22FB88588(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t result;
  _QWORD *v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;

  v4 = a4[2];
  if (!v4)
    return 0;
  if (a4[4] == a2 && a4[5] == a3)
    return a1;
  result = sub_22FB8D40C();
  if ((result & 1) != 0)
    return a1;
  if (v4 == 1)
    return 0;
  v11 = a4 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1) == a2 && *v11 == a3;
    if (v14 || (sub_22FB8D40C() & 1) != 0)
      return a1;
    result = 0;
    v11 += 2;
    if (v13 == v4)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_22FB88664()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AudiogramIngestionInferenceRunner()
{
  return objc_opt_self();
}

uint64_t sub_22FB886E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat MidX;
  uint64_t v9;
  unint64_t v10;
  CGFloat MidY;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  sub_22FB8D2BC();
  sub_22FB8D190();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3EB18);
  v2 = swift_allocObject();
  v3 = *(_DWORD *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence);
  v4 = MEMORY[0x24BEE14E8];
  *(_OWORD *)(v2 + 16) = xmmword_22FB90520;
  v5 = MEMORY[0x24BEE1568];
  *(_QWORD *)(v2 + 56) = v4;
  *(_QWORD *)(v2 + 64) = v5;
  *(_DWORD *)(v2 + 32) = v3;
  sub_22FB8D16C();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  swift_bridgeObjectRetain();
  sub_22FB8D190();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22FB90530;
  v7 = v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect;
  MidX = CGRectGetMidX(*(CGRect *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect));
  CGRectGetMidY(*(CGRect *)v7);
  v9 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE50B0];
  v10 = sub_22FB893B4();
  *(_QWORD *)(v6 + 64) = v10;
  *(CGFloat *)(v6 + 32) = MidX;
  CGRectGetMidX(*(CGRect *)v7);
  MidY = CGRectGetMidY(*(CGRect *)v7);
  *(_QWORD *)(v6 + 96) = v9;
  *(_QWORD *)(v6 + 104) = v10;
  *(CGFloat *)(v6 + 72) = MidY;
  sub_22FB8D16C();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22FB90530;
  *(_QWORD *)(v12 + 56) = v9;
  *(_QWORD *)(v12 + 64) = v10;
  v13 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v7 + 16);
  *(_QWORD *)(v12 + 96) = v9;
  *(_QWORD *)(v12 + 104) = v10;
  *(_QWORD *)(v12 + 72) = v13;
  sub_22FB8D16C();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  swift_bridgeObjectRelease();
  sub_22FB8D190();
  return 0;
}

uint64_t sub_22FB88A00(char a1)
{
  return qword_22FB90DE8[a1];
}

uint64_t sub_22FB88A20()
{
  char *v0;

  return sub_22FB88A00(*v0);
}

uint64_t sub_22FB88A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22FB8BB88(a1, a2);
  *a3 = result;
  return result;
}

void sub_22FB88A4C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_22FB88A58()
{
  sub_22FB89330();
  return sub_22FB8D460();
}

uint64_t sub_22FB88A80()
{
  sub_22FB89330();
  return sub_22FB8D46C();
}

id sub_22FB88AA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindNetModelBoundingBox();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22FB88B30()
{
  return type metadata accessor for MindNetModelBoundingBox();
}

uint64_t type metadata accessor for MindNetModelBoundingBox()
{
  uint64_t result;

  result = qword_255E3F060;
  if (!qword_255E3F060)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22FB88B74()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22FB8D0B8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_22FB88C00(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  char v18;

  v2 = sub_22FB8D0B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F090);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22FB89330();
  v10 = v15[0];
  sub_22FB8D454();
  v11 = v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  LOBYTE(v16) = 0;
  sub_22FB89374(&qword_255E3F098, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  v12 = v15[1];
  sub_22FB8D3DC();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    LOBYTE(v16) = 1;
    sub_22FB8D3D0();
    v13 = *(_OWORD *)(v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16);
    v16 = *(_OWORD *)(v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect);
    v17 = v13;
    v18 = 2;
    type metadata accessor for CGRect(0);
    sub_22FB89374(&qword_255E3ED70, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD828]);
    sub_22FB8D3DC();
    LOBYTE(v16) = 3;
    swift_bridgeObjectRetain();
    sub_22FB8D3B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_bridgeObjectRelease();
  }
}

void (**sub_22FB88EA4(_QWORD *a1))(_QWORD, uint64_t)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void (**v19)(_QWORD, uint64_t);
  char *v20;
  char *v22;
  char *v23;
  int v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  void (**v36)(_QWORD, uint64_t);
  char *v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  char v41;

  v4 = sub_22FB8D0B8();
  v36 = *(void (***)(_QWORD, uint64_t))(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F078);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v1[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
  v10 = v1;
  v37 = v9;
  sub_22FB8D0AC();
  v11 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
  v34 = a1;
  v35 = v10;
  *(_DWORD *)&v10[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22FB89330();
  v12 = v8;
  sub_22FB8D448();
  if (v2)
  {
    v13 = v4;
    v18 = v35;
    v19 = v36;
    v20 = v37;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    ((void (**)(char *, uint64_t))v19)[1](v20, v13);

    type metadata accessor for MindNetModelBoundingBox();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v31 = v11;
    v14 = v6;
    LOBYTE(v39) = 0;
    sub_22FB89374(&qword_255E3F088, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v15 = v32;
    v16 = v33;
    v17 = v12;
    sub_22FB8D3AC();
    v22 = v37;
    swift_beginAccess();
    ((void (*)(char *, char *, uint64_t))v36[5])(v22, v15, v4);
    swift_endAccess();
    LOBYTE(v39) = 1;
    sub_22FB8D3A0();
    v23 = v35;
    *(_DWORD *)&v35[v31] = v24;
    type metadata accessor for CGRect(0);
    v41 = 2;
    sub_22FB89374(&qword_255E3ED80, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD838]);
    sub_22FB8D3AC();
    v25 = &v23[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
    *(_OWORD *)v25 = v39;
    *((_OWORD *)v25 + 1) = v40;
    LOBYTE(v39) = 3;
    v26 = sub_22FB8D388();
    v27 = (uint64_t *)&v23[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
    *v27 = v26;
    v27[1] = v28;

    v29 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
    v38.receiver = v23;
    v38.super_class = v29;
    v19 = (void (**)(_QWORD, uint64_t))objc_msgSendSuper2(&v38, sel_init);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  }
  return v19;
}

uint64_t sub_22FB89228@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id;
  swift_beginAccess();
  v4 = sub_22FB8D0B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void (**sub_22FB89290@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>))(_QWORD, uint64_t)
{
  uint64_t v2;
  id v5;
  void (**result)(_QWORD, uint64_t);

  v5 = objc_allocWithZone((Class)type metadata accessor for MindNetModelBoundingBox());
  result = sub_22FB88EA4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_22FB892E4(_QWORD *a1)
{
  return sub_22FB88C00(a1);
}

uint64_t sub_22FB89304()
{
  return sub_22FB89374(&qword_255E3F070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

unint64_t sub_22FB89330()
{
  unint64_t result;

  result = qword_255E3F080;
  if (!qword_255E3F080)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB90D94, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3F080);
  }
  return result;
}

uint64_t sub_22FB89374(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348AADFC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22FB893B4()
{
  unint64_t result;

  result = qword_255E3F0A0;
  if (!qword_255E3F0A0)
  {
    result = MEMORY[0x2348AADFC](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255E3F0A0);
  }
  return result;
}

_QWORD *sub_22FB893F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22FB89788(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_22FB89504(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_22FB899A4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22FB89610(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22FB8962C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22FB8962C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22FB8D37C();
  __break(1u);
  return result;
}

char *sub_22FB89788(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_22FB8D37C();
  __break(1u);
  return result;
}

_QWORD *sub_22FB89870(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = 0;
  v5 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = a2(v4, v7, v8);
    v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_22FB893F8(0, v6[2] + 1, 1, v6);
      v13 = v6[2];
      v12 = v6[3];
      if (v13 >= v12 >> 1)
        v6 = sub_22FB893F8((_QWORD *)(v12 > 1), v13 + 1, 1, v6);
      v6[2] = v13 + 1;
      v6[v13 + 4] = v9;
    }
    ++v4;
    v5 += 2;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
  return v6;
}

char *sub_22FB899A4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_22FB8D37C();
  __break(1u);
  return result;
}

void sub_22FB89A8C(void *a1, uint64_t a2, char **a3, unint64_t a4)
{
  char **v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t i;
  BOOL v21;
  void *v22;
  id v23;
  int v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t inited;
  id v29;
  char **v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;

  v6 = &selRef_writeToURL_atomically_;
  v7 = (uint64_t)objc_msgSend(a1, sel_shape);
  sub_22FB884A4(0, (unint64_t *)&qword_255E3EB70);
  v8 = sub_22FB8D1D8();

  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_34:
    v9 = (id)MEMORY[0x2348AA484](1, v8);
  }
  else
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
      goto LABEL_36;
    }
    v9 = *(id *)(v8 + 40);
  }
  v10 = v9;
  swift_bridgeObjectRelease();
  v8 = sub_22FB8D22C();

  v11 = objc_msgSend(a1, v6[105]);
  v7 = sub_22FB8D1D8();

  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_36:
    v12 = (id)MEMORY[0x2348AA484](2, v7);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) < 3uLL)
  {
    __break(1u);
    goto LABEL_38;
  }
  v12 = *(id *)(v7 + 48);
LABEL_7:
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = sub_22FB8D22C();

  if (__OFSUB__(a3, 1))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v15 = (char *)(v8 - 1);
  if (__OFSUB__(v8, 1))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (__OFADD__(a3, 1))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((uint64_t)((char *)a3 + 1) < (uint64_t)v15)
    v15 = (char *)a3 + 1;
  v33 = v15;
  if (__OFSUB__(a4, 1))
    goto LABEL_41;
  v16 = v14 - 1;
  if (__OFSUB__(v14, 1))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (__OFADD__(a4, 1))
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  v17 = ((unint64_t)a3 - 1) & ~(((uint64_t)a3 - 1) >> 63);
  if ((uint64_t)(a4 + 1) >= v16)
    v18 = v16;
  else
    v18 = a4 + 1;
  if ((uint64_t)v15 < v17)
    goto LABEL_44;
  v32 = (a4 - 1) & ~((uint64_t)(a4 - 1) >> 63);
  if (v18 < v32)
    goto LABEL_44;
  v30 = a3;
  v31 = a4;
  v19 = (char *)MEMORY[0x24BEE4AF8];
  v6 = (char **)0x24BDD1000;
  a3 = &selRef_writeToURL_atomically_;
  for (i = (a4 - 1) & ~((uint64_t)(a4 - 1) >> 63); ; i = v32)
  {
    while (1)
    {
      sub_22FB8D31C();
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a2);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v17);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, i);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      v22 = (void *)sub_22FB8D1C0();
      swift_release();
      v23 = objc_msgSend(a1, sel_objectForKeyedSubscript_, v22);

      objc_msgSend(v23, sel_floatValue);
      v25 = v24;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v19 = sub_22FB89504(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
      a4 = *((_QWORD *)v19 + 2);
      v26 = *((_QWORD *)v19 + 3);
      v8 = a4 + 1;
      if (a4 >= v26 >> 1)
        v19 = sub_22FB89504((char *)(v26 > 1), a4 + 1, 1, v19);
      *((_QWORD *)v19 + 2) = v8;
      *(_DWORD *)&v19[4 * a4 + 32] = v25;
      if (v18 == i)
        break;
      v21 = __OFADD__(i++, 1);
      if (v21)
      {
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
    }
    if ((char *)v17 == v33)
      break;
    v21 = __OFADD__(v17++, 1);
    if (v21)
      goto LABEL_33;
  }
  v27 = sub_22FB88530((uint64_t)v19);
  swift_bridgeObjectRelease();
  if ((v27 & 0x100000000) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22FB90BB0;
    *(_QWORD *)(inited + 32) = a2;
    *(_QWORD *)(inited + 40) = v30;
    *(_QWORD *)(inited + 48) = v31;
    v29 = sub_22FB7DE50(inited);
    objc_msgSend(v29, sel_floatValue);

    swift_setDeallocating();
  }
}

void sub_22FB89F00(float a1, uint64_t a2, char **a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  id *v18;
  char *v19;
  id v20;
  id v21;
  unint64_t v22;
  char **v23;
  id v24;
  unint64_t v25;
  id i;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  char **v37;
  char **v38;
  double v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  id v47;
  float v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  float v53;
  float v54;
  float v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  char **v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  float v67;
  float v68;
  float v69;
  float v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  float v77;
  uint64_t inited;
  char **v79;
  id v80;
  void *v81;
  float v82;
  float v83;
  uint64_t v84;
  id v85;
  float v86;
  float v87;
  double v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  float v93;
  float v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  objc_class *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  double *v112;
  uint64_t *v113;
  unint64_t v114;
  id v115;
  id v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t *v119;
  unint64_t v120;
  uint64_t v121;
  id *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  float v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  id v130;
  void *v131;
  id v132;
  id v133;
  float v134;
  float v135;
  unint64_t v136;
  unint64_t v137;
  float v138;
  id v139;
  float v140;
  float v141;
  uint64_t v142;
  float v143;
  float v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  id v148;
  float v149;
  float v150;
  double v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  objc_class *v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  double *v168;
  uint64_t *v169;
  uint64_t v170;
  id v171;
  id v172;
  _QWORD v173[2];
  uint64_t v174;
  uint64_t v175;
  char *v176;
  _BOOL4 v177;
  char *v178;
  _BOOL4 v179;
  char *v180;
  _BOOL4 v181;
  char *v182;
  char *v183;
  uint64_t v184;
  char *v185;
  char *v186;
  char *v187;
  double v188;
  char **v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  char **v194;
  int v195;
  __int128 v196;
  id v197;
  id *v198;
  char *v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  char **v203;
  objc_super v204;
  objc_super v205;
  uint64_t v206;
  uint64_t v207;
  int64_t v208;

  v7 = sub_22FB8D0B8();
  v191 = *(_QWORD *)(v7 - 8);
  v192 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v190 = (char *)v173 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0C0);
  v184 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v173 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v183 = (char *)v173 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0A8);
  sub_22FB8B914(&qword_255E3F0C8, &qword_255E3F0A8, MEMORY[0x24BDBFCF0]);
  sub_22FB8D238();
  sub_22FB8D244();
  if (v206 == v208)
    return;
  v14 = *(_QWORD *)(sub_22FB8D118() + 16);
  v15 = swift_bridgeObjectRelease();
  v16 = MEMORY[0x24BEE4AF8];
  if (v14 != 4)
    return;
  v199 = a3[2];
  MEMORY[0x24BDAC7A8](v15);
  v173[-2] = a4;
  v17 = swift_bridgeObjectRetain();
  v18 = (id *)sub_22FB89870(v17, sub_22FB8B90C);
  v173[1] = 0;
  swift_bridgeObjectRelease();
  v19 = v183;
  sub_22FB8D124();
  sub_22FB884A4(0, &qword_255E3F0D0);
  (*(void (**)(char *, char *, uint64_t))(v184 + 16))(v12, v19, v9);
  sub_22FB8B914(&qword_255E3F0D8, &qword_255E3F0C0, MEMORY[0x24BDBFD50]);
  v174 = v9;
  v20 = (id)sub_22FB8D25C();
  v21 = v18[2];
  v22 = (unint64_t)&selRef_writeToURL_atomically_;
  v23 = &selRef_headerView;
  v202 = v20;
  v197 = v21;
  v198 = v18;
  if (!v21)
    goto LABEL_10;
  v24 = objc_msgSend(v20, sel_shape);
  v201 = sub_22FB884A4(0, (unint64_t *)&qword_255E3EB70);
  v25 = sub_22FB8D1D8();

  if ((v25 & 0xC000000000000001) != 0)
    goto LABEL_147;
  if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_149;
  }
  for (i = *(id *)(v25 + 32); ; i = (id)MEMORY[0x2348AA484](0, v25))
  {
    v27 = i;
    swift_bridgeObjectRelease();
    v25 = (unint64_t)objc_msgSend(v27, v23[73]);

    if (__OFADD__(v199, 8))
    {
LABEL_149:
      __break(1u);
      goto LABEL_150;
    }
    v20 = v202;
    if ((char *)v25 == v199 + 8)
    {
      v195 = 1;
      goto LABEL_16;
    }
LABEL_10:
    v28 = objc_msgSend(v20, *(SEL *)(v22 + 840), v173[0]);
    v201 = sub_22FB884A4(0, (unint64_t *)&qword_255E3EB70);
    v25 = sub_22FB8D1D8();

    if ((v25 & 0xC000000000000001) != 0)
      break;
    if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v29 = *(id *)(v25 + 32);
      goto LABEL_13;
    }
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    ;
  }
  while (2)
  {
    v29 = (id)MEMORY[0x2348AA484](0, v25);
LABEL_13:
    v30 = v29;
    swift_bridgeObjectRelease();
    v25 = (unint64_t)objc_msgSend(v30, v23[73]);

    if (__OFADD__(v199, 4))
      goto LABEL_146;
    if ((char *)v25 != v199 + 4)
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v184 + 8))(v183, v174);
      return;
    }
    v195 = 0;
LABEL_16:
    v31 = objc_msgSend(v202, *(SEL *)(v22 + 840), v173[0]);
    sub_22FB884A4(0, (unint64_t *)&qword_255E3EB70);
    v25 = sub_22FB8D1D8();

    if ((v25 & 0xC000000000000001) == 0)
    {
      if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v32 = *(id *)(v25 + 40);
        goto LABEL_19;
      }
      __break(1u);
LABEL_152:
      v35 = (id)MEMORY[0x2348AA484](2, v25);
      goto LABEL_22;
    }
LABEL_150:
    v32 = (id)MEMORY[0x2348AA484](1, v25);
LABEL_19:
    v33 = v32;
    swift_bridgeObjectRelease();
    v175 = sub_22FB8D22C();

    v34 = objc_msgSend(v202, *(SEL *)(v22 + 840));
    v25 = sub_22FB8D1D8();

    if ((v25 & 0xC000000000000001) != 0)
      goto LABEL_152;
    if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10) < 3uLL)
    {
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
      return;
    }
    v35 = *(id *)(v25 + 48);
LABEL_22:
    v36 = v35;
    swift_bridgeObjectRelease();
    v22 = sub_22FB8D22C();

    v208 = v16;
    if (v175 < 0)
      goto LABEL_154;
    v173[0] = MEMORY[0x24BEE4AF8];
    v25 = (unint64_t)v198;
    v16 = (int64_t)v199;
    if (!v175)
      goto LABEL_133;
    if ((v22 & 0x8000000000000000) != 0)
      goto LABEL_155;
    v37 = 0;
    v189 = a3 + 4;
    v188 = (double)(uint64_t)v22;
    v186 = v199 + 2;
    v187 = v199 + 1;
    v38 = (char **)v175;
    v39 = (double)v175;
    v185 = v199 + 3;
    v182 = v199 + 4;
    v180 = v199 + 5;
    v40 = __OFADD__(v199, 5);
    v181 = v40;
    v178 = v199 + 6;
    v41 = __OFADD__(v199, 6);
    v179 = v41;
    v176 = v199 + 7;
    v42 = __OFADD__(v199, 7);
    v177 = v42;
    a3 = &off_24FD75000;
    v194 = (char **)v22;
    v196 = xmmword_22FB90BB0;
    while (1)
    {
      v203 = v37;
      if (v37 == v38)
        goto LABEL_143;
      if (v22)
        break;
LABEL_35:
      v37 = (char **)((char *)v203 + 1);
      v38 = (char **)v175;
      if ((char **)((char *)v203 + 1) == (char **)v175)
        goto LABEL_132;
    }
    v23 = 0;
    v43 = (double)(uint64_t)v203;
LABEL_41:
    if (v23 == (char **)v22)
    {
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
      continue;
    }
    break;
  }
  v200 = (uint64_t)v23;
  if ((v195 & 1) == 0)
  {
    if (v16)
    {
      v206 = MEMORY[0x24BEE4AF8];
      sub_22FB89610(0, v16, 0);
      v60 = 0;
      v45 = v206;
      do
      {
        v207 = MEMORY[0x24BEE4AF8];
        sub_22FB8D31C();
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v60);
        sub_22FB8D304();
        sub_22FB8D328();
        sub_22FB8D334();
        sub_22FB8D310();
        v61 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        v62 = v203;
        objc_msgSend(v61, sel_initWithInteger_, v203);
        sub_22FB8D304();
        sub_22FB8D328();
        sub_22FB8D334();
        sub_22FB8D310();
        v63 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        v23 = (char **)v200;
        objc_msgSend(v63, sel_initWithInteger_, v200);
        sub_22FB8D304();
        sub_22FB8D328();
        sub_22FB8D334();
        sub_22FB8D310();
        v64 = (void *)sub_22FB8D1C0();
        swift_release();
        v65 = v202;
        v66 = objc_msgSend(v202, sel_objectForKeyedSubscript_, v64);

        objc_msgSend(v66, sel_floatValue);
        v68 = v67;

        v69 = 0.0;
        if (v68 >= a1)
        {
          sub_22FB89A8C(v65, v60, v62, (unint64_t)v23);
          if (v68 == v70)
            v69 = v68;
        }
        v206 = v45;
        v72 = *(_QWORD *)(v45 + 16);
        v71 = *(_QWORD *)(v45 + 24);
        if (v72 >= v71 >> 1)
        {
          sub_22FB89610(v71 > 1, v72 + 1, 1);
          v45 = v206;
        }
        ++v60;
        *(_QWORD *)(v45 + 16) = v72 + 1;
        *(float *)(v45 + 4 * v72 + 32) = v69;
      }
      while (v16 != v60);
      v125 = MEMORY[0x24BEE4AF8];
      a3 = &off_24FD75000;
LABEL_73:
      v25 = *(_QWORD *)(v45 + 16);
      if (v25)
      {
        v73 = 0;
        v22 = 0;
        do
        {
          if (v22 >= v25)
          {
            __break(1u);
            goto LABEL_129;
          }
          if (*(float *)(v45 + 32 + 4 * v22) < *(float *)(v45 + 32 + 4 * v73))
            v22 = v73;
          ++v73;
        }
        while (v25 != v73);
        if ((uint64_t)v22 < v16)
          goto LABEL_82;
      }
      else
      {
        v22 = 0;
        if (v16)
        {
LABEL_82:
          if (v22 >= v16)
            goto LABEL_137;
          v76 = (uint64_t *)&v189[2 * v22];
          v75 = *v76;
          v74 = v76[1];
          swift_bridgeObjectRetain();
          goto LABEL_84;
        }
      }
      v74 = 0xE700000000000000;
      v75 = 0x6E776F6E6B6E75;
LABEL_84:
      if (v22 >= v25)
        goto LABEL_136;
      v77 = *(float *)(v45 + 4 * v22 + 32);
      swift_bridgeObjectRelease();
      if (v77 >= a1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E0);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v196;
        v79 = v203;
        *(_QWORD *)(inited + 32) = v16;
        *(_QWORD *)(inited + 40) = v79;
        *(_QWORD *)(inited + 48) = v200;
        v80 = sub_22FB7DE50(inited);
        v193 = v74;
        v81 = v80;
        objc_msgSend(v80, a3[489]);
        v83 = v82;

        swift_setDeallocating();
        v84 = swift_initStackObject();
        *(_OWORD *)(v84 + 16) = v196;
        *(_QWORD *)(v84 + 32) = v187;
        *(_QWORD *)(v84 + 40) = v79;
        *(_QWORD *)(v84 + 48) = v200;
        v85 = sub_22FB7DE50(v84);
        objc_msgSend(v85, a3[489]);
        v87 = v86;

        swift_setDeallocating();
        v88 = ((double)v200 + v87) / v188;
        v89 = swift_initStackObject();
        *(_OWORD *)(v89 + 16) = v196;
        *(_QWORD *)(v89 + 32) = v186;
        *(_QWORD *)(v89 + 40) = v79;
        *(_QWORD *)(v89 + 48) = v200;
        v90 = sub_22FB7DE50(v89);
        objc_msgSend(v90, a3[489]);

        swift_setDeallocating();
        v91 = swift_initStackObject();
        *(_OWORD *)(v91 + 16) = v196;
        *(_QWORD *)(v91 + 32) = v185;
        *(_QWORD *)(v91 + 40) = v79;
        v23 = (char **)v200;
        *(_QWORD *)(v91 + 48) = v200;
        v92 = sub_22FB7DE50(v91);
        objc_msgSend(v92, a3[489]);
        v94 = v93;

        swift_setDeallocating();
        v95 = sub_22FB7E398(v88, (v43 + v83) / v39, v94);
        v97 = v96;
        v99 = v98;
        v101 = v100;
        v102 = v75;
        v103 = v190;
        sub_22FB8D0AC();
        v104 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
        v105 = (char *)objc_allocWithZone(v104);
        v106 = &v105[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
        v107 = v105;
        sub_22FB8D0AC();
        v108 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
        *(_DWORD *)&v107[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
        swift_beginAccess();
        v109 = v191;
        v110 = v106;
        v111 = v192;
        (*(void (**)(char *, char *, uint64_t))(v191 + 24))(v110, v103, v192);
        swift_endAccess();
        *(float *)&v107[v108] = v77;
        v112 = (double *)&v107[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
        *v112 = v95;
        *((_QWORD *)v112 + 1) = v97;
        *((_QWORD *)v112 + 2) = v99;
        *((_QWORD *)v112 + 3) = v101;
        v113 = (uint64_t *)&v107[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
        v114 = v193;
        *v113 = v102;
        v113[1] = v114;

        v204.receiver = v107;
        v204.super_class = v104;
        v115 = objc_msgSendSuper2(&v204, sel_init);
        (*(void (**)(char *, uint64_t))(v109 + 8))(v103, v111);
        v116 = v115;
        MEMORY[0x2348AA358]();
        if (*(_QWORD *)((v208 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v208 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22FB8D1F0();
        sub_22FB8D208();
        sub_22FB8D1E4();

        v16 = (int64_t)v199;
        a3 = &off_24FD75000;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v25 = (unint64_t)v198;
      if (v195)
      {
        v117 = *(_QWORD *)(v125 + 16);
        if (v117)
        {
          v118 = 0;
          v25 = 0;
          v22 = v125 + 32;
          while (v25 < v117)
          {
            if (*(float *)(v22 + 4 * v25) < *(float *)(v125 + 4 * v118 + 32))
              v25 = v118;
            if (v117 == ++v118)
            {
              if ((uint64_t)v25 >= v16)
              {
                v120 = 0xE700000000000000;
                v121 = 0x6E776F6E6B6E75;
              }
              else
              {
                if ((v25 & 0x8000000000000000) != 0)
                  goto LABEL_139;
                v119 = (uint64_t *)&v189[2 * v25];
                v121 = *v119;
                v120 = v119[1];
                swift_bridgeObjectRetain();
              }
              if (v25 >= v117)
                goto LABEL_138;
              v138 = *(float *)(v22 + 4 * v25);
              swift_bridgeObjectRelease();
              if (v138 < a1)
              {
                swift_bridgeObjectRelease();
                v25 = (unint64_t)v198;
                goto LABEL_40;
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0E0);
              v22 = swift_initStackObject();
              *(_OWORD *)(v22 + 16) = v196;
              v16 = (int64_t)v23;
              v25 = (unint64_t)v202;
              v23 = v203;
              *(_QWORD *)(v22 + 32) = v182;
              *(_QWORD *)(v22 + 40) = v23;
              *(_QWORD *)(v22 + 48) = v16;
              v139 = sub_22FB7DE50(v22);
              objc_msgSend(v139, a3[489]);
              v141 = v140;

              swift_setDeallocating();
              v142 = swift_initStackObject();
              *(_OWORD *)(v142 + 16) = v196;
              if (!v181)
              {
                *(_QWORD *)(v142 + 32) = v180;
                *(_QWORD *)(v142 + 40) = v23;
                *(_QWORD *)(v142 + 48) = v16;
                v22 = (unint64_t)sub_22FB7DE50(v142);
                objc_msgSend((id)v22, a3[489]);
                v144 = v143;

                swift_setDeallocating();
                v145 = swift_initStackObject();
                *(_OWORD *)(v145 + 16) = v196;
                if (v179)
                  goto LABEL_141;
                *(_QWORD *)(v145 + 32) = v178;
                *(_QWORD *)(v145 + 40) = v23;
                *(_QWORD *)(v145 + 48) = v16;
                v22 = (unint64_t)sub_22FB7DE50(v145);
                objc_msgSend((id)v22, a3[489]);

                swift_setDeallocating();
                v146 = swift_initStackObject();
                *(_OWORD *)(v146 + 16) = v196;
                if (!v177)
                {
                  v147 = ((double)v16 + v144) / v188;
                  *(_QWORD *)(v146 + 32) = v176;
                  *(_QWORD *)(v146 + 40) = v23;
                  *(_QWORD *)(v146 + 48) = v16;
                  v148 = sub_22FB7DE50(v146);
                  objc_msgSend(v148, a3[489]);
                  v150 = v149;

                  swift_setDeallocating();
                  v151 = sub_22FB7E398(v147, (v43 + v141) / v39, v150);
                  v153 = v152;
                  v155 = v154;
                  v157 = v156;
                  v200 = v120;
                  v158 = v121;
                  v159 = v190;
                  sub_22FB8D0AC();
                  v160 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
                  v161 = (char *)objc_allocWithZone(v160);
                  v162 = &v161[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
                  v163 = v161;
                  sub_22FB8D0AC();
                  v164 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
                  *(_DWORD *)&v163[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
                  swift_beginAccess();
                  v23 = (char **)v16;
                  v165 = v191;
                  v166 = v162;
                  v167 = v192;
                  (*(void (**)(char *, char *, uint64_t))(v191 + 24))(v166, v159, v192);
                  swift_endAccess();
                  *(float *)&v163[v164] = v138;
                  v168 = (double *)&v163[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
                  *v168 = v151;
                  *((_QWORD *)v168 + 1) = v153;
                  *((_QWORD *)v168 + 2) = v155;
                  *((_QWORD *)v168 + 3) = v157;
                  v169 = (uint64_t *)&v163[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
                  v170 = v200;
                  *v169 = v158;
                  v169[1] = v170;

                  v205.receiver = v163;
                  v205.super_class = v160;
                  v171 = objc_msgSendSuper2(&v205, sel_init);
                  (*(void (**)(char *, uint64_t))(v165 + 8))(v159, v167);
                  v172 = v171;
                  MEMORY[0x2348AA358]();
                  if (*(_QWORD *)((v208 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v208 & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
                    sub_22FB8D1F0();
                  sub_22FB8D208();
                  sub_22FB8D1E4();

                  v25 = (unint64_t)v198;
                  v16 = (int64_t)v199;
                  goto LABEL_40;
                }
                goto LABEL_142;
              }
              goto LABEL_140;
            }
          }
LABEL_129:
          __break(1u);
          goto LABEL_130;
        }
      }
      swift_bridgeObjectRelease();
LABEL_40:
      v22 = (unint64_t)v194;
      v23 = (char **)((char *)v23 + 1);
      if (v23 == v194)
        goto LABEL_35;
      goto LABEL_41;
    }
LABEL_72:
    v45 = MEMORY[0x24BEE4AF8];
    v125 = MEMORY[0x24BEE4AF8];
    goto LABEL_73;
  }
  if (!v16)
    goto LABEL_72;
  v206 = MEMORY[0x24BEE4AF8];
  sub_22FB89610(0, v16, 0);
  v44 = 0;
  v45 = v206;
  v47 = v197;
  v46 = v198;
  do
  {
    v48 = 0.0;
    if (!v47)
      goto LABEL_52;
    if (v46[4] == (id)v44)
      goto LABEL_47;
    if (v47 == (id)1)
      goto LABEL_52;
    if (v46[5] == (id)v44)
    {
LABEL_47:
      v207 = MEMORY[0x24BEE4AF8];
      sub_22FB8D31C();
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v44);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      v49 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      objc_msgSend(v49, sel_initWithInteger_, v203);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v23);
      sub_22FB8D304();
      sub_22FB8D328();
      sub_22FB8D334();
      sub_22FB8D310();
      v50 = (void *)sub_22FB8D1C0();
      swift_release();
      v51 = v202;
      v52 = objc_msgSend(v202, sel_objectForKeyedSubscript_, v50);

      objc_msgSend(v52, a3[489]);
      v54 = v53;

      if (v54 >= a1)
      {
        sub_22FB89A8C(v51, v44, v203, (unint64_t)v23);
        if (v54 == v55)
          v48 = v54;
      }
      v46 = v198;
      v16 = (int64_t)v199;
      v47 = v197;
    }
    else if (v47 != (id)2)
    {
      v58 = 6;
      while (1)
      {
        v59 = v58 - 3;
        if (__OFADD__(v58 - 4, 1))
          break;
        if (v46[v58] == (id)v44)
          goto LABEL_47;
        ++v58;
        if ((id)v59 == v47)
          goto LABEL_52;
      }
LABEL_130:
      __break(1u);
      goto LABEL_131;
    }
LABEL_52:
    v206 = v45;
    v57 = *(_QWORD *)(v45 + 16);
    v56 = *(_QWORD *)(v45 + 24);
    if (v57 >= v56 >> 1)
    {
      sub_22FB89610(v56 > 1, v57 + 1, 1);
      v47 = v197;
      v46 = v198;
      v45 = v206;
    }
    ++v44;
    *(_QWORD *)(v45 + 16) = v57 + 1;
    *(float *)(v45 + 4 * v57 + 32) = v48;
  }
  while (v44 != v16);
  v206 = MEMORY[0x24BEE4AF8];
  sub_22FB89610(0, v16, 0);
  v123 = v197;
  v122 = v198;
  v124 = 0;
  v125 = v206;
  while (1)
  {
    if (!v123)
      goto LABEL_109;
    v126 = 0.0;
    if (v122[4] != (id)v124)
    {
      if (v123 == (id)1)
        goto LABEL_109;
      if (v122[5] != (id)v124)
        break;
    }
LABEL_113:
    v206 = v125;
    v137 = *(_QWORD *)(v125 + 16);
    v136 = *(_QWORD *)(v125 + 24);
    if (v137 >= v136 >> 1)
    {
      sub_22FB89610(v136 > 1, v137 + 1, 1);
      v123 = v197;
      v122 = v198;
      v125 = v206;
    }
    ++v124;
    *(_QWORD *)(v125 + 16) = v137 + 1;
    *(float *)(v125 + 4 * v137 + 32) = v126;
    v16 = (int64_t)v199;
    if ((char *)v124 == v199)
      goto LABEL_73;
  }
  if (v123 == (id)2)
  {
LABEL_109:
    v207 = MEMORY[0x24BEE4AF8];
    sub_22FB8D31C();
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v124);
    sub_22FB8D304();
    sub_22FB8D328();
    sub_22FB8D334();
    sub_22FB8D310();
    v129 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    objc_msgSend(v129, sel_initWithInteger_, v203);
    sub_22FB8D304();
    sub_22FB8D328();
    sub_22FB8D334();
    sub_22FB8D310();
    v130 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    v23 = (char **)v200;
    objc_msgSend(v130, sel_initWithInteger_, v200);
    sub_22FB8D304();
    sub_22FB8D328();
    sub_22FB8D334();
    sub_22FB8D310();
    v131 = (void *)sub_22FB8D1C0();
    swift_release();
    v132 = v202;
    v133 = objc_msgSend(v202, sel_objectForKeyedSubscript_, v131);

    objc_msgSend(v133, a3[489]);
    v126 = v134;

    if (v126 < a1 || (sub_22FB89A8C(v132, v124, v203, (unint64_t)v23), v126 != v135))
      v126 = 0.0;
    v123 = v197;
    v122 = v198;
    goto LABEL_113;
  }
  v127 = 6;
  while (1)
  {
    v128 = v127 - 3;
    if (__OFADD__(v127 - 4, 1))
      break;
    if (v122[v127] == (id)v124)
      goto LABEL_113;
    ++v127;
    if ((id)v128 == v123)
      goto LABEL_109;
  }
LABEL_131:
  __break(1u);
LABEL_132:
  v173[0] = v208;
LABEL_133:
  (*(void (**)(char *, uint64_t))(v184 + 8))(v183, v174);
  swift_bridgeObjectRelease();

}

void sub_22FB8B2C4(void *a1, char **a2, uint64_t a3, float a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  objc_class *v19;
  id v20;
  CGRect *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  char *v26;
  char *v27;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  CGFloat Height;
  CGFloat *v32;
  uint64_t v33;
  char *v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  uint64_t v41;
  CGRect v42;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0A8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8B914(&qword_255E3F0B0, &qword_255E3F0A8, MEMORY[0x24BDBFCD0]);
  v12 = a1;
  sub_22FB8D130();
  sub_22FB89F00(a4, (uint64_t)v11, a2, a3);
  v14 = v13;
  v41 = MEMORY[0x24BEE4AF8];
  if (!(v13 >> 62))
  {
    v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v15)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  v15 = sub_22FB8D364();
  if (!v15)
    goto LABEL_13;
LABEL_3:
  if (v15 >= 1)
  {
    v37 = v11;
    v38 = v9;
    v39 = v8;
    v16 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v17 = (char *)MEMORY[0x2348AA484](v16, v14);
      else
        v17 = (char *)*(id *)(v14 + 8 * v16 + 32);
      v18 = v17;
      v19 = (objc_class *)type metadata accessor for AudiogramSymbolDetectorResult();
      v20 = objc_allocWithZone(v19);
      v21 = (CGRect *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      v22 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      v23 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
      v24 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
      v25 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
      v26 = v18;
      v27 = (char *)v20;
      v42.origin.x = v22;
      v42.origin.y = v23;
      v42.size.width = v24;
      v42.size.height = v25;
      MinX = CGRectGetMinX(v42);
      MinY = CGRectGetMinY(*v21);
      Width = CGRectGetWidth(*v21);
      Height = CGRectGetHeight(*v21);
      v32 = (CGFloat *)&v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
      *v32 = MinX;
      v32[1] = MinY;
      v32[2] = Width;
      v32[3] = Height;
      *(double *)&v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence] = *(float *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];
      v33 = *(_QWORD *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className + 8];
      v34 = &v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName];
      *(_QWORD *)v34 = *(_QWORD *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
      *((_QWORD *)v34 + 1) = v33;
      swift_bridgeObjectRetain();

      v40.receiver = v27;
      v40.super_class = v19;
      v35 = objc_msgSendSuper2(&v40, sel_init);

      v36 = v35;
      MEMORY[0x2348AA358]();
      if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22FB8D1F0();
      ++v16;
      sub_22FB8D208();
      sub_22FB8D1E4();

    }
    while (v15 != v16);
    swift_bridgeObjectRelease();
    v9 = v38;
    v8 = v39;
    v11 = v37;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_22FB8B5C4(void *a1, float a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t inited;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  objc_class *v18;
  id v19;
  CGRect *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  char *v25;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  CGFloat Height;
  CGFloat *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;
  unint64_t v38;
  CGRect v39;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8B914(&qword_255E3F0B0, &qword_255E3F0A8, MEMORY[0x24BDBFCD0]);
  v8 = a1;
  sub_22FB8D130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3F0B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22FB90520;
  *(_QWORD *)(inited + 32) = 0x6870617267;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v10 = MEMORY[0x24BEE4AF8];
  sub_22FB89F00(a2, (uint64_t)v7, (char **)inited, MEMORY[0x24BEE4AF8]);
  v12 = v11;
  swift_setDeallocating();
  result = swift_arrayDestroy();
  v38 = v10;
  if (!(v12 >> 62))
  {
    v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_14:
    v33 = sub_22FB84A40(v32, 0.5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v33;
  }
  swift_bridgeObjectRetain();
  v14 = sub_22FB8D364();
  result = swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_13;
LABEL_3:
  if (v14 >= 1)
  {
    v34 = v7;
    v35 = v5;
    v36 = v4;
    v15 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
        v16 = (char *)MEMORY[0x2348AA484](v15, v12);
      else
        v16 = (char *)*(id *)(v12 + 8 * v15 + 32);
      v17 = v16;
      v18 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
      v19 = objc_allocWithZone(v18);
      v20 = (CGRect *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      v21 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      v22 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
      v23 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
      v24 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
      v25 = (char *)v19;
      v39.origin.x = v21;
      v39.origin.y = v22;
      v39.size.width = v23;
      v39.size.height = v24;
      MinX = CGRectGetMinX(v39);
      MinY = CGRectGetMinY(*v20);
      Width = CGRectGetWidth(*v20);
      Height = CGRectGetHeight(*v20);
      v30 = (CGFloat *)&v25[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
      *v30 = MinX;
      v30[1] = MinY;
      v30[2] = Width;
      v30[3] = Height;
      *(double *)&v25[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = *(float *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];

      v37.receiver = v25;
      v37.super_class = v18;
      v31 = objc_msgSendSuper2(&v37, sel_init);
      MEMORY[0x2348AA358]();
      if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22FB8D1F0();
      ++v15;
      sub_22FB8D208();
      sub_22FB8D1E4();

    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    v32 = v38;
    v5 = v35;
    v4 = v36;
    v7 = v34;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_22FB8B90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_22FB88588(a1, a2, a3, *(_QWORD **)(v3 + 16));
}

uint64_t sub_22FB8B914(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348AADFC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MindNetModelBoundingBox.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MindNetModelBoundingBox.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22FB8BA30 + 4 * byte_22FB90BC5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22FB8BA64 + 4 * byte_22FB90BC0[v4]))();
}

uint64_t sub_22FB8BA64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB8BA6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22FB8BA74);
  return result;
}

uint64_t sub_22FB8BA80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22FB8BA88);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22FB8BA8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FB8BA94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MindNetModelBoundingBox.CodingKeys()
{
  return &type metadata for MindNetModelBoundingBox.CodingKeys;
}

unint64_t sub_22FB8BAB4()
{
  unint64_t result;

  result = qword_255E3F0F0;
  if (!qword_255E3F0F0)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB90D6C, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3F0F0);
  }
  return result;
}

unint64_t sub_22FB8BAFC()
{
  unint64_t result;

  result = qword_255E3F0F8;
  if (!qword_255E3F0F8)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB90CDC, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3F0F8);
  }
  return result;
}

unint64_t sub_22FB8BB44()
{
  unint64_t result;

  result = qword_255E3F100;
  if (!qword_255E3F100)
  {
    result = MEMORY[0x2348AADFC](&unk_22FB90D04, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E3F100);
  }
  return result;
}

uint64_t sub_22FB8BB88(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1952671090 && a2 == 0xE400000000000000 || (sub_22FB8D40C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D614E7373616C63 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_22FB8D40C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t metadataForHKAudiogramSample_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[AIAudiogramIndividualFrequencyInputViewController tableView:cellForRowAtIndexPath:].cold.1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKAudiogramChartViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramChartViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKUnitPreferenceControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitPreferenceControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKAudiogramSampleClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramSampleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKQuantityClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKAudiogramSensitivityPointClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramSensitivityPointClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1(v0);
}

uint64_t __getPHPickerConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHPickerFilterClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPickerFilterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(v0);
}

void __getAXSettingsClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_22FB8D07C();
}

uint64_t sub_22FB8D07C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22FB8D088()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22FB8D094()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22FB8D0A0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22FB8D0AC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22FB8D0B8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22FB8D0C4()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_22FB8D0D0()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_22FB8D0DC()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_22FB8D0E8()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_22FB8D0F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22FB8D100()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22FB8D10C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22FB8D118()
{
  return MEMORY[0x24BDBFC40]();
}

uint64_t sub_22FB8D124()
{
  return MEMORY[0x24BDBFCA8]();
}

uint64_t sub_22FB8D130()
{
  return MEMORY[0x24BDBFD80]();
}

uint64_t sub_22FB8D13C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22FB8D148()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22FB8D154()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22FB8D160()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22FB8D16C()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_22FB8D178()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22FB8D184()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22FB8D190()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22FB8D19C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_22FB8D1A8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22FB8D1B4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22FB8D1C0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22FB8D1CC()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_22FB8D1D8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22FB8D1E4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22FB8D1F0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22FB8D1FC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22FB8D208()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22FB8D214()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_22FB8D220()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_22FB8D22C()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_22FB8D238()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_22FB8D244()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_22FB8D250()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_22FB8D25C()
{
  return MEMORY[0x24BDBFE88]();
}

uint64_t sub_22FB8D268()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22FB8D274()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22FB8D280()
{
  return MEMORY[0x24BDBD820]();
}

uint64_t sub_22FB8D28C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22FB8D298()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22FB8D2A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22FB8D2B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22FB8D2BC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22FB8D2C8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22FB8D2D4()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_22FB8D2E0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22FB8D2EC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22FB8D2F8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22FB8D304()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22FB8D310()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_22FB8D31C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22FB8D328()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_22FB8D334()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_22FB8D340()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22FB8D34C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22FB8D358()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22FB8D364()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22FB8D370()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22FB8D37C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22FB8D388()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22FB8D394()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_22FB8D3A0()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_22FB8D3AC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22FB8D3B8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22FB8D3C4()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_22FB8D3D0()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_22FB8D3DC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22FB8D3E8()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_22FB8D3F4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22FB8D400()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22FB8D40C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22FB8D418()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_22FB8D424()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22FB8D430()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22FB8D43C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22FB8D448()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22FB8D454()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22FB8D460()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22FB8D46C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFDF80]();
}

uint64_t AXLogAggregate()
{
  return MEMORY[0x24BDFE0A8]();
}

uint64_t AXLogAudiogram()
{
  return MEMORY[0x24BDFE0C8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA08](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEA68](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC18](page);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

