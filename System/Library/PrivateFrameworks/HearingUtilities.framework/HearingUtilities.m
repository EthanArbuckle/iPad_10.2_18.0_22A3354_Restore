void sub_1DE313504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19)
{
  id *v19;
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1DE3135A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE3135F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __pairedWithDevicesSupportingListeningModes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Paired devices with listening modes: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "void pairedWithDevicesSupportingListeningModes(__strong AXBoolBlock _Nonnull)_block_invoke_2", 712, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __hearingDeamonShouldBeRunning_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HCLogHearingXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "heard will be running for device that supports listening mode: %@", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void hearingDeamonShouldBeRunning(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedHearingAids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    HCLogHearingXPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "heard will be running for Hearing Aids";
LABEL_15:
      _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    objc_msgSend(getPASettingsClass(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personalMediaConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      HCLogHearingXPC();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v5 = "heard will be running for PME";
        goto LABEL_15;
      }
    }
    else
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "comfortSoundsEnabled");

      if (v9)
      {
        HCLogHearingXPC();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v5 = "heard will be running for Background Sounds";
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(getRTTSettingsClass(), "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "TTYSoftwareEnabled"))
        {

        }
        else
        {
          objc_msgSend(getRTTSettingsClass(), "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "TTYHardwareEnabled");

          if (!v12)
          {
            if ((objc_msgSend(MEMORY[0x1E0D2F990], "currentProcessIsSystemApp") & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D2F990], "currentProcessIsPreferences") & 1) != 0
              || objc_msgSend(MEMORY[0x1E0D2F990], "currentProcessIsHeard"))
            {
              v21[0] = MEMORY[0x1E0C809B0];
              v21[1] = 3221225472;
              v21[2] = __hearingDeamonShouldBeRunning_block_invoke;
              v21[3] = &unk_1EA8E8860;
              v22 = v1;
              pairedWithDevicesSupportingListeningModes(v21);

            }
            else
            {
              (*((void (**)(id, _QWORD))v1 + 2))(v1, 0);
            }
            goto LABEL_19;
          }
        }
        HCLogHearingXPC();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v5 = "heard will be running for RTT";
          goto LABEL_15;
        }
      }
    }
  }

  HAInitializeLogging();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("heard should be running: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "void hearingDeamonShouldBeRunning(__strong AXBoolBlock _Nonnull)", 793, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_retainAutorelease(v16);
    v19 = v17;
    v20 = objc_msgSend(v18, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v24 = v20;
    _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  (*((void (**)(id, uint64_t))v1 + 2))(v1, 1);
LABEL_19:

}

void sub_1DE313F98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE314124(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DE315478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void pairedWithDevicesSupportingListeningModes(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __pairedWithDevicesSupportingListeningModes_block_invoke_2;
  v3[3] = &unk_1EA8E8860;
  v4 = v1;
  v2 = v1;
  iteratePairedBluetoothDevicesOnQueue(&__block_literal_global_11, v3);

}

void iteratePairedBluetoothDevicesOnQueue(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __iteratePairedBluetoothDevicesOnQueue_block_invoke;
      v7[3] = &unk_1EA8E9A28;
      v8 = v3;
      v9 = v5;
      dispatch_async(v6, v7);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

id getPASettingsClass()
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
  v0 = (void *)getPASettingsClass_softClass;
  v7 = getPASettingsClass_softClass;
  if (!getPASettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPASettingsClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getPASettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE316D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPASettingsClass_0()
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
  v0 = (void *)getPASettingsClass_softClass_1;
  v7 = getPASettingsClass_softClass_1;
  if (!getPASettingsClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPASettingsClass_block_invoke_1;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getPASettingsClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE316E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __iteratePairedBluetoothDevicesOnQueue_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C97758], "devicesWithDiscoveryFlags:error:", 0x80000800000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __iteratePairedBluetoothDevicesOnQueue_block_invoke_2;
  v5[3] = &unk_1EA8E9A50;
  v7 = &v8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *((unsigned __int8 *)v9 + 24), v3, v4);

  _Block_object_dispose(&v8, 8);
}

void sub_1DE316EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __hearingDeamonShouldBeRunning_block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t AXSettingsReturnBoolValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valueForPreferenceKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

void sub_1DE3172A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _automationPlayAutomationAudioSamples(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall") && _AXSAutomationEnabled())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _AXSLiveHeadphoneLevelAutomationSampleData();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "_automationStartPlayingSampleData:", v3);

    }
  }
}

void sub_1DE317760(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id getADAFMetadataKeyHAEDataForGauge()
{
  id *v0;
  void *v1;
  _Unwind_Exception *ADAFMetadataKeyHAEDataForGauge_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr;
  v7 = getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr;
  if (!getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr)
  {
    v1 = (void *)AudioDataAnalysisLibrary();
    v0 = (id *)dlsym(v1, "ADAFMetadataKeyHAEDataForGauge");
    v5[3] = (uint64_t)v0;
    getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ADAFMetadataKeyHAEDataForGauge_cold_1 = (_Unwind_Exception *)getADAFMetadataKeyHAEDataForGauge_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ADAFMetadataKeyHAEDataForGauge_cold_1);
  }
  return *v0;
}

id getAXIDSServicesClass()
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
  v0 = (void *)getAXIDSServicesClass_softClass;
  v7 = getAXIDSServicesClass_softClass;
  if (!getAXIDSServicesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAXIDSServicesClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getAXIDSServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE318428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE319B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getADAMAudioDataReceiverClass_block_invoke(uint64_t a1)
{
  Class result;

  AudioDataAnalysisLibrary();
  result = objc_getClass("ADAMAudioDataReceiver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getADAMAudioDataReceiverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getADAMAudioDataReceiverClass_block_invoke_cold_1();
    return (Class)AudioDataAnalysisLibrary();
  }
  return result;
}

uint64_t AudioDataAnalysisLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
    AudioDataAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AudioDataAnalysisLibraryCore_frameworkLibrary;
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAXIDSServicesClass_block_invoke(uint64_t a1)
{
  Class result;

  AXIDSServicesLibrary();
  result = objc_getClass("AXIDSServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXIDSServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXIDSServicesClass_block_invoke_cold_1();
    return (Class)AXIDSServicesLibrary();
  }
  return result;
}

uint64_t AXIDSServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AXIDSServicesLibraryCore_frameworkLibrary)
    AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AXIDSServicesLibraryCore_frameworkLibrary;
  if (!AXIDSServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getAXIDSServiceMessageKeySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAXIDSServiceMessageKeySymbolLoc_ptr;
  v6 = getAXIDSServiceMessageKeySymbolLoc_ptr;
  if (!getAXIDSServiceMessageKeySymbolLoc_ptr)
  {
    v1 = (void *)AXIDSServicesLibrary();
    v0 = dlsym(v1, "AXIDSServiceMessageKey");
    v4[3] = (uint64_t)v0;
    getAXIDSServiceMessageKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DE319F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

HUComfortSoundsAssetManager *__getADAMAudioDataAnalysisSampleClass_block_invoke(uint64_t a1)
{
  HUComfortSoundsAssetManager *result;
  HUComfortSoundsAssetManager *v3;
  SEL v4;

  AudioDataAnalysisLibrary();
  result = (HUComfortSoundsAssetManager *)objc_getClass("ADAMAudioDataAnalysisSample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getADAMAudioDataAnalysisSampleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (HUComfortSoundsAssetManager *)__getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1();
    return -[HUComfortSoundsAssetManager init](v3, v4);
  }
  return result;
}

void sub_1DE31A204(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE31A9AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE31AD60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibrary()
{
  uint64_t v0;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary;
  v6 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA8E83F0;
    v8 = 0;
    v0 = _sl_dlopen();
    v4[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_1DE31C4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE31C9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

void UserRequestedAudioTransferNotification()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  HCLogHearingHandoff();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1DE311000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff", v2, 2u);
  }

  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestConnectionForReason:", 5);

}

void sub_1DE31E2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1DE31F6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v16 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  v20 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DE320C04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_1DE32482C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void shouldHandleServerStarting()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HA server is ready."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "void shouldHandleServerStarting(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 85, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_retainAutorelease(v1);
    v4 = v2;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hearingServerIsReady");

  }
}

void sub_1DE327B34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DE328570(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DE32917C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE3291F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE3293C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE32D3D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_1DE32E324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DE32EF90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DE32F80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE32F9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DE32FC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE32FD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE330618(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DE33146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DE332C30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DE33B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DE33DA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE33DFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
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

void sub_1DE33EBC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE33EC38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE33FB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE33FD84(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;
  id *v5;

  v5 = v2;
  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1DE34024C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3404AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE340A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3410E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE341468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE341704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3418D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE341D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getUMUserManagerClass()
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
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE341F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE343B6C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UMUserManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AXHACHearingAidComplianceSetEnabled()
{
  id v0;

  _AXSHearingAidComplianceSetEnabled();
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateHearingFeatureUsage");

}

id _accessibilityHWModel()
{
  void *v0;
  BOOL v1;
  void *v2;
  size_t v4;
  _BYTE v5[128];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 128;
  v5[0] = 0;
  v0 = 0;
  if (sysctlbyname("hw.model", v5, &v4, 0, 0))
    v1 = 1;
  else
    v1 = v5[0] == 0;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lowercaseString");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

uint64_t AXHACHearingAidCapabilities()
{
  if (AXHACHearingAidCapabilities_onceToken != -1)
    dispatch_once(&AXHACHearingAidCapabilities_onceToken, &__block_literal_global_9);
  return AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache;
}

void sub_1DE346910(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DE3489E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

id getAFPreferencesClass()
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
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE3493CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DE34A890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, id a12)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a12);
  _Unwind_Resume(a1);
}

id HUNoiseLocString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("HearingUtilities_Noise"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id hearingLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  accessibilityHearingAidSupportBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("HearingAidSupport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id accessibilityHearingAidSupportBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
  if (!accessibilityHearingAidSupportBundle_AXBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
    accessibilityHearingAidSupportBundle_AXBundle = v1;

    v0 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
  }
  return v0;
}

id hearingInputRouteStringForOption(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  uint64_t v4;

  hearingLocString(CFSTR("HearingAidInputOptionsLeft"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a1)
  {
    case 0:
      if (objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch"))
        v3 = CFSTR("HearingAidInputOptionsWrist");
      else
        v3 = CFSTR("HearingAidInputOptionsAutomatic");
      goto LABEL_9;
    case 3:
      v3 = CFSTR("HearingAidInputOptionsNeither");
      goto LABEL_9;
    case 2:
      v3 = CFSTR("HearingAidInputOptionsRight");
LABEL_9:
      hearingLocString(v3);
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v4;
      break;
  }
  return v2;
}

uint64_t headphoneStreamSelected()
{
  void *v0;
  uint64_t v1;

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "headphoneStreamSelected");

  return v1;
}

uint64_t liveListenStreamSelected()
{
  void *v0;
  uint64_t v1;

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "liveListenRouteSelected");

  return v1;
}

void liveListenStreamSelectedAsync(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveListenRouteSelectedAsync:", v1);

}

uint64_t hearingEarFromInputOption(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return dword_1DE38FEF0[a1];
}

uint64_t inputOptionFromHearingEar(int a1)
{
  if ((a1 - 2) > 4)
    return 3;
  else
    return qword_1DE38FF00[a1 - 2];
}

uint64_t hearingAidStreamAvailable()
{
  void *v0;
  uint64_t v1;

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "hearingAidRouteAvailable");

  return v1;
}

void hearingAidStreamAvailableAsync(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hearingAidRouteAvailableAsync:", v1);

}

uint64_t hearingAidStreamSelected()
{
  void *v0;
  uint64_t v1;

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "hearingAidStreamSelected");

  return v1;
}

void hearingAidStreamSelectedAsync(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hearingAidStreamSelectedAsync:", v1);

}

uint64_t hearingAidReceivingAudio()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeForKey:", *MEMORY[0x1E0D47EB0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hearingAidStreamSelected") & v2;

  return v4;
}

uint64_t supportsBinauralStreamingForHearingAid(void *a1)
{
  id v1;
  uint64_t v2;
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  size_t v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v8 = 128;
  v9[0] = 0;
  v2 = 0;
  if (sysctlbyname("hw.model", v9, &v8, 0, 0))
    v3 = 1;
  else
    v3 = v9[0] == 0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("n94"));

    if ((v6 & 1) != 0)
      v2 = 0;
    else
      v2 = objc_msgSend(v1, "supportsBinauralStreaming");
  }

  return v2;
}

id nameOfHearingDeviceReachableForAudioHandoff()
{
  void *v0;
  dispatch_semaphore_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  int v6;
  void *v7;
  int v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearAudioRoutes");

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v1 = dispatch_semaphore_create(0);
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __nameOfHearingDeviceReachableForAudioHandoff_block_invoke;
  v19 = &unk_1EA8E90D8;
  v21 = &v22;
  v4 = v1;
  v20 = v4;
  dispatch_async(v3, &v16);

  v5 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = hearingAidStreamAvailable();
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities", v16, v17, v18, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "takingConnection");

  if ((v6 ^ 1 | v8) == 1 && objc_msgSend((id)v23[5], "length"))
    v9 = (id)v23[5];
  else
    v9 = 0;
  v10 = CFSTR("Reachable");
  if (!v9)
    v10 = CFSTR("Not Reachable");
  v11 = v10;
  HCLogHearingHandoff();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v23[5];
    *(_DWORD *)buf = 138413058;
    v29 = v13;
    v30 = 1024;
    v31 = v6;
    v32 = 1024;
    v33 = v8;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "Hearing Aids for handoff: name %@, HA route available: %d, taking connection: %d, result: %@", buf, 0x22u);
  }

  v14 = v9;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void sub_1DE34B0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

intptr_t __nameOfHearingDeviceReachableForAudioHandoff_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableHearingDeviceName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL propertyContainsProperty(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

id subPropertiesOfProperty(uint64_t a1)
{
  void *v2;
  uint64_t i;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 64; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

    }
  }
  return v2;
}

BOOL propertyIsDependentOnProperty(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;

  v3 = a1 == 1024 || a1 == 0x800000000;
  return a2 == 256 && v3;
}

id hearingPropertyDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1 >= 0x200000)
  {
    if (a1 > 0xFFFFFFFFLL)
    {
      if (a1 > 0x1FFFFFFFFFLL)
      {
        if (a1 <= 0x7FFFFFFFFFLL)
        {
          if (a1 == 0x2000000000)
          {
            v5 = CFSTR("Treble");
            goto LABEL_98;
          }
          if (a1 == 0x4000000000)
          {
            v5 = CFSTR("Mixed Volume");
            goto LABEL_98;
          }
        }
        else
        {
          switch(a1)
          {
            case 0x8000000000:
              v5 = CFSTR("Mixed Volume Step Size");
              goto LABEL_98;
            case 0x20000000000:
              v5 = CFSTR("Device Type");
              goto LABEL_98;
            case 0x80000000000:
              v5 = CFSTR("Substantially Similar");
              goto LABEL_98;
          }
        }
      }
      else if (a1 <= 0x3FFFFFFFFLL)
      {
        if (a1 == 0x100000000)
        {
          v5 = CFSTR("Microphone Step Size");
          goto LABEL_98;
        }
        if (a1 == 0x200000000)
        {
          v5 = CFSTR("Stream Step Size");
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x400000000:
            v5 = CFSTR("Sensitivity Step Size");
            goto LABEL_98;
          case 0x800000000:
            v5 = CFSTR("Active Streaming Program");
            goto LABEL_98;
          case 0x1000000000:
            v5 = CFSTR("Bass");
            goto LABEL_98;
        }
      }
    }
    else if (a1 > 0x3FFFFFF)
    {
      if (a1 <= 0x1FFFFFFF)
      {
        if (a1 == 0x4000000)
        {
          v5 = CFSTR("Paired Status");
          goto LABEL_98;
        }
        if (a1 == 0x10000000)
        {
          v5 = CFSTR("Spec Version");
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x20000000:
            v5 = CFSTR("Bluetooth Pairing");
            goto LABEL_98;
          case 0x40000000:
            v5 = CFSTR("Substantially Different");
            goto LABEL_98;
          case 0x80000000:
            v5 = CFSTR("Sensitivity");
            goto LABEL_98;
        }
      }
    }
    else if (a1 < 0x800000)
    {
      if (a1 == 0x200000)
      {
        v5 = CFSTR("Connection Status");
        goto LABEL_98;
      }
      if (a1 == 0x400000)
      {
        v5 = CFSTR("Firmware");
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x800000:
          v5 = CFSTR("Hardware");
          goto LABEL_98;
        case 0x1000000:
          v5 = CFSTR("Device ID");
          goto LABEL_98;
        case 0x2000000:
          v5 = CFSTR("Device Description");
LABEL_98:

          v4 = (void *)v5;
          return v4;
      }
    }
    goto LABEL_93;
  }
  if (a1 > 1023)
  {
    if (a1 >= 0x10000)
    {
      if (a1 < 0x40000)
      {
        if (a1 == 0x10000)
        {
          v5 = CFSTR("Characteristics");
          goto LABEL_98;
        }
        if (a1 == 0x20000)
        {
          v5 = CFSTR("Program Update");
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x40000:
            v5 = CFSTR("Name");
            goto LABEL_98;
          case 0x80000:
            v5 = CFSTR("Manufacturer");
            goto LABEL_98;
          case 0x100000:
            v5 = CFSTR("Model");
            goto LABEL_98;
        }
      }
    }
    else if (a1 < 0x2000)
    {
      if (a1 == 1024)
      {
        v5 = CFSTR("Active Program");
        goto LABEL_98;
      }
      if (a1 == 4096)
      {
        v5 = CFSTR("Program Name Selector");
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x2000:
          v5 = CFSTR("Program Name");
          goto LABEL_98;
        case 0x4000:
          v5 = CFSTR("Program Category");
          goto LABEL_98;
        case 0x8000:
          v5 = CFSTR("Services");
          goto LABEL_98;
      }
    }
LABEL_93:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 64; ++i)
    {
      if (((1 << i) & a1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" and "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Properties %@"), v10);
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    goto LABEL_98;
  }
  if (a1 > 31)
  {
    if (a1 <= 127)
    {
      if (a1 == 32)
      {
        v5 = CFSTR("Other HA ID");
        goto LABEL_98;
      }
      if (a1 == 64)
      {
        v5 = CFSTR("Mic Attenuation");
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 128:
          v5 = CFSTR("Stream Attenuation");
          goto LABEL_98;
        case 256:
          v5 = CFSTR("Available Programs");
          goto LABEL_98;
        case 512:
          v5 = CFSTR("Manufacturer Model");
          goto LABEL_98;
      }
    }
    goto LABEL_93;
  }
  if (a1 > 7)
  {
    if (a1 == 8)
    {
      v5 = CFSTR("Left/Right");
      goto LABEL_98;
    }
    if (a1 == 16)
    {
      v5 = CFSTR("HA ID");
      goto LABEL_98;
    }
    goto LABEL_93;
  }
  if (a1 != 2)
  {
    if (a1 == 4)
    {
      v5 = CFSTR("Battery");
      goto LABEL_98;
    }
    goto LABEL_93;
  }
  return v4;
}

id nameForComplicationPreferredDisplayMode(uint64_t a1)
{
  __CFString *v1;

  v1 = CFSTR("complication.preferred.display.program");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return hearingLocString(v1);
  else
    return hearingLocString(CFSTR("complication.preferred.display.mic.volume"));
}

id cloudHearingAidDescriptionForDescription(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;

  v1 = (void *)MEMORY[0x1E0C99E08];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D2F908];
  v12 = objc_msgSend(v10, "hasPrefix:", *MEMORY[0x1E0D2F908]);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("ax_hearing_device_uuid_key"));

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ax_hearing_device_left_peripheral_key"));
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasPrefix:", v11);

  if ((v17 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@"), v11, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("ax_hearing_device_uuid_key"));

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ax_hearing_device_right_peripheral_key"));
  }

  return v3;
}

BOOL compoundAttributeContainsAttribute(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

uint64_t compoundAttributeByAddingAttribute(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t compoundAttributeByRemovingAttribute(uint64_t a1, uint64_t a2)
{
  return a1 & ~a2;
}

void iteratePairedBluetoothDevicesOnQueueCBv1(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bluetoothState");

    if (v3 && v6 == 3)
    {
      objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke;
      v8[3] = &unk_1EA8E9A28;
      v9 = v3;
      v10 = v4;
      dispatch_async(v7, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke_2;
  v7[3] = &unk_1EA8E9A00;
  v9 = &v10;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *((unsigned __int8 *)v11 + 24), v5, v6);

  _Block_object_dispose(&v10, 8);
}

void sub_1DE34BB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __iteratePairedBluetoothDevicesOnQueue_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

void iterateConnectedBluetoothDevicesOnQueue(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bluetoothState");

    if (v3 && v6 == 3)
    {
      objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __iterateConnectedBluetoothDevicesOnQueue_block_invoke;
      v8[3] = &unk_1EA8E9A28;
      v9 = v3;
      v10 = v4;
      dispatch_async(v7, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __iterateConnectedBluetoothDevicesOnQueue_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C97758], "devicesWithDiscoveryFlags:error:", 0x80000200000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __iterateConnectedBluetoothDevicesOnQueue_block_invoke_2;
  v5[3] = &unk_1EA8E9A50;
  v7 = &v8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *((unsigned __int8 *)v9 + 24), v3, v4);

  _Block_object_dispose(&v8, 8);
}

void sub_1DE34BDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __iterateConnectedBluetoothDevicesOnQueue_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

unint64_t __pairedWithDevicesSupportingListeningModes_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "deviceFlags") & 0x4000000) != 0)
    v3 = 1;
  else
    v3 = ((unint64_t)objc_msgSend(v2, "deviceFlags") >> 27) & 1;

  return v3;
}

void getCallStatus(void *a1)
{
  id v1;
  id RTTTelephonyUtilitiesClass;
  id v3;
  _QWORD v4[4];
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;
  _QWORD v12[3];
  char v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  char v17;

  v1 = a1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  RTTTelephonyUtilitiesClass = getRTTTelephonyUtilitiesClass();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __getCallStatus_block_invoke;
  v4[3] = &unk_1EA8E9AF8;
  v6 = v16;
  v7 = v14;
  v8 = v10;
  v9 = v12;
  v3 = v1;
  v5 = v3;
  objc_msgSend(RTTTelephonyUtilitiesClass, "performCallCenterTask:", v4);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

}

void sub_1DE34BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id getRTTTelephonyUtilitiesClass()
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
  v0 = (void *)getRTTTelephonyUtilitiesClass_softClass;
  v7 = getRTTTelephonyUtilitiesClass_softClass;
  if (!getRTTTelephonyUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTTelephonyUtilitiesClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getRTTTelephonyUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE34C04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCallStatus_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(getRTTTelephonyUtilitiesClass(), "sharedCallCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "anyCallIsEndpointOnCurrentDevice");
  objc_msgSend(v5, "callsWithStatus:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "count") != 0;

  objc_msgSend(v5, "callsPassingTest:", &__block_literal_global_134);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v3, "count") != 0;

  objc_msgSend(v5, "audioAndVideoCallsWithStatus:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v4, "count") != 0;

  (*(void (**)(void))(a1[4] + 16))();
}

BOOL __getCallStatus_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "status") == 4
    || objc_msgSend(v2, "status") == 3
    || objc_msgSend(v2, "status") == 2;

  return v3;
}

id getRTTSettingsClass()
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
  v0 = (void *)getRTTSettingsClass_softClass;
  v7 = getRTTSettingsClass_softClass;
  if (!getRTTSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getRTTSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE34C270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL hearingUIShouldBeAvailable()
{
  void *v0;
  void *v1;
  _BOOL8 v2;
  void *v3;
  void *v4;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pairedHearingAids");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(getPASettingsClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personalMediaConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 != 0;

  }
  return v2;
}

void __getRTTTelephonyUtilitiesClass_block_invoke(uint64_t a1)
{
  RTTUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RTTTelephonyUtilities");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRTTTelephonyUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
    RTTUtilitiesLibrary();
  }
}

void RTTUtilitiesLibrary()
{
  void *v0;

  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
    RTTUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPASettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PersonalAudioLibraryCore_frameworkLibrary)
  {
    PersonalAudioLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PersonalAudioLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PASettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPASettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getPASettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

HUNearbyListenerHelper *__getRTTSettingsClass_block_invoke(uint64_t a1)
{
  HUNearbyListenerHelper *result;
  HUNearbyListenerHelper *v3;
  SEL v4;
  id v5;
  id v6;

  RTTUtilitiesLibrary();
  result = (HUNearbyListenerHelper *)objc_getClass("RTTSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRTTSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (HUNearbyListenerHelper *)__getRTTSettingsClass_block_invoke_cold_1();
    return -[HUNearbyListenerHelper initWithListenerAddress:andDelegate:](v3, v4, v5, v6);
  }
  return result;
}

void sub_1DE34C5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE34CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1DE34D7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE34DC40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DE34E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE34E664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE34E99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE34FFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DE3509E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE350DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE351000(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE35122C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_1DE351A70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DE353BEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DE35517C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE355310(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DE3553EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE355508(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE357948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;

  objc_sync_exit(v21);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1DE357C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DE357DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DE357F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DE358158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DE358440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1DE35875C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1DE358944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DE358B1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE358C7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DE358DE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE358E6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE358ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DE358F68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE358FE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE359048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DE3590DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE359158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE3591BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DE35A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE35AEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE35B5F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1DE35E55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void UserRequestedAudioTransferCompleteNotification()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  HCLogHearingHandoff();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1DE311000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff complete", v2, 2u);
  }

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTakingConnection:", 0);

}

void UserRequestedAudioTransferNotification_0()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  HCLogHearingHandoff();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1DE311000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff", v2, 2u);
  }

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTakingConnection:", 1);

}

void sub_1DE35F528(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DE35FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1DE35FEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTSettingsClass_0()
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
  v0 = (void *)getRTTSettingsClass_softClass_0;
  v7 = getRTTSettingsClass_softClass_0;
  if (!getRTTSettingsClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke_0;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getRTTSettingsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE35FF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE360130(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DE3609F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DE360CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTTSettingsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RTTUtilitiesLibraryCore_frameworkLibrary_0)
  {
    RTTUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!RTTUtilitiesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RTTSettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRTTSettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getRTTSettingsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPASettingsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PersonalAudioLibraryCore_frameworkLibrary_0)
  {
    PersonalAudioLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!PersonalAudioLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PASettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPASettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getPASettingsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DE363230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1DE3636F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE36B440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AccessibilitySettingsChangedOnCompanion()
{
  void *v0;
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("NoiseEnabled");
  v1[1] = CFSTR("OnboardingCompleted");
  v1[2] = CFSTR("NotificationsEnabled");
  v1[3] = CFSTR("NotificationsThreshold");
  v1[4] = CFSTR("NotificationsMuteDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enumerateObjectsUsingBlock:", &__block_literal_global_285);

}

void _axSettingsHandlePreferenceChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handlePreferenceChanged:", a3);

}

uint64_t AXSettingsReturnUnsignedIntegerValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_valueForPreferenceKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v5, "unsignedIntegerValue");

  return a2;
}

double AXSettingsReturnDoubleValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valueForPreferenceKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }

  return v4;
}

uint64_t HearingDevicesDidChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hearingAidReachabilityDidChange");
}

id AXLogHearingHalPlugin()
{
  if (AXLogHearingHalPlugin_onceToken != -1)
    dispatch_once(&AXLogHearingHalPlugin_onceToken, &__block_literal_global_18);
  return (id)AXLogHearingHalPlugin___logObj;
}

void UserLevelHearingSetupAvailable()
{
  id v0;

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "continueSetup");

}

id getCCSControlCenterServiceClass()
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
  v0 = (void *)getCCSControlCenterServiceClass_softClass;
  v7 = getCCSControlCenterServiceClass_softClass;
  if (!getCCSControlCenterServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCCSControlCenterServiceClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getCCSControlCenterServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE36E3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE36EDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;
  id *v29;
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPADatabaseManagerClass()
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
  v0 = (void *)getPADatabaseManagerClass_softClass;
  v7 = getPADatabaseManagerClass_softClass;
  if (!getPADatabaseManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPADatabaseManagerClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getPADatabaseManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE36F0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAAccessoryManagerClass()
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
  v0 = (void *)getPAAccessoryManagerClass_softClass;
  v7 = getPAAccessoryManagerClass_softClass;
  if (!getPAAccessoryManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPAAccessoryManagerClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getPAAccessoryManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE36F3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTSettingsClass_1()
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
  v0 = (void *)getRTTSettingsClass_softClass_1;
  v7 = getRTTSettingsClass_softClass_1;
  if (!getRTTSettingsClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke_1;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getRTTSettingsClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE36F910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE36FDD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DE37018C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE371094(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id getRTTControllerClass()
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
  v0 = (void *)getRTTControllerClass_softClass;
  v7 = getRTTControllerClass_softClass;
  if (!getRTTControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTControllerClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getRTTControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE371164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3714B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE371B14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE371C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCSControlCenterServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    ControlCenterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ControlCenterServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CCSControlCenterService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCCSControlCenterServiceClass_block_invoke_cold_1();
    free(v3);
  }
  getCCSControlCenterServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPASettingsClass_block_invoke_1(uint64_t a1)
{
  Class result;

  PersonalAudioLibrary();
  result = objc_getClass("PASettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPASettingsClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPASettingsClass_block_invoke_cold_1();
    return (Class)PersonalAudioLibrary();
  }
  return result;
}

uint64_t PersonalAudioLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PersonalAudioLibraryCore_frameworkLibrary_1)
    PersonalAudioLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = PersonalAudioLibraryCore_frameworkLibrary_1;
  if (!PersonalAudioLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getPADatabaseManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PersonalAudioLibrary();
  result = objc_getClass("PADatabaseManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPADatabaseManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPADatabaseManagerClass_block_invoke_cold_1();
    return (Class)__getPAAccessoryManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getPAAccessoryManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PersonalAudioLibrary();
  result = objc_getClass("PAAccessoryManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPAAccessoryManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPAAccessoryManagerClass_block_invoke_cold_1();
    return (Class)__getRTTSettingsClass_block_invoke_1(v3);
  }
  return result;
}

void __getRTTSettingsClass_block_invoke_1(uint64_t a1)
{
  RTTUtilitiesLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RTTSettings");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRTTSettingsClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTTSettingsClass_block_invoke_cold_1();
    RTTUtilitiesLibrary_0();
  }
}

void RTTUtilitiesLibrary_0()
{
  void *v0;

  if (!RTTUtilitiesLibraryCore_frameworkLibrary_1)
    RTTUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!RTTUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRTTControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  HURoutesManager *v3;
  SEL v4;

  RTTUtilitiesLibrary_0();
  result = objc_getClass("RTTController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRTTControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (HURoutesManager *)__getRTTControllerClass_block_invoke_cold_1();
    return (Class)-[HURoutesManager currentPickableAudioRoutes](v3, v4);
  }
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1DE373414(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DE373C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v18 - 160));
  _Unwind_Resume(a1);
}

void sub_1DE373FAC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE375860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1DE376C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE376F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DE378810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE378C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE37A86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void userChangedAudioRoute(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __userChangedAudioRoute_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_after(v3, v4, block);

}

uint64_t RenderAudio(void *a1, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, uint64_t a4, UInt32 a5, AudioBufferList *a6)
{
  AudioUnit *v10;
  AudioUnit *v11;
  uint64_t v12;

  v10 = a1;
  v11 = v10;
  if (!v10)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v12 = AudioUnitRender(v10[6], a2, a3, 1u, a5, a6);
  if (!(_DWORD)v12)
  {
    if (*((_BYTE *)v11 + 32))
      ExtAudioFileWriteAsync(v11[3], a5, a6);
    goto LABEL_5;
  }
LABEL_6:

  return v12;
}

uint64_t __userChangedAudioRoute_block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "audioRouteDidChange:", 0);
  return result;
}

void sub_1DE37D460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE37DE5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DE37E52C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DE37EB08(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DE37F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE37F2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE380678(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DE381B00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DE382754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
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
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE38282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE3828E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKDeviceClass()
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
  v0 = (void *)getHKDeviceClass_softClass;
  v7 = getHKDeviceClass_softClass;
  if (!getHKDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKDeviceClass_block_invoke;
    v3[3] = &unk_1EA8E8270;
    v3[4] = &v4;
    __getHKDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE38299C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE382E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE383270(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    return (Class)HealthKitLibrary();
  }
  return result;
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

Class __getHKQuantityTypeClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKQuantityType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityTypeClass_block_invoke_cold_1();
    return (Class)__getHKDataCollectorClass_block_invoke(v3);
  }
  return result;
}

Class __getHKDataCollectorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKDataCollector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKDataCollectorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKDataCollectorClass_block_invoke_cold_1();
    return (Class)__getADAMAudioDataReceiverClass_block_invoke_0(v3);
  }
  return result;
}

Class __getADAMAudioDataReceiverClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AudioDataAnalysisLibraryCore_frameworkLibrary_0)
  {
    AudioDataAnalysisLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AudioDataAnalysisLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ADAMAudioDataReceiver");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getADAMAudioDataReceiverClass_block_invoke_cold_1();
    free(v3);
  }
  getADAMAudioDataReceiverClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPLLogRegisteredEventSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PowerLogLibraryCore_frameworkLibrary)
  {
    v2 = (void *)PowerLogLibraryCore_frameworkLibrary;
  }
  else
  {
    PowerLogLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)PowerLogLibraryCore_frameworkLibrary;
    if (!PowerLogLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PLLogRegisteredEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPLLogRegisteredEventSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKQuantityClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKUnitClass_block_invoke(v3);
  }
  return result;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKUnit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKUnitClass_block_invoke_cold_1();
    return (Class)__getHKCategorySampleClass_block_invoke(v3);
  }
  return result;
}

Class __getHKCategorySampleClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKCategorySample");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKCategorySampleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKCategorySampleClass_block_invoke_cold_1();
    return (Class)__getHKObjectTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKObjectType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKObjectTypeClass_block_invoke_cold_1();
    return __getHKDeviceClass_block_invoke(v3);
  }
  return result;
}

Class __getHKDeviceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary();
  result = objc_getClass("HKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKDeviceClass_block_invoke_cold_1();
    return (Class)__getHKQuantityDatumClass_block_invoke(v3);
  }
  return result;
}

AXFakeHearingAidDevice *__getHKQuantityDatumClass_block_invoke(uint64_t a1)
{
  AXFakeHearingAidDevice *result;
  AXFakeHearingAidDevice *v3;
  SEL v4;
  int v5;

  HealthKitLibrary();
  result = (AXFakeHearingAidDevice *)objc_getClass("HKQuantityDatum");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityDatumClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AXFakeHearingAidDevice *)__getHKQuantityDatumClass_block_invoke_cold_1();
    return -[AXFakeHearingAidDevice initWithDeviceType:](v3, v4, v5);
  }
  return result;
}

void sub_1DE3858D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DE385A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE385E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3885A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t getADAFMetadataKeyHAEDataForGauge_cold_1()
{
  dlerror();
  abort_report_np();
  return __getADAMAudioDataReceiverClass_block_invoke_cold_1();
}

uint64_t __getADAMAudioDataReceiverClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAXIDSServicesClass_block_invoke_cold_1(v0);
}

uint64_t __getAXIDSServicesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1(v0);
}

uint64_t __getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[HUComfortSound nextFilePath].cold.1(v0);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
}

uint64_t __getRTTTelephonyUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPASettingsClass_block_invoke_cold_1(v0);
}

uint64_t __getPASettingsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRTTSettingsClass_block_invoke_cold_1(v0);
}

uint64_t __getRTTSettingsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:].cold.1(v0);
}

uint64_t __getCCSControlCenterServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPADatabaseManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPADatabaseManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPAAccessoryManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPAAccessoryManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getRTTControllerClass_block_invoke_cold_1();
}

uint64_t __getRTTControllerClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKQuantityTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityTypeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKDataCollectorClass_block_invoke_cold_1(v0);
}

uint64_t __getHKDataCollectorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKQuantityClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKCategorySampleClass_block_invoke_cold_1(v0);
}

uint64_t __getHKCategorySampleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKObjectTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKObjectTypeClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getHKDeviceClass_block_invoke_cold_1();
}

uint64_t __getHKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKQuantityDatumClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityDatumClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[HUNearbySettings isTimeStampExpired:].cold.1(v0);
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1E0CF3058]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogIDS()
{
  return MEMORY[0x1E0CF3238]();
}

uint64_t AXLogRTT()
{
  return MEMORY[0x1E0CF3278]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x1E0CF32F0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1E0CF33D8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x1E0CF33E0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1E0CF33E8]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x1E0CF33F0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x1E0CF33F8]();
}

uint64_t AXSDSoundDetectionHandleNotificationsForResponse()
{
  return MEMORY[0x1E0CF4680]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1E0CF38E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1E0C91E78](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1E0C91E88](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1E0C91E90](inComponent, outInstance);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x1E0C91FE0](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x1E0C91FE8](ci);
}

OSStatus AudioUnitGetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue *outValue)
{
  return MEMORY[0x1E0C921D8](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outValue);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x1E0C921F0](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1E0C92208](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x1E0C92218](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1E0C92220](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CSInitializeLogging()
{
  return MEMORY[0x1E0D2F920]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x1E0D1ABB0]();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0C92278](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1E0C92280](inExtAudioFile);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0C922A0](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWriteAsync(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1E0C922B8](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x1E0D2F930]();
}

uint64_t HCHPInitializeLogging()
{
  return MEMORY[0x1E0D2F940]();
}

uint64_t HCLogHearingHandoff()
{
  return MEMORY[0x1E0D2F948]();
}

uint64_t HCLogHearingNearby()
{
  return MEMORY[0x1E0D2F950]();
}

uint64_t HCLogHearingNearbyIDS()
{
  return MEMORY[0x1E0D2F958]();
}

uint64_t HCLogHearingXPC()
{
  return MEMORY[0x1E0D2F960]();
}

uint64_t HCLogSoundMeter()
{
  return MEMORY[0x1E0D2F968]();
}

uint64_t HCPerformSafeBlock()
{
  return MEMORY[0x1E0D2F978]();
}

uint64_t HearingInitializeLogging()
{
  return MEMORY[0x1E0D2F988]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x1E0CBB888]();
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x1E0CBB8C8]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x1E0CBB8D0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MRMediaRemoteCopyPickableRoutes()
{
  return MEMORY[0x1E0D4BE88]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1E0D4BEF8]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x1E0D4BF20]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x1E0D4C0C0]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x1E0D4C180]();
}

uint64_t MRMediaRemoteSetWantsRouteChangeNotifications()
{
  return MEMORY[0x1E0D4C190]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x1E0D2F9B0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x1E0DDD4E0]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1E0DDD5E8]();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return MEMORY[0x1E0DDD698]();
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  return MEMORY[0x1E0DDD6F0]();
}

uint64_t _AXSHearingAidComplianceEnabled()
{
  return MEMORY[0x1E0DDD7D8]();
}

uint64_t _AXSHearingAidComplianceSetEnabled()
{
  return MEMORY[0x1E0DDD7E0]();
}

uint64_t _AXSHearingAidsSetPaired()
{
  return MEMORY[0x1E0DDD7E8]();
}

uint64_t _AXSHearingDevicePairedEars()
{
  return MEMORY[0x1E0DDD7F0]();
}

uint64_t _AXSHearingSetDevicePairedEars()
{
  return MEMORY[0x1E0DDD7F8]();
}

uint64_t _AXSHearingSetDevicePairedUUIDs()
{
  return MEMORY[0x1E0DDD800]();
}

uint64_t _AXSHearingSetDeviceStreamingEars()
{
  return MEMORY[0x1E0DDD808]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1E0DDD980]();
}

uint64_t _AXSLeftRightAudioBalance()
{
  return MEMORY[0x1E0DDD9F8]();
}

uint64_t _AXSLiveHeadphoneLevelAutomationSampleData()
{
  return MEMORY[0x1E0DDDA08]();
}

uint64_t _AXSMonoAudioEnabled()
{
  return MEMORY[0x1E0DDDA50]();
}

uint64_t _AXSSetAccessibilityEnabled()
{
  return MEMORY[0x1E0DDDB68]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x1E0DDDCB0]();
}

uint64_t _AXSTripleClickContainsOption()
{
  return MEMORY[0x1E0DDDD40]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x1E0DDDD50]();
}

uint64_t _AXSVisualAlertEnabled()
{
  return MEMORY[0x1E0DDDD90]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1E0DDDDE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
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

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint64_t messageIdentifierDescription()
{
  return MEMORY[0x1E0D2F9B8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

