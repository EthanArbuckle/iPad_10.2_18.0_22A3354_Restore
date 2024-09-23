@implementation Control

void __screenstreamudp_Control_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  uint64_t Int64;
  uint64_t v7;
  const char *v8;
  int v9;
  int v10;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v12;
  uint64_t v13;
  const __CFDictionary *DisplayHDRMode;
  const void **v15;
  const void *v16;
  uint64_t v17;
  uint64_t TypedValue;
  int v19;
  __int128 v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  CFTypeRef v29;
  int v30;

  v2 = (const void *)a1[5];
  v3 = a1[6];
  v30 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v29 = 0;
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    v10 = -16762;
    v30 = -16762;
LABEL_22:
    APSLogErrorAt();
    goto LABEL_55;
  }
  if (!v3)
  {
    v10 = -16760;
    v30 = -16760;
    goto LABEL_22;
  }
  v5 = DerivedStorage;
  Int64 = CFDictionaryGetInt64();
  if (Int64 == *(_QWORD *)(v5 + 240))
    goto LABEL_54;
  v7 = Int64;
  if (!Int64)
  {
    v8 = "default";
    goto LABEL_9;
  }
  if (Int64 != 1)
  {
    if (gLogCategory_APEndpointStreamScreenUDP <= 90
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = -16760;
    v30 = -16760;
    goto LABEL_22;
  }
  if (!*(_BYTE *)(v5 + 249))
    goto LABEL_54;
  v8 = "media presentation";
LABEL_9:
  if (gLogCategory_APEndpointStreamScreenUDP >= 51)
  {
    *(_QWORD *)(v5 + 240) = Int64;
  }
  else
  {
    if (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize())
    {
      *(_QWORD *)&v20 = v2;
      *((_QWORD *)&v20 + 1) = v8;
      LogPrintF();
    }
    v9 = gLogCategory_APEndpointStreamScreenUDP;
    *(_QWORD *)(v5 + 240) = v7;
    if (v9 <= 40 && (v9 != -1 || _LogCategory_Initialize()))
    {
      *(_QWORD *)&v20 = v2;
      LogPrintF();
    }
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v10 = -16761;
    v30 = -16761;
    goto LABEL_55;
  }
  v12 = Mutable;
  if (!*(_BYTE *)(v5 + 112) || !*(_BYTE *)(v5 + 113) || !*(_QWORD *)(v5 + 120))
    goto LABEL_52;
  v23 = *MEMORY[0x1E0C9D820];
  v22 = 0;
  if (*(_QWORD *)(v5 + 240) == 1)
  {
    APSScreenGetMediaPresentationParams();
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      v21 = 0;
      v20 = v23;
      LogPrintF();
    }
  }
  else
  {
    v23 = *(_OWORD *)(v5 + 152);
    v22 = *(_DWORD *)(v5 + 260);
  }
  v24 = v23;
  LODWORD(v25) = v22;
  v13 = *(_QWORD *)(v5 + 240);
  BYTE8(v26) = v13 == 1;
  *(_QWORD *)&v27 = screenstreamudp_getDisplayHDRMode(v5);
  if (!*(_BYTE *)(v5 + 113))
    goto LABEL_50;
  CFDictionarySetInt64();
  DisplayHDRMode = screenstreamudp_getDisplayHDRMode(v5);
  CFDictionarySetValue(v12, CFSTR("displayHDRMode"), DisplayHDRMode);
  v15 = (const void **)MEMORY[0x1E0C9AE50];
  if (!*(_BYTE *)(v5 + 255))
    v15 = (const void **)MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(v12, CFSTR("hdrMirroringSupported"), *v15);
  if (objc_msgSend(*(id *)(v5 + 40), "isConfigPresentForPresentationMode:", v13 == 1))
  {
    v16 = 0;
    goto LABEL_47;
  }
  v30 = objc_msgSend(*(id *)(v5 + 40), "initializeNegotiatorWithMode:presentationMode:hdrMirroringSupported:", screenstreamudp_getDisplayHDRMode(v5), v13 == 1, *(_BYTE *)(v5 + 255) != 0, v20, v21);
  if (v30)
    goto LABEL_61;
  v17 = objc_msgSend(*(id *)(v5 + 40), "negotiationDataForPresentationMode:", v13 == 1);
  if (v17)
  {
    v16 = (const void *)v17;
    if (gLogCategory_APEndpointStreamScreenUDP <= 40
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      *(_QWORD *)&v20 = v13 == 1;
      LogPrintF();
    }
    CFDictionarySetValue(v12, CFSTR("negotiationData"), v16);
LABEL_47:
    v30 = APTransportStreamSendPlistMessageCreatingPlistReply();
    if (!v30)
    {
      if (v16)
      {
        CFDataGetTypeID();
        TypedValue = CFDictionaryGetTypedValue();
        goto LABEL_51;
      }
LABEL_50:
      TypedValue = 0;
LABEL_51:
      v30 = objc_msgSend(*(id *)(v5 + 40), "restartWithScreenOptions:negotiatedBlob:", &v24, TypedValue, (_QWORD)v20);
      if (!v30)
        goto LABEL_52;
    }
LABEL_61:
    APSLogErrorAt();
    goto LABEL_52;
  }
  APSLogErrorAt();
  v30 = -16761;
LABEL_52:
  CFRelease(v12);
  if (v29)
    CFRelease(v29);
LABEL_54:
  v10 = v30;
  if (!v30)
  {
    v19 = 0;
    goto LABEL_57;
  }
LABEL_55:
  screenstreamudp_handleFatalError(v2, v10, CFSTR("HDR restart failed"));
  v19 = v30;
LABEL_57:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v19;
}

void __screenstream_Control_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t Int64;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  __CFDictionary *VirtualDisplayActivationOptions;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, __CFDictionary *, _QWORD);
  int v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  int v15;

  v2 = *(_QWORD *)(a1 + 48);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    v15 = -16762;
LABEL_31:
    APSLogErrorAt();
    goto LABEL_32;
  }
  if (!v2)
  {
    v15 = -16760;
    goto LABEL_31;
  }
  v4 = DerivedStorage;
  Int64 = CFDictionaryGetInt64();
  if (Int64 == *(_QWORD *)(v4 + 352))
    goto LABEL_33;
  if (*(_BYTE *)(v4 + 378))
    goto LABEL_33;
  if (*(_BYTE *)(v4 + 389))
    goto LABEL_33;
  v6 = *(_QWORD *)(v4 + 160);
  if (!v6)
    goto LABEL_33;
  v7 = Int64;
  if (!Int64)
    goto LABEL_10;
  if (Int64 != 1)
  {
    if (gLogCategory_APEndpointStreamScreen <= 90
      && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v15 = -16760;
    goto LABEL_31;
  }
  if (!*(_BYTE *)(v4 + 367))
  {
LABEL_33:
    v15 = 0;
    goto LABEL_32;
  }
LABEL_10:
  v8 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v8)
    v8(v6);
  if (gLogCategory_APEndpointStreamScreen <= 50
    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_QWORD *)(v4 + 352) = v7;
  VirtualDisplayActivationOptions = screenstream_createVirtualDisplayActivationOptions();
  v10 = *(_QWORD *)(v4 + 160);
  v11 = *(uint64_t (**)(uint64_t, __CFDictionary *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v11)
  {
    v12 = v11(v10, VirtualDisplayActivationOptions, 0);
    if (v12)
    {
      v15 = v12;
    }
    else
    {
      v13 = *(_QWORD *)(v4 + 160);
      v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v14)
      {
        v15 = v14(v13);
        if (!v15)
        {
          if (!VirtualDisplayActivationOptions)
            goto LABEL_32;
          goto LABEL_28;
        }
      }
      else
      {
        v15 = -12782;
      }
    }
  }
  else
  {
    v15 = -12782;
  }
  APSLogErrorAt();
  if (VirtualDisplayActivationOptions)
LABEL_28:
    CFRelease(VirtualDisplayActivationOptions);
LABEL_32:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v15;
}

uint64_t __screenstream_Control_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  int v8;

  result = CMBaseObjectGetDerivedStorage();
  v3 = result;
  if (gLogCategory_APEndpointStreamScreen <= 50)
  {
    if (gLogCategory_APEndpointStreamScreen != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(v3 + 24))
  {
    v8 = -16762;
    goto LABEL_14;
  }
  if (!*(_BYTE *)(v3 + 26) || (v4 = *(_QWORD *)(v3 + 160)) == 0)
  {
    v8 = 0;
    goto LABEL_15;
  }
  v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v5)
    v5(v4);
  v6 = *(_QWORD *)(v3 + 160);
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (!v7)
  {
    v8 = -12782;
LABEL_14:
    result = APSLogErrorAt();
    goto LABEL_15;
  }
  result = v7(v6);
  v8 = result;
  if ((_DWORD)result)
    goto LABEL_14;
LABEL_15:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

uint64_t __screenstream_Control_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = screenstream_handleCommandSetRecordingState(*(_QWORD *)(a1 + 40), 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __screenstream_Control_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = screenstream_handleCommandSetRecordingState(*(_QWORD *)(a1 + 40), 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __screenstream_Control_block_invoke_5(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  CFTypeID v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  int v8;
  const void *v9;
  CFTypeRef v10;
  __CFDictionary *VirtualDisplayActivationOptions;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, __CFDictionary *, _QWORD);
  int v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  int v17;
  CFTypeRef cf;

  v2 = *(const void **)(a1 + 48);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  cf = 0;
  if (*(_BYTE *)(DerivedStorage + 378))
  {
    v17 = 0;
    goto LABEL_28;
  }
  v4 = DerivedStorage;
  if (!*(_BYTE *)(DerivedStorage + 26))
  {
    v17 = 0;
    goto LABEL_26;
  }
  if (!v2 || (v5 = CFGetTypeID(v2), v5 != CFDictionaryGetTypeID()))
  {
    v17 = -16760;
LABEL_33:
    APSLogErrorAt();
    goto LABEL_26;
  }
  v6 = *(_QWORD *)(v4 + 160);
  v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v7)
    v7(v6);
  v8 = APEndpointDisplayDescriptionCreateWithDisplayInfo(*MEMORY[0x1E0C9AE00], v2, &cf);
  if (v8)
  {
    v17 = v8;
    goto LABEL_33;
  }
  if (gLogCategory_APEndpointStreamScreen <= 50
    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = *(const void **)(v4 + 72);
  v10 = cf;
  *(_QWORD *)(v4 + 72) = cf;
  if (v10)
    CFRetain(v10);
  if (v9)
    CFRelease(v9);
  screenstream_initDisplayInfo(v4);
  VirtualDisplayActivationOptions = screenstream_createVirtualDisplayActivationOptions();
  v12 = *(_QWORD *)(v4 + 160);
  v13 = *(uint64_t (**)(uint64_t, __CFDictionary *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v13)
  {
    v17 = -12782;
    goto LABEL_24;
  }
  v14 = v13(v12, VirtualDisplayActivationOptions, 0);
  if (v14)
  {
    v17 = v14;
LABEL_24:
    APSLogErrorAt();
    if (!VirtualDisplayActivationOptions)
      goto LABEL_26;
    goto LABEL_25;
  }
  v15 = *(_QWORD *)(v4 + 160);
  v16 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v16)
  {
    v17 = -12782;
    goto LABEL_24;
  }
  v17 = v16(v15);
  if (v17)
    goto LABEL_24;
  if (VirtualDisplayActivationOptions)
LABEL_25:
    CFRelease(VirtualDisplayActivationOptions);
LABEL_26:
  if (cf)
    CFRelease(cf);
LABEL_28:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v17;
}

@end
