void sub_1B727EF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7280FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72830AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7283300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

uint64_t __Block_byref_object_copy__194(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__195(uint64_t a1)
{

}

void sub_1B7285480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7285654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7285900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CarPlayServicesLibrary()
{
  void *v0;

  if (!CarPlayServicesLibraryCore_frameworkLibrary)
  {
    CarPlayServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CarPlayServicesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

uint64_t __Block_byref_object_copy__320(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__321(uint64_t a1)
{

}

__CFString *INCExtensionTransactionStateTypeGetName(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E6BC4158[a1];
}

void sub_1B7286508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7287B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCARSessionStatusClass()
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
  v0 = (void *)getCARSessionStatusClass_softClass;
  v7 = getCARSessionStatusClass_softClass;
  if (!getCARSessionStatusClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCARSessionStatusClass_block_invoke;
    v3[3] = &unk_1E6BC4BF8;
    v3[4] = &v4;
    __getCARSessionStatusClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7287C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallCenterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getTUCallCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke(v3);
  }
  return result;
}

void TelephonyUtilitiesLibrary()
{
  void *v0;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getCARSessionStatusClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CarKitLibraryCore_frameworkLibrary)
  {
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CarKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CARSessionStatus");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getCARSessionStatusClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AssistantServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AFDeviceSupportsSystemAssistantExperience");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void sub_1B72885D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallProviderManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getTUCallProviderManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke(v3);
  }
  return result;
}

void INCRouteAudioToAirplayOutputDevices(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  id *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v6 = (id *)MEMORY[0x1E0CBD670];
  v7 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CBD670]);
  v8 = *v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "INSignpostSiriAirPlaySetAudioSessionCategory", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v10 = (void *)getAVAudioSessionClass_softClass;
  v26 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAVAudioSessionClass_block_invoke;
    v28 = &unk_1E6BC4BF8;
    v29 = &v23;
    __getAVAudioSessionClass_block_invoke((uint64_t)buf);
    v10 = (void *)v24[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v11, "auxiliarySession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = (void **)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  v28 = (void *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
  {
    v14 = (void *)AVFoundationLibrary();
    v13 = (void **)dlsym(v14, "AVAudioSessionCategoryPlayback");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
    getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v15 = *v13;
  v22 = 0;
  v16 = v15;
  v17 = objc_msgSend(v12, "setCategory:error:", v16, &v22);
  v18 = v22;

  v19 = *v6;
  if ((v17 & 1) == 0 && os_log_type_enabled((os_log_t)*v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevices";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    _os_log_error_impl(&dword_1B727D000, v19, OS_LOG_TYPE_ERROR, "%s Failed to select playback category on auxiliary context. %{public}@", buf, 0x16u);
    v19 = *v6;
  }
  v20 = v19;
  v21 = v20;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v21, OS_SIGNPOST_INTERVAL_END, v7, "INSignpostSiriAirPlaySetAudioSessionCategory", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  INCRouteAudioToAirplayOutputDevicesForAudioSession(v3, v12, v4);
}

void sub_1B72889C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVAudioSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AVFoundationLibrary();
  }
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (AVFoundationLibraryCore_frameworkLibrary)
    return AVFoundationLibraryCore_frameworkLibrary;
  AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void INCRouteAudioToAirplayOutputDevicesForAudioSession(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  int v33;
  _BYTE buf[24];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (os_log_t *)MEMORY[0x1E0CBD670];
  v9 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_debug_impl(&dword_1B727D000, v9, OS_LOG_TYPE_DEBUG, "%s creating reconnaissance session for airplay ids: %@", buf, 0x16u);
  }
  v10 = objc_msgSend(v5, "count");
  v11 = os_signpost_id_generate(*v8);
  v12 = *v8;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "INSignpostSiriAirPlayReconnaissanceSessionCreateWithEndpointFeatures", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr;
  v35 = getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr)
  {
    v15 = (void *)MediaRemoteLibrary();
    v14 = dlsym(v15, "MRAVReconnaissanceSessionCreateWithEndpointFeatures");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v14;
    getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(buf, 8);
  if (!v14)
    goto LABEL_22;
  v16 = ((uint64_t (*)(id, uint64_t))v14)(v5, 1);
  v17 = *v8;
  v18 = v17;
  if (v11 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v18, OS_SIGNPOST_INTERVAL_END, v11, "INSignpostSiriAirPlayReconnaissanceSessionCreateWithEndpointFeatures", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  v19 = objc_msgSend(v6, "opaqueSessionID");
  v20 = os_signpost_id_generate(*v8);
  v21 = *v8;
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "INSignpostSiriAirPlayReconnaissanceSessionSetTargetAudioSessionID", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(v16, v19);
  v23 = *v8;
  v24 = v23;
  if (v20 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v24, OS_SIGNPOST_INTERVAL_END, v20, "INSignpostSiriAirPlayReconnaissanceSessionSetTargetAudioSessionID", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v25 = getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr;
  v35 = getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr)
  {
    v26 = (void *)MediaRemoteLibrary();
    v25 = dlsym(v26, "MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v25;
    getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr = v25;
  }
  _Block_object_dispose(buf, 8);
  if (!v25)
  {
LABEL_22:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  ((void (*)(uint64_t, _QWORD))v25)(v16, 0);
  soft_MRAVReconnaissanceSessionSetReturnPartialResults(v16, 1);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke;
  v29[3] = &unk_1E6BC44D8;
  v31 = v7;
  v32 = v10;
  v30 = v6;
  v33 = v19;
  v27 = v7;
  v28 = v6;
  soft_MRAVReconnaissanceSessionBeginSearch(v16, v29);

}

void sub_1B7288F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaRemoteLibrary()
{
  uint64_t v0;
  void *v2;

  if (MediaRemoteLibraryCore_frameworkLibrary)
    return MediaRemoteLibraryCore_frameworkLibrary;
  MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MediaRemoteLibraryCore_frameworkLibrary;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr;
  v11 = getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr)
  {
    v5 = (void *)MediaRemoteLibrary();
    v4 = dlsym(v5, "MRAVReconnaissanceSessionSetTargetAudioSessionID");
    v9[3] = (uint64_t)v4;
    getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t soft_MRAVReconnaissanceSessionSetReturnPartialResults(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr;
  v11 = getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr)
  {
    v5 = (void *)MediaRemoteLibrary();
    v4 = dlsym(v5, "MRAVReconnaissanceSessionSetReturnPartialResults");
    v9[3] = (uint64_t)v4;
    getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void sub_1B72897CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void soft_MRAVReconnaissanceSessionBeginSearch(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr;
  v10 = getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr)
  {
    v5 = (void *)MediaRemoteLibrary();
    v4 = dlsym(v5, "MRAVReconnaissanceSessionBeginSearch");
    v8[3] = (uint64_t)v4;
    getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    dlerror();
    v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  ((void (*)(uint64_t, id, double))v4)(a1, v3, 5.0);

}

uint64_t INCMRAVDiscoveryErrorIsPartialDiscoveryError(void *a1)
{
  id v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  if (objc_msgSend(v1, "code") == 26)
  {
    objc_msgSend(v1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = (_QWORD *)getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr;
    v11 = getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr;
    if (!getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr)
    {
      v4 = (void *)MediaRemoteLibrary();
      v3 = dlsym(v4, "kMRMediaRemoteFrameworkErrorDomain");
      v9[3] = (uint64_t)v3;
      getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
    {
      dlerror();
      v7 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v8, 8);
      _Unwind_Resume(v7);
    }
    v5 = objc_msgSend(v2, "isEqualToString:", *v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void INCMRAVSetOutputDevicesForAudioContext(void *a1, void *a2)
{
  id v3;
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  os_signpost_id_t v22;
  uint64_t v23;
  _BYTE buf[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (os_log_t *)MEMORY[0x1E0CBD670];
  v6 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "INCMRAVSetOutputDevicesForAudioContext";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_debug_impl(&dword_1B727D000, v6, OS_LOG_TYPE_DEBUG, "%s Setting output devices on the shared audio presentation context: %@", buf, 0x16u);
  }
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v8 = getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr;
  v25 = getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr;
  if (!getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr)
  {
    v9 = (void *)MediaRemoteLibrary();
    v8 = dlsym(v9, "MRAVOutputContextGetSharedAudioPresentationContext");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
    getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    dlerror();
    abort_report_np();
    goto LABEL_15;
  }
  v10 = ((uint64_t (*)(void))v8)();
  v11 = objc_msgSend(v3, "count");
  v12 = os_signpost_id_generate(*v5);
  v13 = *v5;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "INSignpostSiriAirPlaySetOutputDevices", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __INCMRAVSetOutputDevicesForAudioContext_block_invoke;
  v20[3] = &unk_1E6BC4580;
  v22 = v12;
  v23 = v11;
  v15 = v4;
  v21 = v15;
  v16 = v7;
  v17 = v20;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v18 = getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr;
  v25 = getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr;
  if (!getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr)
  {
    v19 = (void *)MediaRemoteLibrary();
    v18 = dlsym(v19, "MRAVOutputContextSetOutputDevices");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
    getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(buf, 8);
  if (!v18)
  {
    dlerror();
    abort_report_np();
LABEL_15:
    __break(1u);
  }
  ((void (*)(uint64_t, id, id, _QWORD *))v18)(v10, v3, v16, v17);

}

void sub_1B7289C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void INCDecodeHashedRouteUIDs(void *a1, void *a2)
{
  void (**v3)(id, _QWORD, void *);
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v3 = a2;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__568;
  v36 = __Block_byref_object_dispose__569;
  v37 = 0;
  if (INThisProcessIsAssistantd() && (INThisProcessIsRunningAsInstance() & 1) == 0)
  {
    -[objc_class sharedService](objc_getClass("ADSecurityService"), "sharedService");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v33[5];
    v33[5] = v4;

  }
  if (v33[5]
    || (v6 = -[objc_class init](-[objc_class alloc](objc_getClass("AFSecurityConnection"), "alloc"), "init"),
        v7 = (void *)v33[5],
        v33[5] = (uint64_t)v6,
        v7,
        v33[5]))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v22);
    if (objc_msgSend(v8, "containsObject:", CFSTR("LOCAL_DEVICE")))
    {
      v9 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "INCDecodeHashedRouteUIDs";
        _os_log_error_impl(&dword_1B727D000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected LOCAL_DEVICE identifier.", buf, 0xCu);
      }
      objc_msgSend(v8, "removeObject:", CFSTR("LOCAL_DEVICE"), v22);
    }
    if (objc_msgSend(v8, "count", v22))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0);
            if (!v16)
            {
              v18 = *MEMORY[0x1E0CBD670];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "INCDecodeHashedRouteUIDs";
                v40 = 2112;
                v41 = v15;
                _os_log_error_impl(&dword_1B727D000, v18, OS_LOG_TYPE_ERROR, "%s Failed to decode %@ as base64 data", buf, 0x16u);
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1317, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v3[2](v3, 0, v19);

              goto LABEL_24;
            }
            objc_msgSend(v10, "setObject:forKey:", v16, v15);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          if (v12)
            continue;
          break;
        }
      }

      v17 = (void *)v33[5];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __INCDecodeHashedRouteUIDs_block_invoke;
      v24[3] = &unk_1E6BC4528;
      v26 = v3;
      v25 = v11;
      v27 = &v32;
      objc_msgSend(v17, "processDataMap:usingProcedure:completion:", v10, 2, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, v20, 0);

      v10 = (void *)v33[5];
      v33[5] = 0;
    }
LABEL_24:

  }
  else
  {
    v21 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "INCDecodeHashedRouteUIDs";
      _os_log_error_impl(&dword_1B727D000, v21, OS_LOG_TYPE_ERROR, "%s Unable to get security service", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1317, 0, v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v8);
  }

  _Block_object_dispose(&v32, 8);
}

void sub_1B728A670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__568(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__569(uint64_t a1)
{

}

uint64_t INCGetCurrentGroupDeviceUIDs(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 16))(a1, 0, 0);
}

void sub_1B728B074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1B728B4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__611(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__612(uint64_t a1)
{

}

void sub_1B7290AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1B729109C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7291268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__813(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__814(uint64_t a1)
{

}

id getCARSessionStatusClass_815()
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
  v0 = (void *)getCARSessionStatusClass_softClass_816;
  v7 = getCARSessionStatusClass_softClass_816;
  if (!getCARSessionStatusClass_softClass_816)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCARSessionStatusClass_block_invoke_817;
    v3[3] = &unk_1E6BC4BF8;
    v3[4] = &v4;
    __getCARSessionStatusClass_block_invoke_817((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B72915B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCARSessionStatusClass_block_invoke_817(uint64_t a1)
{
  CarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CARSessionStatus");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCARSessionStatusClass_softClass_816 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    CarKitLibrary();
  }
}

void CarKitLibrary()
{
  void *v0;

  if (!CarKitLibraryCore_frameworkLibrary_818)
  {
    CarKitLibraryCore_frameworkLibrary_818 = _sl_dlopen();
    if (!CarKitLibraryCore_frameworkLibrary_818)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

id INCSerializeNSUserActivity(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__813;
  v17 = __Block_byref_object_dispose__814;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__813;
  v11 = __Block_byref_object_dispose__814;
  v12 = 0;
  objc_msgSend(v3, "setNeedsSave:", 0);
  objc_msgSend(v3, "_intentsPrepareForEncoding");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __INCSerializeNSUserActivity_block_invoke;
  v6[3] = &unk_1E6BC4A68;
  v6[4] = &v13;
  v6[5] = &v7;
  objc_msgSend(v3, "_createUserActivityDataWithOptions:completionHandler:", 0, v6);
  if (a2)
    *a2 = objc_retainAutorelease((id)v8[5]);
  v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_1B7291808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getUIActivityContinuationActionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitLibraryCore_frameworkLibrary)
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UIActivityContinuationAction");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getUIActivityContinuationActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getGEOCountryConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    GeoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!GeoServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("GEOCountryConfiguration");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getGEOCountryConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCRCarPlayAppPolicyEvaluatorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CarKitLibrary();
  result = objc_getClass("CRCarPlayAppPolicyEvaluator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCRCarPlayAppPolicyEvaluatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getCRCarPlayAppDeclarationClass_block_invoke(v3);
  }
  return result;
}

Class __getCRCarPlayAppDeclarationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CarKitLibrary();
  result = objc_getClass("CRCarPlayAppDeclaration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCRCarPlayAppDeclarationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_834(v3);
  }
  return result;
}

void *__getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_834(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AssistantServicesLibraryCore_frameworkLibrary_836)
  {
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_836;
  }
  else
  {
    AssistantServicesLibraryCore_frameworkLibrary_836 = _sl_dlopen();
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_836;
    if (!AssistantServicesLibraryCore_frameworkLibrary_836)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AFDeviceSupportsSystemAssistantExperience");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_833 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

id INCUnderlyingInteractionFromInteraction(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;

  v5 = a1;
  objc_msgSend(v5, "intentResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    objc_msgSend(v7, "underlyingIntent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "underlyingIntentResponse");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v9;
      v10 = v8;
      objc_msgSend(v10, "typeName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      INIntentCreate();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (v9)
        {
          objc_msgSend(v9, "typeName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "messageData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          INIntentResponseCreate();
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = 0;
        }
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v13, v16);

      }
      else
      {
        v20 = 0;
      }

      if (v20)
      {
        objc_msgSend(v20, "intentResponse");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "userActivity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v23 = objc_alloc(MEMORY[0x1E0CA5920]);
          objc_msgSend(v20, "intent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_className");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v23, "initWithActivityType:", v25);

        }
        v26 = objc_retainAutorelease(v22);
        *a2 = v26;
        objc_msgSend(v20, "setIntentHandlingStatus:", objc_msgSend(v5, "intentHandlingStatus"));
        objc_msgSend(v20, "intent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_intents_bundleIdForLaunching");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (a3 && v28)
        {
          objc_msgSend(v20, "intent");
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        INCUnderlyingInteractionFromInteraction(v20, a2, a3);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = v5;
      }
    }
    else
    {
      objc_msgSend(v5, "intent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_intents_bundleIdForLaunching");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      if (a3 && v18)
      {
        objc_msgSend(v5, "intent");
        v10 = 0;
        v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
    }
  }
  else
  {
    v19 = v5;
    v9 = 0;
    v10 = 0;
  }

  return v19;
}

id INCDeserializeNSUserActivityData(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CA5920];
    v2 = a1;
    v3 = (void *)objc_msgSend([v1 alloc], "_initWithUserActivityData:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1B72932A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLNFullyQualifiedActionIdentifierClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  LinkServicesLibrary();
  result = objc_getClass("LNFullyQualifiedActionIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNFullyQualifiedActionIdentifierClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getLNActionDefaultValueProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getLNActionDefaultValueProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  LinkServicesLibrary();
  result = objc_getClass("LNActionDefaultValueProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNActionDefaultValueProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__74__INCWidgetIntentProvider__provideAppIntentWithOptions_completionHandler___block_invoke(v3);
  }
  return result;
}

uint64_t getWFLinkActionSerializedParametersForLNActionSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr;
  v6 = getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr;
  if (!getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke;
    v2[3] = &unk_1E6BC4BF8;
    v2[4] = &v3;
    __getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7293B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (WorkflowKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)WorkflowKitLibraryCore_frameworkLibrary;
  }
  else
  {
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)WorkflowKitLibraryCore_frameworkLibrary;
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "WFLinkActionSerializedParametersForLNAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void LinkServicesLibrary()
{
  void *v0;

  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LinkServicesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

uint64_t INCExtensionPlugInBundleManagerPath()
{
  return MEMORY[0x1E0CBD3A0]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x1E0CBD408]();
}

uint64_t INFileURLSetAssociatedAuditToken()
{
  return MEMORY[0x1E0CBD418]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1E0CBD438]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x1E0CBD460]();
}

uint64_t INIsDeviceLocked()
{
  return MEMORY[0x1E0CBD4F8]();
}

uint64_t INIsHomepod()
{
  return MEMORY[0x1E0CBD500]();
}

uint64_t INIssueSandboxExtensionsForFileURLEnumerableToProcess()
{
  return MEMORY[0x1E0CBD510]();
}

uint64_t INLocalAppBundleIdentifierForIntentBundleIdentifier()
{
  return MEMORY[0x1E0CBD528]();
}

uint64_t INLogInitIfNeeded()
{
  return MEMORY[0x1E0CBD530]();
}

uint64_t INProcessHasEntitlement()
{
  return MEMORY[0x1E0CBD608]();
}

uint64_t INThisProcessIsAssistantd()
{
  return MEMORY[0x1E0CBD6A8]();
}

uint64_t INThisProcessIsRunningAsInstance()
{
  return MEMORY[0x1E0CBD6B0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t SBSCreateLayoutServiceEndpointForExternalDisplay()
{
  return MEMORY[0x1E0DAB618]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _INExtensionValidateClass()
{
  return MEMORY[0x1E0CBDD80]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
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

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

