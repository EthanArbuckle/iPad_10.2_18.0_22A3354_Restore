@implementation SPEndpointManagerGetShared

void __SPEndpointManagerGetShared_block_invoke()
{
  __int128 v0;
  __int128 v1;
  const __CFAllocator *v2;
  int v3;
  uint64_t DerivedStorage;
  dispatch_queue_t v5;
  uint64_t v6;
  CFMutableDictionaryRef v7;
  CFMutableSetRef v8;
  CFMutableSetRef Mutable;
  uint64_t v10;
  CFMutableDictionaryRef v11;
  __CFDictionary *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  int v17;
  uint64_t v18;
  const void *v19;
  uint64_t (*v20)(uint64_t, void (*)(uint64_t, int, uint64_t, void *), const void *);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  CFTypeRef *v27;
  int v28;
  int v29;
  int started;
  NSObject *v31;
  int v32;
  uint64_t handler;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t v37;
  const void *v38;
  CFSetCallBacks callBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  const void *v41;

  v41 = 0;
  v0 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9B390];
  *(_OWORD *)&keyCallBacks.release = v0;
  v1 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
  *(_OWORD *)&callBacks.release = v1;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)spmanager_transportDeviceEqual;
  keyCallBacks.hash = (CFDictionaryHashCallBack)spmanager_transportDeviceHash;
  callBacks.equal = (CFSetEqualCallBack)spmanager_transportDeviceEqual;
  callBacks.hash = (CFSetHashCallBack)spmanager_transportDeviceHash;
  LogSetAppID();
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigEndpointManagerGetClassID();
  v3 = CMDerivedObjectCreate();
  if (v3)
  {
    v32 = v3;
    APSLogErrorAt();
  }
  else
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v5 = dispatch_queue_create("com.apple.airplay.endpointManager.notification", 0);
    *(_QWORD *)(DerivedStorage + 8) = v5;
    if (v5)
    {
      v6 = FigSimpleMutexCreate();
      *(_QWORD *)(DerivedStorage + 24) = v6;
      if (v6)
      {
        *(_BYTE *)(DerivedStorage + 32) = 0;
        *(_WORD *)(DerivedStorage + 34) = 0;
        v7 = CFDictionaryCreateMutable(v2, 0, &keyCallBacks, MEMORY[0x1E0C9B3A0]);
        *(_QWORD *)(DerivedStorage + 48) = v7;
        if (v7)
        {
          v8 = CFSetCreateMutable(v2, 0, &callBacks);
          *(_QWORD *)(DerivedStorage + 56) = v8;
          if (v8)
          {
            Mutable = CFSetCreateMutable(v2, 0, MEMORY[0x1E0C9B3B0]);
            *(_QWORD *)(DerivedStorage + 64) = Mutable;
            if (Mutable)
            {
              v10 = MEMORY[0x1E0CA2E18];
              *(_OWORD *)(DerivedStorage + 72) = *MEMORY[0x1E0CA2E18];
              *(_QWORD *)(DerivedStorage + 88) = *(_QWORD *)(v10 + 16);
              *(_QWORD *)(DerivedStorage + 128) = (int)APSSettingsGetIntWithDefault();
              *(_QWORD *)(DerivedStorage + 136) = (int)APSSettingsGetIntWithDefault();
              *(_QWORD *)(DerivedStorage + 144) = (int)APSSettingsGetIntWithDefault();
              v11 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              if (v11)
              {
                v12 = v11;
                APSEventRecorderCreate();
                v13 = *(const void **)(DerivedStorage + 160);
                if (v13)
                  CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CF1DB0], v13);
                v14 = (const void *)*MEMORY[0x1E0C9AE40];
                CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CF1DB8], (const void *)*MEMORY[0x1E0C9AE40]);
                CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CF1DC8], v14);
                CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CF1DC0], v14);
                CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CF1DE0], v14);
                v15 = (const void *)*MEMORY[0x1E0CF1DD8];
                if (APSSettingsGetInt64())
                  v16 = v14;
                else
                  v16 = (const void *)*MEMORY[0x1E0C9AE50];
                CFDictionarySetValue(v12, v15, v16);
                v17 = APBrowserCreate();
                if (v17)
                {
                  v32 = v17;
                }
                else
                {
                  v18 = *(_QWORD *)(DerivedStorage + 152);
                  v19 = v41;
                  v20 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, int, uint64_t, void *), const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                  if (v20)
                  {
                    v21 = v20(v18, spmanager_browserEventHandler, v19);
                    if (v21)
                    {
                      v32 = v21;
                    }
                    else
                    {
                      v22 = AirPlayDebugIPCEnableForEndpointManager(v41);
                      if (v22)
                      {
                        v32 = v22;
                      }
                      else
                      {
                        *(_DWORD *)(DerivedStorage + 16) = -1;
                        v23 = (uint64_t)v41;
                        v24 = CMBaseObjectGetDerivedStorage();
                        v25 = MEMORY[0x1E0C809B0];
                        v26 = *(NSObject **)(v24 + 8);
                        handler = MEMORY[0x1E0C809B0];
                        v34 = 0x40000000;
                        v35 = __spmanager_registerForNotifications_block_invoke;
                        v36 = &__block_descriptor_tmp_188;
                        v37 = v23;
                        notify_register_dispatch("com.apple.airplay.prefsChanged", (int *)(v24 + 16), v26, &handler);
                        *(_BYTE *)(DerivedStorage + 112) = APSSettingsGetInt64() != 0;
                        v27 = (CFTypeRef *)(DerivedStorage + 104);
                        v28 = SPHubbedDevicesProviderCreate(v27);
                        if (v28)
                        {
                          v32 = v28;
                        }
                        else
                        {
                          v29 = SPHubbedDevicesProviderAddListener((uint64_t)*v27, (uint64_t)v41, (uint64_t)spmanager_handleHubbedDevicesChanged);
                          if (v29)
                          {
                            v32 = v29;
                          }
                          else
                          {
                            started = SPHubbedDevicesProviderStartAsync(*v27);
                            if (!started)
                            {
                              spmanager_handlePreferencesChanged((uint64_t)v41);
                              if (introspector_getCollectionOfSPEndpointManagers_once != -1)
                                dispatch_once(&introspector_getCollectionOfSPEndpointManagers_once, &__block_literal_global_195);
                              if (introspector_getCollectionOfSPEndpointManagers_coll)
                              {
                                v31 = *(NSObject **)introspector_getCollectionOfSPEndpointManagers_coll;
                                handler = v25;
                                v34 = 0x40000000;
                                v35 = __spmanager_create_block_invoke;
                                v36 = &__block_descriptor_tmp_18;
                                v37 = introspector_getCollectionOfSPEndpointManagers_coll;
                                v38 = v41;
                                dispatch_sync(v31, &handler);
                              }
                              APSIntrospectorAddCommand();
                              APSIntrospectorAddCommand();
                              APSIntrospectorAddCommand();
                              APSIntrospectorAddCommand();
                              APSIntrospectorAddCommand();
                              APSIntrospectorAddCommand();
                              if (gLogCategory_SPEndpointManager <= 50
                                && (gLogCategory_SPEndpointManager != -1 || _LogCategory_Initialize()))
                              {
                                LogPrintF();
                              }
                              v32 = 0;
                              SPEndpointManagerGetShared_sSPEndpointManager = (uint64_t)v41;
                              v41 = 0;
                              goto LABEL_31;
                            }
                            v32 = started;
                          }
                        }
                      }
                    }
                  }
                  else
                  {
                    v32 = -12782;
                  }
                }
                APSLogErrorAt();
LABEL_31:
                CFRelease(v12);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
    APSLogErrorAt();
    v32 = -16711;
  }
LABEL_32:
  if (v41)
    CFRelease(v41);
  gCreationErr_0 = v32;
}

@end
