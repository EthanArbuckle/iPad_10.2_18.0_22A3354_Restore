uint64_t airplayReqProcessor_requestProcessPairSetupPINLegacy(const void *a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  _QWORD *DerivedStorage;
  _DWORD *v7;
  uint64_t PropertyInt64Sync;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  int v13;
  int v15;
  const void *Value;
  const void *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, const __CFString *, uint64_t, const void *, CFTypeRef *, char *);
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void (*v25)(uint64_t);
  const UInt8 *BytePtr;
  CFIndex Length;
  CFTypeRef cf;
  char v29;
  const __CFString *v30;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  v30 = 0;
  v29 = 0;
  cf = 0;
  v7 = &unk_2553CD000;
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
  v9 = airplayReqProcessor_copyPasscodeForPairingType(*(_QWORD *)(*DerivedStorage + 160), 1001, PropertyInt64Sync, &v30);
  if (v9)
  {
    v13 = v9;
    v10 = 4294895362;
    APSLogErrorAt();
    v11 = v30;
  }
  else
  {
    v10 = 4294895362;
    v11 = v30;
    v12 = airplayReqProcessor_displayPINIfNeeded(a1, v30, PropertyInt64Sync);
    v13 = v12;
    if (v12 == -6721)
      goto LABEL_12;
    if (v12 == 453 || v12 == 200453)
      goto LABEL_12;
    if (!DerivedStorage[50] && (v13 = APPairingServicesLegacyCreate(*MEMORY[0x24BDBD240], DerivedStorage + 50)) != 0)
    {
      APSLogErrorAt();
    }
    else
    {
      Value = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE03900]);
      if (Value)
      {
        v17 = Value;
        v18 = DerivedStorage[50];
        v19 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, const void *, CFTypeRef *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v19)
        {
          v20 = v19(v18, v11, PropertyInt64Sync, v17, &cf, &v29);
          v13 = v20;
          v7 = (_DWORD *)&unk_2553CD000;
          switch(v20)
          {
            case -72192:
              goto LABEL_13;
            case -6760:
              v13 = -6760;
LABEL_12:
              v10 = 4294895359;
              goto LABEL_13;
            case 0:
              if (v29)
              {
                v24 = DerivedStorage[1];
                if (v24)
                {
                  v25 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
                  if (v25)
                    v25(v24);
                }
                APReceiverSystemInfoSetProperty(*(_QWORD *)(*DerivedStorage + 160), v21, (uint64_t)CFSTR("Passcode"), v22, 0);
              }
              if (cf)
              {
                BytePtr = CFDataGetBytePtr((CFDataRef)cf);
                Length = CFDataGetLength((CFDataRef)cf);
              }
              else
              {
                BytePtr = 0;
                Length = 0;
              }
              v13 = airplayReqProcessor_prepareBinaryDataResponse((uint64_t)"application/x-apple-binary-plist", (uint64_t)BytePtr, Length, 0, a3);
              if (!v13)
              {
                v10 = 0;
                goto LABEL_13;
              }
              break;
          }
        }
        else
        {
          v13 = -12782;
          v7 = (_DWORD *)&unk_2553CD000;
        }
        APSLogErrorAt();
        goto LABEL_13;
      }
      APSLogErrorAt();
      v10 = 4294895366;
    }
    v7 = (_DWORD *)&unk_2553CD000;
  }
LABEL_13:
  if (v11)
    CFRelease(v11);
  if (cf)
    CFRelease(cf);
  if (v13)
  {
    v15 = v7[214];
    if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  return v10;
}

uint64_t airplayReqProcessor_requestProcessPairSetup(const void *a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  uint64_t Int64Ranged;
  _DWORD *DerivedStorage;
  uint64_t PropertyInt64Sync;
  BOOL v10;
  int v11;
  uint64_t v12;
  __CFDictionary *PairingParamsDict;
  int v14;
  CFTypeRef v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t *v19;
  int v20;
  int v21;
  __CFString *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const __CFString *, __CFDictionary *);
  const void *Value;
  const void *v26;
  uint64_t v27;
  CFTypeRef v28;
  uint64_t (*v29)(uint64_t, CFTypeRef, uint64_t, const void *, CFTypeRef *, char *);
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  int EncryptionContext;
  const UInt8 *BytePtr;
  CFIndex Length;
  _DWORD *v38;
  CFTypeRef v39;
  CFTypeRef v40;
  char v41;
  CFTypeRef cf;

  Int64Ranged = CFDictionaryGetInt64Ranged();
  DerivedStorage = (_DWORD *)CMBaseObjectGetDerivedStorage();
  cf = 0;
  v41 = 0;
  v39 = 0;
  v40 = 0;
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
  v10 = (PropertyInt64Sync & 0xFFFFFFFD) == 1;
  if (!airplayReqProcessor_isAllowedToConnectBasedOnACL())
  {
    APSLogErrorAt();
    v14 = 0;
    PairingParamsDict = 0;
    v12 = 4294895366;
    goto LABEL_19;
  }
  if (!APSIsAPMSpeaker())
  {
    v11 = DerivedStorage[6];
    if ((v11 == 4 || v11 == 128 || v11 == 64) && !(_DWORD)PropertyInt64Sync)
    {
      v10 = 1;
      PropertyInt64Sync = 1;
    }
  }
  v12 = 4294895362;
  if (!(_DWORD)Int64Ranged && v10 || (_DWORD)Int64Ranged == 4 && (_DWORD)PropertyInt64Sync == 1)
  {
    PairingParamsDict = 0;
    v14 = -6768;
    v12 = 4294895356;
LABEL_19:
    v15 = cf;
    v16 = v12;
    goto LABEL_20;
  }
  v38 = DerivedStorage;
  v17 = airplayReqProcessor_copyPasscodeForPairingType(*(_QWORD *)(*(_QWORD *)DerivedStorage + 160), Int64Ranged, PropertyInt64Sync, (const __CFString **)&cf);
  if (v17)
  {
    v14 = v17;
    goto LABEL_80;
  }
  if ((_DWORD)Int64Ranged != 1)
  {
    v14 = 0;
LABEL_39:
    v19 = (uint64_t *)(v38 + 100);
    if (*((_QWORD *)v38 + 50))
      goto LABEL_48;
    v20 = APPairingServicesCoreUtilsCreate(*MEMORY[0x24BDBD240], (_QWORD *)v38 + 50);
    if (!v20)
    {
      if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
        && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v14 = 0;
LABEL_48:
      v21 = (_DWORD)Int64Ranged == 5 || Int64Ranged == 3;
      if ((_DWORD)Int64Ranged == 5)
        v22 = CFSTR("com.apple.ScreenCapture");
      else
        v22 = 0;
      PairingParamsDict = airplayReqProcessor_createPairingParamsDict(0, 0, v21, Int64Ranged == 4, v22);
      if (!PairingParamsDict)
        goto LABEL_81;
      v23 = *v19;
      v24 = *(void (**)(uint64_t, const __CFString *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 56);
      if (v24)
        v24(v23, CFSTR("pairingParams"), PairingParamsDict);
      Value = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE03900]);
      if (!Value)
      {
        APSLogErrorAt();
        v12 = 4294895366;
        goto LABEL_19;
      }
      v26 = Value;
      v27 = *v19;
      v28 = cf;
      v29 = *(uint64_t (**)(uint64_t, CFTypeRef, uint64_t, const void *, CFTypeRef *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v29)
      {
        v30 = v29(v27, v28, PropertyInt64Sync, v26, &v40, &v41);
        v14 = v30;
        switch(v30)
        {
          case -72192:
            goto LABEL_19;
          case -6760:
            v12 = 4294895359;
            v14 = -6760;
            goto LABEL_19;
          case 0:
            if (v41)
            {
              v33 = *((_QWORD *)v38 + 1);
              if (v33)
              {
                v34 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
                if (v34)
                  v34(v33);
              }
              APReceiverSystemInfoSetProperty(*(_QWORD *)(*(_QWORD *)v38 + 160), v31, (uint64_t)CFSTR("Passcode"), v32, 0);
              if ((_DWORD)Int64Ranged == 4)
              {
                EncryptionContext = airplayReqProcessor_createEncryptionContext((uint64_t)a1, (CFMutableDictionaryRef *)&v39);
                if (EncryptionContext)
                {
                  v14 = EncryptionContext;
                  goto LABEL_81;
                }
                v38[105] = 1;
                *((_BYTE *)v38 + 408) = 1;
                if ((PropertyInt64Sync & 0xFFFFFFFE) == 2)
                  *((_BYTE *)v38 + 409) = 1;
              }
            }
            if (v40)
            {
              BytePtr = CFDataGetBytePtr((CFDataRef)v40);
              Length = CFDataGetLength((CFDataRef)v40);
            }
            else
            {
              BytePtr = 0;
              Length = 0;
            }
            v14 = airplayReqProcessor_prepareBinaryDataResponse((uint64_t)"application/x-apple-binary-plist", (uint64_t)BytePtr, Length, v39, a3);
            if (!v14)
            {
              v12 = 0;
              goto LABEL_19;
            }
LABEL_81:
            APSLogErrorAt();
            goto LABEL_19;
        }
      }
      else
      {
        v14 = -12782;
      }
      APSLogErrorAt();
      v12 = 4294895356;
      goto LABEL_19;
    }
    v14 = v20;
LABEL_80:
    APSLogErrorAt();
    PairingParamsDict = 0;
    goto LABEL_19;
  }
  v15 = cf;
  v18 = airplayReqProcessor_displayPINIfNeeded(a1, (const __CFString *)cf, PropertyInt64Sync);
  v14 = v18;
  PairingParamsDict = 0;
  v16 = 4294895359;
  if (v18 != -6721 && v18 != 453 && v18 != 200453)
    goto LABEL_39;
LABEL_20:
  if (v15)
    CFRelease(v15);
  if (v39)
    CFRelease(v39);
  if (v40)
    CFRelease(v40);
  if (PairingParamsDict)
    CFRelease(PairingParamsDict);
  if (v14
    && gLogCategory_APReceiverRequestProcessorAirPlay <= 90
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v16;
}

uint64_t airplayReqProcessor_requestProcessPairVerify(uint64_t a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  uint64_t DerivedStorage;
  int Int64Ranged;
  int v8;
  uint64_t Int64;
  const void *Value;
  const void *v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  __CFDictionary *v17;
  unsigned int v18;
  const __CFString *v19;
  _BOOL4 v20;
  const __CFString *v21;
  _BOOL4 v22;
  __CFString *v23;
  int v24;
  __CFDictionary *PairingParamsDict;
  _BOOL4 v26;
  const void *v27;
  _BOOL4 v28;
  int v29;
  int v30;
  uint64_t v31;
  CFMutableDictionaryRef *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const __CFString *, __CFDictionary *);
  uint64_t v35;
  uint64_t (*v36)(uint64_t, const void *, CFDataRef *, char *);
  int PropertyInt64Sync;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v44;
  char v45;
  CFDataRef theData;
  CFTypeRef cf;
  int EncryptionContext;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  EncryptionContext = 0;
  theData = 0;
  cf = 0;
  v45 = 0;
  ++*(_DWORD *)(DerivedStorage + 416);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v8 = EncryptionContext;
  if (EncryptionContext)
  {
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
         && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  Int64 = CFDictionaryGetInt64();
  if (!EncryptionContext)
    *(_DWORD *)(DerivedStorage + 420) = Int64 != 0;
  Value = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE03900]);
  if (!Value)
  {
    v38 = 4294895362;
LABEL_90:
    APSLogErrorAt();
    v17 = 0;
    goto LABEL_54;
  }
  v11 = Value;
  v12 = (uint64_t *)(DerivedStorage + 400);
  if (*(_QWORD *)(DerivedStorage + 400))
  {
    if (!v8)
      goto LABEL_29;
LABEL_27:
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_44;
  }
  v13 = *MEMORY[0x24BDBD240];
  v14 = (_QWORD *)(DerivedStorage + 400);
  if (v8)
  {
    EncryptionContext = APPairingServicesLegacyCreate(v13, v14);
    if (EncryptionContext)
    {
      v38 = 4294895362;
      goto LABEL_90;
    }
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_27;
  }
  EncryptionContext = APPairingServicesCoreUtilsCreate(v13, v14);
  if (EncryptionContext)
  {
    v38 = 4294895362;
    goto LABEL_90;
  }
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_29:
  v18 = Int64Ranged & 0xFFFFFFFE;
  v19 = CFSTR("com.apple.admin");
  if (Int64Ranged != 7)
    v19 = 0;
  v20 = Int64Ranged == 3;
  v21 = CFSTR("com.apple.ScreenCapture");
  if (Int64Ranged == 5)
    v20 = 1;
  else
    v21 = 0;
  v22 = v18 == 6;
  if (v18 == 6)
    v23 = (__CFString *)v19;
  else
    v23 = (__CFString *)v21;
  v24 = v18 != 6 && v20;
  PairingParamsDict = airplayReqProcessor_createPairingParamsDict(Int64Ranged == 8, v18 == 6, v24, 0, v23);
  if (!PairingParamsDict)
  {
    v38 = 4294895362;
    goto LABEL_90;
  }
  v44 = DerivedStorage;
  v26 = Int64Ranged == 8;
  v27 = v11;
  v28 = v22;
  v29 = v8;
  v17 = PairingParamsDict;
  v30 = Int64Ranged;
  v31 = a1;
  v32 = a3;
  v33 = *v12;
  v34 = *(void (**)(uint64_t, const __CFString *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 56);
  if (v34)
    v34(v33, CFSTR("pairingParams"), v17);
  a3 = v32;
  a1 = v31;
  Int64Ranged = v30;
  v8 = v29;
  v16 = v28;
  v11 = v27;
  v15 = v26;
  DerivedStorage = v44;
LABEL_44:
  v35 = *v12;
  v36 = *(uint64_t (**)(uint64_t, const void *, CFDataRef *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 16);
  if (!v36)
  {
    EncryptionContext = -12782;
    goto LABEL_52;
  }
  EncryptionContext = v36(v35, v11, &theData, &v45);
  if (EncryptionContext)
  {
LABEL_52:
    v38 = 4294895362;
LABEL_53:
    APSLogErrorAt();
    goto LABEL_54;
  }
  if (!v45)
  {
LABEL_76:
    if (theData)
    {
      BytePtr = CFDataGetBytePtr(theData);
      Length = CFDataGetLength(theData);
    }
    else
    {
      BytePtr = 0;
      Length = 0;
    }
    EncryptionContext = airplayReqProcessor_prepareBinaryDataResponse((uint64_t)"application/octet-stream", (uint64_t)BytePtr, Length, cf, a3);
    if (!EncryptionContext)
    {
      v38 = 0;
      goto LABEL_81;
    }
    v38 = 4294895362;
    goto LABEL_53;
  }
  PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
  if (!v8)
  {
    EncryptionContext = airplayReqProcessor_createEncryptionContext(a1, (CFMutableDictionaryRef *)&cf);
    if (EncryptionContext)
    {
      APSLogErrorAt();
      v38 = 0;
LABEL_54:
      if (!EncryptionContext)
        goto LABEL_81;
      goto LABEL_65;
    }
  }
  *(_BYTE *)(DerivedStorage + 408) = 1;
  if (v15)
  {
    *(_BYTE *)(DerivedStorage + 412) = 1;
  }
  else if (v16)
  {
    *(_BYTE *)(DerivedStorage + 411) = 1;
  }
  if (PropertyInt64Sync == 1
    || *(_BYTE *)(DerivedStorage + 412)
    || *(_BYTE *)(DerivedStorage + 411)
    || Int64Ranged == 5)
  {
    *(_BYTE *)(DerivedStorage + 409) = 1;
  }
  if (EncryptionContext == -6745)
  {
    v38 = 4294895356;
    goto LABEL_65;
  }
  if (EncryptionContext != -6716)
  {
    if (EncryptionContext)
    {
      v38 = 4294895366;
      goto LABEL_65;
    }
    goto LABEL_76;
  }
  v38 = 4294895363;
LABEL_65:
  v39 = *(_QWORD *)(DerivedStorage + 400);
  if (v39)
  {
    v40 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (*(_QWORD *)(v40 + 24))
      (*(void (**)(uint64_t))(v40 + 40))(v39);
  }
LABEL_81:
  if (theData)
    CFRelease(theData);
  if (cf)
    CFRelease(cf);
  if (v17)
    CFRelease(v17);
  return v38;
}

uint64_t airplayReqProcessor_requestProcessFeedback(uint64_t a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  CFDictionaryRef theDict;

  theDict = 0;
  v5 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 32);
  if (!v5)
    return 0;
  AirPlayReceiverSessionControl(v5, v6, CFSTR("updateFeedback"), 0, a2, &theDict);
  if (!theDict)
    return 0;
  if (CFDictionaryGetCount(theDict) >= 1 && airplayReqProcessor_preparePlistResponse(theDict, a3))
  {
    v7 = 4294895362;
    APSLogErrorAt();
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v7 = 0;
  }
  if (theDict)
    CFRelease(theDict);
  return v7;
}

uint64_t airplayReqProcessor_requestProcessMetrics(uint64_t a1, uint64_t a2, CFMutableDictionaryRef *a3)
{
  uint64_t DerivedStorage;
  const __CFData *TypedValue;
  const __CFData *v6;
  int v7;
  uint64_t v8;
  const void *Mutable;
  uint64_t v10;
  int v12;

  v12 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(DerivedStorage + 32))
  {
    CFDataGetTypeID();
    TypedValue = (const __CFData *)CFDictionaryGetTypedValue();
    v6 = TypedValue;
    if (!TypedValue)
    {
      v10 = 4294895358;
      APSLogErrorAt();
      Mutable = 0;
      goto LABEL_19;
    }
    CFDataGetBytePtr(TypedValue);
    CFDataGetLength(v6);
    CFDictionaryGetTypeID();
    v6 = (const __CFData *)CFCreateWithPlistBytes();
    Mutable = AirPlayReceiverSessionCopyProperty(*(_QWORD *)(DerivedStorage + 32), v7, CFSTR("metrics"), v8, 0);
    if (Mutable || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
    {
      v12 = airplayReqProcessor_preparePlistResponse(Mutable, a3);
      if (!v12)
      {
        v10 = 0;
        goto LABEL_11;
      }
      APSLogErrorAt();
      v10 = 4294895362;
LABEL_19:
      if (!v12)
        goto LABEL_11;
      goto LABEL_20;
    }
    APSLogErrorAt();
    v10 = 4294895362;
  }
  else
  {
    Mutable = 0;
    v6 = 0;
    v10 = 4294895358;
  }
LABEL_20:
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_11:
  if (v6)
    CFRelease(v6);
  if (Mutable)
    CFRelease(Mutable);
  return v10;
}

uint64_t airplayReqProcessor_requestProcessCommand(const void *a1, uint64_t a2, CFMutableDictionaryRef *a3)
{
  uint64_t DerivedStorage;
  const __CFData *TypedValue;
  const __CFData *v7;
  uint64_t v8;
  const void *v9;
  const void *Value;
  const void *v11;
  __CFDictionary *Mutable;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  uint64_t v17;
  int v18;
  _BOOL4 v19;
  int v20;
  __CFDictionary *MutableCopy;
  const void **v22;
  int v23;
  const __CFDictionary *Empty;
  uint64_t v25;
  uint64_t v26;
  int v28;
  const __CFDictionary *v29;
  int v30;
  const __CFDictionary *v31;
  const __CFDictionary *v32;
  int v33;
  uint64_t v34;
  const __CFDictionary *v35;
  const __CFDictionary *v36;
  const void *v37;
  int v38;
  int Int64Ranged;
  const __CFDictionary *v40;
  const __CFDictionary *v41;
  uint64_t v42;
  int v43;
  const __CFDictionary *v44;
  uint64_t v45;
  uint64_t v46;
  CFTypeRef cf;
  CFTypeRef v48;
  int updated;
  void *v50;

  updated = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  cf = 0;
  v48 = 0;
  CFDataGetTypeID();
  TypedValue = (const __CFData *)CFDictionaryGetTypedValue();
  v7 = TypedValue;
  if (!TypedValue)
  {
    v25 = 4294895366;
    APSLogErrorAt();
    v9 = 0;
    goto LABEL_77;
  }
  CFDataGetBytePtr(TypedValue);
  CFDataGetLength(v7);
  CFDictionaryGetTypeID();
  v7 = (const __CFData *)CFCreateWithPlistBytes();
  CFStringGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  if (!v8)
  {
    CFDictionaryGetInt64();
    Value = CFDictionaryGetValue(v7, CFSTR("params"));
    if (Value)
    {
      v11 = Value;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        CFDictionarySetInt64();
        CFDictionarySetValue(Mutable, CFSTR("reqProcRef"), a1);
        CFDictionarySetValue(Mutable, CFSTR("params"), v11);
        v14 = *(_QWORD *)(DerivedStorage + 32);
        if (!v14)
        {
          APSLogErrorAt();
          updated = -6709;
          v25 = 4294895365;
          goto LABEL_92;
        }
        updated = AirPlayReceiverSessionControl(v14, v13, CFSTR("didReceiveData"), 0, Mutable, 0);
        if (!updated)
        {
LABEL_34:
          v25 = 0;
          goto LABEL_35;
        }
        APSLogErrorAt();
        v9 = 0;
        goto LABEL_100;
      }
      APSLogErrorAt();
      v25 = 0;
      v33 = -71946;
    }
    else
    {
      v25 = 4294895366;
      APSLogErrorAt();
      Mutable = 0;
      v33 = -6705;
    }
    updated = v33;
    goto LABEL_92;
  }
  v9 = (const void *)v8;
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APReceiverSessionManagerCopyAirPlaySessionWithAttribute(*(_QWORD *)(DerivedStorage + 432), 0, 0, &v48);
  if (CFEqual(v9, CFSTR("APValeria")))
  {
    CFDictionaryGetTypeID();
    v15 = CFDictionaryGetTypedValue();
    if (v15)
    {
      v16 = (const __CFDictionary *)v15;
      v17 = CMBaseObjectGetDerivedStorage();
      v50 = 0;
      v18 = *(_DWORD *)(v17 + 24);
      v19 = v18 == 64;
      if (v18 == 128)
        v19 = 1;
      v20 = v18 == 4 || v19;
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v16);
      ASPrintF();
      CFDictionarySetCString();
      v22 = (const void **)MEMORY[0x24BDBD268];
      if (v20)
        v22 = (const void **)MEMORY[0x24BDBD270];
      CFDictionarySetValue(MutableCopy, CFSTR("IsP2P"), *v22);
      if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
        && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v28 = APSXPCClientSendCommandCreatingReply();
      if (v28)
      {
        APSLogErrorAt();
        if (!MutableCopy)
        {
LABEL_48:
          free(v50);
          v25 = 0;
          Mutable = 0;
          updated = v28;
          if (!v28)
            goto LABEL_35;
          goto LABEL_49;
        }
      }
      else if (!MutableCopy)
      {
        goto LABEL_48;
      }
      CFRelease(MutableCopy);
      goto LABEL_48;
    }
    v25 = 4294895366;
LABEL_85:
    APSLogErrorAt();
    Mutable = 0;
    updated = -6705;
    goto LABEL_50;
  }
  if (CFEqual(v9, CFSTR("duckAudio")) || CFEqual(v9, CFSTR("unduckAudio")))
  {
    if (CFDictionaryContainsKey(v7, CFSTR("params")))
    {
      CFDictionaryGetTypeID();
      Empty = (const __CFDictionary *)CFDictionaryGetTypedValue();
      if (!Empty)
      {
        v25 = 4294895366;
        goto LABEL_85;
      }
    }
    else
    {
      Empty = (const __CFDictionary *)CFDictionaryGetEmpty();
    }
    v26 = *(_QWORD *)(DerivedStorage + 32);
    if (v26)
    {
      if (*(_DWORD *)(DerivedStorage + 40) != 2)
      {
        APSLogErrorAt();
        Mutable = 0;
        updated = -6773;
        v25 = 4294895363;
        goto LABEL_50;
      }
      updated = AirPlayReceiverSessionControl(v26, v23, v9, 0, Empty, 0);
      if (!updated)
        goto LABEL_33;
      goto LABEL_99;
    }
LABEL_97:
    APSLogErrorAt();
    Mutable = 0;
    updated = -6709;
    v25 = 4294895365;
    goto LABEL_50;
  }
  if (CFEqual(v9, CFSTR("mute")))
  {
    if (!v48)
    {
      v25 = 4294895366;
      goto LABEL_133;
    }
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    updated = CFObjectSetProperty();
    if (updated)
    {
      v25 = 4294895366;
LABEL_133:
      APSLogErrorAt();
      goto LABEL_77;
    }
    goto LABEL_33;
  }
  if (CFEqual(v9, CFSTR("unmute")))
  {
    if (!v48)
    {
      v25 = 4294895366;
      goto LABEL_133;
    }
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    updated = CFObjectSetProperty();
    if (updated)
    {
      v25 = 4294895366;
      goto LABEL_133;
    }
LABEL_33:
    Mutable = 0;
    goto LABEL_34;
  }
  if (CFEqual(v9, CFSTR("changeRelativeVolume")) || CFEqual(v9, CFSTR("performPWDKeyExchange")))
  {
    if (!v48)
    {
      v25 = 4294895366;
      goto LABEL_133;
    }
    CFDictionaryGetTypeID();
    v29 = (const __CFDictionary *)CFDictionaryGetTypedValue();
    if (!v29)
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    updated = AirPlayReceiverSessionControl((uint64_t)v48, v30, v9, 0, v29, (__CFDictionary **)&cf);
    if (updated)
      goto LABEL_99;
    Mutable = 0;
    v25 = 0;
    if (a3 && cf)
    {
      updated = airplayReqProcessor_preparePlistResponse(cf, a3);
      if (!updated)
        goto LABEL_33;
      goto LABEL_99;
    }
    goto LABEL_78;
  }
  if (CFEqual(v9, CFSTR("updateMRNowPlayingInfo")))
  {
    CFDictionaryGetTypeID();
    v31 = (const __CFDictionary *)CFDictionaryGetTypedValue();
    if (!v31)
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    updated = airplayReqProcessor_processUpdateMRNowPlayingInfo((uint64_t)a1, v31);
    if (!updated)
      goto LABEL_33;
    v25 = 4294895366;
    goto LABEL_133;
  }
  if (CFEqual(v9, CFSTR("updateMRSupportedCommands")))
  {
    CFDictionaryGetTypeID();
    v32 = (const __CFDictionary *)CFDictionaryGetTypedValue();
    if (!v32)
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    updated = airplayReqProcessor_processUpdateMRExtendedMetadata((uint64_t)a1, v32, CFSTR("mrSupportedCommandsFromSender"), CFSTR("mrSupportedCommandsFromSender"));
    if (!updated)
      goto LABEL_33;
    v25 = 4294895366;
    goto LABEL_133;
  }
  if (CFEqual(v9, CFSTR("setMRInfo")))
  {
    if (!*(_QWORD *)(DerivedStorage + 32))
      goto LABEL_97;
    v34 = DerivedStorage;
    CFDictionaryGetTypeID();
    v35 = (const __CFDictionary *)CFDictionaryGetTypedValue();
    if (!v35)
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    v36 = v35;
    if (!CFDictionaryContainsKey(v35, CFSTR("mrInfo")))
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    v37 = CFDictionaryGetValue(v36, CFSTR("mrInfo"));
    AirPlayReceiverSessionSetProperty(*(_QWORD *)(v34 + 32), v38, CFSTR("MRInfo"), 0, v37);
    v25 = 0;
LABEL_77:
    Mutable = 0;
    goto LABEL_78;
  }
  v46 = DerivedStorage;
  if (!CFEqual(v9, CFSTR("setSenderDisplayLatencyMs")))
  {
    if (CFEqual(v9, CFSTR("updateMRPlaybackState")))
    {
      CFDictionaryGetTypeID();
      v40 = (const __CFDictionary *)CFDictionaryGetTypedValue();
      if (!v40)
      {
        v25 = 4294895366;
        goto LABEL_85;
      }
      updated = airplayReqProcessor_processUpdateMRExtendedMetadata((uint64_t)a1, v40, CFSTR("mrPlaybackState"), CFSTR("mrPlaybackState"));
      if (!updated)
        goto LABEL_33;
      v25 = 4294895366;
      goto LABEL_133;
    }
    if (CFEqual(v9, CFSTR("updateMRNowPlayingClient")))
    {
      CFDictionaryGetTypeID();
      v41 = (const __CFDictionary *)CFDictionaryGetTypedValue();
      if (!v41)
      {
        v25 = 4294895366;
        goto LABEL_85;
      }
      updated = airplayReqProcessor_processUpdateMRExtendedMetadata((uint64_t)a1, v41, CFSTR("mrNowPlayingClient"), CFSTR("mrNowPlayingClient"));
      if (!updated)
        goto LABEL_33;
      v25 = 4294895366;
      goto LABEL_133;
    }
    if (!CFEqual(v9, CFSTR("fadeAudio")))
    {
      v25 = 4294895366;
      updated = -6705;
      goto LABEL_133;
    }
    CFDictionaryGetTypeID();
    v42 = CFDictionaryGetTypedValue();
    if (!v42)
    {
      v25 = 4294895366;
      goto LABEL_85;
    }
    v44 = (const __CFDictionary *)v42;
    v45 = *(_QWORD *)(DerivedStorage + 32);
    if (!v45)
      goto LABEL_97;
    updated = AirPlayReceiverSessionControl(v45, v43, v9, 0, v44, 0);
    if (!updated)
      goto LABEL_33;
LABEL_99:
    APSLogErrorAt();
    Mutable = 0;
LABEL_100:
    v25 = 4294895362;
    goto LABEL_78;
  }
  CFDictionaryGetTypeID();
  if (!CFDictionaryGetTypedValue())
  {
    v25 = 4294895366;
    goto LABEL_85;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (updated)
  {
    v25 = 4294895366;
    goto LABEL_133;
  }
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v25 = 0;
  Mutable = 0;
  *(_DWORD *)(*(_QWORD *)(v46 + 32) + 696) = Int64Ranged;
LABEL_78:
  if (!updated)
    goto LABEL_35;
LABEL_49:
  if (!v9)
  {
LABEL_92:
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_94;
    }
    goto LABEL_35;
  }
LABEL_50:
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
LABEL_94:
    LogPrintF();
  }
LABEL_35:
  if (v7)
    CFRelease(v7);
  if (cf)
    CFRelease(cf);
  if (Mutable)
    CFRelease(Mutable);
  if (v48)
    CFRelease(v48);
  return v25;
}

uint64_t airplayReqProcessor_requestProcessSetAudioMode()
{
  uint64_t DerivedStorage;
  const __CFData *TypedValue;
  const __CFData *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v11;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataGetTypeID();
  TypedValue = (const __CFData *)CFDictionaryGetTypedValue();
  if (!TypedValue)
  {
    v9 = 4294895366;
    APSLogErrorAt();
    return v9;
  }
  v2 = TypedValue;
  CFDataGetBytePtr(TypedValue);
  CFDataGetLength(v2);
  CFDictionaryGetTypeID();
  v3 = (const void *)CFCreateWithPlistBytes();
  CFStringGetTypeID();
  v4 = CFDictionaryGetTypedValue();
  if (!v4)
  {
    v9 = 4294895366;
    APSLogErrorAt();
    goto LABEL_12;
  }
  v7 = v4;
  v8 = *(_QWORD **)(*(_QWORD *)(DerivedStorage + 32) + 576);
  if (!v8)
  {
    APSLogErrorAt();
    v9 = 4294895358;
    goto LABEL_12;
  }
  if (APReceiverAudioSessionPlatformSetProperty(v8, v5, CFSTR("RASP::AudioMode"), v6, v7))
  {
    APSLogErrorAt();
    v9 = 4294895362;
LABEL_12:
    v11 = v9;
    if (!v3)
      return v9;
    goto LABEL_6;
  }
  v9 = 0;
  v11 = 0;
  if (v3)
  {
LABEL_6:
    CFRelease(v3);
    return v11;
  }
  return v9;
}

uint64_t airplayReqProcessor_isAllowedToConnectBasedOnUserPermission(const void *a1, int *a2)
{
  uint64_t DerivedStorage;
  uint64_t v5;
  const __CFAllocator *v6;
  uint64_t v7;
  CFStringRef v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, CFStringRef);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_QWORD *)(DerivedStorage + 8)
    || ((v5 = DerivedStorage, *(_BYTE *)(DerivedStorage + 412)) || *(_BYTE *)(DerivedStorage + 413))
    && !*(_BYTE *)(*(_QWORD *)DerivedStorage + 255))
  {
    v9 = 0;
    v8 = 0;
    v10 = 1;
    if (!a2)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (!APReceiverSessionManagerCanHijack(*(_QWORD *)(DerivedStorage + 432), a1))
  {
    APSLogErrorAt();
    v10 = 0;
    v8 = 0;
    v9 = -71937;
    if (!a2)
      goto LABEL_26;
    goto LABEL_25;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = SockAddrToDeviceID();
  v8 = CFStringCreateWithFormat(v6, 0, CFSTR("client-%llx"), v7);
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = *(_QWORD *)(v5 + 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, CFStringRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
  if (!v12 || v12(v11, v5 + 134, v8))
  {
    v10 = 1;
    *(_BYTE *)(v5 + 413) = 1;
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = 0;
    if (!a2)
      goto LABEL_26;
LABEL_25:
    *a2 = v9;
    goto LABEL_26;
  }
  v9 = -71930;
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = 0;
  if (a2)
    goto LABEL_25;
LABEL_26:
  if (v8)
    CFRelease(v8);
  return v10;
}

uint64_t airplayReqProcessor_createAndStoreMediaControlRequestProcessorForMCSession(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t DerivedStorage;
  CFMutableDictionaryRef Mutable;
  const void *Int64;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  CFTypeRef v12;
  CFTypeRef v13;
  CFTypeRef v14;
  const __CFAllocator *v15;
  int v17;
  __int16 v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  const void *cf_8;
  CFTypeRef v23[2];
  const void *v24;
  uint64_t v25;
  const void *v26;
  CFTypeRef v27;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_OWORD *)v23 = 0u;
  if (*(_QWORD *)(DerivedStorage + 104)
    || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]),
        (*(_QWORD *)(DerivedStorage + 104) = Mutable) != 0))
  {
    Int64 = (const void *)CFNumberCreateInt64();
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 104), Int64))
    {
      if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
        && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = 0;
    }
    else
    {
      v17 = *(_DWORD *)(DerivedStorage + 128);
      v18 = *(_WORD *)(DerivedStorage + 132);
      v20 = *(_DWORD *)(DerivedStorage + 24);
      if (a3)
        v21 = *a3;
      else
        v21 = 0uLL;
      v24 = *(const void **)DerivedStorage;
      v25 = *(_QWORD *)(DerivedStorage + 120);
      v26 = *(const void **)(*(_QWORD *)(DerivedStorage + 16) + 120);
      v19 = *(_QWORD *)(DerivedStorage + 16);
      cf_8 = *(const void **)(DerivedStorage + 400);
      v8 = *(_QWORD *)(DerivedStorage + 32);
      if (v8)
        v23[1] = *(CFTypeRef *)(v8 + 448);
      v27 = *(CFTypeRef *)(DerivedStorage + 8);
      if (gMediaControlGlobalsInitOnce != -1)
        dispatch_once_f(&gMediaControlGlobalsInitOnce, 0, (dispatch_function_t)mcProcessor_initOnce);
      if (APReceiverRequestProcessorGetClassID_once != -1)
        dispatch_once(&APReceiverRequestProcessorGetClassID_once, &__block_literal_global_203);
      v9 = CMDerivedObjectCreate();
      if ((_DWORD)v9)
      {
        APSLogErrorAt();
      }
      else
      {
        v10 = CMBaseObjectGetDerivedStorage();
        *(_DWORD *)(v10 + 16) = v17;
        *(_WORD *)(v10 + 20) = v18;
        *(_DWORD *)(v10 + 24) = v20;
        SockAddrCopy();
        SockAddrCopy();
        *(_QWORD *)(v10 + 96) = a2;
        *(_OWORD *)(v10 + 104) = v21;
        v11 = cf_8;
        if (cf_8)
          v11 = CFRetain(cf_8);
        *(_QWORD *)(v10 + 120) = v11;
        v12 = v24;
        if (v24)
          v12 = CFRetain(v24);
        *(_QWORD *)(v10 + 128) = v12;
        *(_QWORD *)(v10 + 144) = v25;
        *(_QWORD *)(v10 + 152) = v26;
        CFRetain(v26);
        *(_QWORD *)(v10 + 32) = v19;
        __strlcpy_chk();
        UUIDGet();
        v13 = v27;
        if (v27)
          v13 = CFRetain(v27);
        *(_QWORD *)(v10 + 392) = v13;
        *(_QWORD *)(v10 + 400) = APReceiverFairPlayHelperCreate();
        v14 = v23[1];
        if (v23[1])
          v14 = CFRetain(v23[1]);
        *(_QWORD *)(v10 + 136) = v14;
        *(_BYTE *)(v10 + 408) = 1;
        if (gLogCategory_APReceiverRequestProcessorMediaControl <= 50)
        {
          if (gLogCategory_APReceiverRequestProcessorMediaControl != -1 || _LogCategory_Initialize())
            LogPrintF();
          if (gLogCategory_APReceiverRequestProcessorMediaControl <= 30
            && (gLogCategory_APReceiverRequestProcessorMediaControl != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        *(_QWORD *)(v10 + 416) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
        *(_QWORD *)(v10 + 440) = CFDictionaryCreateMutable(v15, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *(_QWORD *)(v10 + 432) = FigSimpleMutexCreate();
        *(_QWORD *)(v10 + 448) = FigSimpleMutexCreate();
        *(_QWORD *)(v10 + 424) = 0;
      }
      if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
        && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSLogErrorAt();
      if (!(_DWORD)v9)
        v9 = 4294960568;
    }
    if (Int64)
      CFRelease(Int64);
  }
  else
  {
    APSLogErrorAt();
    return 4294895346;
  }
  return v9;
}

uint64_t airplayReqProcessor_hijackCurrentSessionIfNeeded(const void *a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = *(_QWORD *)(DerivedStorage + 432);
  if (*(int *)(v3 + 72) < 1)
    return 0;
  v4 = DerivedStorage;
  if (CFArrayGetCount(*(CFArrayRef *)(v3 + 64)) != *(_DWORD *)(v3 + 72))
    return 0;
  if (APReceiverSessionManagerCanHijack(*(_QWORD *)(v4 + 432), a1))
  {
    APReceiverSessionManagerHijack(*(_QWORD *)(v4 + 432), a1);
    return 0;
  }
  APSLogErrorAt();
  return 4294895359;
}

void airplayReqProcessor_handleNewSessionFromHTUnawareSender()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void *v6;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(DerivedStorage + 440))
  {
    v1 = DerivedStorage;
    if (APSIsAPMSpeaker())
    {
      if (APSIsMemberOfHTGroup())
      {
        if (*(_QWORD *)(*(_QWORD *)(v1 + 432) + 48))
        {
          v2 = (__CFDictionary *)APReceiverRequestProcessorCopyReceiverSession();
          if (v2)
          {
            v3 = v2;
            if (AirPlayReceiverSessionSendMediaRemoteCommand(v2, -1, 1885435251, 0))
              goto LABEL_22;
            if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
              && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (!Mutable)
            {
LABEL_22:
              APSLogErrorAt();
              v5 = v3;
            }
            else
            {
              v5 = Mutable;
              CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("htSecondaryNonPersistentSessionStarted"));
              CFDictionarySetInt64();
              v6 = *(const void **)(v1 + 456);
              if (v6)
                CFDictionarySetValue(v5, CFSTR("hijackID"), v6);
              if (AirPlayReceiverSessionSendCommandForObject((uint64_t)v3, 0, v5, 0, 0))
              {
                APSLogErrorAt();
              }
              else if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
                     && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              CFRelease(v3);
            }
            CFRelease(v5);
          }
        }
      }
    }
  }
}

uint64_t airplayReqProcessor_registerReqProcWithSessionManager(const void *a1, int a2)
{
  uint64_t DerivedStorage;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  uint64_t v11;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(DerivedStorage + 352))
  {
    v6 = DerivedStorage;
    v7 = *(_QWORD *)(DerivedStorage + 432);
    if (v7)
    {
      if (a1)
      {
        if (gLogCategory_APReceiverSessionManager <= 50
          && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (a2)
        {
          if (a2 != 2)
          {
            if (a2 == 1)
            {
              if (*(_BYTE *)(v7 + 40))
              {
                if (!cfArrayContainsValue(*(const __CFArray **)(v7 + 80), a1))
                {
                  CFArrayAppendValue(*(CFMutableArrayRef *)(v7 + 80), a1);
                  if (gLogCategory_APReceiverSessionManager <= 50
                    && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                }
                goto LABEL_58;
              }
              v5 = 4294960561;
LABEL_38:
              APSLogErrorAt();
              return v5;
            }
            v5 = 4294895056;
            if (gLogCategory_APReceiverSessionManager <= 90
              && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
LABEL_37:
            APReceiverSessionManagerRemoveSession(v7, a1);
            goto LABEL_38;
          }
          if (APSIsMemberOfHTGroup())
            v8 = APSIsAPMSpeaker() != 0;
          else
            v8 = 0;
          v9 = APSIsMemberOfStereoPair();
          CFObjectGetInt64();
          if ((v8 || v9) && !cfArrayContainsValue(*(const __CFArray **)(v7 + 64), a1))
          {
            if (!*(_QWORD *)(v7 + 48))
              goto LABEL_45;
            if (gLogCategory_APReceiverSessionManager <= 50
              && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            AirPlayReceiverServerHijackConnection(*(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 48), (uint64_t)a1);
            if (!*(_QWORD *)(v7 + 48))
            {
LABEL_45:
              v10 = *(_DWORD *)(v7 + 72);
              if (v10 >= 1)
                *(_DWORD *)(v7 + 72) = v10 + 1;
              CFArrayAppendValue(*(CFMutableArrayRef *)(v7 + 64), a1);
              *(_QWORD *)(v7 + 48) = CFRetain(a1);
              APReceiverSessionManagerUpdateParentGroupInfo((_QWORD *)v7);
              if (gLogCategory_APReceiverSessionManager <= 50
                && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              if (v9)
              {
                if (gLogCategory_APReceiverSessionManager <= 30
                  && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                CFObjectSetProperty();
              }
              goto LABEL_57;
            }
          }
        }
        else
        {
          if (cfArrayContainsValue(*(const __CFArray **)(v7 + 64), a1))
            goto LABEL_58;
          if (*(int *)(v7 + 72) < 1 || CFArrayGetCount(*(CFArrayRef *)(v7 + 64)) != *(_DWORD *)(v7 + 72))
          {
            CFArrayAppendValue(*(CFMutableArrayRef *)(v7 + 64), a1);
            if (gLogCategory_APReceiverSessionManager <= 50
              && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            APReceiverSessionManagerSetAsMainAirPlaySession(v7, a1);
LABEL_57:
            v11 = APReceiverSessionManagerUpdateAndNotifyReceiverSessionState(v7);
            if ((_DWORD)v11)
            {
              v5 = v11;
              APSLogErrorAt();
              goto LABEL_37;
            }
LABEL_58:
            v5 = 0;
            *(_BYTE *)(v6 + 352) = 1;
            return v5;
          }
        }
        APSLogErrorAt();
        v5 = 4294895055;
        goto LABEL_38;
      }
      v5 = 4294895056;
    }
    else
    {
      v5 = 4294895056;
    }
    APSLogErrorAt();
    goto LABEL_38;
  }
  return 0;
}

uint64_t airplayReqProcessor_processUpdateMRNowPlayingInfo(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  const void *Value;
  const void *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  int v10;
  int v11;
  uint64_t v12;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_QWORD *)(DerivedStorage + 32))
  {
    APSLogErrorAt();
    v12 = 4294960551;
    goto LABEL_26;
  }
  v4 = DerivedStorage;
  Value = CFDictionaryGetValue(a2, CFSTR("params"));
  if (!Value)
  {
    APSLogErrorAt();
    v12 = 4294895345;
    goto LABEL_26;
  }
  v6 = Value;
  v7 = (__CFString *)CFDictionaryGetValue(a2, CFSTR("mergePolicy"));
  if (v7)
    v9 = v7;
  else
    v9 = CFSTR("update");
  v10 = gLogCategory_APReceiverRequestProcessorAirPlay;
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 30)
  {
    if (gLogCategory_APReceiverRequestProcessorAirPlay != -1)
    {
LABEL_8:
      if (v10 == -1 && !_LogCategory_Initialize())
        goto LABEL_21;
      goto LABEL_14;
    }
    v11 = _LogCategory_Initialize();
    v10 = gLogCategory_APReceiverRequestProcessorAirPlay;
    if (v11)
    {
      if (gLogCategory_APReceiverRequestProcessorAirPlay > 30)
        goto LABEL_21;
      goto LABEL_8;
    }
  }
  if (v10 > 50)
    goto LABEL_21;
  if (v10 == -1)
  {
    if (!_LogCategory_Initialize())
      goto LABEL_21;
    v10 = gLogCategory_APReceiverRequestProcessorAirPlay;
    if (gLogCategory_APReceiverRequestProcessorAirPlay > 50)
      goto LABEL_21;
  }
  if (v10 == -1 && !_LogCategory_Initialize())
    goto LABEL_21;
LABEL_14:
  LogPrintF();
LABEL_21:
  v12 = AirPlayReceiverSessionSetProperty(*(_QWORD *)(v4 + 32), v8, CFSTR("mrNowPlayingInfo"), v9, v6);
  if (!(_DWORD)v12)
    return v12;
  APSLogErrorAt();
LABEL_26:
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v12;
}

uint64_t airplayReqProcessor_processUpdateMRExtendedMetadata(uint64_t a1, const __CFDictionary *a2, const void *a3, const void *a4)
{
  uint64_t DerivedStorage;
  uint64_t v8;
  const void *Value;
  int v10;
  uint64_t v11;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3)
  {
    if (a4)
    {
      v8 = DerivedStorage;
      Value = CFDictionaryGetValue(a2, a3);
      if (Value)
      {
        v11 = AirPlayReceiverSessionSetProperty(*(_QWORD *)(v8 + 32), v10, a4, 0, Value);
        if (!(_DWORD)v11)
          return v11;
      }
      else
      {
        v11 = 4294895345;
      }
    }
    else
    {
      v11 = 4294895345;
    }
  }
  else
  {
    v11 = 4294895345;
  }
  APSLogErrorAt();
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 90
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v11;
}

uint64_t airplayReqProcessor_preparePlistResponse(const void *a1, CFMutableDictionaryRef *a2)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  const __CFData *Data;
  const __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFData *v10;

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895345;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    return 4294895346;
  }
  v5 = Mutable;
  Data = CFPropertyListCreateData(0, a1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    v9 = 4294895344;
    APSLogErrorAt();
LABEL_14:
    v10 = v5;
    goto LABEL_7;
  }
  v7 = Data;
  CFDataGetBytePtr(Data);
  CFDataGetLength(v7);
  v8 = CFDictionarySetData();
  if ((_DWORD)v8)
  {
    v9 = v8;
    goto LABEL_13;
  }
  v9 = CFDictionarySetCString();
  if ((_DWORD)v9)
  {
LABEL_13:
    APSLogErrorAt();
    CFRelease(v7);
    goto LABEL_14;
  }
  *a2 = v5;
  v10 = v7;
LABEL_7:
  CFRelease(v10);
  return v9;
}

__CFDictionary *airplayReqProcessor_createPairingParamsDict(int a1, int a2, int a3, int a4, void *a5)
{
  __CFDictionary *Mutable;
  __CFDictionary *v11;
  void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  CFDictionaryRef v18;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v11 = Mutable;
  v12 = (void *)*MEMORY[0x24BDBD270];
  v13 = (const void *)*MEMORY[0x24BDBD268];
  if (a1)
    v14 = (const void *)*MEMORY[0x24BDBD270];
  else
    v14 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, CFSTR("useAccountOwnerPairing"), v14);
  if (a2)
    v15 = v12;
  else
    v15 = v13;
  CFDictionarySetValue(v11, CFSTR("useHomeKitPairing"), v15);
  if (a3)
    v16 = v12;
  else
    v16 = v13;
  CFDictionarySetValue(v11, CFSTR("useSystemPairing"), v16);
  if (a4)
    v17 = v12;
  else
    v17 = v13;
  CFDictionarySetValue(v11, CFSTR("useTransientPairing"), v17);
  if (a5)
  {
    values = v12;
    keys[0] = a5;
    v18 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(v11, CFSTR("ACL"), v18);
    CFRelease(v18);
  }
  return v11;
}

uint64_t airplayReqProcessor_createEncryptionContext(uint64_t a1, CFMutableDictionaryRef *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, const char *, uint64_t, const char *, uint64_t, uint64_t, _BYTE *);
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, const char *, uint64_t, const char *, uint64_t, uint64_t, _BYTE *);
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t j;
  _BYTE v16[32];
  _BYTE v17[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(_QWORD *)(DerivedStorage + 400);
  v5 = *(uint64_t (**)(uint64_t, const char *, uint64_t, const char *, uint64_t, uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v5)
  {
    v12 = 4294954514;
    goto LABEL_12;
  }
  v6 = v5(v4, "Control-Salt", 12, "Control-Read-Encryption-Key", 27, 32, v17);
  if ((_DWORD)v6)
  {
    v12 = v6;
    goto LABEL_12;
  }
  v7 = *(_QWORD *)(DerivedStorage + 400);
  v8 = *(uint64_t (**)(uint64_t, const char *, uint64_t, const char *, uint64_t, uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v8)
  {
    v12 = 4294954514;
LABEL_12:
    APSLogErrorAt();
    goto LABEL_13;
  }
  v9 = v8(v7, "Control-Salt", 12, "Control-Write-Encryption-Key", 28, 32, v16);
  if ((_DWORD)v9)
  {
    v12 = v9;
    goto LABEL_12;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v12 = 4294895346;
    goto LABEL_14;
  }
  v11 = CFDictionarySetData();
  if ((_DWORD)v11)
  {
    v12 = v11;
    goto LABEL_23;
  }
  v12 = CFDictionarySetData();
  if ((_DWORD)v12)
  {
LABEL_23:
    APSLogErrorAt();
    goto LABEL_14;
  }
  *a2 = Mutable;
LABEL_13:
  Mutable = 0;
LABEL_14:
  for (i = 0; i != 32; ++i)
    v17[i] = 0;
  for (j = 0; j != 32; ++j)
    v16[j] = 0;
  if (Mutable)
    CFRelease(Mutable);
  return v12;
}

uint64_t airplayReqProcessor_prepareBinaryDataResponse(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, CFMutableDictionaryRef *a5)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    return 4294895346;
  }
  v10 = Mutable;
  if (a2)
  {
    if (a3)
    {
      v11 = CFDictionarySetData();
      if ((_DWORD)v11)
      {
        v13 = v11;
        goto LABEL_13;
      }
    }
  }
  v12 = CFDictionarySetCString();
  if ((_DWORD)v12)
  {
    v13 = v12;
LABEL_13:
    APSLogErrorAt();
    CFRelease(v10);
    return v13;
  }
  if (a4)
    CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BE03908], a4);
  v13 = 0;
  *a5 = v10;
  return v13;
}

uint64_t airplayReqProcessor_isAllowedToConnectBasedOnACL()
{
  uint64_t DerivedStorage;
  int PropertyInt64Sync;
  BOOL v2;
  int v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
  if (CFObjectGetPropertyInt64Sync())
    v2 = PropertyInt64Sync == 1;
  else
    v2 = 0;
  v3 = v2;
  if ((PropertyInt64Sync != 2 || *(_BYTE *)(DerivedStorage + 412)) && (!v3 || *(_BYTE *)(DerivedStorage + 411)))
    return 1;
  APSLogErrorAt();
  return 0;
}

uint64_t airplayReqProcessor_copyPasscodeForPairingType(uint64_t a1, uint64_t a2, int a3, const __CFString **a4)
{
  uint64_t *v5;
  const __CFString *v6;
  uint64_t result;
  unsigned int v8;

  v5 = (uint64_t *)MEMORY[0x24BDBD270];
  v6 = CFSTR("3939");
  if ((int)a2 > 4)
  {
    if ((a2 - 1001) >= 2)
    {
      if ((_DWORD)a2 != 5)
        goto LABEL_10;
      v5 = (uint64_t *)MEMORY[0x24BDBD268];
    }
  }
  else if ((a2 - 1) >= 3)
  {
    if ((_DWORD)a2 != 4)
      goto LABEL_10;
    if ((a3 & 0xFFFFFFFE) != 2)
    {
      v6 = CFSTR("3939");
      goto LABEL_10;
    }
  }
  v8 = 0;
  v6 = (const __CFString *)APReceiverSystemInfoCopyProperty(a1, a2, (uint64_t)CFSTR("Passcode"), *v5, &v8);
  if (v8)
  {
    APSLogErrorAt();
    return v8;
  }
LABEL_10:
  result = 0;
  *a4 = v6;
  return result;
}

uint64_t airplayReqProcessor_displayPINIfNeeded(const void *a1, const __CFString *a2, int a3)
{
  uint64_t DerivedStorage;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, char *, uint64_t, uint64_t);
  uint64_t v11;
  char buffer[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)buffer = 0u;
  v14 = 0u;
  if (a3 == 2)
    return 0;
  v7 = DerivedStorage;
  if (!APReceiverSessionManagerCanHijack(*(_QWORD *)(DerivedStorage + 432), a1))
  {
    APSLogErrorAt();
    return 4294960575;
  }
  if (!*(_QWORD *)(v7 + 8))
  {
    if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
      && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 0;
  }
  CFStringGetCString(a2, buffer, 256, 0x8000100u);
  v8 = *(_QWORD *)(v7 + 8);
  v9 = *(_QWORD *)(v7 + 120);
  v10 = *(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10)
  {
    v11 = 4294954514;
LABEL_11:
    APSLogErrorAt();
    return v11;
  }
  v11 = v10(v8, buffer, v9, v7 + 134);
  if ((_DWORD)v11)
    goto LABEL_11;
  return v11;
}

uint64_t airplayReqProcessor_createSessionInfoDict(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  const __CFAllocator *v7;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  void *value[34];

  value[33] = *(void **)MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  value[0] = 0;
  if (a3)
  {
    v6 = DerivedStorage;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a2);
    if (MutableCopy)
    {
      v9 = MutableCopy;
      if (!*(_QWORD *)(v6 + 32) || APSIsAPMSpeaker() || *(_BYTE *)(v6 + 440))
        goto LABEL_8;
      v10 = APReceiverSystemInfoCopyDisplaysInfoForUserVersion(*(_QWORD *)(*(_QWORD *)v6 + 160), v7, *(_DWORD *)(v6 + 444), (__CFArray **)value);
      if (!(_DWORD)v10)
      {
        CFDictionarySetValue(v9, CFSTR("displays"), value[0]);
LABEL_8:
        HardwareAddressToCString();
        CFDictionarySetCString();
        SockAddrToString();
        CFDictionarySetCString();
        v11 = 0;
        *a3 = v9;
        goto LABEL_9;
      }
      v11 = v10;
      APSLogErrorAt();
      CFRelease(v9);
    }
    else
    {
      APSLogErrorAt();
      v11 = 4294895346;
    }
  }
  else
  {
    v11 = 4294895345;
    APSLogErrorAt();
  }
LABEL_9:
  if (value[0])
    CFRelease(value[0]);
  return v11;
}

uint64_t airplayReqProcessor_requestCreateSession(uint64_t a1, char a2, char a3, char a4, char a5, char a6, uint64_t a7)
{
  uint64_t DerivedStorage;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  const void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t Instance;
  uint64_t v24;
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFAllocator *v30;
  const void *v31;
  CFTypeRef v32;
  uint64_t v33;
  void (*v34)(uint64_t, const __CFString *, const __CFAllocator *, uint64_t);
  int PropertyInt64Sync;
  int v36;
  uint64_t v37;
  uint64_t v38;
  AirPlayReceiverContext *v39;
  AirPlayReceiverContext *v40;
  float v41;
  CFStringRef v42;
  AirPlayReceiverMediaRemoteHelper *v43;
  void *v44;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, CFMutableDictionaryRef, CFTypeRef *);
  int v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, const __CFString *, _QWORD);
  int v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, _QWORD);
  CFMutableDictionaryRef v55;
  CFMutableDictionaryRef v56;
  CFMutableSetRef v57;
  uint64_t v58;
  int v60;
  unsigned int v61;
  CFTypeRef v62;
  unsigned int v63;
  _QWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CFTypeRef cf[2];
  __int128 v71;
  __int128 v72;
  _OWORD cStr[8];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_QWORD *)(DerivedStorage + 32))
  {
    v15 = DerivedStorage;
    v72 = 0u;
    v71 = 0u;
    v69 = 0u;
    *(_OWORD *)cf = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v16 = *(_QWORD **)DerivedStorage;
    v64 = *(_QWORD **)DerivedStorage;
    v17 = *(_DWORD *)(DerivedStorage + 24);
    *((_QWORD *)&v65 + 1) = DerivedStorage + 304;
    *(_QWORD *)&v66 = DerivedStorage + 276;
    v18 = *(_QWORD *)(DerivedStorage + 264);
    *((_QWORD *)&v66 + 1) = *(_QWORD *)(DerivedStorage + 120);
    *((_QWORD *)&v67 + 1) = v18;
    LODWORD(v68) = *(_DWORD *)(DerivedStorage + 272);
    *(_QWORD *)&v71 = *(_QWORD *)(DerivedStorage + 424);
    v19 = 1;
    LODWORD(v65) = v17;
    if (v17 != 4 && v17 != 64)
      v19 = v17 == 128;
    BYTE5(v69) = v19;
    BYTE6(v69) = a2;
    v20 = *(const void **)(DerivedStorage + 432);
    *((_QWORD *)&v69 + 1) = a1;
    cf[0] = v20;
    cf[1] = *(CFTypeRef *)(DerivedStorage + 8);
    *(_QWORD *)&v72 = a7;
    BYTE9(v71) = a3;
    BYTE8(v71) = a4;
    BYTE10(v71) = a5;
    BYTE11(v71) = a6;
    DWORD2(v72) = *(_DWORD *)(*(_QWORD *)(DerivedStorage + 16) + 136);
    LODWORD(v67) = *(_DWORD *)(DerivedStorage + 128);
    WORD2(v67) = *(_WORD *)(DerivedStorage + 132);
    strncpy((char *)&v68 + 4, (const char *)(DerivedStorage + 332), 0x11uLL);
    v21 = v16[11];
    v22 = mach_absolute_time();
    if (gAirPlayReceiverSessionInitOnce != -1)
      dispatch_once_f(&gAirPlayReceiverSessionInitOnce, 0, (dispatch_function_t)_GetTypeID_5264);
    Instance = _CFRuntimeCreateInstance();
    if (!Instance)
    {
      APSLogErrorAt();
      v58 = 4294960568;
      _Cleanup(0, 4294960568);
      goto LABEL_78;
    }
    v24 = Instance;
    bzero((void *)(Instance + 24), 0x2D0uLL);
    *(_QWORD *)(v24 + 16) = v21;
    dispatch_retain(v21);
    CFRetain(v16);
    *(_QWORD *)(v24 + 24) = v16;
    *(_QWORD *)(v24 + 32) = *((_QWORD *)&v69 + 1);
    *(_DWORD *)(v24 + 192) = v65;
    v25 = (__int128 *)v66;
    v26 = *(_OWORD *)(*((_QWORD *)&v65 + 1) + 12);
    *(_OWORD *)(v24 + 196) = **((_OWORD **)&v65 + 1);
    *(_OWORD *)(v24 + 208) = v26;
    v27 = *v25;
    *(_OWORD *)(v24 + 236) = *(__int128 *)((char *)v25 + 12);
    *(_OWORD *)(v24 + 224) = v27;
    UUIDGet();
    *(_DWORD *)(v24 + 268) = -6718;
    v28 = *((_QWORD *)&v67 + 1);
    *(_QWORD *)(v24 + 272) = *((_QWORD *)&v66 + 1);
    *(_QWORD *)(v24 + 328) = v28;
    *(_DWORD *)(v24 + 336) = v68;
    *(CFTypeRef *)(v24 + 40) = cf[0];
    *(_WORD *)(v24 + 658) = WORD4(v71);
    *(_BYTE *)(v24 + 657) = BYTE10(v71);
    *(_BYTE *)(v24 + 660) = BYTE11(v71);
    if ((_QWORD)v72)
      v29 = (const __CFString *)v72;
    else
      v29 = CFSTR("NTP");
    *(_QWORD *)(v24 + 648) = CFRetain(v29);
    *(_DWORD *)(v24 + 280) = v67;
    *(_WORD *)(v24 + 284) = WORD2(v67);
    __strlcpy_chk();
    *(_BYTE *)(v24 + 424) = BYTE5(v69);
    *(_QWORD *)(v24 + 344) = v22;
    *(_BYTE *)(v24 + 457) = BYTE6(v69);
    *(_DWORD *)(v24 + 476) = -1;
    *(_DWORD *)(v24 + 484) = DWORD2(v72);
    v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    *(_QWORD *)(v24 + 568) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v31 = (const void *)v16[28];
    *(_QWORD *)(v24 + 592) = v31;
    if (v31)
      CFRetain(v31);
    v32 = cf[1];
    *(CFTypeRef *)(v24 + 600) = cf[1];
    if (v32)
    {
      CFRetain(v32);
      v33 = *(_QWORD *)(v24 + 600);
      if (v33)
      {
        if (!*(_QWORD *)(v24 + 592))
        {
          v34 = *(void (**)(uint64_t, const __CFString *, const __CFAllocator *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
          if (v34)
            v34(v33, CFSTR("SBufConsumer"), v30, v24 + 592);
        }
      }
    }
    PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
    if (PropertyInt64Sync >= 1)
      v36 = PropertyInt64Sync;
    else
      v36 = 30;
    *(_BYTE *)(v24 + 560) = CFObjectGetPropertyInt64Sync() != 0;
    *(_BYTE *)(v24 + 730) = APSSettingsIsFeatureEnabled();
    v37 = UpTicksPerSecond();
    *(_DWORD *)(v24 + 556) = v36;
    *(_DWORD *)(v24 + 552) = v36;
    *(_QWORD *)(v24 + 512) = v22;
    *(_QWORD *)(v24 + 520) = v37 * v36;
    *(_QWORD *)(v24 + 528) = v22;
    *(_QWORD *)(v24 + 544) = 10 * v37;
    if (*(_BYTE *)(v24 + 659))
    {
      APSSettingsGetInt64();
      APSSettingsGetInt64();
      APSSettingsGetInt64();
      SocketSetKeepAliveEx();
      goto LABEL_61;
    }
    v63 = 0;
    v38 = *(_QWORD *)(*(_QWORD *)(v24 + 24) + 16);
    v39 = objc_alloc_init(AirPlayReceiverContext);
    if (v39)
    {
      v40 = v39;
      v39->_session = (AirPlayReceiverSessionPrivate *)v24;
      v39->_queue = *(OS_dispatch_queue **)(v24 + 16);
      CFObjectGetPropertyDoubleSync();
      APSVolumeConvertDBToClampedSliderValue();
      v40->_state.outputVolume = v41;
      *(float *)(v24 + 688) = v41;
      *(_QWORD *)(v24 + 48) = v40;
      if (*(_BYTE *)(v38 + 152))
      {
        memset(cStr, 0, sizeof(cStr));
        UUIDtoCString();
        v42 = CFStringCreateWithCString(v30, (const char *)cStr, 0x8000100u);
        if (!v42)
          goto LABEL_85;
        v43 = -[AirPlayReceiverMediaRemoteHelper initWithPlayerID:withSystemInfo:withReceiverServer:]([AirPlayReceiverMediaRemoteHelper alloc], "initWithPlayerID:withSystemInfo:withReceiverServer:", v42, *(_QWORD *)(*(_QWORD *)(v24 + 24) + 160));
        v40->_mediaRemoteHelper = v43;
        if (!v43)
          goto LABEL_85;
        -[AirPlayReceiverMediaRemoteHelper makeNowPlayingPlayer](v43, "makeNowPlayingPlayer");
LABEL_31:
        if (!*(_BYTE *)(*(_QWORD *)(v24 + 24) + 249) || !*(_QWORD *)(v24 + 600) || v40->_receiverUIStarted)
          goto LABEL_47;
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (Mutable)
        {
          v46 = Mutable;
          CFDictionarySetNumber();
          v62 = 0;
          v47 = *(_QWORD *)(v24 + 600);
          v48 = *(uint64_t (**)(uint64_t, CFMutableDictionaryRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 72);
          if (v48)
            v49 = v48(v47, v46, &v62);
          else
            v49 = -12782;
          v63 = v49;
          CFRelease(v46);
          if (v63)
            goto LABEL_57;
          cStr[0] = *(_OWORD *)(v24 + 196);
          *(_OWORD *)((char *)cStr + 12) = *(_OWORD *)(v24 + 208);
          APSNetworkAddressCreateWithSocketAddr();
          v50 = *(_QWORD *)(v24 + 600);
          v51 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 56);
          if (v51)
            v52 = v51(v50, CFSTR("SessionReceiverAddress"), 0);
          else
            v52 = -12782;
          v63 = v52;
          if (v52)
          {
            APSLogErrorAt();
            goto LABEL_57;
          }
          if (v62)
          {
            v40->_receiverUISessionID = CFDictionaryGetInt64();
            CFRelease(v62);
          }
          else
          {
            v40->_receiverUISessionID = 0;
          }
          v40->_receiverUIStarted = 1;
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterAddListener();
LABEL_47:
          v63 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.airplay.audio"), &v40->_powerAssertion);
          if (gLogCategory_AirPlayReceiverPlatform <= 40
            && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v63 = 0;
          dispatch_time(0, 5000000000);
          v63 = APSAudioIOAssertionUntilTime();
          if (v63)
          {
            if (gLogCategory_AirPlayReceiverPlatform <= 50
              && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v63 = 0;
          }
LABEL_57:
          if (v42)
            CFRelease(v42);
          if (!v63)
            goto LABEL_61;
          goto LABEL_60;
        }
LABEL_85:
        APSLogErrorAt();
        v63 = -6728;
        goto LABEL_57;
      }
      v44 = *(void **)(v38 + 160);
      if (v44)
      {
        v42 = 0;
        v40->_mediaRemoteHelper = (AirPlayReceiverMediaRemoteHelper *)v44;
        goto LABEL_31;
      }
      APSLogErrorAt();
      v60 = -6709;
    }
    else
    {
      APSLogErrorAt();
      v60 = -6728;
    }
    v63 = v60;
LABEL_60:
    _AirPlayReceiverSessionPlatformInvalidate((_QWORD *)v24);
    v53 = v63;
    v61 = v63;
    if (v63)
    {
      APSLogErrorAt();
LABEL_80:
      _Cleanup(v24, v53);
      CFRelease((CFTypeRef)v24);
      v58 = v61;
      if (!v61)
      {
LABEL_71:
        if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
          && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        return 0;
      }
LABEL_78:
      APSLogErrorAt();
      return v58;
    }
LABEL_61:
    v54 = *(uint64_t (**)(uint64_t, _QWORD))(v24 + 72);
    if (v54 && (v61 = v54(v24, *(_QWORD *)(v24 + 56))) != 0)
    {
      APSLogErrorAt();
      v53 = v61;
    }
    else
    {
      *(_QWORD *)(v24 + 664) = 0;
      v55 = CFDictionaryCreateMutable(v30, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      *(_QWORD *)(v24 + 672) = v55;
      if (v55)
      {
        v56 = CFDictionaryCreateMutable(v30, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *(_QWORD *)(v24 + 712) = v56;
        if (v56)
        {
          v57 = CFSetCreateMutable(v30, 0, MEMORY[0x24BDBD6B8]);
          *(_QWORD *)(v24 + 720) = v57;
          if (v57)
          {
            if (gLogCategory_AirPlayReceiverCore <= 30
              && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            *(_QWORD *)(v15 + 32) = v24;
            goto LABEL_71;
          }
        }
      }
      APSLogErrorAt();
      v53 = 4294960568;
      v61 = -6728;
    }
    goto LABEL_80;
  }
  return 0;
}

void airplayReqProcessor_copyParentGroupInfoFromSetupRequest(uint64_t a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t Int64;
  uint64_t v5;
  const void *TypedValue;
  __CFDictionary *Mutable;
  __CFDictionary *v8;

  Int64 = CFDictionaryGetInt64();
  v5 = CFDictionaryGetInt64();
  CFStringGetTypeID();
  TypedValue = (const void *)CFDictionaryGetTypedValue();
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64 && v5 && TypedValue)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v8 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("groupUUID"), TypedValue);
      FigCFDictionarySetValueFromKeyInDict();
      CFDictionarySetValue(v8, CFSTR("senderSupportsRelay"), (const void *)*MEMORY[0x24BDBD270]);
      *a3 = v8;
    }
    else
    {
      APSLogErrorAt();
    }
  }
}

uint64_t APReceiverRequestProcessorHijackAndBecomeMainSession(const void *a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 40) == 2)
  {
    v3 = DerivedStorage;
    APReceiverSessionManagerSetAsMainAirPlaySession(*(_QWORD *)(DerivedStorage + 432), a1);
    APReceiverSessionManagerHijack(*(_QWORD *)(v3 + 432), a1);
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294895346;
  }
}

void APReceiverRequestProcessorSendSystemInfoUpdate(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  void *value;

  v4 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 32);
  value = 0;
  if (!v4)
  {
    APSLogErrorAt();
    return;
  }
  if (a2)
  {
    if (*(_DWORD *)(v4 + 336) < 0x37C684u)
    {
      v6 = 0;
      goto LABEL_9;
    }
    if (!airplayReqProcessor_createSessionInfoDict(a1, a2, (__CFDictionary **)&value))
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v6 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("updateInfo"));
        CFDictionarySetValue(v6, CFSTR("value"), value);
        if (AirPlayReceiverSessionSendCommandForObject(v4, 0, v6, 0, 0))
        {
          APSLogErrorAt();
LABEL_14:
          CFRelease(v6);
          goto LABEL_15;
        }
LABEL_9:
        if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
          && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!v6)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
  }
  APSLogErrorAt();
LABEL_15:
  if (value)
    CFRelease(value);
}

uint64_t APReceiverRequestProcessorSetProperty_3749(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 4294954514;
}

uint64_t airplayReqProcessor_tearDownMCRPDictionaryEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!a2)
    return APSLogErrorAt();
  if (!a3)
    return APSLogErrorAt();
  result = airplayReqProcessor_tearDownMediaControlRequestProcessor(a3, a2);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

uint64_t airplayReqProcessor_tearDownMediaControlRequestProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD);
  uint64_t v6;
  const char *v7;
  CFStringRef v8;
  unsigned int v10;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    APSLogErrorAt();
    return -71951;
  }
  v4 = DerivedStorage;
  CFObjectGetBytes();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v5)
  {
    v10 = -12782;
    goto LABEL_8;
  }
  v10 = v5(a2, 0, 0);
  if (v10)
  {
LABEL_8:
    APSLogErrorAt();
    return v10;
  }
  v6 = *(_QWORD *)v4;
  if (*(_QWORD *)(*(_QWORD *)v4 + 192))
  {
    v7 = (const char *)UUIDtoCString();
    v8 = CFStringCreateWithCString(0, v7, 0x8000100u);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v6 + 192), v8);
    if (v8)
      CFRelease(v8);
  }
  return v10;
}

void airplayReqProcessor_Finalize(void *a1)
{
  uint64_t DerivedStorage;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 30
    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  airplayReqProcessor_Stop(a1, 0, 0);
  v3 = *(const void **)(DerivedStorage + 448);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(DerivedStorage + 448) = 0;
  }
  v4 = *(const void **)(DerivedStorage + 456);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(DerivedStorage + 456) = 0;
  }
  v5 = *(const void **)(DerivedStorage + 400);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(DerivedStorage + 400) = 0;
  }
  v6 = *(const void **)(DerivedStorage + 104);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(DerivedStorage + 104) = 0;
  }
  if (*(_QWORD *)(DerivedStorage + 384))
  {
    IPaI1oem5iL();
    *(_QWORD *)(DerivedStorage + 384) = 0;
  }
  *(_BYTE *)(DerivedStorage + 392) = 0;
  v7 = *(const void **)(DerivedStorage + 8);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(DerivedStorage + 8) = 0;
  }
}

CFStringRef airplayReqProcessor_CopyDebugDescription(const void *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<APReceiverRequestProcessorAirPlay %p>"), a1);
}

const void *APReceiverRequestProcessorCopyReceiverSession()
{
  uint64_t DerivedStorage;
  const void *result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  result = *(const void **)(DerivedStorage + 32);
  if (result)
  {
    CFRetain(result);
    return *(const void **)(DerivedStorage + 32);
  }
  return result;
}

uint64_t _AirTunesClock_RegisterClass()
{
  uint64_t result;

  gAirTunesClockClass = 0;
  unk_2553CE910 = "AirTunesClock";
  qword_2553CE918 = (uint64_t)_AirTunesClock_Init;
  unk_2553CE920 = 0;
  qword_2553CE928 = (uint64_t)_AirTunesClock_Finalize;
  unk_2553CE930 = 0;
  qword_2553CE938 = 0;
  unk_2553CE940 = 0;
  qword_2553CE948 = (uint64_t)_AirTunesClock_CopyDebugDescription;
  result = _CFRuntimeRegisterClass();
  gAirTunesClockTypeID = result;
  return result;
}

double _AirTunesClock_Init(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 224) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

pthread_mutex_t *_AirTunesClock_Finalize(uint64_t a1)
{
  pthread_mutex_t *result;

  *(_BYTE *)(a1 + 224) = 0;
  if (*(_QWORD *)(a1 + 144))
  {
    pthread_join(*(pthread_t *)(a1 + 136), 0);
    *(_QWORD *)(a1 + 144) = 0;
  }
  result = *(pthread_mutex_t **)(a1 + 216);
  if (result)
  {
    result = (pthread_mutex_t *)pthread_mutex_destroy(result);
    *(_QWORD *)(a1 + 216) = 0;
  }
  return result;
}

CFStringRef _AirTunesClock_CopyDebugDescription(const void *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<AirTunesClock %p>"), a1);
}

uint64_t _AirTunesClock_Thread(uint64_t a1)
{
  pthread_setname_np("AirPlayClock");
  while (*(_BYTE *)(a1 + 224))
  {
    _AirTunesClock_Tick(a1);
    usleep(0x2710u);
  }
  return 0;
}

uint64_t _AirTunesClock_Tick(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 216));
  v2 = mach_absolute_time();
  v3 = (v2 - *(_DWORD *)(a1 + 80));
  *(_DWORD *)(a1 + 80) = v2;
  v4 = *(_QWORD *)(a1 + 72) * v3;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_DWORD *)(a1 + 32);
  v7 = __CFADD__(v5, v4);
  v8 = v5 + v4;
  *(_QWORD *)(a1 + 40) = v8;
  if (v7)
    *(_DWORD *)(a1 + 32) = ++v6;
  v9 = *(_DWORD *)(a1 + 36);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = v10 + v8;
  v12 = v6 + __CFADD__(v10, v8) + *(_DWORD *)(a1 + 16);
  if (v12 > *(_DWORD *)(a1 + 48))
  {
    v13 = *(_QWORD *)(a1 + 104);
    v14 = *(_QWORD *)(a1 + 112);
    if (v13 < 0)
      v15 = -(-v13 >> 4);
    else
      v15 = (unint64_t)v13 >> 4;
    *(_QWORD *)(a1 + 104) = v13 - v15;
    v17 = v14 + v15;
    v16 = (v14 + v15 < 0) ^ __OFADD__(v14, v15);
    *(_QWORD *)(a1 + 120) = v14 + v15;
    *(_QWORD *)(a1 + 88) = v14 + v15;
    v18 = v14 + v15 + 1023;
    if (v16)
      v17 = v18;
    *(_QWORD *)(a1 + 72) = 2 * (((2199 * (v17 >> 10)) ^ 0x8000000000000000) / *(_QWORD *)(a1 + 64));
    if (gLogCategory_AirTunesClock <= 10
      && (gLogCategory_AirTunesClock != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  *(_DWORD *)(a1 + 128) = v12;
  *(_DWORD *)(a1 + 48) = v12;
  *(_DWORD *)(a1 + 52) = v9;
  *(_QWORD *)(a1 + 56) = v11;
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 216));
}

uint64_t AirTunesClock_Adjust(uint64_t a1, unint64_t a2, int a3)
{
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  if (gLogCategory_AirTunesClock <= 10 && (gLogCategory_AirTunesClock != -1 || _LogCategory_Initialize()))
    LogPrintF();
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 216));
  if (!a3 && a2 - 100000001 > 0xFFFFFFFFF4143DFELL)
  {
    v6 = *(_DWORD *)(a1 + 100);
    v7 = *(_DWORD *)(a1 + 128);
    if (v6)
      v8 = v7 - v6;
    else
      v8 = 0;
    v9 = (unint64_t)a2 << 20;
    if ((a2 & 0x80000000) != 0)
      v9 = -((uint64_t)(0xFFFFFFFF00000000 * a2) >> 12);
    v10 = *(_QWORD *)(a1 + 112) + v9 * v8;
    *(_QWORD *)(a1 + 104) = a2 << 32;
    *(_QWORD *)(a1 + 112) = v10;
    *(_DWORD *)(a1 + 96) = a2;
    *(_DWORD *)(a1 + 100) = v7;
    if (v10 < 0)
      v11 = -(-v10 >> 32);
    else
      v11 = HIDWORD(v10);
    if (v11 <= 500000)
    {
      if (v10 > (uint64_t)0xFFF85EDF00000000)
      {
LABEL_22:
        pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 216));
        return 0;
      }
      v12 = 0xFFF85EE000000000;
    }
    else
    {
      v12 = 0x7A12000000000;
    }
    *(_QWORD *)(a1 + 112) = v12;
    goto LABEL_22;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    v17 = -(uint64_t)a2 / 0x3B9ACA00uLL;
    v18 = 0x44B82FA09 * (-1000000000 * v17 - a2);
    v19 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v19 - v18;
    v15 = *(_DWORD *)(a1 + 16) - (v19 < v18) - v17;
  }
  else
  {
    v13 = 0x44B82FA09 * (a2 % 0x3B9ACA00);
    v14 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v14 + v13;
    v15 = *(_DWORD *)(a1 + 16) + __CFADD__(v14, v13) + (a2 / 0x3B9ACA00);
  }
  *(_DWORD *)(a1 + 16) = v15;
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 216));
  _AirTunesClock_Tick(a1);
  return 1;
}

uint64_t AirTunesClock_GetSynchronizedTime(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 216));
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = v4 * (mach_absolute_time() - *(_DWORD *)(a1 + 80));
  v6 = *((_QWORD *)a2 + 1);
  v7 = *a2;
  v8 = __CFADD__(v5, v6);
  v9 = v5 + v6;
  *((_QWORD *)a2 + 1) = v9;
  if (v8)
    *a2 = ++v7;
  v10 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)a2 + 1) = v10 + v9;
  if (__CFADD__(v10, v9))
    *a2 = ++v7;
  *a2 = v7 + *(_DWORD *)(a1 + 16);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 216));
}

uint64_t AirTunesClock_GetSynchronizedTimeNearUpTicks(uint64_t a1, int *a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 216));
  v6 = mach_absolute_time();
  v7 = v6;
  if (v6 >= a3)
    v8 = v6 - a3;
  else
    v8 = a3 - v6;
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = v9 * (v6 - *(_DWORD *)(a1 + 80));
  v11 = *((_QWORD *)a2 + 1);
  v12 = *a2;
  v13 = __CFADD__(v10, v11);
  v14 = v10 + v11;
  *((_QWORD *)a2 + 1) = v14;
  if (v13)
    *a2 = ++v12;
  v15 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)a2 + 1) = v15 + v14;
  if (__CFADD__(v15, v14))
    *a2 = ++v12;
  *a2 = v12 + *(_DWORD *)(a1 + 16);
  result = pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 216));
  v17 = *(_QWORD *)(a1 + 64);
  v18 = v8 / v17;
  v19 = v8 % v17 * v9;
  v20 = *((_QWORD *)a2 + 1);
  v21 = v20 - v19;
  v22 = *a2 - (v20 < v19) - v18;
  v13 = __CFADD__(v20, v19);
  v23 = v20 + v19;
  v24 = *a2 + v13 + (_DWORD)v18;
  if (v7 >= a3)
  {
    v23 = v21;
    v24 = v22;
  }
  *((_QWORD *)a2 + 1) = v23;
  *a2 = v24;
  return result;
}

uint64_t APAdvertiserInfoGetTypeID()
{
  if (APAdvertiserInfoGetTypeID_initOnce != -1)
    dispatch_once_f(&APAdvertiserInfoGetTypeID_initOnce, &APAdvertiserInfoGetTypeID_typeID, (dispatch_function_t)_APAdvertiserInfoClassRegister);
  return APAdvertiserInfoGetTypeID_typeID;
}

uint64_t _APAdvertiserInfoClassRegister(uint64_t *a1)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  *a1 = result;
  return result;
}

uint64_t APAdvertiserInfoFinalize(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 80);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 80) = 0;
  }
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

uint64_t _APAdvertiserInfoCompare(uint64_t a1, uint64_t a2)
{
  if (a1 | a2)
  {
    if (a1 && a2)
    {
      return CFEqual(*(CFTypeRef *)(a1 + 80), *(CFTypeRef *)(a2 + 80));
    }
    else
    {
      APSLogErrorAt();
      return 0;
    }
  }
  else
  {
    APSLogErrorAt();
    return 1;
  }
}

CFStringRef APAdvertiserInfoCopyDescription(uint64_t a1)
{
  pthread_mutex_t *v2;
  CFStringRef v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = CFCopyDescription(*(CFTypeRef *)(a1 + 80));
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t APAdvertiserInfoCreate(uint64_t a1, _QWORD *a2)
{
  uint64_t Instance;
  const void *v4;
  pthread_mutex_t *v5;
  uint64_t v6;

  if (APAdvertiserInfoGetTypeID_initOnce != -1)
    dispatch_once_f(&APAdvertiserInfoGetTypeID_initOnce, &APAdvertiserInfoGetTypeID_typeID, (dispatch_function_t)_APAdvertiserInfoClassRegister);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v4 = (const void *)Instance;
    *(_OWORD *)(Instance + 16) = 0u;
    v5 = (pthread_mutex_t *)(Instance + 16);
    *(_QWORD *)(Instance + 80) = 0;
    *(_OWORD *)(Instance + 48) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_QWORD *)(Instance + 80) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6 = pthread_mutex_init(v5, 0);
    if ((_DWORD)v6)
    {
      APSLogErrorAt();
      CFRelease(v4);
    }
    else
    {
      *a2 = v4;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960568;
  }
  return v6;
}

uint64_t APAdvertiserInfoCreateWithData(const __CFAllocator *a1, const __CFData *a2, _QWORD *a3)
{
  const __CFData *v3;
  uint64_t v6;
  _QWORD *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v11;
  CFTypeRef cf;

  v3 = a2;
  v11 = 0;
  cf = 0;
  if (!a2)
  {
    APSLogErrorAt();
LABEL_13:
    v9 = 4294960591;
    goto LABEL_17;
  }
  if (!a3)
  {
    APSLogErrorAt();
    v3 = 0;
    goto LABEL_13;
  }
  v6 = APAdvertiserInfoCreate((uint64_t)a1, &cf);
  if ((_DWORD)v6)
  {
    v9 = v6;
    APSLogErrorAt();
    v3 = 0;
  }
  else
  {
    v3 = (const __CFData *)CFPropertyListCreateWithData(a1, v3, 2uLL, (CFPropertyListFormat *)&v11, 0);
    if (v3)
    {
      if (v11 == 200)
      {
        v7 = cf;
        v8 = (const void *)*((_QWORD *)cf + 10);
        if (v8)
          CFRelease(v8);
        v9 = 0;
        v7[10] = CFRetain(v3);
        *a3 = v7;
        cf = 0;
LABEL_9:
        CFRelease(v3);
        return v9;
      }
      APSLogErrorAt();
      v9 = 4294960579;
    }
    else
    {
      APSLogErrorAt();
      v9 = 4294960534;
    }
  }
LABEL_17:
  if (cf)
    CFRelease(cf);
  if (v3)
    goto LABEL_9;
  return v9;
}

const void *APAdvertiserInfoCopyProperty(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, int *a5)
{
  const void *v6;
  pthread_mutex_t *v8;
  const void *Value;
  int v10;

  v6 = a3;
  if (!a3)
  {
    APSLogErrorAt();
    v10 = -6705;
    if (!a5)
      return v6;
    goto LABEL_6;
  }
  v8 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), v6);
  v6 = Value;
  if (Value)
  {
    CFRetain(Value);
    pthread_mutex_unlock(v8);
    v10 = 0;
    if (!a5)
      return v6;
    goto LABEL_6;
  }
  pthread_mutex_unlock(v8);
  v10 = -6727;
  if (a5)
LABEL_6:
    *a5 = v10;
  return v6;
}

uint64_t APAdvertiserInfoSetProperty(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, const void *a5)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CFTypeID v11;
  uint64_t v12;
  const __CFString *v14;
  uint64_t valuePtr;

  if (!a3 || !a5)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  v8 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (CFEqual(a3, CFSTR("featuresEx")))
  {
    v9 = _APAdvertiserInfoSetFeaturesEx(*(__CFDictionary **)(a1 + 80), a5);
  }
  else
  {
    if (!CFEqual(a3, CFSTR("features")))
    {
      if (CFEqual(a3, CFSTR("requiredSenderFeatures")))
        v14 = CFSTR("requiredSenderFeatures");
      else
        v14 = a3;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 80), v14, a5);
      v12 = 0;
      goto LABEL_9;
    }
    v10 = *(const __CFDictionary **)(a1 + 80);
    valuePtr = 0;
    v11 = CFGetTypeID(a5);
    if (v11 != CFNumberGetTypeID())
    {
      APSLogErrorAt();
      v12 = 4294960591;
      goto LABEL_9;
    }
    CFNumberGetValue((CFNumberRef)a5, kCFNumberSInt64Type, &valuePtr);
    v9 = _APAdvertiserInfoSetLegacyFeatures(v10);
  }
  v12 = v9;
LABEL_9:
  pthread_mutex_unlock(v8);
  return v12;
}

uint64_t _APAdvertiserInfoSetFeaturesEx(__CFDictionary *a1, CFTypeRef cf)
{
  CFTypeID v4;
  unsigned int v6;

  v6 = 0;
  if (cf && (v4 = CFGetTypeID(cf), v4 == CFDataGetTypeID()))
  {
    CFDictionarySetValue(a1, CFSTR("featuresEx"), cf);
    APSFeaturesGetLegacyFlags();
    CFDictionarySetInt64();
  }
  else
  {
    APSLogErrorAt();
    return -6705;
  }
  return v6;
}

uint64_t _APAdvertiserInfoSetLegacyFeatures(const __CFDictionary *a1)
{
  uint64_t MutableCopy;
  const void *v3;

  CFDictionarySetInt64();
  if (CFDictionaryGetValue(a1, CFSTR("featuresEx")))
    MutableCopy = APSFeaturesCreateMutableCopy();
  else
    MutableCopy = APSFeaturesCreateMutable();
  v3 = (const void *)MutableCopy;
  if (MutableCopy)
  {
    APSFeaturesSetLegacyFlags();
    CFDictionarySetValue(a1, CFSTR("featuresEx"), v3);
    CFRelease(v3);
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294960568;
  }
}

uint64_t APAdvertiserInfoCreateData(uint64_t a1, CFDataRef *a2)
{
  pthread_mutex_t *v4;
  const __CFAllocator *v5;
  CFDataRef Data;
  uint64_t v7;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (a2)
  {
    v5 = CFGetAllocator((CFTypeRef)a1);
    Data = CFPropertyListCreateData(v5, *(CFPropertyListRef *)(a1 + 80), kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if (Data)
    {
      v7 = 0;
      *a2 = Data;
    }
    else
    {
      APSLogErrorAt();
      v7 = 4294960534;
    }
  }
  else
  {
    APSLogErrorAt();
    v7 = 4294960591;
  }
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t APAdvertiserInfoCreateWithRAOPAndAirPlayDataAndDeviceName(uint64_t a1, const __CFData *a2, unint64_t a3, const __CFString *a4, CFMutableDictionaryRef **a5)
{
  CFMutableDictionaryRef *v9;
  CFTypeRef v10;
  uint64_t BitListValueFromTXTRecord;
  uint64_t BooleanFromTXTRecord;
  uint64_t v13;
  const void **v14;
  uint64_t v15;
  uint64_t Int64FromTXTRecord;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const void **v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  CFTypeRef v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  const void **v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const void **v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const void **v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  const void **v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  CFTypeRef cf;
  CFMutableDictionaryRef *v101;
  CFTypeRef v102;
  uint64_t v103;
  BOOL v104;
  void *value;

  cf = 0;
  v101 = 0;
  if (!a4)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  if (!((unint64_t)a2 | a3))
  {
    APSLogErrorAt();
    v13 = 4294960591;
    goto LABEL_287;
  }
  APAdvertiserInfoCreate(a1, &v101);
  v9 = v101;
  if (!v101)
  {
    APSLogErrorAt();
    v13 = 4294960568;
    goto LABEL_287;
  }
  _APAdvertiserInfoCopyAndRemoveMDNSLabelSuffix(a4, (__CFString **)&cf);
  if (cf)
    v10 = cf;
  else
    v10 = a4;
  CFDictionarySetValue(v9[10], CFSTR("deviceName"), v10);
  if (!a2)
    goto LABEL_73;
  v104 = 0;
  value = 0;
  v103 = 0;
  LODWORD(v102) = 0;
  BitListValueFromTXTRecord = APAdvertiserInfoGetBitListValueFromTXTRecord(CFSTR("cn"), a2, &v102);
  if ((_DWORD)BitListValueFromTXTRecord)
  {
    v13 = BitListValueFromTXTRecord;
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo > 40
      || gLogCategory_APAdvertiserInfo == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_70;
    }
LABEL_191:
    LogPrintF();
    goto LABEL_70;
  }
  CFDictionarySetInt64();
  BooleanFromTXTRecord = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("da"), a2, &v104);
  if ((_DWORD)BooleanFromTXTRecord != -6727)
  {
    v13 = BooleanFromTXTRecord;
    if ((_DWORD)BooleanFromTXTRecord)
      goto LABEL_69;
    v14 = (const void **)MEMORY[0x24BDBD270];
    if (!v104)
      v14 = (const void **)MEMORY[0x24BDBD268];
    CFDictionarySetValue(v9[10], CFSTR("rfc2617DigestAuthKey"), *v14);
  }
  v15 = APAdvertiserInfoGetBitListValueFromTXTRecord(CFSTR("et"), a2, &v102);
  if ((_DWORD)v15)
  {
    v13 = v15;
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo > 40
      || gLogCategory_APAdvertiserInfo == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_70;
    }
    goto LABEL_191;
  }
  CFDictionarySetInt64();
  Int64FromTXTRecord = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("ft"), a2, &v103);
  if ((_DWORD)Int64FromTXTRecord != -6727)
  {
    v13 = Int64FromTXTRecord;
    if ((_DWORD)Int64FromTXTRecord)
      goto LABEL_69;
    v17 = _APAdvertiserInfoSetLegacyFeatures(v9[10]);
    if ((_DWORD)v17)
    {
      v13 = v17;
      goto LABEL_69;
    }
  }
  v18 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("fv"), a2, (CFStringRef *)&value);
  if ((_DWORD)v18 != -6727)
  {
    v13 = v18;
    if ((_DWORD)v18)
      goto LABEL_69;
    v19 = value;
    CFDictionarySetValue(v9[10], CFSTR("firmwareVersion"), value);
    if (v19)
    {
      CFRelease(v19);
      value = 0;
    }
  }
  v20 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("sf"), a2, &v103);
  if ((_DWORD)v20 != -6727)
  {
    v13 = v20;
    if ((_DWORD)v20)
      goto LABEL_69;
    CFDictionarySetInt64();
  }
  v21 = APAdvertiserInfoGetBitListValueFromTXTRecord(CFSTR("md"), a2, &v102);
  if ((_DWORD)v21 != -6727)
  {
    v13 = v21;
    if ((_DWORD)v21)
      goto LABEL_69;
    CFDictionarySetInt64();
  }
  v22 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("am"), a2, (CFStringRef *)&value);
  if ((_DWORD)v22 != -6727)
  {
    v13 = v22;
    if ((_DWORD)v22)
      goto LABEL_69;
    v23 = value;
    CFDictionarySetValue(v9[10], CFSTR("deviceModel"), value);
    if (v23)
    {
      CFRelease(v23);
      value = 0;
    }
  }
  v24 = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("pw"), a2, &v104);
  if ((_DWORD)v24 != -6727)
  {
    v13 = v24;
    if ((_DWORD)v24)
      goto LABEL_69;
    v25 = (const void **)MEMORY[0x24BDBD270];
    if (!v104)
      v25 = (const void **)MEMORY[0x24BDBD268];
    CFDictionarySetValue(v9[10], CFSTR("password"), *v25);
  }
  v26 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pk"), a2, (CFStringRef *)&value);
  if ((_DWORD)v26 != -6727)
  {
    v13 = v26;
    if ((_DWORD)v26)
      goto LABEL_69;
    v27 = value;
    CFDictionarySetValue(v9[10], CFSTR("publicKey"), value);
    if (v27)
    {
      CFRelease(v27);
      value = 0;
    }
  }
  v28 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("tp"), a2, (CFStringRef *)&value);
  if ((_DWORD)v28)
  {
    v13 = v28;
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo > 40
      || gLogCategory_APAdvertiserInfo == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_70;
    }
    goto LABEL_191;
  }
  v29 = value;
  CFDictionarySetValue(v9[10], CFSTR("transportTypes"), value);
  if (v29)
  {
    CFRelease(v29);
    value = 0;
  }
  v30 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("vn"), a2, (CFStringRef *)&value);
  if (!(_DWORD)v30)
  {
    v31 = value;
    CFDictionarySetValue(v9[10], CFSTR("airTunesProtocolVersion"), value);
    if (v31)
    {
      CFRelease(v31);
      value = 0;
    }
    v32 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("vs"), a2, (CFStringRef *)&value);
    if ((_DWORD)v32 != -6727)
    {
      v13 = v32;
      if ((_DWORD)v32)
        goto LABEL_69;
      v33 = value;
      CFDictionarySetValue(v9[10], CFSTR("airPlayVersion"), value);
      if (v33)
      {
        CFRelease(v33);
        value = 0;
      }
    }
    v34 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("ov"), a2, (CFStringRef *)&value);
    if ((_DWORD)v34 == -6727)
    {
LABEL_55:
      v36 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("vv"), a2, &v103);
      if ((_DWORD)v36 == -6727)
      {
        v13 = 0;
        goto LABEL_70;
      }
      v13 = v36;
      if (!(_DWORD)v36)
      {
        CFDictionarySetInt64();
        goto LABEL_70;
      }
      goto LABEL_69;
    }
    v13 = v34;
    if (!(_DWORD)v34)
    {
      v35 = value;
      CFDictionarySetValue(v9[10], CFSTR("OSVersion"), value);
      if (v35)
      {
        CFRelease(v35);
        value = 0;
      }
      goto LABEL_55;
    }
LABEL_69:
    APSLogErrorAt();
    goto LABEL_70;
  }
  v13 = v30;
  APSLogErrorAt();
  if (gLogCategory_APAdvertiserInfo <= 40
    && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_191;
  }
LABEL_70:
  if (value)
    CFRelease(value);
  if ((_DWORD)v13)
  {
    APSLogErrorAt();
LABEL_291:
    CFRelease(v9);
    goto LABEL_287;
  }
LABEL_73:
  if (!a3)
  {
LABEL_286:
    v13 = 0;
    *a5 = v9;
    goto LABEL_287;
  }
  value = 0;
  v104 = 0;
  v102 = 0;
  v103 = 0;
  v37 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("act"), (const void *)a3, &v103);
  if ((_DWORD)v37 != -6727)
  {
    v13 = v37;
    if ((_DWORD)v37)
      goto LABEL_281;
    CFDictionarySetInt64();
  }
  v38 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("acl"), (const void *)a3, &v103);
  if ((_DWORD)v38 != -6727)
  {
    v13 = v38;
    if ((_DWORD)v38)
      goto LABEL_281;
    CFDictionarySetInt64();
  }
  v39 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("btaddr"), (CFDataRef)a3, (CFStringRef *)&value);
  if ((_DWORD)v39 == -6727)
  {
    v40 = value;
    if (!value)
      goto LABEL_88;
    goto LABEL_87;
  }
  v13 = v39;
  if ((_DWORD)v39)
    goto LABEL_281;
  v40 = value;
  CFDictionarySetValue(v9[10], CFSTR("bluetoothAddress"), value);
  if (v40)
  {
LABEL_87:
    CFRelease(v40);
    value = 0;
  }
LABEL_88:
  v41 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("deviceid"), (CFDataRef)a3, (CFStringRef *)&value);
  if (!(_DWORD)v41)
  {
    v42 = value;
    CFDictionarySetValue(v9[10], CFSTR("deviceID"), value);
    if (v42)
    {
      CFRelease(v42);
      value = 0;
    }
    v43 = APAdvertiserInfoCreateAPSFeaturesFromTXTRecordEx((CFDataRef)a3, CFSTR("fex"), CFSTR("features"), &v102);
    if ((_DWORD)v43 != -6727)
    {
      v13 = v43;
      if ((_DWORD)v43)
        goto LABEL_281;
      v44 = v102;
      _APAdvertiserInfoSetFeaturesEx(v9[10], v102);
      if (v44)
      {
        CFRelease(v44);
        v102 = 0;
      }
    }
    v45 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("rsf"), (const void *)a3, &v103);
    if ((_DWORD)v45 != -6727)
    {
      v13 = v45;
      if ((_DWORD)v45)
        goto LABEL_281;
      CFDictionarySetInt64();
    }
    v46 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("fv"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v46 != -6727)
    {
      v13 = v46;
      if ((_DWORD)v46)
        goto LABEL_281;
      v47 = value;
      CFDictionarySetValue(v9[10], CFSTR("firmwareVersion"), value);
      if (v47)
      {
        CFRelease(v47);
        value = 0;
      }
    }
    v48 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("flags"), (const void *)a3, &v103);
    if ((_DWORD)v48 != -6727)
    {
      v13 = v48;
      if ((_DWORD)v48)
        goto LABEL_281;
      CFDictionarySetInt64();
    }
    v49 = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("gcgl"), (const void *)a3, &v104);
    if ((_DWORD)v49 != -6727)
    {
      v13 = v49;
      if ((_DWORD)v49)
        goto LABEL_281;
      v50 = (const void **)MEMORY[0x24BDBD270];
      if (!v104)
        v50 = (const void **)MEMORY[0x24BDBD268];
      CFDictionarySetValue(v9[10], CFSTR("groupContainsDiscoverableLeader"), *v50);
    }
    v51 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("gid"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v51 != -6727)
    {
      v13 = v51;
      if ((_DWORD)v51)
        goto LABEL_281;
      v52 = value;
      CFDictionarySetValue(v9[10], CFSTR("groupID"), value);
      if (v52)
      {
        CFRelease(v52);
        value = 0;
      }
    }
    v53 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("gpn"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v53 != -6727)
    {
      v13 = v53;
      if ((_DWORD)v53)
        goto LABEL_281;
      v54 = value;
      CFDictionarySetValue(v9[10], CFSTR("groupPublicName"), value);
      if (v54)
      {
        CFRelease(v54);
        value = 0;
      }
    }
    v55 = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("igl"), (const void *)a3, &v104);
    if ((_DWORD)v55 != -6727)
    {
      v13 = v55;
      if ((_DWORD)v55)
        goto LABEL_281;
      v56 = (const void **)MEMORY[0x24BDBD270];
      if (!v104)
        v56 = (const void **)MEMORY[0x24BDBD268];
      CFDictionarySetValue(v9[10], CFSTR("isGroupLeader"), *v56);
    }
    v57 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("psgsz"), (const void *)a3, &v103);
    if ((_DWORD)v57 != -6727)
    {
      v13 = v57;
      if ((_DWORD)v57)
        goto LABEL_281;
      CFDictionarySetInt64();
    }
    v58 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("psgtp"), (const void *)a3, &v103);
    if ((_DWORD)v58 != -6727)
    {
      v13 = v58;
      if ((_DWORD)v58)
        goto LABEL_281;
      CFDictionarySetInt64();
    }
    v59 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("psgid"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v59 != -6727)
    {
      v13 = v59;
      if ((_DWORD)v59)
        goto LABEL_281;
      v60 = value;
      CFDictionarySetValue(v9[10], CFSTR("persistentGroupUUID"), value);
      if (v60)
      {
        CFRelease(v60);
        value = 0;
      }
    }
    v61 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pgm"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v61 != -6727)
    {
      v13 = v61;
      if ((_DWORD)v61)
        goto LABEL_281;
      v62 = value;
      CFDictionarySetValue(v9[10], CFSTR("persistentGroupModel"), value);
      if (v62)
      {
        CFRelease(v62);
        value = 0;
      }
    }
    v63 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pgmid"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v63 != -6727)
    {
      v13 = v63;
      if ((_DWORD)v63)
        goto LABEL_281;
      v64 = value;
      CFDictionarySetValue(v9[10], CFSTR("persistentGroupMemberID"), value);
      if (v64)
      {
        CFRelease(v64);
        value = 0;
      }
    }
    v65 = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("pgcgl"), (const void *)a3, &v104);
    if ((_DWORD)v65 != -6727)
    {
      v13 = v65;
      if ((_DWORD)v65)
        goto LABEL_281;
      v66 = (const void **)MEMORY[0x24BDBD270];
      if (!v104)
        v66 = (const void **)MEMORY[0x24BDBD268];
      CFDictionarySetValue(v9[10], CFSTR("parentGroupContainsDiscoverableLeader"), *v66);
    }
    v67 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pgid"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v67 != -6727)
    {
      v13 = v67;
      if ((_DWORD)v67)
        goto LABEL_281;
      v68 = value;
      CFDictionarySetValue(v9[10], CFSTR("parentGroupID"), value);
      if (v68)
      {
        CFRelease(v68);
        value = 0;
      }
    }
    v69 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("tsid"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v69 != -6727)
    {
      v13 = v69;
      if ((_DWORD)v69)
        goto LABEL_281;
      v70 = value;
      CFDictionarySetValue(v9[10], CFSTR("tightSyncUUID"), value);
      if (v70)
      {
        CFRelease(v70);
        value = 0;
      }
    }
    v71 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("tsm"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v71 != -6727)
    {
      v13 = v71;
      if ((_DWORD)v71)
        goto LABEL_281;
      v72 = value;
      CFDictionarySetValue(v9[10], CFSTR("tightSyncGroupModel"), value);
      if (v72)
      {
        CFRelease(v72);
        value = 0;
      }
    }
    v73 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("model"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v73 != -6727)
    {
      v13 = v73;
      if ((_DWORD)v73)
        goto LABEL_281;
      v74 = value;
      CFDictionarySetValue(v9[10], CFSTR("deviceModel"), value);
      if (v74)
      {
        CFRelease(v74);
        value = 0;
      }
    }
    v75 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("c"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v75 != -6727)
    {
      v13 = v75;
      if ((_DWORD)v75)
        goto LABEL_281;
      v76 = value;
      if (APSIsValidDeviceEnclosureColorString())
      {
        CFDictionarySetValue(v9[10], CFSTR("deviceEnclosureColor"), v76);
      }
      else if (gLogCategory_APAdvertiserInfo <= 60
             && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v76)
      {
        CFRelease(v76);
        value = 0;
      }
    }
    v77 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("manufacturer"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v77 != -6727)
    {
      v13 = v77;
      if ((_DWORD)v77)
        goto LABEL_281;
      v78 = value;
      CFDictionarySetValue(v9[10], CFSTR("manufacturer"), value);
      if (v78)
      {
        CFRelease(v78);
        value = 0;
      }
    }
    v79 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("company"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v79 != -6727)
    {
      v13 = v79;
      if ((_DWORD)v79)
        goto LABEL_281;
      v80 = value;
      CFDictionarySetValue(v9[10], CFSTR("company"), value);
      if (v80)
      {
        CFRelease(v80);
        value = 0;
      }
    }
    v81 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("serialNumber"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v81 != -6727)
    {
      v13 = v81;
      if ((_DWORD)v81)
        goto LABEL_281;
      v82 = value;
      CFDictionarySetValue(v9[10], CFSTR("serialNumber"), value);
      if (v82)
      {
        CFRelease(v82);
        value = 0;
      }
    }
    v83 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("at"), (const void *)a3, &v103);
    if ((_DWORD)v83 != -6727)
    {
      v13 = v83;
      if ((_DWORD)v83)
        goto LABEL_281;
      CFDictionarySetInt64();
    }
    v84 = APAdvertiserInfoGetBooleanFromTXTRecord(CFSTR("pw"), (const void *)a3, &v104);
    if ((_DWORD)v84 != -6727)
    {
      v13 = v84;
      if ((_DWORD)v84)
        goto LABEL_281;
      v85 = (const void **)MEMORY[0x24BDBD270];
      if (!v104)
        v85 = (const void **)MEMORY[0x24BDBD268];
      CFDictionarySetValue(v9[10], CFSTR("password"), *v85);
    }
    v86 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("protovers"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v86 != -6727)
    {
      v13 = v86;
      if ((_DWORD)v86)
        goto LABEL_281;
      v87 = value;
      CFDictionarySetValue(v9[10], CFSTR("protocolVersion"), value);
      if (v87)
      {
        CFRelease(v87);
        value = 0;
      }
    }
    v88 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pi"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v88 != -6727)
    {
      v13 = v88;
      if ((_DWORD)v88)
        goto LABEL_281;
      v89 = value;
      CFDictionarySetValue(v9[10], CFSTR("publicCUAirPlayPairingIdentity"), value);
      if (v89)
      {
        CFRelease(v89);
        value = 0;
      }
    }
    v90 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("psi"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v90 != -6727)
    {
      v13 = v90;
      if ((_DWORD)v90)
        goto LABEL_281;
      v91 = value;
      CFDictionarySetValue(v9[10], CFSTR("publicCUSystemPairingIdentity"), value);
      if (v91)
      {
        CFRelease(v91);
        value = 0;
      }
    }
    v92 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("pk"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v92 != -6727)
    {
      v13 = v92;
      if ((_DWORD)v92)
        goto LABEL_281;
      v93 = value;
      CFDictionarySetValue(v9[10], CFSTR("publicKey"), value);
      if (v93)
      {
        CFRelease(v93);
        value = 0;
      }
    }
    v94 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("srcvers"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v94 != -6727)
    {
      v13 = v94;
      if ((_DWORD)v94)
        goto LABEL_281;
      v95 = value;
      CFDictionarySetValue(v9[10], CFSTR("airPlayVersion"), value);
      if (v95)
      {
        CFRelease(v95);
        value = 0;
      }
    }
    v96 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("osvers"), (CFDataRef)a3, (CFStringRef *)&value);
    if ((_DWORD)v96 == -6727)
    {
LABEL_262:
      v98 = APAdvertiserInfoGetInt64FromTXTRecord(CFSTR("vv"), (const void *)a3, &v103);
      if ((_DWORD)v98 == -6727)
      {
        v13 = 0;
        goto LABEL_282;
      }
      v13 = v98;
      if (!(_DWORD)v98)
      {
        CFDictionarySetInt64();
        goto LABEL_282;
      }
      goto LABEL_281;
    }
    v13 = v96;
    if (!(_DWORD)v96)
    {
      v97 = value;
      CFDictionarySetValue(v9[10], CFSTR("OSVersion"), value);
      if (v97)
      {
        CFRelease(v97);
        value = 0;
      }
      goto LABEL_262;
    }
LABEL_281:
    APSLogErrorAt();
    goto LABEL_282;
  }
  v13 = v41;
  APSLogErrorAt();
  if (gLogCategory_APAdvertiserInfo <= 40
    && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_282:
  if (value)
    CFRelease(value);
  if (!(_DWORD)v13)
  {
    v9 = v101;
    goto LABEL_286;
  }
  APSLogErrorAt();
  v9 = v101;
  if (v101)
    goto LABEL_291;
LABEL_287:
  if (cf)
    CFRelease(cf);
  return v13;
}

void _APAdvertiserInfoCopyAndRemoveMDNSLabelSuffix(const __CFString *a1, __CFString **a2)
{
  CFIndex Length;
  uint64_t v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  __CFNumberFormatter *v8;
  CFNumberRef v9;
  CFIndex v10;
  CFStringRef v11;
  const __CFString *v12;
  CFIndex v13;
  __CFString *MutableCopy;
  __CFString *v15;
  CFRange v16;
  CFRange result;
  CFRange v18;
  CFRange v19;

  if (CFStringHasSuffix(a1, CFSTR(")")))
  {
    result.location = 0;
    result.length = 0;
    Length = CFStringGetLength(a1);
    v18.location = 0;
    v18.length = Length;
    if (CFStringFindWithOptions(a1, CFSTR(" ("), v18, 4uLL, &result))
    {
      v5 = Length - result.location;
      result.length = Length - result.location;
      if (result.location)
      {
        if (v5 >= 4)
        {
          v19.location = result.location + 2;
          v19.length = v5 - 3;
          v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v19);
          v16.location = 0;
          v16.length = CFStringGetLength(v7);
          v8 = CFNumberFormatterCreate(v6, 0, kCFNumberFormatterNoStyle);
          if (v8)
          {
            v9 = CFNumberFormatterCreateNumberFromString(v6, v8, v7, &v16, 1uLL);
            if (v9)
            {
              v10 = v16.length;
              if (v10 == CFStringGetLength(v7))
              {
                v11 = CFStringCreateWithSubstring(v6, a1, result);
                if (v11)
                {
                  v12 = v11;
                  v13 = CFStringGetLength(a1);
                  MutableCopy = CFStringCreateMutableCopy(v6, v13, a1);
                  if (MutableCopy)
                  {
                    v15 = MutableCopy;
                    CFStringTrim(MutableCopy, v12);
                    *a2 = v15;
                  }
                  else
                  {
                    APSLogErrorAt();
                  }
                  CFRelease(v12);
                }
                else
                {
                  APSLogErrorAt();
                }
              }
            }
          }
          else
          {
            APSLogErrorAt();
            v9 = 0;
          }
          if (v7)
            CFRelease(v7);
          if (v8)
            CFRelease(v8);
          if (v9)
            CFRelease(v9);
        }
      }
    }
  }
}

uint64_t APAdvertiserInfoGetBitListValueFromTXTRecord(const __CFString *a1, CFDataRef theData, _DWORD *a3)
{
  const __CFData *v4;
  const UInt8 *BytePtr;
  uint64_t v7;
  uint8_t valueLen;
  int v10;
  char buffer[256];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = theData;
    v10 = 0;
    valueLen = 0;
    BytePtr = CFDataGetBytePtr(theData);
    LOWORD(v4) = CFDataGetLength(v4);
    buffer[0] = 0;
    CFStringGetCString(a1, buffer, 256, 0x8000100u);
    if (TXTRecordGetValuePtr((uint16_t)v4, BytePtr, buffer, &valueLen))
    {
      v7 = BitListString_Parse();
      if ((_DWORD)v7)
        APSLogErrorAt();
      else
        *a3 = v10;
    }
    else
    {
      return 4294960569;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
  return v7;
}

uint64_t APAdvertiserInfoGetBooleanFromTXTRecord(const __CFString *a1, const void *a2, BOOL *a3)
{
  uint64_t Int64FromTXTRecord;
  uint64_t v5;
  uint64_t v7;

  v7 = 0;
  Int64FromTXTRecord = APAdvertiserInfoGetInt64FromTXTRecord(a1, a2, &v7);
  v5 = Int64FromTXTRecord;
  if ((_DWORD)Int64FromTXTRecord != -6727)
  {
    if ((_DWORD)Int64FromTXTRecord)
      APSLogErrorAt();
    else
      *a3 = v7 != 0;
  }
  return v5;
}

uint64_t APAdvertiserInfoGetInt64FromTXTRecord(const __CFString *a1, const void *a2, uint64_t *a3)
{
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  char buffer[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v7 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("txt"), a2);
      buffer[0] = 0;
      CFStringGetCString(a1, buffer, 256, 0x8000100u);
      *a3 = BonjourDevice_GetInt64();
      CFRelease(v7);
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return 4294960568;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
}

uint64_t APAdvertiserInfoCopyCFStringFromTXTRecord(const __CFString *a1, CFDataRef theData, CFStringRef *a3)
{
  const __CFData *v4;
  const UInt8 *BytePtr;
  const char *ValuePtr;
  const UInt8 *v8;
  CFStringRef v9;
  CFStringRef v10;
  uint64_t result;
  uint8_t valueLen;
  char buffer[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = theData;
    valueLen = 0;
    BytePtr = CFDataGetBytePtr(theData);
    LOWORD(v4) = CFDataGetLength(v4);
    buffer[0] = 0;
    CFStringGetCString(a1, buffer, 256, 0x8000100u);
    ValuePtr = (const char *)TXTRecordGetValuePtr((uint16_t)v4, BytePtr, buffer, &valueLen);
    if (ValuePtr)
    {
      v8 = (const UInt8 *)ValuePtr;
      valueLen = strnlen(ValuePtr, valueLen);
      v9 = CFStringCreateWithBytes(0, v8, valueLen, 0x8000100u, 0);
      if (v9)
      {
        v10 = v9;
        result = 0;
        *a3 = v10;
      }
      else
      {
        APSLogErrorAt();
        return 4294960554;
      }
    }
    else
    {
      return 4294960569;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
  return result;
}

uint64_t APAdvertiserInfoCreateAPSFeaturesFromTXTRecordEx(CFDataRef theData, const __CFString *a2, const __CFString *a3, _QWORD *a4)
{
  unsigned int v7;
  const void *v8;
  CFTypeRef cf;
  uint64_t v11;
  unsigned int Int64FromTXTRecord;

  cf = 0;
  v11 = 0;
  v7 = APAdvertiserInfoCopyCFStringFromTXTRecord(a2, theData, (CFStringRef *)&cf);
  Int64FromTXTRecord = v7;
  if (v7 == -6727)
  {
    if (!a3)
      goto LABEL_11;
    Int64FromTXTRecord = APAdvertiserInfoGetInt64FromTXTRecord(a3, theData, &v11);
    if (!Int64FromTXTRecord)
    {
      v8 = (const void *)APSFeaturesCreateFromLegacyFlags();
      if (!v8)
      {
        APSLogErrorAt();
        Int64FromTXTRecord = -6728;
        goto LABEL_11;
      }
LABEL_9:
      *a4 = v8;
      goto LABEL_11;
    }
LABEL_10:
    APSLogErrorAt();
    goto LABEL_11;
  }
  if (v7)
    goto LABEL_10;
  v8 = (const void *)APSFeaturesCreateFromStringRepresentation();
  if (!Int64FromTXTRecord)
    goto LABEL_9;
  APSLogErrorAt();
  if (v8)
    CFRelease(v8);
LABEL_11:
  if (cf)
    CFRelease(cf);
  return Int64FromTXTRecord;
}

uint64_t APAdvertiserInfoCreateWithSidePlayDataAndDeviceName(uint64_t a1, const __CFData *a2, const __CFString *a3, CFMutableDictionaryRef **a4)
{
  const __CFString *v6;
  CFMutableDictionaryRef *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v23;
  CFMutableDictionaryRef *v24;
  CFTypeRef cf;
  void *value;

  v23 = 0;
  v24 = 0;
  if (!a3 || !a2)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  v6 = a3;
  APAdvertiserInfoCreate(a1, &v24);
  v7 = v24;
  if (!v24)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  _APAdvertiserInfoCopyAndRemoveMDNSLabelSuffix(v6, &v23);
  v8 = v23;
  if (v23)
    v6 = v23;
  CFDictionarySetValue(v7[10], CFSTR("deviceName"), v6);
  cf = 0;
  value = 0;
  v9 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("id"), a2, (CFStringRef *)&value);
  if ((_DWORD)v9)
  {
    v12 = v9;
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo <= 40
      && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_37:
    v21 = value;
    if (!value)
      goto LABEL_39;
    goto LABEL_38;
  }
  v10 = value;
  CFDictionarySetValue(v7[10], CFSTR("deviceID"), value);
  if (v10)
  {
    CFRelease(v10);
    value = 0;
  }
  v11 = APAdvertiserInfoCreateAPSFeaturesFromTXTRecordEx(a2, CFSTR("f"), 0, &cf);
  if ((_DWORD)v11 == -6727)
  {
    v13 = (const void *)APSFeaturesCreateFromLegacyFlags();
  }
  else
  {
    v12 = v11;
    if ((_DWORD)v11)
      goto LABEL_36;
    v13 = cf;
  }
  _APAdvertiserInfoSetFeaturesEx(v7[10], v13);
  if (v13)
    CFRelease(v13);
  v14 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("mfg"), a2, (CFStringRef *)&value);
  if ((_DWORD)v14 != -6727)
  {
    v12 = v14;
    if ((_DWORD)v14)
      goto LABEL_36;
    v15 = value;
    CFDictionarySetValue(v7[10], CFSTR("manufacturer"), value);
    if (v15)
    {
      CFRelease(v15);
      value = 0;
    }
  }
  v16 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("mdl"), a2, (CFStringRef *)&value);
  if ((_DWORD)v16 != -6727)
  {
    v12 = v16;
    if ((_DWORD)v16)
      goto LABEL_36;
    v17 = value;
    CFDictionarySetValue(v7[10], CFSTR("deviceModel"), value);
    if (v17)
    {
      CFRelease(v17);
      value = 0;
    }
  }
  v18 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("sn"), a2, (CFStringRef *)&value);
  if ((_DWORD)v18 == -6727)
    goto LABEL_27;
  v12 = v18;
  if ((_DWORD)v18)
  {
LABEL_36:
    APSLogErrorAt();
    goto LABEL_37;
  }
  v19 = value;
  CFDictionarySetValue(v7[10], CFSTR("serialNumber"), value);
  if (v19)
  {
    CFRelease(v19);
    value = 0;
  }
LABEL_27:
  v20 = APAdvertiserInfoCopyCFStringFromTXTRecord(CFSTR("v"), a2, (CFStringRef *)&value);
  if ((_DWORD)v20 == -6727)
  {
    v12 = 0;
    goto LABEL_37;
  }
  v12 = v20;
  if ((_DWORD)v20)
    goto LABEL_36;
  v21 = value;
  CFDictionarySetValue(v7[10], CFSTR("airPlayVersion"), value);
  if (!v21)
    goto LABEL_40;
  v12 = 0;
LABEL_38:
  CFRelease(v21);
LABEL_39:
  if ((_DWORD)v12)
  {
    APSLogErrorAt();
    CFRelease(v7);
    if (!v8)
      return v12;
    goto LABEL_45;
  }
LABEL_40:
  if (gLogCategory_APAdvertiserInfo <= 30
    && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = 0;
  *a4 = v7;
  if (v8)
LABEL_45:
    CFRelease(v8);
  return v12;
}

uint64_t APAdvertiserInfoCopy(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  if (a2 && *(_QWORD *)(a2 + 80) && a3)
  {
    v5 = APAdvertiserInfoCreate(a1, &cf);
    if ((_DWORD)v5)
    {
      v7 = v5;
      APSLogErrorAt();
      if (cf)
        CFRelease(cf);
    }
    else
    {
      v6 = cf;
      CFRelease(*((CFTypeRef *)cf + 10));
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 16));
      v6[10] = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFDictionaryRef *)(a2 + 80));
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 16));
      v7 = 0;
      *a3 = v6;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
  return v7;
}

uint64_t APAdvertiserInfoCopyAirPlayData(uint64_t a1, CFDataRef *a2)
{
  return APAdvertiserInfoCopyAirPlayDataWithNANServiceType(a1, 0, a2);
}

uint64_t APAdvertiserInfoCopyAirPlayDataWithNANServiceType(uint64_t a1, unsigned int a2, CFDataRef *a3)
{
  pthread_mutex_t *v6;
  int Int64Ranged;
  uint8_t v8;
  int v9;
  uint8_t v10;
  const __CFString *Value;
  const __CFString *v12;
  const __CFString *TypedValue;
  uint64_t LegacyFlags;
  uint8_t TXTRecordNumberCString;
  uint64_t Int64;
  uint8_t v17;
  const __CFString *v18;
  int v19;
  uint8_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint8_t v23;
  uint64_t v24;
  uint8_t v25;
  const __CFString *v26;
  const __CFString *TXTString;
  int v28;
  uint8_t v29;
  int v30;
  uint8_t v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint8_t v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  int v43;
  uint8_t v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  int v51;
  uint8_t v52;
  const UInt8 *BytesPtr;
  unsigned int Length;
  CFDataRef v55;
  int v57;
  const __CFString *cf;
  const __CFString *cfa;
  const __CFString *cfb;
  const __CFString *cfc;
  const __CFString *cfd;
  const __CFString *cfe;
  const __CFString *cff;
  const __CFString *cfg;
  const __CFString *cfh;
  const __CFString *cfi;
  const __CFString *cfj;
  const __CFString *cfk;
  const __CFString *cfl;
  const __CFString *cfm;
  const __CFString *cfn;
  const __CFString *cfo;
  const __CFString *cfp;
  const __CFString *cfq;
  const __CFString *cfr;
  const __CFString *cfs;
  unsigned int v78;
  char __str[256];
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  txtRecord = 0uLL;
  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  if (!a3)
    goto LABEL_104;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged)
  {
    v8 = snprintf(__str, 0x100uLL, "%u", Int64Ranged);
    v78 = TXTRecordSetValue(&txtRecord, "act", v8, __str);
    if (v78)
      goto LABEL_134;
  }
  v9 = CFDictionaryGetInt64Ranged();
  v10 = snprintf(__str, 0x100uLL, "%u", v9);
  v78 = TXTRecordSetValue(&txtRecord, "acl", v10, __str);
  if (v78)
    goto LABEL_134;
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("bluetoothAddress"));
  cf = Value;
  if (Value)
  {
    if (CFStringGetLength(Value))
    {
      v78 = _APAdvertiserInfoAddStringToTXTRecord(cf, &txtRecord, "btaddr");
      if (v78)
        goto LABEL_134;
    }
  }
  v12 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceID"));
  v78 = _APAdvertiserInfoAddStringToTXTRecord(v12, &txtRecord, "deviceid");
  if (!v78)
  {
    CFStringGetTypeID();
    TypedValue = (const __CFString *)CFDictionaryGetTypedValue();
    cfa = TypedValue;
    if (TypedValue)
    {
      if (CFStringGetLength(TypedValue))
      {
        v78 = _APAdvertiserInfoAddStringToTXTRecord(cfa, &txtRecord, "c");
        if (v78)
          goto LABEL_134;
      }
    }
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("featuresEx")))
    {
      v78 = APSFeaturesCopyStringRepresentation();
      if (v78)
        goto LABEL_134;
      v78 = _APAdvertiserInfoAddStringToTXTRecord(cfa, &txtRecord, "fex");
      CFRelease(cfa);
      if (v78)
        goto LABEL_134;
      LegacyFlags = APSFeaturesGetLegacyFlags();
      TXTRecordNumberCString = _APAdvertiserInfoGetTXTRecordNumberCString(LegacyFlags, __str);
      v78 = TXTRecordSetValue(&txtRecord, "features", TXTRecordNumberCString, __str);
      if (v78)
        goto LABEL_134;
    }
    Int64 = CFDictionaryGetInt64();
    if (Int64)
    {
      v17 = _APAdvertiserInfoGetTXTRecordNumberCString(Int64, __str);
      v78 = TXTRecordSetValue(&txtRecord, "rsf", v17, __str);
      if (v78)
        goto LABEL_134;
    }
    v18 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("firmwareVersion"));
    cfb = v18;
    if (v18)
    {
      if (CFStringGetLength(v18))
      {
        v78 = _APAdvertiserInfoAddStringToTXTRecord(cfb, &txtRecord, "fv");
        if (v78)
          goto LABEL_134;
      }
    }
    v19 = CFDictionaryGetInt64Ranged();
    if (v19)
    {
      v20 = snprintf(__str, 0x100uLL, "0x%x", v19);
      v78 = TXTRecordSetValue(&txtRecord, "flags", v20, __str);
      if (v78)
        goto LABEL_134;
    }
    v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("groupID"));
    cfc = v21;
    if (v21)
    {
      if (CFStringGetLength(v21))
      {
        v78 = _APAdvertiserInfoAddStringToTXTRecord(cfc, &txtRecord, "gid");
        if (v78)
          goto LABEL_134;
        v22 = CFDictionaryGetInt64();
        v23 = snprintf(__str, 0x100uLL, "%u", v22 != 0);
        v78 = TXTRecordSetValue(&txtRecord, "igl", v23, __str);
        if (v78)
          goto LABEL_134;
        v24 = CFDictionaryGetInt64();
        v25 = snprintf(__str, 0x100uLL, "%u", v24 != 0);
        v78 = TXTRecordSetValue(&txtRecord, "gcgl", v25, __str);
        if (v78)
          goto LABEL_134;
        v26 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("groupPublicName"));
        cfd = v26;
        if (v26)
        {
          if (CFStringGetLength(v26))
          {
            v78 = _APAdvertiserInfoAddStringToTXTRecord(cfd, &txtRecord, "gpn");
            if (v78)
              goto LABEL_134;
          }
        }
      }
    }
    if (a2 < 2)
    {
LABEL_34:
      v28 = CFDictionaryGetInt64Ranged();
      v29 = snprintf(__str, 0x100uLL, "%u", v28);
      v78 = TXTRecordSetValue(&txtRecord, "psgsz", v29, __str);
      if (!v78)
      {
        v30 = CFDictionaryGetInt64Ranged();
        v31 = snprintf(__str, 0x100uLL, "%u", v30);
        v78 = TXTRecordSetValue(&txtRecord, "psgtp", v31, __str);
        if (!v78)
        {
          v32 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("persistentGroupUUID"));
          cfe = v32;
          if (!v32
            || !CFStringGetLength(v32)
            || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfe, &txtRecord, "psgid")) == 0)
          {
            v33 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("persistentGroupModel"));
            cff = v33;
            if (!v33
              || !CFStringGetLength(v33)
              || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cff, &txtRecord, "pgm")) == 0)
            {
              v34 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("persistentGroupMemberID"));
              cfg = v34;
              if (!v34
                || !CFStringGetLength(v34)
                || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfg, &txtRecord, "pgmid")) == 0)
              {
                v35 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("parentGroupID"));
                cfh = v35;
                if (!v35
                  || !CFStringGetLength(v35)
                  || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfh, &txtRecord, "pgid")) == 0
                  && (v36 = CFDictionaryGetInt64(),
                      v37 = snprintf(__str, 0x100uLL, "%u", v36 != 0),
                      (v78 = TXTRecordSetValue(&txtRecord, "pgcgl", v37, __str)) == 0))
                {
                  v38 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("tightSyncUUID"));
                  cfi = v38;
                  if (!v38
                    || !CFStringGetLength(v38)
                    || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfi, &txtRecord, "tsid")) == 0)
                  {
                    v39 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("tightSyncGroupModel"));
                    cfj = v39;
                    if (!v39
                      || !CFStringGetLength(v39)
                      || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfj, &txtRecord, "tsm")) == 0)
                    {
                      v40 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceModel"));
                      cfk = v40;
                      if (!v40
                        || !CFStringGetLength(v40)
                        || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfk, &txtRecord, "model")) == 0)
                      {
                        v41 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("manufacturer"));
                        cfl = v41;
                        if (!v41
                          || !CFStringGetLength(v41)
                          || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfl, &txtRecord, "manufacturer")) == 0)
                        {
                          v42 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("serialNumber"));
                          cfm = v42;
                          if (!v42
                            || !CFStringGetLength(v42)
                            || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfm, &txtRecord, "serialNumber")) == 0)
                          {
                            v43 = CFDictionaryGetInt64Ranged();
                            v44 = snprintf(__str, 0x100uLL, "%u", v43);
                            v78 = TXTRecordSetValue(&txtRecord, "at", v44, __str);
                            if (!v78)
                            {
                              v78 = 0;
                              if (!CFDictionaryGetInt64() || (v78 = TXTRecordSetValue(&txtRecord, "pw", 1u, "1")) == 0)
                              {
                                v45 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("protocolVersion"));
                                cfn = v45;
                                if (!v45
                                  || !CFStringGetLength(v45)
                                  || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfn, &txtRecord, "protovers")) == 0)
                                {
                                  v46 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("publicCUAirPlayPairingIdentity"));
                                  cfo = v46;
                                  if (!v46
                                    || !CFStringGetLength(v46)
                                    || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfo, &txtRecord, "pi")) == 0)
                                  {
                                    v47 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("publicCUSystemPairingIdentity"));
                                    cfp = v47;
                                    if (!v47
                                      || !CFStringGetLength(v47)
                                      || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfp, &txtRecord, "psi")) == 0)
                                    {
                                      v48 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("publicKey"));
                                      cfq = v48;
                                      if (!v48
                                        || !CFStringGetLength(v48)
                                        || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfq, &txtRecord, "pk")) == 0)
                                      {
                                        v49 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("airPlayVersion"));
                                        cfr = v49;
                                        if (!v49
                                          || !CFStringGetLength(v49)
                                          || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfr, &txtRecord, "srcvers")) == 0)
                                        {
                                          v50 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("OSVersion"));
                                          cfs = v50;
                                          if (!v50
                                            || !CFStringGetLength(v50)
                                            || (v78 = _APAdvertiserInfoAddStringToTXTRecord(cfs, &txtRecord, "osvers")) == 0)
                                          {
                                            v51 = CFDictionaryGetInt64Ranged();
                                            if (!v51
                                              || (v52 = snprintf(__str, 0x100uLL, "%u", v51),
                                                  (v78 = TXTRecordSetValue(&txtRecord, "vv", v52, __str)) == 0))
                                            {
                                              BytesPtr = (const UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
                                              Length = TXTRecordGetLength(&txtRecord);
                                              v55 = CFDataCreate(0, BytesPtr, Length);
                                              if (v55)
                                              {
                                                *a3 = v55;
                                                goto LABEL_89;
                                              }
                                              APSLogErrorAt();
                                              v57 = -6728;
LABEL_105:
                                              v78 = v57;
                                              goto LABEL_89;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_134:
      APSLogErrorAt();
      goto LABEL_89;
    }
    TXTString = (const __CFString *)APSNANServiceTypeGetTXTString();
    if (TXTString)
    {
      v78 = _APAdvertiserInfoAddStringToTXTRecord(TXTString, &txtRecord, "nanST");
      if (v78)
        goto LABEL_134;
      goto LABEL_34;
    }
LABEL_104:
    APSLogErrorAt();
    v57 = -6705;
    goto LABEL_105;
  }
  APSLogErrorAt();
  if (gLogCategory_APAdvertiserInfo <= 40
    && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_89:
  TXTRecordDeallocate(&txtRecord);
  pthread_mutex_unlock(v6);
  return v78;
}

uint64_t _APAdvertiserInfoAddStringToTXTRecord(const __CFString *a1, TXTRecordRef *a2, const char *a3)
{
  uint8_t v6;
  uint64_t v7;
  char buffer[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 && CFStringGetLength(a1))
  {
    buffer[0] = 0;
    if (CFStringGetCString(a1, buffer, 256, 0x8000100u))
    {
      v6 = strlen(buffer);
      v7 = TXTRecordSetValue(a2, a3, v6, buffer);
      if ((_DWORD)v7)
        APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
      return 4294960559;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
  return v7;
}

uint64_t _APAdvertiserInfoGetTXTRecordNumberCString(uint64_t a1, char *__str)
{
  if (HIDWORD(a1))
    return snprintf(__str, 0x100uLL, "0x%X,0x%X");
  else
    return snprintf(__str, 0x100uLL, "0x%X");
}

uint64_t APAdvertiserInfoCopyClusterCompatibleAirPlayData(uint64_t a1, int a2, CFDataRef *a3)
{
  pthread_mutex_t *v6;
  int Int64Ranged;
  uint8_t v8;
  uint64_t MutableCopy;
  const void *v10;
  uint64_t LegacyFlags;
  uint8_t TXTRecordNumberCString;
  uint64_t Int64;
  uint8_t v14;
  int v15;
  int v16;
  int v17;
  uint8_t v18;
  const __CFDictionary *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *Value;
  int v23;
  uint8_t v24;
  int v25;
  uint8_t v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint8_t v30;
  uint64_t v31;
  uint8_t v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  uint8_t v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  int v41;
  uint8_t v42;
  const UInt8 *BytesPtr;
  unsigned int Length;
  CFDataRef v45;
  int v47;
  int v48;
  const __CFString *cf;
  const __CFString *cfa;
  const __CFString *cfb;
  const __CFString *cfc;
  const __CFString *cfd;
  const __CFString *cfe;
  const __CFString *cff;
  const __CFString *cfg;
  const __CFString *cfh;
  const __CFString *cfi;
  const __CFString *cfj;
  unsigned int v60;
  char __str[256];
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  txtRecord = 0uLL;
  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  if (!a3)
  {
    APSLogErrorAt();
    v47 = -6705;
LABEL_75:
    v60 = v47;
    goto LABEL_68;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v8 = snprintf(__str, 0x100uLL, "%u", Int64Ranged);
  v60 = TXTRecordSetValue(&txtRecord, "acl", v8, __str);
  if (v60)
  {
    APSLogErrorAt();
    goto LABEL_68;
  }
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("featuresEx")))
  {
    v10 = 0;
    goto LABEL_12;
  }
  MutableCopy = APSFeaturesCreateMutableCopy();
  if (!MutableCopy)
  {
    APSLogErrorAt();
    v47 = -6728;
    goto LABEL_75;
  }
  v10 = (const void *)MutableCopy;
  if (a2 == 2)
  {
    APSFeaturesSetFeature();
    APSFeaturesSetFeature();
    APSFeaturesSetFeature();
    APSFeaturesSetFeature();
  }
  v60 = APSFeaturesCopyStringRepresentation();
  if (v60
    || (v60 = _APAdvertiserInfoAddStringToTXTRecord(0, &txtRecord, "fex"), CFRelease(0), v60)
    || (LegacyFlags = APSFeaturesGetLegacyFlags(),
        TXTRecordNumberCString = _APAdvertiserInfoGetTXTRecordNumberCString(LegacyFlags, __str),
        (v60 = TXTRecordSetValue(&txtRecord, "features", TXTRecordNumberCString, __str)) != 0))
  {
    APSLogErrorAt();
    goto LABEL_67;
  }
LABEL_12:
  Int64 = CFDictionaryGetInt64();
  if (Int64)
  {
    v14 = _APAdvertiserInfoGetTXTRecordNumberCString(Int64, __str);
    v60 = TXTRecordSetValue(&txtRecord, "rsf", v14, __str);
    if (v60)
      goto LABEL_77;
  }
  v15 = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("tightSyncUUID"))
    && !CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("persistentGroupUUID")))
  {
    v16 = 0x2000;
  }
  else
  {
    v16 = -8969;
  }
  v17 = v16 & v15;
  if (v17)
  {
    v18 = snprintf(__str, 0x100uLL, "0x%x", v17);
    v60 = TXTRecordSetValue(&txtRecord, "flags", v18, __str);
    if (v60)
      goto LABEL_77;
  }
  v19 = *(const __CFDictionary **)(a1 + 80);
  if (a2 != 1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v19, CFSTR("persistentGroupUUID"));
    cfb = Value;
    if (Value && CFStringGetLength(Value))
    {
      v60 = _APAdvertiserInfoAddStringToTXTRecord(cfb, &txtRecord, "psgid");
      if (v60)
        goto LABEL_77;
      v23 = CFDictionaryGetInt64Ranged();
      v24 = snprintf(__str, 0x100uLL, "%u", v23);
      v60 = TXTRecordSetValue(&txtRecord, "psgsz", v24, __str);
      if (v60)
        goto LABEL_77;
      v25 = CFDictionaryGetInt64Ranged();
      v26 = snprintf(__str, 0x100uLL, "%u", v25);
      v60 = TXTRecordSetValue(&txtRecord, "psgtp", v26, __str);
      if (v60)
        goto LABEL_77;
      v27 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("persistentGroupModel"));
      cfc = v27;
      if (v27)
      {
        if (CFStringGetLength(v27))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfc, &txtRecord, "pgm");
          if (v60)
            goto LABEL_77;
        }
      }
      goto LABEL_38;
    }
LABEL_71:
    APSLogErrorAt();
    v48 = -6705;
    goto LABEL_73;
  }
  v20 = (const __CFString *)CFDictionaryGetValue(v19, CFSTR("tightSyncUUID"));
  cf = v20;
  if (!v20 || !CFStringGetLength(v20))
    goto LABEL_71;
  v60 = _APAdvertiserInfoAddStringToTXTRecord(cf, &txtRecord, "tsid");
  if (!v60)
  {
    v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("tightSyncGroupModel"));
    cfa = v21;
    if (!v21 || !CFStringGetLength(v21) || (v60 = _APAdvertiserInfoAddStringToTXTRecord(cfa, &txtRecord, "tsm")) == 0)
    {
LABEL_38:
      v28 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("groupID"));
      cfd = v28;
      if (v28)
      {
        if (CFStringGetLength(v28))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfd, &txtRecord, "gid");
          if (v60)
            goto LABEL_77;
          v29 = CFDictionaryGetInt64();
          v30 = snprintf(__str, 0x100uLL, "%u", v29 != 0);
          v60 = TXTRecordSetValue(&txtRecord, "igl", v30, __str);
          if (v60)
            goto LABEL_77;
          v31 = CFDictionaryGetInt64();
          v32 = snprintf(__str, 0x100uLL, "%u", v31 != 0);
          v60 = TXTRecordSetValue(&txtRecord, "gcgl", v32, __str);
          if (v60)
            goto LABEL_77;
          v33 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("groupPublicName"));
          cfe = v33;
          if (v33)
          {
            if (CFStringGetLength(v33))
            {
              v60 = _APAdvertiserInfoAddStringToTXTRecord(cfe, &txtRecord, "gpn");
              if (v60)
                goto LABEL_77;
            }
          }
        }
      }
      v34 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("parentGroupID"));
      cff = v34;
      if (v34)
      {
        if (CFStringGetLength(v34))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cff, &txtRecord, "pgid");
          if (v60)
            goto LABEL_77;
          v35 = CFDictionaryGetInt64();
          v36 = snprintf(__str, 0x100uLL, "%u", v35 != 0);
          v60 = TXTRecordSetValue(&txtRecord, "pgcgl", v36, __str);
          if (v60)
            goto LABEL_77;
        }
      }
      v37 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceModel"));
      cfg = v37;
      if (v37)
      {
        if (CFStringGetLength(v37))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfg, &txtRecord, "model");
          if (v60)
            goto LABEL_77;
        }
      }
      v38 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("protocolVersion"));
      cfh = v38;
      if (v38)
      {
        if (CFStringGetLength(v38))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfh, &txtRecord, "protovers");
          if (v60)
            goto LABEL_77;
        }
      }
      v39 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("airPlayVersion"));
      cfi = v39;
      if (v39)
      {
        if (CFStringGetLength(v39))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfi, &txtRecord, "srcvers");
          if (v60)
            goto LABEL_77;
        }
      }
      v40 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("OSVersion"));
      cfj = v40;
      if (v40)
      {
        if (CFStringGetLength(v40))
        {
          v60 = _APAdvertiserInfoAddStringToTXTRecord(cfj, &txtRecord, "osvers");
          if (v60)
            goto LABEL_77;
        }
      }
      v41 = CFDictionaryGetInt64Ranged();
      if (v41)
      {
        v42 = snprintf(__str, 0x100uLL, "%u", v41);
        v60 = TXTRecordSetValue(&txtRecord, "vv", v42, __str);
        if (v60)
          goto LABEL_77;
      }
      BytesPtr = (const UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
      Length = TXTRecordGetLength(&txtRecord);
      v45 = CFDataCreate(0, BytesPtr, Length);
      if (v45)
      {
        *a3 = v45;
        goto LABEL_66;
      }
      APSLogErrorAt();
      v48 = -6728;
LABEL_73:
      v60 = v48;
      goto LABEL_66;
    }
  }
LABEL_77:
  APSLogErrorAt();
LABEL_66:
  if (v10)
LABEL_67:
    CFRelease(v10);
LABEL_68:
  TXTRecordDeallocate(&txtRecord);
  pthread_mutex_unlock(v6);
  return v60;
}

uint64_t APAdvertiserInfoCopyAirPlayP2PData(uint64_t a1, CFDataRef *a2)
{
  return APAdvertiserInfoCopyAirPlayP2PDataWithNANServiceType(a1, 0, a2);
}

uint64_t APAdvertiserInfoCopyAirPlayP2PDataWithNANServiceType(uint64_t a1, int a2, CFDataRef *a3)
{
  pthread_mutex_t *v6;
  const __CFString *Value;
  uint64_t v8;
  const __CFString *TXTString;
  uint64_t v10;
  const UInt8 *BytesPtr;
  unsigned int Length;
  CFDataRef v13;
  uint64_t v14;
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  txtRecord = 0uLL;
  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  if (!a3)
    goto LABEL_14;
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceID"));
  v8 = _APAdvertiserInfoAddStringToTXTRecord(Value, &txtRecord, "deviceid");
  if (!(_DWORD)v8)
  {
    if (!a2)
    {
LABEL_6:
      BytesPtr = (const UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
      Length = TXTRecordGetLength(&txtRecord);
      v13 = CFDataCreate(0, BytesPtr, Length);
      if (v13)
      {
        v14 = 0;
        *a3 = v13;
      }
      else
      {
        APSLogErrorAt();
        v14 = 4294960568;
      }
      goto LABEL_8;
    }
    TXTString = (const __CFString *)APSNANServiceTypeGetTXTString();
    if (TXTString)
    {
      v10 = _APAdvertiserInfoAddStringToTXTRecord(TXTString, &txtRecord, "nanST");
      if ((_DWORD)v10)
      {
        v14 = v10;
        APSLogErrorAt();
        goto LABEL_8;
      }
      goto LABEL_6;
    }
LABEL_14:
    APSLogErrorAt();
    v14 = 4294960591;
    goto LABEL_8;
  }
  v14 = v8;
  APSLogErrorAt();
  if (gLogCategory_APAdvertiserInfo <= 40
    && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_8:
  TXTRecordDeallocate(&txtRecord);
  pthread_mutex_unlock(v6);
  return v14;
}

uint64_t APAdvertiserInfoCreateAirPlayServiceName(uint64_t a1, _QWORD *a2)
{
  pthread_mutex_t *v4;
  const void *Value;
  const void *v6;
  uint64_t result;

  if (!a2)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  if (!a1)
    return 4294960591;
  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceName"));
  v6 = Value;
  if (Value)
    CFRetain(Value);
  pthread_mutex_unlock(v4);
  result = 0;
  *a2 = v6;
  return result;
}

uint64_t APAdvertiserInfoCopyRAOPData(uint64_t a1, CFDataRef *a2)
{
  pthread_mutex_t *v4;
  uint64_t LegacyFlags;
  uint8_t TXTRecordNumberCString;
  const __CFString *v7;
  const __CFString *v8;
  int Int64Ranged;
  uint8_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  int v21;
  uint8_t v22;
  const UInt8 *BytesPtr;
  unsigned int Length;
  CFDataRef v25;
  int v27;
  unsigned int v28;
  char value[256];
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  txtRecord = 0uLL;
  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  if (!a2)
  {
    APSLogErrorAt();
    v27 = -6705;
    goto LABEL_46;
  }
  CFDictionaryGetInt64Ranged();
  BitListString_Make();
  v28 = TXTRecordSetValue(&txtRecord, "cn", 0, value);
  if (v28)
    goto LABEL_47;
  if (CFDictionaryGetInt64())
  {
    v28 = TXTRecordSetValue(&txtRecord, "da", 4u, "true");
    if (v28)
      goto LABEL_47;
  }
  CFDictionaryGetInt64Ranged();
  BitListString_Make();
  v28 = TXTRecordSetValue(&txtRecord, "et", 0, value);
  if (v28)
    goto LABEL_47;
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("featuresEx")))
  {
    LegacyFlags = APSFeaturesGetLegacyFlags();
    TXTRecordNumberCString = _APAdvertiserInfoGetTXTRecordNumberCString(LegacyFlags, value);
    TXTRecordSetValue(&txtRecord, "ft", TXTRecordNumberCString, value);
  }
  v7 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("firmwareVersion"));
  if (v7)
  {
    v8 = v7;
    if (CFStringGetLength(v7))
    {
      v28 = _APAdvertiserInfoAddStringToTXTRecord(v8, &txtRecord, "fv");
      if (v28)
        goto LABEL_47;
    }
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged)
  {
    v10 = snprintf(value, 0x100uLL, "0x%x", Int64Ranged);
    v28 = TXTRecordSetValue(&txtRecord, "sf", v10, value);
    if (v28)
      goto LABEL_47;
  }
  if (CFDictionaryGetInt64Ranged())
  {
    BitListString_Make();
    v28 = TXTRecordSetValue(&txtRecord, "md", 0, value);
    if (v28)
      goto LABEL_47;
  }
  if ((v11 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceModel"))) != 0
    && (v12 = v11, CFStringGetLength(v11))
    && (v28 = _APAdvertiserInfoAddStringToTXTRecord(v12, &txtRecord, "am")) != 0
    || CFDictionaryGetInt64() && (v28 = TXTRecordSetValue(&txtRecord, "pw", 4u, "true")) != 0
    || (v13 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("publicKey"))) != 0
    && (v14 = v13, CFStringGetLength(v13))
    && (v28 = _APAdvertiserInfoAddStringToTXTRecord(v14, &txtRecord, "pk")) != 0)
  {
LABEL_47:
    APSLogErrorAt();
    goto LABEL_34;
  }
  v15 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("transportTypes"));
  v28 = _APAdvertiserInfoAddStringToTXTRecord(v15, &txtRecord, "tp");
  if (v28)
  {
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo <= 40
      && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_43;
    }
  }
  else
  {
    v16 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("airTunesProtocolVersion"));
    v28 = _APAdvertiserInfoAddStringToTXTRecord(v16, &txtRecord, "vn");
    if (!v28)
    {
      v17 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("airPlayVersion"));
      if (!v17
        || (v18 = v17, !CFStringGetLength(v17))
        || (v28 = _APAdvertiserInfoAddStringToTXTRecord(v18, &txtRecord, "vs")) == 0)
      {
        v19 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("OSVersion"));
        if (!v19
          || (v20 = v19, !CFStringGetLength(v19))
          || (v28 = _APAdvertiserInfoAddStringToTXTRecord(v20, &txtRecord, "ov")) == 0)
        {
          v21 = CFDictionaryGetInt64Ranged();
          v22 = snprintf(value, 0x100uLL, "%u", v21);
          v28 = TXTRecordSetValue(&txtRecord, "vv", v22, value);
          if (!v28)
          {
            BytesPtr = (const UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
            Length = TXTRecordGetLength(&txtRecord);
            v25 = CFDataCreate(0, BytesPtr, Length);
            if (v25)
            {
              *a2 = v25;
              goto LABEL_34;
            }
            APSLogErrorAt();
            v27 = -6728;
LABEL_46:
            v28 = v27;
            goto LABEL_34;
          }
        }
      }
      goto LABEL_47;
    }
    APSLogErrorAt();
    if (gLogCategory_APAdvertiserInfo <= 40
      && (gLogCategory_APAdvertiserInfo != -1 || _LogCategory_Initialize()))
    {
LABEL_43:
      LogPrintF();
    }
  }
LABEL_34:
  TXTRecordDeallocate(&txtRecord);
  pthread_mutex_unlock(v4);
  return v28;
}

uint64_t APAdvertiserInfoCreateRAOPServiceName(uint64_t a1, __CFString **a2)
{
  pthread_mutex_t *v4;
  const __CFString *Value;
  const __CFString *v6;
  BOOL v7;
  const __CFString *v8;
  CFIndex Length;
  const __CFString *MutableCopy;
  __CFString *v11;
  uint64_t v12;
  CFRange v14;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceID"));
  v6 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("deviceName"));
  if (Value)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    APSLogErrorAt();
LABEL_12:
    v12 = 4294960534;
    goto LABEL_8;
  }
  v8 = v6;
  Length = CFStringGetLength(Value);
  MutableCopy = CFStringCreateMutableCopy(0, Length, Value);
  if (!MutableCopy)
  {
    APSLogErrorAt();
    v12 = 4294960568;
    goto LABEL_8;
  }
  v11 = (__CFString *)MutableCopy;
  v14.length = CFStringGetLength(MutableCopy);
  v14.location = 0;
  if (CFStringFindAndReplace(v11, CFSTR(":"), &stru_24E220A30, v14, 0) != 5)
  {
    APSLogErrorAt();
    CFRelease(v11);
    goto LABEL_12;
  }
  CFStringAppend(v11, CFSTR("@"));
  CFStringAppend(v11, v8);
  v12 = 0;
  *a2 = v11;
LABEL_8:
  pthread_mutex_unlock(v4);
  return v12;
}

uint64_t APAdvertiserInfoDebugShow(uint64_t a1, int a2, uint64_t a3)
{
  const void *v5;
  CFStringRef v6;

  if (a3 && a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    DataBuffer_AppendF();
    v5 = *(const void **)(a1 + 80);
    if (a2)
    {
      v6 = CFCopyDescription(v5);
      DataBuffer_AppendF();
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
      if (v6)
        CFRelease(v6);
    }
    else
    {
      CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("deviceName"));
      DataBuffer_AppendF();
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
    }
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
}

__CFDictionary *APAdvertiserInfoCreateTestInfoDictionary()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  CFStringRef v2;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (IsAppleInternalBuild())
  {
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    CFDictionarySetValue(Mutable, CFSTR("bluetoothAddress"), CFSTR("AA:BB:CC:DD:EE:FF"));
    CFDictionarySetValue(Mutable, CFSTR("deviceName"), CFSTR("Name me, please"));
    CFDictionarySetValue(Mutable, CFSTR("deviceID"), CFSTR("FF:FF:FF:FF:FF:FF"));
    _APAdvertiserInfoSetLegacyFeatures(Mutable);
    CFDictionarySetInt64();
    CFDictionarySetValue(Mutable, CFSTR("deviceModel"), CFSTR("AppleTV5,3"));
    CFDictionarySetValue(Mutable, CFSTR("deviceEnclosureColor"), CFSTR("1"));
    CFDictionarySetValue(Mutable, CFSTR("manufacturer"), CFSTR("Apple"));
    CFDictionarySetValue(Mutable, CFSTR("serialNumber"), CFSTR("ABCD7890WXYZ"));
    CFDictionarySetValue(Mutable, CFSTR("password"), (const void *)*MEMORY[0x24BDBD268]);
    APSVersionUtilsGetShortVersionLength();
    CFDictionarySetCString();
    CFDictionarySetValue(Mutable, CFSTR("OSVersion"), CFSTR("7.2"));
    v2 = CFStringCreateWithFormat(v0, 0, CFSTR("%u"), 65537);
    CFDictionarySetValue(Mutable, CFSTR("airTunesProtocolVersion"), v2);
    CFRelease(v2);
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    CFDictionarySetValue(Mutable, CFSTR("rfc2617DigestAuthKey"), (const void *)*MEMORY[0x24BDBD270]);
    CFDictionarySetValue(Mutable, CFSTR("transportTypes"), CFSTR("UDP"));
  }
  else
  {
    APSLogErrorAt();
  }
  return Mutable;
}

void audioSessionBufferedHose_handleMediaDataControlRequest(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void *a5, uint64_t a6)
{
  uint64_t v11;
  const __CFAllocator *v12;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v14;
  CFTypeID v15;
  uint64_t Int64;
  uint64_t v17;
  uint64_t v18;
  CFTypeID v19;
  uint64_t v20;
  const void *v21;
  const void *Value;
  int v23;
  const void *v24;
  uint64_t v25;
  CFTypeID v26;
  int Int64Ranged;
  __int128 v28;
  CFTypeID v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t TypedValue;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFTypeID v40;
  uint64_t v41;
  Float64 v42;
  __int128 v43;
  CFTypeID v44;
  int v45;
  __int128 v46;
  CFTypeID v47;
  uint64_t v48;
  uint64_t v49;
  int IsValid;
  CFTypeID v51;
  uint64_t v52;
  const void *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, _QWORD, uint64_t);
  uint64_t v58;
  dispatch_semaphore_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t ProtocolVTable;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), _BYTE *);
  int v65;
  int v66;
  __CFDictionary *v67;
  __CFDictionary *v68;
  int v69;
  uint64_t v70;
  const void *v71;
  const void *v72;
  const void *v73;
  __CFDictionary *v74;
  __CFDictionary *v75;
  uint64_t v76;
  __CFDictionary *v77;
  __CFDictionary *v78;
  CFDictionaryRef Copy;
  CFDictionaryRef v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, const __CFAllocator *, uint64_t, __CFDictionary *, _BYTE *);
  int v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, _QWORD, const __CFString *);
  int v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t (*v89)(const void *, uint64_t, const void *, __CFDictionary *);
  int v90;
  dispatch_semaphore_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t, const void *, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), _BYTE *);
  int v97;
  const void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  int v103;
  int v104;
  _OWORD v105[2];
  _BYTE v106[28];
  _BYTE v107[28];
  _BYTE v108[28];
  _BYTE v109[28];
  int Anchor;

  Anchor = 0;
  v11 = *(_QWORD *)(a6 + 40);
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v14 = Mutable;
    if (a3 <= 1936549490)
    {
      if (a3 <= 1634760293)
      {
        if (a3 != 1634562925)
        {
          if (a3 != 1634624360)
            goto LABEL_78;
          *(_OWORD *)v109 = *MEMORY[0x24BE03810];
          *(_OWORD *)&v109[12] = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
          memset(v107, 0, 24);
          if (a5)
          {
            v26 = CFGetTypeID(a5);
            if (v26 == CFDictionaryGetTypeID())
            {
              Int64Ranged = CFDictionaryGetInt64Ranged();
              Anchor = APReceiverAudioSessionBufferedHoseGetAnchor(v11, Int64Ranged, v109, (uint64_t)v107);
              if (!Anchor)
              {
                *(_OWORD *)v108 = *(_OWORD *)v109;
                *(_OWORD *)&v108[12] = *(_OWORD *)&v109[12];
                Anchor = APSAudioTransportTimeUtilsEncodeToRequestResponseDictionary();
                if (Anchor)
                  goto LABEL_108;
                CFDictionarySetInt64();
                CFDictionarySetInt64();
                CFDictionarySetInt64();
              }
              CFDictionarySetInt64();
              if (!Anchor)
                goto LABEL_194;
LABEL_108:
              APSLogErrorAt();
              goto LABEL_194;
            }
          }
          goto LABEL_197;
        }
        CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue();
        Anchor = APReceiverAudioSessionPlatformSetProperty(*(_QWORD **)v11, v37, CFSTR("RASP::AudioMode"), v38, TypedValue);
        if (Anchor)
          goto LABEL_108;
      }
      else
      {
        if (a3 != 1634760294)
        {
          if (a3 != 1718839394)
          {
            if (a3 == 1835100003)
            {
              if (a5)
              {
                v15 = CFGetTypeID(a5);
                if (v15 == CFDictionaryGetTypeID())
                {
                  Int64 = CFDictionaryGetInt64();
                  CFDataGetTypeID();
                  v17 = CFDictionaryGetTypedValue();
                  memset(v109, 0, 24);
                  if (v11)
                  {
                    if (*(_QWORD *)(v11 + 128))
                    {
                      if (!v17)
                      {
                        APSLogErrorAt();
                        v66 = -72151;
                        goto LABEL_121;
                      }
                      v18 = a2;
                      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
                        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                         || _LogCategory_Initialize()))
                      {
                        LogPrintF();
                      }
                      v59 = dispatch_semaphore_create(0);
                      *(_QWORD *)&v109[16] = v59;
                      if (!v59)
                      {
                        APSLogErrorAt();
                        v66 = -6728;
                        goto LABEL_120;
                      }
                      v60 = v59;
                      v61 = *(_QWORD *)(v11 + 128);
                      APSEndpointStreamAudioHoseProtocolGetProtocolID();
                      ProtocolVTable = CMBaseObjectGetProtocolVTable();
                      if (ProtocolVTable && (v63 = *(_QWORD *)(ProtocolVTable + 16)) != 0)
                      {
                        v64 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), _BYTE *))(v63 + 104);
                        if (v64)
                        {
                          v65 = v64(v61, Int64, v17, audioSessionBufferedHose_setMagicCookieCompletionHandler, v109);
                          if (!v65)
                          {
                            dispatch_semaphore_wait(*(dispatch_semaphore_t *)&v109[16], 0xFFFFFFFFFFFFFFFFLL);
                            if (!*(_DWORD *)v109)
                            {
                              a2 = v18;
                              if (*(_QWORD *)&v109[8] == Int64)
                              {
                                v66 = 0;
                              }
                              else
                              {
                                APSLogErrorAt();
                                v66 = -72153;
                              }
LABEL_121:
                              if (*(_QWORD *)&v109[16])
                                dispatch_release(*(dispatch_object_t *)&v109[16]);
                              Anchor = v66;
                              if (!v66)
                                goto LABEL_194;
                              CFDictionarySetInt64();
                              if (!Anchor)
                                goto LABEL_194;
                              goto LABEL_108;
                            }
                            APSLogErrorAt();
                            v66 = *(_DWORD *)v109;
                            if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
                              && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                               || _LogCategory_Initialize()))
                            {
                              LogPrintF();
                            }
LABEL_120:
                            a2 = v18;
                            goto LABEL_121;
                          }
                          v66 = v65;
                        }
                        else
                        {
                          v66 = -12782;
                          *(_DWORD *)v109 = -12782;
                          *(_QWORD *)&v109[8] = Int64;
                          dispatch_semaphore_signal(v60);
                        }
                      }
                      else
                      {
                        v66 = -12788;
                      }
                      APSLogErrorAt();
                      goto LABEL_120;
                    }
                    v66 = -72152;
                  }
                  else
                  {
                    v66 = -72152;
                  }
                  APSLogErrorAt();
                  goto LABEL_121;
                }
              }
              goto LABEL_197;
            }
LABEL_78:
            v54 = -6714;
LABEL_79:
            Anchor = v54;
            goto LABEL_194;
          }
          *(_OWORD *)v109 = *MEMORY[0x24BE03810];
          v46 = *(_OWORD *)v109;
          *(_OWORD *)&v109[12] = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
          *(_OWORD *)v108 = v46;
          *(_OWORD *)&v108[12] = *(_OWORD *)&v109[12];
          if (a5)
          {
            v47 = CFGetTypeID(a5);
            if (v47 == CFDictionaryGetTypeID())
            {
              if (CFDictionaryContainsKey((CFDictionaryRef)a5, CFSTR("flushFromSeq")))
              {
                v48 = CFDictionaryGetInt64Ranged();
                v49 = a2;
                Anchor = APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary();
                if (Anchor)
                  goto LABEL_221;
                *(_OWORD *)v107 = *(_OWORD *)v109;
                *(_OWORD *)&v107[12] = *(_OWORD *)&v109[12];
                IsValid = APSAudioTransportTimeIsValid();
              }
              else
              {
                v49 = a2;
                v48 = 0;
                IsValid = 0;
              }
              Anchor = APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary();
              if (!Anchor)
              {
                *(_OWORD *)v107 = *(_OWORD *)v108;
                *(_OWORD *)&v107[12] = *(_OWORD *)&v108[12];
                if (APSAudioTransportTimeIsValid())
                {
                  v55 = CFDictionaryGetInt64Ranged();
                  *(_OWORD *)v107 = *(_OWORD *)v109;
                  *(_OWORD *)&v107[12] = *(_OWORD *)&v109[12];
                  *(_OWORD *)v106 = *(_OWORD *)v108;
                  *(_OWORD *)&v106[12] = *(_OWORD *)&v108[12];
                  Anchor = APReceiverAudioSessionBufferedHoseFlushAudio(v11, IsValid, v107, v48, v106, v55, 0);
                  a2 = v49;
                  if (!Anchor)
                    goto LABEL_194;
                  goto LABEL_108;
                }
                APSLogErrorAt();
                Anchor = -72151;
LABEL_222:
                a2 = v49;
                goto LABEL_194;
              }
LABEL_221:
              APSLogErrorAt();
              goto LABEL_222;
            }
          }
LABEL_197:
          APSLogErrorAt();
          v54 = -6756;
          goto LABEL_79;
        }
        *(_OWORD *)v109 = *MEMORY[0x24BDC0D88];
        *(_QWORD *)&v109[16] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        if (!a5)
          goto LABEL_197;
        v40 = CFGetTypeID(a5);
        if (v40 != CFDictionaryGetTypeID())
          goto LABEL_197;
        v41 = CFDictionaryGetInt64();
        CFDictionaryGetDouble();
        CMTimeMakeWithSeconds((CMTime *)v109, v42, 1000);
        *(_OWORD *)v108 = *(_OWORD *)v109;
        *(_QWORD *)&v108[16] = *(_QWORD *)&v109[16];
        Anchor = APReceiverAudioSessionBufferedHoseApplyVolumeFade(v11, v41, (CMTime *)v108);
        if (Anchor)
          goto LABEL_108;
      }
LABEL_194:
      APMediaDataControlServerSendResponse(a1, a2, a4, (uint64_t)v14, Anchor);
      CFRelease(v14);
      return;
    }
    if (a3 <= 1937011315)
    {
      if (a3 == 1936549491)
      {
        v39 = CFDictionaryGetInt64();
        if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
          && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v56 = *(_QWORD *)(v11 + 128);
        v57 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v57)
        {
          if (v39)
            v58 = *MEMORY[0x24BDBD270];
          else
            v58 = *MEMORY[0x24BDBD268];
          Anchor = v57(v56, *MEMORY[0x24BE03868], v58);
          if (!Anchor)
            goto LABEL_194;
        }
        else
        {
          Anchor = -12782;
        }
        goto LABEL_108;
      }
      if (a3 != 1936875892)
        goto LABEL_78;
      *(_OWORD *)v109 = *MEMORY[0x24BE03810];
      v28 = *(_OWORD *)v109;
      *(_OWORD *)&v109[12] = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
      *(_OWORD *)v108 = v28;
      *(_OWORD *)&v108[12] = *(_OWORD *)&v109[12];
      *(_OWORD *)v107 = v28;
      *(_OWORD *)&v107[12] = *(_OWORD *)&v109[12];
      if (!a5)
        goto LABEL_197;
      v29 = CFGetTypeID(a5);
      if (v29 != CFDictionaryGetTypeID())
        goto LABEL_197;
      v30 = CFDictionaryGetInt64Ranged();
      v101 = a1;
      if ((_DWORD)v30 == 1)
      {
        Anchor = APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary();
        if (Anchor)
          goto LABEL_108;
        *(_OWORD *)v106 = *(_OWORD *)v109;
        *(_OWORD *)&v106[12] = *(_OWORD *)&v109[12];
        if (!APSAudioTransportTimeIsValid())
        {
          APSLogErrorAt();
          Anchor = -72151;
LABEL_234:
          a1 = v101;
          goto LABEL_194;
        }
        v20 = a2;
        Anchor = APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary();
        if (Anchor)
        {
LABEL_233:
          APSLogErrorAt();
          a2 = v20;
          goto LABEL_234;
        }
        v31 = CFDictionaryGetInt64Ranged();
        v32 = a4;
        v33 = CFDictionaryGetInt64();
        v34 = CFDictionaryGetInt64();
        v35 = CFDictionaryGetInt64Ranged();
      }
      else
      {
        v20 = a2;
        v32 = a4;
        v34 = 0;
        v33 = 0;
        v31 = 0;
        v35 = 0;
      }
      *(_OWORD *)v106 = *(_OWORD *)v109;
      *(_OWORD *)&v106[12] = *(_OWORD *)&v109[12];
      v105[0] = *(_OWORD *)v108;
      *(_OWORD *)((char *)v105 + 12) = *(_OWORD *)&v108[12];
      *(_QWORD *)&v102 = v34;
      *((_QWORD *)&v102 + 1) = v33;
      v103 = v31;
      v104 = v35;
      Anchor = APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime(v11, v30, v106, v105, &v102, v107);
      if (Anchor)
      {
        CFDictionarySetInt64();
        a4 = v32;
        a2 = v20;
        a1 = v101;
      }
      else
      {
        a4 = v32;
        a2 = v20;
        a1 = v101;
        if ((_DWORD)v30)
          goto LABEL_194;
        *(_OWORD *)v106 = *(_OWORD *)v107;
        *(_OWORD *)&v106[12] = *(_OWORD *)&v107[12];
        if (APSAudioTransportTimeIsValid())
        {
          *(_OWORD *)v106 = *(_OWORD *)v107;
          *(_OWORD *)&v106[12] = *(_OWORD *)&v107[12];
          APSAudioTransportTimeUtilsEncodeToRequestResponseDictionary();
        }
      }
      if (Anchor)
        goto LABEL_108;
      goto LABEL_194;
    }
    if (a3 == 1937011316)
    {
      *(_OWORD *)v109 = *MEMORY[0x24BE03810];
      v43 = *(_OWORD *)v109;
      *(_OWORD *)&v109[12] = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
      *(_OWORD *)v108 = v43;
      *(_OWORD *)&v108[12] = *(_OWORD *)&v109[12];
      memset(v106, 0, 24);
      if (a5)
      {
        v44 = CFGetTypeID(a5);
        if (v44 == CFDictionaryGetTypeID())
        {
          v45 = CFDictionaryGetInt64Ranged();
          if (v45 == 1)
          {
            Anchor = APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary();
            if (Anchor)
              goto LABEL_108;
            *(_OWORD *)v107 = *(_OWORD *)v109;
            *(_OWORD *)&v107[12] = *(_OWORD *)&v109[12];
            if (!APSAudioTransportTimeIsValid())
            {
              APSLogErrorAt();
              v54 = -72151;
              goto LABEL_79;
            }
            v45 = 1;
          }
          *(_OWORD *)v107 = *(_OWORD *)v109;
          *(_OWORD *)&v107[12] = *(_OWORD *)&v109[12];
          Anchor = APReceiverAudioSessionBufferedHoseSetRate(v11, v45, v107, v108, (uint64_t)v106);
          if (!Anchor)
          {
            *(_OWORD *)v107 = *(_OWORD *)v108;
            *(_OWORD *)&v107[12] = *(_OWORD *)&v108[12];
            APSAudioTransportTimeUtilsEncodeToRequestResponseDictionary();
            CFDictionarySetInt64();
            CFDictionarySetInt64();
            CFDictionarySetInt64();
          }
          CFDictionarySetInt64();
          if (!Anchor)
            goto LABEL_194;
          goto LABEL_108;
        }
      }
      goto LABEL_197;
    }
    if (a3 != 1970299755)
    {
      if (a3 != 1970303090)
        goto LABEL_78;
      if (!a5)
        goto LABEL_197;
      v19 = CFGetTypeID(a5);
      if (v19 != CFDictionaryGetTypeID())
        goto LABEL_197;
      v101 = a1;
      v20 = a2;
      CFDataGetTypeID();
      v21 = (const void *)CFDictionaryGetTypedValue();
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("protocolVersionList"));
      if (Value)
      {
        v23 = -72152;
        if (v11 && *(_QWORD *)(v11 + 128))
        {
          if (v21)
          {
            v24 = Value;
            v25 = a4;
            if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
              && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            *(_QWORD *)v109 = 0;
            v67 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (v67)
            {
              v68 = v67;
              CFDictionarySetValue(v67, (const void *)*MEMORY[0x24BDDCEE8], (const void *)*MEMORY[0x24BDBD270]);
              CFDictionarySetValue(v68, (const void *)*MEMORY[0x24BDDCEF8], (const void *)*MEMORY[0x24BDBD268]);
              CFDictionarySetValue(v68, (const void *)*MEMORY[0x24BDDCEE0], v21);
              CFDictionarySetValue(v68, (const void *)*MEMORY[0x24BDDCEF0], v24);
              v69 = FigCPEProtectorRemoteCreateForScheme();
              if (v69)
              {
                APSLogErrorAt();
                v70 = 0;
              }
              else
              {
                v70 = *(_QWORD *)v109;
                *(_QWORD *)v109 = 0;
              }
              a2 = v20;
              CFRelease(v68);
              if (!v69)
              {
                a4 = v25;
                v71 = *(const void **)(v11 + 200);
                *(_QWORD *)(v11 + 200) = v70;
                a1 = v101;
                if (v71)
                  CFRelease(v71);
                if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
                  && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                v69 = 0;
LABEL_154:
                Anchor = v69;
                if (!v69)
                  goto LABEL_194;
                goto LABEL_155;
              }
            }
            else
            {
              APSLogErrorAt();
              v69 = -72150;
            }
            APSLogErrorAt();
            a4 = v25;
            a2 = v20;
            a1 = v101;
            goto LABEL_154;
          }
          v23 = -72151;
        }
        APSLogErrorAt();
        Anchor = v23;
        a1 = v101;
LABEL_155:
        CFDictionarySetInt64();
        if (!Anchor)
          goto LABEL_194;
        goto LABEL_108;
      }
      goto LABEL_233;
    }
    if (!a5)
      goto LABEL_197;
    v51 = CFGetTypeID(a5);
    if (v51 != CFDictionaryGetTypeID())
      goto LABEL_197;
    v52 = CFDictionaryGetInt64();
    CFDataGetTypeID();
    v53 = (const void *)CFDictionaryGetTypedValue();
    memset(v109, 0, 24);
    v100 = a2;
    if (v11)
    {
      if (*(_QWORD *)(v11 + 128))
      {
        if (!v53)
        {
          APSLogErrorAt();
          v72 = 0;
          v75 = 0;
          v86 = -72151;
          goto LABEL_184;
        }
        if (!*(_QWORD *)(v11 + 216))
        {
          APSLogErrorAt();
          v53 = 0;
          v72 = 0;
          v75 = 0;
LABEL_214:
          v86 = -72153;
          goto LABEL_184;
        }
        if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
          && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v72 = (const void *)CFNumberCreateInt64();
        if (!v72)
        {
          APSLogErrorAt();
          v53 = 0;
          v75 = 0;
          v86 = -72150;
          goto LABEL_184;
        }
        v98 = v53;
        v99 = v52;
        pthread_mutex_lock(*(pthread_mutex_t **)(v11 + 192));
        v73 = CFDictionaryGetValue(*(CFDictionaryRef *)(v11 + 208), v72);
        if (v73)
        {
          v53 = CFRetain(v73);
          pthread_mutex_unlock(*(pthread_mutex_t **)(v11 + 192));
          if (v53)
          {
            v74 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v75 = v74;
            if (v74)
            {
              CFDictionarySetValue(v74, (const void *)*MEMORY[0x24BDC1260], (const void *)*MEMORY[0x24BDBD270]);
              goto LABEL_168;
            }
            APSLogErrorAt();
            v86 = -6728;
LABEL_184:
            if (*(_QWORD *)&v109[16])
              dispatch_release(*(dispatch_object_t *)&v109[16]);
            if (v75)
              CFRelease(v75);
            if (v72)
              CFRelease(v72);
            a2 = v100;
            if (v53)
              CFRelease(v53);
            Anchor = v86;
            if (!v86)
              goto LABEL_194;
            CFDictionarySetInt64();
            if (!Anchor)
              goto LABEL_194;
            goto LABEL_108;
          }
        }
        else
        {
          pthread_mutex_unlock(*(pthread_mutex_t **)(v11 + 192));
        }
        *(_QWORD *)v108 = 0;
        if (*(_QWORD *)(v11 + 200))
        {
          v76 = a4;
          v77 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (v77)
          {
            v78 = v77;
            CFDictionarySetValue(v77, (const void *)*MEMORY[0x24BDDCED0], (const void *)*MEMORY[0x24BDDCEB0]);
            CFDictionarySetValue(v78, (const void *)*MEMORY[0x24BDDCEB8], CFSTR("lGxB4ky"));
            CFDictionarySetValue(v78, (const void *)*MEMORY[0x24BDDCED8], (const void *)*MEMORY[0x24BDBD268]);
            CFDictionarySetValue(v78, (const void *)*MEMORY[0x24BDDCEC8], (const void *)*MEMORY[0x24BDDCEA8]);
            Copy = CFDictionaryCreateCopy(v12, v78);
            if (Copy)
            {
              v80 = Copy;
              FigCFDictionarySetValue();
              v81 = *(_QWORD *)(v11 + 200);
              v82 = *(uint64_t (**)(uint64_t, const __CFAllocator *, uint64_t, __CFDictionary *, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
              if (v82)
              {
                v83 = v82(v81, v12, 1, v78, v108);
                if (v83)
                {
                  v86 = v83;
                }
                else
                {
                  v84 = *(_QWORD *)v108;
                  v85 = *(uint64_t (**)(uint64_t, _QWORD, const __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 56);
                  if (v85)
                  {
                    v86 = v85(v84, *MEMORY[0x24BDC0E08], CFSTR("P5h3ZgzLxs"));
                    if (!v86)
                    {
                      v53 = *(const void **)v108;
                      *(_QWORD *)v108 = 0;
                      goto LABEL_160;
                    }
                  }
                  else
                  {
                    v86 = -12782;
                  }
                }
              }
              else
              {
                v86 = -12782;
              }
              APSLogErrorAt();
              v53 = 0;
LABEL_160:
              CFRelease(v78);
              CFRelease(v80);
              if (*(_QWORD *)v108)
                CFRelease(*(CFTypeRef *)v108);
              if (!v86)
              {
                a4 = v76;
                if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
                  && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 208), v72, v53);
                v75 = 0;
LABEL_168:
                v87 = *(_QWORD *)(v11 + 216);
                v88 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
                if (*v88 >= 8uLL
                  && (v89 = (uint64_t (*)(const void *, uint64_t, const void *, __CFDictionary *))v88[28]) != 0)
                {
                  v76 = a4;
                  v90 = v89(v53, v87, v98, v75);
                  if (!v90)
                  {
                    v91 = dispatch_semaphore_create(0);
                    *(_QWORD *)&v109[16] = v91;
                    if (!v91)
                    {
                      APSLogErrorAt();
                      v86 = -6728;
                      goto LABEL_183;
                    }
                    v92 = v91;
                    v93 = *(_QWORD *)(v11 + 128);
                    APSEndpointStreamAudioHoseProtocolGetProtocolID();
                    v94 = CMBaseObjectGetProtocolVTable();
                    if (v94 && (v95 = *(_QWORD *)(v94 + 16)) != 0)
                    {
                      v96 = *(uint64_t (**)(uint64_t, uint64_t, const void *, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), _BYTE *))(v95 + 96);
                      if (v96)
                      {
                        v97 = v96(v93, v99, v53, audioSessionBufferedHose_updatePKDCryptorEncryptionKeyCompletionHandler, v109);
                        if (!v97)
                        {
                          dispatch_semaphore_wait(*(dispatch_semaphore_t *)&v109[16], 0xFFFFFFFFFFFFFFFFLL);
                          if (!*(_DWORD *)v109)
                          {
                            a4 = v76;
                            if (*(_QWORD *)&v109[8] == v99)
                            {
                              v86 = 0;
                              goto LABEL_184;
                            }
                            APSLogErrorAt();
                            goto LABEL_214;
                          }
                          APSLogErrorAt();
                          v86 = *(_DWORD *)v109;
                          if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
                            && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                             || _LogCategory_Initialize()))
                          {
                            LogPrintF();
                          }
LABEL_183:
                          a4 = v76;
                          goto LABEL_184;
                        }
                        v86 = v97;
                      }
                      else
                      {
                        v86 = -12782;
                        *(_DWORD *)v109 = -12782;
                        *(_QWORD *)&v109[8] = v99;
                        dispatch_semaphore_signal(v92);
                      }
                    }
                    else
                    {
                      v86 = -12788;
                    }
                    APSLogErrorAt();
                    goto LABEL_183;
                  }
                  v86 = v90;
                }
                else
                {
                  v86 = -12782;
                }
                APSLogErrorAt();
                goto LABEL_184;
              }
LABEL_228:
              APSLogErrorAt();
              v75 = 0;
              goto LABEL_183;
            }
            APSLogErrorAt();
            CFRelease(v78);
          }
          else
          {
            APSLogErrorAt();
          }
          v86 = -72150;
        }
        else
        {
          v76 = a4;
          v86 = -72152;
          APSLogErrorAt();
        }
        v53 = 0;
        goto LABEL_228;
      }
      v86 = -72152;
    }
    else
    {
      v86 = -72152;
    }
    APSLogErrorAt();
    v53 = 0;
    v72 = 0;
    v75 = 0;
    goto LABEL_184;
  }
  APSLogErrorAt();
  APMediaDataControlServerSendResponse(a1, a2, a4, 0, -6728);
}

uint64_t audioSessionBufferedHose_handleAudioDataConnectionEvent(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t);
  OpaqueCMBlockBuffer *v6;
  OpaqueCMBlockBuffer *v7;
  uint64_t v8;
  const __CFArray *v9;
  CFIndex Count;
  uint64_t v11;
  uint64_t ProtocolVTable;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t CMBaseObject;
  void (*v17)(uint64_t, _QWORD, _QWORD);

  if (a1 != 7)
    return 0;
  if (a2)
  {
    v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
    {
      v6 = (OpaqueCMBlockBuffer *)v5(a2);
      if (v6)
      {
        v7 = v6;
        if (CMBlockBufferGetDataLength(v6))
        {
          pthread_mutex_lock(*(pthread_mutex_t **)(a3 + 136));
          v8 = CFArrayEnsureCreatedAndAppend();
          v9 = *(const __CFArray **)(a3 + 144);
          if (v9)
            Count = CFArrayGetCount(v9);
          else
            Count = 0;
          pthread_mutex_unlock(*(pthread_mutex_t **)(a3 + 136));
          if (!(_DWORD)v8)
          {
            v11 = *(_QWORD *)(a3 + 128);
            APSEndpointStreamAudioHoseProtocolGetProtocolID();
            ProtocolVTable = CMBaseObjectGetProtocolVTable();
            if (ProtocolVTable && (v13 = *(_QWORD *)(ProtocolVTable + 16)) != 0)
            {
              v14 = *(uint64_t (**)(uint64_t))(v13 + 40);
              if (v14)
              {
                v15 = v14(v11);
                if (!(_DWORD)v15)
                {
                  if (Count >= 128)
                  {
                    CMBaseObject = APTransportConnectionGetCMBaseObject();
                    v17 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 56);
                    if (v17)
                      v17(CMBaseObject, *MEMORY[0x24BDFD7C8], *MEMORY[0x24BDBD268]);
                  }
                  goto LABEL_19;
                }
                v8 = v15;
              }
              else
              {
                v8 = 4294954514;
              }
            }
            else
            {
              v8 = 4294954508;
            }
          }
          APSLogErrorAt();
          goto LABEL_22;
        }
LABEL_19:
        v8 = 0;
LABEL_22:
        CFRelease(v7);
        return v8;
      }
    }
    v8 = 4294895145;
  }
  else
  {
    v8 = 4294895145;
  }
  APSLogErrorAt();
  return v8;
}

uint64_t audioSessionBufferedHose_handleBufferingPriorityChangedNotification(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a2 + 40);
  if (result)
    return audioSessionBufferedHose_updateNetworkThreadPriority(result);
  return result;
}

void audioSessionBufferedHose_audioFormatChangedNotification(int a1, uint64_t a2, int a3, int a4, CFTypeRef cf)
{
  uint64_t v5;
  CFTypeID v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int ChannelCount;
  _QWORD *v11;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a2 + 40);
  if (!cf)
    goto LABEL_34;
  v6 = CFGetTypeID(cf);
  if (v6 != CFDictionaryGetTypeID() || !FigCFDictionaryGetValueIfPresent())
    goto LABEL_34;
  v7 = *(const void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = 0;
  if (v7)
    CFRelease(v7);
  ChannelCount = APSAudioFormatDescriptionGetChannelCount();
  v11 = *(_QWORD **)v5;
  if (ChannelCount < 3)
  {
    if (APReceiverAudioSessionPlatformSetProperty(v11, v8, CFSTR("RASP::PrefersMultiChannel"), v9, *MEMORY[0x24BDBD268]))goto LABEL_34;
  }
  else if (APReceiverAudioSessionPlatformSetProperty(v11, v8, CFSTR("RASP::PrefersMultiChannel"), v9, *MEMORY[0x24BDBD270]))
  {
LABEL_34:
    APSLogErrorAt();
    return;
  }
  if (APSSettingsIsFeatureEnabled())
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
      goto LABEL_34;
    v13 = Mutable;
    APSAudioFormatDescriptionGetChannelLayoutTag();
    if (APSAudioFormatDoesAudioChannelLayoutTagHaveHeights()
      || (FigCFDictionarySetInt64(), APSAudioFormatDescriptionGetChannelCount() >= 8)
      || APSAudioFormatDescriptionGetChannelCount() >= 6)
    {
      FigCFDictionarySetInt64();
    }
    APReceiverAudioSessionPlatformSetProperty(*(_QWORD **)v5, v14, CFSTR("RASP::PreferredAudioFormat"), v15, (uint64_t)v13);
  }
  else
  {
    v13 = 0;
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    if (APSAudioFormatDescriptionGetAudioFormatIndex() != 6
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 10
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 11
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 15
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 18
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 22
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 24
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 2
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 3
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 4
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 5
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 7
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 8
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 9
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 12
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 13
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 14
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 16
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 17
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 45
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 46
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 44
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 38
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 78
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 80
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 82
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 84
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 47
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 48
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 79
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 81
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 83
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 69
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 85
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 19
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 20
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 86
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 21
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 40
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 39
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 90
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 23
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 42
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 41
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 25
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 26
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 27
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 28
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 29
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 30
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 31
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 32
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 43
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 49
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 50
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 51
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 52
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 53
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 54
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 55
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 56
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 57
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 58
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 60
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 89
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 61
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 62
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 63
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 33
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 34
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 35
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 87
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 88
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 64
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 65
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 66
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 67
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 76
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 77
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 68
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 70
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 71
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 72
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 73
      && APSAudioFormatDescriptionGetAudioFormatIndex() != 74)
    {
      APSAudioFormatDescriptionGetAudioFormatIndex();
    }
    LogPrintF();
  }
  if (v13)
    CFRelease(v13);
}

uint64_t audioSessionBufferedHose_cryptorNoLongerUsedNotification(int a1, uint64_t a2, int a3, int a4, CFTypeRef cf)
{
  uint64_t v5;
  CFTypeID v6;
  uint64_t v7;
  const void *v8;
  void *value;

  v5 = *(_QWORD *)(a2 + 40);
  value = 0;
  if (cf && (v6 = CFGetTypeID(cf), v6 == CFDictionaryGetTypeID()) && (v7 = FigCFDictionaryGetValue()) != 0)
  {
    v8 = (const void *)v7;
    FigCFNumberGetUInt64();
    pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 192));
    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(v5 + 208), v8, (const void **)&value))
    {
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v5 + 208), v8);
    }
    else if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
           && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    APSLogErrorAt();
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 192));
}

uint64_t audioSessionBufferedHose_updateNetworkThreadPriority(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef cf;
  unsigned int v7;

  cf = 0;
  if (*(_QWORD *)(a1 + 56))
  {
    APSLogErrorAt();
    v7 = -72153;
    goto LABEL_16;
  }
  v2 = *(_QWORD *)(a1 + 128);
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
  {
    v7 = -12782;
LABEL_10:
    APSLogErrorAt();
    goto LABEL_16;
  }
  v7 = v3(v2, *MEMORY[0x24BE03860], *MEMORY[0x24BDBD240], &cf);
  if (v7)
    goto LABEL_10;
  v4 = CFGetInt64Ranged();
  if (v7)
    goto LABEL_10;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
  if (*(_DWORD *)(a1 + 104) != v4)
  {
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      FigThreadGetMachThreadPriorityValue();
      FigThreadGetMachThreadPriorityValue();
      LogPrintF();
    }
    if (*(_QWORD *)(a1 + 96) && (v7 = FigThreadSetProperty()) != 0)
      APSLogErrorAt();
    else
      *(_DWORD *)(a1 + 104) = v4;
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
LABEL_16:
  if (cf)
    CFRelease(cf);
  return v7;
}

void audioSessionBufferedHose_glitchMonitorTimerFire()
{
  uint64_t v0;
  const void *v1;
  _QWORD *v2;

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v0)
  {
    v1 = (const void *)v0;
    v2 = *(_QWORD **)(v0 + 40);
    if (v2)
      audioSessionBufferedHose_updateGlitchyMinutes(v2);
    CFRelease(v1);
  }
}

unint64_t audioSessionBufferedHose_handleUnderrunNotification(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t result;
  unint64_t v4;

  v2 = *(_QWORD **)(a2 + 40);
  result = mach_absolute_time();
  if (v2)
  {
    v4 = result;
    result = FigCFEqual();
    if ((_DWORD)result)
    {
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90)
      {
        if (gLogCategory_APReceiverAudioSessionBufferedHose != -1
          || (result = _LogCategory_Initialize(), (_DWORD)result))
        {
          result = LogPrintF();
        }
      }
      v2[33] = v4;
    }
    else
    {
      result = FigCFEqual();
      if ((_DWORD)result && v2[33])
      {
        if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
          && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++v2[35];
        if (!v2[38])
          v2[38] = v2[33];
        v2[33] = 0;
        return audioSessionBufferedHose_updateGlitchyMinutes(v2);
      }
    }
  }
  return result;
}

unint64_t audioSessionBufferedHose_updateGlitchyMinutes(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t result;
  double v6;
  unint64_t v7;
  uint64_t v8;

  v2 = mach_absolute_time();
  v3 = v2;
  if (a1[32])
  {
    v4 = a1[37];
  }
  else
  {
    v4 = a1[22];
    a1[32] = v4;
    a1[36] = 1;
    a1[37] = v4;
  }
  result = v2 - v4;
  if (v3 > v4)
  {
    result = UpTicksToSeconds();
    if (result >= 0x3C)
    {
      if (a1[38])
      {
        UpTicksToSecondsF();
        v7 = vcvtpd_u64_f64(v6 / 60.0);
        v8 = a1[36];
        if (v8 - a1[39] < v7)
          v7 = v8 - a1[39];
        a1[34] += v7;
        a1[39] = v8;
      }
      else
      {
        v8 = a1[36];
      }
      a1[37] = v3;
      a1[38] = 0;
      a1[36] = v8 + 1;
      result = UpTicksToSeconds();
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50)
      {
        if (gLogCategory_APReceiverAudioSessionBufferedHose != -1)
          return LogPrintF();
        result = _LogCategory_Initialize();
        if ((_DWORD)result)
          return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t audioSessionBufferedHose_copyAudioDataBBufsCallback(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD);

  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = *(_QWORD *)(v4 + 40);
    pthread_mutex_lock(*(pthread_mutex_t **)(v6 + 136));
    *a3 = *(_QWORD *)(v6 + 144);
    *(_QWORD *)(v6 + 144) = 0;
    pthread_mutex_unlock(*(pthread_mutex_t **)(v6 + 136));
    if (*(_QWORD *)(v6 + 56))
    {
      CMBaseObject = APTransportConnectionGetCMBaseObject();
      v8 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v8)
        v8(CMBaseObject, *MEMORY[0x24BDFD7C8], *MEMORY[0x24BDBD270]);
    }
    else
    {
      audioSessionBufferedHose_resumeNetworkReads(v6);
    }
    CFRelease(v5);
  }
  return 0;
}

uint64_t audioSessionBufferedHose_resumeNetworkReads(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 56))
      return APSLogErrorAt();
    if (!*(_BYTE *)(result + 124))
    {
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 20
        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v1 + 124) = 1;
      result = SendSelfConnectedLoopbackMessage();
      if ((_DWORD)result)
        return APSLogErrorAt();
    }
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedHoseFlushAudio(uint64_t a1, int a2, _OWORD *a3, uint64_t a4, _OWORD *a5, uint64_t a6, _OWORD *a7)
{
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, _OWORD *, uint64_t, _OWORD *, _QWORD, uint64_t *);
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t ProtocolVTable;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, _OWORD *, _QWORD, uint64_t *);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  _QWORD block[5];
  _OWORD v35[2];
  _OWORD v36[2];
  uint64_t v37;
  dispatch_semaphore_t dsema;
  _OWORD v39[2];
  _OWORD v40[3];

  v37 = 0;
  v14 = dispatch_semaphore_create(0);
  dsema = v14;
  if (!v14)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  if (!a2)
  {
    v22 = *(NSObject **)(a1 + 240);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __APReceiverAudioSessionBufferedHoseFlushAudio_block_invoke;
    block[3] = &__block_descriptor_tmp_4396;
    block[4] = a1;
    dispatch_sync(v22, block);
    v23 = *(_QWORD *)(a1 + 128);
    v39[0] = *a5;
    *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)((char *)a5 + 12);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    ProtocolVTable = CMBaseObjectGetProtocolVTable();
    if (!ProtocolVTable || (v25 = *(_QWORD *)(ProtocolVTable + 16)) == 0)
    {
      v21 = 4294954508;
      goto LABEL_25;
    }
    v26 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _QWORD, uint64_t *))(v25 + 24);
    if (!v26)
    {
      v21 = 4294954514;
      LODWORD(v37) = -12782;
      dispatch_semaphore_signal(dsema);
      goto LABEL_25;
    }
    v40[0] = v39[0];
    *(_OWORD *)((char *)v40 + 12) = *(_OWORD *)((char *)v39 + 12);
    v27 = v26(v23, a6, v40, audioSessionBufferedHose_flushCompletionHandler, &v37);
    if ((_DWORD)v27)
    {
      v21 = v27;
      goto LABEL_25;
    }
LABEL_14:
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    if (a7)
    {
      v28 = MEMORY[0x24BE03810];
      *a7 = *MEMORY[0x24BE03810];
      *(_OWORD *)((char *)a7 + 12) = *(_OWORD *)(v28 + 12);
    }
    if (!a2 && !(_DWORD)v37)
      *(_DWORD *)(a1 + 164) = 0;
    v29 = *(_QWORD *)(a1 + 128);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    v30 = CMBaseObjectGetProtocolVTable();
    if (v30)
    {
      v31 = *(_QWORD *)(v30 + 16);
      if (v31)
      {
        v32 = *(void (**)(uint64_t))(v31 + 40);
        if (v32)
          v32(v29);
      }
    }
    v21 = 0;
    goto LABEL_26;
  }
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 128);
  v36[0] = *a3;
  *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)((char *)a3 + 12);
  v35[0] = *a5;
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)a5 + 12);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  v17 = CMBaseObjectGetProtocolVTable();
  if (!v17 || (v18 = *(_QWORD *)(v17 + 16)) == 0)
  {
    v21 = 4294954508;
    goto LABEL_25;
  }
  v19 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, _OWORD *, _QWORD, uint64_t *))(v18 + 32);
  if (!v19)
  {
    v21 = 4294954514;
    LODWORD(v37) = -12782;
    dispatch_semaphore_signal(v15);
    goto LABEL_25;
  }
  v40[0] = v36[0];
  *(_OWORD *)((char *)v40 + 12) = *(_OWORD *)((char *)v36 + 12);
  v39[0] = v35[0];
  *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)((char *)v35 + 12);
  v20 = v19(v16, a4, v40, a6, v39, audioSessionBufferedHose_flushWithinSampleRangeCompletionHandler, &v37);
  if (!(_DWORD)v20)
    goto LABEL_14;
  v21 = v20;
LABEL_25:
  APSLogErrorAt();
LABEL_26:
  if (dsema)
    dispatch_release(dsema);
  return v21;
}

uint64_t APReceiverAudioSessionBufferedHoseGetAnchor(uint64_t a1, int a2, _OWORD *a3, uint64_t a4)
{
  unsigned int *Value;
  dispatch_semaphore_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ProtocolVTable;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t (*)(uint64_t, _OWORD *, __int128 *, int, const void *), _QWORD);
  uint64_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  const void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  Value = (unsigned int *)malloc_type_calloc(1uLL, 0x40uLL, 0x1020040D3BB1902uLL);
  if (!a1)
  {
    APSLogErrorAt();
    v19 = 4294895144;
    goto LABEL_45;
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a2 != 1)
  {
    APSLogErrorAt();
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v19 = 4294960591;
LABEL_45:
    if (!Value)
      goto LABEL_50;
    goto LABEL_46;
  }
  v9 = dispatch_semaphore_create(0);
  *((_QWORD *)Value + 7) = v9;
  if (!v9)
  {
    APSLogErrorAt();
    v19 = 4294960568;
LABEL_46:
    audioSessionBufferedHose_finalizeContextWrapper(Value);
    goto LABEL_20;
  }
  v10 = APSWrapperCreate();
  if ((_DWORD)v10)
  {
    v19 = v10;
    APSLogErrorAt();
    goto LABEL_46;
  }
  v11 = *(_QWORD *)(a1 + 128);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  ProtocolVTable = CMBaseObjectGetProtocolVTable();
  if (!ProtocolVTable || (v13 = *(_QWORD *)(ProtocolVTable + 16)) == 0)
  {
    v19 = 4294954508;
LABEL_19:
    APSLogErrorAt();
LABEL_20:
    v18 = 0;
    Value = 0;
    goto LABEL_24;
  }
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t, _OWORD *, __int128 *, int, const void *), _QWORD))(v13 + 88);
  if (!v14)
  {
    v19 = 4294954514;
    audioSessionBufferedHose_getAnchorCompletionHandler(ProtocolVTable, MEMORY[0x24BE03810], MEMORY[0x24BE038C8], -12782, 0);
    goto LABEL_19;
  }
  v15 = v14(v11, 1, audioSessionBufferedHose_getAnchorCompletionHandler, 0);
  if ((_DWORD)v15)
  {
    v19 = v15;
    goto LABEL_19;
  }
  Value = (unsigned int *)APSWrapperGetValue();
  v16 = *((_QWORD *)Value + 7);
  v17 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(v16, v17))
  {
    if (!*Value)
    {
      v18 = (const void *)APSAudioTransportTimeCopyDebugDesc();
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v19 = 0;
      goto LABEL_24;
    }
    APSLogErrorAt();
    v19 = *Value;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_50:
    v18 = 0;
    goto LABEL_24;
  }
  APSLogErrorAt();
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v18 = 0;
  v19 = 4294960574;
LABEL_24:
  if (a3)
  {
    v20 = *(_OWORD *)(Value + 1);
    *(_OWORD *)((char *)a3 + 12) = *((_OWORD *)Value + 1);
    *a3 = v20;
  }
  if (a4)
  {
    v21 = *((_OWORD *)Value + 2);
    *(_QWORD *)(a4 + 16) = *((_QWORD *)Value + 6);
    *(_OWORD *)a4 = v21;
  }
  if (v18)
    CFRelease(v18);
  return v19;
}

uint64_t APReceiverAudioSessionBufferedHoseSetRate(uint64_t a1, int a2, _OWORD *a3, _OWORD *a4, uint64_t a5)
{
  const void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t ProtocolVTable;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, _OWORD *, _QWORD, _BYTE *);
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  _BYTE v25[28];
  _QWORD block[6];
  _BYTE v27[32];
  __int128 v28;
  dispatch_semaphore_t dsema[2];
  _OWORD v30[3];

  *(_QWORD *)v27 = 0;
  v24 = *MEMORY[0x24BE03810];
  *(_OWORD *)&v27[4] = *MEMORY[0x24BE03810];
  v23 = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
  *(_OWORD *)&v27[16] = v23;
  v28 = 0u;
  *(_OWORD *)dsema = 0u;
  v30[0] = *a3;
  *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)a3 + 12);
  v10 = (const void *)APSAudioTransportTimeCopyDebugDesc();
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      v11 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v11)
      {
        v13 = v11;
        if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
          && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (a2 != 1)
        {
          APSLogErrorAt();
          if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
            && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v15 = 0;
          v21 = 4294960591;
          goto LABEL_29;
        }
        if (*(_BYTE *)(v13 + 728))
        {
          if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
            && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v15 = 0;
          v21 = 4294960587;
        }
        else
        {
          if (*(_QWORD *)(a1 + 48))
          {
            v14 = *(NSObject **)(v13 + 16);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 0x40000000;
            block[2] = __APReceiverAudioSessionBufferedHoseSetRate_block_invoke;
            block[3] = &__block_descriptor_tmp_123;
            block[4] = v13;
            block[5] = a1;
            dispatch_sync(v14, block);
          }
          else
          {
            AirPlayReceiverSessionControl(v13, v12, CFSTR("handleMediaAudioResumedForSession"), *(__CFString **)(a1 + 32), 0, 0);
          }
          v15 = dispatch_semaphore_create(0);
          dsema[1] = v15;
          if (v15)
          {
            v16 = *(_QWORD *)(a1 + 128);
            *(_OWORD *)v25 = *a3;
            *(_OWORD *)&v25[12] = *(_OWORD *)((char *)a3 + 12);
            APSEndpointStreamAudioHoseProtocolGetProtocolID();
            ProtocolVTable = CMBaseObjectGetProtocolVTable();
            if (ProtocolVTable && (v18 = *(_QWORD *)(ProtocolVTable + 16)) != 0)
            {
              v19 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _QWORD, _BYTE *))(v18 + 80);
              if (v19)
              {
                v30[0] = *(_OWORD *)v25;
                *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)&v25[12];
                v20 = v19(v16, 1, v30, audioSessionBufferedHose_setRateCompletionHandler, v27);
                if (!(_DWORD)v20)
                {
                  dispatch_semaphore_wait(dsema[1], 0xFFFFFFFFFFFFFFFFLL);
                  if (*(_DWORD *)v27)
                  {
                    APSLogErrorAt();
                    v21 = *(unsigned int *)v27;
                    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
                      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                       || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                    }
                    v15 = 0;
                  }
                  else
                  {
                    *(_DWORD *)(a1 + 164) = 1;
                    v30[0] = *(_OWORD *)&v27[4];
                    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)&v27[16];
                    v15 = APSAudioTransportTimeCopyDebugDesc();
                    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
                      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                       || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                    }
                    v21 = 0;
                  }
                  goto LABEL_29;
                }
                v21 = v20;
              }
              else
              {
                v21 = 4294954514;
                *(_DWORD *)v27 = -12782;
                *(_OWORD *)&v27[4] = v24;
                *(_OWORD *)&v27[16] = v23;
                v28 = *MEMORY[0x24BE038C8];
                dsema[0] = *(dispatch_semaphore_t *)(MEMORY[0x24BE038C8] + 16);
                dispatch_semaphore_signal(v15);
              }
            }
            else
            {
              v21 = 4294954508;
            }
            APSLogErrorAt();
            v15 = 0;
          }
          else
          {
            APSLogErrorAt();
            v21 = 4294960568;
          }
        }
LABEL_29:
        CFRelease((CFTypeRef)v13);
        goto LABEL_30;
      }
      v21 = 4294895143;
    }
    else
    {
      v21 = 4294895143;
    }
    APSLogErrorAt();
    v15 = 0;
  }
  else
  {
    APSLogErrorAt();
    v15 = 0;
    v21 = 4294895144;
  }
LABEL_30:
  if (v10)
    CFRelease(v10);
  if (v15)
    CFRelease(v15);
  if (a4)
  {
    *a4 = *(_OWORD *)&v27[4];
    *(_OWORD *)((char *)a4 + 12) = *(_OWORD *)&v27[16];
  }
  if (a5)
  {
    *(_OWORD *)a5 = v28;
    *(dispatch_semaphore_t *)(a5 + 16) = dsema[0];
  }
  if (dsema[1])
    dispatch_release(dsema[1]);
  return v21;
}

uint64_t APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, __int128 *a5, _OWORD *a6)
{
  const void *v12;
  const void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  int v20;
  NSObject *v21;
  _QWORD *v22;
  NSObject *v23;
  NSObject *v24;
  const void *v25;
  uint64_t v26;
  uint64_t ProtocolVTable;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, _OWORD *, __int128 *, _OWORD *, _QWORD, _BYTE *);
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  int v34;
  __int128 v35;
  __int128 v36;
  _OWORD *v37;
  _BYTE v38[28];
  __int128 v39;
  uint64_t v40;
  _BYTE v41[28];
  _QWORD block[5];
  _QWORD v43[6];
  _BYTE v44[32];
  dispatch_object_t v45;
  _OWORD v46[2];
  __int128 v47;
  uint64_t v48;
  _OWORD v49[3];

  *(_OWORD *)v44 = *a3;
  *(_OWORD *)&v44[12] = *(_OWORD *)((char *)a3 + 12);
  v12 = (const void *)APSAudioTransportTimeCopyDebugDesc();
  *(_OWORD *)v44 = *a4;
  *(_OWORD *)&v44[12] = *(_OWORD *)((char *)a4 + 12);
  v13 = (const void *)APSAudioTransportTimeCopyDebugDesc();
  *(_QWORD *)v44 = 0;
  v14 = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
  *(_OWORD *)&v44[16] = v14;
  v15 = *MEMORY[0x24BE03810];
  *(_OWORD *)&v44[4] = *MEMORY[0x24BE03810];
  v45 = 0;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      v35 = v15;
      v36 = v14;
      v16 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v16)
      {
        v18 = v16;
        v19 = &unk_2553CD000;
        if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
          && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
        {
          APSGetFBOPropertyInt64();
          v19 = (_DWORD *)&unk_2553CD000;
          LogPrintF();
        }
        if (a2 >= 2)
        {
          APSLogErrorAt();
          v34 = v19[330];
          if (v34 <= 90 && (v34 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v31 = 0;
          v32 = 4294960591;
          goto LABEL_38;
        }
        if ((_DWORD)a2 == 1)
        {
          if (*(_BYTE *)(v18 + 728))
          {
            v20 = v19[330];
            if (v20 <= 50 && (v20 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            v31 = 0;
            v32 = 4294960587;
            goto LABEL_38;
          }
          v37 = a6;
          if (!*(_QWORD *)(a1 + 48))
          {
            AirPlayReceiverSessionControl(v18, v17, CFSTR("handleMediaAudioResumedForSession"), *(__CFString **)(a1 + 32), 0, 0);
LABEL_16:
            v23 = dispatch_semaphore_create(0);
            v45 = v23;
            if (!v23)
            {
              APSLogErrorAt();
              v31 = 0;
              v32 = 4294960568;
              goto LABEL_28;
            }
            v24 = v23;
            v25 = v12;
            v26 = *(_QWORD *)(a1 + 128);
            *(_OWORD *)v41 = *a3;
            *(_OWORD *)&v41[12] = *(_OWORD *)((char *)a3 + 12);
            v39 = *a5;
            v40 = *((_QWORD *)a5 + 2);
            *(_OWORD *)v38 = *a4;
            *(_OWORD *)&v38[12] = *(_OWORD *)((char *)a4 + 12);
            APSEndpointStreamAudioHoseProtocolGetProtocolID();
            ProtocolVTable = CMBaseObjectGetProtocolVTable();
            if (ProtocolVTable && (v28 = *(_QWORD *)(ProtocolVTable + 16)) != 0)
            {
              v29 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, __int128 *, _OWORD *, _QWORD, _BYTE *))(v28 + 48);
              if (v29)
              {
                v49[0] = *(_OWORD *)v41;
                *(_OWORD *)((char *)v49 + 12) = *(_OWORD *)&v41[12];
                v47 = v39;
                v48 = v40;
                v46[0] = *(_OWORD *)v38;
                *(_OWORD *)((char *)v46 + 12) = *(_OWORD *)&v38[12];
                v30 = v29(v26, a2, v49, &v47, v46, audioSessionBufferedHose_setRateAndAnchorCompletionHandler, v44);
                if (!(_DWORD)v30)
                {
                  dispatch_semaphore_wait(v45, 0xFFFFFFFFFFFFFFFFLL);
                  v12 = v25;
                  if (!*(_DWORD *)v44)
                  {
                    *(_DWORD *)(a1 + 164) = a2;
                    v49[0] = *(_OWORD *)&v44[4];
                    *(_OWORD *)((char *)v49 + 12) = *(_OWORD *)&v44[16];
                    v31 = (const void *)APSAudioTransportTimeCopyDebugDesc();
                    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50)
                    {
                      a6 = v37;
                      if (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                        || _LogCategory_Initialize())
                      {
                        LogPrintF();
                      }
                      v32 = 0;
                      goto LABEL_38;
                    }
                    v32 = 0;
                    goto LABEL_28;
                  }
                  APSLogErrorAt();
                  v32 = *(unsigned int *)v44;
                  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90)
                  {
                    if (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                      || _LogCategory_Initialize())
                    {
                      LogPrintF();
                    }
                    v31 = 0;
                    v12 = v25;
                    goto LABEL_28;
                  }
                  goto LABEL_27;
                }
                v32 = v30;
              }
              else
              {
                v32 = 4294954514;
                *(_DWORD *)v44 = -12782;
                *(_OWORD *)&v44[4] = v35;
                *(_OWORD *)&v44[16] = v36;
                dispatch_semaphore_signal(v24);
              }
            }
            else
            {
              v32 = 4294954508;
            }
            v12 = v25;
            APSLogErrorAt();
LABEL_27:
            v31 = 0;
LABEL_28:
            a6 = v37;
LABEL_38:
            CFRelease((CFTypeRef)v18);
            goto LABEL_39;
          }
          v21 = *(NSObject **)(v18 + 16);
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 0x40000000;
          v43[2] = __APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime_block_invoke;
          v43[3] = &__block_descriptor_tmp_130;
          v43[4] = v18;
          v43[5] = a1;
          v22 = v43;
        }
        else
        {
          v37 = a6;
          v21 = *(NSObject **)(a1 + 240);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime_block_invoke_2;
          block[3] = &__block_descriptor_tmp_131;
          block[4] = a1;
          v22 = block;
        }
        dispatch_sync(v21, v22);
        goto LABEL_16;
      }
      v32 = 4294895143;
    }
    else
    {
      v32 = 4294895143;
    }
    APSLogErrorAt();
    v31 = 0;
  }
  else
  {
    APSLogErrorAt();
    v31 = 0;
    v32 = 4294895144;
  }
LABEL_39:
  if (v12)
    CFRelease(v12);
  if (v13)
    CFRelease(v13);
  if (v31)
    CFRelease(v31);
  if (a6)
  {
    *a6 = *(_OWORD *)&v44[4];
    *(_OWORD *)((char *)a6 + 12) = *(_OWORD *)&v44[16];
  }
  if (v45)
    dispatch_release(v45);
  return v32;
}

uint64_t APReceiverAudioSessionBufferedHoseApplyVolumeFade(uint64_t a1, uint64_t a2, CMTime *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t ProtocolVTable;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, CMTime *);
  CMTime v12;
  CMTime time;

  if (!a1 || !*(_QWORD *)(a1 + 128))
  {
    APSLogErrorAt();
    return 4294895144;
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    APSGetVolumeFadeTypeName();
    time = *a3;
    CMTimeGetSeconds(&time);
    LogPrintF();
  }
  if ((_DWORD)a2 == 2)
  {
    if (!*(_DWORD *)(a1 + 164))
    {
      v6 = 4294895145;
      APSLogErrorAt();
      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_23;
      }
      return v6;
    }
    goto LABEL_14;
  }
  if ((_DWORD)a2 != 1)
  {
    v6 = 4294895145;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_23;
    }
    return v6;
  }
  if (!*(_DWORD *)(a1 + 164))
  {
LABEL_14:
    v7 = *(_QWORD *)(a1 + 128);
    *(_OWORD *)&v12.value = *(_OWORD *)&a3->value;
    v12.epoch = a3->epoch;
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    ProtocolVTable = CMBaseObjectGetProtocolVTable();
    if (ProtocolVTable && (v9 = *(_QWORD *)(ProtocolVTable + 16)) != 0)
    {
      v10 = *(uint64_t (**)(uint64_t, uint64_t, CMTime *))(v9 + 72);
      if (v10)
      {
        time = v12;
        v6 = v10(v7, a2, &time);
        if (!(_DWORD)v6)
          return v6;
      }
      else
      {
        v6 = 4294954514;
      }
    }
    else
    {
      v6 = 4294954508;
    }
    APSLogErrorAt();
    return v6;
  }
  v6 = 4294895145;
  APSLogErrorAt();
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
LABEL_23:
    LogPrintF();
  }
  return v6;
}

uint64_t audioSessionBufferedHose_setMagicCookieCompletionHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)a4 = a3;
  *(_QWORD *)(a4 + 8) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a4 + 16));
  return 0;
}

uint64_t audioSessionBufferedHose_updatePKDCryptorEncryptionKeyCompletionHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)a4 = a3;
  *(_QWORD *)(a4 + 8) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a4 + 16));
  return 0;
}

uint64_t audioSessionBufferedHose_setRateAndAnchorCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, int a6, uint64_t a7)
{
  __int128 v7;

  *(_DWORD *)a7 = a6;
  v7 = *a5;
  *(_OWORD *)(a7 + 16) = *(__int128 *)((char *)a5 + 12);
  *(_OWORD *)(a7 + 4) = v7;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a7 + 32));
  return 0;
}

uint64_t audioSessionBufferedHose_cancelUnderrun(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 264))
  {
    v1 = result;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50)
    {
      if (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_QWORD *)(v1 + 264) = 0;
  }
  return result;
}

uint64_t audioSessionBufferedHose_setRateCompletionHandler(uint64_t a1, __int128 *a2, __int128 *a3, int a4, uint64_t a5)
{
  __int128 v5;
  __int128 v6;

  *(_DWORD *)a5 = a4;
  v5 = *a2;
  *(_OWORD *)(a5 + 16) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)(a5 + 4) = v5;
  v6 = *a3;
  *(_QWORD *)(a5 + 48) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a5 + 32) = v6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a5 + 56));
  return 0;
}

void audioSessionBufferedHose_finalizeContextWrapper(_QWORD *a1)
{
  NSObject *v2;

  v2 = a1[7];
  if (v2)
    dispatch_release(v2);
  free(a1);
}

uint64_t audioSessionBufferedHose_getAnchorCompletionHandler(uint64_t a1, _OWORD *a2, __int128 *a3, int a4, const void *a5)
{
  uint64_t Value;
  __int128 v10;
  __int128 v11;

  Value = APSWrapperGetValue();
  *(_DWORD *)Value = a4;
  v10 = *(_OWORD *)((char *)a2 + 12);
  *(_OWORD *)(Value + 4) = *a2;
  *(_OWORD *)(Value + 16) = v10;
  v11 = *a3;
  *(_QWORD *)(Value + 48) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(Value + 32) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(Value + 56));
  if (a5)
    CFRelease(a5);
  return 0;
}

uint64_t audioSessionBufferedHose_flushWithinSampleRangeCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_DWORD *)a7 = a6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a7 + 8));
  return 0;
}

uint64_t audioSessionBufferedHose_flushCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_DWORD *)a5 = a4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a5 + 8));
  return 0;
}

void APReceiverAudioSessionBufferedHoseFinalize(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t ProtocolVTable;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, _QWORD);
  uint64_t v13;
  void (*v14)(uint64_t);
  const void *v15;
  NSObject *v16;
  NSObject *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;

  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(a1 + 160))
  {
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRelease(0);
  }
  if (*(_QWORD *)(a1 + 96))
  {
    SendSelfConnectedLoopbackMessage();
    FigThreadJoin();
    *(_QWORD *)(a1 + 96) = 0;
  }
  v2 = *(_DWORD *)(a1 + 64);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error())
      __error();
    *(_DWORD *)(a1 + 64) = -1;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    NetSocket_Delete();
    *(_QWORD *)(a1 + 72) = 0;
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 168) = 0;
  }
  v6 = *(const void **)(a1 + 8);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v7 = *(const void **)(a1 + 32);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_DWORD *)(a1 + 108) = 0;
  if (*(_DWORD *)(a1 + 16))
  {
    *(_DWORD *)(a1 + 16) = 0;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v8 = *(const void **)(a1 + 224);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 224) = 0;
  }
  if (*(_QWORD *)(a1 + 128))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    v9 = *(_QWORD *)(a1 + 128);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    ProtocolVTable = CMBaseObjectGetProtocolVTable();
    if (ProtocolVTable)
    {
      v11 = *(_QWORD *)(ProtocolVTable + 16);
      if (v11)
      {
        v12 = *(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 56);
        if (v12)
          v12(v9, 0, 0);
      }
    }
    v13 = *(_QWORD *)(a1 + 128);
    if (v13)
    {
      v14 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v14)
        v14(v13);
      v15 = *(const void **)(a1 + 128);
      if (v15)
      {
        CFRelease(v15);
        *(_QWORD *)(a1 + 128) = 0;
      }
    }
  }
  v16 = *(NSObject **)(a1 + 248);
  if (v16)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 248));
    dispatch_release(v16);
    *(_QWORD *)(a1 + 248) = 0;
  }
  v17 = *(NSObject **)(a1 + 240);
  if (v17)
  {
    dispatch_release(v17);
    *(_QWORD *)(a1 + 240) = 0;
  }
  FigSimpleMutexDestroy();
  FigSimpleMutexDestroy();
  v18 = *(const void **)(a1 + 144);
  if (v18)
  {
    CFRelease(v18);
    *(_QWORD *)(a1 + 144) = 0;
  }
  v19 = *(const void **)(a1 + 152);
  if (v19)
    CFRelease(v19);
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 208));
  v20 = *(const void **)(a1 + 208);
  if (v20)
  {
    CFRelease(v20);
    *(_QWORD *)(a1 + 208) = 0;
  }
  v21 = *(const void **)(a1 + 200);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(a1 + 200) = 0;
  }
  FigSimpleMutexDestroy();
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v22 = *(const void **)(a1 + 24);
  if (v22)
    CFRelease(v22);
  free((void *)a1);
}

uint64_t APReceiverAudioSessionBufferedHoseInvalidate(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 128);
  if (result)
    return APSEndpointStreamAudioHoseSBARInvalidate();
  return result;
}

uint64_t APReceiverAudioSessionBufferedHoseConvertProgressRTPTimeToSecond(uint64_t a1, int a2, int a3, int a4, double *a5, double *a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t result;

  if (a1)
  {
    v10 = (double)(a3 - a2);
    APSAudioFormatDescriptionGetSampleRate();
    v12 = v10 / (double)v11;
    APSAudioFormatDescriptionGetSampleRate();
    v14 = (double)(a4 - a2) / (double)v13;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 40
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (a5)
      *a5 = v12;
    result = 0;
    if (a6)
      *a6 = v14;
  }
  else
  {
    APSLogErrorAt();
    return 4294895144;
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedHoseStartPacketProcesser(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  if (*(_BYTE *)(a1 + 160))
  {
    v2 = 4294895143;
    goto LABEL_17;
  }
  *(_QWORD *)(a1 + 176) = mach_absolute_time();
  if (!*(_QWORD *)(a1 + 56))
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
    if (*(_QWORD *)(a1 + 96))
    {
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
      goto LABEL_7;
    }
    v2 = FigThreadCreate();
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
    if (!(_DWORD)v2)
      goto LABEL_7;
LABEL_17:
    APSLogErrorAt();
    return v2;
  }
LABEL_7:
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 0;
    dispatch_sync_f(*(dispatch_queue_t *)(v3 + 112), &v7, (dispatch_function_t)controlServer_startInternal);
    v2 = v8;
    if ((_DWORD)v8)
      goto LABEL_17;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    CMBaseObject = APTransportConnectionGetCMBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(CMBaseObject, *MEMORY[0x24BDFD7C8], *MEMORY[0x24BDBD270]);
  }
  else
  {
    audioSessionBufferedHose_resumeNetworkReads(a1);
  }
  v2 = 0;
  *(_BYTE *)(a1 + 160) = 1;
  return v2;
}

uint64_t audioSessionBufferedHose_networkThread(uint64_t a1)
{
  int v2;
  unint64_t v3;
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t DefaultAirPlayMallocZoneCFAllocator;
  const __CFAllocator *v13;
  int v14;
  int v15;
  unsigned int v16;
  size_t v17;
  unsigned int v18;
  size_t v19;
  void *v20;
  int v21;
  OSStatus v22;
  __CFArray *Mutable;
  CFIndex Count;
  uint64_t v25;
  uint64_t ProtocolVTable;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  const __CFAllocator *structureAllocator;
  int v36;
  const __CFAllocator *blockAllocator;
  unint64_t v38;
  int v39;
  fd_set v40;
  CMBlockBufferRef blockBufferOut;
  unsigned __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v2 = *(_DWORD *)(a1 + 80);
  v3 = *(int *)(a1 + 64);
  memset(&v40, 0, sizeof(v40));
  pthread_setname_np("AirPlayAudioReceiver");
  if (!*(_QWORD *)(a1 + 56))
  {
    if (SocketAccept() || SocketSetP2P())
      goto LABEL_107;
    if (!*(_BYTE *)(a1 + 117))
      SocketSetQoS();
    v2 = -1;
    v4 = *(_DWORD *)(a1 + 80);
    if ((v4 & 0x80000000) == 0)
    {
      if (close(v4) && *__error())
        __error();
      *(_DWORD *)(a1 + 80) = -1;
    }
    if (NetSocket_CreateWithNative())
    {
LABEL_107:
      APSLogErrorAt();
      return 0;
    }
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v2 < 0)
    v5 = -1;
  else
    v5 = v2;
  v6 = 1 << v2;
  v38 = (unint64_t)v2 >> 5;
  v39 = 1 << v3;
  v7 = v3 >> 5;
  structureAllocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v36 = v5;
  while (1)
  {
    while (1)
    {
      memset(&v40, 0, sizeof(v40));
      if (*(_BYTE *)(a1 + 124))
      {
        v8 = __darwin_check_fd_set_overflow(v2, &v40, 0);
        v9 = v5;
        if (v8)
        {
          v40.fds_bits[v38] |= v6;
          v9 = v5;
        }
      }
      else
      {
        v9 = -1;
      }
      if ((int)v3 <= v9)
        v10 = v9;
      else
        v10 = v3;
      if (__darwin_check_fd_set_overflow(v3, &v40, 0))
        v40.fds_bits[v7] |= v39;
      v11 = select(v10 + 1, &v40, 0, 0, 0);
      if (v11 > 0)
        break;
      if (v11 && *__error())
      {
        v30 = *__error();
        if (!v30)
          break;
        if (v30 == 4)
          continue;
      }
      usleep(0x186A0u);
    }
    if (__darwin_check_fd_set_overflow(v2, &v40, 0) && (v40.fds_bits[v38] & v6) != 0)
      break;
LABEL_83:
    if (__darwin_check_fd_set_overflow(v3, &v40, 0) && (v40.fds_bits[v7] & v39) != 0)
    {
      LOBYTE(blockBufferOut) = 0;
      v44 = 0;
      v33 = SocketRecvFrom();
      if (v33 != 35)
      {
        if (v33)
        {
          APSLogErrorAt();
        }
        else if (blockBufferOut == 113)
        {
          goto LABEL_102;
        }
      }
    }
    else
    {
      APSNetworkClockLogCurrentNetworkTime();
    }
  }
  v43 = 0;
  v42 = 0;
  v44 = 0;
  DefaultAirPlayMallocZoneCFAllocator = APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
  blockBufferOut = 0;
  blockAllocator = (const __CFAllocator *)DefaultAirPlayMallocZoneCFAllocator;
  if (*(_QWORD *)(a1 + 56))
  {
    APSLogErrorAt();
LABEL_70:
    v20 = 0;
    v32 = -72153;
    goto LABEL_77;
  }
  v13 = (const __CFAllocator *)DefaultAirPlayMallocZoneCFAllocator;
  v14 = *(_DWORD *)(a1 + 40);
  if (v14 == 1381257248)
  {
    v15 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 24))(*(_QWORD *)(a1 + 72), 2);
    if (!v15)
    {
      v31 = bswap32(v42) >> 16;
      if (v31 <= 1)
        goto LABEL_98;
      v18 = v31 - 2;
      v17 = 1;
      if (!v18)
        goto LABEL_62;
LABEL_38:
      v19 = v18;
      v20 = CFAllocatorAllocate(v13, v18, 0);
      if (!v20)
      {
        APSLogErrorAt();
        v32 = -6728;
        goto LABEL_63;
      }
      v21 = (*(uint64_t (**)(_QWORD, size_t))(*(_QWORD *)(a1 + 72) + 24))(*(_QWORD *)(a1 + 72), v19);
      if (v21)
      {
        v32 = v21;
      }
      else
      {
        if (v44 != v19)
        {
          APSLogErrorAt();
          v32 = -72153;
          goto LABEL_63;
        }
        v22 = CMBlockBufferCreateWithMemoryBlock(structureAllocator, v20, v19, blockAllocator, 0, v17, v19 - v17, 0, &blockBufferOut);
        if (!v22)
        {
          pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 136));
          Mutable = *(__CFArray **)(a1 + 144);
          if (!Mutable)
          {
            Mutable = CFArrayCreateMutable(structureAllocator, 128, MEMORY[0x24BDBD690]);
            *(_QWORD *)(a1 + 144) = Mutable;
          }
          CFArrayAppendValue(Mutable, blockBufferOut);
          Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 144));
          pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 136));
          v25 = *(_QWORD *)(a1 + 128);
          APSEndpointStreamAudioHoseProtocolGetProtocolID();
          ProtocolVTable = CMBaseObjectGetProtocolVTable();
          if (ProtocolVTable)
          {
            v27 = *(_QWORD *)(ProtocolVTable + 16);
            v5 = v36;
            if (v27)
            {
              v28 = *(uint64_t (**)(uint64_t))(v27 + 40);
              if (v28)
              {
                v29 = v28(v25);
                if (!v29)
                {
                  if (Count >= 128)
                  {
                    if (*(_QWORD *)(a1 + 56))
                      goto LABEL_100;
                    if (*(_BYTE *)(a1 + 124))
                    {
                      if (gLogCategory_APReceiverAudioSessionBufferedHose <= 20
                        && (gLogCategory_APReceiverAudioSessionBufferedHose != -1
                         || _LogCategory_Initialize()))
                      {
                        LogPrintF();
                      }
                      *(_BYTE *)(a1 + 124) = 0;
                      if (SendSelfConnectedLoopbackMessage())
LABEL_100:
                        APSLogErrorAt();
                    }
                  }
                  v32 = 0;
                  goto LABEL_76;
                }
                v32 = v29;
              }
              else
              {
                v32 = -12782;
              }
            }
            else
            {
              v32 = -12788;
            }
          }
          else
          {
            v32 = -12788;
            v5 = v36;
          }
          APSLogErrorAt();
          v20 = 0;
          goto LABEL_77;
        }
        v32 = v22;
      }
      APSLogErrorAt();
      goto LABEL_63;
    }
LABEL_91:
    v32 = v15;
LABEL_76:
    v20 = 0;
    goto LABEL_77;
  }
  if (v14 != 1095778640)
  {
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 90
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_70;
  }
  v15 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 24))(*(_QWORD *)(a1 + 72), 4);
  if (v15)
    goto LABEL_91;
  v16 = bswap32(v43);
  if (v16 <= 3)
  {
LABEL_98:
    APSLogErrorAt();
    v20 = 0;
    v32 = -6733;
    goto LABEL_77;
  }
  v17 = 0;
  v18 = v16 - 4;
  if (v18)
    goto LABEL_38;
LABEL_62:
  v32 = 0;
  v20 = 0;
LABEL_63:
  v5 = v36;
LABEL_77:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (v20)
    CFAllocatorDeallocate(blockAllocator, v20);
  v6 = 1 << v2;
  if (v32 != -6753 && v32 != -6723)
    goto LABEL_83;
LABEL_102:
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 30
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t APReceiverAudioSessionBufferedHoseStopPacketProcesser(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t CMBaseObject;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 160))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 0;
      dispatch_sync_f(*(dispatch_queue_t *)(v2 + 112), &v8, (dispatch_function_t)controlServer_stopInternal);
      v3 = v9;
    }
    else
    {
      v3 = 0;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      CMBaseObject = APTransportConnectionGetCMBaseObject();
      if (CMBaseObject)
      {
        v5 = CMBaseObject;
        v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v6)
          v3 = v6(v5);
        else
          v3 = 4294954514;
      }
      else
      {
        v3 = 4294954516;
      }
    }
    if ((*(_DWORD *)(a1 + 64) & 0x80000000) == 0)
      v3 = SendSelfConnectedLoopbackMessage();
    if (*(_QWORD *)(a1 + 72))
      v3 = NetSocket_Cancel();
    if (*(_QWORD *)(a1 + 96))
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
      v3 = FigThreadJoin();
      *(_QWORD *)(a1 + 96) = 0;
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
    }
    *(_QWORD *)(a1 + 184) = mach_absolute_time();
    *(_BYTE *)(a1 + 160) = 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294895143;
  }
  return v3;
}

uint64_t APReceiverAudioSessionBufferedHoseCopyMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
  {
    if (a2)
    {
      CFDictionarySetInt64();
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return 4294895145;
    }
  }
  else
  {
    v2 = 4294895144;
    APSLogErrorAt();
  }
  return v2;
}

uint64_t APReceiverAudioSessionBufferedHoseLogEnded(uint64_t result, uint64_t a2)
{
  __CFDictionary *Mutable;

  if (result)
  {
    if (a2)
    {
      APSNetworkClockReportRTCMetrics();
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      FigCFDictionarySetInt32();
      UpTicksToSeconds();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      CFDictionarySetValue(Mutable, CFSTR("sessionType"), CFSTR("AudioBuffered"));
      APSRTCReportingAgentSendMediaEvent();
      APSRTCReportingAgentSendEvent();
      if (Mutable)
        CFRelease(Mutable);
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return 4294895145;
    }
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedHoseCopyProperty(uint64_t a1, CFTypeRef cf1, int *a3)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, uint64_t *);
  int v8;
  const void *v9;
  uint64_t Int64;
  const __CFAllocator *v11;
  unsigned int *p_valuePtr;
  CFNumberType v13;
  double v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, _QWORD, _QWORD, uint64_t *);
  const void **v18;
  unsigned int valuePtr;
  uint64_t v20;

  v20 = 0;
  if (!a1)
  {
    APSLogErrorAt();
    v8 = -72152;
    goto LABEL_24;
  }
  if (!cf1)
  {
    APSLogErrorAt();
    v8 = -72151;
    goto LABEL_24;
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 30
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!CFEqual(cf1, CFSTR("VolumeLinear")))
  {
    if (CFEqual(cf1, CFSTR("AudioFormat")))
    {
      v9 = *(const void **)(a1 + 152);
LABEL_13:
      Int64 = (uint64_t)CFRetain(v9);
LABEL_23:
      v8 = 0;
      v20 = Int64;
      goto LABEL_24;
    }
    if (CFEqual(cf1, CFSTR("MediaDataControlPort")))
    {
      Int64 = CFNumberCreateInt64();
      goto LABEL_23;
    }
    if (CFEqual(cf1, CFSTR("MaximumLatency")) || CFEqual(cf1, CFSTR("PlatformAudioLatency")))
    {
      valuePtr = 0;
    }
    else
    {
      if (CFEqual(cf1, CFSTR("AudioPort")))
      {
        v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        p_valuePtr = (unsigned int *)(a1 + 108);
        v13 = kCFNumberIntType;
        goto LABEL_22;
      }
      if (!CFEqual(cf1, CFSTR("SampleRate")))
      {
        if (CFEqual(cf1, CFSTR("audioBufferSize")))
        {
          v16 = *(_QWORD *)(a1 + 128);
          v17 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v17)
            v8 = v17(v16, *MEMORY[0x24BE03818], *MEMORY[0x24BDBD240], &v20);
          else
            v8 = -12782;
          goto LABEL_24;
        }
        if (CFEqual(cf1, CFSTR("IsPlayingBufferedAudio")))
        {
          v18 = (const void **)MEMORY[0x24BDBD270];
          if (!*(_DWORD *)(a1 + 164))
            v18 = (const void **)MEMORY[0x24BDBD268];
        }
        else
        {
          if (!CFEqual(cf1, CFSTR("IsUsingScreen")))
          {
            if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
              && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v8 = -72154;
            goto LABEL_24;
          }
          v18 = (const void **)MEMORY[0x24BDBD268];
        }
        v9 = *v18;
        goto LABEL_13;
      }
      APSAudioFormatDescriptionGetSampleRate();
      valuePtr = v15;
    }
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    p_valuePtr = &valuePtr;
    v13 = kCFNumberSInt32Type;
LABEL_22:
    Int64 = (uint64_t)CFNumberCreate(v11, v13, p_valuePtr);
    goto LABEL_23;
  }
  v6 = *(_QWORD *)(a1 + 128);
  v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v7)
  {
    v8 = v7(v6, *MEMORY[0x24BE03870], *MEMORY[0x24BDBD240], &v20);
    if (!v8)
      goto LABEL_24;
  }
  else
  {
    v8 = -12782;
  }
  APSLogErrorAt();
LABEL_24:
  if (a3)
    *a3 = v8;
  return v20;
}

uint64_t APReceiverAudioSessionBufferedHoseSetProperty(uint64_t a1, CFTypeRef cf1, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, const __CFString *, uint64_t);

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  if (!cf1 || !a3)
  {
    APSLogErrorAt();
    return 4294895145;
  }
  if (gLogCategory_APReceiverAudioSessionBufferedHose <= 40
    && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFEqual(cf1, CFSTR("VolumeLinear")))
  {
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = *(_QWORD *)(a1 + 128);
    v8 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (!v8)
    {
      v6 = 4294954514;
LABEL_22:
      APSLogErrorAt();
      return v6;
    }
    v6 = v8(v7, CFSTR("VolumeLinear"), a3);
    if ((_DWORD)v6)
      goto LABEL_22;
  }
  else if (CFEqual(cf1, CFSTR("RTCMetadata")))
  {
    APSRTCReportingAgentSendMediaEvent();
    return 0;
  }
  else
  {
    v6 = 4294895142;
    if (gLogCategory_APReceiverAudioSessionBufferedHose <= 50
      && (gLogCategory_APReceiverAudioSessionBufferedHose != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v6;
}

uint64_t APReceiverAudioSessionPlatformCreate(const void *a1, CFDictionaryRef theDict, uint64_t *a3)
{
  const void *Value;
  CFTypeID v7;
  CFTypeID v8;
  uint64_t Instance;
  uint64_t v10;
  uint64_t *v11;
  uint64_t Int64;
  uint64_t v13;
  const void *v14;
  const void *v15;
  CFTypeRef *v16;
  const void *TypedValue;
  int v18;
  BOOL v20;
  int v21;
  int v22;
  BOOL v24;
  const void *v25;
  const void *v26;
  const void *v27;
  APAVAudioSessionManager *v28;
  const __CFString *v29;
  AUGraph *v30;
  const void *v31;
  const char *v32;
  uint64_t result;
  int v34;
  uint64_t AudioFormatIndex;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  OSStatus v40;
  OSStatus v41;
  OSType v42;
  OSStatus v43;
  AudioUnit *v44;
  OSStatus v45;
  OSStatus v46;
  OSStatus v47;
  OSStatus Property;
  OpaqueAudioComponentInstance *v49;
  double v50;
  AUNode *v51;
  OSStatus v52;
  AudioUnit *v53;
  OSStatus v54;
  OSStatus v55;
  OSStatus v56;
  OSStatus v57;
  float v58;
  OSStatus v59;
  OSStatus v60;
  int v61;
  OpaqueAudioComponentInstance *v62;
  double v63;
  OSStatus v64;
  OSStatus v65;
  AudioUnit *v66;
  OSStatus v67;
  int v68;
  OSStatus v69;
  OSStatus v70;
  int v71;
  OSStatus v72;
  OSStatus v73;
  AudioUnit *v74;
  OSStatus v75;
  OSStatus v76;
  int v77;
  OSStatus v78;
  OSStatus v79;
  int v80;
  OSStatus v81;
  AUNode v82;
  OSStatus v83;
  OSStatus v84;
  UInt32 v85;
  UInt32 v86;
  unint64_t v87;
  unint64_t v88;
  unsigned int v89;
  AudioObjectID *v90;
  AudioObjectID *v91;
  uint64_t v92;
  AudioObjectID *v93;
  AudioObjectID v94;
  unint64_t v95;
  unsigned int v96;
  unsigned int *v97;
  unint64_t v98;
  unsigned int *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  const void *v103;
  OSStatus v104;
  double v105;
  NSObject *v106;
  NSObject *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  int v117;
  CFNumberRef v118;
  CFNumberRef v119;
  CFNumberRef v120;
  CFNumberRef v121;
  const void *v122;
  uint64_t v123;
  _OWORD *v124;
  uint64_t v125;
  const char *v126;
  double v127;
  double v128;
  const char *v129;
  uint64_t *v130;
  AudioStreamBasicDescription *asbd;
  unsigned int v132;
  int v133;
  _OWORD outData[2];
  uint64_t v135;
  UInt32 ioDataSize[2];
  AURenderCallbackStruct inInputCallback;
  AudioComponentDescription inDescription;
  uint64_t inData;
  uint64_t v140;
  void (*v141)(uint64_t);
  void *v142;
  uint64_t v143;
  AudioObjectPropertyAddress inAddress;
  uint64_t valuePtr;
  double v146;
  double v147;
  UInt32 outDataSize;
  AudioUnit outAudioUnit;
  AUNode outNode;
  UInt32 outNumberOfNodes[4];

  Value = CFDictionaryGetValue(theDict, CFSTR("RASP::LogPrefix"));
  v7 = CFGetTypeID(a1);
  if (gAPReceiverAudioSessionInitOnce != -1)
    dispatch_once_f(&gAPReceiverAudioSessionInitOnce, 0, (dispatch_function_t)_APReceiverAudioSessionGetTypeID);
  if (v7 != gAPReceiverAudioSessionTypeID || (v8 = CFGetTypeID(theDict), v8 != CFDictionaryGetTypeID()) || !a3)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    v122 = Value;
    LogPrintF();
  }
  if (gAPReceiverAudioSessionPlatformInitOnce != -1)
    dispatch_once_f(&gAPReceiverAudioSessionPlatformInitOnce, 0, (dispatch_function_t)_APReceiverAudioSessionPlatformGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  v10 = Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  v11 = (uint64_t *)(Instance + 16);
  *(_QWORD *)(Instance + 256) = 0;
  *(_OWORD *)(Instance + 224) = 0u;
  *(_OWORD *)(Instance + 240) = 0u;
  *(_OWORD *)(Instance + 192) = 0u;
  *(_OWORD *)(Instance + 208) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  Int64 = APSSettingsGetInt64();
  v13 = APSSettingsGetInt64();
  v14 = (const void *)v11[3];
  if (Value)
    CFRetain(Value);
  *(_QWORD *)(v10 + 40) = Value;
  if (v14)
    CFRelease(v14);
  *(_QWORD *)(v10 + 24) = a1;
  if (gAirPlayReceiverSessionInitOnce != -1)
    dispatch_once_f(&gAirPlayReceiverSessionInitOnce, 0, (dispatch_function_t)_GetTypeID_5264);
  *v11 = CFDictionaryGetTypedValue();
  *(_DWORD *)(v10 + 48) = CFDictionaryGetInt64();
  v15 = CFDictionaryGetValue(theDict, CFSTR("RASP::AudioFormat"));
  if (v15)
    v15 = CFRetain(v15);
  *(_QWORD *)(v10 + 56) = v15;
  v16 = (CFTypeRef *)(v10 + 56);
  if (!APSAudioFormatDescriptionGetAudioFormatIndex())
  {
    if (*v16)
    {
      CFRelease(*v16);
      *v16 = 0;
    }
    v132 = APSAudioFormatDescriptionCreateWithAudioFormatIndex();
    if (v132)
      goto LABEL_473;
  }
  APSAudioFormatDescriptionGetAudioFormatIndex();
  asbd = (AudioStreamBasicDescription *)(v10 + 80);
  v132 = APAudioFormatIndexToPCMASBD();
  if (v132)
    goto LABEL_473;
  *(_BYTE *)(v10 + 64) = CFDictionaryGetInt64() != 0;
  *(_BYTE *)(v10 + 69) = CFDictionaryGetInt64() != 0;
  CFStringGetTypeID();
  TypedValue = (const void *)CFDictionaryGetTypedValue();
  if (TypedValue && !CFEqual(TypedValue, CFSTR("NTP")))
  {
    v20 = 0;
  }
  else
  {
    v18 = *(_DWORD *)(v10 + 48);
    v20 = v18 == 96 || v18 == 103;
  }
  *(_BYTE *)(v10 + 65) = v20;
  CFObjectGetPropertyDoubleSync();
  APSVolumeConvertDBToLinearGain();
  *(_DWORD *)(v10 + 236) = v21;
  v22 = *(_DWORD *)(v10 + 48);
  v24 = v22 == 96 || v22 == 103;
  *(_BYTE *)(v10 + 68) = v24;
  *(_BYTE *)(v10 + 66) = 0;
  CFStringGetTypeID();
  v25 = (const void *)CFDictionaryGetTypedValue();
  if (v25)
  {
    if ((v26 = v25, Int64) && CFEqual(v25, CFSTR("speechRecognition")) || v13 && CFEqual(v26, CFSTR("telephony")))
      *(_BYTE *)(v10 + 66) = 1;
  }
  *(_BYTE *)(v10 + 67) = 0;
  CFStringGetTypeID();
  v27 = (const void *)CFDictionaryGetTypedValue();
  if (v27 && CFEqual(v27, CFSTR("moviePlayback")))
    *(_BYTE *)(v10 + 67) = 1;
  if (CFDictionaryGetInt64())
    v28 = +[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager");
  else
    v28 = +[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager");
  *(_QWORD *)(v10 + 32) = v28;
  if (*(_BYTE *)(v10 + 67))
    v29 = CFSTR("moviePlayback");
  else
    v29 = CFSTR("default");
  _UpdateAVAudioSessionAudioMode_4476(v10, (uint64_t)v29);
  memset(&inDescription, 0, sizeof(inDescription));
  inInputCallback.inputProc = 0;
  inInputCallback.inputProcRefCon = 0;
  v135 = 0;
  *(_QWORD *)ioDataSize = 0;
  memset(outData, 0, sizeof(outData));
  v133 = 0;
  if (!*(_QWORD *)(v10 + 24))
  {
    APSLogErrorAt();
    v34 = -6718;
    goto LABEL_468;
  }
  v30 = (AUGraph *)(v10 + 192);
  if (*(_QWORD *)(v10 + 192) || *(_QWORD *)(v10 + 128))
    goto LABEL_430;
  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    v31 = *(const void **)(v10 + 40);
    if (APSAudioFormatDescriptionGetAudioFormatIndex() == 6)
    {
      v32 = "PCM/24000/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 10)
    {
      v32 = "PCM/44100/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 11)
    {
      v32 = "PCM/44100/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 15)
    {
      v32 = "PCM/48000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 18)
    {
      v32 = "ALAC/44100/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 22)
    {
      v32 = "AAC-LC/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 24)
    {
      v32 = "AAC-ELD/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 2)
    {
      v32 = "PCM/8000/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 3)
    {
      v32 = "PCM/8000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 4)
    {
      v32 = "PCM/16000/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 5)
    {
      v32 = "PCM/16000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 7)
    {
      v32 = "PCM/24000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 8)
    {
      v32 = "PCM/32000/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 9)
    {
      v32 = "PCM/32000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 12)
    {
      v32 = "PCM/44100/24/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 13)
    {
      v32 = "PCM/44100/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 14)
    {
      v32 = "PCM/48000/16/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 16)
    {
      v32 = "PCM/48000/24/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 17)
    {
      v32 = "PCM/48000/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 45)
    {
      v32 = "PCM/48000/32f/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 46)
    {
      v32 = "PCM/48000/32f/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 44)
    {
      v32 = "PCM/48000/16/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 38)
    {
      v32 = "PCM/48000/16/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 78)
    {
      v32 = "PCM/48000/16/7.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 80)
    {
      v32 = "PCM/48000/16/5.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 82)
    {
      v32 = "PCM/48000/16/7.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 84)
    {
      v32 = "PCM/48000/16/7.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 47)
    {
      v32 = "PCM/48000/32f/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 48)
    {
      v32 = "PCM/48000/32f/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 79)
    {
      v32 = "PCM/48000/32f/7.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 81)
    {
      v32 = "PCM/48000/32f/5.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 83)
    {
      v32 = "PCM/48000/32f/7.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 69)
    {
      v32 = "PCM/48000/32f/7.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 85)
    {
      v32 = "ALAC/44100/20/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 19)
    {
      v32 = "ALAC/44100/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 20)
    {
      v32 = "ALAC/48000/16/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 86)
    {
      v32 = "ALAC/48000/20/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 21)
    {
      v32 = "ALAC/48000/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 40)
    {
      v32 = "AAC_LC/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 39)
    {
      v32 = "AAC_LC/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 90)
    {
      v32 = "AAC_LC/48000/7.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 23)
    {
      v32 = "AAC-LC/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 42)
    {
      v32 = "AAC_ELD/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 41)
    {
      v32 = "AAC_ELD/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 25)
    {
      v32 = "AAC-ELD/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 26)
    {
      v32 = "AAC-ELD/16000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 27)
    {
      v32 = "AAC-ELD/24000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 28)
    {
      v32 = "OPUS/16000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 29)
    {
      v32 = "OPUS/24000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 30)
    {
      v32 = "OPUS/48000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 31)
    {
      v32 = "AAC-ELD/44100/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 32)
    {
      v32 = "AAC-ELD/48000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 43)
    {
      v32 = "AAC-ELD/32000/1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 49)
    {
      v32 = "DDPLUS/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 50)
    {
      v32 = "DDPLUS/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 51)
    {
      v32 = "DDPLUS/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 52)
    {
      v32 = "DDPLUS/48000/7.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 53)
    {
      v32 = "DDPLUS/48000/9.1.6";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 54)
    {
      v32 = "QAAC/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 55)
    {
      v32 = "QAAC/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 56)
    {
      v32 = "QAAC/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 57)
    {
      v32 = "QAACHE/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 58)
    {
      v32 = "QAACHE/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 60)
    {
      v32 = "QAACHE/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 89)
    {
      v32 = "PAAC/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 61)
    {
      v32 = "QLAC/48000/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 62)
    {
      v32 = "QC3/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 63)
    {
      v32 = "QC3/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 33)
    {
      v32 = "QC3/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 34)
    {
      v32 = "QC3/48000/7.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 35)
    {
      v32 = "QC3/48000/9.1.6";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 87)
    {
      v32 = "QAC3/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 88)
    {
      v32 = "QEC3/48000/7.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 64)
    {
      v32 = "APAC/48000/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 65)
    {
      v32 = "APAC/48000/5.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 66)
    {
      v32 = "APAC/48000/5.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 67)
    {
      v32 = "APAC/48000/7.1";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 76)
    {
      v32 = "APAC/48000/5.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 77)
    {
      v32 = "APAC/48000/7.1.2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 68)
    {
      v32 = "APAC/48000/7.1.4";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 70)
    {
      v32 = "QAAC/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 71)
    {
      v32 = "QAACHE/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 72)
    {
      v32 = "QAACHEV2/44100/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 73)
    {
      v32 = "QLAC/44100/24/2";
    }
    else if (APSAudioFormatDescriptionGetAudioFormatIndex() == 74)
    {
      v32 = "MP3/44100/2";
    }
    else
    {
      AudioFormatIndex = APSAudioFormatDescriptionGetAudioFormatIndex();
      v32 = "";
      if (AudioFormatIndex == 75)
        v32 = "MP3/48000/2";
    }
    v36 = "yes";
    if (*(_BYTE *)(v10 + 64))
      v37 = "yes";
    else
      v37 = "no";
    if (*(_BYTE *)(v10 + 65))
      *(double *)&v38 = COERCE_DOUBLE("yes");
    else
      *(double *)&v38 = COERCE_DOUBLE("no");
    if (*(_BYTE *)(v10 + 66))
      *(double *)&v39 = COERCE_DOUBLE("yes");
    else
      *(double *)&v39 = COERCE_DOUBLE("no");
    if (!*(_BYTE *)(v10 + 68))
      v36 = "no";
    v128 = *(double *)&v39;
    v129 = v36;
    v126 = v37;
    v127 = *(double *)&v38;
    v122 = v31;
    v124 = v32;
    LogPrintF();
  }
  if (*(_DWORD *)(v10 + 48) != 103)
  {
    if (*(_DWORD *)(v10 + 108) < 3u)
    {
      if (gLogCategory_APReceiverAudioSessionPlatform > 50
        || gLogCategory_APReceiverAudioSessionPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_265;
      }
    }
    else if (gLogCategory_APReceiverAudioSessionPlatform > 50
           || gLogCategory_APReceiverAudioSessionPlatform == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_265;
    }
    v122 = *(const void **)(v10 + 40);
    LogPrintF();
LABEL_265:
    _UpdateAVAudioSessionPrefersMultiChannelAudio(v10);
  }
  APSEnsureCanInitiatePlayback();
  *(_DWORD *)(v10 + 72) = *(_DWORD *)(v10 + 48);
  if (CFDictionaryGetInt64())
  {
    *(_BYTE *)(v10 + 70) = 1;
LABEL_430:
    result = 0;
    *a3 = v10;
    return result;
  }
  if (*(_QWORD *)(*v11 + 592) && *(_BYTE *)(v10 + 69) && !APSGetFBOPropertyInt64())
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v101 = *(_QWORD *)(*v11 + 592);
    APSAudioFormatDescriptionGetAudioFormatIndex();
    v102 = APAudioFormatIndexToPCMASBD();
    if (v102)
    {
      v34 = v102;
    }
    else
    {
      v103 = *(const void **)(v10 + 120);
      if (v103)
      {
        CFRelease(v103);
        *(_QWORD *)(v10 + 120) = 0;
      }
      v104 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], asbd, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(v10 + 120));
      if (!v104)
      {
        *(_QWORD *)(v10 + 128) = v101;
        *(_QWORD *)(v10 + 152) = 0;
        *(_DWORD *)(v10 + 168) = (int)(*(double *)(v10 + 80)
                                     * (double)(unint64_t)((int)APSScreenLatencyMs() + 10)
                                     / 1000.0);
        if (APSIsATVInHTGroup() && *(_BYTE *)(v10 + 69))
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v10 + 32), "session"), "outputLatency");
          *(_DWORD *)(v10 + 168) += (int)(v105 * *(double *)(v10 + 80));
        }
        v106 = FigDispatchQueueCreateWithPriority();
        *(_QWORD *)(v10 + 136) = v106;
        v107 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v106);
        v108 = MEMORY[0x24BDAC760];
        *(_QWORD *)(v10 + 144) = v107;
        inData = v108;
        v140 = 3221225472;
        v141 = ___SBufConsumerEnsureSetup_block_invoke;
        v142 = &__block_descriptor_40_e5_v8__0l;
        v143 = v10;
        dispatch_source_set_event_handler(v107, &inData);
        dispatch_source_set_timer(*(dispatch_source_t *)(v10 + 144), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
        dispatch_resume(*(dispatch_object_t *)(v10 + 144));
        if (gLogCategory_APReceiverAudioSessionPlatform <= 50
          && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_430;
      }
      v34 = v104;
    }
  }
  else
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v40 = NewAUGraph((AUGraph *)(v10 + 192));
    if (v40)
    {
      v34 = v40;
    }
    else
    {
      v41 = AUGraphOpen(*v30);
      if (v41)
      {
        v34 = v41;
      }
      else
      {
        if (*(_BYTE *)(v10 + 66))
          v42 = 1987078511;
        else
          v42 = 1919512419;
        inDescription.componentType = 1635086197;
        inDescription.componentSubType = v42;
        *(_QWORD *)&inDescription.componentManufacturer = 1634758764;
        inDescription.componentFlagsMask = 0;
        v43 = AUGraphAddNode(*(AUGraph *)(v10 + 192), &inDescription, (AUNode *)(v10 + 216));
        if (v43)
        {
          v34 = v43;
        }
        else
        {
          v130 = a3;
          v44 = (AudioUnit *)(v10 + 224);
          v45 = AUGraphNodeInfo(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 216), 0, (AudioUnit *)(v10 + 224));
          if (v45)
          {
            v34 = v45;
          }
          else
          {
            LODWORD(inData) = 0;
            LODWORD(inData) = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 32), "session"), "opaqueSessionID");
            v46 = AudioUnitSetProperty(*(AudioUnit *)(v10 + 224), 0x7E7u, 2u, 0, &inData, 4u);
            if (v46)
            {
              v34 = v46;
            }
            else
            {
              v47 = AudioUnitInitialize(*v44);
              if (v47)
              {
                v34 = v47;
              }
              else
              {
                ioDataSize[0] = 40;
                Property = AudioUnitGetProperty(*v44, 8u, 2u, 0, outData, ioDataSize);
                if (Property)
                {
                  v34 = Property;
                }
                else
                {
                  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
                  {
                    v122 = *(const void **)(v10 + 40);
                    v124 = outData;
                    LogPrintF();
                  }
                  v49 = *(OpaqueAudioComponentInstance **)(v10 + 224);
                  v50 = *(double *)outData;
                  *(_OWORD *)&inDescription.componentType = xmmword_21E1B1CF0;
                  inDescription.componentFlagsMask = 0;
                  v51 = (AUNode *)(v10 + 200);
                  v52 = AUGraphAddNode(*(AUGraph *)(v10 + 192), &inDescription, (AUNode *)(v10 + 200));
                  if (v52)
                  {
                    v34 = v52;
                  }
                  else
                  {
                    v53 = (AudioUnit *)(v10 + 208);
                    v54 = AUGraphNodeInfo(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 200), 0, (AudioUnit *)(v10 + 208));
                    if (v54)
                    {
                      v34 = v54;
                    }
                    else
                    {
                      ioDataSize[1] = 1;
                      v55 = AudioUnitSetProperty(*v53, 0xBu, 1u, 0, &ioDataSize[1], 4u);
                      if (v55)
                      {
                        v34 = v55;
                      }
                      else
                      {
                        *(_OWORD *)((char *)outData + 12) = xmmword_21E1B1D00;
                        LODWORD(v135) = 32;
                        if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                          && (gLogCategory_APReceiverAudioSessionPlatform != -1
                           || _LogCategory_Initialize()))
                        {
                          v122 = *(const void **)(v10 + 40);
                          v124 = outData;
                          LogPrintF();
                        }
                        v56 = AudioUnitSetProperty(*v44, 8u, 1u, 0, outData, 0x28u);
                        if (v56)
                        {
                          v34 = v56;
                        }
                        else
                        {
                          v57 = AudioUnitSetProperty(*v53, 8u, 2u, 0, outData, 0x28u);
                          if (v57)
                          {
                            v34 = v57;
                          }
                          else
                          {
                            v58 = 1.0;
                            v59 = AudioUnitSetParameter(*v53, 0, 1u, 0, 1.0, 0);
                            if (v59)
                            {
                              v34 = v59;
                            }
                            else
                            {
                              if (!APSIsAPMSpeaker())
                                v58 = *(float *)(v10 + 236);
                              if (gLogCategory_APReceiverAudioSessionPlatform <= 40
                                && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                 || _LogCategory_Initialize()))
                              {
                                v127 = *(float *)(v10 + 236);
                                v128 = v58;
                                v124 = *(_OWORD **)(v10 + 208);
                                v126 = (const char *)*(unsigned __int8 *)(v10 + 68);
                                v122 = *(const void **)(v10 + 40);
                                LogPrintF();
                              }
                              if (*(_BYTE *)(v10 + 68) && (v60 = AudioUnitSetParameter(*v53, 0, 2u, 0, v58, 0)) != 0)
                              {
                                v34 = v60;
                              }
                              else
                              {
                                v61 = _ConfigureAudioUnitMaxFrames(v10, *(OpaqueAudioComponentInstance **)(v10 + 208), v49, *(double *)outData, v50);
                                if (v61)
                                {
                                  v34 = v61;
                                }
                                else
                                {
                                  v62 = *v53;
                                  v63 = *(double *)outData;
                                  v64 = AUGraphConnectNodeInput(*v30, *v51, 0, *(_DWORD *)(v10 + 216), 0);
                                  if (v64)
                                  {
                                    v34 = v64;
                                  }
                                  else
                                  {
                                    if (!*(_BYTE *)(v10 + 65))
                                      goto LABEL_316;
                                    *(_OWORD *)&inDescription.componentType = xmmword_21E1B1D10;
                                    inDescription.componentFlagsMask = 0;
                                    v65 = AUGraphAddNode(*(AUGraph *)(v10 + 192), &inDescription, (AUNode *)(v10 + 240));
                                    if (v65)
                                    {
                                      v34 = v65;
                                    }
                                    else
                                    {
                                      v66 = (AudioUnit *)(v10 + 248);
                                      v67 = AUGraphNodeInfo(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 240), 0, (AudioUnit *)(v10 + 248));
                                      if (v67)
                                      {
                                        v34 = v67;
                                      }
                                      else
                                      {
                                        v68 = *(_DWORD *)(v10 + 108);
                                        *(_QWORD *)&outData[0] = 0x40E7700000000000;
                                        *(_OWORD *)((char *)outData + 8) = xmmword_21E1B1D20;
                                        DWORD2(outData[1]) = 4;
                                        HIDWORD(outData[1]) = v68;
                                        v135 = 32;
                                        v69 = AudioUnitSetProperty(*(AudioUnit *)(v10 + 248), 8u, 2u, 0, outData, 0x28u);
                                        if (v69)
                                        {
                                          v34 = v69;
                                        }
                                        else
                                        {
                                          ioDataSize[1] = 127;
                                          v70 = AudioUnitSetProperty(*v66, 0x1Au, 0, 0, &ioDataSize[1], 4u);
                                          if (v70)
                                          {
                                            v34 = v70;
                                          }
                                          else
                                          {
                                            v71 = _ConfigureAudioUnitMaxFrames(v10, *(OpaqueAudioComponentInstance **)(v10 + 248), v62, *(double *)outData, v63);
                                            if (v71)
                                            {
                                              v34 = v71;
                                            }
                                            else
                                            {
                                              v62 = *v66;
                                              v63 = *(double *)outData;
                                              v72 = AUGraphConnectNodeInput(*v30, *(_DWORD *)(v10 + 240), 0, *v51, 0);
                                              if (!v72)
                                              {
LABEL_316:
                                                *(_OWORD *)&inDescription.componentType = xmmword_21E1B1D30;
                                                inDescription.componentFlagsMask = 0;
                                                v73 = AUGraphAddNode(*(AUGraph *)(v10 + 192), &inDescription, (AUNode *)(v10 + 172));
                                                if (v73)
                                                {
                                                  v34 = v73;
                                                }
                                                else
                                                {
                                                  v74 = (AudioUnit *)(v10 + 176);
                                                  v75 = AUGraphNodeInfo(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 172), 0, (AudioUnit *)(v10 + 176));
                                                  if (v75)
                                                  {
                                                    v34 = v75;
                                                  }
                                                  else
                                                  {
                                                    v76 = AudioUnitSetProperty(*v74, 8u, 1u, 0, asbd, 0x28u);
                                                    if (v76)
                                                    {
                                                      v34 = v76;
                                                    }
                                                    else
                                                    {
                                                      *(_QWORD *)&outData[0] = 0x40E7700000000000;
                                                      *(_OWORD *)((char *)outData + 8) = xmmword_21E1B1D20;
                                                      v77 = *(_DWORD *)(v10 + 108);
                                                      DWORD2(outData[1]) = 4;
                                                      HIDWORD(outData[1]) = v77;
                                                      v135 = 32;
                                                      if (*(_BYTE *)(v10 + 65))
                                                        *(Float64 *)outData = asbd->mSampleRate;
                                                      v78 = AudioUnitSetProperty(*v74, 8u, 2u, 0, outData, 0x28u);
                                                      if (v78)
                                                      {
                                                        v34 = v78;
                                                      }
                                                      else
                                                      {
                                                        inInputCallback.inputProc = (AURenderCallback)_AudioOutputCallBack;
                                                        inInputCallback.inputProcRefCon = (void *)v10;
                                                        v79 = AUGraphSetNodeInputCallback(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 172), 0, &inInputCallback);
                                                        if (v79)
                                                        {
                                                          v34 = v79;
                                                        }
                                                        else
                                                        {
                                                          v80 = _ConfigureAudioUnitMaxFrames(v10, *(OpaqueAudioComponentInstance **)(v10 + 176), v62, *(double *)outData, v63);
                                                          if (v80)
                                                          {
                                                            v34 = v80;
                                                          }
                                                          else
                                                          {
                                                            v133 = 1;
                                                            v81 = AudioUnitSetProperty(*v74, 0x762u, 2u, 0, &v133, 4u);
                                                            if (v81)
                                                            {
                                                              v34 = v81;
                                                            }
                                                            else
                                                            {
                                                              v82 = *(_DWORD *)(v10 + 240);
                                                              if (!v82)
                                                                v82 = *v51;
                                                              v83 = AUGraphConnectNodeInput(*(AUGraph *)(v10 + 192), *(_DWORD *)(v10 + 172), 0, v82, 0);
                                                              if (v83)
                                                              {
                                                                v34 = v83;
                                                              }
                                                              else
                                                              {
                                                                v84 = AUGraphInitialize(*v30);
                                                                if (!v84)
                                                                {
                                                                  *(_QWORD *)outNumberOfNodes = 0;
                                                                  outNode = 0;
                                                                  inData = 0;
                                                                  v140 = 0;
                                                                  LODWORD(v141) = 0;
                                                                  outAudioUnit = 0;
                                                                  outDataSize = 0;
                                                                  v146 = 0.0;
                                                                  v147 = 0.0;
                                                                  valuePtr = 0;
                                                                  if (AUGraphGetNodeCount(*v30, outNumberOfNodes))
                                                                  {
                                                                    v85 = 0;
                                                                    outNumberOfNodes[0] = 0;
                                                                  }
                                                                  else if (outNumberOfNodes[0])
                                                                  {
                                                                    v85 = 0;
                                                                    v86 = 0;
                                                                    do
                                                                    {
                                                                      if (!AUGraphGetIndNode(*v30, v86, &outNode)
                                                                        && !AUGraphNodeInfo(*v30, outNode, (AudioComponentDescription *)&inData, &outAudioUnit))
                                                                      {
                                                                        outDataSize = 8;
                                                                        if (AudioUnitGetProperty(outAudioUnit, 2u, 0, 0, &v147, &outDataSize))
                                                                        {
                                                                          v147 = 44100.0;
                                                                        }
                                                                        outDataSize = 8;
                                                                        if (!AudioUnitGetProperty(outAudioUnit, 0xCu, 0, 0, &v146, &outDataSize)&& HIDWORD(inData) != 1668247158)
                                                                        {
                                                                          v85 += (v146 * v147);
                                                                        }
                                                                        if ((_DWORD)inData == 1635086197)
                                                                        {
                                                                          HIDWORD(valuePtr) = 0;
                                                                          outDataSize = 4;
                                                                          if (!AudioUnitGetProperty(outAudioUnit, 0x6C746E63u, 2u, 0, (char *)&valuePtr + 4, &outDataSize))
                                                                          {
                                                                            LODWORD(v87) = HIDWORD(valuePtr);
                                                                            v85 += (v147
                                                                                                * (double)v87
                                                                                                / asbd->mSampleRate);
                                                                            outNumberOfNodes[1] = v85;
                                                                          }
                                                                          HIDWORD(valuePtr) = 0;
                                                                          outDataSize = 4;
                                                                          if (!AudioUnitGetProperty(outAudioUnit, 0x73616674u, 2u, 0, (char *)&valuePtr + 4, &outDataSize))
                                                                          {
                                                                            LODWORD(v88) = HIDWORD(valuePtr);
                                                                            v85 += (v147
                                                                                                * (double)v88
                                                                                                / asbd->mSampleRate);
                                                                          }
                                                                          outDataSize = 0;
                                                                          v89 = 0;
                                                                          if (!AudioUnitGetPropertyInfo(outAudioUnit, 0x73746D23u, 2u, 0, &outDataSize, 0)&& outDataSize >= 4)
                                                                          {
                                                                            v90 = (AudioObjectID *)malloc_type_malloc(outDataSize, 0x2A338845uLL);
                                                                            if (v90)
                                                                            {
                                                                              v91 = v90;
                                                                              v89 = 0;
                                                                              if (!AudioUnitGetProperty(outAudioUnit, 0x73746D23u, 2u, 0, v90, &outDataSize)&& outDataSize >= 4)
                                                                              {
                                                                                v89 = 0;
                                                                                if (outDataSize >> 2 <= 1)
                                                                                  v92 = 1;
                                                                                else
                                                                                  v92 = outDataSize >> 2;
                                                                                v93 = v91;
                                                                                do
                                                                                {
                                                                                  inAddress.mElement = 0;
                                                                                  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"cntlbolg";
                                                                                  HIDWORD(valuePtr) = 0;
                                                                                  outDataSize = 4;
                                                                                  v94 = *v93++;
                                                                                  if (!AudioObjectGetPropertyData(v94, &inAddress, 0, 0, &outDataSize, (char *)&valuePtr + 4))
                                                                                  {
                                                                                    LODWORD(v95) = HIDWORD(valuePtr);
                                                                                    v96 = (v147 * (double)v95 / asbd->mSampleRate);
                                                                                    HIDWORD(valuePtr) = v96;
                                                                                    if (v89 <= v96)
                                                                                      v89 = v96;
                                                                                  }
                                                                                  --v92;
                                                                                }
                                                                                while (v92);
                                                                              }
                                                                              free(v91);
                                                                            }
                                                                            else
                                                                            {
                                                                              v89 = 0;
                                                                            }
                                                                          }
                                                                          v85 += v89;
                                                                          outNumberOfNodes[1] = v85;
                                                                        }
                                                                      }
                                                                      ++v86;
                                                                    }
                                                                    while (v86 < outNumberOfNodes[0]);
                                                                  }
                                                                  else
                                                                  {
                                                                    v85 = 0;
                                                                  }
                                                                  if (APSIsMemberOfHTGroup())
                                                                  {
                                                                    a3 = v130;
                                                                    if (*(_BYTE *)(v10 + 69))
                                                                    {
                                                                      if (APSIsAPMSpeaker())
                                                                      {
                                                                        if (*(_QWORD *)(*(_QWORD *)(*v11 + 40) + 48))
                                                                        {
                                                                          v97 = (unsigned int *)APReceiverRequestProcessorCopyReceiverSession();
                                                                          if (v97)
                                                                          {
                                                                            v99 = v97;
                                                                            if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                              && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                               || _LogCategory_Initialize()))
                                                                            {
                                                                              v122 = *(const void **)(v10 + 40);
                                                                              v124 = (_OWORD *)v99[174];
                                                                              LogPrintF();
                                                                            }
                                                                            LODWORD(v98) = v99[174];
                                                                            v85 -= (v147
                                                                                                * (double)v98
                                                                                                / 1000.0);
                                                                            outNumberOfNodes[1] = v85;
                                                                            CFRelease(v99);
                                                                          }
                                                                        }
                                                                      }
                                                                      else if (IsAppleTV())
                                                                      {
                                                                        v100 = APSHDMIVideoLatencyMs();
                                                                        if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                          && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                           || _LogCategory_Initialize()))
                                                                        {
                                                                          v122 = *(const void **)(v10 + 40);
                                                                          v124 = (_OWORD *)v100;
                                                                          LogPrintF();
                                                                        }
                                                                        v85 -= (v147
                                                                                            * (double)v100
                                                                                            / 1000.0);
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    a3 = v130;
                                                                  }
                                                                  v109 = (void *)objc_msgSend(*(id *)(v10 + 32), "session", v122, v124, v126, *(_QWORD *)&v127, *(_QWORD *)&v128, v129);
                                                                  if (gLogCategory_APReceiverAudioSessionPlatform <= 50)
                                                                  {
                                                                    if (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                      || _LogCategory_Initialize())
                                                                    {
                                                                      v110 = *(_QWORD *)(v10 + 40);
                                                                      objc_msgSend(v109, "inputLatency");
                                                                      v125 = v111;
                                                                      v123 = v110;
                                                                      LogPrintF();
                                                                    }
                                                                    if (gLogCategory_APReceiverAudioSessionPlatform <= 50)
                                                                    {
                                                                      if (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                        || _LogCategory_Initialize())
                                                                      {
                                                                        v112 = *(_QWORD *)(v10 + 40);
                                                                        objc_msgSend(v109, "outputLatency", v123, v125);
                                                                        v125 = v113;
                                                                        v123 = v112;
                                                                        LogPrintF();
                                                                      }
                                                                      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                        && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                         || _LogCategory_Initialize()))
                                                                      {
                                                                        v114 = *(_QWORD *)(v10 + 40);
                                                                        objc_msgSend(v109, "sampleRate", v123, v125);
                                                                        v125 = v115;
                                                                        v123 = v114;
                                                                        LogPrintF();
                                                                      }
                                                                    }
                                                                  }
                                                                  objc_msgSend(v109, "outputLatency", v123, v125);
                                                                  v117 = v85 + (v116 * asbd->mSampleRate);
                                                                  outNumberOfNodes[1] = v117;
                                                                  LODWORD(valuePtr) = objc_msgSend(v109, "IOBufferFrameSize");
                                                                  v118 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
                                                                  if (v118)
                                                                  {
                                                                    v119 = v118;
                                                                    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                      && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                       || _LogCategory_Initialize()))
                                                                    {
                                                                      LogPrintF();
                                                                    }
                                                                    APReceiverAudioSessionSetProperty(*(_QWORD *)(v10 + 24), CFSTR("PlatformIOBufferSize"), (uint64_t)v119);
                                                                    if (!APSIsAPMSpeaker()
                                                                      && *(_BYTE *)(v10 + 69)
                                                                      && v117 >= 1)
                                                                    {
                                                                      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                        && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                         || _LogCategory_Initialize()))
                                                                      {
                                                                        LogPrintF();
                                                                      }
                                                                      outNumberOfNodes[1] = 0;
                                                                    }
                                                                    v120 = CFNumberCreate(0, kCFNumberSInt32Type, &outNumberOfNodes[1]);
                                                                    if (v120)
                                                                    {
                                                                      v121 = v120;
                                                                      if (APReceiverAudioSessionSetProperty(*(_QWORD *)(v10 + 24), CFSTR("PlatformAudioLatency"), (uint64_t)v120))
                                                                      {
                                                                        APSLogErrorAt();
                                                                      }
                                                                      else if (gLogCategory_APReceiverAudioSessionPlatform <= 50
                                                                             && (gLogCategory_APReceiverAudioSessionPlatform != -1
                                                                              || _LogCategory_Initialize()))
                                                                      {
                                                                        LogPrintF();
                                                                      }
                                                                      CFRelease(v121);
                                                                    }
                                                                    else
                                                                    {
                                                                      APSLogErrorAt();
                                                                    }
                                                                    CFRelease(v119);
                                                                  }
                                                                  else
                                                                  {
                                                                    APSLogErrorAt();
                                                                  }
                                                                  goto LABEL_430;
                                                                }
                                                                v34 = v84;
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                                goto LABEL_467;
                                              }
                                              v34 = v72;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_467:
  APSLogErrorAt();
LABEL_468:
  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _MainAudioEnsureTornDown(v10);
  v132 = v34;
LABEL_473:
  APSLogErrorAt();
  APReceiverAudioSessionPlatformFinalize((_QWORD *)v10);
  return v132;
}

uint64_t _APReceiverAudioSessionPlatformGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPReceiverAudioSessionPlatformTypeID = result;
  return result;
}

uint64_t _UpdateAVAudioSessionAudioMode_4476(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  v3 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "setAudioMode:isLongForm:error:", a2, *(_BYTE *)(a1 + 69) == 0, &v3);
  if ((_DWORD)result)
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50)
    {
      if (gLogCategory_APReceiverAudioSessionPlatform != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else if (gLogCategory_APReceiverAudioSessionPlatform <= 60)
  {
    if (gLogCategory_APReceiverAudioSessionPlatform != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void APReceiverAudioSessionPlatformFinalize(_QWORD *a1)
{
  const void *v2;

  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _MainAudioEnsureTornDown((uint64_t)a1);
  v2 = (const void *)a1[7];
  if (v2)
    CFRelease(v2);
  CFRelease(a1);
}

void _MainAudioEnsureTornDown(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  const void *v5;
  OpaqueAUGraph *v6;
  NSObject *v7;
  _QWORD block[5];

  if (*(_QWORD *)(a1 + 128))
  {
    if (*(_QWORD *)(a1 + 144))
    {
      v2 = *(NSObject **)(a1 + 136);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___SBufConsumerStop_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_sync(v2, block);
      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v3 = *(NSObject **)(a1 + 144);
      if (v3)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 144));
        dispatch_release(v3);
        *(_QWORD *)(a1 + 144) = 0;
      }
    }
    v4 = *(NSObject **)(a1 + 136);
    if (v4)
    {
      dispatch_release(v4);
      *(_QWORD *)(a1 + 136) = 0;
    }
    v5 = *(const void **)(a1 + 120);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 120) = 0;
    }
    *(_QWORD *)(a1 + 128) = 0;
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v6 = *(OpaqueAUGraph **)(a1 + 192);
  if (v6)
  {
    LOBYTE(block[0]) = 0;
    AUGraphIsRunning(v6, (Boolean *)block);
    if (LOBYTE(block[0]))
      AUGraphStop(*(AUGraph *)(a1 + 192));
    LOBYTE(block[0]) = 0;
    AUGraphIsInitialized(*(AUGraph *)(a1 + 192), (Boolean *)block);
    if (LOBYTE(block[0]))
      AUGraphUninitialize(*(AUGraph *)(a1 + 192));
    LOBYTE(block[0]) = 0;
    AUGraphIsOpen(*(AUGraph *)(a1 + 192), (Boolean *)block);
    if (LOBYTE(block[0]))
      AUGraphClose(*(AUGraph *)(a1 + 192));
    DisposeAUGraph(*(AUGraph *)(a1 + 192));
    *(_QWORD *)(a1 + 192) = 0;
  }
  *(_DWORD *)(a1 + 172) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_DWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 224) = 0;
  *(_BYTE *)(a1 + 232) = 0;
  v7 = *(NSObject **)(a1 + 184);
  if (v7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
    dispatch_release(v7);
    *(_QWORD *)(a1 + 184) = 0;
  }
  *(_DWORD *)(a1 + 72) = 0;
  if (v6
    && gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t _UpdateAVAudioSessionPrefersMultiChannelAudio(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "setPrefersMultichannelAudio:error:", FigCFEqual(), &v2);
  if ((_DWORD)result)
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50)
    {
      if (gLogCategory_APReceiverAudioSessionPlatform != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else if (gLogCategory_APReceiverAudioSessionPlatform <= 60)
  {
    if (gLogCategory_APReceiverAudioSessionPlatform != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void sub_21E15F340(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _ConfigureAudioUnitMaxFrames(int a1, OpaqueAudioComponentInstance *a2, AudioUnit inUnit, double a4, double a5)
{
  uint64_t Property;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  UInt32 ioDataSize;
  unsigned int outData;
  unsigned int inData;

  outData = 0;
  if (a4 <= 0.0 && a5 <= 0.0)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  else
  {
    ioDataSize = 4;
    Property = AudioUnitGetProperty(inUnit, 0xEu, 0, 0, &outData, &ioDataSize);
    if ((_DWORD)Property)
    {
      v11 = Property;
      APSLogErrorAt();
    }
    else
    {
      v9 = outData;
      if (a4 != a5)
        v9 = (vcvtpd_u64_f64((double)outData * a4 / a5) & 0xFFFFFFE0) + 32;
      inData = v9;
      if (gLogCategory_APReceiverAudioSessionPlatform <= 30
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = AudioUnitSetProperty(a2, 0xEu, 0, 0, &inData, 4u);
      v11 = 0;
      if ((_DWORD)v10)
      {
        v13 = v10;
        APSLogErrorAt();
        return v13;
      }
    }
  }
  return v11;
}

uint64_t _AudioOutputCallBack(uint64_t a1, uint64_t a2, long double *a3)
{
  uint64_t Audio;

  if (!*(_BYTE *)(a1 + 232))
    return 4294960587;
  fmod(*a3, 4294967300.0);
  Audio = APReceiverAudioSessionReadAudio(*(_QWORD *)(a1 + 24));
  if ((_DWORD)Audio)
    APSLogErrorAt();
  return Audio;
}

void _APReceiverAudioSessionPlatformFinalize(uint64_t a1)
{
  const void *v2;

  if (a1)
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 40) = 0;
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

uint64_t APReceiverAudioSessionPlatformControl(_QWORD *a1, const void *a2)
{
  CFTypeID v4;
  uint64_t v5;
  double v7;
  float v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v12;

  v12 = 0;
  if (!a1)
    goto LABEL_47;
  v4 = CFGetTypeID(a1);
  if (gAPReceiverAudioSessionInitOnce != -1)
    dispatch_once_f(&gAPReceiverAudioSessionInitOnce, 0, (dispatch_function_t)_APReceiverAudioSessionGetTypeID);
  if (v4 != gAPReceiverAudioSessionTypeID || !a2)
  {
LABEL_47:
    APSLogErrorAt();
    return -6705;
  }
  v5 = a1[27];
  if (!v5)
  {
    APSLogErrorAt();
    return -6718;
  }
  if (CFEqual(a2, CFSTR("RASP::FlushAudio")))
    return v12;
  if (CFEqual(a2, CFSTR("RASP::StartAudioIO")))
  {
    _StartAudioIO((CFTypeRef *)v5, 0);
    return 0;
  }
  if (CFEqual(a2, CFSTR("RASP::StopAudioIO")))
  {
    _StopAudioIO((CFTypeRef *)v5, 0);
    return 0;
  }
  if (CFEqual(a2, CFSTR("RASP::DuckAudio")))
  {
    if (!*(_QWORD *)(v5 + 208))
      return v12;
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    v8 = v7;
    if (v8 > -144.0 && v8 < 0.0)
      __exp10f(v8 / 20.0);
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = *(NSObject **)(v5 + 184);
    if (v9)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v5 + 184));
      dispatch_release(v9);
      *(_QWORD *)(v5 + 184) = 0;
    }
LABEL_42:
    CoreAudioRampParameterStart();
    return v12;
  }
  if (CFEqual(a2, CFSTR("RASP::UnduckAudio")))
  {
    if (!*(_QWORD *)(v5 + 208))
      return v12;
    CFDictionaryGetDouble();
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = *(NSObject **)(v5 + 184);
    if (v10)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v5 + 184));
      dispatch_release(v10);
      *(_QWORD *)(v5 + 184) = 0;
    }
    goto LABEL_42;
  }
  if (CFEqual(a2, CFSTR("RASP::StartSession")))
  {
    v12 = _EnsureAudioOutputStarted(v5);
    if (v12)
      APSLogErrorAt();
    return v12;
  }
  if (CFEqual(a2, CFSTR("RASP::HandleAudioInterruptionBegan")))
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _StopAudioIO((CFTypeRef *)v5, 1);
    return v12;
  }
  if (!CFEqual(a2, CFSTR("RASP::HandleAudioInterruptionEnded")))
    return -6714;
  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _StartAudioIO((CFTypeRef *)v5, 1);
  return v12;
}

void _StartAudioIO(CFTypeRef *a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  CFRetain(a1);
  CFRetain(a1[2]);
  CFRetain(a1[3]);
  v4 = *((_QWORD *)a1[2] + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___StartAudioIO_block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  v6 = a2;
  dispatch_async(v4, v5);
}

void _StopAudioIO(CFTypeRef *a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  CFRetain(a1);
  CFRetain(a1[2]);
  CFRetain(a1[3]);
  v4 = *((_QWORD *)a1[2] + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___StopAudioIO_block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  v6 = a2;
  dispatch_async(v4, v5);
}

uint64_t _EnsureAudioOutputStarted(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  NSObject *v5;
  dispatch_time_t v6;
  int v7;

  if (*(_BYTE *)(a1 + 70))
  {
    if (!*(_BYTE *)(a1 + 232))
    {
LABEL_3:
      result = 0;
      *(_BYTE *)(a1 + 232) = 1;
      return result;
    }
    return 0;
  }
  if (!*(_QWORD *)(a1 + 128))
  {
    if (!*(_QWORD *)(a1 + 192))
    {
      APSLogErrorAt();
      return 4294960587;
    }
    if (!*(_BYTE *)(a1 + 232) && *(_DWORD *)(a1 + 48) != 103)
      _StartAudioIO((CFTypeRef *)a1, 0);
    return 0;
  }
  if (*(_BYTE *)(a1 + 232))
    return 0;
  if (!*(_QWORD *)(a1 + 152))
  {
    v3 = (double)mach_absolute_time();
    v4 = *(double *)(a1 + 80) * (v3 / (double)(unint64_t)UpTicksPerSecond());
    *(_QWORD *)(a1 + 152) = (unint64_t)v4;
    *(_QWORD *)(a1 + 160) = (unint64_t)v4;
    v5 = *(NSObject **)(a1 + 144);
    v6 = dispatch_time(0, 10000000);
    dispatch_source_set_timer(v5, v6, 0x989680uLL, 0x7A120uLL);
    if (gLogCategory_APReceiverAudioSessionPlatform >= 51)
      goto LABEL_3;
    if (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  v7 = gLogCategory_APReceiverAudioSessionPlatform;
  *(_BYTE *)(a1 + 232) = 1;
  if (v7 > 50)
    return 0;
  if (v7 != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
  {
    LogPrintF();
    return 0;
  }
  return result;
}

uint64_t APReceiverAudioSessionPlatformSetProperty(_QWORD *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5)
{
  CFTypeID v8;
  uint64_t v9;
  int v11;
  int v12;
  _BOOL4 v13;
  double v14;
  float v15;
  uint64_t v16;
  AudioUnitParameterValue v17;
  OpaqueAudioComponentInstance *v19;
  OpaqueAudioComponentInstance *v20;
  unsigned int v21;
  uint64_t v22;

  v21 = 0;
  if (!a1)
    goto LABEL_77;
  v8 = CFGetTypeID(a1);
  if (gAPReceiverAudioSessionInitOnce != -1)
    dispatch_once_f(&gAPReceiverAudioSessionInitOnce, 0, (dispatch_function_t)_APReceiverAudioSessionGetTypeID);
  if (v8 != gAPReceiverAudioSessionTypeID || !a3)
  {
LABEL_77:
    APSLogErrorAt();
    return -6705;
  }
  v9 = a1[27];
  if (!v9)
  {
    APSLogErrorAt();
    return -6718;
  }
  if (CFEqual(a3, CFSTR("RASP::AudioMode")))
  {
    _UpdateAVAudioSessionAudioMode_4476(v9, a5);
    return v21;
  }
  if (CFEqual(a3, CFSTR("RASP::PrefersMultiChannel")))
  {
    _UpdateAVAudioSessionPrefersMultiChannelAudio(v9);
    return v21;
  }
  if (!CFEqual(a3, CFSTR("RASP::PreferredAudioFormat")))
  {
    if (CFEqual(a3, CFSTR("RASP::Skew")))
    {
      if (!*(_QWORD *)(v9 + 248))
        return v21;
      v11 = CFGetInt64();
      v21 = AudioUnitSetParameter(*(AudioUnit *)(v9 + 248), 0, 0, 0, (float)((float)v11 + (float)*(double *)(v9 + 80))/ (float)*(double *)(v9 + 80), 0);
      v12 = gLogCategory_APReceiverAudioSessionPlatform;
      if (gLogCategory_APReceiverAudioSessionPlatform > 20)
      {
        v13 = 0;
      }
      else
      {
        if (gLogCategory_APReceiverAudioSessionPlatform != -1)
        {
LABEL_38:
          if (v12 != -1 || _LogCategory_Initialize())
            goto LABEL_58;
          return v21;
        }
        v13 = _LogCategory_Initialize() != 0;
        v12 = gLogCategory_APReceiverAudioSessionPlatform;
      }
      if (v11 < -5)
        v13 = 1;
      if (v11 > 5)
        v13 = 1;
      if (!v13 || v12 > 40)
        return v21;
      goto LABEL_38;
    }
    if (CFEqual(a3, CFSTR("RASP::VolumeLinear")))
    {
      CFGetDouble();
      v15 = v14;
      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_BYTE *)(v9 + 70))
      {
        v19 = *(OpaqueAudioComponentInstance **)(v9 + 208);
        if (!v19 || !*(_BYTE *)(v9 + 68))
          return v21;
        v21 = AudioUnitSetParameter(v19, 0, 2u, 0, v15, 0);
        if (!v21)
        {
          *(float *)(v9 + 236) = v15;
          return v21;
        }
        goto LABEL_81;
      }
      goto LABEL_82;
    }
    if (CFEqual(a3, CFSTR("RASP::MuteStream")))
    {
      v16 = CFGetInt64();
      v17 = 0.0;
      if (!v16)
        v17 = *(float *)(v9 + 236);
      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_BYTE *)(v9 + 70))
      {
        v20 = *(OpaqueAudioComponentInstance **)(v9 + 208);
        if (!v20)
          return v21;
        if (!*(_BYTE *)(v9 + 68))
          return v21;
        v21 = AudioUnitSetParameter(v20, 0, 2u, 0, v17, 0);
        if (!v21)
          return v21;
LABEL_81:
        APSLogErrorAt();
        return v21;
      }
LABEL_82:
      APSLogErrorAt();
      return APSSignalErrorAt();
    }
    return -6714;
  }
  v22 = 0;
  if (!IsAppleTV())
    return v21;
  if (FigCFDictionaryGetInt64IfPresent())
  {
    if (objc_msgSend(*(id *)(v9 + 32), "setPreferredOutputNumberOfChannels:error:", 0, &v22))
    {
      if (gLogCategory_APReceiverAudioSessionPlatform <= 50
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
LABEL_26:
        LogPrintF();
      }
    }
    else if (gLogCategory_APReceiverAudioSessionPlatform <= 60
           && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_26;
    }
  }
  if (!FigCFDictionaryGetInt64IfPresent())
    return v21;
  if (objc_msgSend(*(id *)(v9 + 32), "setPreferredHardwareFormat:error:", 0, &v22))
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
LABEL_58:
      LogPrintF();
    }
  }
  else if (gLogCategory_APReceiverAudioSessionPlatform <= 60
         && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_58;
  }
  return v21;
}

void _APAdvertiserRapportManagerFinalize(_QWORD *a1)
{
  const void *v2;
  NSObject *v3;
  NSObject *v4;

  if (gLogCategory_APAdvertiserRapportManager <= 50
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
    a1[6] = 0;
  }
  v3 = a1[5];
  if (v3)
  {
    dispatch_release(v3);
    a1[5] = 0;
  }
  v4 = a1[4];
  if (v4)
  {
    dispatch_release(v4);
    a1[4] = 0;
  }
}

void APAdvertiserRapportManager_update(uint64_t a1)
{
  const char *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  if (gLogCategory_APAdvertiserRapportManager <= 20
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 81))
      v2 = "yes";
    else
      v2 = "no";
    v9 = v2;
    v10 = *(unsigned __int16 *)(a1 + 56);
    LogPrintF();
  }
  if (!*(_BYTE *)(a1 + 81))
  {
LABEL_11:
    if (gLogCategory_APAdvertiserRapportManager <= 40
      && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 64), "deregisterRequestID:", CFSTR("com.apple.airplay.discovery.getinfo"), v9, v10);
    objc_msgSend(*(id *)(a1 + 64), "invalidate");

    *(_QWORD *)(a1 + 64) = 0;
    objc_msgSend(*(id *)(a1 + 72), "invalidate");

    *(_QWORD *)(a1 + 72) = 0;
    *(_BYTE *)(a1 + 80) = 0;
    return;
  }
  if (*(_WORD *)(a1 + 56) != 1)
  {
    if (*(_WORD *)(a1 + 56))
      return;
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 80))
  {
    if (gLogCategory_APAdvertiserRapportManager <= 40
      && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init(MEMORY[0x24BE7CC58]);
    *(_QWORD *)(a1 + 72) = v3;
    objc_msgSend(v3, "setControlFlags:", objc_msgSend(v3, "controlFlags") | 0x1000);
    objc_msgSend(*(id *)(a1 + 72), "setControlFlags:", objc_msgSend(*(id *)(a1 + 72), "controlFlags") | 2);
    objc_msgSend(*(id *)(a1 + 72), "setServiceType:", CFSTR("com.apple.airplay.discovery.service"));
    objc_msgSend(*(id *)(a1 + 72), "activate");
    v4 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
    *(_QWORD *)(a1 + 64) = v4;
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 16);
      objc_msgSend(v4, "setControlFlags:", objc_msgSend(v4, "controlFlags") | 0x1000);
      v6 = MEMORY[0x24BDAC760];
      v7 = *(void **)(a1 + 64);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke;
      v12[3] = &__block_descriptor_40_e88_v32__0__NSDictionary_8__NSDictionary_16___v____NSDictionary___NSDictionary___NSError__24l;
      v12[4] = v5;
      objc_msgSend(v7, "registerRequestID:options:handler:", CFSTR("com.apple.airplay.discovery.getinfo"), 0, v12);
      v8 = *(void **)(a1 + 64);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke_3;
      v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v11[4] = v5;
      objc_msgSend(v8, "activateWithCompletion:", v11);
    }
    else
    {
      APSLogErrorAt();
    }
  }
}

void sub_21E16101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t _APAdvertiserRapportManager_lookupAndRetainActiveManagerWithKey()
{
  if (_APAdvertiserRapportManager_getActiveManagers_once != -1)
    dispatch_once(&_APAdvertiserRapportManager_getActiveManagers_once, &__block_literal_global_9);
  return FigCFWeakReferenceTableCopyValue();
}

void APAdvertiserRapportManager_stop(uint64_t a1)
{
  if (gLogCategory_APAdvertiserRapportManager <= 40
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_WORD *)(a1 + 56))
  {
    *(_WORD *)(a1 + 56) = 0;
    APAdvertiserRapportManager_update(a1);
  }
}

uint64_t APAdvertiserRapportManagerSetMode(uint64_t a1, __int16 a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[6];
  __int16 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __APAdvertiserRapportManagerSetMode_block_invoke;
  block[3] = &unk_24E21FA40;
  block[4] = &v7;
  block[5] = a1;
  v6 = a2;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

const char *APAdvertiserRapportManager_stringForMode(int a1)
{
  if (!a1)
    return "Disabled";
  if (a1 == 1)
    return "Enabled";
  if (gLogCategory_APAdvertiserRapportManager <= 60
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return "Unknown ";
}

void sub_21E161BB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21E163970(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E163B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _APAdvertiserBTLEManagerFinalize(uint64_t a1)
{

}

uint64_t APAdvertiserBTLEManagerSetProperty(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = objc_msgSend(a1, "internalQueue");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __APAdvertiserBTLEManagerSetProperty_block_invoke;
  v9[3] = &unk_24E21FC28;
  v9[4] = a1;
  v9[5] = &v10;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v6, v9);
  v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_21E164CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t APAdvertiserBTLEManagerSetBTLEMode(void *a1, __int16 a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  __int16 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = objc_msgSend(a1, "internalQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __APAdvertiserBTLEManagerSetBTLEMode_block_invoke;
  block[3] = &unk_24E21FC50;
  block[4] = a1;
  block[5] = &v9;
  v8 = a2;
  dispatch_sync(v4, block);
  v5 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void sub_21E164DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t APReceiverScreenSinkGetClassID()
{
  if (APReceiverScreenSinkGetClassID_once != -1)
    dispatch_once(&APReceiverScreenSinkGetClassID_once, &__block_literal_global_4896);
  return APReceiverScreenSinkGetClassID_classID;
}

uint64_t APReceiverScreenSinkGetTypeID()
{
  if (APReceiverScreenSinkGetClassID_once != -1)
    dispatch_once(&APReceiverScreenSinkGetClassID_once, &__block_literal_global_4896);
  return CMBaseClassGetCFTypeID();
}

void audioSession_handleMediaDataControlRequest_4922(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void *a5, uint64_t a6)
{
  _QWORD **v11;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v13;
  CFTypeID v14;
  int Int64Ranged;
  int v16;
  uint64_t TypedValue;
  uint64_t v18;
  uint64_t v19;
  CFTypeID v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t Int64;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[28];
  _OWORD v33[2];
  _DWORD v34[7];
  _BYTE v35[28];
  _DWORD v36[7];
  _DWORD v37[7];
  int v38;

  v38 = 0;
  v11 = *(_QWORD ***)(a6 + 40);
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v13 = Mutable;
    if (a3 == 1634562925)
    {
      CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue();
      v38 = APReceiverAudioSessionPlatformSetProperty(*v11, v18, CFSTR("RASP::AudioMode"), v19, TypedValue);
      if (v38)
        goto LABEL_39;
      goto LABEL_34;
    }
    if (a3 != 1936875892)
    {
      if (a3 != 1718839394)
      {
        v23 = -6714;
LABEL_21:
        v38 = v23;
        goto LABEL_34;
      }
      if (a5)
      {
        v14 = CFGetTypeID(a5);
        if (v14 == CFDictionaryGetTypeID())
        {
          if (CFDictionaryContainsKey((CFDictionaryRef)a5, CFSTR("flushFromTS"))
            && CFDictionaryContainsKey((CFDictionaryRef)a5, CFSTR("flushFromSeq")))
          {
            CFDictionaryGetInt64Ranged();
            Int64Ranged = CFDictionaryGetInt64Ranged();
            v16 = 1;
          }
          else
          {
            Int64Ranged = 0;
            v16 = 0;
          }
          CFDictionaryGetInt64Ranged();
          v24 = CFDictionaryGetInt64Ranged();
          APSAudioTransportTimeMakeWithRTPTime();
          APSAudioTransportTimeMakeWithRTPTime();
          v38 = APReceiverAudioSessionBufferedFlushAudio((uint64_t)v11, v16, v37, Int64Ranged, v36, v24, 0);
          if (!v38)
            goto LABEL_34;
          goto LABEL_39;
        }
      }
LABEL_38:
      APSLogErrorAt();
      v23 = -6756;
      goto LABEL_21;
    }
    v30 = *MEMORY[0x24BE03810];
    *(_OWORD *)v35 = *MEMORY[0x24BE03810];
    v29 = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
    *(_OWORD *)&v35[12] = v29;
    if (!a5)
      goto LABEL_38;
    v20 = CFGetTypeID(a5);
    if (v20 != CFDictionaryGetTypeID())
      goto LABEL_38;
    v21 = CFDictionaryGetInt64Ranged();
    v31 = a4;
    if (v21 == 1)
    {
      CFDictionaryGetInt64Ranged();
      v22 = CFDictionaryContainsKey((CFDictionaryRef)a5, CFSTR("firstAudibleRTPTime"));
      CFDictionaryGetInt64Ranged();
      v26 = CFDictionaryGetInt64Ranged();
      Int64 = CFDictionaryGetInt64();
      v28 = CFDictionaryGetInt64();
      v25 = CFDictionaryGetInt64Ranged();
      APSAudioTransportTimeMakeWithRTPTime();
      if (v22)
      {
        APSAudioTransportTimeMakeWithRTPTime();
        goto LABEL_29;
      }
    }
    else
    {
      APSAudioTransportTimeMakeWithRTPTime();
      v25 = 0;
      v26 = 0;
      Int64 = 0;
      v28 = 0;
    }
    v33[0] = v30;
    *(_OWORD *)((char *)v33 + 12) = v29;
LABEL_29:
    *(_QWORD *)v32 = v28;
    *(_QWORD *)&v32[8] = Int64;
    *(_DWORD *)&v32[16] = v26;
    *(_DWORD *)&v32[20] = v25;
    v38 = APReceiverAudioSessionBufferedSetRateAndAnchorTime((uint64_t)v11, v21, v34, (uint64_t)v33, (__int128 *)v32, v35);
    if (v38)
    {
      CFDictionarySetInt64();
      a4 = v31;
    }
    else
    {
      a4 = v31;
      if (v21)
        goto LABEL_34;
      *(_OWORD *)v32 = *(_OWORD *)v35;
      *(_OWORD *)&v32[12] = *(_OWORD *)&v35[12];
      if (APSAudioTransportTimeIsValid())
        CFDictionarySetInt64();
    }
    if (v38)
LABEL_39:
      APSLogErrorAt();
LABEL_34:
    APMediaDataControlServerSendResponse(a1, a2, a4, (uint64_t)v13, v38);
    CFRelease(v13);
    return;
  }
  APSLogErrorAt();
  APMediaDataControlServerSendResponse(a1, a2, a4, 0, -6728);
}

uint64_t APReceiverAudioSessionBufferedFlushAudio(uint64_t a1, int a2, _DWORD *a3, int a4, _DWORD *a5, int a6, _OWORD *a7)
{
  uint64_t v11;
  int v12;
  int v13;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  _BYTE v24[28];
  int v25;

  v11 = 4294895145;
  v12 = a3[1];
  v13 = a5[1];
  v25 = 0;
  *(_OWORD *)v24 = *MEMORY[0x24BE03810];
  *(_OWORD *)&v24[12] = *(_OWORD *)(MEMORY[0x24BE03810] + 12);
  if (!a1)
  {
    v11 = 4294895144;
LABEL_36:
    APSLogErrorAt();
LABEL_28:
    if (gLogCategory_APReceiverAudioSessionBuffered <= 50
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return v11;
  }
  if (*a5 != 1 || a2 && *a3 != 1)
    goto LABEL_36;
  v15 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0x102004002C94847uLL);
  if (!v15)
  {
    v11 = 4294895146;
    goto LABEL_36;
  }
  v16 = (uint64_t)v15;
  v15[12] = a2;
  *(_WORD *)(v15 + 13) = 0;
  v15[15] = 0;
  *((_DWORD *)v15 + 4) = a4;
  *((_DWORD *)v15 + 5) = v12;
  *((_DWORD *)v15 + 6) = a6;
  *((_DWORD *)v15 + 7) = v13;
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
  v17 = *(uint64_t **)(a1 + 680);
  if (a2 && v17)
  {
    v18 = 0;
    do
    {
      v19 = v17;
      v17 = (uint64_t *)*v17;
      ++v18;
    }
    while (v17);
    v20 = 0;
    *v19 = v16;
  }
  else
  {
    *(_QWORD *)(a1 + 680) = v16;
    v21 = audioSession_processFlushQueue(a1, &v25);
    if ((_DWORD)v21)
    {
      v11 = v21;
      APSLogErrorAt();
      v20 = 0;
      goto LABEL_19;
    }
    APSAudioTransportTimeMakeWithRTPTime();
    v20 = 1;
  }
  v11 = 0;
  if (a7)
  {
    *a7 = *(_OWORD *)v24;
    *(_OWORD *)((char *)a7 + 12) = *(_OWORD *)&v24[12];
  }
LABEL_19:
  audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
  if (v17)
  {
    do
    {
      v22 = (uint64_t *)*v17;
      free(v17);
      v17 = v22;
    }
    while (v22);
  }
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v20)
    audioSession_logFlush(a1, v11, v16);
  if ((_DWORD)v11)
    goto LABEL_28;
  return v11;
}

uint64_t APReceiverAudioSessionBufferedSetRateAndAnchorTime(uint64_t a1, unsigned int a2, _DWORD *a3, uint64_t a4, __int128 *a5, _OWORD *a6)
{
  uint64_t v12;
  int v13;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _BYTE *, uint64_t *);
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  OpaqueAudioConverter *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  _QWORD *v30;
  _BOOL4 v31;
  int v32;
  int v33;
  __int128 v34;
  uint64_t v35;
  int v37;
  int v38;
  __int128 v39;
  uint64_t v40;
  _QWORD block[6];
  _BYTE v42[28];
  uint64_t v43;

  v43 = 0;
  if (!a1)
  {
    APSLogErrorAt();
    v31 = 0;
    v23 = 4294895144;
    goto LABEL_46;
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    v23 = 4294895143;
LABEL_58:
    APSLogErrorAt();
    v31 = 0;
    goto LABEL_46;
  }
  if (*a3 == 1)
  {
    if (*(_DWORD *)a4 == 1
      || (*(_OWORD *)v42 = *(_OWORD *)a4,
          *(_OWORD *)&v42[12] = *(_OWORD *)(a4 + 12),
          !APSAudioTransportTimeIsValid()))
    {
      v12 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v12)
      {
        v14 = v12;
        v15 = &unk_2553CD000;
        if (gLogCategory_APReceiverAudioSessionBuffered <= 50
          && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
        {
          *(_OWORD *)v42 = *(_OWORD *)a4;
          *(_OWORD *)&v42[12] = *(_OWORD *)(a4 + 12);
          APSAudioTransportTimeIsValid();
          APSGetFBOPropertyInt64();
          v15 = (_DWORD *)&unk_2553CD000;
          LogPrintF();
        }
        if (a2 >= 2)
        {
          APSLogErrorAt();
          v37 = v15[442];
          if (v37 <= 90 && (v37 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v31 = 0;
          v23 = 4294960591;
          goto LABEL_45;
        }
        if (a2 != 1)
        {
LABEL_23:
          audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
          *(_BYTE *)(a1 + 712) = 0;
          *(_BYTE *)(a1 + 724) = 0;
          *(_DWORD *)(a1 + 880) = a2;
          v21 = *(_QWORD **)a1;
          if (a2)
          {
            v22 = APReceiverAudioSessionPlatformControl(v21, CFSTR("RASP::StartAudioIO"));
            if ((_DWORD)v22)
            {
              v23 = v22;
LABEL_65:
              APSLogErrorAt();
              v31 = 0;
LABEL_38:
              audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
LABEL_45:
              CFRelease((CFTypeRef)v14);
              goto LABEL_46;
            }
          }
          else
          {
            v24 = APReceiverAudioSessionPlatformControl(v21, CFSTR("RASP::FlushAudio"));
            if ((_DWORD)v24)
            {
              v23 = v24;
              goto LABEL_65;
            }
            v25 = APReceiverAudioSessionPlatformControl(*(_QWORD **)a1, CFSTR("RASP::StopAudioIO"));
            if ((_DWORD)v25)
            {
              v23 = v25;
              goto LABEL_65;
            }
          }
          v26 = *(OpaqueAudioConverter **)(a1 + 728);
          if (v26)
            v23 = AudioConverterReset(v26);
          else
            v23 = 0;
          v27 = v43;
          *(_QWORD *)(a1 + 888) = v43;
          v28 = *((_QWORD *)a5 + 2);
          *(_OWORD *)(a1 + 896) = *a5;
          *(_QWORD *)(a1 + 912) = v28;
          *(_DWORD *)(a1 + 920) = a3[1];
          *(_QWORD *)(a1 + 928) = 0;
          *(_QWORD *)(a1 + 936) = v27;
          *(_DWORD *)(a1 + 944) = 0;
          v29 = *a5;
          *(_QWORD *)(a1 + 968) = *((_QWORD *)a5 + 2);
          *(_OWORD *)(a1 + 952) = v29;
          *(_DWORD *)(a1 + 976) = a3[1];
          *(_QWORD *)(a1 + 984) = 0;
          *(_DWORD *)(a1 + 1000) = *(_DWORD *)(a4 + 4);
          *(_OWORD *)v42 = *(_OWORD *)a4;
          *(_OWORD *)&v42[12] = *(_OWORD *)(a4 + 12);
          *(_BYTE *)(a1 + 1004) = APSAudioTransportTimeIsValid();
          *(_BYTE *)(a1 + 872) = 1;
          *(_DWORD *)(a1 + 1016) = 0;
          *(_QWORD *)(a1 + 992) = 0;
          *(_QWORD *)(a1 + 1024) = 0;
          *(_DWORD *)(a1 + 1032) = 0;
          v30 = *(_QWORD **)(a1 + 584);
          if (*v30)
            v31 = *v30 != (_QWORD)v30;
          else
            v31 = 0;
          v32 = v15[442];
          if (v32 <= 50 && (v32 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          goto LABEL_38;
        }
        if (*(_BYTE *)(v14 + 728))
        {
          v16 = v15[442];
          if (v16 <= 50 && (v16 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v31 = 0;
          v23 = 4294960587;
          goto LABEL_45;
        }
        if (*(_QWORD *)(a1 + 40))
        {
          v17 = *(NSObject **)(v14 + 16);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __APReceiverAudioSessionBufferedSetRateAndAnchorTime_block_invoke;
          block[3] = &__block_descriptor_tmp_5069;
          block[4] = v14;
          block[5] = a1;
          dispatch_sync(v17, block);
        }
        else
        {
          AirPlayReceiverSessionControl(v14, v13, CFSTR("handleMediaAudioResumedForSession"), *(__CFString **)(a1 + 32), 0, 0);
        }
        v18 = *(_QWORD *)(a1 + 1144);
        v39 = *a5;
        v40 = *((_QWORD *)a5 + 2);
        v19 = *(uint64_t (**)(uint64_t, _BYTE *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v19)
        {
          *(_OWORD *)v42 = v39;
          *(_QWORD *)&v42[16] = v40;
          v20 = v19(v18, v42, &v43);
          if (!(_DWORD)v20)
          {
            if (APSGetFBOPropertyInt64())
              goto LABEL_23;
            v23 = 4294895143;
            APSLogErrorAt();
            v38 = v15[442];
            if (v38 > 90 || v38 == -1 && !_LogCategory_Initialize())
            {
LABEL_53:
              v31 = 0;
              goto LABEL_45;
            }
LABEL_42:
            LogPrintF();
            goto LABEL_53;
          }
          v23 = v20;
        }
        else
        {
          v23 = 4294954514;
        }
        APSLogErrorAt();
        v33 = v15[442];
        if (v33 > 90 || v33 == -1 && !_LogCategory_Initialize())
          goto LABEL_53;
        goto LABEL_42;
      }
      v23 = 4294895143;
      goto LABEL_58;
    }
  }
  APSLogErrorAt();
  v31 = 0;
  v23 = 4294895145;
LABEL_46:
  if (a6)
  {
    if (v31)
    {
      APSAudioTransportTimeMakeWithRTPTime();
      *a6 = *(_OWORD *)v42;
      v34 = *(_OWORD *)&v42[12];
    }
    else
    {
      v35 = MEMORY[0x24BE03810];
      *a6 = *MEMORY[0x24BE03810];
      v34 = *(_OWORD *)(v35 + 12);
    }
    *(_OWORD *)((char *)a6 + 12) = v34;
  }
  return v23;
}

uint64_t audioSession_sessionLock_5073(pthread_mutex_t *a1)
{
  uint64_t result;

  if (!a1)
    return APSLogErrorAt();
  result = pthread_mutex_lock(a1);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

uint64_t audioSession_sessionUnlock_5075(pthread_mutex_t *a1)
{
  uint64_t result;

  if (!a1)
    return APSLogErrorAt();
  result = pthread_mutex_unlock(a1);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

uint64_t audioSession_processFlushQueue(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  _QWORD *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  OpaqueAudioConverter *v20;
  _QWORD *v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v2 = *(_QWORD *)(a1 + 680);
  if (v2 && !*(_BYTE *)(v2 + 8) && !*(_BYTE *)(v2 + 9))
  {
    if (*(_BYTE *)(v2 + 12))
    {
      v7 = *(_DWORD *)(v2 + 16);
      v8 = *(_DWORD *)(v2 + 20);
      v9 = *(_DWORD *)(v2 + 24);
      if (gLogCategory_APReceiverAudioSessionBuffered <= 30
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (*(_QWORD *)(**(_QWORD **)(a1 + 584) + 16)
        && gLogCategory_APReceiverAudioSessionBuffered <= 30
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_QWORD *)(a1 + 696) = mach_absolute_time();
      v12 = *(_QWORD **)(a1 + 584);
      v13 = (_QWORD *)*v12;
      if ((_QWORD *)*v12 != v12)
      {
        v14 = 0;
        do
        {
          v15 = (_QWORD *)*v13;
          v16 = *((_DWORD *)v13 + 15);
          if (((v7 - v16) & 0x800000) != 0 || ((v16 ^ v7) & 0xFFFFFF) == 0)
          {
            v17 = gLogCategory_APReceiverAudioSessionBuffered;
            if (!v14)
            {
              if (gLogCategory_APReceiverAudioSessionBuffered <= 30
                && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              v18 = APSContiguousAllocatorRelinquishBlockFromAddress();
              if ((_DWORD)v18)
                goto LABEL_92;
              v17 = gLogCategory_APReceiverAudioSessionBuffered;
            }
            if (((v9 - v16) & 0x800000) != 0 || ((v16 ^ v9) & 0xFFFFFF) == 0)
            {
              if (v17 <= 40 && (v17 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              break;
            }
            if (v17 <= 10 && (v17 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            v13[5] = 0;
            v13[6] = 0;
            v13[4] = 0;
            v19 = *v13;
            *(_QWORD *)(v19 + 8) = v13[1];
            *(_QWORD *)v13[1] = v19;
            *v13 = *(_QWORD *)(a1 + 592);
            *(_QWORD *)(a1 + 592) = v13;
            --*(_DWORD *)(a1 + 600);
            if (*(_QWORD *)(a1 + 480) <= (unint64_t)APSContiguousAllocatorGetNextAvailableBlockSize())
              audioSession_resumeNetworkReads(a1);
            v14 = 1;
          }
          else if (*(_DWORD *)(v13[2] + 4) - v8 >= 0
                 && gLogCategory_APReceiverAudioSessionBuffered <= 30
                 && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v13 = v15;
        }
        while (v15 != v12);
      }
      if (a2)
        *a2 = *(_DWORD *)(a1 + 716);
      goto LABEL_91;
    }
    v11 = *(_DWORD *)(v2 + 24);
    v10 = *(_DWORD *)(v2 + 28);
    if (gLogCategory_APReceiverAudioSessionBuffered <= 30
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_QWORD *)(**(_QWORD **)(a1 + 584) + 16)
      && gLogCategory_APReceiverAudioSessionBuffered <= 30
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APReceiverAudioSessionPlatformControl(*(_QWORD **)a1, CFSTR("RASP::FlushAudio"));
    *(_BYTE *)(a1 + 712) = 0;
    *(_DWORD *)(a1 + 808) = 0;
    v20 = *(OpaqueAudioConverter **)(a1 + 728);
    if (v20)
      v3 = AudioConverterReset(v20);
    else
      v3 = 0;
    *(_DWORD *)(a1 + 880) = 0;
    *(_DWORD *)(a1 + 1000) = 0;
    *(_BYTE *)(a1 + 1004) = 0;
    *(_QWORD *)(a1 + 696) = mach_absolute_time();
    v21 = *(_QWORD **)(a1 + 584);
    v22 = (_QWORD *)*v21;
    if ((_QWORD *)*v21 != v21)
    {
      v23 = *((_DWORD *)v22 + 15);
      if (((v11 - v23) & 0x800000) == 0 && ((v23 ^ v11) & 0xFFFFFF) != 0)
      {
        while (1)
        {
          v24 = *v22;
          if (gLogCategory_APReceiverAudioSessionBuffered <= 10
            && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (*(_DWORD *)(v22[2] + 4) - v10 >= 0
            && gLogCategory_APReceiverAudioSessionBuffered <= 30
            && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v18 = APSContiguousAllocatorRelinquishBlock();
          if ((_DWORD)v18)
            break;
          v22[5] = 0;
          v22[6] = 0;
          v22[4] = 0;
          v25 = *v22;
          *(_QWORD *)(v25 + 8) = v22[1];
          *(_QWORD *)v22[1] = v25;
          *v22 = *(_QWORD *)(a1 + 592);
          *(_QWORD *)(a1 + 592) = v22;
          --*(_DWORD *)(a1 + 600);
          if (*(_QWORD *)(a1 + 480) <= (unint64_t)APSContiguousAllocatorGetNextAvailableBlockSize())
            audioSession_resumeNetworkReads(a1);
          if ((_QWORD *)v24 == v21)
          {
            v3 = 0;
            goto LABEL_84;
          }
          v3 = 0;
          v26 = *(_DWORD *)(v24 + 60);
          if (((v11 - v26) & 0x800000) == 0)
          {
            v22 = (_QWORD *)v24;
            if (((v26 ^ v11) & 0xFFFFFF) != 0)
              continue;
          }
          goto LABEL_79;
        }
LABEL_92:
        v3 = v18;
        APSLogErrorAt();
        goto LABEL_93;
      }
LABEL_79:
      if (gLogCategory_APReceiverAudioSessionBuffered <= 40
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
LABEL_84:
    if (a2)
      *a2 = *(_DWORD *)(a1 + 716);
    if (!(_DWORD)v3)
    {
LABEL_91:
      v3 = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 680) + 8) = 1;
      return v3;
    }
LABEL_93:
    APSLogErrorAt();
    return v3;
  }
  return 0;
}

uint64_t audioSession_logFlush(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (*(_BYTE *)(a3 + 12))
  {
    if (gLogCategory_APReceiverAudioSessionBuffered <= 50)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else if (gLogCategory_APReceiverAudioSessionBuffered <= 50)
  {
    if (gLogCategory_APReceiverAudioSessionBuffered != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t audioSession_resumeNetworkReads(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 1224))
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 20
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v1 + 1224) = 1;
      result = SendSelfConnectedLoopbackMessage();
      if ((_DWORD)result)
        return APSLogErrorAt();
    }
  }
  return result;
}

void APReceiverAudioSessionBufferedFinalize(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OpaqueAudioConverter *v14;
  const void *v15;
  const void *v16;
  _QWORD *v17;
  _QWORD *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  const void *v22;
  const void *v23;

  if (*(_BYTE *)(a1 + 1227))
  {
    if (gLogCategory_APReceiverAudioSessionBuffered <= 90
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRelease(0);
  }
  if (*(_QWORD *)(a1 + 80))
  {
    SendSelfConnectedLoopbackMessage();
    pthread_join(*(pthread_t *)(a1 + 72), 0);
    *(_QWORD *)(a1 + 80) = 0;
  }
  v2 = *(_DWORD *)(a1 + 48);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error())
      __error();
    *(_DWORD *)(a1 + 48) = -1;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    NetSocket_Delete();
    *(_QWORD *)(a1 + 56) = 0;
  }
  if (*(_QWORD *)(a1 + 1128))
  {
    FigSimpleMutexDestroy();
    *(_QWORD *)(a1 + 1128) = 0;
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v5 = *(const void **)(a1 + 1280);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 1280) = 0;
  }
  v6 = *(const void **)(a1 + 1144);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 1144) = 0;
  }
  v7 = *(const void **)(a1 + 1184);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 1184) = 0;
  }
  v8 = *(const void **)(a1 + 8);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 8) = 0;
  }
  *(_DWORD *)(a1 + 456) = 0;
  v9 = *(void **)(a1 + 512);
  if (v9)
  {
    free(v9);
    *(_QWORD *)(a1 + 512) = 0;
  }
  v10 = *(void **)(a1 + 608);
  if (v10)
  {
    free(v10);
    *(_QWORD *)(a1 + 608) = 0;
  }
  v11 = *(void **)(a1 + 640);
  if (v11)
  {
    free(v11);
    *(_QWORD *)(a1 + 640) = 0;
  }
  v12 = *(void **)(a1 + 488);
  if (v12)
  {
    free(v12);
    *(_QWORD *)(a1 + 488) = 0;
  }
  v13 = *(void **)(a1 + 624);
  if (v13)
  {
    free(v13);
    *(_QWORD *)(a1 + 624) = 0;
  }
  v14 = *(OpaqueAudioConverter **)(a1 + 728);
  if (v14)
  {
    AudioConverterDispose(v14);
    *(_QWORD *)(a1 + 728) = 0;
  }
  *(_DWORD *)(a1 + 808) = 0;
  v15 = *(const void **)(a1 + 648);
  if (v15)
    CFRelease(v15);
  v16 = *(const void **)(a1 + 1136);
  if (v16)
  {
    CFRelease(v16);
    *(_QWORD *)(a1 + 1136) = 0;
  }
  v17 = *(_QWORD **)(a1 + 680);
  if (v17)
  {
    do
    {
      v18 = (_QWORD *)*v17;
      free(v17);
      *(_QWORD *)(a1 + 680) = v18;
      v17 = v18;
    }
    while (v18);
  }
  if (*(_DWORD *)(a1 + 16))
  {
    *(_DWORD *)(a1 + 16) = 0;
    if (gLogCategory_APReceiverAudioSessionBuffered <= 50
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  AES_CBCFrame_Final();
  v19 = *(NSObject **)(a1 + 1192);
  if (v19)
  {
    dispatch_release(v19);
    *(_QWORD *)(a1 + 1192) = 0;
  }
  v20 = *(NSObject **)(a1 + 1240);
  if (v20)
  {
    dispatch_release(v20);
    *(_QWORD *)(a1 + 1240) = 0;
  }
  v21 = *(void **)(a1 + 656);
  if (v21)
    free(v21);
  v22 = *(const void **)(a1 + 1264);
  if (v22)
  {
    CFRelease(v22);
    *(_QWORD *)(a1 + 1264) = 0;
  }
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v23 = *(const void **)(a1 + 24);
  if (v23)
    CFRelease(v23);
  free((void *)a1);
}

uint64_t APReceiverAudioSessionBufferedReadAudio(uint64_t a1, int a2, uint64_t a3, char *a4, unint64_t a5)
{
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  unsigned int (*v11)(uint64_t, uint64_t, size_t *);
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, __int128 *);
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  int v23;
  double v24;
  unint64_t v25;
  double v26;
  int v27;
  double v28;
  int v29;
  double v30;
  double v31;
  int v32;
  int v33;
  unsigned int v34;
  const void *v35;
  int v36;
  unint64_t v37;
  double v38;
  char v39;
  char v40;
  double v41;
  double v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  double v47;
  uint64_t v48;
  unint64_t v49;
  size_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  size_t v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  unsigned int *v67;
  unsigned int v68;
  int v69;
  int v70;
  size_t v71;
  uint64_t v72;
  int v73;
  int v74;
  size_t v75;
  size_t *v76;
  uint64_t v77;
  int8x8_t *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  size_t v84;
  int v85;
  int v86;
  int v87;
  size_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  unsigned int *v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  size_t v99;
  int v100;
  int v101;
  int v102;
  char *v103;
  uint64_t v104;
  unsigned int *v105;
  unsigned int v106;
  int v107;
  int v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  size_t v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  unint64_t v117;
  char *v118;
  char *v119;
  unsigned int v120;
  size_t v121;
  unint64_t v122;
  int v123;
  int v124;
  int *v125;
  unint64_t v126;
  unint64_t v127;
  char *v128;
  int *v129;
  int v130;
  unsigned int v131;
  unint64_t v132;
  int v133;
  int v134;
  int v135;
  uint64_t v136;
  int v137;
  double v138;
  double v139;
  uint64_t v140;
  size_t v142;
  char *v143;
  size_t v144;
  int v145;
  uint64_t v146;
  int v147;
  _QWORD *v148;
  unint64_t v149;
  size_t v150;
  size_t v151;
  size_t v152;
  uint64_t v153;
  unint64_t v154;
  const void *v156;
  _QWORD *v157;
  __int128 v160;
  uint64_t v161;
  size_t __y;
  unint64_t v163;
  uint64_t v164;

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
  if (*(_QWORD *)(a1 + 8))
  {
    if (*(_DWORD *)(a1 + 880))
    {
      if (mach_absolute_time() > *(_QWORD *)(a1 + 992))
      {
        v7 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (v7)
        {
          v156 = (const void *)v7;
          v8 = (_QWORD *)(a1 + 896);
          ++*(_DWORD *)(a1 + 1008);
          __y = 0;
          v163 = 0;
          v164 = 0;
          v9 = 3;
          while (1)
          {
            v160 = 0uLL;
            v161 = 0;
            v10 = *(_QWORD *)(a1 + 1144);
            v11 = *(unsigned int (**)(uint64_t, uint64_t, size_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 16);
            if (!v11 || v11(v10, a3, &__y))
            {
LABEL_37:
              APSLogErrorAt();
              goto LABEL_38;
            }
            v12 = __y;
            if (__y == *v8)
              break;
            v13 = *(_QWORD *)(a1 + 1144);
            v14 = *(_QWORD *)(a1 + 936);
            v15 = *(unsigned int (**)(uint64_t, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 16);
            if (!v15 || v15(v13, v14, &v160))
              goto LABEL_37;
            *(_OWORD *)v8 = v160;
            *(_QWORD *)(a1 + 912) = v161;
            *(_QWORD *)(a1 + 888) = *(_QWORD *)(a1 + 936);
            *(_DWORD *)(a1 + 920) = *(_DWORD *)(a1 + 976);
            *(_QWORD *)(a1 + 928) = *(_QWORD *)(a1 + 984);
            if (gLogCategory_APReceiverAudioSessionBuffered <= 40
              && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            if (!--v9)
            {
              if (gLogCategory_APReceiverAudioSessionBuffered <= 40)
              {
                v35 = v156;
                if (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize())
                  LogPrintF();
                goto LABEL_39;
              }
LABEL_38:
              v35 = v156;
LABEL_39:
              APSLogErrorAt();
              goto LABEL_77;
            }
          }
          v16 = *(_DWORD *)(a1 + 876);
          v17 = *(unsigned __int8 *)(a1 + 872);
          v18 = *(_DWORD *)(a1 + 1016);
          v19 = *(_DWORD *)(a1 + 920);
          v20 = *(_QWORD *)(a1 + 904);
          v153 = v164;
          v149 = v163;
          v21 = v163 >= v20;
          v22 = v163 - v20;
          v23 = !v21;
          v24 = *(double *)(a1 + 928);
          *(double *)&v25 = (double)v22;
          LODWORD(v25) = *(_DWORD *)(a1 + 92);
          v26 = ((double)((int)v164 - *(_DWORD *)(a1 + 912) - v23) + (double)v22 * 5.42101086e-20) * (double)v25;
          v27 = v19 + (uint64_t)v26;
          v28 = v24 + modf(v26, (long double *)&__y);
          v29 = v27 - 1;
          v30 = v28 + 1.0;
          if (v28 >= 0.0)
          {
            v30 = v28;
            v29 = v19 + (uint64_t)v26;
          }
          if (v28 > 1.0)
            v31 = v28 + -1.0;
          else
            v31 = v30;
          if (v28 > 1.0)
            v32 = v27 + 1;
          else
            v32 = v29;
          v147 = v18;
          v33 = a2 - v18;
          if (v32 - v33 >= 0)
            v34 = v32 - v33;
          else
            v34 = v33 - v32;
          if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation <= 30
            && (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation != -1
             || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (v34 >= v16)
          {
            v36 = a2 - v32;
            if (!v17)
            {
              v35 = v156;
              if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation > 30)
              {
                v39 = 0;
                v40 = 1;
                v38 = 0.0;
                v37 = v149;
                goto LABEL_63;
              }
              if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation != -1
                || _LogCategory_Initialize())
              {
                LogPrintF();
              }
              v37 = v149;
              goto LABEL_50;
            }
          }
          else
          {
            if (!v17)
            {
              v38 = v26 + v24 + (double)v19 - (double)v33;
              v37 = v149;
              if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation > 30)
              {
                v40 = 0;
                v39 = 1;
                v35 = v156;
                v36 = v147;
              }
              else
              {
                v35 = v156;
                v36 = v147;
                if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation != -1
                  || _LogCategory_Initialize())
                {
                  LogPrintF();
                }
                v40 = 0;
                v39 = 1;
              }
LABEL_63:
              if (*(_BYTE *)(a1 + 1036))
              {
                *(double *)(a1 + 1104) = v38;
                CFObjectSetPropertyDouble();
              }
              else
              {
                PIDUpdate();
                v42 = v41 * 1000.0;
                *(double *)(a1 + 1104) = v42;
                if (v42 >= 1.0)
                {
                  v43 = *(_DWORD *)(a1 + 92);
                  v44 = (int)v42;
                  if ((int)v42 < 0)
                    v44 = -v44;
                  v45 = 1000 * v43 / v44;
                  v46 = v43 / 0x3E8;
                  if (v45 > v46)
                    v46 = v45;
                  *(_DWORD *)(a1 + 1116) = v46;
                  *(_BYTE *)(a1 + 1037) = 1;
                }
                else
                {
                  *(_BYTE *)(a1 + 1037) = 0;
                }
              }
              *(_BYTE *)(a1 + 872) = 0;
              *(_QWORD *)(a1 + 936) = a3;
              *(_DWORD *)(a1 + 944) = a2;
              *(_QWORD *)(a1 + 952) = v12;
              *(_QWORD *)(a1 + 960) = v37;
              *(_QWORD *)(a1 + 968) = v153;
              *(_DWORD *)(a1 + 976) = v32;
              *(double *)(a1 + 984) = v31;
              *(_DWORD *)(a1 + 1016) = v36;
              if ((v39 & 1) == 0)
              {
                *(_BYTE *)(a1 + 772) = v40;
                ++*(_DWORD *)(a1 + 1032);
                *(_QWORD *)(a1 + 1048) = 0;
                *(_QWORD *)(a1 + 1080) = 0;
              }
              v47 = fabs(v38);
              if (v47 > *(double *)(a1 + 1024))
                *(double *)(a1 + 1024) = v47;
              v48 = mach_absolute_time();
              *(_QWORD *)(a1 + 992) = v48 + (unint64_t)(double)(unint64_t)UpTicksPerSecond();
LABEL_77:
              CFRelease(v35);
              goto LABEL_78;
            }
            v36 = a2 - v32;
          }
          v35 = v156;
          v37 = v149;
LABEL_50:
          v38 = 0.0;
          if (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation <= 30
            && (gLogCategory_APReceiverAudioSessionBufferedSkewCalculation != -1
             || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v39 = 0;
          v40 = 1;
          goto LABEL_63;
        }
      }
    }
  }
LABEL_78:
  v49 = *(unsigned int *)(a1 + 100);
  v50 = (a2 - *(_DWORD *)(a1 + 416));
  v51 = v50 + (a5 / v49);
  if (!*(_BYTE *)(a1 + 712)
    && gLogCategory_APReceiverAudioSessionBufferedNodes <= 40
    && (gLogCategory_APReceiverAudioSessionBufferedNodes != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(a1 + 880))
    goto LABEL_237;
  if (*(_BYTE *)(a1 + 872))
  {
    if (gLogCategory_APReceiverAudioSessionBuffered <= 30
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_237;
  }
  v52 = *(_QWORD **)(a1 + 584);
  v53 = (_QWORD *)*v52;
  v148 = v52;
  if ((_QWORD *)*v52 == v52)
  {
LABEL_237:
    v55 = 0;
    LODWORD(v54) = 0;
    goto LABEL_238;
  }
  v54 = 0;
  v55 = 0;
  v144 = 0;
  v143 = &a4[a5];
  v154 = v49;
  v146 = v50 + (a5 / v49);
  while (1)
  {
    v157 = (_QWORD *)*v53;
    v56 = *((_DWORD *)v53 + 14);
    v57 = *(_DWORD *)(a1 + 1016);
    v58 = *(_DWORD *)(a1 + 672);
    v59 = v58 + v57 + v56;
    v60 = v58 + v57 + *(_DWORD *)(a1 + 1000);
    if (gLogCategory_APReceiverAudioSessionBuffered <= 10)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered != -1
        || (v62 = v58 + v57 + v56, v63 = _LogCategory_Initialize(), v59 = v62, v63))
      {
        v61 = v59;
        LogPrintF();
        v59 = v61;
      }
    }
    if (v59 - (int)v51 >= 0)
      goto LABEL_238;
    if (*(_BYTE *)(a1 + 1004) && ((v60 - (_DWORD)v51) & 0x80000000) == 0)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 10
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_285;
    }
    v64 = *((_DWORD *)v53 + 15);
    if (*(_BYTE *)(a1 + 712))
    {
      v65 = (v64 - *(_DWORD *)(a1 + 720)) & 0xFFFFFF;
      if (v65 >= 2)
      {
        HIDWORD(qword_2553CE9F8) += v65 - 1;
        v66 = *(_QWORD *)(a1 + 1184);
        if (v66)
        {
          v67 = (unsigned int *)(v66 + 64);
          do
            v68 = __ldxr(v67);
          while (__stxr(v68 + v65 - 1, v67));
        }
        if (gLogCategory_APReceiverAudioSessionBufferedStats <= 30)
        {
          v69 = v59;
          if (gLogCategory_APReceiverAudioSessionBufferedStats != -1)
            goto LABEL_104;
          v150 = v50;
          v71 = v54;
          v72 = v51;
          v73 = v64;
          v74 = _LogCategory_Initialize();
          v64 = v73;
          v51 = v72;
          v54 = v71;
          v50 = v150;
          v59 = v69;
          if (v74)
          {
LABEL_104:
            v70 = v64;
            LogPrintF();
            v64 = v70;
            v59 = v69;
          }
        }
      }
    }
    *(_DWORD *)(a1 + 716) = v56;
    *(_DWORD *)(a1 + 720) = v64;
    *(_BYTE *)(a1 + 712) = 1;
    v76 = v53 + 4;
    v75 = v53[4];
    v77 = v53[2];
    if (v53[3] == v77 + 12)
      break;
LABEL_125:
    v91 = v59 + v75 / v49;
    if (*(_BYTE *)(a1 + 1004) && v91 - v60 < 0)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 10
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (APSContiguousAllocatorRelinquishBlock())
        goto LABEL_289;
LABEL_151:
      v53[5] = 0;
      v53[6] = 0;
      *v76 = 0;
      v96 = *v53;
      *(_QWORD *)(v96 + 8) = v53[1];
      *(_QWORD *)v53[1] = v96;
      *v53 = *(_QWORD *)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v53;
      --*(_DWORD *)(a1 + 600);
      v49 = v154;
      if (*(_QWORD *)(a1 + 480) > (unint64_t)APSContiguousAllocatorGetNextAvailableBlockSize())
        goto LABEL_216;
LABEL_156:
      audioSession_resumeNetworkReads(a1);
      goto LABEL_216;
    }
    if (v91 - (int)v50 > 0)
    {
      if (*(_BYTE *)(a1 + 1004))
      {
        v92 = v59;
        if ((int)v50 - v60 < 0)
        {
          v50 = ((v60 - v50) * v154);
          bzero(a4, v50);
          a4 += v50;
          LODWORD(v50) = v60;
        }
        else
        {
          if (gLogCategory_APReceiverAudioSessionBufferedStats <= 10
            && (gLogCategory_APReceiverAudioSessionBufferedStats != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          *(_BYTE *)(a1 + 1004) = 0;
        }
        v59 = v92;
        v51 = v146;
      }
      if ((int)v50 - v59 < 0)
      {
        v100 = v54;
        v101 = v59;
        v102 = v59 - v50;
        if ((*(_BYTE *)(a1 + 724) || *(_BYTE *)(a1 + 1228)) && gLogCategory_APReceiverAudioSessionBufferedStats <= 40)
        {
          if (gLogCategory_APReceiverAudioSessionBufferedStats != -1
            || (v51 = v146, _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        bzero(a4, (v102 * v154));
        a4 += (v102 * v154);
        v54 = (v100 + 1);
        v59 = v101;
        LODWORD(v50) = v101;
      }
      if (v59 - (int)v50 < 0)
      {
        ++dword_2553CEA00;
        v104 = *(_QWORD *)(a1 + 1184);
        if (v104)
        {
          v105 = (unsigned int *)(v104 + 68);
          do
            v106 = __ldxr(v105);
          while (__stxr(v106 + 1, v105));
        }
        if (gLogCategory_APReceiverAudioSessionBufferedStats <= 40)
        {
          if (gLogCategory_APReceiverAudioSessionBufferedStats != -1
            || (v108 = v59, v109 = _LogCategory_Initialize(), v59 = v108, v109))
          {
            v107 = v59;
            LogPrintF();
            v59 = v107;
          }
        }
        v110 = ((v50 - v59) * v154);
        v111 = v53[4];
        v103 = (char *)(v53[3] + v110);
        v53[3] = v103;
        v53[4] = v111 - v110;
        *((_DWORD *)v53 + 14) += v50 - v59;
        v54 = (v54 + 1);
        v59 = v50;
      }
      else
      {
        v103 = (char *)v53[3];
      }
      v152 = v54;
      if (*(_BYTE *)(a1 + 1037) && v103 == (char *)(v53[2] + 12))
      {
        v112 = *(double *)(a1 + 1104);
        if (v112 > 0.0)
        {
          v113 = *v76;
          v114 = *(unsigned int *)(a1 + 100);
          v115 = *v76 / v114;
          v116 = v103;
          v117 = v154;
          if (v115 >= 1)
          {
            v118 = &v103[4 * v115];
            v116 = v103;
            v119 = v103;
            do
            {
              v120 = *(_DWORD *)(a1 + 1112) + 1;
              *(_DWORD *)(a1 + 1112) = v120;
              if (v120 >= *(_DWORD *)(a1 + 1116))
              {
                *(_DWORD *)(a1 + 1112) = 0;
              }
              else
              {
                *(_DWORD *)v116 = *(_DWORD *)v119;
                v116 += 4;
              }
              v119 += 4;
            }
            while (v119 < v118);
            v114 = *(unsigned int *)(a1 + 100);
          }
          v121 = v116 - v103;
          v122 = (v113 - (v116 - v103)) / v114;
          v53[4] = v116 - v103;
          *((_DWORD *)v53 + 14) += v122;
          v123 = *(_DWORD *)(a1 + 1016) - v122;
          goto LABEL_202;
        }
        v121 = *v76;
        if (v112 < 0.0)
        {
          v124 = v59;
          v125 = *(int **)(a1 + 624);
          memcpy(v125, v103, v121);
          v126 = *(unsigned int *)(a1 + 100);
          v103 = (char *)v53[3];
          v127 = v53[4];
          v128 = v103;
          if ((uint64_t)(v127 / v126) >= 1)
          {
            v129 = &v125[v127 / v126];
            v128 = (char *)v53[3];
            do
            {
              v130 = *v125;
              v131 = *(_DWORD *)(a1 + 1112) + 1;
              *(_DWORD *)(a1 + 1112) = v131;
              if (v131 >= *(_DWORD *)(a1 + 1116))
              {
                *(_DWORD *)(a1 + 1112) = 0;
                *(_DWORD *)v128 = v130;
                v128 += 4;
              }
              *(_DWORD *)v128 = v130;
              v128 += 4;
              ++v125;
            }
            while (v125 < v129);
            v126 = *(unsigned int *)(a1 + 100);
          }
          v121 = v128 - v103;
          v132 = (v128 - v103 - v127) / v126;
          v53[4] = v128 - v103;
          *((_DWORD *)v53 + 14) -= v132;
          v123 = *(_DWORD *)(a1 + 1016) + v132;
          v117 = v154;
          v59 = v124;
LABEL_202:
          *(_DWORD *)(a1 + 1016) = v123;
        }
        else
        {
          v117 = v154;
        }
        v91 = v59 + v121 / v117;
      }
      v133 = v91 - v51;
      if (v91 - (int)v51 > 0)
        v91 = v51;
      v134 = v91 - v59;
      v54 = ((v91 - v59) * v154);
      if ((unint64_t)&v103[v54] > *(_QWORD *)(a1 + 640) + *(_QWORD *)(a1 + 616)
        && gLogCategory_APReceiverAudioSessionBuffered <= 40)
      {
        if (gLogCategory_APReceiverAudioSessionBuffered != -1
          || (v135 = _LogCategory_Initialize(), v103 = (char *)v53[3], v135))
        {
          LogPrintF();
          v103 = (char *)v53[3];
        }
      }
      memcpy(a4, v103, v54);
      a4 += v54;
      v50 = (v134 + v50);
      if (v133 >= 1)
      {
        v142 = v53[4] - v54;
        v53[3] += v54;
        v53[4] = v142;
        *((_DWORD *)v53 + 14) += v134;
        v55 = 1;
        LODWORD(v54) = v152;
        LODWORD(v49) = v154;
        goto LABEL_238;
      }
      bzero(*(void **)(a1 + 640), *(_QWORD *)(a1 + 616));
      v49 = v154;
      if (APSContiguousAllocatorRelinquishBlock())
      {
        APSLogErrorAt();
        v55 = 1;
        LODWORD(v54) = v152;
        goto LABEL_238;
      }
      v53[5] = 0;
      v53[6] = 0;
      *v76 = 0;
      v136 = *v53;
      *(_QWORD *)(v136 + 8) = v53[1];
      *(_QWORD *)v53[1] = v136;
      *v53 = *(_QWORD *)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v53;
      --*(_DWORD *)(a1 + 600);
      if (*(_QWORD *)(a1 + 480) <= (unint64_t)APSContiguousAllocatorGetNextAvailableBlockSize())
        audioSession_resumeNetworkReads(a1);
      v54 = v152;
      if (a4 >= v143)
        goto LABEL_285;
      goto LABEL_216;
    }
    ++dword_2553CEA00;
    v93 = *(_QWORD *)(a1 + 1184);
    if (v93)
    {
      v94 = (unsigned int *)(v93 + 68);
      do
        v95 = __ldxr(v94);
      while (__stxr(v95 + 1, v94));
    }
    v49 = v154;
    if (gLogCategory_APReceiverAudioSessionBufferedStats <= 40
      && (gLogCategory_APReceiverAudioSessionBufferedStats != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (APSContiguousAllocatorRelinquishBlock())
      goto LABEL_290;
    v53[5] = 0;
    v53[6] = 0;
    *v76 = 0;
    v97 = *v53;
    *(_QWORD *)(v97 + 8) = v53[1];
    *(_QWORD *)v53[1] = v97;
    *v53 = *(_QWORD *)(a1 + 592);
    *(_QWORD *)(a1 + 592) = v53;
    --*(_DWORD *)(a1 + 600);
    if (*(_QWORD *)(a1 + 480) <= (unint64_t)APSContiguousAllocatorGetNextAvailableBlockSize())
      goto LABEL_156;
LABEL_216:
    v55 = 1;
    v53 = v157;
    if (v157 == v148)
      goto LABEL_238;
  }
  *(_QWORD *)(a1 + 1256) += v75;
  v78 = *(int8x8_t **)(a1 + 656);
  if (!v78)
  {
    APSLogErrorAt();
LABEL_290:
    APSLogErrorAt();
LABEL_285:
    v55 = 1;
    goto LABEL_238;
  }
  v145 = v59;
  v151 = v54;
  *v78 = vrev32_s8(*(int8x8_t *)(v77 + 4));
  v79 = *(void **)(a1 + 640);
  v80 = *(_QWORD *)(a1 + 656);
  v81 = *(_QWORD *)(a1 + 664);
  v82 = v53[3];
  v83 = v53[4];
  v84 = *(_QWORD *)(a1 + 616);
  __y = 0;
  if (!*(_QWORD *)(a1 + 448))
  {
    v85 = *(_DWORD *)(a1 + 88);
    if (!*(_BYTE *)(a1 + 112) || v85 == 1)
    {
      if (*(_BYTE *)(a1 + 112))
        goto LABEL_118;
      if (v85 == 1)
      {
        if (v83 > v84)
          goto LABEL_224;
        Swap16Mem();
        v88 = v83;
      }
      else
      {
        v98 = audioSession_audioDecoderDecodeFrame_5132((void *)a1, v82, v83, *(void **)(a1 + 608), v84, &__y);
        if (v98)
        {
          v90 = v98;
          goto LABEL_226;
        }
        v99 = __y;
        if (__y > v84)
          goto LABEL_224;
        memcpy(v79, *(const void **)(a1 + 608), __y);
        v88 = v99;
      }
LABEL_121:
      v54 = v151;
      v90 = 0;
      *(_DWORD *)(a1 + 768) = ((10000 * v83 / v88) - *(_DWORD *)(a1 + 768) + (*(_DWORD *)(a1 + 768) << 6)) >> 6;
      v51 = v146;
      goto LABEL_122;
    }
LABEL_113:
    if (v84 >= v83)
    {
      v86 = audioSession_decryptPacket(a1, v80, v81, v82, v83, *(_QWORD *)(a1 + 608), &__y);
      if (v86)
      {
        v90 = v86;
      }
      else
      {
        v83 = __y;
        __y = 0;
        v87 = audioSession_audioDecoderDecodeFrame_5132((void *)a1, *(_QWORD *)(a1 + 608), v83, v79, v84, &__y);
        if (!v87)
        {
          v88 = __y;
          goto LABEL_121;
        }
        v90 = v87;
      }
      goto LABEL_226;
    }
    goto LABEL_224;
  }
  if (*(_DWORD *)(a1 + 88) != 1)
    goto LABEL_113;
LABEL_118:
  if (v84 < v83)
  {
LABEL_224:
    APSLogErrorAt();
    v90 = -6743;
    goto LABEL_227;
  }
  v89 = audioSession_decryptPacket(a1, v80, v81, v82, v83, *(_QWORD *)(a1 + 608), &__y);
  if (!v89)
  {
    v88 = __y;
    Swap16Mem();
    goto LABEL_121;
  }
  v90 = v89;
LABEL_226:
  APSLogErrorAt();
LABEL_227:
  v51 = v146;
  v54 = v151;
  v88 = v144;
LABEL_122:
  bzero(*(void **)(a1 + 656), *(_QWORD *)(a1 + 664));
  v53[3] = *(_QWORD *)(a1 + 640);
  v53[4] = v88;
  v144 = v88;
  if (!v90 && v88)
  {
    v75 = v88;
    v49 = v154;
    v59 = v145;
    goto LABEL_125;
  }
  if (gLogCategory_APReceiverAudioSessionBuffered <= 40
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  bzero(*(void **)(a1 + 640), *(_QWORD *)(a1 + 616));
  if (!APSContiguousAllocatorRelinquishBlock())
    goto LABEL_151;
LABEL_289:
  APSLogErrorAt();
  v55 = 1;
  LODWORD(v49) = v154;
LABEL_238:
  if (*(_BYTE *)(a1 + 712))
    *(_BYTE *)(a1 + 724) = 1;
  if ((int)v50 - (int)v51 < 0)
  {
    bzero(a4, ((v51 - v50) * v49));
    LODWORD(v54) = v54 + 1;
    if ((*(_BYTE *)(a1 + 724) || *(_BYTE *)(a1 + 1228))
      && gLogCategory_APReceiverAudioSessionBuffered <= 40
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!v55 || *(_QWORD *)(a1 + 680))
  {
    LODWORD(v54) = 0;
    goto LABEL_250;
  }
  if ((int)v54 < 1)
  {
LABEL_250:
    *(_DWORD *)(a1 + 776) += v54;
  }
  else
  {
    if (*(_BYTE *)(a1 + 772))
    {
      LODWORD(v54) = 0;
      *(_BYTE *)(a1 + 772) = 0;
      goto LABEL_250;
    }
    *(_DWORD *)(a1 + 776) += v54;
    if (gLogCategory_APReceiverAudioSessionBuffered <= 40
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (*(_BYTE *)(a1 + 712)
    && gLogCategory_APReceiverAudioSessionBufferedStats <= 50
    && (gLogCategory_APReceiverAudioSessionBufferedStats != -1 || _LogCategory_Initialize()))
  {
    v137 = *(_DWORD *)(a1 + 708) - *(_DWORD *)(a1 + 716);
    if (byte_2553CE9F0)
    {
      v138 = *((double *)&gAirPlayAudioStats + 1)
           + *(double *)&gAirPlayAudioStats * ((double)v137 - *((double *)&gAirPlayAudioStats + 1));
    }
    else
    {
      v138 = (double)v137;
      byte_2553CE9F0 = 1;
    }
    *((double *)&gAirPlayAudioStats + 1) = v138;
    v139 = ((double)(*(_DWORD *)(a1 + 92) >> 1) + v138 * 1000.0) / (double)*(unsigned int *)(a1 + 92);
    if (gLogCategory_APReceiverAudioSessionBuffered <= 10
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v140 = *(_QWORD *)(a1 + 1184);
    if (v140)
      *(_DWORD *)(v140 + 56) = (int)v139;
  }
  audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
  return 0;
}

uint64_t audioSession_decryptPacket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;

  if (*(_BYTE *)(a1 + 112))
  {
    chacha20_poly1305_init_64x64();
    chacha20_poly1305_add_aad();
    a5 -= 24;
    v10 = chacha20_poly1305_decrypt();
    if (chacha20_poly1305_verify() + v10 != a5)
    {
      APSLogErrorAt();
      return 4294960534;
    }
    v11 = 0;
    v12 = a1 + 408;
    do
    {
      if (++*(_BYTE *)(v12 + v11))
        v14 = 1;
      else
        v14 = v11 == 7;
      ++v11;
    }
    while (!v14);
  }
  else
  {
    v15 = AES_CBCFrame_Update();
    if ((_DWORD)v15)
    {
      v16 = v15;
      APSLogErrorAt();
      return v16;
    }
  }
  v16 = 0;
  *a7 = a5;
  return v16;
}

uint64_t audioSession_audioDecoderDecodeFrame_5132(void *inInputDataProcUserData, uint64_t a2, uint64_t a3, void *a4, UInt32 a5, _QWORD *a6)
{
  unsigned int v8;
  uint64_t v9;
  AudioBufferList v11;
  UInt32 ioOutputDataPacketSize;

  *(_QWORD *)&v11.mNumberBuffers = 1;
  *((_QWORD *)inInputDataProcUserData + 92) = a2;
  *((_QWORD *)inInputDataProcUserData + 93) = a2 + a3;
  ioOutputDataPacketSize = *((_DWORD *)inInputDataProcUserData + 26);
  v11.mBuffers[0].mNumberChannels = *((_DWORD *)inInputDataProcUserData + 24);
  v11.mBuffers[0].mDataByteSize = a5;
  v11.mBuffers[0].mData = a4;
  v8 = AudioConverterFillComplexBuffer(*((AudioConverterRef *)inInputDataProcUserData + 91), (AudioConverterComplexInputDataProc)audioSession_audioDecoderDecodeCallback_5143, inInputDataProcUserData, &ioOutputDataPacketSize, &v11, 0);
  if (v8 == -6750)
    v9 = 0;
  else
    v9 = v8;
  if ((_DWORD)v9)
    APSLogErrorAt();
  else
    *a6 = *((_DWORD *)inInputDataProcUserData + 25) * ioOutputDataPacketSize;
  return v9;
}

uint64_t audioSession_audioDecoderDecodeCallback_5143(uint64_t a1, _DWORD *a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(a5 + 736);
  v6 = *(_QWORD *)(a5 + 744);
  if (v5 == v6)
  {
    *a2 = 0;
    return 4294960546;
  }
  else
  {
    result = 0;
    *a2 = 1;
    *(_DWORD *)a3 = 1;
    *(_DWORD *)(a3 + 8) = *(_DWORD *)(a5 + 96);
    *(_DWORD *)(a3 + 12) = v6 - v5;
    *(_QWORD *)(a3 + 16) = v5;
    *(_QWORD *)(a5 + 736) = v6;
    *(_QWORD *)(a5 + 752) = 0;
    *(_DWORD *)(a5 + 760) = 0;
    *(_DWORD *)(a5 + 764) = v6 - v5;
    *a4 = a5 + 752;
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedConvertProgressRTPTimeToSecond(uint64_t a1, int a2, int a3, int a4, double *a5, double *a6, double a7, double a8)
{
  int v10;
  double v11;
  double v12;
  double v13;
  uint64_t result;

  if (a1)
  {
    v10 = *(_DWORD *)(a1 + 716);
    if (!*(_BYTE *)(a1 + 712))
      v10 = a3;
    LODWORD(a8) = *(_DWORD *)(a1 + 92);
    v11 = (double)*(unint64_t *)&a8;
    v12 = (double)(v10 - a2) / v11;
    v13 = (double)(a4 - a2) / v11;
    if (gLogCategory_APReceiverAudioSessionBuffered <= 40
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (a5)
      *a5 = v12;
    result = 0;
    if (a6)
      *a6 = v13;
  }
  else
  {
    APSLogErrorAt();
    return 4294895144;
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedSetSecurityInfo(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 4294895144;
  v2 = a1 + 424;
  AES_CBCFrame_Final();
  *(_QWORD *)(a1 + 448) = 0;
  v3 = AES_CBCFrame_Init();
  if ((_DWORD)v3)
    APSLogErrorAt();
  else
    *(_QWORD *)(a1 + 448) = v2;
  return v3;
}

uint64_t APReceiverAudioSessionBufferedStartPacketProcesser(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  if (*(_BYTE *)(a1 + 1227))
  {
    v8 = 4294895143;
    goto LABEL_16;
  }
  if (*(_QWORD *)(a1 + 80))
    return 0;
  *(_QWORD *)(a1 + 1200) = mach_absolute_time();
  v2 = pthread_create((pthread_t *)(a1 + 72), 0, (void *(__cdecl *)(void *))audioSession_networkThread_5153, (void *)a1);
  if ((_DWORD)v2)
  {
    v8 = v2;
    goto LABEL_16;
  }
  *(_QWORD *)(a1 + 80) = a1 + 72;
  *(_QWORD *)(a1 + 848) = *(_QWORD *)(a1 + 1200);
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 1192));
  *(_QWORD *)(a1 + 1216) = v3;
  if (!v3)
    goto LABEL_15;
  dispatch_set_context(v3, (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 1216), (dispatch_function_t)audioSession_performPeriodicTasks_5154);
  v4 = *(NSObject **)(a1 + 1216);
  v5 = dispatch_time(0, 250000000);
  dispatch_source_set_timer(v4, v5, 0xEE6B280uLL, 0xEE6B280uLL);
  dispatch_resume(*(dispatch_object_t *)(a1 + 1216));
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 1240));
  *(_QWORD *)(a1 + 1232) = v6;
  if (!v6)
  {
LABEL_15:
    APSLogErrorAt();
    return 4294960596;
  }
  dispatch_set_context(v6, (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 1232), (dispatch_function_t)audioSession_log_5155);
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 1232), 0, 0x1DCD6500uLL, 0);
  dispatch_resume(*(dispatch_object_t *)(a1 + 1232));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    dispatch_sync_f(*(dispatch_queue_t *)(v7 + 112), &v10, (dispatch_function_t)controlServer_startInternal);
    v8 = v11;
    if ((_DWORD)v11)
    {
LABEL_16:
      APSLogErrorAt();
      return v8;
    }
  }
  v8 = 0;
  *(_BYTE *)(a1 + 1227) = 1;
  return v8;
}

uint64_t audioSession_networkThread_5153(uint64_t a1)
{
  unint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  fd_set v11;
  __int16 v12;
  uint64_t v13;

  v2 = *(int *)(a1 + 48);
  memset(&v11, 0, sizeof(v11));
  pthread_setname_np("AirPlayAudioReceiver");
  SetCurrentThreadPriority();
  if (SocketAccept())
    goto LABEL_44;
  if (*(_BYTE *)(a1 + 1225))
    SocketSetP2P();
  if (!*(_BYTE *)(a1 + 1226))
    SocketSetQoS();
  v3 = *(_DWORD *)(a1 + 64);
  if ((v3 & 0x80000000) == 0)
  {
    if (close(v3) && *__error())
      __error();
    *(_DWORD *)(a1 + 64) = -1;
  }
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (NetSocket_CreateWithNative())
  {
LABEL_44:
    APSLogErrorAt();
    return 0;
  }
  v4 = 1 << v2;
  v5 = v2 >> 5;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          memset(&v11, 0, sizeof(v11));
          if (*(_BYTE *)(a1 + 1224) && __darwin_check_fd_set_overflow(-1, &v11, 0))
            LODWORD(STACK[0x200000000000007C]) = STACK[0x200000000000007C];
          if ((int)v2 <= -1)
            v6 = -1;
          else
            v6 = v2;
          if (__darwin_check_fd_set_overflow(v2, &v11, 0))
            v11.fds_bits[v5] |= v4;
          v7 = select(v6 + 1, &v11, 0, 0, 0);
          if (v7 > 0)
            break;
          if (v7 && *__error())
          {
            v8 = *__error();
            if (!v8)
              break;
            if (v8 == 4)
              continue;
          }
          usleep(0x186A0u);
        }
        __darwin_check_fd_set_overflow(-1, &v11, 0);
        if (__darwin_check_fd_set_overflow(v2, &v11, 0))
        {
          if ((v11.fds_bits[v5] & v4) != 0)
          {
            LOBYTE(v12) = 0;
            v13 = 0;
            v9 = SocketRecvFrom();
            if (v9 != 35)
              break;
          }
        }
      }
      if (!v9)
        break;
      APSLogErrorAt();
    }
  }
  while (v12 != 113);
  if (gLogCategory_APReceiverAudioSessionBuffered <= 30
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t audioSession_performPeriodicTasks_5154(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  if (result)
  {
    v1 = result;
    result = mach_absolute_time();
    if (*(_DWORD *)(v1 + 808) != *(_DWORD *)(v1 + 812))
      goto LABEL_10;
    v2 = result;
    v3 = result - *(_QWORD *)(v1 + 816);
    if (result - *(_QWORD *)(v1 + 848) > *(_QWORD *)(v1 + 856))
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 40)
      {
        if (gLogCategory_APReceiverAudioSessionBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        {
          UpTicksPerSecond();
          result = LogPrintF();
        }
      }
      *(_QWORD *)(v1 + 848) = v2;
    }
    if (v3 <= *(_QWORD *)(v1 + 824))
    {
LABEL_10:
      result = mach_absolute_time();
      if (result >= *(_QWORD *)(v1 + 792))
      {
        v4 = result;
        ++*(_DWORD *)(v1 + 788);
        v5 = *(_DWORD *)(v1 + 776);
        v6 = v5 - *(_DWORD *)(v1 + 780);
        *(_DWORD *)(v1 + 780) = v5;
        if (v6 < 1)
        {
          if (gLogCategory_APReceiverAudioSessionBuffered > 20)
            goto LABEL_21;
          if (gLogCategory_APReceiverAudioSessionBuffered == -1)
          {
            result = _LogCategory_Initialize();
            if (!(_DWORD)result)
              goto LABEL_21;
          }
        }
        else
        {
          ++*(_DWORD *)(v1 + 784);
          if (gLogCategory_APReceiverAudioSessionBuffered > 50)
            goto LABEL_21;
          if (gLogCategory_APReceiverAudioSessionBuffered == -1)
          {
            result = _LogCategory_Initialize();
            if (!(_DWORD)result)
              goto LABEL_21;
          }
        }
        result = LogPrintF();
LABEL_21:
        *(_QWORD *)(v1 + 792) = *(_QWORD *)(v1 + 800) + v4;
      }
    }
  }
  return result;
}

uint64_t audioSession_log_5155(uint64_t result)
{
  uint64_t v1;

  if (*(int *)(result + 476) <= 0)
    return APSLogErrorAt();
  v1 = result;
  if (!*(_DWORD *)(result + 92))
    return APSLogErrorAt();
  if (gLogCategory_APReceiverAudioSessionBuffered <= 50)
  {
    if (gLogCategory_APReceiverAudioSessionBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      APSSGetGasGaugeStringForPercent();
      result = LogPrintF();
    }
  }
  if (*(_DWORD *)(v1 + 1008) != *(_DWORD *)(v1 + 1012))
  {
    if (gLogCategory_APReceiverAudioSessionBuffered <= 50)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_DWORD *)(v1 + 1012) = *(_DWORD *)(v1 + 1008);
  }
  return result;
}

uint64_t audioSession_suspendNetworkReads(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 1224))
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 20
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v1 + 1224) = 0;
      result = SendSelfConnectedLoopbackMessage();
      if ((_DWORD)result)
        return APSLogErrorAt();
    }
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedStopPacketProcesser(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];
  _QWORD context[2];

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 1227))
    {
      if (*(_QWORD *)(result + 80))
      {
        result = *(unsigned int *)(result + 48);
        if ((_DWORD)result)
        {
          v2 = *(_QWORD *)(v1 + 40);
          if (v2)
          {
            context[0] = *(_QWORD *)(v1 + 40);
            context[1] = 0;
            dispatch_sync_f(*(dispatch_queue_t *)(v2 + 112), context, (dispatch_function_t)controlServer_stopInternal);
          }
          SendSelfConnectedLoopbackMessage();
          v3 = pthread_join(*(pthread_t *)(v1 + 72), 0);
          *(_QWORD *)(v1 + 80) = 0;
          v4 = MEMORY[0x24BDAC760];
          v5 = *(NSObject **)(v1 + 1192);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __APReceiverAudioSessionBufferedStopPacketProcesser_block_invoke;
          block[3] = &__block_descriptor_tmp_155;
          block[4] = v1;
          dispatch_sync(v5, block);
          v6 = *(NSObject **)(v1 + 1240);
          v7[0] = v4;
          v7[1] = 0x40000000;
          v7[2] = __APReceiverAudioSessionBufferedStopPacketProcesser_block_invoke_2;
          v7[3] = &__block_descriptor_tmp_156;
          v7[4] = v1;
          dispatch_sync(v6, v7);
          *(_QWORD *)(v1 + 1208) = mach_absolute_time();
          *(_BYTE *)(v1 + 1227) = 0;
          return v3;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      APSLogErrorAt();
      return 4294895143;
    }
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedUpdateLatency(_DWORD *a1)
{
  uint64_t result;

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  a1[168] = gAirTunesRelativeTimeOffset_5182 + a1[116] - a1[115];
  if (gLogCategory_APReceiverAudioSessionBuffered > 30)
    return 0;
  if (gLogCategory_APReceiverAudioSessionBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
  {
    LogPrintF();
    return 0;
  }
  return result;
}

uint64_t APReceiverAudioSessionBufferedCopyMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
  {
    if (a2)
    {
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetDouble();
      CFDictionarySetInt64();
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return 4294895145;
    }
  }
  else
  {
    v2 = 4294895144;
    APSLogErrorAt();
  }
  return v2;
}

uint64_t APReceiverAudioSessionBufferedLogEnded(uint64_t result, uint64_t a2)
{
  __CFDictionary *Mutable;

  if (result)
  {
    if (a2)
    {
      DataBuffer_AppendF();
      DataBuffer_AppendF();
      DataBuffer_AppendF();
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      FigCFDictionarySetInt32();
      UpTicksToSeconds();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt64();
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      CFDictionarySetValue(Mutable, CFSTR("sessionType"), CFSTR("AudioBuffered"));
      APSRTCReportingAgentSendMediaEvent();
      APSRTCReportingAgentSendEvent();
      if (Mutable)
        CFRelease(Mutable);
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return 4294895145;
    }
  }
  return result;
}

__CFDictionary *APReceiverAudioSessionBufferedCopyAudioBufferInfo(uint64_t a1, int *a2)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  CFMutableArrayRef v6;
  CFMutableArrayRef v7;
  _QWORD *v8;
  const void *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  const void *v12;
  _QWORD *v13;
  CFMutableDictionaryRef v14;
  __CFDictionary *v15;
  const void *v16;
  __CFDictionary *v17;
  uint64_t v18;
  int v19;
  uint64_t v21;
  __CFDictionary *theDict;
  int *v23;

  if (a1)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v5 = Mutable;
      v6 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (!v6)
      {
        v19 = -72150;
        APSLogErrorAt();
        v17 = 0;
LABEL_13:
        CFRelease(v5);
        goto LABEL_14;
      }
      v7 = v6;
      theDict = v5;
      v23 = a2;
      audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
      v8 = *(_QWORD **)(a1 + 584);
      v21 = a1;
      if ((_QWORD *)*v8 == v8)
      {
LABEL_11:
        v17 = theDict;
        CFDictionarySetValue(theDict, CFSTR("NodesInfo"), v7);
        CFDictionarySetInt64();
        v18 = v21;
        CFDictionarySetInt64();
        v19 = 0;
        v5 = 0;
      }
      else
      {
        v9 = (const void *)*MEMORY[0x24BDBD270];
        v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
        v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
        v12 = (const void *)*MEMORY[0x24BDBD268];
        v13 = (_QWORD *)*v8;
        while (1)
        {
          v14 = CFDictionaryCreateMutable(0, 0, v10, v11);
          if (!v14)
            break;
          v15 = v14;
          CFDictionarySetInt64();
          if (v13[3] == v13[2] + 12)
            v16 = v9;
          else
            v16 = v12;
          CFDictionarySetValue(v15, CFSTR("IsEncoded"), v16);
          CFArrayAppendValue(v7, v15);
          CFRelease(v15);
          v13 = (_QWORD *)*v13;
          if (v13 == v8)
            goto LABEL_11;
        }
        v19 = -72150;
        APSLogErrorAt();
        v17 = 0;
        v18 = v21;
        v5 = theDict;
      }
      audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(v18 + 1128));
      CFRelease(v7);
      a2 = v23;
      if (v5)
        goto LABEL_13;
    }
    else
    {
      v19 = -72150;
      APSLogErrorAt();
      v17 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    v17 = 0;
    v19 = -72152;
  }
LABEL_14:
  if (a2)
    *a2 = v19;
  return v17;
}

uint64_t APReceiverAudioSessionBufferedCopyProperty(uint64_t a1, CFTypeRef cf1, int *a3)
{
  const void *v6;
  uint64_t result;
  const __CFAllocator *v8;
  int *v9;
  CFNumberType v10;
  int v11;
  int v12;
  const void **v13;
  int v14;

  if (a1)
  {
    if (cf1)
    {
      if (gLogCategory_APReceiverAudioSessionBuffered <= 30
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (CFEqual(cf1, CFSTR("AudioFormat")))
      {
        v6 = *(const void **)(a1 + 1136);
LABEL_9:
        result = (uint64_t)CFRetain(v6);
LABEL_18:
        v11 = 0;
        goto LABEL_19;
      }
      if (CFEqual(cf1, CFSTR("CompressionType")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 88);
LABEL_12:
        v10 = kCFNumberSInt32Type;
LABEL_13:
        result = (uint64_t)CFNumberCreate(v8, v10, v9);
        goto LABEL_18;
      }
      if (CFEqual(cf1, CFSTR("MediaDataControlPort")))
      {
        result = CFNumberCreateInt64();
        goto LABEL_18;
      }
      if (CFEqual(cf1, CFSTR("MaximumLatency")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 468);
        goto LABEL_12;
      }
      if (CFEqual(cf1, CFSTR("MinimumLatency")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 464);
        goto LABEL_12;
      }
      if (CFEqual(cf1, CFSTR("NumberOfChannels")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 96);
        goto LABEL_12;
      }
      if (CFEqual(cf1, CFSTR("PlatformAudioLatency")))
      {
        audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
        v14 = *(_DWORD *)(a1 + 460);
        audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = &v14;
        goto LABEL_12;
      }
      if (CFEqual(cf1, CFSTR("AudioPort")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 456);
        v10 = kCFNumberIntType;
        goto LABEL_13;
      }
      if (CFEqual(cf1, CFSTR("SampleRate")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 92);
        goto LABEL_12;
      }
      if (CFEqual(cf1, CFSTR("audioBufferSize")))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v9 = (int *)(a1 + 496);
        v10 = kCFNumberSInt64Type;
        goto LABEL_13;
      }
      if (CFEqual(cf1, CFSTR("IsPlayingBufferedAudio")))
      {
        audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
        v12 = *(_DWORD *)(a1 + 880);
        audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
        v13 = (const void **)MEMORY[0x24BDBD270];
        if (!v12)
          v13 = (const void **)MEMORY[0x24BDBD268];
        goto LABEL_42;
      }
      if (CFEqual(cf1, CFSTR("IsUsingScreen")))
      {
        v13 = (const void **)MEMORY[0x24BDBD268];
LABEL_42:
        v6 = *v13;
        goto LABEL_9;
      }
      if (gLogCategory_APReceiverAudioSessionBuffered <= 50
        && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      result = 0;
      v11 = -72154;
    }
    else
    {
      APSLogErrorAt();
      result = 0;
      v11 = -72151;
    }
  }
  else
  {
    APSLogErrorAt();
    result = 0;
    v11 = -72152;
  }
LABEL_19:
  if (a3)
    *a3 = v11;
  return result;
}

uint64_t APReceiverAudioSessionBufferedSetProperty(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  int v11;
  unsigned int v12;

  v12 = 0;
  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  if (!a2)
  {
    v8 = 4294895145;
LABEL_33:
    APSLogErrorAt();
    return v8;
  }
  if (!a3)
  {
    v8 = 4294895145;
    goto LABEL_33;
  }
  if (gLogCategory_APReceiverAudioSessionBuffered <= 30
    && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  audioSession_sessionLock_5073(*(pthread_mutex_t **)(a1 + 1128));
  if (CFEqual(a2, CFSTR("VolumeLinear")))
  {
    if (gLogCategory_APReceiverAudioSessionBuffered <= 50
      && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = APReceiverAudioSessionPlatformSetProperty(*(_QWORD **)a1, v6, CFSTR("RASP::VolumeLinear"), v7, a3);
    if (v12)
      APSLogErrorAt();
    goto LABEL_19;
  }
  if (CFEqual(a2, CFSTR("PlatformAudioLatency")))
  {
    *(_DWORD *)(a1 + 460) = CFGetInt64Ranged();
  }
  else
  {
    if (!CFEqual(a2, CFSTR("RTCMetadata")))
    {
      if (CFEqual(a2, CFSTR("timelineOffset")))
      {
        v10 = CFGetInt64();
        if ((v10 - 251) > 0xFFFFFE0A)
        {
          gAirTunesRelativeTimeOffset_5182 = v10;
          goto LABEL_19;
        }
        APSLogErrorAt();
        v11 = -6710;
      }
      else
      {
        if (gLogCategory_APReceiverAudioSessionBuffered <= 50
          && (gLogCategory_APReceiverAudioSessionBuffered != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v11 = -72154;
      }
      v12 = v11;
      goto LABEL_19;
    }
    APSRTCReportingAgentSendMediaEvent();
  }
LABEL_19:
  audioSession_sessionUnlock_5075(*(pthread_mutex_t **)(a1 + 1128));
  return v12;
}

uint64_t _GetTypeID_5264()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAirPlayReceiverSessionTypeID = result;
  return result;
}

void _Finalize_5266(uint64_t a1)
{
  void (*v2)(uint64_t, _QWORD);
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  NSObject *v14;

  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_BYTE *)(a1 + 441))
  {
    if (gLogCategory_AirPlayReceiverCore > 100
      || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_47;
    }
LABEL_46:
    LogPrintF();
LABEL_47:
    __break(1u);
    return;
  }
  v2 = *(void (**)(uint64_t, _QWORD))(a1 + 80);
  if (v2)
    v2(a1, *(_QWORD *)(a1 + 56));
  if (!*(_BYTE *)(a1 + 659))
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 30
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_QWORD *)(a1 + 48))
    {
      if (gLogCategory_AirPlayReceiverPlatform > 100
        || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  v3 = *(const void **)(a1 + 736);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 736) = 0;
  }
  v4 = *(const void **)(a1 + 568);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 568) = 0;
  }
  v5 = *(const void **)(a1 + 672);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 672) = 0;
  }
  v6 = *(const void **)(a1 + 712);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 712) = 0;
  }
  v7 = *(const void **)(a1 + 720);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 720) = 0;
  }
  v8 = *(const void **)(a1 + 640);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 640) = 0;
  }
  v9 = *(const void **)(a1 + 648);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 648) = 0;
  }
  v10 = *(const void **)(a1 + 592);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 592) = 0;
  }
  v11 = *(const void **)(a1 + 600);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a1 + 600) = 0;
  }
  v12 = *(const void **)(a1 + 432);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 432) = 0;
  }
  v13 = *(const void **)(a1 + 24);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v14 = *(NSObject **)(a1 + 16);
  if (v14)
  {
    dispatch_release(v14);
    *(_QWORD *)(a1 + 16) = 0;
  }
}

void _Cleanup(uint64_t a1, uint64_t a2)
{
  const void *v4;
  uint64_t (*v5)(const void *);
  NSObject *v6;
  uint64_t (*v7)(const void *);
  int v8;
  NSObject *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  void *ValueAtIndex;
  int v14;
  const __CFArray *v15;
  const __CFArray *v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex j;
  const void *v20;
  const __CFArray *v21;
  const __CFArray *v22;
  CFIndex v23;
  CFIndex v24;
  CFIndex k;
  void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  const void *v37;
  CFTypeRef block[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  if (*(_QWORD *)(a1 + 600) && !*(_BYTE *)(a1 + 659))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
  }
  if (!*(_BYTE *)(a1 + 441))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_BYTE *)(a1 + 659))
    {
LABEL_21:
      mach_absolute_time();
      UpTicksToSeconds();
      if ((_DWORD)a2)
      {
        if (gLogCategory_AirPlayReceiverCore > 50
          || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_34;
        }
        if (!*(_BYTE *)(a1 + 657))
        {
LABEL_30:
          LogPrintF();
LABEL_34:
          v9 = *(NSObject **)(a1 + 184);
          if (v9)
          {
            dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
            dispatch_release(v9);
            *(_QWORD *)(a1 + 184) = 0;
          }
          Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 568));
          block[0] = 0;
          if (Count >= 1)
          {
            v11 = Count;
            if (_cfDictionaryCopyKeysAndValues(*(const __CFDictionary **)(a1 + 568), block, 0))
            {
              APSLogErrorAt();
            }
            else
            {
              for (i = 0; i != v11; ++i)
              {
                ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)block[0], i);
                _AudioTearDownStream(a1, 0, ValueAtIndex, a2);
              }
              if (!*(_BYTE *)(a1 + 730))
                CFObjectSetProperty();
            }
            if (block[0])
              CFRelease(block[0]);
          }
          _ScreenTearDown(a1);
          if (!CFEqual(*(CFTypeRef *)(a1 + 648), CFSTR("None")) && *(_QWORD *)(a1 + 448) && !*(_BYTE *)(a1 + 659))
          {
            AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v14, CFSTR("timingProtocol"), 0, 0);
            APSNetworkClockRemoveAllPeers();
            v35 = *(_QWORD *)(a1 + 448);
            v36 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
            if (v36)
              v36(v35, a1);
            v37 = *(const void **)(a1 + 448);
            if (v37)
            {
              CFRelease(v37);
              *(_QWORD *)(a1 + 448) = 0;
            }
          }
          _ControlTearDown(a1);
          if (*(_QWORD *)(a1 + 712))
          {
            v15 = (const __CFArray *)CFDictionaryCopyKeys();
            if (v15)
            {
              v16 = v15;
              v17 = CFArrayGetCount(v15);
              if (v17 >= 1)
              {
                v18 = v17;
                for (j = 0; j != v18; ++j)
                {
                  v20 = CFArrayGetValueAtIndex(v16, j);
                  _PlaybackV2TearDown(a1, v20);
                }
              }
              CFRelease(v16);
            }
          }
          _UpdateActiveSessionRegistration((uint64_t *)a1);
          if (*(_QWORD *)(a1 + 672))
          {
            v21 = (const __CFArray *)CFDictionaryCopyKeys();
            if (v21)
            {
              v22 = v21;
              v23 = CFArrayGetCount(v21);
              if (v23 >= 1)
              {
                v24 = v23;
                for (k = 0; k != v24; ++k)
                {
                  v26 = (void *)CFArrayGetValueAtIndex(v22, k);
                  _RemoteControlSessionTearDown(a1, v26);
                }
              }
              CFRelease(v22);
            }
          }
          if (!*(_BYTE *)(a1 + 659))
            AirPlayReceiverSessionPlatformControl((_QWORD *)a1, CFSTR("stopSession"));
          v27 = *(const void **)(a1 + 176);
          if (v27)
          {
            CFRelease(v27);
            *(_QWORD *)(a1 + 176) = 0;
          }
          if (*(_QWORD *)(a1 + 600))
          {
            CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterRemoveListener();
          }
          v28 = *(const void **)(a1 + 680);
          if (v28)
          {
            CFRelease(v28);
            *(_QWORD *)(a1 + 680) = 0;
          }
          v29 = *(const void **)(a1 + 312);
          if (v29)
          {
            CFRelease(v29);
            *(_QWORD *)(a1 + 312) = 0;
          }
          v30 = *(const void **)(a1 + 320);
          if (v30)
          {
            CFRelease(v30);
            *(_QWORD *)(a1 + 320) = 0;
          }
          v31 = *(const void **)(a1 + 296);
          if (v31)
          {
            CFRelease(v31);
            *(_QWORD *)(a1 + 296) = 0;
          }
          v32 = *(const void **)(a1 + 304);
          if (v32)
          {
            CFRelease(v32);
            *(_QWORD *)(a1 + 304) = 0;
          }
          v33 = *(const void **)(a1 + 288);
          if (v33)
          {
            CFRelease(v33);
            *(_QWORD *)(a1 + 288) = 0;
          }
          AES_CBCFrame_Final();
          v34 = *(const void **)(a1 + 616);
          if (v34)
          {
            CFRelease(v34);
            *(_QWORD *)(a1 + 616) = 0;
          }
          *(_QWORD *)(a1 + 32) = 0;
          *(_BYTE *)(a1 + 441) = 1;
          return;
        }
      }
      else
      {
        if (gLogCategory_AirPlayReceiverCore > 50
          || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_34;
        }
        if (!*(_BYTE *)(a1 + 657))
          goto LABEL_30;
      }
      APSIsMemberOfHTGroup();
      goto LABEL_30;
    }
    v4 = *(const void **)(a1 + 592);
    if (!v4)
    {
LABEL_20:
      _AirPlayReceiverSessionRemoveTrafficRegistration(a1);
      goto LABEL_21;
    }
    v39 = 0;
    v40 = &v39;
    v41 = 0x2000000000;
    v42 = 0;
    v5 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
    {
      v6 = v5(v4);
      if (!v6)
      {
        v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v7)
          v8 = v7(v4);
        else
          v8 = -12782;
        *((_DWORD *)v40 + 6) = v8;
        goto LABEL_19;
      }
    }
    else
    {
      v6 = MEMORY[0x24BDAC9B8];
    }
    block[0] = (CFTypeRef)MEMORY[0x24BDAC760];
    block[1] = (CFTypeRef)0x40000000;
    block[2] = __APReceiverSBufConsumerStop_block_invoke;
    block[3] = &unk_24E220020;
    block[4] = &v39;
    block[5] = v4;
    dispatch_sync(v6, block);
LABEL_19:
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterPostNotification();
    _Block_object_dispose(&v39, 8);
    goto LABEL_20;
  }
}

void _AirPlayReceiverSession_HandleUINotifications(int a1, _QWORD *a2, CFTypeRef cf1, uint64_t a4, const void *a5)
{
  NSObject *v8;
  _QWORD *v9;
  int Int64;
  _QWORD block[5];
  _QWORD v12[5];
  _QWORD v13[5];
  int v14;
  _QWORD v15[5];
  _QWORD v16[6];

  if (CFEqual(cf1, CFSTR("userStop")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _AirPlayReceiverSession_Terminate((uint64_t)a2);
    return;
  }
  if (CFEqual(cf1, CFSTR("FPSSecureStopGenerated")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRetain(a2);
    if (a5)
      CFRetain(a5);
    v8 = a2[2];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___AirPlayReceiverSession_HandleUINotifications_block_invoke;
    v16[3] = &__block_descriptor_tmp_240;
    v16[4] = a2;
    v16[5] = a5;
    v9 = v16;
LABEL_44:
    dispatch_async(v8, v9);
    return;
  }
  if (CFEqual(cf1, CFSTR("serverDied")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRetain(a2);
    v8 = a2[2];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = ___AirPlayReceiverSession_HandleUINotifications_block_invoke_2;
    v15[3] = &__block_descriptor_tmp_242;
    v15[4] = a2;
    v9 = v15;
    goto LABEL_44;
  }
  if (CFEqual(cf1, CFSTR("stopPresentation")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    Int64 = CFDictionaryGetInt64();
    CFRetain(a2);
    v8 = a2[2];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = ___AirPlayReceiverSession_HandleUINotifications_block_invoke_3;
    v13[3] = &__block_descriptor_tmp_244;
    v14 = Int64;
    v13[4] = a2;
    v9 = v13;
    goto LABEL_44;
  }
  if (CFEqual(cf1, CFSTR("KeyFrameNeeded")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRetain(a2);
    v8 = a2[2];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = ___AirPlayReceiverSession_HandleUINotifications_block_invoke_4;
    v12[3] = &__block_descriptor_tmp_246;
    v12[4] = a2;
    v9 = v12;
    goto LABEL_44;
  }
  if (CFEqual(cf1, CFSTR("UpdateDisplayInfo")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRetain(a2);
    v8 = a2[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___AirPlayReceiverSession_HandleUINotifications_block_invoke_5;
    block[3] = &__block_descriptor_tmp_248;
    block[4] = a2;
    v9 = block;
    goto LABEL_44;
  }
  if (CFEqual(cf1, CFSTR("ScreenRecordingStarted")))
  {
    _ScreenPostRecordingState((NSObject **)a2, 1);
  }
  else if (CFEqual(cf1, CFSTR("ScreenRecordingStopped")))
  {
    _ScreenPostRecordingState((NSObject **)a2, 0);
  }
}

void _AirPlayReceiverSessionRemoveTrafficRegistration(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 432);
  if (v2)
  {
    if (gLogCategory_AirPlayReceiverCore > 50)
      goto LABEL_7;
    if (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize())
      LogPrintF();
    v2 = *(const void **)(a1 + 432);
    if (v2)
    {
LABEL_7:
      CFRelease(v2);
      *(_QWORD *)(a1 + 432) = 0;
    }
  }
}

uint64_t _cfDictionaryCopyKeysAndValues(const __CFDictionary *a1, CFTypeRef *a2, CFTypeRef *a3)
{
  size_t Count;
  size_t v7;
  const void **v8;
  const void **v9;
  CFArrayRef v10;
  const __CFAllocator *v11;
  const __CFAllocator *v12;
  CFArrayRef v13;
  uint64_t v14;

  Count = CFDictionaryGetCount(a1);
  v7 = Count;
  if (!a2)
  {
    v8 = 0;
    if (a3)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v8 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  if (!v8)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  if (!a3)
    goto LABEL_7;
LABEL_4:
  v9 = (const void **)malloc_type_calloc(v7, 8uLL, 0xC0040B8AA526DuLL);
  if (!v9)
  {
    APSLogErrorAt();
    v10 = 0;
LABEL_31:
    v13 = 0;
    goto LABEL_33;
  }
LABEL_8:
  CFDictionaryGetKeysAndValues(a1, v8, v9);
  if (a2)
  {
    v11 = CFGetAllocator(a1);
    v10 = CFArrayCreate(v11, v8, v7, MEMORY[0x24BDBD690]);
    if (!v10)
    {
      APSLogErrorAt();
      goto LABEL_31;
    }
    if (a3)
    {
LABEL_11:
      v12 = CFGetAllocator(a1);
      v13 = CFArrayCreate(v12, v9, v7, MEMORY[0x24BDBD690]);
      if (!v13)
      {
        APSLogErrorAt();
LABEL_33:
        v14 = 4294960568;
        if (!v8)
          goto LABEL_22;
        goto LABEL_21;
      }
      if (a2)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
    if (a3)
      goto LABEL_11;
  }
  v13 = 0;
  if (a2)
LABEL_13:
    *a2 = CFRetain(v10);
LABEL_14:
  if (a3)
  {
    v14 = 0;
    *a3 = CFRetain(v13);
    if (!v8)
      goto LABEL_22;
    goto LABEL_21;
  }
  v14 = 0;
  if (v8)
LABEL_21:
    free(v8);
LABEL_22:
  if (v9)
    free(v9);
  if (v10)
    CFRelease(v10);
  if (v13)
    CFRelease(v13);
  return v14;
}

void _AudioTearDownStream(uint64_t a1, uint64_t a2, void *key, uint64_t a4)
{
  _QWORD *Value;
  _QWORD *v9;
  _QWORD *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;
  void (*v13)(_QWORD, CFMutableDictionaryRef);
  void (*v14)(_QWORD, _OWORD *, uint64_t);
  const void *v15;
  __CFDictionary *v16;
  uint64_t v17;
  void (*v18)(uint64_t, __CFDictionary *);
  int v19;
  _OWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!key)
    goto LABEL_38;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 568), key);
  if (!Value)
    goto LABEL_38;
  v9 = Value;
  v10 = *(_QWORD **)(a1 + 576);
  if (!a2)
  {
    v12 = 0;
    goto LABEL_11;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
LABEL_38:
    APSLogErrorAt();
    return;
  }
  v12 = Mutable;
  CFNumberGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
  CFNumberGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
  CFNumberGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
  CFNumberGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
  CFNumberGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  FigCFDictionarySetValue();
LABEL_11:
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v13 = (void (*)(_QWORD, CFMutableDictionaryRef))v9[10];
  if (v13)
    v13(v9[5], v12);
  DataBuffer_Init();
  DataBuffer_AppendF();
  v14 = (void (*)(_QWORD, _OWORD *, uint64_t))v9[21];
  if (v14)
    v14(v9[5], v20, a4);
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DataBuffer_Free();
  APReceiverAudioSessionInvalidate((uint64_t)v9);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 568), key);
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v9 == v10)
  {
    v15 = *(const void **)(a1 + 576);
    if (v15)
    {
      CFRelease(v15);
      *(_QWORD *)(a1 + 576) = 0;
    }
  }
  if (*(_QWORD *)(a1 + 600))
  {
    v16 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(v16, CFSTR("sessionID"), key);
    v17 = *(_QWORD *)(a1 + 600);
    v18 = *(void (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
    if (v18)
      v18(v17, v16);
    if (v16)
      CFRelease(v16);
  }
  v19 = *(_DWORD *)(a1 + 556);
  if (*(_DWORD *)(a1 + 552) != v19)
  {
    *(_DWORD *)(a1 + 552) = v19;
    *(_QWORD *)(a1 + 520) = UpTicksPerSecond() * v19;
    SocketSetKeepAlive();
  }
  if (v9 == v10)
    AirPlayReceiverSessionPlatformControl((_QWORD *)a1, CFSTR("handleMediaAudioStoppingForSession"));
  _UpdateActiveSessionRegistration((uint64_t *)a1);
  if (v12)
    CFRelease(v12);
}

void _ScreenTearDown(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);
  const void *v4;
  CFMutableDictionaryRef Mutable;
  uint64_t v6;
  void (*v7)(uint64_t, CFMutableDictionaryRef);

  v1 = *(_QWORD *)(a1 + 616);
  if (v1)
  {
    v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v3)
      v3(v1);
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(const void **)(a1 + 616);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 616) = 0;
    }
    if (*(_QWORD *)(a1 + 600) && *(_BYTE *)(a1 + 633))
    {
      *(_BYTE *)(a1 + 633) = 0;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetNumber();
      CFDictionarySetNumber();
      v6 = *(_QWORD *)(a1 + 600);
      v7 = *(void (**)(uint64_t, CFMutableDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v7)
        v7(v6, Mutable);
      *(_DWORD *)(a1 + 636) = 0;
      if (Mutable)
        CFRelease(Mutable);
    }
    _UpdateActiveSessionRegistration((uint64_t *)a1);
  }
}

int *_ControlTearDown(uint64_t a1)
{
  const void *v2;
  int *result;

  if (*(_BYTE *)(a1 + 456))
  {
    *(_BYTE *)(a1 + 456) = 0;
    if (gLogCategory_AirPlayReceiverCore <= 30
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (*(_QWORD *)(a1 + 464))
  {
    HTTPClientInvalidate();
    CFRelease(*(CFTypeRef *)(a1 + 464));
    *(_QWORD *)(a1 + 464) = 0;
  }
  v2 = *(const void **)(a1 + 488);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 488) = 0;
  }
  result = (int *)*(unsigned int *)(a1 + 476);
  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      result = __error();
      if (*result)
        result = __error();
    }
    *(_DWORD *)(a1 + 476) = -1;
  }
  return result;
}

void _PlaybackV2TearDown(uint64_t a1, const void *a2)
{
  __CFDictionary *Mutable;
  uint64_t v5;
  void (*v6)(uint64_t, __CFDictionary *);

  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(a1 + 600))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("sessionID"), a2);
    v5 = *(_QWORD *)(a1 + 600);
    v6 = *(void (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (v6)
      v6(v5, Mutable);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 712), a2);
    CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 720), a2);
    if (CFSetGetCount(*(CFSetRef *)(a1 + 720)))
    {
      if (Mutable)
LABEL_10:
        CFRelease(Mutable);
    }
    else
    {
      _UpdateActiveSessionRegistration((uint64_t *)a1);
      if (Mutable)
        goto LABEL_10;
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void _UpdateActiveSessionRegistration(uint64_t *a1)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v3;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("session"), a1);
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    if (AirPlayReceiverServerPlatformControl(a1[3], CFSTR("updateActiveSessionRegistration"), 0, v3))
      APSLogErrorAt();
    CFRelease(v3);
  }
  else
  {
    APSLogErrorAt();
  }
}

void _RemoteControlSessionTearDown(uint64_t a1, void *key)
{
  const void *Value;
  const void *v5;
  void (*v6)(const void *);

  if (key)
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 672), key);
    if (Value)
    {
      v5 = Value;
      v6 = *(void (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v6)
        v6(v5);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 672), key);
    }
    else if (gLogCategory_AirPlayReceiverCore <= 50
           && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t _AirPlayReceiverSession_Terminate(uint64_t a1)
{
  if (!a1)
  {
    if (gLogCategory_AirPlayReceiverCore > 50
      || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
    {
      return CFObjectControlAsync();
    }
LABEL_5:
    LogPrintF();
    return CFObjectControlAsync();
  }
  _ReportSessionStallIfNeeded(a1, 2);
  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_AirPlayReceiverCore > 50
      || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
    {
      return CFObjectControlAsync();
    }
    goto LABEL_5;
  }
  return APSLogErrorAt();
}

void _ScreenPostRecordingState(NSObject **cf, char a2)
{
  NSObject *v4;
  _QWORD block[5];
  char v6;

  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(cf);
  v4 = cf[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ScreenPostRecordingState_block_invoke;
  block[3] = &__block_descriptor_tmp_264;
  v6 = a2;
  block[4] = cf;
  dispatch_async(v4, block);
}

uint64_t AirPlayReceiverSessionSendCommandForObject(uint64_t a1, const __CFNumber *a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t inited;
  int v12;
  uint64_t v13;
  const __CFData *Data;
  const __CFData *v15;
  uint64_t v16;
  CFMutableDictionaryRef Mutable;
  CFTypeRef v18;
  _QWORD *v19;
  CFTypeRef v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t valuePtr;
  CFTypeRef cf;

  cf = 0;
  if (!*(_BYTE *)(a1 + 458))
    return 0;
  if (!*(_QWORD *)(a1 + 464))
  {
    v22 = 0;
LABEL_26:
    v15 = 0;
LABEL_29:
    Mutable = 0;
    goto LABEL_13;
  }
  v10 = HTTPMessageCreate();
  if ((_DWORD)v10)
  {
    v22 = v10;
LABEL_25:
    APSLogErrorAt();
    goto LABEL_26;
  }
  *((_DWORD *)cf + 2411) = *(_DWORD *)(a1 + 556);
  inited = HTTPHeader_InitRequest();
  if ((_DWORD)inited)
  {
    v22 = inited;
    goto LABEL_25;
  }
  v12 = *(_DWORD *)(a1 + 472) + 1;
  v13 = HTTPHeader_SetField();
  if ((_DWORD)v13)
  {
    v22 = v13;
    goto LABEL_25;
  }
  if (a2)
  {
    valuePtr = 0;
    CFNumberGetValue(a2, kCFNumberSInt64Type, &valuePtr);
    HTTPHeader_SetField();
  }
  Data = CFPropertyListCreateData(0, a3, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v15 = Data;
  if (Data)
  {
    CFDataGetBytePtr(Data);
    CFDataGetLength(v15);
    v16 = HTTPMessageSetBody();
    if (!(_DWORD)v16)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        mach_absolute_time();
        CFDictionarySetInt64();
        HTTPClientGetClientID();
        CFDictionarySetInt64();
        *(_DWORD *)(a1 + 472) = v12;
        v18 = CFRetain((CFTypeRef)a1);
        v19 = cf;
        *((_QWORD *)cf + 1209) = v18;
        v19[1210] = a4;
        v19[1211] = a5;
        v20 = CFRetain(Mutable);
        v21 = cf;
        *((_QWORD *)cf + 1212) = v20;
        v21[1214] = _AirPlayReceiverSessionSendCommandCompletion;
        v22 = HTTPClientSendMessage();
        if ((_DWORD)v22)
        {
          CFRelease((CFTypeRef)a1);
          CFRelease(Mutable);
          APSLogErrorAt();
        }
      }
      else
      {
        APSLogErrorAt();
        v22 = 0;
      }
      goto LABEL_13;
    }
    v22 = v16;
    APSLogErrorAt();
    goto LABEL_29;
  }
  APSLogErrorAt();
  Mutable = 0;
  v22 = 4294960596;
LABEL_13:
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
  if (Mutable)
    CFRelease(Mutable);
  return v22;
}

void _AirPlayReceiverSessionSendCommandCompletion(_QWORD *a1)
{
  const void *v2;
  void (*v3)(_QWORD, uint64_t, _QWORD);
  const void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  unsigned int Int64;

  v2 = (const void *)a1[1209];
  v3 = (void (*)(_QWORD, uint64_t, _QWORD))a1[1210];
  v4 = (const void *)a1[1212];
  CFDictionaryGetInt64();
  mach_absolute_time();
  UpTicksToSecondsF();
  if (v5 > 5.0)
  {
    CFDictionaryGetInt64Ranged();
    if (gLogCategory_AirPlayReceiverCore <= 60
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (v3)
  {
    CFDictionaryGetTypeID();
    v6 = CFCreateWithPlistBytes();
    Int64 = CFDictionaryGetInt64();
    if (Int64)
      v7 = 0;
    else
      v7 = v6;
    v3(Int64, v7, a1[1211]);
    v8 = (const void *)v6;
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v2);
  CFRelease(v4);
  if (v8)
    CFRelease(v8);
}

uint64_t AirPlayReceiverSessionForceKeyFrame(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  uint64_t v8;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v7 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("forceKeyFrame"));
    v8 = AirPlayReceiverSessionSendCommandForObject(a1, 0, v7, a2, a3);
    if ((_DWORD)v8)
      APSLogErrorAt();
    CFRelease(v7);
  }
  else
  {
    APSLogErrorAt();
    return 4294960568;
  }
  return v8;
}

void _ReportSessionStallIfNeeded(uint64_t a1, int a2)
{
  int v4;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v6;

  v4 = *(_DWORD *)(a1 + 536);
  if (a2 == 1)
  {
    if (v4 == 1)
      return;
  }
  else if (v4 != 1)
  {
    return;
  }
  if (gLogCategory_AirPlayReceiverCore <= 60
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v6 = Mutable;
    CFDictionarySetInt64();
    AirPlayReceiverServerPlatformControl(*(_QWORD *)(a1 + 24), CFSTR("reportSessionStall"), 0, v6);
    *(_DWORD *)(a1 + 536) = a2;
    CFRelease(v6);
  }
  else
  {
    APSLogErrorAt();
  }
}

__n128 AirPlayReceiverSessionSetDelegate(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

uint64_t AirPlayReceiverSessionControl(uint64_t a1, int a2, CFTypeRef cf1, __CFString *a4, const __CFDictionary *a5, __CFDictionary **a6)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v12;
  CFMutableArrayRef v13;
  CFMutableArrayRef v14;
  const void *TypedValue;
  const __CFDictionary *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, __CFDictionary *, __CFDictionary **);
  int v22;
  const void *v23;
  const void *v24;
  const void *v25;
  uint64_t (*v26)(const void *, const __CFDictionary *);
  const void *Empty;
  const void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  CFTypeID v33;
  unsigned int v35;

  if (CFEqual(cf1, CFSTR("updateFeedback")))
  {
    if (!a1 || !a6)
      return 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v12 = Mutable;
      v13 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (v13)
      {
        v14 = v13;
        CFDictionarySetValue(v12, CFSTR("streams"), v13);
        *a6 = v12;
        CFRelease(v14);
        return 0;
      }
      APSLogErrorAt();
      CFRelease(v12);
    }
    else
    {
      APSLogErrorAt();
    }
    v35 = -6728;
    goto LABEL_35;
  }
  if (CFEqual(cf1, CFSTR("didReceiveData")))
  {
    CFNumberGetTypeID();
    TypedValue = (const void *)CFDictionaryGetTypedValue();
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 712), TypedValue))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a5, CFSTR("params"));
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, Value);
      if (*(_QWORD *)(a1 + 600))
      {
        v19 = MutableCopy;
        CFDictionarySetValue(MutableCopy, CFSTR("X-Apple-StreamID"), TypedValue);
        v20 = *(_QWORD *)(a1 + 600);
        v21 = *(uint64_t (**)(uint64_t, __CFDictionary *, __CFDictionary **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 64);
        if (v21)
          v22 = v21(v20, v19, a6);
        else
          v22 = -12782;
        v35 = v22;
        if (v19)
        {
          CFRelease(v19);
          v22 = v35;
        }
        if (!v22)
          return 0;
        goto LABEL_35;
      }
      APSLogErrorAt();
      return -6735;
    }
    v24 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 672), TypedValue);
    if (v24)
    {
      v25 = v24;
      v26 = *(uint64_t (**)(const void *, const __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 16);
      if (v26)
      {
        v35 = v26(v25, a5);
        if (!v35)
          return 0;
      }
      else
      {
        v35 = -12782;
      }
      goto LABEL_35;
    }
LABEL_87:
    APSLogErrorAt();
    return -6709;
  }
  if (CFEqual(cf1, CFSTR("reportIssue")))
  {
    if (a5)
    {
      CFStringGetTypeID();
      v23 = (const void *)CFDictionaryGetTypedValue();
      if (CFEqual(v23, (CFTypeRef)*MEMORY[0x24BE038A0]))
      {
        CFNumberGetTypeID();
        CFDictionaryGetTypedValue();
        CFNumberGetTypeID();
        CFDictionaryGetTypedValue();
        if (*(_DWORD *)(a1 + 192) == 128)
        {
          if (APSSettingsGetIntWithDefault())
            APTNANDataSessionIssueReportCreate();
        }
      }
      return 0;
    }
    APSLogErrorAt();
    v35 = -6705;
    goto LABEL_35;
  }
  if (CFEqual(cf1, CFSTR("nanWifiStats")))
  {
    if (*(_DWORD *)(a1 + 192) != 128)
    {
      if (a6)
      {
        Empty = (const void *)CFDictionaryGetEmpty();
        *a6 = (__CFDictionary *)CFRetain(Empty);
      }
      return 0;
    }
    v35 = APAdvertiserCopyNANWifiStats(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 40), a6);
    if (!v35)
      return 0;
LABEL_35:
    APSLogErrorAt();
    return v35;
  }
  if (CFEqual(cf1, CFSTR("sessionDied")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _AirPlayReceiverSession_Terminate(a1);
    return 0;
  }
  if (CFEqual(cf1, CFSTR("volumeChanged")))
  {
    v28 = CFDictionaryGetValue(a5, CFSTR("volumeLinear"));
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v28)
    {
      v35 = _ProcessSWVolumeChanged(a1, (uint64_t)v28);
      if (!v35)
        return 0;
      goto LABEL_35;
    }
    goto LABEL_87;
  }
  if (CFEqual(cf1, CFSTR("audioInterruptionBegan")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (FigCFEqual())
    {
      v29 = a1;
      v30 = 1;
LABEL_78:
      _ForwardAudioInterruptionCommandsToReceiverAudioSessions(v29, v30, 0);
      return 0;
    }
    if (!FigCFEqual())
    {
      v35 = -6735;
      goto LABEL_35;
    }
    v31 = a1;
    v32 = 1;
    goto LABEL_81;
  }
  if (CFEqual(cf1, CFSTR("audioInterruptionEnded")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (FigCFEqual())
    {
      v29 = a1;
      v30 = 0;
      goto LABEL_78;
    }
    if (!FigCFEqual())
    {
      v35 = -6735;
      goto LABEL_35;
    }
    v31 = a1;
    v32 = 0;
LABEL_81:
    _HandleMediaAudioInterruption(v31, v32);
    return 0;
  }
  if (CFEqual(cf1, CFSTR("otherProcessStartedPlaying")))
  {
    _HandleOtherProcessStartedPlaying(a1);
    return 0;
  }
  if (CFEqual(cf1, CFSTR("partnerProcessDeath")))
  {
    if (a4)
    {
      v33 = CFGetTypeID(a4);
      if (v33 == CFStringGetTypeID())
      {
        _HandlePartnerProcessDeath(a1, a4);
        return 0;
      }
    }
    APSLogErrorAt();
    return -6705;
  }
  if (CFEqual(cf1, CFSTR("handleMediaAudioResumedForSession")))
  {
    _HandleMediaAudioResumedForSession(a1, a4);
    return 0;
  }
  if (CFEqual(cf1, CFSTR("fadeAudio")))
  {
    _HandleFadeAudioCommand(a1);
    return 0;
  }
  if (CFEqual(cf1, CFSTR("performPWDKeyExchange")))
  {
    v35 = _HandlePerformPWDKeyExchangeCommand(a1, (uint64_t)a5, a6);
    if (!v35)
      return 0;
    goto LABEL_35;
  }
  if (*(_BYTE *)(a1 + 659))
  {
    APSLogErrorAt();
    v35 = 0;
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    return AirPlayReceiverSessionPlatformControl((_QWORD *)a1, cf1);
  }
  return v35;
}

uint64_t _ProcessSWVolumeChanged(uint64_t a1, uint64_t a2)
{
  uint64_t Count;
  const __CFDictionary *v5;
  uint64_t v6;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v9;
  CFArrayRef theArray;

  theArray = 0;
  Count = FigCFDictionaryGetCount();
  v5 = *(const __CFDictionary **)(a1 + 568);
  if (!v5)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v6 = _cfDictionaryCopyKeysAndValues(v5, 0, (CFTypeRef *)&theArray);
  if (!(_DWORD)v6)
  {
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        APReceiverAudioSessionSetProperty((uint64_t)ValueAtIndex, CFSTR("VolumeLinear"), a2);
      }
    }
    goto LABEL_10;
  }
  v9 = v6;
  APSLogErrorAt();
LABEL_11:
  if (theArray)
    CFRelease(theArray);
  return v9;
}

void _ForwardAudioInterruptionCommandsToReceiverAudioSessions(uint64_t a1, int a2, int a3)
{
  const __CFString *v3;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  _QWORD *ValueAtIndex;

  if (a2)
    v3 = CFSTR("RASP::HandleAudioInterruptionBegan");
  else
    v3 = CFSTR("RASP::HandleAudioInterruptionEnded");
  if (!*(_BYTE *)(a1 + 659))
  {
    v5 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
    if (v5)
    {
      v6 = v5;
      Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
          if ((CFObjectGetPropertyInt64Sync() != 0) == a3)
          {
            if (gLogCategory_AirPlayReceiverCore <= 50
              && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            APReceiverAudioSessionPlatformControl(ValueAtIndex, v3);
          }
        }
      }
      CFRelease(v6);
    }
  }
}

void _HandleMediaAudioInterruption(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*(_BYTE *)(a1 + 659))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 251))
      {
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        _ForwardAudioInterruptionCommandsToReceiverAudioSessions(a1, 1, 1);
        *(_BYTE *)(a1 + 729) = 1;
      }
      else if (*(_BYTE *)(a1 + 660))
      {
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (*(_QWORD *)(a1 + 576))
        {
          AirPlayReceiverSessionSendMediaRemoteCommand((_QWORD *)a1, -1, 1885435251, 0);
          if (gLogCategory_AirPlayReceiverCore <= 50
            && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          *(_BYTE *)(a1 + 729) = 1;
        }
      }
      else
      {
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        _AirPlayReceiverSession_Terminate(a1);
        *(_BYTE *)(a1 + 728) = 1;
      }
    }
    return;
  }
  if (*(_BYTE *)(a1 + 659))
    return;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 251))
  {
    _ForwardAudioInterruptionCommandsToReceiverAudioSessions(a1, 0, 1);
    if (gLogCategory_AirPlayReceiverCore > 50
      || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_53;
    }
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 660))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_BYTE *)(a1 + 729))
    {
      if (CFDictionaryGetInt64())
      {
        AirPlayReceiverSessionSendMediaRemoteCommand((_QWORD *)a1, -1, 1886151033, 0);
        if (gLogCategory_AirPlayReceiverCore > 50
          || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_53;
        }
      }
      else if (gLogCategory_AirPlayReceiverCore > 50
             || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_53;
      }
LABEL_11:
      LogPrintF();
LABEL_53:
      *(_BYTE *)(a1 + 729) = 0;
    }
  }
  else if (gLogCategory_AirPlayReceiverCore <= 50
         && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t _HandleOtherProcessStartedPlaying(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 659))
  {
    v1 = result;
    if (!*(_BYTE *)(result + 660))
    {
      if (gLogCategory_AirPlayReceiverCore <= 50
        && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return _AirPlayReceiverSession_Terminate(v1);
    }
  }
  return result;
}

uint64_t _HandlePartnerProcessDeath(uint64_t result, const __CFString *cf1)
{
  uint64_t v2;

  v2 = result;
  if (cf1 == CFSTR("MediaServices"))
    goto LABEL_22;
  if (!cf1)
    return result;
  result = CFEqual(cf1, CFSTR("MediaServices"));
  if ((_DWORD)result)
  {
LABEL_22:
    if (*(_BYTE *)(v2 + 659))
      return result;
    if (gLogCategory_AirPlayReceiverCore <= 60
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(v2 + 729) = 0;
    return _AirPlayReceiverSession_Terminate(v2);
  }
  if (cf1 == CFSTR("MediaRemoteServices") || (result = CFEqual(cf1, CFSTR("MediaRemoteServices")), (_DWORD)result))
  {
    if (*(_BYTE *)(v2 + 659))
    {
      if (gLogCategory_AirPlayReceiverCore <= 60
        && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return _AirPlayReceiverSession_Terminate(v2);
    }
  }
  return result;
}

uint64_t _HandleMediaAudioResumedForSession(uint64_t a1, __CFString *a2)
{
  uint64_t result;

  result = APSIsAPMSpeaker();
  if ((_DWORD)result && *(_BYTE *)(a1 + 657))
  {
    if (gLogCategory_AirPlayReceiverCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverCore != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    if (a2 != CFSTR("com.apple.TVAirPlay"))
    {
      if (!a2 || (result = CFEqual(a2, CFSTR("com.apple.TVAirPlay")), !(_DWORD)result))
      {
        if (*(_QWORD *)(a1 + 32))
        {
          if (gLogCategory_AirPlayReceiverCore <= 50
            && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          return APReceiverRequestProcessorHijackAndBecomeMainSession(*(const void **)(a1 + 32));
        }
      }
    }
  }
  return result;
}

uint64_t _HandleFadeAudioCommand(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  Float64 v4;
  uint64_t v5;
  CMTime v6;

  v1 = result;
  if (*(_QWORD *)(result + 576))
  {
    if (CFDictionaryGetInt64() == 1)
      v2 = 2;
    else
      v2 = 1;
    CFDictionaryGetDouble();
    v4 = v3;
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = *(_QWORD *)(v1 + 576);
    CMTimeMakeWithSeconds(&v6, v4, 1000);
    return APReceiverAudioSessionApplyVolumeFade(v5, v2, &v6);
  }
  else if (gLogCategory_AirPlayReceiverCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverCore != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t _HandlePerformPWDKeyExchangeCommand(uint64_t a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t TypedValue;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, CFTypeRef *, char *);
  int v10;
  __CFDictionary *Mutable;
  const void **v12;
  const void *v13;
  int v15;
  char v16;
  CFTypeRef v17;
  CFDictionaryRef theDict;
  CFTypeRef cf;
  unsigned int v20;

  v20 = 0;
  theDict = 0;
  cf = 0;
  v17 = 0;
  v16 = 0;
  if (!APSSettingsIsFeatureEnabled())
  {
    APSLogErrorAt();
    Mutable = 0;
    v15 = -6735;
    goto LABEL_56;
  }
  CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue();
  v6 = gLogCategory_AirPlayReceiverCore;
  if (gLogCategory_AirPlayReceiverCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverCore != -1)
    {
LABEL_4:
      if (v6 == -1)
        _LogCategory_Initialize();
      LogPrintF();
      goto LABEL_10;
    }
    if (_LogCategory_Initialize())
    {
      v6 = gLogCategory_AirPlayReceiverCore;
      goto LABEL_4;
    }
  }
LABEL_10:
  if (*(_QWORD *)(a1 + 640))
    goto LABEL_23;
  v20 = CFArrayEnsureCreatedAndAppend();
  if (v20)
    goto LABEL_30;
  v20 = APReceiverSystemInfoCopyInfoDict(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 160), (uint64_t)cf, *MEMORY[0x24BDBD240], (uint64_t)&theDict);
  if (v20)
    goto LABEL_30;
  if (CFDictionaryGetValue(theDict, CFSTR("displayCapabilities")))
  {
    CFDictionaryGetInt64();
    CFDictionaryGetInt64Ranged();
    v20 = FigPWDKeyExchangeReceiverCreate();
    if (v20)
      goto LABEL_30;
    v7 = gLogCategory_AirPlayReceiverCore;
    if (gLogCategory_AirPlayReceiverCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverCore == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_23;
        v7 = gLogCategory_AirPlayReceiverCore;
      }
      if (v7 == -1)
        _LogCategory_Initialize();
      LogPrintF();
    }
LABEL_23:
    v8 = *(_QWORD *)(a1 + 640);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 24);
    if (v9)
    {
      v20 = v9(v8, TypedValue, &v17, &v16);
      if (!v20)
      {
        v10 = gLogCategory_AirPlayReceiverCore;
        if (gLogCategory_AirPlayReceiverCore <= 50)
        {
          if (gLogCategory_AirPlayReceiverCore != -1)
          {
LABEL_27:
            if (v10 == -1)
              _LogCategory_Initialize();
            LogPrintF();
            goto LABEL_35;
          }
          if (_LogCategory_Initialize())
          {
            v10 = gLogCategory_AirPlayReceiverCore;
            goto LABEL_27;
          }
        }
LABEL_35:
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        FigCFDictionarySetValue();
        v12 = (const void **)MEMORY[0x24BDBD270];
        if (!v16)
          v12 = (const void **)MEMORY[0x24BDBD268];
        CFDictionarySetValue(Mutable, CFSTR("complete"), *v12);
        if (!a3)
        {
LABEL_40:
          if (!v20)
            goto LABEL_43;
          goto LABEL_41;
        }
        *a3 = Mutable;
LABEL_39:
        Mutable = 0;
        goto LABEL_40;
      }
    }
    else
    {
      v20 = -12782;
    }
LABEL_30:
    APSLogErrorAt();
    goto LABEL_39;
  }
  APSLogErrorAt();
  Mutable = 0;
  v15 = -6709;
LABEL_56:
  v20 = v15;
LABEL_41:
  v13 = *(const void **)(a1 + 640);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 640) = 0;
  }
LABEL_43:
  if (cf)
    CFRelease(cf);
  if (theDict)
    CFRelease(theDict);
  if (v17)
    CFRelease(v17);
  if (Mutable)
    CFRelease(Mutable);
  return v20;
}

uint64_t AirPlayReceiverSessionSendMediaRemoteCommand(_QWORD *a1, uint64_t a2, int a3, const void *a4)
{
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  NSObject *v10;
  uint64_t v12;
  _QWORD block[7];
  int v14;
  void *v15;
  void *v16;

  v15 = 0;
  v16 = 0;
  if (a2 < 0 && !a3)
  {
    APSLogErrorAt();
    v12 = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v9 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("sendMediaRemoteCommand"));
      if (a2 < 0 && !a3)
      {
        if (a4)
          CFDictionarySetValue(v9, CFSTR("params"), a4);
        CFRetain(a1);
        CFRetain(v9);
        v10 = a1[2];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = __AirPlayReceiverSessionSendMediaRemoteCommand_block_invoke;
        block[3] = &__block_descriptor_tmp_199;
        v14 = a3;
        block[4] = a1;
        block[5] = a2;
        block[6] = v9;
        dispatch_async(v10, block);
        v12 = 0;
      }
      else
      {
        ASPrintF();
        APSLogErrorAt();
        v12 = 4294960568;
      }
      CFRelease(v9);
      if (v16)
      {
        free(v16);
        v16 = 0;
      }
    }
    else
    {
      APSLogErrorAt();
      v12 = 4294960568;
    }
  }
  if (v15)
    free(v15);
  return v12;
}

void *AirPlayReceiverSessionCopyProperty(uint64_t a1, int a2, CFTypeRef cf1, uint64_t a4, _DWORD *a5)
{
  uint64_t v8;
  const __CFAllocator *v9;
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD, CFArrayRef *);
  const void *v13;
  CFMutableDictionaryRef v14;
  CFIndex v15;
  _QWORD *v16;
  uint64_t (*v17)(_QWORD, CFArrayRef *);
  const void *v18;
  void *v19;
  uint64_t Count;
  __CFDictionary *Mutable;
  uint64_t v22;
  uint64_t (*v23)(_QWORD, __CFDictionary *);
  int v24;
  int v25;
  const __CFAllocator *v26;
  __CFDictionary *v27;
  CFIndex v28;
  const CFDictionaryKeyCallBacks *v29;
  const CFDictionaryValueCallBacks *v30;
  CFMutableDictionaryRef v31;
  _QWORD *ValueAtIndex;
  uint64_t (*v33)(_QWORD, CFMutableDictionaryRef);
  int v34;
  const void *v35;
  int v36;
  int v37;
  const void **v38;
  const void *v39;
  int v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  const __CFNumber *v46;
  int v47;
  uint64_t v48;
  int v49;
  CFArrayRef theArray;
  CFArrayRef v51;
  int v52;
  CFArrayRef v53;
  CFArrayRef v54;

  v52 = 0;
  theArray = 0;
  v51 = 0;
  if (*(_BYTE *)(a1 + 441))
  {
    v19 = 0;
    v10 = 0;
    v14 = 0;
    v13 = 0;
    v49 = -6709;
LABEL_111:
    v52 = v49;
    goto LABEL_65;
  }
  if (!CFEqual(cf1, CFSTR("audioBufferInfo")))
  {
    if (CFEqual(cf1, CFSTR("metrics")))
    {
      Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 568));
      v53 = 0;
      v54 = 0;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!Mutable)
      {
        APSLogErrorAt();
        v19 = 0;
        v27 = 0;
        goto LABEL_116;
      }
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      mach_absolute_time();
      UpTicksToSeconds();
      CFDictionarySetInt64();
      v22 = *(_QWORD *)(a1 + 576);
      if (v22)
      {
        v23 = *(uint64_t (**)(_QWORD, __CFDictionary *))(v22 + 160);
        if (!v23)
        {
          v36 = -12782;
          goto LABEL_49;
        }
        v24 = v23(*(_QWORD *)(v22 + 40), Mutable);
        if (v24)
        {
          v36 = v24;
          goto LABEL_49;
        }
      }
      v25 = _cfDictionaryCopyKeysAndValues(*(const __CFDictionary **)(a1 + 568), (CFTypeRef *)&v54, (CFTypeRef *)&v53);
      if (!v25)
      {
        v26 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v27 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v27)
        {
          if (Count >= 1)
          {
            v28 = 0;
            v29 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
            v30 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
            while (1)
            {
              v31 = CFDictionaryCreateMutable(v26, 0, v29, v30);
              if (!v31)
                break;
              ValueAtIndex = CFArrayGetValueAtIndex(v53, v28);
              if (!ValueAtIndex)
              {
                v36 = -72152;
                APSLogErrorAt();
                goto LABEL_47;
              }
              v33 = (uint64_t (*)(_QWORD, CFMutableDictionaryRef))ValueAtIndex[20];
              if (!v33)
              {
                v36 = -12782;
LABEL_47:
                APSLogErrorAt();
                v19 = 0;
                goto LABEL_50;
              }
              v34 = v33(ValueAtIndex[5], v31);
              if (v34)
              {
                v36 = v34;
                goto LABEL_47;
              }
              v35 = CFArrayGetValueAtIndex(v54, v28);
              CFDictionarySetValue(v27, v35, v31);
              CFRelease(v31);
              if (Count == ++v28)
                goto LABEL_36;
            }
            APSLogErrorAt();
            v19 = 0;
            goto LABEL_102;
          }
LABEL_36:
          CFDictionarySetValue(Mutable, CFSTR("smet"), v27);
          v36 = 0;
          v31 = 0;
          v19 = Mutable;
          Mutable = 0;
LABEL_50:
          if (v54)
            CFRelease(v54);
          if (v53)
            CFRelease(v53);
          if (v31)
            CFRelease(v31);
          if (v27)
            CFRelease(v27);
          if (Mutable)
            CFRelease(Mutable);
          v10 = 0;
          v14 = 0;
          v13 = 0;
          v52 = v36;
          goto LABEL_65;
        }
        APSLogErrorAt();
        v19 = 0;
LABEL_116:
        v31 = 0;
LABEL_102:
        v36 = -6728;
        goto LABEL_50;
      }
      v36 = v25;
LABEL_49:
      APSLogErrorAt();
      v19 = 0;
      v27 = 0;
      v31 = 0;
      goto LABEL_50;
    }
    if (CFEqual(cf1, CFSTR("hasActiveMediaAudioSession")))
    {
      if (*(_BYTE *)(a1 + 458) && *(_QWORD *)(a1 + 576))
        v38 = (const void **)MEMORY[0x24BDBD270];
      else
        v38 = (const void **)MEMORY[0x24BDBD268];
LABEL_62:
      v39 = *v38;
LABEL_63:
      v19 = (void *)CFRetain(v39);
LABEL_64:
      v10 = 0;
      v14 = 0;
      v13 = 0;
      v52 = 0;
      goto LABEL_65;
    }
    if (CFEqual(cf1, CFSTR("mediaAudioSession")))
    {
      if (*(_BYTE *)(a1 + 458))
      {
        v39 = *(const void **)(a1 + 576);
        if (v39)
          goto LABEL_63;
      }
      goto LABEL_81;
    }
    if (CFEqual(cf1, CFSTR("isRemoteControlOnly")))
    {
      v38 = (const void **)MEMORY[0x24BDBD270];
      if (!*(_BYTE *)(a1 + 659))
        v38 = (const void **)MEMORY[0x24BDBD268];
      goto LABEL_62;
    }
    if (CFEqual(cf1, CFSTR("isPlayingBufferedAudio")))
    {
      if (*(_QWORD *)(a1 + 576) && CFObjectGetPropertyInt64Sync() == 103)
        v43 = APReceiverAudioSessionCopyProperty(*(const __CFNumber **)(a1 + 576), v41, CFSTR("IsPlayingBufferedAudio"), v42, &v52);
      else
        v43 = (void *)CFRetain((CFTypeRef)*MEMORY[0x24BDBD268]);
    }
    else
    {
      if (CFEqual(cf1, CFSTR("platformAudioLatency")))
      {
        v46 = *(const __CFNumber **)(a1 + 576);
        if (!v46)
        {
          APSLogErrorAt();
          v19 = 0;
          v10 = 0;
          v14 = 0;
          v13 = 0;
          v49 = -6718;
          goto LABEL_111;
        }
        v19 = APReceiverAudioSessionCopyProperty(v46, v44, CFSTR("PlatformAudioLatency"), v45, &v52);
        if (v52)
          APSLogErrorAt();
        goto LABEL_95;
      }
      if (CFEqual(cf1, CFSTR("MRInfo")))
      {
        v39 = *(const void **)(a1 + 736);
        if (v39)
          goto LABEL_63;
LABEL_81:
        v19 = 0;
        goto LABEL_64;
      }
      if (*(_BYTE *)(a1 + 659))
      {
        APSLogErrorAt();
        v52 = 0;
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v19 = 0;
        goto LABEL_95;
      }
      v43 = AirPlayReceiverSessionPlatformCopyProperty(a1, v47, cf1, v48, &v52);
    }
    v19 = v43;
LABEL_95:
    v10 = 0;
LABEL_96:
    v14 = 0;
    goto LABEL_21;
  }
  v8 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 568));
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v10)
  {
    APSLogErrorAt();
    v19 = 0;
    v14 = 0;
LABEL_110:
    v13 = 0;
    v49 = -6728;
    goto LABEL_111;
  }
  v11 = *(_QWORD *)(a1 + 576);
  if (v11)
  {
    LODWORD(v54) = 0;
    v12 = *(uint64_t (**)(_QWORD, CFArrayRef *))(v11 + 176);
    if (v12)
    {
      v13 = (const void *)v12(*(_QWORD *)(v11 + 40), &v54);
      v52 = (int)v54;
      if (!(_DWORD)v54)
      {
        v52 = CFDictionaryMergeDictionary();
        if (!v52)
        {
          if (v13)
            CFRelease(v13);
          goto LABEL_10;
        }
      }
    }
    else
    {
      v13 = 0;
      v52 = -12782;
    }
    APSLogErrorAt();
    v19 = 0;
    v14 = 0;
    goto LABEL_65;
  }
LABEL_10:
  v52 = _cfDictionaryCopyKeysAndValues(*(const __CFDictionary **)(a1 + 568), (CFTypeRef *)&v51, (CFTypeRef *)&theArray);
  if (v52)
  {
    APSLogErrorAt();
    v19 = 0;
    goto LABEL_96;
  }
  v14 = CFDictionaryCreateMutable(v9, v8, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v14)
  {
    APSLogErrorAt();
    v19 = 0;
    goto LABEL_110;
  }
  if (v8 < 1)
  {
LABEL_20:
    CFDictionarySetValue(v10, CFSTR("streams"), v14);
    v19 = (void *)CFRetain(v10);
LABEL_21:
    v13 = 0;
    goto LABEL_65;
  }
  v15 = 0;
  while (1)
  {
    v16 = CFArrayGetValueAtIndex(theArray, v15);
    LODWORD(v54) = 0;
    if (!v16)
      break;
    v17 = (uint64_t (*)(_QWORD, CFArrayRef *))v16[22];
    if (!v17)
    {
      v37 = -12782;
      goto LABEL_38;
    }
    v13 = (const void *)v17(v16[5], &v54);
    v52 = (int)v54;
    if ((_DWORD)v54)
      goto LABEL_39;
    v18 = CFArrayGetValueAtIndex(v51, v15);
    CFDictionarySetValue(v14, v18, v13);
    if (v13)
      CFRelease(v13);
    if (v8 == ++v15)
      goto LABEL_20;
  }
  v37 = -72152;
  APSLogErrorAt();
LABEL_38:
  v13 = 0;
  v52 = v37;
LABEL_39:
  APSLogErrorAt();
  v19 = 0;
LABEL_65:
  if (v51)
    CFRelease(v51);
  if (theArray)
    CFRelease(theArray);
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
  if (v10)
    CFRelease(v10);
  if (a5)
    *a5 = v52;
  return v19;
}

uint64_t AirPlayReceiverSessionSetRateAndAnchorTime(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, __int128 *a5)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _OWORD *, _OWORD *, __int128 *);
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[2];
  _OWORD v13[2];

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  v5 = *(_QWORD *)(a1 + 576);
  if (!v5)
  {
    APSLogErrorAt();
    return 4294960578;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _OWORD *, __int128 *))(v5 + 112);
  if (!v6)
  {
    v8 = 4294954514;
LABEL_7:
    APSLogErrorAt();
    return v8;
  }
  v7 = *(_QWORD *)(v5 + 40);
  v13[0] = *a3;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)a3 + 12);
  v12[0] = *a4;
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)a4 + 12);
  v10 = *a5;
  v11 = *((_QWORD *)a5 + 2);
  v8 = v6(v7, a2, v13, v12, &v10);
  if ((_DWORD)v8)
    goto LABEL_7;
  return v8;
}

uint64_t AirPlayReceiverSessionSetProperty(uint64_t a1, int a2, CFTypeRef cf1, __CFString *a4, const void *a5)
{
  uint64_t v9;
  CFTypeID v10;
  int v11;
  const void *v12;
  CFTypeID v13;
  int v14;
  uint64_t v15;
  CFTypeID v18;
  uint64_t Int64Ranged;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *);
  CFTypeID v24;
  uint64_t v25;
  int v26;
  CFTypeID v27;
  int v28;
  CFTypeID v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;

  v33 = 0;
  if (!a1)
  {
    APSLogErrorAt();
    return 0;
  }
  if (*(_BYTE *)(a1 + 659))
  {
    APSLogErrorAt();
    v9 = 0;
    if (gLogCategory_AirPlayReceiverCore > 50)
      return v9;
    if (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize())
      LogPrintF();
    return 0;
  }
  if (CFEqual(cf1, CFSTR("metaData")))
  {
    if (a5)
    {
      v10 = CFGetTypeID(a5);
      if (v10 == CFDictionaryGetTypeID())
      {
        v9 = AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v11, CFSTR("metaData"), 0, (const __CFArray *)a5);
        if ((_DWORD)v9)
LABEL_24:
          APSLogErrorAt();
        return v9;
      }
    }
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("mrNowPlayingInfo")))
  {
    if (a5)
    {
      v13 = CFGetTypeID(a5);
      if (v13 == CFDictionaryGetTypeID())
      {
        v15 = *(_QWORD *)(a1 + 576);
        if (v15)
          APReceiverAudioSessionSetProperty(v15, CFSTR("RTCMetadata"), (uint64_t)a5);
        v9 = AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v14, CFSTR("mrNowPlayingInfo"), a4, (const __CFArray *)a5);
        if (!(_DWORD)v9)
          return v9;
        goto LABEL_24;
      }
    }
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("MRInfo")))
  {
    v12 = *(const void **)(a1 + 736);
    if (a5)
      CFRetain(a5);
    *(_QWORD *)(a1 + 736) = a5;
    if (v12)
      CFRelease(v12);
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    notify_post("com.apple.airplay.mrInfoDidChange");
    return 0;
  }
  if (CFEqual(cf1, CFSTR("progress")))
  {
    v31 = 0;
    v32 = 0;
    if (a5 && (v18 = CFGetTypeID(a5), v18 == CFDictionaryGetTypeID()))
    {
      if (*(_QWORD *)(a1 + 576))
      {
        Int64Ranged = CFDictionaryGetInt64Ranged();
        v20 = CFDictionaryGetInt64Ranged();
        v21 = CFDictionaryGetInt64Ranged();
        v22 = *(_QWORD *)(a1 + 576);
        if (v22 && !*(_BYTE *)(a1 + 440))
        {
          v23 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *))(v22 + 120);
          if (!v23)
          {
            v33 = -12782;
LABEL_59:
            APSLogErrorAt();
            return v33;
          }
          v33 = v23(*(_QWORD *)(v22 + 40), Int64Ranged, v20, v21, &v32, &v31);
          if (v33)
            goto LABEL_59;
          v33 = CFObjectSetPropertyF();
          if (v33)
            goto LABEL_59;
        }
        return 0;
      }
      APSLogErrorAt();
      return -6718;
    }
    else
    {
      APSLogErrorAt();
      return -6756;
    }
  }
  if (CFEqual(cf1, CFSTR("timelineOffset")))
  {
    if (a5)
    {
      v24 = CFGetTypeID(a5);
      if (v24 == CFNumberGetTypeID())
      {
        v25 = *(_QWORD *)(a1 + 576);
        if (!v25)
        {
          APSLogErrorAt();
          return 4294960578;
        }
        v9 = APReceiverAudioSessionSetProperty(v25, CFSTR("timelineOffset"), (uint64_t)a5);
        if ((_DWORD)v9)
          goto LABEL_24;
        return v9;
      }
    }
LABEL_8:
    APSLogErrorAt();
    return 4294960540;
  }
  if (CFEqual(cf1, CFSTR("mrSupportedCommandsFromSender")))
  {
    if (a5)
    {
      v27 = CFGetTypeID(a5);
      if (v27 == CFArrayGetTypeID())
      {
        v9 = AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v28, CFSTR("mrSupportedCommandsFromSender"), 0, (const __CFArray *)a5);
        if (!(_DWORD)v9)
          return v9;
        goto LABEL_24;
      }
    }
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("mrPlaybackState")))
  {
    if (a5)
    {
      v29 = CFGetTypeID(a5);
      if (v29 == CFNumberGetTypeID())
      {
        v9 = AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v30, CFSTR("mrPlaybackState"), 0, (const __CFArray *)a5);
        if (!(_DWORD)v9)
          return v9;
        goto LABEL_24;
      }
    }
    goto LABEL_8;
  }
  return AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v26, cf1, a4, (const __CFArray *)a5);
}

uint64_t AirPlayReceiverSessionSetSecurityInfo(uint64_t a1, __CFDictionary *a2, CFTypeRef cf, uint64_t a4, uint64_t a5, _OWORD *a6, _OWORD *a7)
{
  CFTypeRef v10;
  const void *v13;
  unsigned int (*v14)(CFTypeRef);
  unsigned int v16;
  uint64_t v17;
  int Int64;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;

  v10 = cf;
  v22 = *MEMORY[0x24BDAC8D0];
  v13 = *(const void **)(a1 + 488);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 488) = v10;
  if (v13)
  {
    CFRelease(v13);
    v10 = *(CFTypeRef *)(a1 + 488);
  }
  if (v10)
  {
    v14 = *(unsigned int (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v14)
    {
      if (v14(v10))
        return 0;
    }
  }
  if (a6 && a7)
  {
    v16 = _SetSecurityInfoAES(a1, a6, a7);
    v17 = 0;
    v20 = v16;
    do
      *((_BYTE *)a6 + v17++) = 0;
    while (v17 != 8);
    if (v16)
    {
      APSLogErrorAt();
      return 4294960534;
    }
    goto LABEL_26;
  }
  Int64 = CFDictionaryGetInt64();
  if (Int64 == 1)
  {
    v20 = 0;
LABEL_26:
    CFDictionaryRemoveValue(a2, CFSTR("ekey"));
    CFDictionaryRemoveValue(a2, CFSTR("eiv"));
    return v20;
  }
  CFDictionaryGetData();
  if (Int64 == 32 || Int64 == 8)
  {
    v21 = 0;
    if (a4)
    {
      OowSGu();
      if (v19)
        IPaI1oem5iL();
      else
        jEHf8Xzsv8K(v21);
      APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
    }
  }
  else if (gLogCategory_AirPlayReceiverCore <= 60
         && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APSLogErrorAt();
  return 4294960542;
}

uint64_t _SetSecurityInfoAES(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a1 + 360;
  AES_CBCFrame_Final();
  *(_QWORD *)(a1 + 384) = 0;
  v7 = AES_CBCFrame_Init();
  if ((_DWORD)v7)
  {
    APSLogErrorAt();
  }
  else
  {
    *(_QWORD *)(a1 + 384) = v6;
    *(_OWORD *)(a1 + 392) = *a2;
    *(_OWORD *)(a1 + 408) = *a3;
  }
  return v7;
}

uint64_t AirPlayReceiverSessionSendCommand(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  return AirPlayReceiverSessionSendCommandForObject(a1, 0, a2, a3, a4);
}

uint64_t AirPlayReceiverSessionSendCommand_b(uint64_t a1, const void *a2, void *aBlock)
{
  void *v5;
  const void *v6;
  uint64_t v7;

  if (!aBlock)
  {
    v7 = AirPlayReceiverSessionSendCommandForObject(a1, 0, a2, 0, 0);
    if (!(_DWORD)v7)
      return v7;
    goto LABEL_5;
  }
  v5 = _Block_copy(aBlock);
  if (!v5)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  v6 = v5;
  v7 = AirPlayReceiverSessionSendCommandForObject(a1, 0, a2, (uint64_t)_AirPlayReceiverSessionSendCommandCompletion_b, (uint64_t)v5);
  if ((_DWORD)v7)
  {
    _Block_release(v6);
LABEL_5:
    APSLogErrorAt();
  }
  return v7;
}

void _AirPlayReceiverSessionSendCommandCompletion_b(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  a3[2](a3, a1, a2);
  _Block_release(a3);
}

uint64_t AirPlayReceiverSessionSetup(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3)
{
  int v5;
  _DWORD *v6;
  int v7;
  const __CFArray *v8;
  int v9;
  const __CFAllocator *v10;
  CFStringRef v11;
  CFStringRef v12;
  int v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  int v16;
  int Int64;
  int v18;
  int v19;
  int updated;
  const void *v21;
  const void *v22;
  int v23;
  CFStringRef v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, const __CFString *, uint64_t);
  uint64_t v40;
  const void *v41;
  const void *v42;
  const void *v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  const void *v51;
  const void *v52;
  const void *v53;
  const void *v54;
  const void *v55;
  const __CFArray *TypedValue;
  CFIndex v57;
  CFIndex v58;
  uint64_t v59;
  const __CFDictionary *TypedValueAtIndex;
  int v61;
  int v62;
  const void *v63;
  uint64_t v64;
  const void *v65;
  const void *v66;
  const void *v67;
  int v68;
  CFMutableDictionaryRef v69;
  CFMutableDictionaryRef v70;
  const void *v71;
  CFTypeID v72;
  const void *v73;
  CFMutableDictionaryRef v74;
  int v75;
  int v76;
  int v77;
  int v78;
  void *v79;
  CFMutableDictionaryRef v80;
  __CFDictionary *v81;
  const void *v82;
  int v83;
  int AirPlay;
  int v85;
  int v86;
  uint64_t DerivedStorage;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, const __CFString *, uint64_t);
  CFMutableDictionaryRef v91;
  __CFDictionary *v92;
  const void *v93;
  const void *v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, void (*)(int, CFTypeRef, uint64_t, _QWORD *), uint64_t);
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int (*v103)(uint64_t);
  int DataStreamSecurityKeys;
  CFTypeRef v105;
  uint64_t (*v106)(CFTypeRef, char *, uint64_t);
  int v107;
  CFTypeRef v108;
  uint64_t (*v109)(CFTypeRef, UInt8 *, _BYTE *);
  uint64_t k;
  uint64_t m;
  CFTypeRef v112;
  uint64_t (*v113)(CFTypeRef, const __CFString *, _QWORD, void **);
  int v114;
  int v115;
  int v116;
  const void *v117;
  int v118;
  uint64_t v119;
  int v120;
  const void *v121;
  const void *v122;
  uint64_t v123;
  void (*v124)(uint64_t, const __CFString *, const void *);
  const void *v125;
  const void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const __CFString *, const void *);
  __CFDictionary *v129;
  const void *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, void (*)(_QWORD *, const void *, const void *), uint64_t (*)(uint64_t, uint64_t, CFMutableDictionaryRef *), uint64_t, __CFDictionary *);
  int v133;
  CFMutableDictionaryRef v134;
  __CFDictionary *v135;
  unsigned int v136;
  uint64_t j;
  int v138;
  uint64_t v139;
  CFDataRef v140;
  int v141;
  _QWORD *v142;
  CFTypeRef v143;
  const void *v144;
  _QWORD *v145;
  _QWORD *v146;
  uint64_t v147;
  CFMutableDictionaryRef v148;
  int v149;
  _QWORD *v150;
  uint64_t v151;
  dispatch_queue_t v152;
  dispatch_queue_t v153;
  uint64_t v154;
  int v155;
  uint64_t v156;
  dispatch_queue_t v157;
  dispatch_queue_t v158;
  uint64_t v159;
  __CFDictionary *v160;
  int v161;
  int v162;
  int v163;
  int v164;
  uint64_t (*v165)(const __CFDictionary *, const __CFString *, const __CFAllocator *, void **);
  uint64_t (*v166)(const __CFDictionary *);
  int v167;
  CFTypeRef v168;
  void (*v169)(CFTypeRef);
  int v170;
  CFTypeRef v171;
  void (*v172)(CFTypeRef);
  __CFDictionary *v173;
  CFIndex Count;
  CFIndex i;
  _QWORD *ValueAtIndex;
  void (*v177)(_QWORD);
  uint64_t v178;
  int v179;
  int v181;
  int v182;
  int v183;
  void (*v184)(_QWORD *, uint64_t, const void *);
  uint64_t v185;
  _OWORD *v186;
  CFTypeRef v187;
  CFDataRef v188;
  CFDataRef v189;
  CFMutableDictionaryRef v190;
  const void *v192;
  const void *v193;
  const __CFDictionary *theDict;
  uint64_t v195;
  const __CFAllocator *allocator;
  CFIndex v197;
  CFTypeRef *v198;
  __CFDictionary *Mutable;
  CFArrayRef theArray;
  unsigned int v201;
  void *value;
  int v203;
  __int128 v204;
  void (*v205)(uint64_t, int, const void *);
  CFTypeRef v206[5];
  char cStr[32];
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _BYTE v214[28];
  UInt8 bytes[40];
  uint64_t v216;

  v216 = *MEMORY[0x24BDAC8D0];
  v201 = 0;
  v5 = *(unsigned __int8 *)(a1 + 456);
  theArray = 0;
  v6 = &unk_2553CD000;
  v7 = gLogCategory_AirPlayReceiverCore;
  if (gLogCategory_AirPlayReceiverCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverCore == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v7 = gLogCategory_AirPlayReceiverCore;
    }
    if (v7 == -1)
      _LogCategory_Initialize();
    LogPrintF();
    v6 = &unk_2553CD000;
  }
LABEL_9:
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v173 = 0;
    v201 = -6728;
    goto LABEL_475;
  }
  theDict = a2;
  if (!v5)
  {
    if (*(_BYTE *)(a1 + 456))
    {
      APSLogErrorAt();
      v19 = -6719;
      v173 = Mutable;
      goto LABEL_522;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 648), CFSTR("None")))
      goto LABEL_52;
    v206[1] = 0;
    if (CFDictionaryContainsKey(a2, CFSTR("timingProtocol")))
      v8 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("timingProtocol"));
    else
      v8 = (const __CFArray *)CFSTR("NTP");
    v9 = *(unsigned __int8 *)(a1 + 424);
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)(a1 + 152), 0x8000100u);
    if (!v11)
    {
      APSLogErrorAt();
      v19 = -6728;
      a2 = theDict;
      goto LABEL_521;
    }
    v12 = v11;
    memset(bytes, 0, 28);
    if (CFEqual(CFSTR("PTP"), v8))
    {
      v212 = 0u;
      v213 = 0u;
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      memset(cStr, 0, sizeof(cStr));
      v13 = APSNetworkClockPTPCreate();
      if (v13)
      {
        v19 = v13;
        APSLogErrorAt();
        v24 = 0;
        goto LABEL_49;
      }
      v14 = *(_QWORD *)(a1 + 448);
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
      if (v15)
      {
        v16 = v15(v14, a1);
        if (v16)
        {
          v19 = v16;
        }
        else
        {
          if (*(_BYTE *)(a1 + 657))
            APSIsMemberOfHTGroup();
          updated = APSNetworkClockDetermineAndSetOrUpdateLocalPeerInfo();
          if (updated)
          {
            v19 = updated;
          }
          else
          {
            v21 = CFDictionaryGetValue(theDict, CFSTR("timingPeerList"));
            v22 = CFDictionaryGetValue(theDict, CFSTR("timingPeerInfo"));
            v23 = SockAddrToString();
            if (!v23)
            {
              v24 = CFStringCreateWithCString(v10, cStr, 0x8000100u);
              v6 = (_DWORD *)&unk_2553CD000;
              if (v22)
              {
                v25 = APSNetworkClockAddOrUpdatePeerFromSerializablePeerDictionary();
                if (v25)
                {
                  v19 = v25;
LABEL_536:
                  APSLogErrorAt();
                  goto LABEL_49;
                }
              }
              else
              {
                v26 = APSNetworkClockAddOrUpdatePeerWithAddressAndInterfaceNameStrings();
                if (v26)
                {
                  v19 = v26;
                  goto LABEL_536;
                }
              }
              if (v21)
              {
                v27 = APSNetworkClockSetPeersFromSetPeersMessagePayload();
                if (v27)
                {
                  v19 = v27;
                  goto LABEL_536;
                }
              }
              FigCFDictionarySetValue();
LABEL_44:
              if (!*(_BYTE *)(a1 + 659))
                AirPlayReceiverSessionPlatformSetProperty((_QWORD *)a1, v28, CFSTR("timingProtocol"), 0, v8);
              v19 = 0;
LABEL_49:
              CFRelease(v12);
              if (v24)
                CFRelease(v24);
              a2 = theDict;
              if (!v19)
              {
LABEL_52:
                if (!*(_BYTE *)(a1 + 457))
                {
LABEL_60:
                  *(_BYTE *)(a1 + 456) = 1;
                  v36 = APReceiverStatsCollectorCreate();
                  *(_QWORD *)(a1 + 176) = v36;
                  if (v36)
                  {
                    if (gLogCategory_AirPlayReceiverCore <= 30
                      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                    }
                    v37 = *(_QWORD *)(a1 + 600);
                    if (v37)
                    {
                      v38 = *(_QWORD *)(a1 + 176);
                      v39 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 56);
                      if (v39)
                        v39(v37, CFSTR("StatsCollector"), v38);
                    }
                  }
                  v201 = 0;
                  if (*(_QWORD *)(a1 + 600) && !*(_BYTE *)(a1 + 659))
                  {
                    CMNotificationCenterGetDefaultLocalCenter();
                    CMNotificationCenterAddListener();
                  }
                  if (CFDictionaryGetInt64())
                  {
                    *(_BYTE *)(a1 + 700) = 1;
                    CFDictionaryGetDouble();
                    *(_QWORD *)(a1 + 704) = v40;
                  }
                  goto LABEL_73;
                }
                v34 = ServerSocketOpen();
                if (!v34)
                {
                  if (*(_BYTE *)(a1 + 424))
                    SocketSetP2P();
                  CFDictionarySetInt64();
                  v35 = v6[526];
                  if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
                    LogPrintF();
                  goto LABEL_60;
                }
                v19 = v34;
              }
LABEL_521:
              APSLogErrorAt();
              v173 = Mutable;
              _ControlTearDown(a1);
LABEL_522:
              v183 = v6[526];
              if (v183 <= 60 && (v183 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v201 = v19;
              goto LABEL_514;
            }
            v19 = v23;
          }
        }
      }
      else
      {
        v19 = -12782;
      }
    }
    else
    {
      Int64 = CFDictionaryGetInt64();
      if (Int64 >= 1)
        v18 = Int64;
      else
        v18 = 6002;
      SockAddrCopy();
      SockAddrSetPort();
      if (gLogCategory_AirPlayReceiverCore <= 50
        && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v29 = *(unsigned __int8 *)(a1 + 560);
      *(_OWORD *)cStr = *(_OWORD *)bytes;
      *(_OWORD *)&cStr[12] = *(_OWORD *)&bytes[12];
      v30 = APNetworkClockNTPClientLegacyCreate((uint64_t)v10, v29, v9, (uint64_t)cStr, v18, (_QWORD *)(a1 + 448));
      if (v30)
      {
        v19 = v30;
      }
      else
      {
        v31 = *(_QWORD *)(a1 + 448);
        v32 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
        if (v32)
        {
          v33 = v32(v31, a1);
          if (!v33)
          {
            v24 = 0;
            v6 = (_DWORD *)&unk_2553CD000;
            goto LABEL_44;
          }
          v19 = v33;
        }
        else
        {
          v19 = -12782;
        }
      }
    }
    APSLogErrorAt();
    v24 = 0;
    v6 = &unk_2553CD000;
    goto LABEL_49;
  }
LABEL_73:
  CFDictionaryGetCString();
  if (!v201)
  {
    __strlcpy_chk();
    v201 = -6727;
  }
  if (CFDictionaryContainsKey(a2, CFSTR("osBuildVersion")))
  {
    v41 = *(const void **)(a1 + 320);
    v42 = CFDictionaryGetValue(a2, CFSTR("osBuildVersion"));
    v43 = v42;
    if (v42)
      CFRetain(v42);
    *(_QWORD *)(a1 + 320) = v43;
    if (v41)
      CFRelease(v41);
  }
  if (CFDictionaryContainsKey(a2, CFSTR("model")))
  {
    v44 = *(const void **)(a1 + 312);
    v45 = CFDictionaryGetValue(a2, CFSTR("model"));
    v46 = v45;
    if (v45)
      CFRetain(v45);
    *(_QWORD *)(a1 + 312) = v46;
    if (v44)
      CFRelease(v44);
  }
  if (CFDictionaryContainsKey(a2, CFSTR("modelCode")))
  {
    v47 = *(const void **)(a1 + 304);
    v48 = CFDictionaryGetValue(a2, CFSTR("modelCode"));
    v49 = v48;
    if (v48)
      CFRetain(v48);
    *(_QWORD *)(a1 + 304) = v49;
    if (v47)
      CFRelease(v47);
  }
  if (CFDictionaryContainsKey(a2, CFSTR("name")))
  {
    v50 = *(const void **)(a1 + 288);
    v51 = CFDictionaryGetValue(a2, CFSTR("name"));
    v52 = v51;
    if (v51)
      CFRetain(v51);
    *(_QWORD *)(a1 + 288) = v52;
    if (v50)
      CFRelease(v50);
  }
  if (CFDictionaryContainsKey(a2, CFSTR("udid")))
  {
    v53 = *(const void **)(a1 + 296);
    v54 = CFDictionaryGetValue(a2, CFSTR("udid"));
    v55 = v54;
    if (v54)
      CFRetain(v54);
    *(_QWORD *)(a1 + 296) = v55;
    if (v53)
      CFRelease(v53);
  }
  v6 = &unk_2553CD000;
  if (!v5 && !*(_BYTE *)(a1 + 659))
  {
    *(_BYTE *)(a1 + 656) = CFDictionaryGetInt64() != 0;
    *(_DWORD *)(a1 + 496) = CFDictionaryGetInt64();
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_BYTE *)(a1 + 656)
      && APSIsMemberOfHTGroup()
      && *(_DWORD *)(a1 + 496) != 2
      && gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (CFDictionaryContainsKey(a2, CFSTR("senderDisplayLatencyMs")))
  {
    *(_DWORD *)(a1 + 696) = CFDictionaryGetInt64Ranged();
    if (gLogCategory_AirPlayReceiverCore <= 50
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  CFArrayGetTypeID();
  TypedValue = (const __CFArray *)CFDictionaryGetTypedValue();
  if (!TypedValue || (v57 = CFArrayGetCount(TypedValue), v57 < 1))
  {
    v195 = 0;
LABEL_462:
    v173 = Mutable;
    if (!*(_BYTE *)(a1 + 659) && v195)
    {
      Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 568));
      v201 = _cfDictionaryCopyKeysAndValues(*(const __CFDictionary **)(a1 + 568), 0, (CFTypeRef *)&theArray);
      if (v201)
      {
LABEL_498:
        APSLogErrorAt();
        goto LABEL_474;
      }
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          if (ValueAtIndex)
          {
            v177 = (void (*)(_QWORD))ValueAtIndex[17];
            if (v177)
              v177(ValueAtIndex[5]);
          }
          else
          {
            APSLogErrorAt();
          }
        }
      }
    }
    *a3 = Mutable;
    v201 = 0;
    v173 = 0;
LABEL_474:
    a2 = theDict;
    goto LABEL_475;
  }
  v58 = v57;
  v59 = 0;
  v195 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v186 = (_OWORD *)(a1 + 224);
  v198 = (CFTypeRef *)(a1 + 616);
  v192 = (const void *)*MEMORY[0x24BDBD268];
  v193 = (const void *)*MEMORY[0x24BDBD270];
  v197 = v57;
  while (1)
  {
    CFDictionaryGetTypeID();
    TypedValueAtIndex = (const __CFDictionary *)CFArrayGetTypedValueAtIndex();
    if (v201)
    {
LABEL_499:
      APSLogErrorAt();
LABEL_500:
      a2 = theDict;
      v173 = Mutable;
      goto LABEL_475;
    }
    v61 = CFDictionaryGetInt64();
    v62 = v6[526];
    if (v62 <= 50 && (v62 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v61 > 109)
      break;
    if (v61 == 96)
    {
      v201 = _GeneralAudioSetup(a1, 96, TypedValueAtIndex, Mutable);
      if (v201)
        goto LABEL_499;
      HIDWORD(v195) = 1;
    }
    else
    {
      if (v61 != 103)
      {
LABEL_152:
        v78 = v6[526];
        if (v78 <= 50 && (v78 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_391;
      }
      v201 = _GeneralAudioSetup(a1, 103, TypedValueAtIndex, Mutable);
      if (v201)
        goto LABEL_499;
      LODWORD(v195) = 1;
    }
LABEL_391:
    if (++v59 == v58)
      goto LABEL_462;
  }
  if (v61 == 110)
  {
    v206[0] = 0;
    value = 0;
    if (*v198)
    {
      APSLogErrorAt();
      v85 = -6719;
LABEL_277:
      for (j = 0; j != 32; ++j)
        cStr[j] = 0;
      if (!v85)
      {
        v201 = 0;
        goto LABEL_391;
      }
      v182 = v6[526];
      v173 = Mutable;
      if (v182 <= 60 && (v182 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v201 = v85;
      goto LABEL_498;
    }
    v69 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v69)
    {
      APSLogErrorAt();
      v85 = -6728;
      goto LABEL_271;
    }
    v70 = v69;
    v71 = *(const void **)(a1 + 592);
    if (v71)
    {
      *(_QWORD *)&v204 = 0;
      v72 = CFGetTypeID(v71);
      if (v72 == FigValeriaGetTypeID())
      {
        if (gLogCategory_APReceiverScreenSinkSBufConsumer <= 30
          && (gLogCategory_APReceiverScreenSinkSBufConsumer != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (APReceiverScreenSinkGetClassID_once != -1)
          dispatch_once(&APReceiverScreenSinkGetClassID_once, &__block_literal_global_4896);
        v86 = CMDerivedObjectCreate();
        if (!v86)
        {
          DerivedStorage = CMBaseObjectGetDerivedStorage();
          *(_QWORD *)(DerivedStorage + 8) = CFRetain(v71);
          if (gLogCategory_APReceiverScreenSinkSBufConsumer <= 30
            && (gLogCategory_APReceiverScreenSinkSBufConsumer != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v88 = v204;
          v206[0] = (CFTypeRef)v204;
          v89 = *(_QWORD *)(a1 + 640);
          if (v89)
          {
            v90 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 56);
            if (v90)
              v90(v88, CFSTR("KeyExchangeReceiver"), v89);
          }
          goto LABEL_183;
        }
        v85 = v86;
        APSLogErrorAt();
        if ((_QWORD)v204)
          CFRelease((CFTypeRef)v204);
      }
      else
      {
        APSLogErrorAt();
        v85 = -72131;
      }
      v6 = (_DWORD *)&unk_2553CD000;
      v58 = v197;
      APSLogErrorAt();
      goto LABEL_406;
    }
    AirPlay = APReceiverScreenSinkCreateAirPlay((uint64_t)allocator, v206);
    if (AirPlay)
    {
      v85 = AirPlay;
      APSLogErrorAt();
LABEL_400:
      v6 = (_DWORD *)&unk_2553CD000;
      v58 = v197;
LABEL_406:
      CFRelease(v70);
      goto LABEL_271;
    }
LABEL_183:
    v91 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v91)
    {
      v92 = v91;
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      CFDictionarySetValue(v92, CFSTR("NetworkClock"), *(const void **)(a1 + 448));
      if (*(_BYTE *)(a1 + 560))
        v93 = v192;
      else
        v93 = v193;
      CFDictionarySetValue(v92, CFSTR("SetQoS"), v93);
      if (*(_BYTE *)(a1 + 424))
        v94 = v193;
      else
        v94 = v192;
      CFDictionarySetValue(v92, CFSTR("AllowP2P"), v94);
      CFDictionarySetValue(v92, CFSTR("ReceiverSession"), (const void *)a1);
      v95 = *(_QWORD *)(a1 + 176);
      v6 = (_DWORD *)&unk_2553CD000;
      if (v95)
      {
        APReceiverStatsCollectorSetScreenOptions(v95, (uint64_t)TypedValueAtIndex);
        APReceiverStatsCollectorSetIfName(*(_QWORD *)(a1 + 176), a1 + 152);
        CFDictionarySetValue(v92, CFSTR("StatsCollector"), *(const void **)(a1 + 176));
      }
      v96 = APReceiverScreenSessionCreate((uint64_t)allocator, v206[0], v92, v198);
      if (v96)
      {
        v85 = v96;
      }
      else
      {
        *(_BYTE *)(a1 + 440) = 1;
        *(_WORD *)(a1 + 632) = 0;
        v97 = *(_QWORD *)(a1 + 616);
        v98 = *(uint64_t (**)(uint64_t, void (*)(int, CFTypeRef, uint64_t, _QWORD *), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (!v98)
        {
          v85 = -12782;
          goto LABEL_268;
        }
        v99 = v98(v97, _ScreenHandleEvent, a1);
        if (v99)
        {
          v85 = v99;
          goto LABEL_268;
        }
        v100 = CFDictionaryGetInt64();
        if (!v100)
        {
          APSLogErrorAt();
          v85 = -6715;
          goto LABEL_269;
        }
        v101 = v100;
        v102 = *(_QWORD *)(a1 + 488);
        if (v102
          && (v103 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32)) != 0
          && v103(v102))
        {
          DataStreamSecurityKeys = _GetDataStreamSecurityKeys(a1, v101, 0, 0, (uint64_t)cStr);
          if (DataStreamSecurityKeys)
          {
            v85 = DataStreamSecurityKeys;
            goto LABEL_268;
          }
          v105 = *v198;
          v106 = *(uint64_t (**)(CFTypeRef, char *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
          if (!v106)
          {
            v85 = -12782;
            goto LABEL_268;
          }
          v107 = v106(v105, cStr, 32);
          if (v107)
          {
            v85 = v107;
LABEL_268:
            APSLogErrorAt();
            goto LABEL_269;
          }
        }
        else
        {
          APSEncryptionUtilsDeriveAESKeySHA512ForScreen();
          v108 = *v198;
          v109 = *(uint64_t (**)(CFTypeRef, UInt8 *, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v109)
            v85 = v109(v108, bytes, v214);
          else
            v85 = -12782;
          for (k = 0; k != 16; ++k)
            bytes[k] = 0;
          for (m = 0; m != 16; ++m)
            v214[m] = 0;
          if (v85)
            goto LABEL_268;
        }
        v112 = *v198;
        v113 = *(uint64_t (**)(CFTypeRef, const __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
        if (!v113)
        {
          v85 = -12782;
          goto LABEL_268;
        }
        v114 = v113(v112, CFSTR("ListenPort"), 0, &value);
        if (v114)
        {
          v85 = v114;
          goto LABEL_268;
        }
        CFDictionarySetInt64();
        CFDictionarySetValue(v70, CFSTR("dataPort"), value);
        v115 = _AddResponseStream(Mutable, v70);
        v6 = &unk_2553CD000;
        if (!v115)
        {
          if (gLogCategory_AirPlayReceiverCore <= 50
            && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          _UpdateActiveSessionRegistration((uint64_t *)a1);
          if (TypedValueAtIndex && *(_QWORD *)(a1 + 600))
          {
            v121 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("ensembleInfo"));
            if (v121)
            {
              v122 = v121;
              v123 = *(_QWORD *)(a1 + 600);
              v124 = *(void (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 56);
              if (v124)
                v124(v123, CFSTR("EnsembleInfo"), v122);
            }
            v125 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("DemoDeviceInfo"));
            if (v125)
            {
              v126 = v125;
              v127 = *(_QWORD *)(a1 + 600);
              v128 = *(void (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 56);
              if (v128)
                v128(v127, CFSTR("DemoDeviceInfo"), v126);
            }
          }
          if (*(_BYTE *)(a1 + 458))
          {
            v85 = _ScreenStart(a1);
            if (v85)
              goto LABEL_268;
          }
          else
          {
            v85 = 0;
          }
LABEL_269:
          v6 = &unk_2553CD000;
LABEL_270:
          CFRelease(v70);
          CFRelease(v92);
          v58 = v197;
LABEL_271:
          if (v206[0])
            CFRelease(v206[0]);
          if (value)
            CFRelease(value);
          if (v85)
            _ScreenTearDown(a1);
          goto LABEL_277;
        }
        v85 = v115;
      }
      APSLogErrorAt();
      goto LABEL_270;
    }
    APSLogErrorAt();
    v85 = -6728;
    goto LABEL_400;
  }
  if (v61 == 120)
  {
    ++*(_QWORD *)(a1 + 664);
    v73 = (const void *)CFNumberCreateInt64();
    if (v73)
    {
      v74 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v74)
      {
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        v75 = _AddResponseStream(Mutable, v74);
        if (v75)
        {
          v76 = v75;
          APSLogErrorAt();
        }
        else
        {
          CFSetSetValue(*(CFMutableSetRef *)(a1 + 720), v73);
          if (CFSetGetCount(*(CFSetRef *)(a1 + 720)) == 1)
            _UpdateActiveSessionRegistration((uint64_t *)a1);
          v76 = 0;
        }
LABEL_147:
        v77 = v6[526];
        if (v77 <= 50 && (v77 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (v74)
          CFRelease(v74);
        if (v73)
          CFRelease(v73);
        v201 = v76;
        v58 = v197;
        if (v76)
          goto LABEL_499;
        goto LABEL_391;
      }
      APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
      v74 = 0;
    }
    v76 = -6728;
    goto LABEL_147;
  }
  if (v61 != 130)
    goto LABEL_152;
  v63 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("clientTypeUUID"));
  if (!v63)
  {
    APSLogErrorAt();
    v201 = -6705;
    goto LABEL_500;
  }
  if (!CFEqual(v63, CFSTR("A6B27562-B43A-4F2D-B75F-82391E250194")))
  {
    v203 = 0;
    value = 0;
    if (TypedValueAtIndex)
    {
      ++*(_QWORD *)(a1 + 664);
      v79 = (void *)CFNumberCreateInt64();
      if (v79)
      {
        v80 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v80)
        {
          v81 = v80;
          CFDictionarySetInt64();
          v190 = v81;
          CFDictionarySetValue(v81, CFSTR("streamID"), v79);
          v82 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("clientTypeUUID"));
          v83 = v6[526];
          if (v83 <= 50 && (v83 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          if (v82)
          {
            if (CFEqual(v82, CFSTR("1910A70F-DBC0-4242-AF95-115DB30604E1"))
              || CFEqual(v82, CFSTR("82C33ABC-DABD-41C7-9A83-A8F67D5491C3")))
            {
              v187 = v79;
              v117 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("clientUUID"));
              CFDictionaryGetValue(TypedValueAtIndex, CFSTR("channelID"));
              if ((CFDictionaryGetInt64() & 0xFFFFFFFD) != 0)
              {
                v203 = -6735;
                v118 = v6[526];
                if (v118 <= 90)
                {
                  v58 = v197;
                  if (v118 != -1 || _LogCategory_Initialize())
                    LogPrintF();
                  TypedValueAtIndex = 0;
                  v188 = 0;
                  v189 = 0;
                  goto LABEL_378;
                }
                TypedValueAtIndex = 0;
                v188 = 0;
                v189 = 0;
                v58 = v197;
LABEL_379:
                _RemoteControlSessionTearDown(a1, v79);
LABEL_380:
                if (TypedValueAtIndex)
                  CFRelease(TypedValueAtIndex);
                if (v79)
                  CFRelease(v79);
                if (v190)
                  CFRelease(v190);
                if (v189)
                  CFRelease(v189);
                if (v188)
                  CFRelease(v188);
                v201 = v203;
                if (v203)
                  goto LABEL_499;
                goto LABEL_391;
              }
              v119 = CFDictionaryGetInt64();
              if (!v119)
              {
                v188 = 0;
                v189 = 0;
                v184 = _SendRemoteControlSessionOutgoingMessage;
                goto LABEL_295;
              }
              memset(cStr, 0, sizeof(cStr));
              memset(bytes, 0, 32);
              v120 = v6[526];
              if (v120 <= 50 && (v120 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v139 = CFDictionaryGetInt64();
              if (v203 || (v203 = _GetDataStreamSecurityKeys(a1, v139, 32, (uint64_t)bytes, (uint64_t)cStr)) != 0)
              {
                APSLogErrorAt();
                v189 = 0;
              }
              else
              {
                v189 = CFDataCreate(allocator, (const UInt8 *)cStr, 32);
                if (v189)
                {
                  v140 = CFDataCreate(allocator, bytes, 32);
                  if (v140)
                  {
                    v188 = v140;
                    v184 = 0;
LABEL_295:
                    if (CFEqual(v82, CFSTR("1910A70F-DBC0-4242-AF95-115DB30604E1")))
                    {
                      *(_OWORD *)v214 = *v186;
                      *(_OWORD *)&v214[12] = *(_OWORD *)(a1 + 236);
                      v206[0] = 0;
                      v208 = 0u;
                      v209 = 0u;
                      memset(cStr, 0, sizeof(cStr));
                      v185 = v119;
                      if (!v117)
                      {
                        APSLogErrorAt();
                        v160 = 0;
                        v162 = -6705;
                        goto LABEL_434;
                      }
                      if (APReceiverRemoteControlSessionGetClassID_sRegisterOnce != -1)
                        dispatch_once_f(&APReceiverRemoteControlSessionGetClassID_sRegisterOnce, &APReceiverRemoteControlSessionGetClassID_sClassID, (dispatch_function_t)rcs_getClassID);
                      v141 = CMDerivedObjectCreate();
                      if (v141)
                      {
                        v162 = v141;
                        APSLogErrorAt();
                        v160 = 0;
                        goto LABEL_434;
                      }
                      v142 = (_QWORD *)CMBaseObjectGetDerivedStorage();
                      v142[2] = CFRetain(v187);
                      v142[3] = CFRetain(v117);
                      v143 = v206[0];
                      ++APReceiverMediaRemoteXPCService_RegisterCommChannel_channelIDGenerator;
                      v144 = (const void *)CFNumberCreateInt64();
                      FigSimpleMutexCheckIsNotLockedOnThisThread();
                      pthread_mutex_lock((pthread_mutex_t *)gAPReceiverMediaRemoteService_3);
                      if (gAPReceiverMediaRemoteService_1)
                      {
                        v145 = malloc_type_calloc(1uLL, 0x18uLL, 0xE00403260BBE2uLL);
                        if (v145)
                        {
                          v146 = v145;
                          *v145 = CFRetain(v117);
                          v146[1] = rcsMediaRemote_sendDataCallback;
                          if (v143)
                            v146[2] = FigCFWeakReferenceHolderCreateWithReferencedObject();
                          CFDictionarySetValue((CFMutableDictionaryRef)gAPReceiverMediaRemoteService_1, v144, v146);
                          if (gLogCategory_APReceiverMediaRemoteXPCService <= 50
                            && (gLogCategory_APReceiverMediaRemoteXPCService != -1
                             || _LogCategory_Initialize()))
                          {
                            LogPrintF();
                          }
                          v142[4] = v144;
                          pthread_mutex_unlock((pthread_mutex_t *)gAPReceiverMediaRemoteService_3);
                          v6 = &unk_2553CD000;
                          goto LABEL_323;
                        }
                        v6 = (_DWORD *)&unk_2553CD000;
                      }
                      APSLogErrorAt();
                      pthread_mutex_unlock((pthread_mutex_t *)gAPReceiverMediaRemoteService_3);
                      if (v144)
                        CFRelease(v144);
LABEL_323:
                      v156 = FigSimpleMutexCreate();
                      v142[13] = v156;
                      if (!v156)
                        goto LABEL_431;
                      SNPrintF();
                      v157 = dispatch_queue_create(cStr, 0);
                      v142[9] = v157;
                      if (!v157)
                        goto LABEL_431;
                      SNPrintF();
                      v158 = dispatch_queue_create(cStr, 0);
                      v142[10] = v158;
                      if (!v158
                        || (v142[5] = a1,
                            v142[6] = v184,
                            v142[7] = _HandleRemoteControlSessionFailed,
                            v159 = FigCFWeakReferenceHolderCreateWithReferencedObject(),
                            (v142[8] = v159) == 0))
                      {
LABEL_431:
                        APSLogErrorAt();
                        v160 = 0;
                        v162 = -6728;
                        goto LABEL_434;
                      }
                      if (v185)
                      {
                        v160 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                        if (v160)
                        {
                          FigCFDictionarySetValue();
                          FigCFDictionarySetValue();
                          CFDictionarySetValue(v160, CFSTR("MDC::Label"), CFSTR("RCS-MediaRemote"));
                          FigCFDictionarySetInt32();
                          CFDictionarySetInt64();
                          *(CFTypeRef *)&v204 = v206[0];
                          *((_QWORD *)&v204 + 1) = rcsMediaRemote_handleMediaDataControlRequest;
                          v205 = rcsMediaRemote_handleMediaDataControlFailure;
                          *(_OWORD *)bytes = *(_OWORD *)v214;
                          *(_OWORD *)&bytes[12] = *(_OWORD *)&v214[12];
                          v161 = APMediaDataControlServerCreate((uint64_t)bytes, v160, &v204, v142 + 11);
                          if (!v161)
                          {
                            if (gLogCategory_APReceiverRemoteControlSessionMediaRemote <= 50)
                            {
                              if (gLogCategory_APReceiverRemoteControlSessionMediaRemote != -1
                                || _LogCategory_Initialize())
                              {
                                LogPrintF();
                              }
                              goto LABEL_348;
                            }
                            goto LABEL_352;
                          }
                          v162 = v161;
                          APSLogErrorAt();
                        }
                        else
                        {
                          APSLogErrorAt();
                          v162 = -6728;
                        }
LABEL_434:
                        v168 = v206[0];
                        if (v206[0])
                        {
                          v169 = *(void (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
                          if (v169)
                            v169(v168);
                          v6 = (_DWORD *)&unk_2553CD000;
                          if (v206[0])
                            CFRelease(v206[0]);
                          TypedValueAtIndex = 0;
                        }
                        else
                        {
                          TypedValueAtIndex = 0;
                          v6 = (_DWORD *)&unk_2553CD000;
                        }
                        if (!v160)
                        {
LABEL_354:
                          v203 = v162;
                          if (v162)
                          {
                            APSLogErrorAt();
                            v58 = v197;
                            v79 = (void *)v187;
                            goto LABEL_378;
                          }
                          v163 = v6[526];
                          v79 = (void *)v187;
                          if (v163 <= 50 && (v163 != -1 || _LogCategory_Initialize()))
                            LogPrintF();
                          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 672), v187, TypedValueAtIndex);
                          v58 = v197;
                          if (!v185)
                            goto LABEL_370;
LABEL_367:
                          v165 = *(uint64_t (**)(const __CFDictionary *, const __CFString *, const __CFAllocator *, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
                          if (v165)
                          {
                            v203 = v165(TypedValueAtIndex, CFSTR("RRCS::Property::ListenPort"), allocator, &value);
                            if (!v203)
                            {
                              CFDictionarySetValue(v190, CFSTR("dataPort"), value);
LABEL_370:
                              v203 = _AddResponseStream(Mutable, v190);
                              if (!v203)
                              {
                                v166 = *(uint64_t (**)(const __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 8);
                                if (v166)
                                {
                                  v203 = v166(TypedValueAtIndex);
                                  if (!v203)
                                    goto LABEL_380;
                                }
                                else
                                {
                                  v203 = -12782;
                                }
                              }
                            }
                          }
                          else
                          {
                            v203 = -12782;
                          }
                          APSLogErrorAt();
                          goto LABEL_378;
                        }
                      }
                      else
                      {
                        if (gLogCategory_APReceiverRemoteControlSessionMediaRemote > 50)
                        {
                          v160 = 0;
                        }
                        else
                        {
                          if (gLogCategory_APReceiverRemoteControlSessionMediaRemote != -1
                            || _LogCategory_Initialize())
                          {
                            LogPrintF();
                          }
                          v160 = 0;
LABEL_348:
                          if (gLogCategory_APReceiverRemoteControlSessionMediaRemote <= 50
                            && (gLogCategory_APReceiverRemoteControlSessionMediaRemote != -1
                             || _LogCategory_Initialize()))
                          {
                            LogPrintF();
                          }
                        }
LABEL_352:
                        v162 = 0;
                        TypedValueAtIndex = (const __CFDictionary *)v206[0];
                        v206[0] = 0;
                        if (!v160)
                          goto LABEL_354;
                      }
                      CFRelease(v160);
                      goto LABEL_354;
                    }
                    v147 = v119;
                    v148 = *(CFMutableDictionaryRef *)(a1 + 600);
                    *(_OWORD *)v214 = *v186;
                    *(_OWORD *)&v214[12] = *(_OWORD *)(a1 + 236);
                    v206[0] = 0;
                    v208 = 0u;
                    v209 = 0u;
                    memset(cStr, 0, sizeof(cStr));
                    if (v148)
                    {
                      if (v147)
                      {
                        if (APReceiverRemoteControlSessionGetClassID_sRegisterOnce != -1)
                          dispatch_once_f(&APReceiverRemoteControlSessionGetClassID_sRegisterOnce, &APReceiverRemoteControlSessionGetClassID_sClassID, (dispatch_function_t)rcs_getClassID);
                        v149 = CMDerivedObjectCreate();
                        if (v149)
                        {
                          v170 = v149;
                          APSLogErrorAt();
                          v148 = 0;
                          goto LABEL_449;
                        }
                        v150 = (_QWORD *)CMBaseObjectGetDerivedStorage();
                        v150[2] = CFRetain(v187);
                        v150[10] = v148;
                        CFRetain(v148);
                        v151 = FigSimpleMutexCreate();
                        v150[12] = v151;
                        if (!v151)
                          goto LABEL_447;
                        SNPrintF();
                        v152 = dispatch_queue_create(cStr, 0);
                        v150[7] = v152;
                        if (!v152)
                          goto LABEL_447;
                        SNPrintF();
                        v153 = dispatch_queue_create(cStr, 0);
                        v150[8] = v153;
                        if (v153
                          && (v154 = FigCFWeakReferenceHolderCreateWithReferencedObject(), (v150[6] = v154) != 0))
                        {
                          v148 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                          if (v148)
                          {
                            FigCFDictionarySetValue();
                            FigCFDictionarySetValue();
                            CFDictionarySetValue(v148, CFSTR("MDC::Label"), CFSTR("RCS-SenderUIEventsChannel"));
                            FigCFDictionarySetInt32();
                            *(CFTypeRef *)&v204 = v206[0];
                            *((_QWORD *)&v204 + 1) = rcsSenderUIEventsChannel_handleMediaDataControlRequest;
                            v205 = rcsSenderUIEventsChannel_handleMediaDataControlFailure;
                            *(_OWORD *)bytes = *(_OWORD *)v214;
                            *(_OWORD *)&bytes[12] = *(_OWORD *)&v214[12];
                            v155 = APMediaDataControlServerCreate((uint64_t)bytes, v148, &v204, v150 + 9);
                            if (!v155)
                            {
                              if (gLogCategory_APReceiverRemoteControlSessionSenderUIEventsChannel <= 50)
                              {
                                if (gLogCategory_APReceiverRemoteControlSessionSenderUIEventsChannel != -1
                                  || _LogCategory_Initialize())
                                {
                                  LogPrintF();
                                }
                                if (gLogCategory_APReceiverRemoteControlSessionSenderUIEventsChannel <= 50
                                  && (gLogCategory_APReceiverRemoteControlSessionSenderUIEventsChannel != -1
                                   || _LogCategory_Initialize()))
                                {
                                  LogPrintF();
                                }
                              }
                              TypedValueAtIndex = (const __CFDictionary *)v206[0];
                              v206[0] = 0;
                              CFRelease(v148);
                              v203 = 0;
                              v164 = v6[526];
                              v79 = (void *)v187;
                              if (v164 <= 50 && (v164 != -1 || _LogCategory_Initialize()))
                                LogPrintF();
                              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 672), v187, TypedValueAtIndex);
                              v58 = v197;
                              goto LABEL_367;
                            }
                            v170 = v155;
                            APSLogErrorAt();
LABEL_449:
                            v58 = v197;
                            v171 = v206[0];
                            if (v206[0])
                            {
                              v172 = *(void (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
                              if (v172)
                                v172(v171);
                              if (v206[0])
                                CFRelease(v206[0]);
                            }
                            v6 = (_DWORD *)&unk_2553CD000;
                            if (v148)
                              CFRelease(v148);
                            v79 = (void *)v187;
                            v203 = v170;
                            APSLogErrorAt();
                            TypedValueAtIndex = 0;
LABEL_378:
                            if (v203)
                              goto LABEL_379;
                            goto LABEL_380;
                          }
                          APSLogErrorAt();
                        }
                        else
                        {
LABEL_447:
                          APSLogErrorAt();
                          v148 = 0;
                        }
                        v170 = -6728;
                        goto LABEL_449;
                      }
                      APSLogErrorAt();
                      v148 = 0;
                    }
                    else
                    {
                      APSLogErrorAt();
                    }
                    v170 = -6705;
                    goto LABEL_449;
                  }
                  APSLogErrorAt();
                }
                else
                {
                  APSLogErrorAt();
                  v189 = 0;
                }
                v203 = -6728;
              }
              v58 = v197;
              v79 = (void *)v187;
              TypedValueAtIndex = 0;
              v188 = 0;
              goto LABEL_378;
            }
            v203 = -6735;
            v138 = v6[526];
            if (v138 <= 90)
            {
              if (v138 != -1 || _LogCategory_Initialize())
                LogPrintF();
              TypedValueAtIndex = 0;
              v188 = 0;
              v189 = 0;
              v58 = v197;
              goto LABEL_378;
            }
            TypedValueAtIndex = 0;
            v188 = 0;
            v189 = 0;
          }
          else
          {
            APSLogErrorAt();
            TypedValueAtIndex = 0;
            v188 = 0;
            v189 = 0;
            v203 = -6705;
          }
          v58 = v197;
          goto LABEL_379;
        }
      }
      APSLogErrorAt();
      TypedValueAtIndex = 0;
      v188 = 0;
      v189 = 0;
      v190 = 0;
      v167 = -6728;
    }
    else
    {
      APSLogErrorAt();
      v79 = 0;
      v188 = 0;
      v189 = 0;
      v190 = 0;
      v167 = -6705;
    }
    v203 = v167;
    goto LABEL_379;
  }
  if (!TypedValueAtIndex)
  {
    APSLogErrorAt();
    v133 = -6705;
    goto LABEL_513;
  }
  ++*(_QWORD *)(a1 + 664);
  v64 = CFNumberCreateInt64();
  if (!v64)
  {
    APSLogErrorAt();
    v133 = -6728;
    goto LABEL_513;
  }
  v65 = (const void *)v64;
  v66 = CFDictionaryGetValue(TypedValueAtIndex, CFSTR("clientUUID"));
  if (!v66)
  {
    APSLogErrorAt();
    v133 = -6705;
    goto LABEL_512;
  }
  v67 = v66;
  v68 = v6[526];
  if (v68 <= 50)
  {
    if (v68 != -1 || _LogCategory_Initialize())
      LogPrintF();
    v116 = v6[526];
    if (v116 <= 50 && (v116 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  if (*(_QWORD *)(a1 + 600))
  {
    v129 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetNumber();
    CFDictionarySetValue(v129, CFSTR("sessionID"), v65);
    v130 = *(const void **)(a1 + 448);
    if (v130)
      CFDictionarySetValue(v129, CFSTR("networkClock"), v130);
    v131 = *(_QWORD *)(a1 + 600);
    v132 = *(uint64_t (**)(uint64_t, void (*)(_QWORD *, const void *, const void *), uint64_t (*)(uint64_t, uint64_t, CFMutableDictionaryRef *), uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v132)
    {
      v133 = v132(v131, _PlaybackV2EventCallback, _PlaybackV2TLSInfoRequestCallback, a1, v129);
      if (!v133)
      {
LABEL_258:
        v6 = (_DWORD *)&unk_2553CD000;
        if (v129)
          CFRelease(v129);
        if (v133)
          goto LABEL_510;
        v134 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (!v134)
        {
          APSLogErrorAt();
          v133 = -6728;
          goto LABEL_512;
        }
        v135 = v134;
        CFDictionarySetInt64();
        CFDictionarySetValue(v135, CFSTR("streamID"), v65);
        v136 = _AddResponseStream(Mutable, v135);
        if (v136)
        {
          APSLogErrorAt();
        }
        else
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 712), v65, v67);
          CFSetSetValue(*(CFMutableSetRef *)(a1 + 720), v65);
          if (CFSetGetCount(*(CFSetRef *)(a1 + 720)) == 1)
            _UpdateActiveSessionRegistration((uint64_t *)a1);
        }
        CFRelease(v65);
        CFRelease(v135);
        v201 = v136;
        v58 = v197;
        if (v136)
          goto LABEL_499;
        goto LABEL_391;
      }
    }
    else
    {
      v133 = -12782;
    }
    APSLogErrorAt();
    goto LABEL_258;
  }
  APSLogErrorAt();
  v133 = -6735;
LABEL_510:
  APSLogErrorAt();
LABEL_512:
  CFRelease(v65);
LABEL_513:
  a2 = theDict;
  v173 = Mutable;
  v201 = v133;
LABEL_514:
  APSLogErrorAt();
LABEL_475:
  if (theArray)
    CFRelease(theArray);
  if (v173)
    CFRelease(v173);
  v178 = v201;
  if (!v201)
    return 0;
  v179 = v6[526];
  if (v179 <= 50)
  {
    if (v179 != -1 || (v181 = _LogCategory_Initialize(), v178 = v201, v181))
    {
      LogPrintF();
      v178 = v201;
    }
  }
  AirPlayReceiverSessionTearDown(a1, (uint64_t)a2, v178, 0);
  return v201;
}

uint64_t _GeneralAudioSetup(uint64_t a1, int a2, CFDictionaryRef theDict, __CFDictionary *a4)
{
  _DWORD *v8;
  const void *v9;
  int v10;
  uint64_t v11;
  void *Int64;
  const void **v13;
  const void **v14;
  __CFDictionary *Mutable;
  const void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, __CFDictionary *);
  __CFDictionary *v19;
  uint64_t PropertyInt64Sync;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  CFMutableDictionaryRef v26;
  __CFDictionary *v27;
  int v28;
  uint64_t v29;
  const void *v30;
  const void *v31;
  uint64_t v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  CFTypeID v37;
  const void *v38;
  CFTypeID v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t);
  uint64_t v42;
  _BYTE *v43;
  int v44;
  const __CFDictionary *TypedValue;
  int v46;
  int v47;
  const __CFString *v48;
  int v49;
  const __CFDictionary *v50;
  const __CFDictionary *v51;
  CFTypeID v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  const void *v59;
  const __CFDictionary *v60;
  const __CFDictionary *v61;
  CFTypeID v62;
  const __CFDictionary *v63;
  const __CFDictionary *v64;
  CFTypeID v65;
  CFMutableArrayRef v66;
  CFMutableArrayRef v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  CFNumberRef v72;
  int v73;
  uint64_t v74;
  int v75;
  unsigned int v76;
  _BOOL4 v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  int v82;
  const void *v83;
  CFTypeRef v84;
  int v85;
  CFTypeRef v86;
  void (*v87)(_QWORD, uint64_t, uint64_t);
  const __CFNumber *v88;
  const __CFAllocator *v89;
  CFMutableDictionaryRef v90;
  CFMutableDictionaryRef v91;
  CFMutableDictionaryRef v92;
  __CFDictionary *v93;
  int v94;
  uint64_t v95;
  CFNumberRef v96;
  CFNumberRef v97;
  const __CFString *v98;
  CFMutableDictionaryRef v99;
  CFMutableDictionaryRef v100;
  int v101;
  uint64_t (*v102)(_QWORD);
  int v103;
  uint64_t result;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  __CFDictionary *v110;
  int v111;
  __CFDictionary *theDicta;
  int v113;
  int v114;
  int v115;
  _BOOL4 v116;
  void *key;
  CMTime v118;
  void *value;
  CFTypeRef cf;
  unsigned int DataStreamSecurityKeys;
  int appended;
  _BYTE v123[32];
  _BYTE v124[32];
  char v125[32];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  DataStreamSecurityKeys = 0;
  value = 0;
  cf = 0;
  v8 = (_DWORD *)&unk_2553CD000;
  if (CFDictionaryContainsKey(theDict, CFSTR("isMedia")) && !CFDictionaryGetInt64())
  {
    v115 = 1;
  }
  else
  {
    if (*(_QWORD *)(a1 + 576))
    {
      APSLogErrorAt();
      Int64 = 0;
      goto LABEL_284;
    }
    v115 = 0;
  }
  if (!CFDictionaryGetInt64())
  {
    Int64 = (void *)CFNumberCreateInt64();
    if (!Int64)
    {
      APSLogErrorAt();
      v19 = 0;
      v72 = 0;
      v73 = -6728;
LABEL_285:
      DataStreamSecurityKeys = v73;
      goto LABEL_407;
    }
    if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 568), Int64))
    {
      v113 = a2;
      v13 = (const void **)MEMORY[0x24BDBD270];
      v14 = (const void **)MEMORY[0x24BDBD268];
      if (*(_QWORD *)(a1 + 600))
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionarySetValue(Mutable, CFSTR("sessionID"), Int64);
        if (CFDictionaryGetInt64())
          v16 = v13;
        else
          v16 = v14;
        CFDictionarySetValue(Mutable, CFSTR("IsScreenAudio"), *v16);
        v17 = *(_QWORD *)(a1 + 600);
        v18 = *(void (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
        if (v18)
          v18(v17, Mutable);
        if (Mutable)
          CFRelease(Mutable);
      }
      v19 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v19)
        goto LABEL_274;
      v110 = a4;
      PropertyInt64Sync = CFObjectGetPropertyInt64Sync();
      v21 = *v13;
      v22 = *v14;
      v23 = PropertyInt64Sync ? *v13 : *v14;
      CFDictionarySetValue(v19, CFSTR("RTPSkewPlatformAdjust"), v23);
      v24 = *(_BYTE *)(a1 + 560) ? v21 : v22;
      CFDictionarySetValue(v19, CFSTR("QosDisabled"), v24);
      CFDictionarySetInt64();
      v25 = *(_BYTE *)(a1 + 424) ? v21 : v22;
      CFDictionarySetValue(v19, CFSTR("AllowP2P"), v25);
      v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v26)
      {
LABEL_274:
        APSLogErrorAt();
        v72 = 0;
        v74 = 4294960568;
        DataStreamSecurityKeys = -6728;
LABEL_406:
        _AudioTearDownStream(a1, 0, Int64, v74);
        goto LABEL_407;
      }
      v27 = v26;
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      if (CFDictionaryContainsKey(theDict, CFSTR("audioFormatIndex")))
      {
        v28 = v113;
        if (!CFDictionaryGetInt64())
          goto LABEL_48;
      }
      else
      {
        v28 = v113;
        if (!CFDictionaryContainsKey(theDict, CFSTR("audioFormat")))
          goto LABEL_48;
        v29 = CFDictionaryGetInt64();
        if ((unint64_t)v29 < 2)
          goto LABEL_48;
        if (v29 <= 0x3FFFFFFF)
        {
          if (v29 < 0x8000)
          {
            if (v29 > 255)
            {
              if (v29 <= 2047)
              {
                if (v29 != 256 && v29 != 512 && v29 != 1024)
                  goto LABEL_48;
              }
              else if (v29 >= 0x2000)
              {
                if (v29 != 0x2000 && v29 != 0x4000)
                  goto LABEL_48;
              }
              else if (v29 != 2048 && v29 != 4096)
              {
                goto LABEL_48;
              }
            }
            else if (v29 <= 7)
            {
              if (v29 != 0x8000000000000000 && v29 != 2 && v29 != 4)
                goto LABEL_48;
            }
            else if (v29 > 31)
            {
              if (v29 != 32 && v29 != 128)
                goto LABEL_48;
            }
            else if (v29 != 8 && v29 != 16)
            {
              goto LABEL_48;
            }
          }
          else if (v29 < 0x400000)
          {
            if (v29 < 0x40000)
            {
              if (v29 != 0x8000 && v29 != 0x10000 && v29 != 0x20000)
                goto LABEL_48;
            }
            else if (v29 >= 0x100000)
            {
              if (v29 != 0x100000 && v29 != 0x200000)
                goto LABEL_48;
            }
            else if (v29 != 0x40000 && v29 != 0x80000)
            {
              goto LABEL_48;
            }
          }
          else if (v29 > 0x3FFFFFF)
          {
            if (v29 > 0xFFFFFFF)
            {
              if (v29 != 0x10000000 && v29 != 0x20000000)
                goto LABEL_48;
            }
            else if (v29 != 0x4000000 && v29 != 0x8000000)
            {
              goto LABEL_48;
            }
          }
          else if (v29 > 0xFFFFFF)
          {
            if (v29 != 0x1000000 && v29 != 0x2000000)
              goto LABEL_48;
          }
          else if (v29 != 0x400000 && v29 != 0x800000)
          {
            goto LABEL_48;
          }
        }
        else if (v29 > 0x7FFFFFFFFFFFLL)
        {
          if (v29 <= 0x3FFFFFFFFFFFFFLL)
          {
            if (v29 <= 0x3FFFFFFFFFFFFLL)
            {
              if (v29 != 0x800000000000 && v29 != 0x1000000000000 && v29 != 0x2000000000000)
                goto LABEL_48;
            }
            else if (v29 > 0xFFFFFFFFFFFFFLL)
            {
              if (v29 != 0x10000000000000 && v29 != 0x20000000000000)
                goto LABEL_48;
            }
            else if (v29 != 0x4000000000000 && v29 != 0x8000000000000)
            {
              goto LABEL_48;
            }
          }
          else if (v29 > 0x3FFFFFFFFFFFFFFLL)
          {
            if (v29 > 0x1FFFFFFFFFFFFFFFLL)
            {
              if (v29 != 0x2000000000000000 && v29 != 0x4000000000000000)
                goto LABEL_48;
            }
            else if (v29 != 0x400000000000000 && v29 != 0x1000000000000000)
            {
              goto LABEL_48;
            }
          }
          else if (v29 > 0xFFFFFFFFFFFFFFLL)
          {
            if (v29 != 0x100000000000000 && v29 != 0x200000000000000)
              goto LABEL_48;
          }
          else if (v29 != 0x40000000000000 && v29 != 0x80000000000000)
          {
            goto LABEL_48;
          }
        }
        else if (v29 <= 0x7FFFFFFFFFLL)
        {
          if (v29 <= 0x1FFFFFFFFLL)
          {
            if (v29 != 0x40000000 && v29 != 0x80000000 && v29 != 0x100000000)
              goto LABEL_48;
          }
          else if (v29 > 0x7FFFFFFFFLL)
          {
            if (v29 != 0x800000000 && v29 != 0x4000000000)
              goto LABEL_48;
          }
          else if (v29 != 0x200000000 && v29 != 0x400000000)
          {
            goto LABEL_48;
          }
        }
        else if (v29 > 0x7FFFFFFFFFFLL)
        {
          if (v29 > 0x1FFFFFFFFFFFLL)
          {
            if (v29 != 0x200000000000 && v29 != 0x400000000000)
              goto LABEL_48;
          }
          else if (v29 != 0x80000000000 && v29 != 0x100000000000)
          {
            goto LABEL_48;
          }
        }
        else if (v29 > 0x1FFFFFFFFFFLL)
        {
          if (v29 != 0x20000000000 && v29 != 0x40000000000)
            goto LABEL_48;
        }
        else if (v29 != 0x8000000000 && v29 != 0x10000000000)
        {
          goto LABEL_48;
        }
      }
      DataStreamSecurityKeys = APSAudioFormatDescriptionCreateWithAudioFormatIndex();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      CFDictionarySetValue(v19, CFSTR("AudioFormat"), value);
LABEL_48:
      if (v115)
        v30 = v22;
      else
        v30 = v21;
      CFDictionarySetValue(v19, CFSTR("IsMedia"), v30);
      CFDictionarySetValue(v19, CFSTR("NetworkClock"), *(const void **)(a1 + 448));
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      if (CFDictionaryGetInt64())
        v31 = v21;
      else
        v31 = v22;
      CFDictionarySetValue(v19, CFSTR("DisableRetransmits"), v31);
      v32 = CFDictionaryGetInt64();
      *(_BYTE *)(a1 + 440) = v32 != 0;
      if (v32)
        v33 = v21;
      else
        v33 = v22;
      CFDictionarySetValue(v19, CFSTR("UsingScreen"), v33);
      if (CFDictionaryGetInt64())
        v34 = v21;
      else
        v34 = v22;
      CFDictionarySetValue(v19, CFSTR("HTFTIsActive"), v34);
      v35 = *(const void **)(a1 + 176);
      if (v35)
        CFDictionarySetValue(v19, CFSTR("StatsCollector"), v35);
      CFDictionarySetValue(v19, CFSTR("ReceiverSession"), (const void *)a1);
      CFDictionarySetValue(v19, CFSTR("StreamDescription"), theDict);
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      CFDictionaryGetInt64();
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      v36 = *(const void **)(a1 + 312);
      if (v36)
      {
        v37 = CFGetTypeID(v36);
        if (v37 == CFStringGetTypeID())
          CFDictionarySetValue(v19, CFSTR("ClientDeviceModel"), *(const void **)(a1 + 312));
      }
      v38 = *(const void **)(a1 + 320);
      if (v38)
      {
        v39 = CFGetTypeID(v38);
        if (v39 == CFStringGetTypeID())
          CFDictionarySetValue(v19, CFSTR("ClientOSBuildVersion"), *(const void **)(a1 + 320));
      }
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      DataStreamSecurityKeys = CFDictionarySetInt64();
      if (DataStreamSecurityKeys)
        goto LABEL_301;
      FigCFDictionarySetValueFromKeyInDict();
      theDicta = v27;
      if (CFDictionaryContainsKey(theDict, CFSTR("shk")))
      {
        *(_QWORD *)v125 = 0;
        CFDictionaryGetData();
        APSLogErrorAt();
        DataStreamSecurityKeys = -6743;
LABEL_302:
        v72 = 0;
        goto LABEL_405;
      }
      v40 = *(_QWORD *)(a1 + 488);
      if (v40
        && (v41 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32)) != 0
        && v41(v40))
      {
        v42 = CFDictionaryGetInt64();
        if (!v42)
        {
          APSLogErrorAt();
          v72 = 0;
          DataStreamSecurityKeys = -6715;
          v8 = (_DWORD *)&unk_2553CD000;
          goto LABEL_405;
        }
        v43 = v123;
        DataStreamSecurityKeys = _GetDataStreamSecurityKeys(a1, v42, 0, 0, (uint64_t)v123);
        if (DataStreamSecurityKeys)
          goto LABEL_297;
      }
      else
      {
        v43 = 0;
      }
      v44 = CFDictionaryContainsKey(theDict, CFSTR("streamConnections"));
      key = Int64;
      if (!v44)
      {
        CFDictionaryGetInt64();
        v55 = CFDictionarySetInt64();
        if (v55)
        {
          v76 = v55;
        }
        else
        {
          if (!v43 || (v56 = CFDictionarySetData()) == 0)
          {
            v57 = 0;
            v49 = 1381257248;
            DataStreamSecurityKeys = 0;
            v111 = 1;
            v8 = (_DWORD *)&unk_2553CD000;
            goto LABEL_314;
          }
          v76 = v56;
        }
        APSLogErrorAt();
        DataStreamSecurityKeys = v76;
LABEL_297:
        APSLogErrorAt();
        v72 = 0;
        v8 = (_DWORD *)&unk_2553CD000;
LABEL_348:
        v27 = theDicta;
        goto LABEL_405;
      }
      appended = 0;
      CFDictionaryGetTypeID();
      TypedValue = (const __CFDictionary *)CFDictionaryGetTypedValue();
      v46 = CFDictionaryContainsKey(TypedValue, CFSTR("streamConnectionTypeAPAP"));
      v47 = CFDictionaryContainsKey(TypedValue, CFSTR("streamConnectionTypeRTP"));
      if (v46 | v47)
      {
        if (v46 && v47)
        {
          v75 = -6711;
          goto LABEL_299;
        }
        if (v46)
          v48 = CFSTR("streamConnectionTypeAPAP");
        else
          v48 = CFSTR("streamConnectionTypeRTP");
        if (v46)
          v49 = 1095778640;
        else
          v49 = 1381257248;
        v50 = (const __CFDictionary *)CFDictionaryGetValue(TypedValue, v48);
        if (!v50 || (v51 = v50, v52 = CFGetTypeID(v50), v52 != CFDictionaryGetTypeID()))
        {
          v75 = -6756;
          goto LABEL_299;
        }
        v53 = CFDictionaryGetInt64();
        v54 = CFDictionaryContainsKey(v51, CFSTR("streamConnectionKeyEncryptionSeed"));
        if (v53)
        {
          if (v54)
          {
            v75 = -6711;
            goto LABEL_299;
          }
          if (v43)
          {
            appended = CFDictionarySetData();
            if (appended)
              goto LABEL_305;
          }
        }
        else if (v54)
        {
          v58 = CFDictionaryGetInt64();
          appended = _GetDataStreamSecurityKeys(a1, v58, 32, (uint64_t)v124, (uint64_t)v125);
          if (appended)
            goto LABEL_305;
          appended = CFDictionarySetData();
          if (appended)
            goto LABEL_305;
        }
        if (CFDictionaryContainsKey(v51, CFSTR("streamConnectionKeyNetworkInfo")))
        {
          v59 = CFDictionaryGetValue(v51, CFSTR("streamConnectionKeyNetworkInfo"));
          CFDictionarySetValue(v19, CFSTR("NetworkInfoRemoteRTP"), v59);
        }
        FigCFDictionaryGetValue();
        if (FigCFEqual())
          CFDictionarySetValue(v19, CFSTR("UseQUIC"), v21);
      }
      else
      {
        v49 = 0;
      }
      v60 = (const __CFDictionary *)CFDictionaryGetValue(TypedValue, CFSTR("streamConnectionTypeRTCP"));
      if (v60)
      {
        v61 = v60;
        v62 = CFGetTypeID(v60);
        if (v62 != CFDictionaryGetTypeID())
        {
          v75 = -6756;
          goto LABEL_299;
        }
        if (CFDictionaryContainsKey(v61, CFSTR("streamConnectionKeyPort")))
        {
          CFDictionaryGetInt64();
          appended = CFDictionarySetInt64();
          if (appended)
          {
LABEL_305:
            APSLogErrorAt();
            v49 = 0;
            v111 = 0;
            goto LABEL_306;
          }
        }
        v111 = 1;
      }
      else
      {
        v111 = 0;
      }
      v63 = (const __CFDictionary *)CFDictionaryGetValue(TypedValue, CFSTR("streamConnectionTypeMediaDataControl"));
      if (!v63)
      {
LABEL_306:
        v57 = 0;
        v8 = &unk_2553CD000;
        v28 = v113;
LABEL_307:
        DataStreamSecurityKeys = appended;
        if (!appended)
        {
          if (v49)
          {
            if (v49 == 1095778640)
            {
              if (v28 == 103)
              {
                v49 = 1095778640;
                CFDictionarySetInt64();
                v77 = 0;
                goto LABEL_316;
              }
              APSLogErrorAt();
              DataStreamSecurityKeys = -6735;
              v108 = v8[526];
              if (v108 > 90 || v108 == -1 && !_LogCategory_Initialize())
                goto LABEL_424;
LABEL_449:
              LogPrintF();
              goto LABEL_424;
            }
          }
          else
          {
            if (v111)
            {
              APSLogErrorAt();
              DataStreamSecurityKeys = -6711;
              v109 = v8[526];
              if (v109 > 90 || v109 == -1 && !_LogCategory_Initialize())
                goto LABEL_424;
              goto LABEL_449;
            }
            v49 = 0;
            v111 = 0;
          }
LABEL_314:
          CFDictionarySetInt64();
          v77 = v28 == 96;
          if (v28 == 96)
          {
            v114 = 0;
            goto LABEL_318;
          }
          if (v28 != 103)
          {
            v81 = v8[526];
            if (v81 <= 60 && (v81 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            v72 = 0;
            DataStreamSecurityKeys = -6735;
            goto LABEL_347;
          }
LABEL_316:
          *(_DWORD *)(a1 + 552) = 120;
          *(_QWORD *)(a1 + 520) = 120 * UpTicksPerSecond();
          SocketSetKeepAlive();
          FigCFDictionarySetValueFromKeyInDict();
          v114 = 1;
LABEL_318:
          *(_OWORD *)v125 = *(_OWORD *)(a1 + 224);
          *(_OWORD *)&v125[12] = *(_OWORD *)(a1 + 236);
          DataStreamSecurityKeys = APReceiverAudioSessionCreate(v28, v125, v19, (uint64_t *)&cf);
          if (!DataStreamSecurityKeys)
          {
            if (CFDictionaryContainsKey(theDict, CFSTR("pkdDeviceContext")))
            {
              v72 = APReceiverAudioSessionCopyProperty((const __CFNumber *)cf, v78, CFSTR("PKDReceiverContext"), v79, &DataStreamSecurityKeys);
              if (DataStreamSecurityKeys)
              {
LABEL_426:
                APSLogErrorAt();
                goto LABEL_347;
              }
              if (v72)
                CFDictionarySetValue(theDicta, CFSTR("pkdDeviceContext"), v72);
            }
            else
            {
              v72 = 0;
            }
            if (!*(_BYTE *)(a1 + 458)
              || (DataStreamSecurityKeys = APReceiverAudioSessionPlatformControl(cf, CFSTR("RASP::StartSession"))) == 0)
            {
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 568), key, cf);
              v80 = v8[526];
              if (v80 <= 50 && (v80 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              if ((v115 & 1) != 0)
              {
                _UpdateActiveSessionRegistration((uint64_t *)a1);
              }
              else
              {
                v82 = v57;
                v83 = *(const void **)(a1 + 576);
                if (!v83)
                {
                  AirPlayReceiverSessionPlatformControl((_QWORD *)a1, CFSTR("handleMediaAudioStartingForSession"));
                  _UpdateActiveSessionRegistration((uint64_t *)a1);
                  v83 = *(const void **)(a1 + 576);
                }
                v84 = cf;
                if (cf)
                  CFRetain(cf);
                *(_QWORD *)(a1 + 576) = v84;
                if (v83)
                  CFRelease(v83);
                v57 = v82;
                if (*(_BYTE *)(a1 + 700))
                {
                  v85 = v8[526];
                  if (v85 <= 50 && (v85 != -1 || _LogCategory_Initialize()))
                    LogPrintF();
                  v86 = cf;
                  CMTimeMakeWithSeconds(&v118, *(Float64 *)(a1 + 704), 1000);
                  APReceiverAudioSessionApplyVolumeFade((uint64_t)v86, 1, &v118);
                  *(_BYTE *)(a1 + 700) = 0;
                }
              }
              if (*(_QWORD *)(a1 + 384))
              {
                if (cf)
                {
                  v87 = (void (*)(_QWORD, uint64_t, uint64_t))*((_QWORD *)cf + 8);
                  if (v87)
                    v87(*((_QWORD *)cf + 5), a1 + 392, a1 + 408);
                }
              }
              *(_DWORD *)(a1 + 584) = CFObjectGetPropertyInt64Sync();
              v88 = (const __CFNumber *)cf;
              if (!v44)
              {
                *(_DWORD *)v125 = 0;
                if (v49 == 1381257248)
                {
                  Int64 = key;
                  v27 = theDicta;
                  if (v111 && !v57)
                  {
                    CFObjectGetPropertyInt64Sync();
                    if (*(_DWORD *)v125)
                    {
                      APSLogErrorAt();
                    }
                    else
                    {
                      CFObjectGetPropertyInt64Sync();
                      CFDictionarySetInt64();
                      CFDictionarySetInt64();
                    }
                    DataStreamSecurityKeys = *(_DWORD *)v125;
                    v8 = (_DWORD *)&unk_2553CD000;
                    if (*(_DWORD *)v125)
                      goto LABEL_404;
LABEL_388:
                    CFDictionarySetInt64();
                    if (v77)
                    {
                      CFObjectGetPropertyInt64Sync();
                      DataStreamSecurityKeys = CFDictionarySetInt64();
                      if (DataStreamSecurityKeys)
                        goto LABEL_404;
                    }
                    if (v114)
                    {
                      CFObjectGetPropertyInt64Sync();
                      CFDictionarySetInt64();
                    }
                    DataStreamSecurityKeys = _AddResponseStream(v110, v27);
                    if (DataStreamSecurityKeys)
                      goto LABEL_404;
                    v101 = v8[526];
                    if (v101 <= 50 && (v101 != -1 || _LogCategory_Initialize()))
                      LogPrintF();
                    if (*(_BYTE *)(a1 + 458))
                    {
                      if (cf)
                      {
                        v102 = (uint64_t (*)(_QWORD))*((_QWORD *)cf + 9);
                        if (v102)
                        {
                          DataStreamSecurityKeys = v102(*((_QWORD *)cf + 5));
                          if (!DataStreamSecurityKeys)
                            goto LABEL_405;
                          goto LABEL_404;
                        }
                        v103 = -12782;
                      }
                      else
                      {
                        APSLogErrorAt();
                        v103 = -72152;
                      }
                      DataStreamSecurityKeys = v103;
LABEL_404:
                      APSLogErrorAt();
                    }
LABEL_405:
                    CFRelease(v27);
                    v74 = DataStreamSecurityKeys;
                    if (!DataStreamSecurityKeys)
                      goto LABEL_407;
                    goto LABEL_406;
                  }
                }
                else
                {
                  Int64 = key;
                  v27 = theDicta;
                }
                APSLogErrorAt();
                DataStreamSecurityKeys = -6705;
                v8 = (_DWORD *)&unk_2553CD000;
                goto LABEL_404;
              }
              v116 = v77;
              *(_DWORD *)v125 = 0;
              v89 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
              v90 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              if (!v90)
              {
                APSLogErrorAt();
                DataStreamSecurityKeys = -6728;
                v27 = theDicta;
                goto LABEL_428;
              }
              v91 = v90;
              if (v88)
              {
                if (!v49)
                  goto LABEL_375;
                v92 = CFDictionaryCreateMutable(v89, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                if (v92)
                {
                  v93 = v92;
                  CFObjectGetPropertyInt64Sync();
                  if (*(_DWORD *)v125 || (*(_DWORD *)v125 = CFDictionarySetInt64()) != 0)
                  {
                    APSLogErrorAt();
                    v8 = &unk_2553CD000;
                    Int64 = key;
LABEL_386:
                    v27 = theDicta;
                    CFRelease(v91);
                    v91 = v93;
                    goto LABEL_387;
                  }
                  v96 = APReceiverAudioSessionCopyProperty(v88, v94, CFSTR("AudioNetworkInfo"), v95, 0);
                  if (v96)
                  {
                    v97 = v96;
                    CFDictionarySetValue(v93, CFSTR("streamConnectionKeyNetworkInfo"), v96);
                    CFRelease(v97);
                  }
                  if (v49 == 1095778640)
                    v98 = CFSTR("streamConnectionTypeAPAP");
                  else
                    v98 = CFSTR("streamConnectionTypeRTP");
                  CFDictionarySetValue(v91, v98, v93);
                  CFRelease(v93);
LABEL_375:
                  Int64 = key;
                  if (v111)
                  {
                    v99 = CFDictionaryCreateMutable(v89, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    if (!v99)
                    {
LABEL_441:
                      APSLogErrorAt();
                      *(_DWORD *)v125 = -6728;
                      v8 = (_DWORD *)&unk_2553CD000;
                      goto LABEL_442;
                    }
                    v93 = v99;
                    CFObjectGetPropertyInt64Sync();
                    if (*(_DWORD *)v125 || (*(_DWORD *)v125 = CFDictionarySetInt64()) != 0)
                    {
LABEL_443:
                      APSLogErrorAt();
                      v8 = (_DWORD *)&unk_2553CD000;
                      goto LABEL_386;
                    }
                    CFDictionarySetValue(v91, CFSTR("streamConnectionTypeRTCP"), v93);
                    CFRelease(v93);
                  }
                  if (!v57)
                  {
LABEL_385:
                    v27 = theDicta;
                    CFDictionarySetValue(theDicta, CFSTR("streamConnections"), v91);
                    v8 = (_DWORD *)&unk_2553CD000;
                    goto LABEL_387;
                  }
                  v100 = CFDictionaryCreateMutable(v89, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  if (v100)
                  {
                    v93 = v100;
                    CFObjectGetPropertyInt64Sync();
                    if (!*(_DWORD *)v125)
                    {
                      *(_DWORD *)v125 = CFDictionarySetInt64();
                      if (!*(_DWORD *)v125)
                      {
                        CFDictionarySetValue(v91, CFSTR("streamConnectionTypeMediaDataControl"), v93);
                        CFRelease(v93);
                        goto LABEL_385;
                      }
                    }
                    goto LABEL_443;
                  }
                  goto LABEL_441;
                }
                APSLogErrorAt();
                v107 = -6728;
              }
              else
              {
                APSLogErrorAt();
                v107 = -6718;
              }
              *(_DWORD *)v125 = v107;
              v8 = (_DWORD *)&unk_2553CD000;
              Int64 = key;
LABEL_442:
              v27 = theDicta;
LABEL_387:
              CFRelease(v91);
              DataStreamSecurityKeys = *(_DWORD *)v125;
              v77 = v116;
              if (!*(_DWORD *)v125)
                goto LABEL_388;
LABEL_428:
              APSLogErrorAt();
              v8 = (_DWORD *)&unk_2553CD000;
              Int64 = key;
              goto LABEL_405;
            }
            goto LABEL_426;
          }
          APSLogErrorAt();
LABEL_424:
          v72 = 0;
LABEL_347:
          Int64 = key;
          goto LABEL_348;
        }
        goto LABEL_300;
      }
      v64 = v63;
      v65 = CFGetTypeID(v63);
      v28 = v113;
      if (v65 == CFDictionaryGetTypeID())
      {
        v66 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD690]);
        if (v66)
        {
          v67 = v66;
          v68 = CFDictionaryGetInt64();
          v69 = CFDictionaryContainsKey(v64, CFSTR("streamConnectionKeyEncryptionSeed"));
          if (v68)
          {
            if (v69)
            {
              APSLogErrorAt();
              v49 = 0;
              v111 = 0;
              v57 = 0;
              appended = -6711;
              goto LABEL_132;
            }
            if (v43)
            {
              appended = CFArrayAppendBytes();
              if (appended)
              {
LABEL_304:
                APSLogErrorAt();
                v49 = 0;
                v111 = 0;
                v57 = 0;
                goto LABEL_132;
              }
            }
          }
          else if (v69)
          {
            v70 = CFDictionaryGetInt64();
            appended = _GetDataStreamSecurityKeys(a1, v70, 32, (uint64_t)v124, (uint64_t)v125);
            if (appended)
              goto LABEL_304;
            appended = CFArrayAppendBytes();
            if (appended)
              goto LABEL_304;
            appended = CFArrayAppendBytes();
            if (appended)
              goto LABEL_304;
          }
          CFDictionarySetValue(v19, CFSTR("MediaDataControl"), v67);
          v57 = 1;
LABEL_132:
          v8 = (_DWORD *)&unk_2553CD000;
          CFRelease(v67);
          goto LABEL_307;
        }
        v75 = -6728;
      }
      else
      {
        v75 = -6756;
      }
LABEL_299:
      APSLogErrorAt();
      DataStreamSecurityKeys = v75;
      v8 = (_DWORD *)&unk_2553CD000;
LABEL_300:
      Int64 = key;
      v27 = theDicta;
LABEL_301:
      APSLogErrorAt();
      goto LABEL_302;
    }
    APSLogErrorAt();
LABEL_284:
    v19 = 0;
    v72 = 0;
    v73 = -6719;
    goto LABEL_285;
  }
  v9 = 0;
  *(_QWORD *)v125 = 0;
  while (1)
  {
    if (v9)
      CFRelease(v9);
    v10 = RandomBytes();
    if (v10)
    {
      v71 = v10;
      APSLogErrorAt();
      goto LABEL_154;
    }
    v11 = CFNumberCreateInt64();
    if (!v11)
      break;
    v9 = (const void *)v11;
  }
  APSLogErrorAt();
  v71 = -6728;
LABEL_154:
  DataStreamSecurityKeys = v71;
  APSLogErrorAt();
  Int64 = 0;
  v19 = 0;
  v72 = 0;
LABEL_407:
  if (value)
    CFRelease(value);
  if (v72)
    CFRelease(v72);
  if (cf)
    CFRelease(cf);
  if (v19)
    CFRelease(v19);
  if (Int64)
    CFRelease(Int64);
  result = DataStreamSecurityKeys;
  if (DataStreamSecurityKeys)
  {
    v105 = v8[526];
    if (v105 <= 60)
    {
      if (v105 != -1 || (v106 = _LogCategory_Initialize(), result = DataStreamSecurityKeys, v106))
      {
        LogPrintF();
        return DataStreamSecurityKeys;
      }
    }
  }
  return result;
}

void _ScreenHandleEvent(int a1, CFTypeRef cf1, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  _QWORD block[5];

  if (CFEqual(cf1, CFSTR("SessionTerminated")))
  {
    FigCFDictionaryGetInt32IfPresent();
    if (gLogCategory_AirPlayReceiverCore <= 30
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (CFEqual(cf1, CFSTR("ForceKeyFrameNeeded")))
  {
    if (gLogCategory_AirPlayReceiverCore <= 40
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFRetain(a4);
    v6 = a4[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ScreenHandleEvent_block_invoke;
    block[3] = &__block_descriptor_tmp_489;
    block[4] = a4;
    dispatch_async(v6, block);
  }
}

uint64_t _GetDataStreamSecurityKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, _QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _BYTE *v16;

  if (!*(_QWORD *)(a1 + 488))
  {
    APSLogErrorAt();
    return 4294960587;
  }
  v9 = (int)ASPrintF();
  if (a5)
  {
    v10 = *(_QWORD *)(a1 + 488);
    v11 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (!v11)
    {
      v15 = 4294954514;
      goto LABEL_12;
    }
    v12 = v11(v10, 0, v9, "DataStream-Output-Encryption-Key", 32, 32, a5);
    if ((_DWORD)v12)
    {
      v15 = v12;
      goto LABEL_12;
    }
  }
  if (!a4)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v13 = *(_QWORD *)(a1 + 488);
  v14 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v14)
  {
    v15 = v14(v13, 0, v9, "DataStream-Input-Encryption-Key", 31, a3, a4);
    if (!(_DWORD)v15)
      goto LABEL_13;
  }
  else
  {
    v15 = 4294954514;
  }
LABEL_12:
  APSLogErrorAt();
LABEL_13:
  v16 = 0;
  if ((_DWORD)v9)
  {
    do
    {
      *v16++ = 0;
      --v9;
    }
    while (v9);
  }
  return v15;
}

uint64_t _AddResponseStream(__CFDictionary *a1, const void *a2)
{
  __CFArray *TypedValue;
  __CFArray *Mutable;
  __CFArray *v6;

  CFArrayGetTypeID();
  TypedValue = (__CFArray *)CFDictionaryGetTypedValue();
  if (TypedValue)
  {
    CFArrayAppendValue(TypedValue, a2);
    return 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v6 = Mutable;
    CFArrayAppendValue(Mutable, a2);
    CFDictionarySetValue(a1, CFSTR("streams"), v6);
    CFRelease(v6);
    return 0;
  }
  APSLogErrorAt();
  return 4294960568;
}

uint64_t _ScreenStart(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  CFMutableDictionaryRef Mutable;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, CFMutableDictionaryRef, CFDictionaryRef *);
  uint64_t v8;
  __CFDictionary *v9;
  const void *Value;
  const void *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, __CFDictionary *);
  CFDictionaryRef theDict;
  _QWORD block[6];
  int v17;
  _QWORD v18[6];

  theDict = 0;
  if (*(_BYTE *)(a1 + 632))
    return 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 160);
  v3 = *(_DWORD *)(a1 + 608);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[4] = 0;
  v18[5] = 0;
  v18[3] = &unk_21E1DFD69;
  v4 = *(NSObject **)(v2 + 576);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __APReceiverSystemInfoGetDisplaySizeForUserVersion_block_invoke;
  block[3] = &unk_24E21E8E0;
  block[4] = v18;
  block[5] = v2;
  v17 = v3;
  dispatch_sync(v4, block);
  _Block_object_dispose(v18, 8);
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_QWORD *)(a1 + 600))
  {
    theDict = 0;
    goto LABEL_23;
  }
  if (*(_BYTE *)(a1 + 633))
    goto LABEL_23;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetNumber();
  v6 = *(_QWORD *)(a1 + 600);
  v7 = *(uint64_t (**)(uint64_t, CFMutableDictionaryRef, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 32);
  if (v7)
  {
    v8 = v7(v6, Mutable, &theDict);
    if (!(_DWORD)v8)
    {
      *(_BYTE *)(a1 + 633) = 1;
      *(_DWORD *)(a1 + 636) = CFDictionaryGetInt64();
      if (!Mutable)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v8 = 4294954514;
  }
  APSLogErrorAt();
  if (Mutable)
LABEL_11:
    CFRelease(Mutable);
LABEL_12:
  if ((_DWORD)v8)
  {
    if (gLogCategory_AirPlayReceiverCore <= 60
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APSLogErrorAt();
    v9 = 0;
    goto LABEL_34;
  }
LABEL_23:
  v9 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v9)
  {
    APSLogErrorAt();
    v8 = 4294960568;
    goto LABEL_34;
  }
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("presentationLayer"));
    if (Value)
      CFDictionarySetValue(v9, CFSTR("PresentationLayer"), Value);
    v11 = CFDictionaryGetValue(theDict, CFSTR("presentationContext"));
    if (v11)
      CFDictionarySetValue(v9, CFSTR("PresentationContext"), v11);
  }
  FigCFDictionarySetCGSize();
  v12 = *(_QWORD *)(a1 + 616);
  v13 = *(uint64_t (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v13)
  {
    v8 = 4294954514;
    goto LABEL_33;
  }
  v8 = v13(v12, v9);
  if ((_DWORD)v8)
  {
LABEL_33:
    APSLogErrorAt();
    goto LABEL_34;
  }
  *(_BYTE *)(a1 + 632) = 1;
LABEL_34:
  if (theDict)
    CFRelease(theDict);
  if (v9)
    CFRelease(v9);
  if ((_DWORD)v8)
  {
    if (gLogCategory_AirPlayReceiverCore <= 60
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _ScreenTearDown(a1);
  }
  return v8;
}

void _PlaybackV2EventCallback(_QWORD *a1, const void *a2, const void *a3)
{
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  NSObject *v8;
  _QWORD block[7];

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = Mutable;
  if (a3)
    CFDictionarySetValue(Mutable, CFSTR("params"), a3);
  if (a2)
    CFRetain(a2);
  CFRetain(a1);
  v8 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___PlaybackV2EventCallback_block_invoke;
  block[3] = &__block_descriptor_tmp_568;
  block[4] = a1;
  block[5] = a2;
  block[6] = v7;
  dispatch_async(v8, block);
}

uint64_t _PlaybackV2TLSInfoRequestCallback(uint64_t a1, uint64_t a2, CFMutableDictionaryRef *a3)
{
  uint64_t v3;
  uint64_t (*v5)(uint64_t, const char *, uint64_t, _QWORD, _QWORD, uint64_t, _BYTE *);
  CFMutableDictionaryRef Mutable;
  char __s[128];
  _BYTE v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 488);
  if (v3)
  {
    v5 = *(uint64_t (**)(uint64_t, const char *, uint64_t, _QWORD, _QWORD, uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v5)
    {
      v3 = v5(v3, "Pair-TLS-PSK", 12, 0, 0, 16, v9);
      if (!(_DWORD)v3)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionarySetData();
        __s[0] = 0;
        SockAddrToString();
        strlen(__s);
        CFDictionarySetData();
        *a3 = Mutable;
        return v3;
      }
    }
    else
    {
      v3 = 4294954514;
    }
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverCore <= 90
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v3;
}

void _HandleRemoteControlSessionFailed(_QWORD *a1, const void *a2, int a3)
{
  NSObject *v6;
  _QWORD block[6];
  int v8;

  CFRetain(a1);
  CFRetain(a2);
  v6 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___HandleRemoteControlSessionFailed_block_invoke;
  block[3] = &__block_descriptor_tmp_596;
  block[4] = a1;
  block[5] = a2;
  v8 = a3;
  dispatch_async(v6, block);
}

void _SendRemoteControlSessionOutgoingMessage(_QWORD *a1, uint64_t a2, const void *a3)
{
  uint64_t (*v6)(uint64_t, const __CFString *, _QWORD, CFTypeRef *);
  int v7;
  NSObject *v8;
  _QWORD block[8];
  CFTypeRef v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v10 = 0;
  v6 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
  if (!v6)
  {
    *((_DWORD *)v12 + 6) = -12782;
    goto LABEL_7;
  }
  v7 = v6(a2, CFSTR("RRCS::Property::SessionID"), *MEMORY[0x24BDBD240], &v10);
  *((_DWORD *)v12 + 6) = v7;
  if (v7)
  {
LABEL_7:
    APSLogErrorAt();
    goto LABEL_10;
  }
  if (gLogCategory_AirPlayReceiverCore <= 30
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(a1);
  CFRetain(v10);
  CFRetain(a3);
  v8 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___SendRemoteControlSessionOutgoingMessage_block_invoke;
  block[3] = &unk_24E220300;
  block[4] = &v11;
  block[5] = a1;
  block[6] = v10;
  block[7] = a3;
  dispatch_async(v8, block);
LABEL_10:
  if (v10)
    CFRelease(v10);
  _Block_object_dispose(&v11, 8);
}

void AirPlayReceiverSessionTearDown(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  BOOL *v4;
  _DWORD *v8;
  int v9;
  const __CFArray *TypedValue;
  CFIndex Count;
  uint64_t v12;
  const __CFDictionary *TypedValueAtIndex;
  void *Value;
  int Int64;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t DerivedStorage;
  int v22;
  uint64_t v23;
  const void *v24;
  int v25;
  BOOL *v26;
  uint64_t v27;

  v4 = a4;
  if (!*(_BYTE *)(a1 + 441))
  {
    v8 = &unk_2553CD000;
    v9 = gLogCategory_AirPlayReceiverCore;
    if (gLogCategory_AirPlayReceiverCore <= 30)
    {
      if (gLogCategory_AirPlayReceiverCore != -1)
        goto LABEL_4;
      if (_LogCategory_Initialize())
      {
        v9 = gLogCategory_AirPlayReceiverCore;
LABEL_4:
        if (v9 == -1)
          _LogCategory_Initialize();
        LogPrintF();
        if (!a2)
          goto LABEL_61;
LABEL_11:
        CFArrayGetTypeID();
        TypedValue = (const __CFArray *)CFDictionaryGetTypedValue();
        if (TypedValue)
        {
          Count = CFArrayGetCount(TypedValue);
          if (Count >= 1)
          {
            v26 = v4;
            v12 = 0;
            while (1)
            {
              CFDictionaryGetTypeID();
              TypedValueAtIndex = (const __CFDictionary *)CFArrayGetTypedValueAtIndex();
              Value = (void *)CFDictionaryGetValue(TypedValueAtIndex, CFSTR("streamID"));
              Int64 = CFDictionaryGetInt64();
              v16 = v8[526];
              if (v16 <= 50 && (v16 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              if (Int64 <= 109)
              {
                if (Int64 == 96 || Int64 == 103)
                {
                  if (!Value)
                    Value = (void *)CFNumberGetObject();
                  _AudioTearDownStream(a1, (uint64_t)TypedValueAtIndex, Value, a3);
                  goto LABEL_54;
                }
                goto LABEL_36;
              }
              if (Int64 != 110)
                break;
              _ScreenTearDown(a1);
LABEL_54:
              if (Count == ++v12)
              {
                Count = 1;
                v4 = v26;
                if (!v26)
                  return;
LABEL_63:
                *v4 = Count == 0;
                return;
              }
            }
            if (Int64 != 120)
            {
              if (Int64 == 130)
              {
                if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 712), Value))
                  _PlaybackV2TearDown(a1, Value);
                else
                  _RemoteControlSessionTearDown(a1, Value);
                goto LABEL_54;
              }
LABEL_36:
              v22 = v8[526];
              if (v22 > 50 || v22 == -1 && !_LogCategory_Initialize())
                goto LABEL_54;
LABEL_52:
              LogPrintF();
              goto LABEL_54;
            }
            if (!*(_BYTE *)(a1 + 441))
            {
              if (Value)
              {
                v17 = CFGetInt64();
                if (v17)
                {
                  v18 = a3;
                  v19 = *(_QWORD *)(a1 + 24);
                  v20 = *(_QWORD *)(a1 + 32);
                  DerivedStorage = CMBaseObjectGetDerivedStorage();
                  v27 = 0;
                  if (gLogCategory_APReceiverRequestProcessorAirPlay <= 50
                    && (gLogCategory_APReceiverRequestProcessorAirPlay != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                  if (v19 && (v23 = CFNumberCreateInt64()) != 0)
                  {
                    v24 = (const void *)v23;
                    airplayReqProcessor_GetMCRPForMCSession(v20, v17, &v27);
                    if (v27 && !airplayReqProcessor_tearDownMediaControlRequestProcessor(v20, v27))
                    {
                      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(DerivedStorage + 104), v24);
                      CFRelease(v24);
                      CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 720), Value);
                      if (!CFSetGetCount(*(CFSetRef *)(a1 + 720)))
                        _UpdateActiveSessionRegistration((uint64_t *)a1);
                      a3 = v18;
                      v8 = &unk_2553CD000;
LABEL_50:
                      v25 = v8[526];
                      if (v25 > 50 || v25 == -1 && !_LogCategory_Initialize())
                        goto LABEL_54;
                      goto LABEL_52;
                    }
                    APSLogErrorAt();
                    CFRelease(v24);
                  }
                  else
                  {
                    APSLogErrorAt();
                  }
                  a3 = v18;
                  APSLogErrorAt();
                  v8 = (_DWORD *)&unk_2553CD000;
                  goto LABEL_50;
                }
              }
            }
            APSLogErrorAt();
            goto LABEL_50;
          }
LABEL_62:
          _Cleanup(a1, a3);
          if (!v4)
            return;
          goto LABEL_63;
        }
LABEL_61:
        Count = 0;
        goto LABEL_62;
      }
    }
    if (!a2)
      goto LABEL_61;
    goto LABEL_11;
  }
  Count = 0;
  if (a4)
    goto LABEL_63;
}

void _HandleEventConnectionInvalidated(int a1, NSObject **cf)
{
  NSObject *v4;
  _QWORD v5[5];
  int v6;

  if (cf)
  {
    CFRetain(cf);
    v4 = cf[2];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___HandleEventConnectionInvalidated_block_invoke;
    v5[3] = &__block_descriptor_tmp_295;
    v5[4] = cf;
    v6 = a1;
    dispatch_async(v4, v5);
    CFRelease(cf);
  }
  else if (gLogCategory_AirPlayReceiverCore <= 50
         && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void _PerformPeriodTasks(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  const void *v7;

  v2 = mach_absolute_time();
  v3 = v2;
  v4 = *(_DWORD *)(a1 + 500);
  if (v4 != *(_DWORD *)(a1 + 504))
  {
    *(_DWORD *)(a1 + 504) = v4;
    *(_QWORD *)(a1 + 512) = v2;
    *(_QWORD *)(a1 + 528) = v2;
    _ReportSessionStallIfNeeded(a1, 0);
    return;
  }
  v5 = v2 - *(_QWORD *)(a1 + 512);
  if (v5 >= 60 * UpTicksPerSecond())
  {
    v6 = 2;
    goto LABEL_7;
  }
  if (v5 >= 10 * UpTicksPerSecond())
  {
    v6 = 1;
LABEL_7:
    _ReportSessionStallIfNeeded(a1, v6);
  }
  if (v3 - *(_QWORD *)(a1 + 528) > *(_QWORD *)(a1 + 544))
  {
    UpTicksPerSecond();
    if (gLogCategory_AirPlayReceiverCore <= 40
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_QWORD *)(a1 + 528) = v3;
    if (IsAppleInternalBuild())
    {
      v7 = (const void *)CFStringCreateF();
      AirPlayReceiverServerPlatformControl(*(_QWORD *)(a1 + 24), CFSTR("triggerStackShot"), v7, 0);
      if (v7)
        CFRelease(v7);
    }
  }
  if (v5 > *(_QWORD *)(a1 + 520))
  {
    if (gLogCategory_AirPlayReceiverCore <= 90
      && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _AirPlayReceiverSession_Terminate(a1);
  }
}

uint64_t AirPlayReceiverSessionFlushAudio(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _OWORD *, uint64_t, _OWORD *);
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  _OWORD v11[2];

  if (!a1)
  {
    APSLogErrorAt();
    return 4294895144;
  }
  v5 = *(_QWORD *)(a1 + 576);
  if (!v5)
  {
    APSLogErrorAt();
    return 4294960578;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, _OWORD *))(v5 + 88);
  if (!v6)
  {
    v8 = 4294954514;
LABEL_7:
    APSLogErrorAt();
    return v8;
  }
  v7 = *(_QWORD *)(v5 + 40);
  v11[0] = *a3;
  *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)((char *)a3 + 12);
  v10[0] = *a5;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)a5 + 12);
  v8 = v6(v7, a2, v11, a4, v10);
  if ((_DWORD)v8)
    goto LABEL_7;
  return v8;
}

uint64_t _AddVolumeOrMuteRequest(uint64_t a1, void *value)
{
  __CFArray *Mutable;
  uint64_t result;

  if (!value)
  {
    APSLogErrorAt();
    return 4294960591;
  }
  Mutable = *(__CFArray **)(a1 + 680);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    *(_QWORD *)(a1 + 680) = Mutable;
    if (!Mutable)
    {
      APSLogErrorAt();
      return 4294960568;
    }
  }
  CFArrayAppendValue(Mutable, value);
  if (gLogCategory_AirPlayReceiverCore > 50)
    return 0;
  if (gLogCategory_AirPlayReceiverCore != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
  {
    LogPrintF();
    return 0;
  }
  return result;
}

uint64_t AirPlayReceiverSessionAddMuteRequest(uint64_t a1, int a2)
{
  char v2;
  void **v4;
  uint64_t v5;

  v2 = a2;
  v4 = (void **)MEMORY[0x24BDBD270];
  if (!a2)
    v4 = (void **)MEMORY[0x24BDBD268];
  v5 = _AddVolumeOrMuteRequest(a1, *v4);
  if ((_DWORD)v5)
    APSLogErrorAt();
  else
    *(_BYTE *)(a1 + 692) = v2;
  return v5;
}

uint64_t _RemoveVolumeOrMuteRequest(uint64_t a1, uint64_t a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v6;
  const void *ValueAtIndex;

  v3 = *(const __CFArray **)(a1 + 680);
  if (!v3)
    return 4294960569;
  Count = CFArrayGetCount(v3);
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Count < 1)
    return 4294960569;
  v6 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 680), v6);
    if ((*(unsigned int (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex))
      break;
    if (Count == ++v6)
      return 4294960569;
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 680), v6);
  return 0;
}

void AirPlayReceiverSessionHandleVolumeUpdate(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t Int64;
  int v5;
  uint64_t v6;
  float v7;
  unsigned int Int64Ranged;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v10;
  const void **v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t, CFTypeRef);
  void *v14;
  uint64_t v15;
  float v16;

  CFDictionaryGetDouble();
  v3 = v2;
  Int64 = CFDictionaryGetInt64();
  v5 = Int64 != 0;
  v6 = CFDictionaryGetInt64();
  if (!*(_BYTE *)(a1 + 441))
  {
    v7 = v3;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    if (v6)
    {
      v13 = (uint64_t (*)(uint64_t, CFTypeRef))__AirPlayReceiverSessionRemoveVolumeRequest_block_invoke;
      v14 = &__block_descriptor_tmp_5838;
      v16 = v7;
    }
    else
    {
      v13 = __AirPlayReceiverSessionRemoveMuteRequest_block_invoke;
      v14 = &__block_descriptor_tmp_169;
      LOBYTE(v16) = Int64 != 0;
    }
    v15 = a1;
    if (_RemoveVolumeOrMuteRequest(a1, (uint64_t)v12))
    {
      if (!APSVolumeSliderValuesAreNoticeablyDifferent() && *(unsigned __int8 *)(a1 + 692) == v5)
      {
        if (gLogCategory_AirPlayReceiverCore <= 50
          && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        return;
      }
      Int64Ranged = CFObjectGetInt64Ranged();
      if (gLogCategory_AirPlayReceiverCore <= 50
        && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!Mutable)
      {
        APSLogErrorAt();
        return;
      }
      v10 = Mutable;
      CFDictionarySetDouble();
      if (*(_BYTE *)(a1 + 730))
      {
        v11 = (const void **)MEMORY[0x24BDBD270];
        if (!Int64)
          v11 = (const void **)MEMORY[0x24BDBD268];
        CFDictionarySetValue(v10, CFSTR("isMuted"), *v11);
      }
      if (Int64Ranged > 0x36193D)
      {
        if (!AirPlayReceiverSessionSendMediaRemoteCommand((_QWORD *)a1, -1, 1685482595, v10))
        {
          if (gLogCategory_AirPlayReceiverCore > 50
            || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_32;
          }
LABEL_28:
          LogPrintF();
LABEL_32:
          *(float *)(a1 + 688) = v7;
          *(_BYTE *)(a1 + 692) = v5;
LABEL_33:
          CFRelease(v10);
          return;
        }
      }
      else if (!AirPlayReceiverServerSendDACPCommands())
      {
        if (gLogCategory_AirPlayReceiverCore > 50
          || gLogCategory_AirPlayReceiverCore == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      APSLogErrorAt();
      goto LABEL_33;
    }
  }
}

uint64_t APReceiverRequestProcessorCopyProperty_5846(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 0;
}

uint64_t APNetworkClockNTPClientLegacyCreate(uint64_t a1, int a2, int a3, uint64_t a4, int a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t DerivedStorage;
  uint64_t v12;
  uint64_t Instance;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  CFTypeRef v20;
  CFTypeID v21;
  uint64_t v22;
  socklen_t Size;
  int v24;
  uint64_t v25;
  uint64_t v26;
  socklen_t v28;
  sockaddr v29;
  uint64_t v30;
  int v31;
  sockaddr v32[2];

  APSNetworkClockGetClassID();
  v10 = CMDerivedObjectCreate();
  if ((_DWORD)v10)
  {
    v26 = v10;
LABEL_57:
    APSLogErrorAt();
    return v26;
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_BYTE *)(DerivedStorage + 24) = 0;
  v12 = FigSimpleMutexCreate();
  *(_QWORD *)DerivedStorage = v12;
  if (!v12)
  {
    APSLogErrorAt();
    return 4294895326;
  }
  pthread_once(&gAirTunesRegisterClassOnce, (void (*)(void))_AirTunesClock_RegisterClass);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt();
    v26 = 4294960568;
    goto LABEL_57;
  }
  v14 = Instance;
  *(_DWORD *)(Instance + 16) = 0;
  *(_QWORD *)(Instance + 24) = 0;
  *(_DWORD *)(Instance + 32) = 0;
  *(_QWORD *)(Instance + 40) = 0;
  *(_DWORD *)(Instance + 48) = 0;
  *(_QWORD *)(Instance + 56) = 0;
  v15 = UpTicksPerSecond();
  *(_QWORD *)(v14 + 64) = v15;
  *(_QWORD *)(v14 + 72) = 0xFFFFFFFFFFFFFFFFLL / v15;
  *(_DWORD *)(v14 + 80) = 0;
  *(_OWORD *)(v14 + 88) = 0u;
  *(_OWORD *)(v14 + 104) = 0u;
  *(_QWORD *)(v14 + 120) = 0;
  *(_DWORD *)(v14 + 128) = 1;
  v16 = pthread_mutex_init((pthread_mutex_t *)(v14 + 152), 0);
  if ((_DWORD)v16)
  {
    v26 = v16;
LABEL_45:
    APSLogErrorAt();
    CFRelease((CFTypeRef)v14);
    goto LABEL_57;
  }
  *(_QWORD *)(v14 + 216) = v14 + 152;
  *(_BYTE *)(v14 + 224) = 1;
  v17 = pthread_create((pthread_t *)(v14 + 136), 0, (void *(__cdecl *)(void *))_AirTunesClock_Thread, (void *)v14);
  if ((_DWORD)v17)
  {
    v26 = v17;
    goto LABEL_45;
  }
  *(_QWORD *)(v14 + 144) = v14 + 136;
  if (gLogCategory_AirTunesClock <= 10 && (gLogCategory_AirTunesClock != -1 || _LogCategory_Initialize()))
    LogPrintF();
  *(_QWORD *)(DerivedStorage + 16) = v14;
  if (gLogCategory_APReceiverNTPClient <= 30
    && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (gAPReceiverNTPClientInitOnce != -1)
    dispatch_once_f(&gAPReceiverNTPClientInitOnce, 0, (dispatch_function_t)_APReceiverNTPClientGetTypeID);
  memset(v32, 0, 28);
  v18 = (_OWORD *)_CFRuntimeCreateInstance();
  v19 = v18;
  if (!v18)
  {
    APSLogErrorAt();
    v26 = 4294960568;
    goto LABEL_51;
  }
  v18[19] = 0u;
  v18[20] = 0u;
  v18[17] = 0u;
  v18[18] = 0u;
  v18[15] = 0u;
  v18[16] = 0u;
  v18[13] = 0u;
  v18[14] = 0u;
  v18[11] = 0u;
  v18[12] = 0u;
  v18[9] = 0u;
  v18[10] = 0u;
  v18[7] = 0u;
  v18[8] = 0u;
  v18[5] = 0u;
  v18[6] = 0u;
  v18[3] = 0u;
  v18[4] = 0u;
  v18[1] = 0u;
  v18[2] = 0u;
  v20 = CFRetain((CFTypeRef)v14);
  *((_QWORD *)v19 + 2) = v20;
  if (v20)
  {
    v21 = CFGetTypeID(v20);
    pthread_once(&gAirTunesRegisterClassOnce, (void (*)(void))_AirTunesClock_RegisterClass);
    if (v21 != gAirTunesClockTypeID)
    {
      v26 = 4294895155;
      goto LABEL_50;
    }
  }
  SockAddrCopy();
  v22 = ServerSocketOpen();
  if ((_DWORD)v22)
  {
    v26 = v22;
LABEL_50:
    APSLogErrorAt();
LABEL_51:
    if (gLogCategory_APReceiverNTPClient <= 60
      && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v19)
      CFRelease(v19);
    goto LABEL_57;
  }
  if (a3)
    SocketSetP2P();
  SocketSetPacketTimestamps();
  if (!a2)
    SocketSetQoS();
  *((_DWORD *)v19 + 8) = a5;
  SockAddrSetPort();
  *(sockaddr *)((char *)v19 + 36) = v32[0];
  v19[3] = *(_OWORD *)&v32[0].sa_data[10];
  Size = SockAddrGetSize();
  *((_DWORD *)v19 + 16) = Size;
  if (!connect(*((_DWORD *)v19 + 6), v32, Size))
    goto LABEL_28;
  v24 = *__error();
  if (!v24)
    goto LABEL_33;
  if (*__error())
  {
    LOBYTE(v24) = 0;
  }
  else
  {
LABEL_28:
    *(_QWORD *)&v29.sa_len = 0;
    *(_QWORD *)&v29.sa_data[6] = 0;
    v31 = 0;
    v30 = 0;
    v28 = 28;
    getsockname(*((_DWORD *)v19 + 6), &v29, &v28);
    if (gLogCategory_APReceiverNTPClient <= 50
      && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LOBYTE(v24) = 1;
  }
LABEL_33:
  *((_BYTE *)v19 + 68) = v24;
  v25 = OpenSelfConnectedLoopbackSocket();
  if ((_DWORD)v25)
  {
    v26 = v25;
    goto LABEL_50;
  }
  if (gLogCategory_APReceiverNTPClient <= 30
    && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v26 = 0;
  *(_QWORD *)(DerivedStorage + 8) = v19;
  *a6 = 0;
  return v26;
}

uint64_t ntpClientLegacy_GetSynchronizedNetworkTime(uint64_t a1, _QWORD *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  uint64_t v9;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock(*(pthread_mutex_t **)DerivedStorage);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    v8 = 0;
    v9 = 0;
    AirTunesClock_GetSynchronizedTime(*(_QWORD *)(DerivedStorage + 16), (int *)&v8);
    v4 = 0;
    *((_QWORD *)&v6 + 1) = v8;
    *(_QWORD *)&v6 = v9;
    v5 = v6 >> 32;
    *a2 = 0;
    a2[1] = v5 << 32;
    a2[2] = HIDWORD(v5);
  }
  else
  {
    APSLogErrorAt();
    v4 = 4294895323;
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)DerivedStorage);
  return v4;
}

uint64_t ntpClientLegacy_ConvertUpTicksToNetworkTime(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v10;
  uint64_t v11;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock(*(pthread_mutex_t **)DerivedStorage);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    v10 = 0;
    v11 = 0;
    AirTunesClock_GetSynchronizedTimeNearUpTicks(*(_QWORD *)(DerivedStorage + 16), (int *)&v10, a2);
    v6 = 0;
    *((_QWORD *)&v8 + 1) = v10;
    *(_QWORD *)&v8 = v11;
    v7 = v8 >> 32;
    *a3 = 0;
    a3[1] = v7 << 32;
    a3[2] = HIDWORD(v7);
  }
  else
  {
    APSLogErrorAt();
    v6 = 4294895323;
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)DerivedStorage);
  return v6;
}

uint64_t ntpClientLegacy_ConvertNetworkTimeToUpTicks(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t DerivedStorage;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock(*(pthread_mutex_t **)DerivedStorage);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    *((_QWORD *)&v7 + 1) = *(unsigned int *)(a2 + 16);
    *(_QWORD *)&v7 = *(_QWORD *)(a2 + 8);
    v6 = v7 >> 32;
    v8 = *(_QWORD *)(DerivedStorage + 16);
    v13 = 0;
    v14 = 0;
    AirTunesClock_GetSynchronizedTime(v8, (int *)&v13);
    *((_QWORD *)&v7 + 1) = v13;
    *(_QWORD *)&v7 = v14;
    v9 = mach_absolute_time();
    if ((unint64_t)(v7 >> 32) <= v6)
      v10 = NTPtoUpTicks() + v9;
    else
      v10 = v9 - NTPtoUpTicks();
    v11 = 0;
    *a3 = v10;
  }
  else
  {
    APSLogErrorAt();
    v11 = 4294895323;
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)DerivedStorage);
  return v11;
}

uint64_t ntpClientLegacy_AddOrUpdatePeer()
{
  return 0;
}

uint64_t ntpClientLegacy_RemovePeer()
{
  return 0;
}

uint64_t ntpClientLegacy_SetPeers()
{
  return 0;
}

uint64_t ntpClientLegacy_CopySerializablePeerListForPeer()
{
  return 0;
}

uint64_t ntpClientLegacy_CopySerializableInitialPeerList()
{
  return 0;
}

uint64_t ntpClientLegacy_SetOrUpdateLocalPeerInfo()
{
  return 0;
}

uint64_t ntpClientLegacy_StartForClient()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  timeval v21;
  fd_set v22;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock(*(pthread_mutex_t **)DerivedStorage);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
LABEL_79:
    v8 = 0;
    goto LABEL_67;
  }
  v1 = *(_QWORD *)(DerivedStorage + 8);
  v2 = *(int *)(v1 + 24);
  v21.tv_sec = 0;
  *(_QWORD *)&v21.tv_usec = 0;
  if (!*(_QWORD *)(v1 + 88))
  {
    v17 = 0;
    v18 = DerivedStorage;
    v3 = 0;
    v15 = 0;
    v16 = 0;
    v4 = 0;
    v5 = 0;
    memset(&v22, 0, sizeof(v22));
    while (2)
    {
      v19 = v5;
      v20 = v3;
      v6 = 64;
      while (1)
      {
        v7 = ntpClient_sendRequest(v1);
        if (!(_DWORD)v7)
          break;
        v8 = v7;
        if (gLogCategory_APReceiverNTPClient <= 60
          && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        usleep(0x186A0u);
        if ((_DWORD)v8 != v4)
        {
          v4 = v8;
          if (gLogCategory_APReceiverNTPClient <= 50)
          {
            if (gLogCategory_APReceiverNTPClient != -1 || (v4 = v8, _LogCategory_Initialize()))
            {
              LogPrintF();
              v4 = v8;
            }
          }
        }
        if (!--v6)
        {
          if (gLogCategory_APReceiverNTPClient > 90)
          {
LABEL_65:
            DerivedStorage = v18;
          }
          else
          {
            DerivedStorage = v18;
            if (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize())
              LogPrintF();
          }
          goto LABEL_66;
        }
      }
      while (1)
      {
        if (__darwin_check_fd_set_overflow(v2, &v22, 0))
          v22.fds_bits[v2 >> 5] |= 1 << v2;
        v21.tv_sec = 0;
        v21.tv_usec = 500000;
        v9 = select(v2 + 1, &v22, 0, 0, &v21);
        if (v9 > 0)
          break;
        if (v9)
        {
          if (*__error())
          {
            v10 = *__error();
            if (!v10)
              break;
          }
          else
          {
            v10 = -6700;
          }
        }
        else
        {
          v10 = -6722;
        }
        if (gLogCategory_APReceiverNTPClient <= 60
          && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v10 != 4)
        {
          ++v17;
          v3 = (v20 + 1);
          if (v10 == v19)
          {
            v10 = v19;
          }
          else if (gLogCategory_APReceiverNTPClient <= 50
                 && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_55;
        }
      }
      v11 = ntpClient_receiveResponse();
      if ((_DWORD)v11)
      {
        v8 = v11;
        if ((_DWORD)v11 == 61)
          goto LABEL_65;
        if (gLogCategory_APReceiverNTPClient <= 60
          && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v12 = v19;
        if ((_DWORD)v8 != v19)
        {
          if (gLogCategory_APReceiverNTPClient <= 50
            && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v12 = v8;
        }
        ++v16;
        v3 = (v20 + 1);
        if ((_DWORD)v8 == -6730)
        {
          v10 = v12;
          DrainUDPSocket();
        }
        else
        {
          v10 = v12;
        }
        goto LABEL_55;
      }
      v3 = v20;
      if (v15 <= 1)
      {
        ++v15;
        v10 = v19;
LABEL_55:
        v5 = v10;
        if ((int)v3 < 64)
          continue;
        if (gLogCategory_APReceiverNTPClient > 90)
        {
          v8 = 4294960574;
          goto LABEL_65;
        }
        DerivedStorage = v18;
        if (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize())
          LogPrintF();
        v8 = 4294960574;
        goto LABEL_66;
      }
      break;
    }
    v14 = pthread_create((pthread_t *)(v1 + 80), 0, (void *(__cdecl *)(void *))ntpClient_thread, (void *)v1);
    if ((_DWORD)v14)
    {
      v8 = v14;
      APSLogErrorAt();
      goto LABEL_65;
    }
    *(_QWORD *)(v1 + 88) = v1 + 80;
    DerivedStorage = v18;
    if (gLogCategory_APReceiverNTPClient <= 30
      && (gLogCategory_APReceiverNTPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(v18 + 24) = 1;
    if (gLogCategory_APNetworkClockNTPClientLegacy <= 50
      && (gLogCategory_APNetworkClockNTPClientLegacy != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_79;
  }
  APSLogErrorAt();
  v8 = 4294895154;
LABEL_66:
  APSLogErrorAt();
LABEL_67:
  pthread_mutex_unlock(*(pthread_mutex_t **)DerivedStorage);
  return v8;
}

uint64_t ntpClientLegacy_StopForClient()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  uint64_t v2;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock(*(pthread_mutex_t **)DerivedStorage);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    *(_BYTE *)(DerivedStorage + 24) = 0;
    v1 = APReceiverNTPClientStop(*(_QWORD *)(DerivedStorage + 8));
    if ((_DWORD)v1)
    {
      v2 = v1;
      APSLogErrorAt();
      goto LABEL_8;
    }
    if (gLogCategory_APNetworkClockNTPClientLegacy <= 50
      && (gLogCategory_APNetworkClockNTPClientLegacy != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v2 = 0;
LABEL_8:
  pthread_mutex_unlock(*(pthread_mutex_t **)DerivedStorage);
  return v2;
}

uint64_t ntpClientLegacy_ClearLocalPeerInfo()
{
  return 0;
}

uint64_t ntpClientLegacy_Finalize()
{
  _QWORD *DerivedStorage;
  const void *v1;
  const void *v2;
  uint64_t result;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  v1 = (const void *)DerivedStorage[1];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[1] = 0;
  }
  v2 = (const void *)DerivedStorage[2];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[2] = 0;
  }
  result = FigSimpleMutexDestroy();
  *DerivedStorage = 0;
  return result;
}

__CFString *ntpClientLegacy_CopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<APNTPClientLegacy %p>"), a1);
  return Mutable;
}

uint64_t ntpClientLegacy_CopyProperty(int a1, CFTypeRef cf1, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef *v6;
  uint64_t v7;

  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BE038B0]))
  {
    v6 = (CFTypeRef *)MEMORY[0x24BE038B8];
  }
  else
  {
    if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BE038A8]))
    {
      v7 = 4294954509;
      APSLogErrorAt();
      return v7;
    }
    v6 = (CFTypeRef *)MEMORY[0x24BDBD270];
  }
  v7 = 0;
  *a4 = CFRetain(*v6);
  return v7;
}

uint64_t ntpClientLegacy_SetProperty()
{
  return 4294954509;
}

uint64_t APPairingServicesCoreUtilsCreate(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  if (APPairingServicesGetClassID_sRegisterOnce != -1)
    dispatch_once_f(&APPairingServicesGetClassID_sRegisterOnce, &APPairingServicesGetClassID_sClassID, (dispatch_function_t)pairingServices_registerBaseClass);
  v3 = CMDerivedObjectCreate();
  if ((_DWORD)v3)
  {
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_APPairingServicesCoreUtils <= 50
      && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *a2 = 0;
  }
  return v3;
}

uint64_t coreUtilsPairing_HandleSetup(int a1, const __CFString *a2, int a3, CFDataRef theData, _QWORD *a5, _BYTE *a6)
{
  uint64_t DerivedStorage;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef v18;
  uint64_t v19;
  char buffer[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)buffer = 0u;
  v22 = 0u;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v12 = DerivedStorage;
  if (!a5)
  {
    v19 = 4294895105;
LABEL_49:
    APSLogErrorAt();
    goto LABEL_50;
  }
  *a5 = 0;
  if (!*(_QWORD *)DerivedStorage)
  {
    if (*(_BYTE *)(DerivedStorage + 42))
      v13 = 12;
    else
      v13 = 0;
    if (a3)
      v14 = 16;
    else
      v14 = 134217744;
    if (*(_BYTE *)(DerivedStorage + 43))
      v15 = v14;
    else
      v15 = 0;
    v16 = PairingSessionCreate();
    if ((_DWORD)v16)
    {
      v19 = v16;
      goto LABEL_49;
    }
    if (gLogCategory_APPairingServicesCoreUtils <= 40
      && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v15 | v13)
    {
      PairingSessionSetFlags();
      if (gLogCategory_APPairingServicesCoreUtils <= 40
        && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    if (*(_QWORD *)(v12 + 48))
    {
      if (gLogCategory_APPairingServicesCoreUtils <= 50
        && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      PairingSessionSetACL();
    }
    PairingSessionSetKeychainInfo();
    PairingSessionSetLogging();
  }
  CFStringGetCString(a2, buffer, 128, 0x8000100u);
  if (!buffer[0])
  {
    v19 = 4294895105;
    goto LABEL_49;
  }
  if (!PairingSessionSetSetupCode())
  {
    v17 = PairingSessionExchange();
    if (!(_DWORD)v17)
    {
      if (*a6)
      {
        if (*(_BYTE *)(v12 + 43))
        {
          v18 = *(CFTypeRef *)v12;
          *(_QWORD *)(v12 + 8) = *(_QWORD *)v12;
          if (v18)
            CFRetain(v18);
        }
        if (gLogCategory_APPairingServicesCoreUtils <= 50
          && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (*(_QWORD *)v12)
        {
          CFRelease(*(CFTypeRef *)v12);
          *(_QWORD *)v12 = 0;
        }
      }
      return 0;
    }
    v19 = v17;
    goto LABEL_49;
  }
  APSLogErrorAt();
  v19 = 4294895102;
LABEL_50:
  if (gLogCategory_APPairingServicesCoreUtils <= 90
    && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v19;
}

uint64_t coreUtilsPairing_HandleVerify(int a1, CFDataRef theData, _QWORD *a3, _BYTE *a4)
{
  uint64_t DerivedStorage;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3)
  {
    v8 = DerivedStorage;
    *a3 = 0;
    if (*(_QWORD *)(DerivedStorage + 8))
    {
LABEL_27:
      v11 = PairingSessionExchange();
      if (!(_DWORD)v11)
      {
        if (*a4
          && gLogCategory_APPairingServicesCoreUtils <= 50
          && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        return 0;
      }
      v12 = v11;
      goto LABEL_38;
    }
    v9 = PairingSessionCreate();
    if ((_DWORD)v9)
    {
      v12 = v9;
LABEL_38:
      APSLogErrorAt();
      goto LABEL_39;
    }
    if (gLogCategory_APPairingServicesCoreUtils <= 40
      && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_BYTE *)(v8 + 40))
    {
      PairingSessionSetSignBytesHandler_b();
      PairingSessionSetVerifySignatureHandler_b();
    }
    else if (!*(_BYTE *)(v8 + 41))
    {
      v10 = 0;
      if (!*(_BYTE *)(v8 + 42))
      {
LABEL_18:
        if (*(_QWORD *)(v8 + 48))
        {
          if (gLogCategory_APPairingServicesCoreUtils <= 50
            && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          PairingSessionSetACL();
        }
        if ((v10 & 1) == 0)
          PairingSessionSetKeychainInfo();
        PairingSessionSetLogging();
        goto LABEL_27;
      }
LABEL_12:
      PairingSessionSetFlags();
      if (gLogCategory_APPairingServicesCoreUtils <= 40
        && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_18;
    }
    v10 = 1;
    goto LABEL_12;
  }
  APSLogErrorAt();
  v12 = 4294895105;
LABEL_39:
  if (gLogCategory_APPairingServicesCoreUtils <= 90
    && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v12;
}

uint64_t coreUtilsPairing_DeriveKey()
{
  uint64_t v0;

  if (*(_QWORD *)(CMBaseObjectGetDerivedStorage() + 8))
  {
    v0 = PairingSessionDeriveKey();
    if ((_DWORD)v0)
      APSLogErrorAt();
  }
  else
  {
    APSLogErrorAt();
    return 4294895104;
  }
  return v0;
}

uint64_t coreUtilsPairing_SupportsChaChaEncryption()
{
  return 1;
}

uint64_t coreUtilsPairing_Reset()
{
  CMBaseObjectGetDerivedStorage();
  coreUtilsPairing_resetInternal();
  return 0;
}

void coreUtilsPairing_resetInternal()
{
  uint64_t DerivedStorage;
  const void *v1;
  const void *v2;
  const void *v3;
  const void *v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APPairingServicesCoreUtils <= 50
    && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  v1 = *(const void **)(DerivedStorage + 8);
  if (v1)
  {
    CFRelease(v1);
    *(_QWORD *)(DerivedStorage + 8) = 0;
  }
  v2 = *(const void **)(DerivedStorage + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(DerivedStorage + 16) = 0;
  }
  v3 = *(const void **)(DerivedStorage + 24);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(DerivedStorage + 24) = 0;
  }
  v4 = *(const void **)(DerivedStorage + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(DerivedStorage + 32) = 0;
  }
}

void coreUtilsPairing_Finalize()
{
  uint64_t DerivedStorage;
  const void *v1;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  coreUtilsPairing_resetInternal();
  v1 = *(const void **)(DerivedStorage + 48);
  if (v1)
    CFRelease(v1);
  if (gLogCategory_APPairingServicesCoreUtils <= 50
    && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

__CFString *coreUtilsPairing_CopyDebugDescription()
{
  _QWORD *DerivedStorage;
  __CFString *Mutable;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<APPairingServicesCoreUtils '%@'>"), *DerivedStorage);
  return Mutable;
}

uint64_t coreUtilsPairing_SetProperty(uint64_t a1, const void *a2, const __CFDictionary *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  const void *Value;
  const void *v12;
  const void *v13;
  uint64_t v14;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a2)
  {
    v14 = 4294895105;
LABEL_21:
    APSLogErrorAt();
    return v14;
  }
  v6 = DerivedStorage;
  if (!CFEqual(a2, CFSTR("pairingParams")))
    return 4294954512;
  if (!a3)
  {
    v14 = 4294895105;
    goto LABEL_21;
  }
  v7 = CFDictionaryGetInt64() != 0;
  v8 = CFDictionaryGetInt64() != 0;
  v9 = CFDictionaryGetInt64() != 0;
  v10 = CFDictionaryGetInt64() != 0;
  Value = CFDictionaryGetValue(a3, CFSTR("ACL"));
  if (*(unsigned __int8 *)(v6 + 40) != v7
    || *(unsigned __int8 *)(v6 + 41) != v8
    || *(unsigned __int8 *)(v6 + 42) != v9
    || *(unsigned __int8 *)(v6 + 43) != v10
    || (v12 = *(const void **)(v6 + 48), v12 != Value) && (!v12 || !Value || !CFEqual(v12, Value)))
  {
    CMBaseObjectGetDerivedStorage();
    coreUtilsPairing_resetInternal();
    *(_BYTE *)(v6 + 40) = v7;
    *(_BYTE *)(v6 + 41) = v8;
    *(_BYTE *)(v6 + 42) = v9;
    *(_BYTE *)(v6 + 43) = v10;
    v13 = *(const void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = Value;
    if (Value)
      CFRetain(Value);
    if (v13)
      CFRelease(v13);
  }
  return 0;
}

uint64_t APPairingServicesCoreUtilsHandleAddPeer(int a1, const __CFData *a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t DerivedStorage;
  uint64_t v9;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v9 = coreUtilsPairing_handleAdminRequest(a1, 10, (CFTypeRef *)(DerivedStorage + 16), a2, a3, a4);
  if ((_DWORD)v9)
    APSLogErrorAt();
  return v9;
}

uint64_t coreUtilsPairing_handleAdminRequest(int a1, int a2, CFTypeRef *a3, CFDataRef theData, _QWORD *a5, _BYTE *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  CMBaseObjectGetDerivedStorage();
  if (!a5)
  {
    APSLogErrorAt();
    return 4294895105;
  }
  *a5 = 0;
  if (!*a3)
  {
    v10 = PairingSessionCreate();
    if ((_DWORD)v10)
    {
      v12 = v10;
      goto LABEL_18;
    }
    PairingSessionSetLogging();
  }
  v11 = PairingSessionExchange();
  if ((_DWORD)v11)
  {
    v12 = v11;
LABEL_18:
    APSLogErrorAt();
    return v12;
  }
  if (*a6)
  {
    if (*a3)
    {
      CFRelease(*a3);
      *a3 = 0;
    }
    if (gLogCategory_APPairingServicesCoreUtils <= 50
      && (gLogCategory_APPairingServicesCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t APPairingServicesCoreUtilsHandleRemovePeer(int a1, const __CFData *a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t DerivedStorage;
  uint64_t v9;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v9 = coreUtilsPairing_handleAdminRequest(a1, 12, (CFTypeRef *)(DerivedStorage + 24), a2, a3, a4);
  if ((_DWORD)v9)
    APSLogErrorAt();
  return v9;
}

uint64_t APPairingServicesCoreUtilsHandleListPeers(int a1, const __CFData *a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t DerivedStorage;
  uint64_t v9;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v9 = coreUtilsPairing_handleAdminRequest(a1, 14, (CFTypeRef *)(DerivedStorage + 32), a2, a3, a4);
  if ((_DWORD)v9)
    APSLogErrorAt();
  return v9;
}

uint64_t APPairingServicesLegacyCreate(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  if (APPairingServicesGetClassID_sRegisterOnce != -1)
    dispatch_once_f(&APPairingServicesGetClassID_sRegisterOnce, &APPairingServicesGetClassID_sClassID, (dispatch_function_t)pairingServices_registerBaseClass);
  v3 = CMDerivedObjectCreate();
  if ((_DWORD)v3)
  {
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_APPairingServicesLegacy <= 50
      && (gLogCategory_APPairingServicesLegacy != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *a2 = 0;
  }
  return v3;
}

uint64_t legacyPairing_HandleSetup(int a1, uint64_t a2, int a3, CFDataRef theData, _QWORD *a5)
{
  _QWORD *DerivedStorage;
  uint64_t v9;
  unsigned int v10;
  uint64_t v12;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  if (!a5)
  {
    APSLogErrorAt();
    return 4294895105;
  }
  *a5 = 0;
  if (*DerivedStorage)
  {
    if (a2)
      goto LABEL_4;
    return h4BvW7X();
  }
  if (gQblcfSzZBQsYCCV())
  {
    APSLogErrorAt();
    return 4294895104;
  }
  if (!a2)
    return h4BvW7X();
LABEL_4:
  v9 = GvMGlTNs();
  if ((_DWORD)v9)
  {
    v12 = v9;
LABEL_19:
    APSLogErrorAt();
    return v12;
  }
  v10 = SrtySZG0();
  if (v10 == -6760 || v10 == 0)
    v12 = v10;
  else
    v12 = 4294895103;
  if ((_DWORD)v12)
    goto LABEL_19;
  return 0;
}

uint64_t legacyPairing_HandleVerify(int a1, CFDataRef theData, _QWORD *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a3)
  {
    APSLogErrorAt();
    return 4294895105;
  }
  *a3 = 0;
  if (!*(_QWORD *)(DerivedStorage + 8) && gQblcfSzZBQsYCCV())
  {
    v7 = 4294895104;
    goto LABEL_10;
  }
  v6 = VBAEFt();
  if ((_DWORD)v6)
  {
    v7 = v6;
LABEL_10:
    APSLogErrorAt();
    return v7;
  }
  return 0;
}

uint64_t legacyPairing_DeriveKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;

  if (!*(_QWORD *)(CMBaseObjectGetDerivedStorage() + 8))
  {
    v7 = 4294895104;
    goto LABEL_7;
  }
  if (a6 != 16)
  {
    APSLogErrorAt();
    return 4294895105;
  }
  v7 = PCFdAVst();
  if ((_DWORD)v7)
LABEL_7:
    APSLogErrorAt();
  return v7;
}

uint64_t legacyPairing_SupportsChaChaEncryption()
{
  return 0;
}

uint64_t legacyPairing_Reset()
{
  uint64_t DerivedStorage;
  const void *v1;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  v1 = *(const void **)(DerivedStorage + 8);
  if (v1)
  {
    CFRelease(v1);
    *(_QWORD *)(DerivedStorage + 8) = 0;
  }
  return 0;
}

uint64_t legacyPairing_Finalize(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = CMBaseObjectGetVTable();
  v3 = *(_QWORD *)(result + 16);
  if (*(_QWORD *)(v3 + 24))
    return (*(uint64_t (**)(uint64_t))(v3 + 40))(a1);
  return result;
}

__CFString *legacyPairing_CopyDebugDescription()
{
  _QWORD *DerivedStorage;
  __CFString *Mutable;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<APPairingServicesLegacy '%@'>"), *DerivedStorage);
  return Mutable;
}

uint64_t APReceiverSessionManagerGetTypeID()
{
  if (APReceiverSessionManagerGetTypeID_once != -1)
    dispatch_once(&APReceiverSessionManagerGetTypeID_once, &__block_literal_global_6166);
  return APReceiverSessionManagerGetTypeID_typeID;
}

uint64_t sessionManager_Finalize(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 16);
  if (v2 != -1)
  {
    notify_cancel(v2);
    *(_DWORD *)(a1 + 16) = -1;
  }
  v3 = *(const void **)(a1 + 64);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v4 = *(const void **)(a1 + 80);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 80) = 0;
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v6 = *(const void **)(a1 + 56);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 56) = 0;
  }
  result = pthread_mutex_destroy((pthread_mutex_t *)(a1 + 88));
  if (gLogCategory_APReceiverSessionManager <= 10)
  {
    if (gLogCategory_APReceiverSessionManager != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void sessionManager_handleSenderSessionStateChangeNotification(int a1, CFTypeRef cf)
{
  NSObject *v3;
  _QWORD block[5];

  CFRetain(cf);
  v3 = *(NSObject **)(*((_QWORD *)cf + 3) + 88);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __sessionManager_handleSenderSessionStateChangeNotification_block_invoke;
  block[3] = &__block_descriptor_tmp_48;
  block[4] = cf;
  dispatch_async(v3, block);
}

uint64_t sessionManager_handleSenderSessionStateChange(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  v2 = a2;
  v3 = result;
  if (a2)
  {
    v4 = CFDictionaryGetInt64() != 0;
    result = CFDictionaryGetInt64();
    v2 = result;
    v5 = *(unsigned __int8 *)(v3 + 41);
  }
  else
  {
    v4 = 0;
    v5 = *(unsigned __int8 *)(result + 41);
  }
  if (v5 == v4 && *(_DWORD *)(v3 + 44) == v2)
    return result;
  *(_BYTE *)(v3 + 41) = v4;
  *(_DWORD *)(v3 + 44) = v2;
  if (gLogCategory_APReceiverSessionManager <= 50
    && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(_QWORD *)(v3 + 32);
  if (v6 != 1)
    goto LABEL_18;
  if (v4 || v2 == 1)
  {
    if (gLogCategory_APReceiverSessionManager <= 50
      && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFObjectControlAsync();
    v6 = *(_QWORD *)(v3 + 32);
LABEL_18:
    if ((v6 | 2) == 2 && !IsAppleTV())
      APSMultiPrimariesEnabled();
  }
  if (gLogCategory_APReceiverSessionManager <= 40
    && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFObjectSetProperty();
}

void __sessionManager_handleSenderSessionStateChangeNotification_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v3;

  v3 = (const void *)APReceiverSystemInfoCopyProperty(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 160), a2, (uint64_t)CFSTR("LocalRouteInfo"), 0, 0);
  sessionManager_handleSenderSessionStateChange(*(_QWORD *)(a1 + 32), (uint64_t)v3);
  if (v3)
    CFRelease(v3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t cfArrayContainsValue(const __CFArray *a1, const void *a2)
{
  uint64_t Count;
  CFRange v6;

  if (a1 && a2)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v6.length = Count;
      v6.location = 0;
      return CFArrayContainsValue(a1, v6, a2);
    }
  }
  else
  {
    APSLogErrorAt();
  }
  return 0;
}

uint64_t APReceiverRequestProcessorCopyProperty_6189(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 0;
}

void APReceiverSessionManagerUpdateParentGroupInfo(_QWORD *a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, const __CFString *, _QWORD);
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, const __CFString *, _QWORD);
  uint64_t v7;
  const void *Value;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  const void *v19;
  BOOL v20;
  BOOL v21;

  v2 = a1[7];
  if (v2
    && (v3 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 64)) != 0
    && (v4 = (const __CFDictionary *)v3(v2, CFSTR("parentGroupInfo"), 0)) != 0
    || (v5 = a1[6]) != 0
    && (v6 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 64)) != 0
    && (v4 = (const __CFDictionary *)v6(v5, CFSTR("parentGroupInfo"), 0)) != 0)
  {
    v7 = *(_QWORD *)(a1[3] + 160);
    Value = CFDictionaryGetValue(v4, CFSTR("groupUUID"));
    v9 = CFDictionaryGetInt64() != 0;
    v10 = CFDictionaryGetInt64() != 0;
    v11 = *(NSObject **)(v7 + 16);
    block = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __APReceiverSystemInfoSetParentGroupInfo_block_invoke;
    v17 = &__block_descriptor_50_e5_v8__0l;
    v18 = v7;
    v19 = Value;
    v20 = v9;
    v21 = v10;
    dispatch_sync(v11, &block);
    CFRelease(v4);
  }
  else
  {
    v12 = *(_QWORD *)(a1[3] + 160);
    v13 = *(NSObject **)(v12 + 16);
    block = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __APReceiverSystemInfoResetParentGroupInfo_block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0l;
    v18 = v12;
    dispatch_sync(v13, &block);
  }
}

void APReceiverSessionManagerSetAsMainAirPlaySession(uint64_t a1, const void *a2)
{
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, const __CFString *, int *);
  const void *v8;
  __CFDictionary *Mutable;
  const __CFDictionary *v10;
  int v11;

  if (!a2 || !cfArrayContainsValue(*(const __CFArray **)(a1 + 64), a2))
  {
    APSLogErrorAt();
    return;
  }
  v4 = *(const void **)(a1 + 56);
  if (v4 != a2)
  {
    if (v4)
    {
      if (CFEqual(a2, v4))
        return;
      v5 = *(const void **)(a1 + 56);
      CFRetain(a2);
      *(_QWORD *)(a1 + 56) = a2;
      if (v5)
        CFRelease(v5);
    }
    else
    {
      CFRetain(a2);
      *(_QWORD *)(a1 + 56) = a2;
    }
    if (gLogCategory_APReceiverSessionManager <= 50
      && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APReceiverSessionManagerUpdateParentGroupInfo((_QWORD *)a1);
    if (*(_QWORD *)(a1 + 56))
    {
      CFObjectSetProperty();
      if (APSIsMemberOfPersistentGroup())
      {
        v11 = 0;
        v6 = *(_QWORD *)(a1 + 56);
        if (v6)
        {
          v7 = *(uint64_t (**)(uint64_t, const __CFString *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 64);
          if (v7)
          {
            v8 = (const void *)v7(v6, CFSTR("hijackID"), &v11);
            if (v11)
            {
              APSLogErrorAt();
              if (!v8)
                goto LABEL_28;
              goto LABEL_27;
            }
          }
          else
          {
            v8 = 0;
          }
          if (gLogCategory_APReceiverSessionManager <= 50
            && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (Mutable)
          {
            v10 = Mutable;
            CFDictionarySetValue(Mutable, CFSTR("hijackID"), v8);
            AirPlayReceiverServerPlatformControl(*(_QWORD *)(a1 + 24), CFSTR("updateHijackID"), 0, v10);
            CFRelease(v10);
            if (!v8)
              goto LABEL_28;
          }
          else
          {
            APSLogErrorAt();
            v11 = -6728;
            if (!v8)
            {
LABEL_28:
              if (v11)
                APSLogErrorAt();
              return;
            }
          }
LABEL_27:
          CFRelease(v8);
          goto LABEL_28;
        }
      }
    }
  }
}

uint64_t APReceiverSessionManagerUpdateAndNotifyReceiverSessionState(uint64_t a1)
{
  CFIndex Count;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  CFTypeRef cf;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
  if (Count < 1)
  {
    v3 = 0;
  }
  else
  {
    if (Count != 1)
      goto LABEL_9;
    if (APSMultiPrimariesEnabled())
    {
      v3 = 2;
      goto LABEL_10;
    }
    if (IsAppleTV())
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), 0);
      if (CFObjectGetInt64())
        v3 = 2;
      else
        v3 = 1;
    }
    else
    {
LABEL_9:
      v3 = 1;
    }
  }
LABEL_10:
  cf = 0;
  CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
  v4 = CFObjectSetPropertyInt64();
  if ((_DWORD)v4)
  {
    v8 = v4;
LABEL_29:
    APSLogErrorAt();
    goto LABEL_23;
  }
  if (APSMultiPrimariesEnabled())
  {
    APReceiverSessionManagerCopyAirPlaySessionWithAttribute(a1, 5, &cf, 0);
    v7 = AirPlayReceiverServerPlatformSetProperty(*(_QWORD *)(a1 + 24), v5, CFSTR("mainMediaReceiverSession"), v6, cf);
    if ((_DWORD)v7)
    {
      v8 = v7;
      goto LABEL_29;
    }
  }
  if (*(_QWORD *)(a1 + 32) == v3)
  {
    v8 = 0;
  }
  else
  {
    if (gLogCategory_APReceiverSessionManager <= 50
      && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_QWORD *)(a1 + 32) = v3;
    v9 = *(_DWORD *)(a1 + 16);
    if (v9 == -1)
    {
      v8 = 0;
    }
    else
    {
      notify_set_state(v9, v3);
      v8 = notify_post("com.apple.airplay.active");
    }
    CFObjectSetProperty();
  }
LABEL_23:
  if (cf)
    CFRelease(cf);
  return v8;
}

void APReceiverSessionManagerRemoveSession(uint64_t a1, const void *a2)
{
  CFIndex IndexOfValue;
  CFIndex v5;
  const void *v6;
  CFIndex v7;
  int v8;

  if (gLogCategory_APReceiverSessionManager <= 50
    && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  IndexOfValue = cfArrayGetIndexOfValue(*(const __CFArray **)(a1 + 64), a2);
  if (IndexOfValue != -1)
  {
    v5 = IndexOfValue;
    v6 = *(const void **)(a1 + 48);
    if (v6 == a2)
    {
      v8 = *(_DWORD *)(a1 + 72);
      if (v8 >= 2)
        *(_DWORD *)(a1 + 72) = v8 - 1;
      if (a2)
      {
        CFRelease(a2);
        *(_QWORD *)(a1 + 48) = 0;
      }
      if (gLogCategory_APReceiverSessionManager <= 50
        && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_20;
      }
    }
    else if (gLogCategory_APReceiverSessionManager <= 50
           && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
LABEL_20:
      LogPrintF();
    }
    if (*(const void **)(a1 + 56) == a2)
    {
      if (gLogCategory_APReceiverSessionManager <= 50)
      {
        if (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize())
          LogPrintF();
        a2 = *(const void **)(a1 + 56);
      }
      if (a2)
      {
        CFRelease(a2);
        *(_QWORD *)(a1 + 56) = 0;
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 64), v5);
    }
    else
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 64), v5);
      if (v6 != a2)
      {
LABEL_38:
        APReceiverSessionManagerUpdateAndNotifyReceiverSessionState(a1);
        return;
      }
    }
    APReceiverSessionManagerUpdateParentGroupInfo((_QWORD *)a1);
    goto LABEL_38;
  }
  v7 = cfArrayGetIndexOfValue(*(const __CFArray **)(a1 + 80), a2);
  if (v7 != -1)
  {
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v7);
    if (gLogCategory_APReceiverSessionManager <= 50
      && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

CFIndex cfArrayGetIndexOfValue(const __CFArray *a1, const void *a2)
{
  uint64_t Count;
  CFRange v6;

  if (a1 && a2)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v6.length = Count;
      v6.location = 0;
      return CFArrayGetFirstIndexOfValue(a1, v6, a2);
    }
  }
  else
  {
    APSLogErrorAt();
  }
  return -1;
}

void APReceiverSessionManagerCopyAirPlaySessionWithAttribute(uint64_t a1, int a2, _QWORD *a3, const void **a4)
{
  const void *v7;
  const void **v8;
  const void *v9;
  CFTypeRef NonPersistentSession;
  const void *v12;
  uint64_t v13;

  if (a2 == 1)
  {
    v7 = 0;
LABEL_3:
    v8 = (const void **)(a1 + 48);
LABEL_4:
    v9 = *v8;
    goto LABEL_14;
  }
  NonPersistentSession = sessionManager_copyFirstNonPersistentSession(a1);
  v7 = NonPersistentSession;
  v9 = *(const void **)(a1 + 56);
  if (a2 == 4)
  {
    if (v9)
    {
      v12 = *(const void **)(a1 + 48);
      if (v9 == v12)
        goto LABEL_10;
      if (!v12)
        goto LABEL_14;
      if (CFEqual(*(CFTypeRef *)(a1 + 56), v12))
      {
LABEL_10:
        v9 = v7;
        goto LABEL_14;
      }
      v8 = (const void **)(a1 + 56);
      goto LABEL_4;
    }
    goto LABEL_25;
  }
  if (!v9)
    v9 = NonPersistentSession;
  if (!v9)
  {
    if (a2 == 5)
    {
      v13 = *(_QWORD *)(a1 + 48);
      v8 = (const void **)(a1 + 48);
      if (v13 && CFObjectGetInt64())
        goto LABEL_4;
    }
    else if (!a2)
    {
      goto LABEL_3;
    }
LABEL_25:
    if (!a3)
      goto LABEL_28;
    v9 = 0;
    goto LABEL_27;
  }
LABEL_14:
  if (a4 && v9)
    *a4 = APReceiverRequestProcessorCopyReceiverSession();
  if (a3)
  {
    if (v9)
      CFRetain(v9);
LABEL_27:
    *a3 = v9;
  }
LABEL_28:
  if (v7)
    CFRelease(v7);
}

CFTypeRef sessionManager_copyFirstNonPersistentSession(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  const void *v6;
  const void *v7;
  BOOL v8;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), v4);
    v6 = *(const void **)(a1 + 48);
    if (ValueAtIndex != v6)
    {
      v7 = ValueAtIndex;
      v8 = !ValueAtIndex || v6 == 0;
      if (v8 || !CFEqual(ValueAtIndex, v6))
        break;
    }
    if (v3 == ++v4)
      return 0;
  }
  return CFRetain(v7);
}

__CFArray *APReceiverSessionManagerCopyAllSessions(uint64_t a1)
{
  __CFArray *Mutable;
  const __CFArray *v3;
  const __CFArray *v4;
  CFRange v6;
  CFRange v7;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v3 = *(const __CFArray **)(a1 + 80);
    if (v3)
    {
      v6.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
      v6.location = 0;
      CFArrayAppendArray(Mutable, v3, v6);
    }
    v4 = *(const __CFArray **)(a1 + 64);
    if (v4)
    {
      v7.length = CFArrayGetCount(v4);
      v7.location = 0;
      CFArrayAppendArray(Mutable, v4, v7);
    }
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APReceiverSessionManager <= 60
      && (gLogCategory_APReceiverSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return Mutable;
}

BOOL APReceiverSessionManagerCanHijack(uint64_t a1, const void *a2)
{
  uint64_t v4;

  v4 = 1;
  if (CFObjectGetPropertyInt64Sync()
    && *(int *)(a1 + 72) >= 1
    && CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) == *(_DWORD *)(a1 + 72))
  {
    return cfArrayContainsValue(*(const __CFArray **)(a1 + 64), a2) != 0;
  }
  return v4;
}

void APReceiverSessionManagerHijack(uint64_t a1, const void *a2)
{
  CFTypeRef NonPersistentSession;
  const void *v5;

  NonPersistentSession = sessionManager_copyFirstNonPersistentSession(a1);
  if (NonPersistentSession)
  {
    v5 = NonPersistentSession;
    if (!CFEqual(NonPersistentSession, a2))
      AirPlayReceiverServerHijackConnection(*(_QWORD *)(a1 + 24), (uint64_t)v5, (uint64_t)a2);
    CFRelease(v5);
  }
}

uint64_t AES_CBCFrame_Final()
{
  return MEMORY[0x24BE28DC0]();
}

uint64_t AES_CBCFrame_Init()
{
  return MEMORY[0x24BE28DC8]();
}

uint64_t AES_CBCFrame_Update()
{
  return MEMORY[0x24BE28DD0]();
}

uint64_t AES_CTR_Final()
{
  return MEMORY[0x24BE28DD8]();
}

uint64_t AES_CTR_Init()
{
  return MEMORY[0x24BE28DE0]();
}

uint64_t AES_CTR_Update()
{
  return MEMORY[0x24BE28DE8]();
}

uint64_t APAudioFormatGetMagicCookieForAACELD()
{
  return MEMORY[0x24BE03168]();
}

uint64_t APAudioFormatGetSupportedTransportAudioFormatsForBufferedReceiver()
{
  return MEMORY[0x24BE03170]();
}

uint64_t APAudioFormatGetSupportedTransportAudioFormatsForRealTimeReceiver()
{
  return MEMORY[0x24BE03178]();
}

uint64_t APAudioFormatGetSupportedTransportAudioFormatsForScreenReceiver()
{
  return MEMORY[0x24BE03180]();
}

uint64_t APAudioFormatGetSupportedTransportAudioFormatsLowLatencyReceiver()
{
  return MEMORY[0x24BE03188]();
}

uint64_t APAudioFormatIDToAPCompressionType()
{
  return MEMORY[0x24BE03190]();
}

uint64_t APAudioFormatIndexGetBitsPerChannel()
{
  return MEMORY[0x24BE03198]();
}

uint64_t APAudioFormatIndexToPCMASBD()
{
  return MEMORY[0x24BE031A0]();
}

uint64_t APCompressionTypeFillStreamDescription()
{
  return MEMORY[0x24BE031A8]();
}

uint64_t APCompressionTypeGetBufferSize()
{
  return MEMORY[0x24BE031B0]();
}

uint64_t APCompressionTypeToAPAudioFormatIndex()
{
  return MEMORY[0x24BE031B8]();
}

uint64_t APConnectivityHelperDeregisterForEvent()
{
  return MEMORY[0x24BDFD528]();
}

uint64_t APConnectivityHelperGetEventString()
{
  return MEMORY[0x24BDFD530]();
}

uint64_t APConnectivityHelperGetSharedHelper()
{
  return MEMORY[0x24BDFD538]();
}

uint64_t APConnectivityHelperRegisterEventHandler()
{
  return MEMORY[0x24BDFD540]();
}

uint64_t APConnectivityHelperRegisterForEvent()
{
  return MEMORY[0x24BDFD548]();
}

uint64_t APConnectivityHelperRemoveAllRegistrations()
{
  return MEMORY[0x24BDFD550]();
}

uint64_t APSAllocatorGetDefaultAirPlayMallocZone()
{
  return MEMORY[0x24BE031C0]();
}

uint64_t APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator()
{
  return MEMORY[0x24BE031C8]();
}

uint64_t APSAsyncLoggerGetSharedLogger()
{
  return MEMORY[0x24BE031D0]();
}

uint64_t APSAsyncLoggerLogMessage()
{
  return MEMORY[0x24BE031D8]();
}

uint64_t APSAtomicMessageQueueCreate()
{
  return MEMORY[0x24BE031E0]();
}

uint64_t APSAtomicMessageQueueReadMessage()
{
  return MEMORY[0x24BE031E8]();
}

uint64_t APSAtomicMessageQueueSendMessage()
{
  return MEMORY[0x24BE031F0]();
}

uint64_t APSAudioFormatDescriptionCreateWithAudioFormatIndex()
{
  return MEMORY[0x24BE031F8]();
}

uint64_t APSAudioFormatDescriptionGetASBD()
{
  return MEMORY[0x24BE03200]();
}

uint64_t APSAudioFormatDescriptionGetAudioFormatIndex()
{
  return MEMORY[0x24BE03208]();
}

uint64_t APSAudioFormatDescriptionGetChannelCount()
{
  return MEMORY[0x24BE03210]();
}

uint64_t APSAudioFormatDescriptionGetChannelLayoutTag()
{
  return MEMORY[0x24BE03218]();
}

uint64_t APSAudioFormatDescriptionGetSampleRate()
{
  return MEMORY[0x24BE03220]();
}

uint64_t APSAudioFormatDescriptionListCreateAdvertisementArray()
{
  return MEMORY[0x24BE03228]();
}

uint64_t APSAudioFormatDescriptionListCreateForBufferedReceiverWithAudioCapabilities()
{
  return MEMORY[0x24BE03230]();
}

uint64_t APSAudioFormatDoesAudioChannelLayoutTagHaveHeights()
{
  return MEMORY[0x24BE03238]();
}

uint64_t APSAudioIOAssertionUntilTime()
{
  return MEMORY[0x24BE03240]();
}

uint64_t APSAudioTransportTimeCopyDebugDesc()
{
  return MEMORY[0x24BE03248]();
}

uint64_t APSAudioTransportTimeIsValid()
{
  return MEMORY[0x24BE03250]();
}

uint64_t APSAudioTransportTimeMakeWithRTPTime()
{
  return MEMORY[0x24BE03258]();
}

uint64_t APSAudioTransportTimeUtilsDecodeFromRequestResponseDictionary()
{
  return MEMORY[0x24BE03260]();
}

uint64_t APSAudioTransportTimeUtilsEncodeToRequestResponseDictionary()
{
  return MEMORY[0x24BE03268]();
}

uint64_t APSContiguousAllocatorAcquireBlock()
{
  return MEMORY[0x24BE03280]();
}

uint64_t APSContiguousAllocatorCreate()
{
  return MEMORY[0x24BE03288]();
}

uint64_t APSContiguousAllocatorGetNextAvailableBlockSize()
{
  return MEMORY[0x24BE03290]();
}

uint64_t APSContiguousAllocatorRelinquishBlock()
{
  return MEMORY[0x24BE03298]();
}

uint64_t APSContiguousAllocatorRelinquishBlockFromAddress()
{
  return MEMORY[0x24BE032A0]();
}

uint64_t APSCopyBootUUID()
{
  return MEMORY[0x24BE032A8]();
}

uint64_t APSCopyClusterInfo()
{
  return MEMORY[0x24BE032B0]();
}

uint64_t APSCopyPersistentGroupInfo()
{
  return MEMORY[0x24BE032B8]();
}

uint64_t APSCopyTightSyncInfo()
{
  return MEMORY[0x24BE032C0]();
}

uint64_t APSCreateGroupID()
{
  return MEMORY[0x24BE032C8]();
}

uint64_t APSCryptorCBCCreate()
{
  return MEMORY[0x24BE032D0]();
}

uint64_t APSCryptorChaCha20Poly1305Create()
{
  return MEMORY[0x24BE032D8]();
}

uint64_t APSDispatchAsyncFHelper()
{
  return MEMORY[0x24BE032E0]();
}

uint64_t APSDispatchDataCopyBytes()
{
  return MEMORY[0x24BE032E8]();
}

uint64_t APSDisplayUtilsCopyDisplayCapabilities()
{
  return MEMORY[0x24BE032F0]();
}

uint64_t APSEncryptionUtilsDeriveAESKeySHA512ForScreen()
{
  return MEMORY[0x24BE032F8]();
}

uint64_t APSEndpointStreamAudioHoseProtocolGetProtocolID()
{
  return MEMORY[0x24BE03300]();
}

uint64_t APSEndpointStreamAudioHoseSBARCreate()
{
  return MEMORY[0x24BE03308]();
}

uint64_t APSEndpointStreamAudioHoseSBARInvalidate()
{
  return MEMORY[0x24BE03310]();
}

uint64_t APSEnsureCanInitiatePlayback()
{
  return MEMORY[0x24BE03318]();
}

uint64_t APSFeaturesClearAllFeatures()
{
  return MEMORY[0x24BE03320]();
}

uint64_t APSFeaturesCopyStringRepresentation()
{
  return MEMORY[0x24BE03328]();
}

uint64_t APSFeaturesCreateFromLegacyFlags()
{
  return MEMORY[0x24BE03330]();
}

uint64_t APSFeaturesCreateFromStringRepresentation()
{
  return MEMORY[0x24BE03338]();
}

uint64_t APSFeaturesCreateMutable()
{
  return MEMORY[0x24BE03340]();
}

uint64_t APSFeaturesCreateMutableCopy()
{
  return MEMORY[0x24BE03348]();
}

uint64_t APSFeaturesGetLegacyFlags()
{
  return MEMORY[0x24BE03350]();
}

uint64_t APSFeaturesHasFeature()
{
  return MEMORY[0x24BE03358]();
}

uint64_t APSFeaturesIsEmpty()
{
  return MEMORY[0x24BE03360]();
}

uint64_t APSFeaturesSetFeature()
{
  return MEMORY[0x24BE03368]();
}

uint64_t APSFeaturesSetLegacyFlags()
{
  return MEMORY[0x24BE03370]();
}

uint64_t APSGetAccessControlConfig()
{
  return MEMORY[0x24BE03378]();
}

uint64_t APSGetAllowPersistentGroupsOnInfra()
{
  return MEMORY[0x24BE03380]();
}

uint64_t APSGetDeviceClassFromDeviceModel()
{
  return MEMORY[0x24BE03388]();
}

uint64_t APSGetDeviceID()
{
  return MEMORY[0x24BE03390]();
}

uint64_t APSGetFBOPropertyInt64()
{
  return MEMORY[0x24BE033A0]();
}

uint64_t APSGetP2PAllow()
{
  return MEMORY[0x24BE033B0]();
}

uint64_t APSGetVolumeFadeTypeName()
{
  return MEMORY[0x24BE033B8]();
}

uint64_t APSHDMIVideoLatencyMs()
{
  return MEMORY[0x24BE033C0]();
}

uint64_t APSHasNANSupport()
{
  return MEMORY[0x24BE033D8]();
}

uint64_t APSIOReporterCreate()
{
  return MEMORY[0x24BE033E0]();
}

uint64_t APSIOReporterGetCoreCaptureCount()
{
  return MEMORY[0x24BE033E8]();
}

uint64_t APSIntrospectorAddCommand()
{
  return MEMORY[0x24BE033F0]();
}

uint64_t APSIntrospectorInit()
{
  return MEMORY[0x24BE03400]();
}

uint64_t APSIsAPMSpeaker()
{
  return MEMORY[0x24BE03408]();
}

uint64_t APSIsAPValeriaScreenSender()
{
  return MEMORY[0x24BE03410]();
}

uint64_t APSIsATVInHTGroup()
{
  return MEMORY[0x24BE03418]();
}

uint64_t APSIsAirPlayDEnabled()
{
  return MEMORY[0x24BE03420]();
}

uint64_t APSIsDirectLinkInterface()
{
  return MEMORY[0x24BE03428]();
}

uint64_t APSIsMemberOfHTGroup()
{
  return MEMORY[0x24BE03430]();
}

uint64_t APSIsMemberOfPersistentGroup()
{
  return MEMORY[0x24BE03438]();
}

uint64_t APSIsMemberOfStereoPair()
{
  return MEMORY[0x24BE03440]();
}

uint64_t APSIsProximityReceiverEnabled()
{
  return MEMORY[0x24BE03448]();
}

uint64_t APSIsSetMRInfoCommandEnabled()
{
  return MEMORY[0x24BE03450]();
}

uint64_t APSIsValidDeviceEnclosureColorString()
{
  return MEMORY[0x24BE03458]();
}

uint64_t APSIsVirtualMachine()
{
  return MEMORY[0x24BE03460]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x24BE03468]();
}

uint64_t APSLogUtilsGetAsyncCnxLogCategory()
{
  return MEMORY[0x24BE03470]();
}

uint64_t APSLogUtilsGetHTTPClientCoreLogCategory()
{
  return MEMORY[0x24BE03478]();
}

uint64_t APSMultiPrimariesEnabled()
{
  return MEMORY[0x24BE03480]();
}

uint64_t APSNANServiceTypeGetTXTString()
{
  return MEMORY[0x24BE03488]();
}

uint64_t APSNetworkAddressCopyInterfaceName()
{
  return MEMORY[0x24BE03490]();
}

uint64_t APSNetworkAddressCreateWithSocketAddr()
{
  return MEMORY[0x24BE03498]();
}

uint64_t APSNetworkAddressCreateWithString()
{
  return MEMORY[0x24BE034A0]();
}

uint64_t APSNetworkClockAddOrUpdatePeerFromSerializablePeerDictionary()
{
  return MEMORY[0x24BE034B0]();
}

uint64_t APSNetworkClockAddOrUpdatePeerWithAddressAndInterfaceNameStrings()
{
  return MEMORY[0x24BE034B8]();
}

uint64_t APSNetworkClockDetermineAndSetOrUpdateLocalPeerInfo()
{
  return MEMORY[0x24BE034C0]();
}

uint64_t APSNetworkClockGetCMBaseObject()
{
  return MEMORY[0x24BE034C8]();
}

uint64_t APSNetworkClockGetClassID()
{
  return MEMORY[0x24BE034D0]();
}

uint64_t APSNetworkClockGetTypeID()
{
  return MEMORY[0x24BE034D8]();
}

uint64_t APSNetworkClockLogCurrentNetworkTime()
{
  return MEMORY[0x24BE034E0]();
}

uint64_t APSNetworkClockPTPCreate()
{
  return MEMORY[0x24BE034E8]();
}

uint64_t APSNetworkClockRemoveAllPeers()
{
  return MEMORY[0x24BE034F0]();
}

uint64_t APSNetworkClockReportRTCMetrics()
{
  return MEMORY[0x24BE034F8]();
}

uint64_t APSNetworkClockSetPeersFromSetPeersMessagePayload()
{
  return MEMORY[0x24BE03500]();
}

uint64_t APSNowPlayingSessionDataSourceEnabled()
{
  return MEMORY[0x24BE03510]();
}

uint64_t APSPacketLossConcealerConceal()
{
  return MEMORY[0x24BE03518]();
}

uint64_t APSPacketLossConcealerReset()
{
  return MEMORY[0x24BE03520]();
}

uint64_t APSPacketLossConcealerSaveData()
{
  return MEMORY[0x24BE03528]();
}

uint64_t APSPairingAuthenticationCoreUtilsSignBytesForSelfIdentity()
{
  return MEMORY[0x24BE03530]();
}

uint64_t APSPairingAuthenticationCoreUtilsVerifySignatureForSameAccount()
{
  return MEMORY[0x24BE03538]();
}

uint64_t APSPowerAssertionCreate()
{
  return MEMORY[0x24BE03540]();
}

uint64_t APSPowerAssertionRaise()
{
  return MEMORY[0x24BE03548]();
}

uint64_t APSPowerAssertionRelease()
{
  return MEMORY[0x24BE03550]();
}

uint64_t APSRTCReportingAgentCreate()
{
  return MEMORY[0x24BE03558]();
}

uint64_t APSRTCReportingAgentSendEvent()
{
  return MEMORY[0x24BE03560]();
}

uint64_t APSRTCReportingAgentSendMediaEvent()
{
  return MEMORY[0x24BE03568]();
}

uint64_t APSRTPPacketProcessorProcessPacket()
{
  return MEMORY[0x24BE03570]();
}

uint64_t APSRTPPassThroughJitterBufferAcquireLowestInsertedNode()
{
  return MEMORY[0x24BE03578]();
}

uint64_t APSRTPPassThroughJitterBufferAcquireRelinquishedNode()
{
  return MEMORY[0x24BE03580]();
}

uint64_t APSRTPPassThroughJitterBufferCreate()
{
  return MEMORY[0x24BE03588]();
}

uint64_t APSRTPPassThroughJitterBufferFlush()
{
  return MEMORY[0x24BE03590]();
}

uint64_t APSRTPPassThroughJitterBufferGetInsertedNodeCount()
{
  return MEMORY[0x24BE03598]();
}

uint64_t APSRTPPassThroughJitterBufferInsertNode()
{
  return MEMORY[0x24BE035A0]();
}

uint64_t APSRTPPassThroughJitterBufferIsFlushing()
{
  return MEMORY[0x24BE035A8]();
}

uint64_t APSRTPPassThroughJitterBufferRelinquishNode()
{
  return MEMORY[0x24BE035B0]();
}

uint64_t APSRealTimeReadableRingBufferCreate()
{
  return MEMORY[0x24BE035B8]();
}

uint64_t APSRealTimeReadableRingBufferRead()
{
  return MEMORY[0x24BE035C0]();
}

uint64_t APSSGetGasGaugeStringForPercent()
{
  return MEMORY[0x24BE03610]();
}

uint64_t APSScreenLatencyMs()
{
  return MEMORY[0x24BE03618]();
}

uint64_t APSSettingsCopyValue()
{
  return MEMORY[0x24BE03620]();
}

uint64_t APSSettingsGetBooleanIfPresent()
{
  return MEMORY[0x24BE03630]();
}

uint64_t APSSettingsGetCString()
{
  return MEMORY[0x24BE03638]();
}

uint64_t APSSettingsGetInt64()
{
  return MEMORY[0x24BE03640]();
}

uint64_t APSSettingsGetInt64IfPresent()
{
  return MEMORY[0x24BE03648]();
}

uint64_t APSSettingsGetIntWithDefault()
{
  return MEMORY[0x24BE03650]();
}

uint64_t APSSettingsGetUInt16IfPresent()
{
  return MEMORY[0x24BE03658]();
}

uint64_t APSSettingsIsFeatureEnabled()
{
  return MEMORY[0x24BE03660]();
}

uint64_t APSSettingsIsFeatureEnabledInDomain()
{
  return MEMORY[0x24BE03668]();
}

uint64_t APSSettingsRemoveValue()
{
  return MEMORY[0x24BE03670]();
}

uint64_t APSSettingsSetValue()
{
  return MEMORY[0x24BE03688]();
}

uint64_t APSSettingsSynchronize()
{
  return MEMORY[0x24BE03690]();
}

uint64_t APSShouldClusterEngageOnActivation()
{
  return MEMORY[0x24BE03698]();
}

uint64_t APSShouldStartAdvertistingForAirPlaySourceBeacon()
{
  return MEMORY[0x24BE036A0]();
}

uint64_t APSSignalErrorAt()
{
  return MEMORY[0x24BE036A8]();
}

uint64_t APSStatsHistogramAddValue()
{
  return MEMORY[0x24BE036B0]();
}

uint64_t APSStatsHistogramCopyValuesAsRTCString()
{
  return MEMORY[0x24BE036B8]();
}

uint64_t APSStatsHistogramCreate()
{
  return MEMORY[0x24BE036C0]();
}

uint64_t APSStatsHistogramCreateSerializedDictionary()
{
  return MEMORY[0x24BE036C8]();
}

uint64_t APSStatsHistogramGetTotalSampleCount()
{
  return MEMORY[0x24BE036D0]();
}

uint64_t APSVersionUtilsGetShortVersionLength()
{
  return MEMORY[0x24BE036E0]();
}

uint64_t APSVideoFormatDescriptionCreateFromBlockBuffer()
{
  return MEMORY[0x24BE036E8]();
}

uint64_t APSVolumeControlTypeFromEx()
{
  return MEMORY[0x24BE036F0]();
}

uint64_t APSVolumeConvertDBToClampedSliderValue()
{
  return MEMORY[0x24BE036F8]();
}

uint64_t APSVolumeConvertDBToLinearGain()
{
  return MEMORY[0x24BE03700]();
}

uint64_t APSVolumeConvertDBToSliderValue()
{
  return MEMORY[0x24BE03708]();
}

uint64_t APSVolumeConvertSliderValueToDB()
{
  return MEMORY[0x24BE03710]();
}

uint64_t APSVolumeConvertSliderValueToLinearGain()
{
  return MEMORY[0x24BE03718]();
}

uint64_t APSVolumeSliderValuesAreNoticeablyDifferent()
{
  return MEMORY[0x24BE03720]();
}

uint64_t APSW5LogCollect()
{
  return MEMORY[0x24BE03728]();
}

uint64_t APSWiFiTransactionCreate()
{
  return MEMORY[0x24BE03730]();
}

uint64_t APSWrapperCreate()
{
  return MEMORY[0x24BE03738]();
}

uint64_t APSWrapperGetValue()
{
  return MEMORY[0x24BE03740]();
}

uint64_t APSXPCClientAddEventHandler()
{
  return MEMORY[0x24BE03748]();
}

uint64_t APSXPCClientSendCommandCreatingReply()
{
  return MEMORY[0x24BE03750]();
}

uint64_t APSXPCServerAddCommandHandler()
{
  return MEMORY[0x24BE03758]();
}

uint64_t APSXPCServerGetDisconnectNotificationName()
{
  return MEMORY[0x24BE03760]();
}

uint64_t APSXPCServerPostEvent()
{
  return MEMORY[0x24BE03768]();
}

uint64_t APSXPCServerStart()
{
  return MEMORY[0x24BE03770]();
}

uint64_t APTNANDataSessionIssueReportCreate()
{
  return MEMORY[0x24BDFD558]();
}

uint64_t APTNANDataSessionStatisticsReportCopyDictionary()
{
  return MEMORY[0x24BDFD560]();
}

uint64_t APTTrafficMetricsConnectionClosed()
{
  return MEMORY[0x24BDFD568]();
}

uint64_t APTTrafficMetricsConnectionFormed()
{
  return MEMORY[0x24BDFD570]();
}

uint64_t APTTrafficMetricsCreate()
{
  return MEMORY[0x24BDFD578]();
}

uint64_t APTTrafficMetricsMessageProcessed()
{
  return MEMORY[0x24BDFD580]();
}

uint64_t APTTrafficMetricsMessageReadFinished()
{
  return MEMORY[0x24BDFD588]();
}

uint64_t APTTrafficMetricsMessageReadStarted()
{
  return MEMORY[0x24BDFD590]();
}

uint64_t APTransportConnectionGetCMBaseObject()
{
  return MEMORY[0x24BDFD598]();
}

uint64_t APTransportConnectionTCPUnbufferedNWCreate()
{
  return MEMORY[0x24BDFD5A0]();
}

uint64_t APTransportConnectionUDPNWCreate()
{
  return MEMORY[0x24BDFD5A8]();
}

uint64_t APTransportGetSharedTransport()
{
  return MEMORY[0x24BDFD5C0]();
}

uint64_t APTransportTrafficRegistrarAWDLTrafficRegistrationCreate()
{
  return MEMORY[0x24BDFD5C8]();
}

uint64_t APTransportTrafficRegistrarGetAWDLChannelSequence()
{
  return MEMORY[0x24BDFD5D0]();
}

uint64_t APTransportTrafficRegistrarGetRSSI()
{
  return MEMORY[0x24BDFD5D8]();
}

uint64_t APTransportTrafficRegistrarGetRegistration()
{
  return MEMORY[0x24BDFD5E0]();
}

uint64_t APTransportTrafficRegistrarGetWifiChannel()
{
  return MEMORY[0x24BDFD5E8]();
}

uint64_t APTransportTrafficRegistrarInfraTransactionCreate()
{
  return MEMORY[0x24BDFD5F0]();
}

uint64_t ASPrintF()
{
  return MEMORY[0x24BE28DF0]();
}

OSStatus AUGraphAddNode(AUGraph inGraph, const AudioComponentDescription *inDescription, AUNode *outNode)
{
  return MEMORY[0x24BDB66B0](inGraph, inDescription, outNode);
}

OSStatus AUGraphClose(AUGraph inGraph)
{
  return MEMORY[0x24BDB66C0](inGraph);
}

OSStatus AUGraphConnectNodeInput(AUGraph inGraph, AUNode inSourceNode, UInt32 inSourceOutputNumber, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x24BDB66C8](inGraph, *(_QWORD *)&inSourceNode, *(_QWORD *)&inSourceOutputNumber, *(_QWORD *)&inDestNode, *(_QWORD *)&inDestInputNumber);
}

OSStatus AUGraphGetIndNode(AUGraph inGraph, UInt32 inIndex, AUNode *outNode)
{
  return MEMORY[0x24BDB66D8](inGraph, *(_QWORD *)&inIndex, outNode);
}

OSStatus AUGraphGetNodeCount(AUGraph inGraph, UInt32 *outNumberOfNodes)
{
  return MEMORY[0x24BDB66E0](inGraph, outNumberOfNodes);
}

OSStatus AUGraphInitialize(AUGraph inGraph)
{
  return MEMORY[0x24BDB66E8](inGraph);
}

OSStatus AUGraphIsInitialized(AUGraph inGraph, Boolean *outIsInitialized)
{
  return MEMORY[0x24BDB66F0](inGraph, outIsInitialized);
}

OSStatus AUGraphIsOpen(AUGraph inGraph, Boolean *outIsOpen)
{
  return MEMORY[0x24BDB66F8](inGraph, outIsOpen);
}

OSStatus AUGraphIsRunning(AUGraph inGraph, Boolean *outIsRunning)
{
  return MEMORY[0x24BDB6700](inGraph, outIsRunning);
}

OSStatus AUGraphNodeInfo(AUGraph inGraph, AUNode inNode, AudioComponentDescription *outDescription, AudioUnit *outAudioUnit)
{
  return MEMORY[0x24BDB6708](inGraph, *(_QWORD *)&inNode, outDescription, outAudioUnit);
}

OSStatus AUGraphOpen(AUGraph inGraph)
{
  return MEMORY[0x24BDB6710](inGraph);
}

OSStatus AUGraphSetNodeInputCallback(AUGraph inGraph, AUNode inDestNode, UInt32 inDestInputNumber, const AURenderCallbackStruct *inInputCallback)
{
  return MEMORY[0x24BDB6728](inGraph, *(_QWORD *)&inDestNode, *(_QWORD *)&inDestInputNumber, inInputCallback);
}

OSStatus AUGraphStart(AUGraph inGraph)
{
  return MEMORY[0x24BDB6730](inGraph);
}

OSStatus AUGraphStop(AUGraph inGraph)
{
  return MEMORY[0x24BDB6738](inGraph);
}

OSStatus AUGraphUninitialize(AUGraph inGraph)
{
  return MEMORY[0x24BDB6740](inGraph);
}

uint64_t AirPlayCreateAWDLChannelSequenceString()
{
  return MEMORY[0x24BE03778]();
}

uint64_t AirPlayDeviceSupportsAWDLSolo()
{
  return MEMORY[0x24BE03780]();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BDB67F0](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x24BDB67F8](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6800](inAudioConverter, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x24BDB6810](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BDB6820](inAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6828](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6A10](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x24BDB6A18](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x24BDB6A20](inUnit);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x24BDB6A48](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6A50](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

uint64_t Base64Decode()
{
  return MEMORY[0x24BE28E00]();
}

uint64_t Base64DecodeCopy()
{
  return MEMORY[0x24BE28E08]();
}

uint64_t Base64EncodeCopyEx()
{
  return MEMORY[0x24BE28E10]();
}

uint64_t BitListString_Make()
{
  return MEMORY[0x24BE28E18]();
}

uint64_t BitListString_Parse()
{
  return MEMORY[0x24BE28E20]();
}

uint64_t BonjourAdvertiserCreate()
{
  return MEMORY[0x24BE28E28]();
}

uint64_t BonjourAdvertiserGenerateStatisticsNAN()
{
  return MEMORY[0x24BE28E30]();
}

uint64_t BonjourAdvertiserReportNANIssue()
{
  return MEMORY[0x24BE28E38]();
}

uint64_t BonjourAdvertiserSetDispatchQueue()
{
  return MEMORY[0x24BE28E40]();
}

uint64_t BonjourAdvertiserSetDomain()
{
  return MEMORY[0x24BE28E48]();
}

uint64_t BonjourAdvertiserSetFlags()
{
  return MEMORY[0x24BE28E50]();
}

uint64_t BonjourAdvertiserSetInterfaceIndex()
{
  return MEMORY[0x24BE28E58]();
}

uint64_t BonjourAdvertiserSetNANControlFlags()
{
  return MEMORY[0x24BE28E60]();
}

uint64_t BonjourAdvertiserSetNANCustomData()
{
  return MEMORY[0x24BE28E68]();
}

uint64_t BonjourAdvertiserSetName()
{
  return MEMORY[0x24BE28E70]();
}

uint64_t BonjourAdvertiserSetP2P()
{
  return MEMORY[0x24BE28E78]();
}

uint64_t BonjourAdvertiserSetPort()
{
  return MEMORY[0x24BE28E80]();
}

uint64_t BonjourAdvertiserSetServiceType()
{
  return MEMORY[0x24BE28E88]();
}

uint64_t BonjourAdvertiserSetTXTRecord()
{
  return MEMORY[0x24BE28E90]();
}

uint64_t BonjourAdvertiserSetTrafficFlags()
{
  return MEMORY[0x24BE28E98]();
}

uint64_t BonjourAdvertiserStart()
{
  return MEMORY[0x24BE28EA0]();
}

uint64_t BonjourAdvertiserStop()
{
  return MEMORY[0x24BE28EA8]();
}

uint64_t BonjourAdvertiserUpdate()
{
  return MEMORY[0x24BE28EB0]();
}

uint64_t BonjourAdvertiserUpdateLinkStatusNAN()
{
  return MEMORY[0x24BE28EB8]();
}

uint64_t BonjourDevice_GetInt64()
{
  return MEMORY[0x24BE28EF8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

uint64_t CFAppendPrintF()
{
  return MEMORY[0x24BE28F08]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

uint64_t CFArrayAppendBytes()
{
  return MEMORY[0x24BE28F10]();
}

uint64_t CFArrayAppendInt64()
{
  return MEMORY[0x24BE28F18]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

uint64_t CFArrayApplyBlock()
{
  return MEMORY[0x24BE28F20]();
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

uint64_t CFArrayEnsureCreatedAndAppend()
{
  return MEMORY[0x24BE28F28]();
}

uint64_t CFArrayEnsureCreatedAndAppendCString()
{
  return MEMORY[0x24BE28F30]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

uint64_t CFArrayGetTypedValueAtIndex()
{
  return MEMORY[0x24BE28F38]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x24BDBB8B0](alloc, str, attributes);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

uint64_t CFCreateWithPlistBytes()
{
  return MEMORY[0x24BE28F40]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

uint64_t CFDictionaryApplyBlock()
{
  return MEMORY[0x24BE28F48]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x24BDBBDD0](theDict, value);
}

uint64_t CFDictionaryCopyCString()
{
  return MEMORY[0x24BE28F50]();
}

uint64_t CFDictionaryCopyKeys()
{
  return MEMORY[0x24BE28F58]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

uint64_t CFDictionaryGetCString()
{
  return MEMORY[0x24BE28F60]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

uint64_t CFDictionaryGetData()
{
  return MEMORY[0x24BE28F68]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetEmpty()
{
  return MEMORY[0x24BE28F78]();
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x24BE28F80]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x24BE28F90]();
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

uint64_t CFDictionaryMergeDictionary()
{
  return MEMORY[0x24BE28FA0]();
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

uint64_t CFDictionarySetCString()
{
  return MEMORY[0x24BE28FA8]();
}

uint64_t CFDictionarySetData()
{
  return MEMORY[0x24BE28FB0]();
}

uint64_t CFDictionarySetDouble()
{
  return MEMORY[0x24BE28FB8]();
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x24BE28FC0]();
}

uint64_t CFDictionarySetNumber()
{
  return MEMORY[0x24BE28FC8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

uint64_t CFGetCString()
{
  return MEMORY[0x24BE28FD0]();
}

uint64_t CFGetDouble()
{
  return MEMORY[0x24BE28FD8]();
}

uint64_t CFGetInt64()
{
  return MEMORY[0x24BE28FE0]();
}

uint64_t CFGetInt64Ranged()
{
  return MEMORY[0x24BE28FE8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

uint64_t CFNumberCreateInt64()
{
  return MEMORY[0x24BE28FF8]();
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x24BDBC0B8](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x24BDBC0C0](allocator, formatter, string, rangep, options);
}

uint64_t CFNumberGetObject()
{
  return MEMORY[0x24BE29000]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

uint64_t CFObjectControlAsync()
{
  return MEMORY[0x24BE29008]();
}

uint64_t CFObjectControlAsyncF()
{
  return MEMORY[0x24BE29010]();
}

uint64_t CFObjectControlSync()
{
  return MEMORY[0x24BE29018]();
}

uint64_t CFObjectGetBytes()
{
  return MEMORY[0x24BE29020]();
}

uint64_t CFObjectGetCString()
{
  return MEMORY[0x24BE29028]();
}

uint64_t CFObjectGetInt64()
{
  return MEMORY[0x24BE29030]();
}

uint64_t CFObjectGetInt64Ranged()
{
  return MEMORY[0x24BE29038]();
}

uint64_t CFObjectGetPropertyCStringSync()
{
  return MEMORY[0x24BE29040]();
}

uint64_t CFObjectGetPropertyDoubleSync()
{
  return MEMORY[0x24BE29048]();
}

uint64_t CFObjectGetPropertyInt64Sync()
{
  return MEMORY[0x24BE29050]();
}

uint64_t CFObjectSetProperty()
{
  return MEMORY[0x24BE29058]();
}

uint64_t CFObjectSetPropertyCString()
{
  return MEMORY[0x24BE29060]();
}

uint64_t CFObjectSetPropertyDouble()
{
  return MEMORY[0x24BE29068]();
}

uint64_t CFObjectSetPropertyF()
{
  return MEMORY[0x24BE29070]();
}

uint64_t CFObjectSetPropertyInt64()
{
  return MEMORY[0x24BE29078]();
}

uint64_t CFObjectSetValue()
{
  return MEMORY[0x24BE29080]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x24BE29098]();
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x24BE290C0]();
}

uint64_t CFPropertyListCreateFormattedVAList()
{
  return MEMORY[0x24BE290C8]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x24BDBC200](plist, format);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

uint64_t CFSetApplyBlock()
{
  return MEMORY[0x24BE290D0]();
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC430](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

uint64_t CFStringAppendF()
{
  return MEMORY[0x24BE290D8]();
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t CFStringCopyUTF8CString()
{
  return MEMORY[0x24BE290E0]();
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

uint64_t CFStringCreateF()
{
  return MEMORY[0x24BE290E8]();
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
  MEMORY[0x24BDBC738](theString, trimString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

uint64_t CGColorCreateWithRGB()
{
  return MEMORY[0x24BE290F0]();
}

uint64_t CGColorGetBlack()
{
  return MEMORY[0x24BE290F8]();
}

uint64_t CGColorSpaceGetRGB()
{
  return MEMORY[0x24BE29100]();
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE060](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
  MEMORY[0x24BDBE110](c, points, count);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x24BDBF140](dict, size);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0040](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

uint64_t CMBaseClassGetCFTypeID()
{
  return MEMORY[0x24BDC0070]();
}

uint64_t CMBaseGetClassID()
{
  return MEMORY[0x24BDC0078]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetProtocolVTable()
{
  return MEMORY[0x24BDC0088]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

uint64_t CMBaseObjectIsMemberOfClass()
{
  return MEMORY[0x24BDC0098]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A8](desc, extensionKey);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x24BDC0248]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDC4A90](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x24BDC4AA0](line, flushFactor, flushWidth);
  return result;
}

uint64_t CUSetSystemName()
{
  return MEMORY[0x24BE29208]();
}

uint64_t CopyEDIDbyUUID()
{
  return MEMORY[0x24BE292C0]();
}

uint64_t CoreAudioRampParameterStart()
{
  return MEMORY[0x24BE292C8]();
}

uint64_t CreateBinaryTXTRecordFromTXTRecordBytes()
{
  return MEMORY[0x24BE03788]();
}

uint64_t CreateCAContextForRemoteHosting()
{
  return MEMORY[0x24BE292D0]();
}

uint64_t DMAPContentBlock_GetNextChunk()
{
  return MEMORY[0x24BE29300]();
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x24BDAC410](sdRef);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x24BDAC428](sdRef);
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x24BDAC430](sdRef);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x24BDAC448](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

uint64_t DataBuffer_AppendF()
{
  return MEMORY[0x24BE29308]();
}

uint64_t DataBuffer_AppendFile()
{
  return MEMORY[0x24BE29310]();
}

uint64_t DataBuffer_Commit()
{
  return MEMORY[0x24BE29320]();
}

uint64_t DataBuffer_Free()
{
  return MEMORY[0x24BE29330]();
}

uint64_t DataBuffer_Init()
{
  return MEMORY[0x24BE29338]();
}

uint64_t DataBuffer_RunProcessAndAppendOutput()
{
  return MEMORY[0x24BE29340]();
}

uint64_t DataToHexCStringEx()
{
  return MEMORY[0x24BE29348]();
}

uint64_t DebugIPC_EnsureFinalized()
{
  return MEMORY[0x24BE29358]();
}

uint64_t DebugIPC_EnsureInitialized()
{
  return MEMORY[0x24BE29360]();
}

OSStatus DisposeAUGraph(AUGraph inGraph)
{
  return MEMORY[0x24BDB6AB0](inGraph);
}

uint64_t DrainUDPSocket()
{
  return MEMORY[0x24BE29368]();
}

uint64_t FPrintF()
{
  return MEMORY[0x24BE29370]();
}

uint64_t FVDUtilsEncryptedDecodeSupported()
{
  return MEMORY[0x24BDDCD30]();
}

uint64_t FVDUtilsGetTempDirectory()
{
  return MEMORY[0x24BDDCD38]();
}

uint64_t FadeOutLayerThruBlack()
{
  return MEMORY[0x24BE29378]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t FigBaseClassRegisterClass()
{
  return MEMORY[0x24BDC0698]();
}

uint64_t FigCFArrayGetInt64AtIndex()
{
  return MEMORY[0x24BDC06A8]();
}

uint64_t FigCFDictionaryCopyArrayOfValues()
{
  return MEMORY[0x24BDC06B0]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x24BDC06B8]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x24BDC06C0]();
}

uint64_t FigCFDictionaryGetCGSizeIfPresent()
{
  return MEMORY[0x24BDC06D0]();
}

uint64_t FigCFDictionaryGetCount()
{
  return MEMORY[0x24BDC06E0]();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return MEMORY[0x24BDC06E8]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x24BDC06F0]();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return MEMORY[0x24BDC06F8]();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return MEMORY[0x24BDC0700]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x24BDC0708]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x24BDC0710]();
}

uint64_t FigCFDictionarySetCGSize()
{
  return MEMORY[0x24BDC0718]();
}

uint64_t FigCFDictionarySetDouble()
{
  return MEMORY[0x24BDC0728]();
}

uint64_t FigCFDictionarySetFloat32()
{
  return MEMORY[0x24BDC0730]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x24BDC0738]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x24BDC0740]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x24BDC0748]();
}

uint64_t FigCFDictionarySetValueFromKeyInDict()
{
  return MEMORY[0x24BDC0750]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x24BDC0758]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x24BDC0768]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x24BDC0770]();
}

uint64_t FigCFNumberCreateUInt64()
{
  return MEMORY[0x24BDC0778]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x24BDC0780]();
}

uint64_t FigCFNumberGetUInt64()
{
  return MEMORY[0x24BDC0788]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x24BDC0790]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x24BDC0798]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x24BDC07A0]();
}

uint64_t FigCFWeakReferenceTableAddValueAndGetKey()
{
  return MEMORY[0x24BDC07B8]();
}

uint64_t FigCFWeakReferenceTableCopyValue()
{
  return MEMORY[0x24BDC07C0]();
}

uint64_t FigCFWeakReferenceTableCreate()
{
  return MEMORY[0x24BDC07C8]();
}

uint64_t FigCFWeakReferenceTableRemoveValue()
{
  return MEMORY[0x24BDC07D0]();
}

uint64_t FigCPEProtectorRemoteCreateForScheme()
{
  return MEMORY[0x24BDDCD48]();
}

uint64_t FigCreateCFDataFromCFPropertyList()
{
  return MEMORY[0x24BDC07F0]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x24BDC0820]();
}

uint64_t FigEndpointExtendedGetClassID()
{
  return MEMORY[0x24BDC0848]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x24BDC0850]();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return MEMORY[0x24BDC08B8]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x24BDC08C0]();
}

uint64_t FigGetIOSurfaceTimingStatsFromTimingInfoDictionary()
{
  return MEMORY[0x24BDDCDD0]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x24BDC0908]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x24BDC0920]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x24BDC0968]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x24BDC0970]();
}

uint64_t FigPKDStartAirPlayReceiverSession()
{
  return MEMORY[0x24BDDCDE0]();
}

uint64_t FigPKDStopAirPlayReceiverSession()
{
  return MEMORY[0x24BDDCDE8]();
}

uint64_t FigPWDKeyExchangeReceiverCreate()
{
  return MEMORY[0x24BDDCDF0]();
}

uint64_t FigPWDKeyExchangeReceiverGetTypeID()
{
  return MEMORY[0x24BDDCDF8]();
}

uint64_t FigRouteDiscovererXPCRemoteCreate()
{
  return MEMORY[0x24BE64970]();
}

uint64_t FigRoutingContextRemoteCreateControlChannelOnlyContext()
{
  return MEMORY[0x24BE64978]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x24BDC09C0]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x24BDC09C8]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x24BDC09D0]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x24BDC09D8]();
}

uint64_t FigSimpleMutexCheckIsNotLockedOnThisThread()
{
  return MEMORY[0x24BDC09F0]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x24BDC09F8]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x24BDC0A00]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x24BDC0A08]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x24BDC0A10]();
}

uint64_t FigSupportsIOSurfaceTimingInfo()
{
  return MEMORY[0x24BDDCE18]();
}

uint64_t FigThreadCreate()
{
  return MEMORY[0x24BDC0A68]();
}

uint64_t FigThreadGetMachThreadPriorityValue()
{
  return MEMORY[0x24BDC0A70]();
}

uint64_t FigThreadJoin()
{
  return MEMORY[0x24BDC0A78]();
}

uint64_t FigThreadSetProperty()
{
  return MEMORY[0x24BDC0A88]();
}

uint64_t FigTransportGetCMBaseObject()
{
  return MEMORY[0x24BDC0A90]();
}

uint64_t FigValeriaGetCMBaseObject()
{
  return MEMORY[0x24BDDCE28]();
}

uint64_t FigValeriaGetTypeID()
{
  return MEMORY[0x24BDDCE38]();
}

uint64_t FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom()
{
  return MEMORY[0x24BDC0AA0]();
}

uint64_t FigVideoQueueCreate()
{
  return MEMORY[0x24BDDCE40]();
}

uint64_t FigVideoQueueGetCMBaseObject()
{
  return MEMORY[0x24BDDCE48]();
}

uint64_t FigVirtualDisplaySinkFileWriterCreate()
{
  return MEMORY[0x24BDDCE60]();
}

uint64_t FigVirtualDisplaySinkGetCMBaseObject()
{
  return MEMORY[0x24BDDCE68]();
}

uint64_t GestaltGetBoolean()
{
  return MEMORY[0x24BE29390]();
}

uint64_t GestaltGetCString()
{
  return MEMORY[0x24BE29398]();
}

uint64_t GetDeviceInternalModelString()
{
  return MEMORY[0x24BE293B0]();
}

uint64_t GetDeviceModelString()
{
  return MEMORY[0x24BE293B8]();
}

uint64_t GetDeviceName()
{
  return MEMORY[0x24BE293C0]();
}

uint64_t GetDeviceUniqueID()
{
  return MEMORY[0x24BE293C8]();
}

uint64_t GetFairPlayHWInfo()
{
  return MEMORY[0x24BE293D0]();
}

uint64_t GetPeerMACAddress()
{
  return MEMORY[0x24BE293E8]();
}

uint64_t GetSystemBuildVersionString()
{
  return MEMORY[0x24BE293F8]();
}

uint64_t GvMGlTNs()
{
  return MEMORY[0x24BE03798]();
}

uint64_t HTTPClientCreateWithSocket()
{
  return MEMORY[0x24BE29420]();
}

uint64_t HTTPClientGetClientID()
{
  return MEMORY[0x24BE29428]();
}

uint64_t HTTPClientGetPeerAddress()
{
  return MEMORY[0x24BE29430]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x24BE29438]();
}

uint64_t HTTPClientSendMessage()
{
  return MEMORY[0x24BE29440]();
}

uint64_t HTTPClientSetConnectionLogging()
{
  return MEMORY[0x24BE29448]();
}

uint64_t HTTPClientSetDelegate()
{
  return MEMORY[0x24BE29450]();
}

uint64_t HTTPClientSetDispatchQueue()
{
  return MEMORY[0x24BE29460]();
}

uint64_t HTTPClientSetFlags()
{
  return MEMORY[0x24BE29468]();
}

uint64_t HTTPClientSetLogging()
{
  return MEMORY[0x24BE29470]();
}

uint64_t HTTPClientSetTimeout()
{
  return MEMORY[0x24BE29478]();
}

uint64_t HTTPClientSetTransportDelegate()
{
  return MEMORY[0x24BE29480]();
}

uint64_t HTTPConnectionDetach()
{
  return MEMORY[0x24BE29488]();
}

uint64_t HTTPConnectionSendResponse()
{
  return MEMORY[0x24BE29490]();
}

uint64_t HTTPConnectionSetDelegate()
{
  return MEMORY[0x24BE29498]();
}

uint64_t HTTPConnectionSetTransportDelegate()
{
  return MEMORY[0x24BE294A0]();
}

uint64_t HTTPConnectionStop()
{
  return MEMORY[0x24BE294A8]();
}

uint64_t HTTPGetHeaderField()
{
  return MEMORY[0x24BE294B0]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x24BE294C0]();
}

uint64_t HTTPHeader_InitResponse()
{
  return MEMORY[0x24BE294D0]();
}

uint64_t HTTPHeader_Parse()
{
  return MEMORY[0x24BE294D8]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x24BE294E0]();
}

uint64_t HTTPMakeDateString()
{
  return MEMORY[0x24BE294E8]();
}

uint64_t HTTPMakeTimedNonce()
{
  return MEMORY[0x24BE294F0]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x24BE294F8]();
}

uint64_t HTTPMessageCreateDictionary()
{
  return MEMORY[0x24BE29500]();
}

uint64_t HTTPMessageGetOrCopyFormVariable()
{
  return MEMORY[0x24BE29508]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x24BE29510]();
}

uint64_t HTTPParseParameter()
{
  return MEMORY[0x24BE29528]();
}

uint64_t HTTPParseRTPInfo()
{
  return MEMORY[0x24BE29530]();
}

uint64_t HTTPReadHeader()
{
  return MEMORY[0x24BE29538]();
}

uint64_t HTTPScanFHeaderValue()
{
  return MEMORY[0x24BE29540]();
}

uint64_t HTTPServerCreate()
{
  return MEMORY[0x24BE29548]();
}

uint64_t HTTPServerSetDispatchQueue()
{
  return MEMORY[0x24BE29550]();
}

uint64_t HTTPVerifyAuthorization()
{
  return MEMORY[0x24BE29588]();
}

uint64_t HTTPVerifyTimedNonce()
{
  return MEMORY[0x24BE29590]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x24BE29598]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

uint64_t IPv4AddressToCString()
{
  return MEMORY[0x24BE295A8]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t IsAppleTV()
{
  return MEMORY[0x24BE295B8]();
}

uint64_t KUY675K4ryxHGzD5GVD()
{
  return MEMORY[0x24BE037A0]();
}

uint64_t LogControl()
{
  return MEMORY[0x24BE295D8]();
}

uint64_t LogControlCF()
{
  return MEMORY[0x24BE295E0]();
}

uint64_t LogHTTP()
{
  return MEMORY[0x24BE295E8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t LogSetAppID()
{
  return MEMORY[0x24BE29600]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MillisecondsToUpTicks()
{
  return MEMORY[0x24BE29640]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x24BE296A8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

uint64_t NTPtoUpTicks()
{
  return MEMORY[0x24BE296F0]();
}

uint64_t NetPerfCreate()
{
  return MEMORY[0x24BE296F8]();
}

uint64_t NetSocketChaCha20Poly1305Configure()
{
  return MEMORY[0x24BE29700]();
}

uint64_t NetSocket_Cancel()
{
  return MEMORY[0x24BE29718]();
}

uint64_t NetSocket_Create()
{
  return MEMORY[0x24BE29720]();
}

uint64_t NetSocket_CreateWithNative()
{
  return MEMORY[0x24BE29728]();
}

uint64_t NetSocket_Delete()
{
  return MEMORY[0x24BE29730]();
}

uint64_t NetSocket_Disconnect()
{
  return MEMORY[0x24BE29738]();
}

uint64_t NetSocket_GetNative()
{
  return MEMORY[0x24BE29740]();
}

uint64_t NetSocket_TCPConnect()
{
  return MEMORY[0x24BE29750]();
}

uint64_t NetSocket_Wait()
{
  return MEMORY[0x24BE29758]();
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x24BE29760]();
}

uint64_t NetTransportGCMConfigure()
{
  return MEMORY[0x24BE29768]();
}

OSStatus NewAUGraph(AUGraph *outGraph)
{
  return MEMORY[0x24BDB6BC0](outGraph);
}

uint64_t OpenSelfConnectedLoopbackSocket()
{
  return MEMORY[0x24BE29888]();
}

uint64_t PCFdAVst()
{
  return MEMORY[0x24BE037A8]();
}

uint64_t PHDcW8()
{
  return MEMORY[0x24BE037B0]();
}

uint64_t PIDInit()
{
  return MEMORY[0x24BE29890]();
}

uint64_t PIDUpdate()
{
  return MEMORY[0x24BE29898]();
}

uint64_t PairingSessionCopyIdentity()
{
  return MEMORY[0x24BE298A0]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x24BE298A8]();
}

uint64_t PairingSessionDeletePeer()
{
  return MEMORY[0x24BE298B0]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x24BE298B8]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x24BE298C0]();
}

uint64_t PairingSessionSetACL()
{
  return MEMORY[0x24BE298C8]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x24BE298D0]();
}

uint64_t PairingSessionSetKeychainInfo()
{
  return MEMORY[0x24BE298D8]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x24BE298E0]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x24BE298E8]();
}

uint64_t PairingSessionSetSignBytesHandler_b()
{
  return MEMORY[0x24BE298F0]();
}

uint64_t PairingSessionSetVerifySignatureHandler_b()
{
  return MEMORY[0x24BE298F8]();
}

uint64_t ParseFractionalDateString()
{
  return MEMORY[0x24BE29900]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t RandomString()
{
  return MEMORY[0x24BE29918]();
}

uint64_t RemovePath()
{
  return MEMORY[0x24BE29920]();
}

uint64_t SDPFindAttribute()
{
  return MEMORY[0x24BE29930]();
}

uint64_t SDPFindMediaSection()
{
  return MEMORY[0x24BE29938]();
}

uint64_t SDPFindParameter()
{
  return MEMORY[0x24BE29940]();
}

uint64_t SDPFindSessionSection()
{
  return MEMORY[0x24BE29948]();
}

uint64_t SDPFindType()
{
  return MEMORY[0x24BE29950]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x24BE29958]();
}

uint64_t SNScanF()
{
  return MEMORY[0x24BE29960]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x24BE29968]();
}

uint64_t SendSelfConnectedLoopbackMessage()
{
  return MEMORY[0x24BE29978]();
}

uint64_t ServerSocketOpen()
{
  return MEMORY[0x24BE29980]();
}

uint64_t SetCurrentThreadPriority()
{
  return MEMORY[0x24BE29988]();
}

uint64_t SockAddrCopy()
{
  return MEMORY[0x24BE299A0]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x24BE299A8]();
}

uint64_t SockAddrGetSize()
{
  return MEMORY[0x24BE299B0]();
}

uint64_t SockAddrSetPort()
{
  return MEMORY[0x24BE299B8]();
}

uint64_t SockAddrToDeviceID()
{
  return MEMORY[0x24BE299C0]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x24BE299C8]();
}

uint64_t SocketAccept()
{
  return MEMORY[0x24BE299D0]();
}

uint64_t SocketRecvFrom()
{
  return MEMORY[0x24BE299E0]();
}

uint64_t SocketSetKeepAlive()
{
  return MEMORY[0x24BE299E8]();
}

uint64_t SocketSetKeepAliveEx()
{
  return MEMORY[0x24BE299F0]();
}

uint64_t SocketSetP2P()
{
  return MEMORY[0x24BE299F8]();
}

uint64_t SocketSetPacketTimestamps()
{
  return MEMORY[0x24BE29A00]();
}

uint64_t SocketSetQoS()
{
  return MEMORY[0x24BE29A08]();
}

uint64_t SocketWriteData()
{
  return MEMORY[0x24BE29A18]();
}

uint64_t SourceVersionToCString()
{
  return MEMORY[0x24BE29A20]();
}

uint64_t SrtySZG0()
{
  return MEMORY[0x24BE037B8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
}

uint64_t StringToUUID()
{
  return MEMORY[0x24BE29A30]();
}

uint64_t Swap16Mem()
{
  return MEMORY[0x24BE29A38]();
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x24BDAC558](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x24BDAC560](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x24BDAC568](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x24BDAC580](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x24BDAC588](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x24BDAC590](txtRecord, key, valueSize, value);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x24BE29A98]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x24BE29AA0]();
}

uint64_t TextToInt32()
{
  return MEMORY[0x24BE29AA8]();
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x24BE29AB0]();
}

uint64_t TruncateUTF8()
{
  return MEMORY[0x24BE29AB8]();
}

uint64_t URLGetNextPathSegment()
{
  return MEMORY[0x24BE29AC0]();
}

uint64_t URLGetOrCopyNextVariable()
{
  return MEMORY[0x24BE29AC8]();
}

uint64_t UUIDGet()
{
  return MEMORY[0x24BE29AD0]();
}

uint64_t UUIDtoCString()
{
  return MEMORY[0x24BE29AD8]();
}

uint64_t UpTicksPerSecond()
{
  return MEMORY[0x24BE29AE0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x24BE29AF0]();
}

uint64_t UpTicksToNanoseconds()
{
  return MEMORY[0x24BE29AF8]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x24BE29B00]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

uint64_t VASPrintF()
{
  return MEMORY[0x24BE29B10]();
}

uint64_t VBAEFt()
{
  return MEMORY[0x24BE037C0]();
}

uint64_t WriteStackshotReport_async()
{
  return MEMORY[0x24BE29F98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t chacha20_poly1305_add_aad()
{
  return MEMORY[0x24BE29B70]();
}

uint64_t chacha20_poly1305_decrypt()
{
  return MEMORY[0x24BE29B78]();
}

uint64_t chacha20_poly1305_init_64x64()
{
  return MEMORY[0x24BE29BB0]();
}

uint64_t chacha20_poly1305_verify()
{
  return MEMORY[0x24BE29BB8]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFA8](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
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

uint64_t gQblcfSzZBQsYCCV()
{
  return MEMORY[0x24BE037D8]();
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x24BDAE7A0](a1, *(_QWORD *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
  MEMORY[0x24BDAE7A8](a1);
}

uint64_t h4BvW7X()
{
  return MEMORY[0x24BE037E0]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2380](obj);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t proc_set_wakemon_params()
{
  return MEMORY[0x24BDAF748]();
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x24BDAFCF8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

uint64_t snprintf_add()
{
  return MEMORY[0x24BE29BE0]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t strcmp_prefix()
{
  return MEMORY[0x24BE29BE8]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strncasestr()
{
  return MEMORY[0x24BE29BF8]();
}

uint64_t strncmp_prefix()
{
  return MEMORY[0x24BE29C00]();
}

uint64_t strncmpx()
{
  return MEMORY[0x24BE29C08]();
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x24BE29C10]();
}

uint64_t strnicmp_suffix()
{
  return MEMORY[0x24BE29C18]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x24BE29C20]();
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

uint64_t xpc_dictionary_copy_cf_object()
{
  return MEMORY[0x24BE29C28]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_set_cf_object()
{
  return MEMORY[0x24BE29C30]();
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

