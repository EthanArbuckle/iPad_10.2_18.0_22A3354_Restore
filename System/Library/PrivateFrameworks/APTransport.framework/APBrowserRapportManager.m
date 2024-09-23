@implementation APBrowserRapportManager

uint64_t __APBrowserRapportManager_runOnQueue_block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 40) + 51))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __APBrowserRapportManager_ensureScanningStarted_block_invoke_6(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    if (gLogCategory_APBrowserRapportManager <= 90)
    {
      if (gLogCategory_APBrowserRapportManager != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_6;
  v3[3] = &unk_1E8256CC8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

uint64_t ___APBrowserRapportManager_getActiveManagers_block_invoke()
{
  uint64_t result;

  result = FigCFWeakReferenceTableCreate();
  if ((_DWORD)result)
  {
    result = gLogCategory_APBrowserRapportManager;
    if (gLogCategory_APBrowserRapportManager <= 100)
      result = ___APBrowserRapportManager_getActiveManagers_block_invoke_cold_1(gLogCategory_APBrowserRapportManager);
    __break(1u);
  }
  return result;
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_2;
  v3[3] = &unk_1E8256CC8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  const void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  __CFDictionary *TypedValue;
  __CFDictionary *v12;
  int v13;
  __CFSet *v14;
  const void *v15;
  unsigned __int8 Int64;
  uint64_t v17;
  int v18;
  const void *v19;
  int v20;
  const __CFAllocator *v21;
  CFMutableSetRef Mutable;
  __CFSet *v23;
  __CFDictionary *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  int v28;
  const void *v29;
  _QWORD *v30;
  uint64_t v31;
  const void **v32;
  __CFDictionary *v33;
  const void *v34;
  __CFSet *v35;
  uint64_t v36;
  int v37;

  v2 = *(void **)(a1 + 32);
  if (!v2 || (v4 = objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier")) == 0)
  {
LABEL_77:
    APSLogErrorAt();
    return;
  }
  v5 = (const void *)v4;
  v6 = (const void *)objc_msgSend(v2, "effectiveIdentifier");
  v7 = (void *)objc_msgSend(v2, "model");
  v8 = objc_msgSend(v2, "mediaRouteIdentifier");
  if ((objc_msgSend(v7, "containsString:", CFSTR("Mac")) & 1) != 0
    || (objc_msgSend(v7, "hasPrefix:", CFSTR("RealityDevice")) & 1) != 0
    || APSCanSendToAltReceiver()
    && ((objc_msgSend(v7, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
     || objc_msgSend(v7, "hasPrefix:", CFSTR("iPad"))))
  {
    v9 = objc_msgSend(v2, "statusFlags");
    v10 = objc_msgSend(v2, "serviceTypes");
    if (v10)
      v37 = objc_msgSend((id)objc_msgSend(v2, "serviceTypes"), "containsObject:", CFSTR("com.apple.airplay.discovery.service"));
    else
      v37 = 1;
    v36 = a2;
    CFDictionaryGetTypeID();
    TypedValue = (__CFDictionary *)CFDictionaryGetTypedValue();
    v12 = TypedValue;
    if (TypedValue)
      CFRetain(TypedValue);
    v13 = (v9 >> 19) & 1;
    if (gLogCategory_APBrowserRapportManager <= 40
      && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v2, "name");
      objc_msgSend(v2, "model");
      LogPrintF();
    }
    if (v12)
    {
      CFSetGetTypeID();
      v14 = (__CFSet *)CFDictionaryGetTypedValue();
      if (!v14)
      {
        APSLogErrorAt();
        goto LABEL_59;
      }
      v15 = v6;
      v34 = v5;
      v35 = v14;
      CFRetain(v14);
      Int64 = CFDictionaryGetInt64();
      v17 = CFDictionaryGetInt64();
      v18 = CFDictionaryGetInt64() != 0;
      CFStringGetTypeID();
      v19 = (const void *)CFDictionaryGetTypedValue();
      if (v13 == Int64)
      {
        v20 = 0;
      }
      else
      {
        CFDictionarySetInt64();
        v20 = 1;
      }
      v30 = (_QWORD *)v36;
      if (v8 && (const void *)v8 != v19 && (!v19 || !CFEqual((CFTypeRef)v8, v19)))
      {
        FigCFDictionarySetValue();
        v20 = 1;
      }
      if (v10)
      {
        v6 = v15;
        if (!v17)
        {
          CFDictionarySetValue(v12, CFSTR("isServiceAvailabilityKnown"), (const void *)*MEMORY[0x1E0C9AE50]);
          v20 = 1;
        }
        v28 = v37;
        v23 = v35;
        if (v37 == v18)
        {
          v5 = v34;
        }
        else
        {
          v32 = (const void **)MEMORY[0x1E0C9AE50];
          if (!v37)
            v32 = (const void **)MEMORY[0x1E0C9AE40];
          CFDictionarySetValue(v12, CFSTR("isServiceAvailable"), *v32);
          v5 = v34;
          if (v37)
          {
            CFSetRemoveAllValues(v35);
            v28 = 1;
          }
          v20 = 1;
        }
      }
      else
      {
        v28 = v18;
        v6 = v15;
        v5 = v34;
        v23 = v35;
      }
      CFStringGetTypeID();
      v31 = CFDictionaryGetTypedValue();
      if (!v20)
        goto LABEL_52;
      goto LABEL_48;
    }
    v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
    if (Mutable)
    {
      v23 = Mutable;
      v24 = CFDictionaryCreateMutable(v21, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!v24)
      {
        APSLogErrorAt();
        v33 = v23;
        goto LABEL_60;
      }
      v12 = v24;
      CFDictionarySetValue(v24, CFSTR("rapportDeviceID"), v5);
      CFDictionarySetInt64();
      v25 = (const void *)*MEMORY[0x1E0C9AE50];
      v26 = (const void *)*MEMORY[0x1E0C9AE40];
      if (v10)
        v27 = (const void *)*MEMORY[0x1E0C9AE50];
      else
        v27 = (const void *)*MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(v12, CFSTR("isServiceAvailabilityKnown"), v27);
      v28 = v37;
      if (v37)
        v29 = v25;
      else
        v29 = v26;
      CFDictionarySetValue(v12, CFSTR("isServiceAvailable"), v29);
      CFDictionarySetValue(v12, CFSTR("effectiveIDsAttempted"), v23);
      FigCFDictionarySetValue();
      v30 = (_QWORD *)v36;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v36 + 80), v5, v12);
      v31 = 0;
LABEL_48:
      if (v31 | v8)
      {
        if (APBrowserRapportManager_sendDeviceEvent(v30, (uint64_t)v12))
        {
          APSLogErrorAt();
          if (gLogCategory_APBrowserRapportManager > 90
            || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_58;
          }
          goto LABEL_72;
        }
      }
      else
      {
        v31 = 0;
      }
LABEL_52:
      if (v31 | v8)
      {
        if (gLogCategory_APBrowserRapportManager > 30
          || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_58;
        }
      }
      else if (CFDictionaryGetValue(v12, CFSTR("directClient")))
      {
        if (gLogCategory_APBrowserRapportManager > 30
          || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_58;
        }
      }
      else
      {
        if (CFSetContainsValue(v23, v6))
        {
LABEL_58:
          CFRelease(v23);
LABEL_59:
          v33 = v12;
LABEL_60:
          CFRelease(v33);
          return;
        }
        if (v28)
        {
          if (APBrowserRapportManager_sendGetInfo((uint64_t)v30, (uint64_t)v2, v5, v6))
            APSLogErrorAt();
          goto LABEL_58;
        }
        if (gLogCategory_APBrowserRapportManager > 30
          || gLogCategory_APBrowserRapportManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_58;
        }
      }
LABEL_72:
      LogPrintF();
      goto LABEL_58;
    }
    goto LABEL_77;
  }
}

void __APBrowserRapportManager_ensureScanningStarted_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __APBrowserRapportManager_ensureScanningStarted_block_invoke_4;
  v3[3] = &unk_1E8256CC8;
  v3[4] = a2;
  APBrowserRapportManager_runOnQueue(v2, (uint64_t)v3);
}

uint64_t __APBrowserRapportManager_ensureScanningStarted_block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t result;

  v1 = *(void **)(a1 + 32);
  if (!v1 || !objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier"))
    return APSLogErrorAt();
  objc_msgSend(v1, "effectiveIdentifier");
  CFDictionaryGetTypeID();
  result = CFDictionaryGetTypedValue();
  if (result)
  {
    if (gLogCategory_APBrowserRapportManager <= 30)
    {
      if (gLogCategory_APBrowserRapportManager != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

void __APBrowserRapportManager_sendGetInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD v4[5];
  __int128 v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __APBrowserRapportManager_sendGetInfo_block_invoke_2;
  v4[3] = &unk_1E8256D58;
  v5 = *(_OWORD *)(a1 + 40);
  v4[4] = a2;
  APBrowserRapportManager_runOnQueue(v3, (uint64_t)v4);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __APBrowserRapportManager_sendGetInfo_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  __CFError *v5;
  __CFDictionary *TypedValue;
  __CFDictionary *v7;
  const void *v8;
  uint64_t Value;
  void *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;
  uint64_t v13;
  _QWORD v14[7];

  v3 = (const void *)a1[5];
  v4 = (const void *)a1[6];
  v5 = (__CFError *)a1[4];
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v3 || (CFDictionaryGetTypeID(), (TypedValue = (__CFDictionary *)CFDictionaryGetTypedValue()) == 0))
  {
    APSLogErrorAt();
LABEL_22:
    APBrowserRapportManager_tryNextEffectiveID(a2, v3);
    return;
  }
  v7 = TypedValue;
  if (!*(_WORD *)(a2 + 48))
  {
LABEL_21:
    CFDictionaryRemoveValue(v7, CFSTR("directClient"));
    goto LABEL_22;
  }
  if (v5)
  {
    if (CFErrorGetCode(v5) == -71165)
    {
      CFDictionarySetValue(v7, CFSTR("isServiceAvailabilityKnown"), (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v7, CFSTR("isServiceAvailable"), (const void *)*MEMORY[0x1E0C9AE40]);
      CFDictionaryRemoveValue(v7, CFSTR("directClient"));
      return;
    }
    goto LABEL_21;
  }
  v8 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(TypedValue, CFSTR("isServiceAvailabilityKnown"), (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(v7, CFSTR("isServiceAvailable"), v8);
  if (!CFDictionaryGetValue(v7, CFSTR("directClient"))
    || (Value = APSWrapperGetValue()) == 0
    || (v10 = (void *)Value,
        (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) == 0))
  {
    APSLogErrorAt();
    goto LABEL_21;
  }
  v12 = Mutable;
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v13 = *(_QWORD *)(a2 + 40);
  CFRetain(v3);
  CFRetain(v4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __APBrowserRapportManager_handleDirectClientActivation_block_invoke;
  v14[3] = &__block_descriptor_56_e51_v32__0__NSDictionary_8__NSDictionary_16__NSError_24l;
  v14[4] = v13;
  v14[5] = v3;
  v14[6] = v4;
  objc_msgSend(v10, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.airplay.discovery.getinfo"), v12, 0, v14);
  CFRelease(v12);
}

void __APBrowserRapportManager_handleDirectClientActivation_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD v6[7];
  __int128 v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __APBrowserRapportManager_handleDirectClientActivation_block_invoke_2;
  v6[3] = &unk_1E8256DA0;
  v7 = *(_OWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a4;
  APBrowserRapportManager_runOnQueue(v5, (uint64_t)v6);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __APBrowserRapportManager_handleDirectClientActivation_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  __CFError *v5;
  __CFDictionary *TypedValue;
  __CFDictionary *v7;
  int v8;
  const void *v9;

  v3 = (const void *)a1[7];
  v4 = (const void *)a1[4];
  v5 = (__CFError *)a1[6];
  if (gLogCategory_APBrowserRapportManager <= 40
    && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v3 || (CFDictionaryGetTypeID(), (TypedValue = (__CFDictionary *)CFDictionaryGetTypedValue()) == 0))
  {
    APSLogErrorAt();
    v4 = 0;
    v8 = 1;
    goto LABEL_30;
  }
  v7 = TypedValue;
  if (!*(_WORD *)(a2 + 48))
    goto LABEL_27;
  if (!v5)
  {
    v9 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(TypedValue, CFSTR("isServiceAvailabilityKnown"), (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionarySetValue(v7, CFSTR("isServiceAvailable"), v9);
    if (v4)
    {
      if (CFDictionaryContainsKey(v7, CFSTR("bonjourDeviceID")))
      {
        if (gLogCategory_APBrowserRapportManager <= 40
          && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_27;
      }
      CFStringGetTypeID();
      v4 = (const void *)CFDictionaryGetTypedValue();
      if (v4)
      {
        if (gLogCategory_APBrowserRapportManager <= 40
          && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        CFDictionarySetValue(v7, CFSTR("bonjourDeviceID"), v4);
        if (!APBrowserRapportManager_sendDeviceEvent((_QWORD *)a2, (uint64_t)v7))
          goto LABEL_28;
      }
    }
    APSLogErrorAt();
LABEL_28:
    v8 = 1;
    goto LABEL_29;
  }
  if (CFErrorGetCode(v5) != -71165)
  {
LABEL_27:
    v4 = 0;
    goto LABEL_28;
  }
  CFDictionarySetValue(v7, CFSTR("isServiceAvailabilityKnown"), (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(v7, CFSTR("isServiceAvailable"), (const void *)*MEMORY[0x1E0C9AE40]);
  v4 = 0;
  v8 = 0;
LABEL_29:
  CFDictionaryRemoveValue(v7, CFSTR("directClient"));
LABEL_30:
  if (v8)
  {
    if (!v4)
      APBrowserRapportManager_tryNextEffectiveID(a2, v3);
  }
}

void __APBrowserRapportManager_dispatchEvent_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

uint64_t __APBrowserRapportManager_copyShowInfo_block_invoke(int a1, int a2, CFDictionaryRef theDict)
{
  CFDictionaryGetValue(theDict, CFSTR("rapportDeviceID"));
  CFDictionaryGetValue(theDict, CFSTR("bonjourDeviceID"));
  CFDictionaryGetValue(theDict, CFSTR("systemPairingID"));
  CFDictionaryGetValue(theDict, CFSTR("deviceRelationship"));
  return CFStringAppendF();
}

uint64_t ___APBrowserRapportManager_getActiveManagers_block_invoke_cold_1(int a1)
{
  uint64_t result;

  if (a1 != -1)
    return LogPrintF();
  result = _LogCategory_Initialize();
  if ((_DWORD)result)
    return LogPrintF();
  return result;
}

@end
