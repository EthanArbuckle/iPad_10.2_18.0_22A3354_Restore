@implementation APEndpointManagerCarPlayCreate

void __APEndpointManagerCarPlayCreate_block_invoke(uint64_t a1)
{
  CFTypeRef *v2;
  int v3;
  uint64_t v4;
  const void *v5;
  const __CFAllocator *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFIndex ShortVersionLength;
  CFStringRef v11;
  CFStringRef v12;
  __CFDictionary *v13;
  BOOL v14;
  const void **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t);
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __CFDictionary *v32;
  int v33;
  int v34;
  _QWORD block[6];
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = APSPowerAssertionCreate();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v37 = xmmword_1C964DA6C;
    v38 = unk_1C964DA7C;
    v39 = xmmword_1C964DA8C;
    v40 = 0x2B8D08DC2B8D0800;
    v2 = (CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 352);
    if (*v2)
    {
      CFRelease(*v2);
      *v2 = 0;
    }
    v3 = APSEventRecorderCreate();
    if (v3)
    {
      v34 = v3;
      APSLogErrorAt();
      v36 = v34;
      APSLogErrorAt();
      goto LABEL_45;
    }
    v36 = 0;
    v4 = MGCopyAnswer();
    if (v4)
    {
      v5 = (const void *)v4;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!Mutable)
      {
        APSLogErrorAt();
        v36 = -16711;
        goto LABEL_44;
      }
      v8 = Mutable;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CF1E38], *(const void **)(*(_QWORD *)(a1 + 32) + 352));
      v9 = *(const __CFAllocator **)(a1 + 40);
      ShortVersionLength = APSVersionUtilsGetShortVersionLength();
      v11 = CFStringCreateWithBytesNoCopy(v9, (const UInt8 *)"800.74.1.2", ShortVersionLength, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      if (!v11)
      {
        APSLogErrorAt();
        v36 = -6728;
        v32 = v8;
        goto LABEL_43;
      }
      v12 = v11;
      v36 = APCarPlayControlServerCreate();
      if (v36)
      {
        APSLogErrorAt();
        v13 = 0;
        goto LABEL_41;
      }
      v13 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CF1DD0], *(const void **)(*(_QWORD *)(a1 + 32) + 48));
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CF1DB0], *(const void **)(*(_QWORD *)(a1 + 32) + 352));
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 360) && (!CFPrefs_GetInt64() ? (v14 = v36 == -6727) : (v14 = 1), v14))
        v15 = (const void **)MEMORY[0x1E0C9AE50];
      else
        v15 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(v13, CFSTR("enableNewDiscoveryMode"), *v15);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      *(_WORD *)(v16 + 224) = 2;
      *(_QWORD *)(v16 + 232) = "USB";
      v36 = APBrowserCarBonjourCreate();
      if (!v36)
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(v17 + 240);
        v19 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v19)
        {
          v36 = v19(v18, carManager_browserEventHandler, v17 + 224);
          if (!v36)
          {
            if (APSIsVirtualMachine())
            {
              if (gLogCategory_APEndpointManagerCarPlay <= 50
                && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
LABEL_31:
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a1 + 48);
              v24 = *(_QWORD *)(a1 + 32);
              *(_WORD *)(v24 + 80) = 0;
              *(_QWORD *)(v24 + 88) = "Session";
              v36 = APBrowserCarSessionCreate();
              if (!v36)
              {
                v25 = *(_QWORD *)(a1 + 32);
                v26 = *(_QWORD *)(v25 + 96);
                v27 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                if (v27)
                {
                  v36 = v27(v26, carManager_browserEventHandler, v25 + 80);
                  if (!v36)
                  {
                    FigCFWeakReferenceInit();
                    v36 = AirPlayDebugIPCEnableForEndpointManager(*(const void **)(a1 + 48));
                    if (!v36)
                    {
                      v28 = *(const void **)(a1 + 48);
                      if (v28)
                      {
                        CFRetain(v28);
                        v29 = *(_QWORD *)(a1 + 48);
                      }
                      else
                      {
                        v29 = 0;
                      }
                      v30 = *(_QWORD *)(a1 + 32);
                      v31 = *(NSObject **)(v30 + 24);
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = __APEndpointManagerCarPlayCreate_block_invoke_2;
                      block[3] = &__block_descriptor_48_e5_v8__0l;
                      block[4] = v30;
                      block[5] = v29;
                      dispatch_async(v31, block);
                      goto LABEL_41;
                    }
                  }
                }
                else
                {
                  v36 = -12782;
                }
              }
              goto LABEL_38;
            }
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = *(_QWORD *)(a1 + 48);
            v20 = *(_QWORD *)(a1 + 32);
            *(_WORD *)(v20 + 152) = 1;
            *(_QWORD *)(v20 + 160) = "WiFi";
            v36 = APBrowserCarBonjourCreate();
            if (!v36)
            {
              v21 = *(_QWORD *)(a1 + 32);
              v22 = *(_QWORD *)(v21 + 168);
              v23 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, int, uint64_t, uint64_t), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
              if (v23)
              {
                v36 = v23(v22, carManager_browserEventHandler, v21 + 152);
                if (!v36)
                  goto LABEL_31;
              }
              else
              {
                v36 = -12782;
              }
            }
          }
        }
        else
        {
          v36 = -12782;
        }
      }
LABEL_38:
      APSLogErrorAt();
LABEL_41:
      CFRelease(v12);
      CFRelease(v8);
      if (!v13)
      {
LABEL_44:
        CFRelease(v5);
        goto LABEL_45;
      }
      v32 = v13;
LABEL_43:
      CFRelease(v32);
      goto LABEL_44;
    }
    APSLogErrorAt();
    v33 = -6762;
  }
  else
  {
    APSLogErrorAt();
    v33 = -16711;
  }
  v36 = v33;
LABEL_45:
  CFRelease(*(CFTypeRef *)(a1 + 48));
  if (v36)
  {
    if (gLogCategory_APEndpointManagerCarPlay <= 50
      && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
    {
LABEL_51:
      LogPrintF();
    }
  }
  else if (gLogCategory_APEndpointManagerCarPlay <= 50
         && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_51;
  }
}

void __APEndpointManagerCarPlayCreate_block_invoke_2(uint64_t a1)
{
  APEndpointManagerCarPlayDelegate *v2;
  APCarPlayPreferences *v3;
  uint64_t v4;
  NSObject *v5;
  const void *v6;
  _QWORD block[5];
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (gLogCategory_APEndpointManagerCarPlay <= 50
    && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = -[APEndpointManagerCarPlayDelegate initWithEndpointManager:]([APEndpointManagerCarPlayDelegate alloc], "initWithEndpointManager:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v2;
  if (v2
    && (v3 = objc_alloc_init(APCarPlayPreferences),
        v4 = *(_QWORD *)(a1 + 32),
        (*(_QWORD *)(v4 + 32) = v3) != 0))
  {
    -[APCarPlayPreferences setDelegate:](v3, "setDelegate:", *(_QWORD *)(v4 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isCarPlayEnabled"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __APEndpointManagerCarPlayCreate_block_invoke_3;
      block[3] = &unk_1E8268E00;
      block[4] = &v9;
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(_OWORD *)(a1 + 32);
      dispatch_sync(v5, block);
    }
  }
  else
  {
    APSLogErrorAt();
    *((_DWORD *)v10 + 6) = -16711;
  }
  if (*((_DWORD *)v10 + 6))
  {
    if (gLogCategory_APEndpointManagerCarPlay <= 50
      && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
    {
LABEL_12:
      LogPrintF();
    }
  }
  else if (gLogCategory_APEndpointManagerCarPlay <= 50
         && (gLogCategory_APEndpointManagerCarPlay != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_12;
  }
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
  _Block_object_dispose(&v9, 8);
}

uint64_t __APEndpointManagerCarPlayCreate_block_invoke_3(uint64_t a1)
{
  APSPowerAssertionRaise();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = carManager_startDiscovery();
  return APSPowerAssertionRelease();
}

@end
