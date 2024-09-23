void sub_19EDF34FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void fvd_figCaptureSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  __CFRunLoop *Main;
  __CFRunLoop *v10;
  _QWORD block[7];

  v8 = (void *)MEMORY[0x1A1AF16C4]();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __fvd_figCaptureSourceNotificationHandler_block_invoke;
  block[3] = &unk_1E4216898;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
  v10 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v10);
  objc_autoreleasePoolPop(v8);
}

uint64_t AVCaptureClientIsContinuityCapture()
{
  if (AVCaptureClientIsContinuityCapture_sOnceToken != -1)
    dispatch_once(&AVCaptureClientIsContinuityCapture_sOnceToken, &__block_literal_global_43);
  return AVCaptureClientIsContinuityCapture_sAnswer;
}

uint64_t AVGestaltGetBoolAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  return objc_msgSend((id)objc_msgSend((id)sAVGestaltBoolDataBase, "objectForKeyedSubscript:", a1), "BOOLValue");
}

uint64_t AVCaptureIsRunningInMediaserverd()
{
  if (AVCaptureIsRunningInMediaserverd_sOnceToken != -1)
    dispatch_once(&AVCaptureIsRunningInMediaserverd_sOnceToken, &__block_literal_global_20);
  return AVCaptureIsRunningInMediaserverd_sAnswer;
}

void sub_19EDF5AD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDF836C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t po_requestingDefaultHighResStillForAVCapturePhotoSettings(void *a1, void *a2, _QWORD *a3)
{
  uint64_t v6;

  if (!objc_msgSend(a1, "maxPhotoDimensions")
    && !((unint64_t)objc_msgSend(a1, "maxPhotoDimensions") >> 32))
  {
    *a3 = objc_msgSend(a2, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", objc_msgSend(a1, "isHighResolutionPhotoEnabled"));
    if (!objc_msgSend(a1, "isHighResolutionPhotoEnabled"))
      return 0;
    return objc_msgSend(a2, "supportsHighResolutionStillImageOutput");
  }
  *a3 = objc_msgSend(a1, "maxPhotoDimensions");
  v6 = objc_msgSend(a2, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", 1);
  if (objc_msgSend(a1, "maxPhotoDimensions") == v6)
    return objc_msgSend(a2, "supportsHighResolutionStillImageOutput");
  return 0;
}

void *AVSemanticSegmentationCMPhotoURNsForMatteTypes(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v16 = *MEMORY[0x1E0D09280];
    v17 = *MEMORY[0x1E0D092A0];
    v6 = *MEMORY[0x1E0D09290];
    v7 = *MEMORY[0x1E0D09288];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(a1);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeHair"), v16);
        v11 = v7;
        if ((v10 & 1) == 0)
        {
          v12 = objc_msgSend(v9, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeSkin"));
          v11 = v6;
          if ((v12 & 1) == 0)
          {
            v13 = objc_msgSend(v9, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"));
            v11 = v17;
            if ((v13 & 1) == 0)
            {
              v14 = objc_msgSend(v9, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"));
              v11 = v16;
              if (!v14)
                continue;
            }
          }
        }
        objc_msgSend(v2, "addObject:", v11);
      }
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  return v2;
}

void sub_19EDF9820(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDF98E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDF9D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EDFB6CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureClientHasEntitlement(void *a1)
{
  char *v2;
  dispatch_once_t *v3;
  uint64_t result;
  _QWORD v5[6];

  if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementShutterSoundManipulation) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_shutterManipulationAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkShutterManipulationOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementOfflineVideoStabilizer) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_offlineVideoStabilizerAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkOfflineVideoStabilizerOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementFilterRendering) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_filterRenderingAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkFilterRenderingOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_deferredPhotoProcessingAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkDeferredPhotoProcessingOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementDeskViewCamera) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_overheadCameraAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkOverheadCameraOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementMultitaskingCameraAccess) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_multitaskingCameraAccessAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkMultitaskingCameraAccessOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementSetAnyUserPreferredCamera) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_setAnyUserPreferredCameraAllowed;
    v3 = &AVCaptureClientHasEntitlement_setAnyUserPreferredCameraOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementMetadataCameras) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_metadataCamerasAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkMetadataCamerasOnceToken;
  }
  else if ((objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementWebBrowserEngineRendering) & 1) != 0)
  {
    v2 = &AVCaptureClientHasEntitlement_isWebBrowserEngineGPUProcess;
    v3 = &AVCaptureClientHasEntitlement_checkWebBrowserEngineRenderingOnceToken;
  }
  else
  {
    result = objc_msgSend(a1, "isEqualToString:", AVCaptureEntitlementProxyDevices);
    if (!(_DWORD)result)
      return result;
    v2 = &AVCaptureClientHasEntitlement_proxyDevicesAllowed;
    v3 = &AVCaptureClientHasEntitlement_checkProxyDevicesOnceToken;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __AVCaptureClientHasEntitlement_block_invoke;
  v5[3] = &unk_1E4216650;
  v5[4] = a1;
  v5[5] = v2;
  if (*v3 != -1)
    dispatch_once(v3, v5);
  return *v2 != 0;
}

uint64_t AVCaptureClientAllowsDeskViewCamera()
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.rapportd")) & 1) != 0)return 1;
  else
    return AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeskViewCamera);
}

void _registerVideoDevicesOnce()
{
  const char *CStringPtr;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (!sRegisteredVideoDevices)
  {
    sSourceInfoArrayChangedNotificationQueue = (uint64_t)dispatch_queue_create("com.apple.avfoundation.capturedevice.source_info_array_changed_queue", 0);
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x1E0D04B20], 0x8000100u);
    notify_register_dispatch(CStringPtr, (int *)&sSourceInfoArrayChangedNotificationToken, (dispatch_queue_t)sSourceInfoArrayChangedNotificationQueue, &__block_literal_global_1092);
    v1 = (id)-[objc_class _devices](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_devices");
    sRegisteredVideoDevices = (uint64_t)v1;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v9;
LABEL_4:
      v5 = 0;
      while (1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
        if ((__CFString *)objc_msgSend(v6, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")
          && objc_msgSend(v6, "position") == 2)
        {
          break;
        }
        if (v3 == ++v5)
        {
          v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          if (v3)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
}

BOOL AVCaptureColorSpaceIsHDR(uint64_t a1)
{
  return a1 == 2;
}

void sub_19EDFCA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EDFDC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EDFDD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EDFF4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EDFF968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EDFFC54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVMediaTypeForMetadataObjects()
{
  if (AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce != -1)
    dispatch_once(&AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce, &__block_literal_global_1);
  return AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata;
}

BOOL AVCapturePlatformMountsCamerasInLandscapeOrientation()
{
  if (AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken != -1)
    dispatch_once(&AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken, &__block_literal_global_50);
  return FigCapturePlatformMountsCamerasInLandscapeOrientation() != 0;
}

BOOL AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
{
  if (AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce != -1)
    dispatch_once(&AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce, &__block_literal_global_1);
  return AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata == *MEMORY[0x1E0CF2B80];
}

id AVIdentifierForObject(uint64_t a1)
{
  id v2;
  objc_class *v3;
  NSString *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@: %p %lld>"), v4, a1, mach_absolute_time());
}

void sub_19EE007D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE00A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19EE00B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

const __CFString *AVCaptureBundleIdentifier()
{
  return CFSTR("com.apple.AVFCapture");
}

void sub_19EE01B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void *ps_formatFourCCForSettingsDictionary(void *result)
{
  void *v1;

  if (result)
  {
    v1 = result;
    result = (void *)objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
    if (!(_DWORD)result)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
      return (void *)AVOSTypeForString();
    }
  }
  return result;
}

uint64_t AVCaptureIsRunningInMacCatalystEnvironment()
{
  if (AVCaptureIsRunningInMacCatalystEnvironment_once != -1)
    dispatch_once(&AVCaptureIsRunningInMacCatalystEnvironment_once, &__block_literal_global_202);
  return AVCaptureIsRunningInMacCatalystEnvironment_isCatalystApp;
}

uint64_t __di_notificationHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __vpl_figCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t AVCapturePrewarmWithOptions(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[32];

  v20[31] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmUserInteractionAbsoluteTimeKey")))
  {
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmUserInteractionAbsoluteTimeKey"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D04530]);
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmUserInteractionContinuousTimeKey")))
  {
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmUserInteractionContinuousTimeKey"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D04520]);
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmReasonKey")))
  {
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmReasonKey"));
    v20[0] = CFSTR("HomeScreen");
    v20[1] = CFSTR("Spotlight");
    v20[2] = CFSTR("AppSwitcher");
    v20[3] = CFSTR("NotificationCenter");
    v20[4] = CFSTR("ControlCenter");
    v20[5] = CFSTR("Banner");
    v20[6] = CFSTR("LockScreen");
    v20[7] = CFSTR("Siri");
    v20[8] = CFSTR("Stark");
    v20[9] = CFSTR("Continuity");
    v20[10] = CFSTR("SystemGesture");
    v20[11] = CFSTR("NonInteractiveSystemGesture");
    v20[12] = CFSTR("FBSystemService");
    v20[13] = CFSTR("Rotation");
    v20[14] = CFSTR("Breadcrumb");
    v20[15] = CFSTR("CommandTab");
    v20[16] = CFSTR("ExternalDisplay");
    v20[17] = CFSTR("Widget");
    v20[18] = CFSTR("HomeButton");
    v20[19] = CFSTR("Test");
    v20[20] = CFSTR("StatusBar");
    v20[21] = CFSTR("LockScreenPlugin");
    v20[22] = CFSTR("FloatingDock");
    v20[23] = CFSTR("FloatingDockSuggestions");
    v20[24] = CFSTR("DragAndDrop");
    v20[25] = CFSTR("StarkSiri");
    v20[26] = CFSTR("Startup");
    v20[27] = CFSTR("ActionButton");
    v20[28] = CFSTR("CameraCaptureButton");
    v20[29] = CFSTR("LockScreenButton");
    v20[30] = CFSTR("LockScreenSwipe");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 31);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11)) & 1) != 0)
          {
            v13 = (const __CFString *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVCapturePrewarmReasonKey"));
            v12 = *MEMORY[0x1E0D04528];
            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = *MEMORY[0x1E0D04528];
    v13 = CFSTR("Invalid");
LABEL_16:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);
  }
  return FigCaptureSessionRemotePrewarmWithOptions();
}

uint64_t AVGestaltGetDeviceFeatures(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t result;
  char *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v10 = 0;
  while (1)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&devices)[v10]), "componentsSeparatedByString:", CFSTR("-")), "containsObject:", a1);
    if ((_DWORD)result)
      break;
    v10 += 2;
    if (v10 == 88)
      return result;
  }
  v12 = (&devices)[v10 + 1];
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *v12), CFSTR("AVGQCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[1]), CFSTR("AVGQCameraFlashCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[2]), CFSTR("AVGQCameraFrontFlashCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[3]), CFSTR("AVGQCameraHDR2Capability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[4]), CFSTR("AVGQCameraLiveEffectsCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[5]), CFSTR("AVGQCaptureSessionSupportsMultiCamCapture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[6]), CFSTR("AVGQDeviceHasAggregateCamera"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[7]), CFSTR("AVGQB7LQTMQIRMWVL3QHSIGQY3YFAA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[8]), CFSTR("AVGQDeviceSupportsAutoLowLightVideo"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[9]), CFSTR("AVGQDeviceSupportsBravoCamera"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[10]), CFSTR("AVGQDeviceSupportsBravoPortrait"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[11]), CFSTR("AVGQDeviceSupportsCameraCaptureOnTouchDown"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[12]), CFSTR("AVGQDeviceSupportsCameraDeferredProcessing"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[13]), CFSTR("AVGQDeviceSupportsCinematicVideo"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[14]), CFSTR("AVGQ3FYMJTRW4LUXTNAFCC6XVFTDHA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[15]), CFSTR("AVGQDeviceSupportsContentAwareDistortionCorrection"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[16]), CFSTR("AVGQ3J3FEVOOCNOKKTK3XQPUQ47DYY"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[17]), CFSTR("AVGQBPMGIAYPLJA32XFRAAWDO5G4G4"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[18]), CFSTR("AVGQDeviceSupportsDeferredPortraitRendering"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[19]), CFSTR("AVGQDeviceSupportsExposureBiasWithoutExposureLock"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[20]), CFSTR("AVGQN46I2BPHSDKPVN3YSGNPHPTAPE"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[21]), CFSTR("AVGQDeviceSupportsFrontFacingCameraMirroredVideo"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[22]), CFSTR("AVGQDeviceSupportsFrontFacingCameraNightMode"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[23]), CFSTR("AVGQDeviceSupportsFrontFacingCameraSmartHDR"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[24]), CFSTR("AVGQDeviceSupportsFrontFacingCameraSuperWide"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[25]), CFSTR("AVGQDeviceSupportsFrontFacingCameraZoomToggle"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[26]), CFSTR("AVGQDeviceSupportsFrontPortrait"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[27]), CFSTR("AVGQDeviceSupportsHDREV0Capture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[28]), CFSTR("AVGQLBZEVZETJU77LU4MEZH4LWJ54M"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[29]), CFSTR("AVGQDeviceSupportsLinearDNG"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[30]), CFSTR("AVGQDeviceSupportsLivePhotoAuto"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[31]), CFSTR("AVGQDeviceSupportsMomentCapture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[32]), CFSTR("AVGQDeviceSupportsP3ColorspaceVideoRecording"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[33]), CFSTR("AVGQDeviceSupportsPortraitIntensityAdjustments"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[34]), CFSTR("AVGQDeviceSupportsPortraitLightEffectFilters"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[35]), CFSTR("AVGQL72SILMBLRSKPL2V4VLPUD2TDU"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[36]), CFSTR("AVGQDeviceSupportsProResVideo"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[37]), CFSTR("AVGQDeviceSupportsResponsiveShutter"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[38]), CFSTR("AVGQIIPQVVOWR6BFMGVVBAM7ZDTIW4"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[39]), CFSTR("AVGQDeviceSupportsSemanticDevelopment"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[40]), CFSTR("AVGQDeviceSupportsSemanticStyles"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[41]), CFSTR("AVGQDeviceSupportsSingleCameraPortrait"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[42]), CFSTR("AVGQJQYPVTLPCNY4PHM26XACLZH4PU"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[43]), CFSTR("AVGQX3DWIDHL6QYY3OCER3G5UEM2QU"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[44]), CFSTR("AVGQDeviceSupportsSpatialOverCapture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[45]), CFSTR("AVGQDeviceSupportsStageLightPortraitPreview"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[46]), CFSTR("AVGQDeviceSupportsStereoAudioRecording"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[47]), CFSTR("AVGQMZMLNHBX4MFF5QD4PJWZFEVCEI"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[48]), CFSTR("AVGQBWQSOG5QWWG276TG2HH4RGJZDA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[49]), CFSTR("AVGQDeviceSupportsStudioLightPortraitPreview"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[50]), CFSTR("AVGQDeviceSupportsSuperWideAutoMacro"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[51]), CFSTR("AVGQDeviceSupportsTimelapseNightMode"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[52]), CFSTR("AVGQDJVGPJA65CJA2ZPQZL4GRPYDYA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[53]), CFSTR("AVGQDeviceSupportsVariableFrameRateVideo"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[54]), CFSTR("AVGQDeviceSupportsWideBravoCamera"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[55]), CFSTR("AVGQDeviceSupportsWideBravoPortrait"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[56]), CFSTR("AVGQDeviceSupportsWideBravoPortraitNightMode"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[57]), CFSTR("AVGQVNFDPYA37ZIZPRZOSYS4KMQIJ4"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[58]), CFSTR("AVGQDeviceSupportsZoomPictureInPicture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[59]), CFSTR("AVGQFrontFacingCameraAutoHDRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[60]), CFSTR("AVGQFrontFacingCameraBurstCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[61]), CFSTR("AVGQFrontFacingCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[62]), CFSTR("AVGQFrontFacingCameraHDRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[63]), CFSTR("AVGQFrontFacingCameraHDROnCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[64]), CFSTR("AVGQFrontFacingCameraHFRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[65]), CFSTR("AVGQFrontFacingCameraPortraitModeCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[66]), CFSTR("AVGQFrontFacingCameraSingleCameraPortrait"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[67]), CFSTR("AVGQFrontFacingCameraStageLightPortraitCaptureCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[68]), CFSTR("AVGQHEVCEncodingCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[69]), CFSTR("AVGQHasAppleNeuralEngine"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[70]), CFSTR("AVGQMedusaOverlayAppCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[71]), CFSTR("AVGQPanoramaCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[72]), CFSTR("AVGQPearlCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[73]), CFSTR("AVGQPhotosPostEffectsCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[74]), CFSTR("AVGQPipelinedStillImageProcessingCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[75]), CFSTR("AVGQDINRSVRALL7UYNXKHVSIWKZLRA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[76]), CFSTR("AVGQRearFacingCamera60fpsVideoCaptureCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[77]), CFSTR("AVGQRearFacingCameraAutoHDRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[78]), CFSTR("AVGQRearFacingCameraBurstCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[79]), CFSTR("AVGQRearFacingCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[80]), CFSTR("AVGQRearFacingCameraFocusPixelCalibrationCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[81]), CFSTR("AVGQRearFacingCameraHDRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[82]), CFSTR("AVGQRearFacingCameraHDROnCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[83]), CFSTR("AVGQRearFacingCameraHFRCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[84]), CFSTR("AVGQRearFacingCameraPortraitModeCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[85]), CFSTR("AVGQRearFacingCameraStageLightPortraitCaptureCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[86]), CFSTR("AVGQRearFacingCameraSuperWideCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[87]), CFSTR("AVGQPEABAPB242SGF4J5L26EX5YTKA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[88]), CFSTR("AVGQRearFacingCameraTimeOfFlightCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[89]), CFSTR("AVGQQ4PFVIJ6WPTAHHYTAR5J5O7YNA"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[90]), CFSTR("AVGQRearFacingLowLightCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[91]), CFSTR("AVGQRearFacingTelephotoCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[92]), CFSTR("AVGQSphereCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[93]), CFSTR("AVGQSupportsIrisCapture"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[94]), CFSTR("AVGQVideoCameraCapability"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12[95]), CFSTR("AVGQVideoStillsCapability"));
  LODWORD(v13) = *((_DWORD *)v12 + 24);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), CFSTR("AVGQFrontFacingCameraMaxPhotoZoomFactor"));
  LODWORD(v14) = *((_DWORD *)v12 + 25);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), CFSTR("AVGQRearFacingAggregateDeviceMaxCinematicZoomFactor"));
  LODWORD(v15) = *((_DWORD *)v12 + 26);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), CFSTR("AVGQRearFacingAggregateDeviceMaxPortraitZoomFactor"));
  LODWORD(v16) = *((_DWORD *)v12 + 27);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16), CFSTR("AVGQRearFacingCameraMaxPhotoZoomFactor"));
  LODWORD(v17) = *((_DWORD *)v12 + 28);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17), CFSTR("AVGQSN3QUOWTBFYIVAQOVNQEVK6G4M"));
  LODWORD(v18) = *((_DWORD *)v12 + 29);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18), CFSTR("AVGQSuperWideCameraToWideCameraRelativeZoomFactor"));
  LODWORD(v19) = *((_DWORD *)v12 + 30);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19), CFSTR("AVGQTorchMaxBeamWidth"));
  LODWORD(v20) = *((_DWORD *)v12 + 31);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20), CFSTR("AVGQTorchMinBeamWidth"));
  LODWORD(v21) = *((_DWORD *)v12 + 32);
  result = objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21), CFSTR("AVGQWideCameraToTelephotoCameraRelativeZoomFactor"));
  if (*((_QWORD *)v12 + 17) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQAggregateDevicePhotoZoomFactor"));
  if (*((_QWORD *)v12 + 18) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQAggregateDeviceVideoZoomFactor"));
  if (*((_QWORD *)v12 + 19) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQBravoCameraVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 20) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQCameraAppUIVersion"));
  if (*((_QWORD *)v12 + 21) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQCameraHDR10BitVideoCaptureMaxFPS"));
  if (*((_QWORD *)v12 + 22) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQCameraHDRVersion"));
  if (*((_QWORD *)v12 + 23) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQCameraMaxBurstLength"));
  if (*((_QWORD *)v12 + 24) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQCaptureSessionMaxMultiCamRGBStreamsSupported"));
  if (*((_QWORD *)v12 + 25) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQDefaultVariableFrameRateVideoMaxFPS"));
  if (*((_QWORD *)v12 + 26) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraHFRVideoCapture1080pMaxFPS"));
  if (*((_QWORD *)v12 + 27) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraHFRVideoCapture720pMaxFPS"));
  if (*((_QWORD *)v12 + 28) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraMaxVideoZoomFactor"));
  if (*((_QWORD *)v12 + 29) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraStillDurationForBurst"));
  if (*((_QWORD *)v12 + 30) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraVideoCapture1080pMaxFPS"));
  if (*((_QWORD *)v12 + 31) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 32) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQFrontFacingCameraVideoCapture720pMaxFPS"));
  if (*((_QWORD *)v12 + 33) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQMinimumDiskSpaceReserved"));
  if (*((_QWORD *)v12 + 34) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraHFRVideoCapture1080pMaxFPS"));
  if (*((_QWORD *)v12 + 35) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraHFRVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 36) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraHFRVideoCapture720pMaxFPS"));
  if (*((_QWORD *)v12 + 37) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraMaxVideoZoomFactor"));
  if (*((_QWORD *)v12 + 38) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraStillDurationForBurst"));
  if (*((_QWORD *)v12 + 39) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraVideoCapture1080pMaxFPS"));
  if (*((_QWORD *)v12 + 40) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 41) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingCameraVideoCapture720pMaxFPS"));
  if (*((_QWORD *)v12 + 42) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingSuperWideCameraFocalLengthIn35mm"));
  if (*((_QWORD *)v12 + 43) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingTeleCameraFocalLengthIn35mm"));
  if (*((_QWORD *)v12 + 44) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQRearFacingWideCameraFocalLengthIn35mm"));
  if (*((_QWORD *)v12 + 45) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQGYSWMQKMTMQOUYQ2AKUCKEN6AA"));
  if (*((_QWORD *)v12 + 46) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQSuperBravoCameraVideoCapture1080pMaxFPS"));
  if (*((_QWORD *)v12 + 47) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQSuperBravoCameraVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 48) != 0x7FFFFFFFFFFFFFFFLL)
    result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("AVGQWideBravoCameraVideoCapture4kMaxFPS"));
  if (*((_QWORD *)v12 + 49))
    return objc_msgSend(a5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"), CFSTR("AVGQFirstSupportedReleaseVersion"));
  return result;
}

uint64_t AVGestaltGetIntegerAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = (void *)objc_msgSend((id)sAVGestaltIntegerDataBase, "objectForKeyedSubscript:", a1);
  if (v4)
    return objc_msgSend(v4, "integerValue");
  else
    return a2;
}

uint64_t vdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

uint64_t mdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

uint64_t ddo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

_QWORD *getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(void *a1, void *a2, char a3, char a4, void *a5)
{
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  result = (_QWORD *)objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  v19 = result;
  if (result)
  {
    v9 = *(_QWORD *)v28;
    v18 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(a1);
        v21 = v10;
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(a2);
              v16 = *(_QWORD **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ((a3 & 1) != 0 || (objc_msgSend(v16, "isSuspended") & 1) == 0)
                && ((a4 & 1) != 0 || objc_msgSend(v16, "specialDeviceType") != 1)
                && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DeviceUID")), "isEqualToString:", v16[10])&& (objc_msgSend(v16, "specialDeviceType") != 2&& objc_msgSend(v16, "specialDeviceType") != 3|| (fvd_deviceIsPresentInCameraList((uint64_t)v16, a5) & 1) != 0))
              {
                return v16;
              }
            }
            v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v13)
              continue;
            break;
          }
        }
        v10 = v21 + 1;
        v9 = v18;
      }
      while ((id)(v21 + 1) != v19);
      v17 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      result = 0;
      v19 = (id)v17;
    }
    while (v17);
  }
  return result;
}

_QWORD *getFirstAvailableDeviceFromHistory(void *a1, void *a2, char a3, char a4)
{
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  result = (_QWORD *)objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v18 = result;
  if (result)
  {
    v8 = *(_QWORD *)v26;
    v17 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(a1);
        v20 = v9;
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v29, 16, v17);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(a2);
              v15 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ((a3 & 1) != 0 || (objc_msgSend(v15, "isSuspended") & 1) == 0)
                && ((a4 & 1) != 0 || objc_msgSend(v15, "specialDeviceType") != 1)
                && (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeviceUID")), "isEqualToString:", v15[10]) & 1) != 0)
              {
                return v15;
              }
            }
            v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v12)
              continue;
            break;
          }
        }
        v9 = v20 + 1;
        v8 = v17;
      }
      while ((id)(v20 + 1) != v18);
      v16 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      result = 0;
      v18 = (id)v16;
    }
    while (v16);
  }
  return result;
}

void sub_19EE0CE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EE0D458(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureOutputConnectionFailureReasonString(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  objc_class *v5;
  const __CFString *v6;
  uint64_t result;
  void *v8;
  objc_class *v9;
  NSString *v10;
  objc_class *v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  objc_class *v15;
  NSString *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  NSString *v24;

  switch(a1)
  {
    case 1:
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v5);
      v23 = a3;
      v6 = CFSTR("<%@: %p> cannot be added because the source and destination media types are incompatible");
      goto LABEL_9;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = (objc_class *)objc_opt_class();
      v23 = a3;
      v24 = NSStringFromClass(v11);
      v22 = v10;
      v6 = CFSTR("<%@: %p> cannot be added because %@ only accepts one connection of this media type at a time, and it is already connected");
      goto LABEL_7;
    case 3:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = (objc_class *)objc_opt_class();
      v23 = a3;
      v24 = NSStringFromClass(v14);
      v22 = v13;
      v6 = CFSTR("<%@: %p> cannot be added because %@ only accepts metadata connections originating from the same AVCaptureInput");
      goto LABEL_7;
    case 4:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = (objc_class *)objc_opt_class();
      v23 = a3;
      v24 = NSStringFromClass(v17);
      v22 = v16;
      v6 = CFSTR("<%@: %p> cannot be added because %@ only accepts AVCaptureDeviceInput metadata connections originating from the same AVCaptureDeviceInput");
LABEL_7:
      v18 = v8;
      goto LABEL_10;
    case 5:
      v4 = (void *)MEMORY[0x1E0CB3940];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
      v21 = (objc_class *)objc_opt_class();
      v23 = a3;
      v24 = NSStringFromClass(v21);
      v22 = v20;
      v6 = CFSTR("<%@: %p> cannot be added because streaming depth is not supported for the source AVCaptureDevice's activeFormat: %@");
LABEL_9:
      v18 = v4;
LABEL_10:
      result = objc_msgSend(v18, "stringWithFormat:", v6, v22, v23, v24);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t AVCaptureAudiomxdSupportEnabled()
{
  if (AVCaptureAudiomxdSupportEnabled_sOnceToken != -1)
    dispatch_once(&AVCaptureAudiomxdSupportEnabled_sOnceToken, &__block_literal_global_16);
  return AVCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled;
}

void sub_19EE0F058(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE0F1AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE0F26C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE0F488(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE0F574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE0F8A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE0FB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EE0FEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EE103B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE104A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE105C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE10BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EE14414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE147F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AVCaptureClientPreferencesDomain()
{
  __CFString *v0;
  _BOOL4 v1;

  v0 = (__CFString *)sClientPreferencesDomain;
  if (sClientPreferencesDomain)
    return v0;
  if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1)
    dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_23);
  if (AVCaptureCurrentClientIsFaceTimeVariant_sAnswer)
  {
    v0 = CFSTR("com.apple.facetime");
    v1 = 1;
  }
  else
  {
    v0 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsDomainForClient](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsDomainForClient");
    v1 = v0 != 0;
    if (!v0)
    {
      v0 = CFSTR("unknown");
      if (!v1)
        return v0;
      goto LABEL_12;
    }
  }
  if (-[__CFString hasPrefix:](v0, "hasPrefix:", CFSTR("com.apple.WebKit")))
    v0 = CFSTR("com.apple.mobilesafari");
  if (v1)
  {
LABEL_12:
    os_unfair_lock_lock((os_unfair_lock_t)&sClientPreferencesDomainLock);
    if (!sClientPreferencesDomain)
      sClientPreferencesDomain = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v0);
    os_unfair_lock_unlock((os_unfair_lock_t)&sClientPreferencesDomainLock);
  }
  return v0;
}

uint64_t AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@reactions-unavailablereasons"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@reaction-trigger"), avcc_prefixedSignalPreferenceKeyForBundleID(a1));
}

uint64_t AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@reactions-active"), avcc_prefixedSignalPreferenceKeyForBundleID(a1));
}

uint64_t AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@reactions-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@portraiteffect-unavailablereasons"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@portraiteffect-migration-complete"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@portraiteffect-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@portraiteffect-controlmode"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@gestures-enabled-default"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254()
{
  if (AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sOnceToken != -1)
    dispatch_once(&AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sOnceToken, &__block_literal_global_51);
  return AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sAnswer;
}

void sub_19EE15300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE15424(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE15520(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_19EE158D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE15C44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE15F8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE16358(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureClientExpectsCameraMountedInLandscapeOrientation()
{
  if (AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken != -1)
    dispatch_once(&AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken, &__block_literal_global_50);
  return AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sAnswer;
}

void sub_19EE174D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE176A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE17A74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *avcmdo_allMetadataObjectsInCollections(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "metadataObjects"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout(void *a1, const char *a2)
{
  return objc_msgSend(a1, "_setMultitaskingCameraAccessEnabled:", 1);
}

void sub_19EE1A6A0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE1A728(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE1B098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EE1B1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EE1B414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void __avcdpp_dispatchNotification_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  const void *v4;

  v2 = (void *)MEMORY[0x1A1AF16C4]();
  objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
  objc_autoreleasePoolPop(v2);
}

uint64_t __fvd_figCaptureSourceNotificationHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_19EE1DE64(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x970], 8);
  _Unwind_Resume(a1);
}

void sub_19EE1DFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFDictionaryRef fvd_cgRectDictionaryForCenterAndSize(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = fmax(a1 - a3 * 0.5, 0.0);
  if (v4 >= 1.0 - a3)
    v4 = 1.0 - a3;
  v5 = fmax(a2 - a4 * 0.5, 0.0);
  if (v5 >= 1.0 - a4)
    v5 = 1.0 - a4;
  return CGRectCreateDictionaryRepresentation(*(CGRect *)(&a3 - 2));
}

void sub_19EE1F844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *avcfvd_deviceTypesFromAVCaptureDevices(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "figCaptureSourceDeviceType")));
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

void sub_19EE1FC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19EE20338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE20B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t __avgestalt_buildDataBase_block_invoke()
{
  uint64_t ModelSpecificName;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v84;

  sAVGestaltBoolDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sAVGestaltIntegerDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sAVGestaltFloatDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sAVGestaltStringDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  ModelSpecificName = FigCaptureGetModelSpecificName();
  AVGestaltGetDeviceFeatures(ModelSpecificName, (void *)sAVGestaltBoolDataBase, (void *)sAVGestaltIntegerDataBase, (void *)sAVGestaltFloatDataBase, (void *)sAVGestaltStringDataBase);
  v1 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v2 = 0;
  else
    v2 = dyld_program_sdk_at_least();
  v3 = objc_msgSend(v1, "numberWithInt:", v2);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v3, CFSTR("AVGQCaptureDepthWithDeepFusionSupported"));
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", FigCapturePlatformSupportsExclaves() != 0), CFSTR("AVGQCaptureAttentionDetectionSupported"));
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 3)
  {
    v5 = 1;
  }
  else if (dyld_get_active_platform() == 1 || dyld_get_active_platform() == 6)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = objc_msgSend((id)objc_msgSend(v6, "objectForInfoDictionaryKey:", AVCaptureBundleUseContinuityCameraDeviceTypeKey), "BOOLValue");
  }
  else
  {
    v5 = 0;
  }
  v7 = objc_msgSend(v4, "numberWithInt:", v5);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v7, CFSTR("AVGQCaptureUseContinuityCameraDeviceType"));
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 2
    || dyld_get_active_platform() == 11
    || dyld_get_active_platform() == 1)
  {
    v9 = 1;
  }
  else if (dyld_get_active_platform() == 6)
  {
    v84 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = objc_msgSend((id)objc_msgSend(v84, "objectForInfoDictionaryKey:", AVCaptureBundleUseExternalDeviceTypeKey), "BOOLValue");
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v8, "numberWithInt:", v9);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v10, CFSTR("AVGQCaptureUseExternalDeviceType"));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v12 = 0;
  else
    v12 = dyld_program_sdk_at_least();
  v13 = objc_msgSend(v11, "numberWithInt:", v12);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v13, CFSTR("AVGQCaptureMultitaskingCameraAccessVoipAppsSupported"));
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v15 = 0;
  else
    v15 = dyld_program_sdk_at_least();
  v16 = objc_msgSend(v14, "numberWithInt:", v15);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v16, CFSTR("AVGQCaptureZeroShutterLagAutomaticallyEnabled"));
  v17 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v18 = 0;
  else
    v18 = dyld_program_sdk_at_least();
  v19 = objc_msgSend(v17, "numberWithInt:", v18);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v19, CFSTR("AVGQCaptureCheckIfFileAlreadyExistForMFO"));
  v20 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v21 = 0;
  else
    v21 = dyld_program_sdk_at_least();
  v22 = objc_msgSend(v20, "numberWithInt:", v21);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v22, CFSTR("AVGQCaptureSimultaneousADOMFOVDOOutputsSupported"));
  v23 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v24 = 0;
  else
    v24 = dyld_program_sdk_at_least();
  v25 = objc_msgSend(v23, "numberWithInt:", v24);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v25, CFSTR("AVGQCaptureMultipleVideoDataOutputsSupported"));
  v26 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v27 = 0;
  else
    v27 = dyld_program_sdk_at_least();
  v28 = objc_msgSend(v26, "numberWithInt:", v27);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v28, CFSTR("AVGQCaptureFaceDrivenAEAFOnByDefault"));
  v29 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v30 = 0;
  else
    v30 = dyld_program_sdk_at_least();
  v31 = objc_msgSend(v29, "numberWithInt:", v30);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v31, CFSTR("AVGQCaptureHighPhotoQualityFrameDropAllowed"));
  v32 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v33 = 0;
  else
    v33 = dyld_program_sdk_at_least();
  v34 = objc_msgSend(v32, "numberWithInt:", v33);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v34, CFSTR("AVGQCaptureDeviceSupportsCinematicVideoFocusAtPoint"));
  v35 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v36 = 0;
  else
    v36 = dyld_program_sdk_at_least();
  v37 = objc_msgSend(v35, "numberWithInt:", v36);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v37, CFSTR("AVGQCaptureExtendedCinematicVISSupported"));
  v38 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v39 = 0;
  else
    v39 = dyld_program_sdk_at_least();
  v40 = objc_msgSend(v38, "numberWithInt:", v39);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v40, CFSTR("AVGQCaptureMFOSupportsPhotoFormats"));
  v41 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v42 = 0;
  else
    v42 = dyld_program_sdk_at_least();
  v43 = objc_msgSend(v41, "numberWithInt:", v42);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v43, CFSTR("AVGQCaptureMFOVideoSettingsSupportCompressionProperties"));
  v44 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v45 = 0;
  else
    v45 = dyld_program_sdk_at_least();
  v46 = objc_msgSend(v44, "numberWithInt:", v45);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v46, CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"));
  v47 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v48 = 0;
  else
    v48 = dyld_program_sdk_at_least();
  v49 = objc_msgSend(v47, "numberWithInt:", v48);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v49, CFSTR("AVGQCaptureDevicesShouldBeSortedByDeviceType"));
  v50 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v51 = 0;
  else
    v51 = dyld_program_sdk_at_least();
  v52 = objc_msgSend(v50, "numberWithInt:", v51);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v52, CFSTR("AVGQCaptureAppsMayUseHEVC"));
  v53 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v54 = 0;
  else
    v54 = dyld_program_sdk_at_least();
  v55 = objc_msgSend(v53, "numberWithInt:", v54);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v55, CFSTR("AVGQCaptureADOSupportsAudioCaptureWithPhotoFormats"));
  v56 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v57 = 0;
  else
    v57 = dyld_program_sdk_at_least();
  v58 = objc_msgSend(v56, "numberWithInt:", v57);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v58, CFSTR("AVGQCaptureMicrophoneUsesDecoupledIO"));
  v59 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v60 = 0;
  else
    v60 = dyld_program_sdk_at_least() ^ 1;
  v61 = objc_msgSend(v59, "numberWithInt:", v60);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v61, CFSTR("AVGQCaptureConnectionAlwaysSelectsStandardVISFor720p30"));
  v62 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v63 = 0;
  else
    v63 = dyld_program_sdk_at_least();
  v64 = objc_msgSend(v62, "numberWithInt:", v63);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v64, CFSTR("AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"));
  v65 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v66 = 0;
  else
    v66 = dyld_program_sdk_at_least();
  v67 = objc_msgSend(v65, "numberWithInt:", v66);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v67, CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"));
  v68 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v69 = 0;
  else
    v69 = dyld_program_sdk_at_least();
  v70 = objc_msgSend(v68, "numberWithInt:", v69);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v70, CFSTR("AVGQCaptureSessionUsesAppAudioSessionByDefault"));
  v71 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v72 = 0;
  else
    v72 = dyld_program_sdk_at_least() ^ 1;
  v73 = objc_msgSend(v71, "numberWithInt:", v72);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v73, CFSTR("AVGQCaptureMetadataOutputCapturesFacesByDefault"));
  v74 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v75 = 0;
  else
    v75 = dyld_program_sdk_at_least();
  v76 = objc_msgSend(v74, "numberWithInt:", v75);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v76, CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"));
  v77 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v78 = 0;
  else
    v78 = dyld_program_sdk_at_least() ^ 1;
  v79 = objc_msgSend(v77, "numberWithInt:", v78);
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v79, CFSTR("AVGQCaptureMFOStabilizationIsAlwaysOn"));
  v80 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_get_active_platform() == 1)
    v81 = 0;
  else
    v81 = dyld_program_sdk_at_least();
  v82 = objc_msgSend(v80, "numberWithInt:", v81);
  return objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", v82, CFSTR("AVGQCaptureVDOFrameRatePropertiesAreDeprecated"));
}

uint64_t AVControlCenterVideoEffectsModuleGetUnavailableReasons(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "unavailableReasonsForVideoEffect:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@request-gestures-default-disabled-notification"), CFSTR("signal/"));
}

uint64_t AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@did-show-gestures-default-disabled-notification"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterMigrateDefaultsForKeys(void *a1, void *a2, uint64_t a3)
{
  uint64_t result;
  __CFString *v7;
  int v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:"), "BOOLValue");
  if ((result & 1) != 0)
    return result;
  v7 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", 0x1E4221E08);
  if (v7
    && (v9 = v8,
        !-[__CFString isEqualToString:](v7, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"))))
  {
    if (!v9)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", a1, 1, 0);
      v21 = objc_msgSend(v20, "dataContainerURL");
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", v7, v21);

      goto LABEL_6;
    }
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v7);
  }
  else
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  }
  v11 = v10;
LABEL_6:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(a2);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = objc_msgSend(a2, "objectForKeyedSubscript:", v16);
        v18 = objc_msgSend(v11, "objectForKey:", v16);
        if (v18)
          v19 = v17 == 0;
        else
          v19 = 1;
        if (!v19)
          +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v18, v17);
      }
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  return +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], a3);
}

uint64_t AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@centerstage-unavailablereasons"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@centerstage-migration-complete"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@centerstage-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@centerstage-controlmode"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVCaptureClientIsFaceTimeVariant(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mediaserverd")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", 0x1E4221DC8) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", 0x1E4221E08) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.avconferenced")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.FaceTime.FaceTimeNotificationCenterService")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.VideoConference.AVConferenceTestRunneriOS")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.AVConferenceTestRunnertvOS")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.facetime.legacy")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.facetime.debug"));
  }
}

uint64_t AVCaptureIsRunningInXCTest()
{
  if (AVCaptureIsRunningInXCTest_sOnceToken != -1)
    dispatch_once(&AVCaptureIsRunningInXCTest_sOnceToken, &__block_literal_global_190);
  return AVCaptureIsRunningInXCTest_sAnswer;
}

uint64_t AVCaptureClientIsInternalTestTool()
{
  if (AVCaptureClientIsInternalTestTool_sOnceToken != -1)
    dispatch_once(&AVCaptureClientIsInternalTestTool_sOnceToken, &__block_literal_global_38);
  return AVCaptureClientIsInternalTestTool_sAnswer;
}

uint64_t AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@studiolighting-intensity"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@studiolighting-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@studiolighting-controlmode"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@portraiteffect-aperture"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@studiolighting-unavailablereasons"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@gestures-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterModulesShouldBeShownForBundleID(__CFString *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v3;
  NSObject *v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[29];

  v11[28] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (AVCaptureClientIsFaceTimeVariant(a1))
    a1 = CFSTR("com.apple.facetime");
  if (-[__CFString hasPrefix:](a1, "hasPrefix:", CFSTR("com.apple.WebKit"), v7, v9))
    a1 = CFSTR("com.apple.mobilesafari");
  v11[0] = 0x1E4220D28;
  v11[1] = 0x1E4221D68;
  v11[2] = 0x1E4221D88;
  v11[3] = 0x1E4221E28;
  v11[4] = 0x1E4221E68;
  v11[5] = CFSTR("com.apple.ShazamKit");
  v11[6] = CFSTR("com.apple.VisionKit.KeyboardCamera");
  v11[7] = 0x1E4221DE8;
  v11[8] = 0x1E4221DA8;
  v11[9] = CFSTR("com.apple.livetranscriptionui");
  v11[10] = CFSTR("com.apple.BarcodeScanner");
  v11[11] = CFSTR("com.apple.measure");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 12), "containsObject:", a1))
  {
    if (dword_1ECFED5A0)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  else
  {
    v3 = _AVControlCenterModuleStateForBundleID((uint64_t)a1);
    if (dword_1ECFED5A0)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(v3, "isActive", v8, v10);
  }
}

__CFString *AVControlCenterPreferencesDomainForPreferencesDomain(void *a1)
{
  __CFString *v2;

  v2 = CFSTR("com.apple.facetime");
  if ((objc_msgSend(a1, "isEqualToString:", 0x1E4221E08) & 1) == 0)
  {
    if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1)
      dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_23);
    if (!AVCaptureCurrentClientIsFaceTimeVariant_sAnswer)
    {
      if (objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.WebKit")))
        return CFSTR("com.apple.mobilesafari");
      else
        return (__CFString *)a1;
    }
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "controlModeForVideoEffect:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "isEnabledForVideoEffect:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "supportsVideoEffect:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

id _AVControlCenterModuleStateForBundleID(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (AVControlCenterModulesPrewarm_onceToken != -1)
    dispatch_once(&AVControlCenterModulesPrewarm_onceToken, &__block_literal_global_368);
  os_unfair_lock_lock((os_unfair_lock_t)&sModuleStatesLock);
  v2 = (void *)objc_msgSend((id)sModuleStatesByBundleID, "objectForKeyedSubscript:", a1);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, "isDeviceBasedModuleState")
      && (objc_msgSend(v3, "isDeviceBasedModuleStateUpdateToDate") & 1) == 0)
    {
      if (dword_1ECFED5A0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v3, "setupDeviceBasedModuleStatesIfNeeded", v10, v13);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
  }
  else
  {
    if (dword_1ECFED5A0)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = +[AVControlCenterModuleState moduleStateForBundleID:](AVControlCenterModuleState, "moduleStateForBundleID:", a1, v10, v13);
    if (dword_1ECFED5A0)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)sModuleStatesByBundleID, "setObject:forKeyedSubscript:", v3, a1, v11, v14);
    os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
    if (dword_1ECFED5A0)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v3, "installProprietaryDefaultsHandlers", v12, v15);
    if (dword_1ECFED5A0)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v3;
}

uint64_t AVCaptureClientIsInternalCommandLineTool()
{
  if (AVCaptureClientIsInternalCommandLineTool_sOnceToken != -1)
    dispatch_once(&AVCaptureClientIsInternalCommandLineTool_sOnceToken, &__block_literal_global_201);
  return AVCaptureClientIsInternalCommandLineTool_sAnswer;
}

void sub_19EE249BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_19EE24E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_19EE253D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE256D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE26284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGAffineTransform *AVCaptureVideoTransformForCaptureDevice@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, char a7@<W6>, void *a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, double a14@<D4>, double a15@<D5>, CGFloat a16@<D6>, CGFloat a17@<D7>, char a18, char a19)
{
  double v37;
  double v38;
  int v39;
  double v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGAffineTransform *v53;
  uint64_t v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGAffineTransform *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  double v91;
  double v92;
  uint64_t v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGAffineTransform *result;
  double v99;
  double v100;
  int v101;
  double v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  double v106;
  CGFloat v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  CGAffineTransform v123;
  CGAffineTransform v124;
  CGAffineTransform v125;
  CGAffineTransform v126;
  CGAffineTransform v127;
  CGAffineTransform v128;
  CGAffineTransform v129;
  CGAffineTransform v130;
  CGAffineTransform v131;
  CGAffineTransform v132;
  CGAffineTransform v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  CGAffineTransform v138;
  CGAffineTransform v139;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v142;
  CGAffineTransform v143;
  CGRect v144;
  CGRect v145;

  *(_OWORD *)(a9 + 16) = 0u;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)a9 = 0u;
  CGAffineTransformMakeScale((CGAffineTransform *)a9, a10, a11);
  if (a10 != a12 || a11 != a13)
  {
    if (objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CEDB48]))
    {
      v37 = fmax(a12 / a10, a13 / a11);
      v38 = v37;
    }
    else
    {
      v39 = objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CEDB38]);
      v38 = a12 / a10;
      v37 = a13 / a11;
      v40 = fmin(a12 / a10, a13 / a11);
      if (v39)
      {
        v37 = v40;
        v38 = v40;
      }
    }
    memset(&v143, 0, sizeof(v143));
    CGAffineTransformMakeScale(&v143, v38, v37);
    v41 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v41;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    t2 = v143;
    CGAffineTransformConcat(&v142, &t1, &t2);
    v42 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v42;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
    v142 = v143;
    v43 = 0;
    *(_QWORD *)&v42 = 0;
    v44 = a10;
    v45 = a11;
    v144 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v42 - 8), &v142);
    CGAffineTransformMakeTranslation(&v139, (a12 - v144.size.width) * 0.5, (a13 - v144.size.height) * 0.5);
    v46 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v142, &t1, &v139);
    v47 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v47;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
  }
  v48 = 0;
  if (!a4)
  {
    v54 = 0;
    v55 = a12;
    a12 = a13;
    goto LABEL_45;
  }
  if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
  {
    v49 = FigCaptureCameraRequires180DegreesRotation();
    switch(a5)
    {
      case 1:
        if (!a3 && ((a2 ^ 1 | v49) & 1) != 0)
        {
          CGAffineTransformMakeRotation(&v136, 1.57079633);
          v50 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v50;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          CGAffineTransformConcat(&v143, &v142, &v136);
          v51 = *(_OWORD *)&v143.c;
          *(_OWORD *)a9 = *(_OWORD *)&v143.a;
          *(_OWORD *)(a9 + 16) = v51;
          *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
          CGAffineTransformMakeTranslation(&v135, a13, 0.0);
          v52 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v52;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          v53 = &v135;
          goto LABEL_39;
        }
        CGAffineTransformMakeRotation(&v138, 4.71238898);
        v79 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v79;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v138);
        v80 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v80;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v137, 0.0, a12);
        v81 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v81;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v63 = &v137;
        goto LABEL_37;
      case 2:
        if (!a3 && ((a2 ^ 1 | v49) & 1) != 0)
        {
          CGAffineTransformMakeRotation(&v132, 4.71238898);
          v67 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v67;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          CGAffineTransformConcat(&v143, &v142, &v132);
          v68 = *(_OWORD *)&v143.c;
          *(_OWORD *)a9 = *(_OWORD *)&v143.a;
          *(_OWORD *)(a9 + 16) = v68;
          *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
          CGAffineTransformMakeTranslation(&v131, 0.0, a12);
          v69 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v69;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          v63 = &v131;
          goto LABEL_37;
        }
        CGAffineTransformMakeRotation(&v134, 1.57079633);
        v83 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v83;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v134);
        v84 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v84;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v133, a13, 0.0);
        v85 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v85;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v53 = &v133;
        break;
      case 3:
        if ((a2 & v49) != 1 || (a3 & 1) != 0)
          goto LABEL_33;
        CGAffineTransformMakeRotation(&v130, 3.14159265);
        v70 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v70;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v130);
        v71 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v71;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v129, a12, a13);
        v72 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v72;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v129;
        goto LABEL_42;
      case 4:
        if ((a2 & v49) == 1 && !a3)
          goto LABEL_33;
        CGAffineTransformMakeRotation(&v128, 3.14159265);
        v87 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v87;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v128);
        v88 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v88;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v127, a12, a13);
        v89 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v89;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v127;
        goto LABEL_42;
      default:
        goto LABEL_33;
    }
    goto LABEL_39;
  }
  if (a5 == 4)
  {
    if ((a2 & 1) == 0)
    {
      CGAffineTransformMakeRotation(&v120, 1.57079633);
      v76 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v76;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      CGAffineTransformConcat(&v143, &v142, &v120);
      v77 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v77;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      CGAffineTransformMakeTranslation(&v119, a13, 0.0);
      v78 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v78;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      v53 = &v119;
      goto LABEL_39;
    }
    CGAffineTransformMakeRotation(&v118, 4.71238898);
    v60 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v60;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v118);
    v61 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v61;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v117, 0.0, a12);
    v62 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v62;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    v63 = &v117;
  }
  else
  {
    if (a5 != 3)
    {
      if (a5 == 2)
      {
        CGAffineTransformMakeRotation(&v126, 3.14159265);
        v56 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v56;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v126);
        v57 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v57;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v125, a12, a13);
        v58 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v58;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v125;
LABEL_42:
        CGAffineTransformConcat(&v143, &v142, v59);
        v90 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v90;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        v54 = 0x4066800000000000;
      }
      else
      {
LABEL_33:
        v54 = 0;
      }
      v55 = a12;
      a12 = a13;
      goto LABEL_44;
    }
    if ((a2 & 1) != 0)
    {
      CGAffineTransformMakeRotation(&v122, 1.57079633);
      v64 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v64;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      CGAffineTransformConcat(&v143, &v142, &v122);
      v65 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v65;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      CGAffineTransformMakeTranslation(&v121, a13, 0.0);
      v66 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v66;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      v53 = &v121;
LABEL_39:
      CGAffineTransformConcat(&v143, &v142, v53);
      v86 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v86;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      v54 = 0x4056800000000000;
      goto LABEL_40;
    }
    CGAffineTransformMakeRotation(&v124, 4.71238898);
    v73 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v73;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v124);
    v74 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v74;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v123, 0.0, a12);
    v75 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v75;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    v63 = &v123;
  }
LABEL_37:
  CGAffineTransformConcat(&v143, &v142, v63);
  v82 = *(_OWORD *)&v143.c;
  *(_OWORD *)a9 = *(_OWORD *)&v143.a;
  *(_OWORD *)(a9 + 16) = v82;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
  v54 = 0x4070E00000000000;
LABEL_40:
  v55 = a13;
LABEL_44:
  v48 = 0;
LABEL_45:
  if ((a7 & 1) != 0)
    v91 = a14;
  else
    v91 = 0.0;
  if ((a7 & 1) != 0)
    v92 = a15;
  else
    v92 = 0.0;
  if ((a7 & 1) == 0)
  {
    a16 = v55;
    a17 = a12;
  }
  v93 = 0;
  v94 = v55;
  v95 = a12;
  v96 = a16;
  v97 = a17;
  result = (CGAffineTransform *)CGRectEqualToRect(*(CGRect *)&v48, *(CGRect *)&v91);
  if ((result & 1) == 0)
  {
    if (objc_msgSend(a8, "isEqualToString:", *MEMORY[0x1E0CF2B28]))
    {
      v99 = a16 / v55;
      v100 = a17 / a12;
    }
    else
    {
      v101 = objc_msgSend(a8, "isEqualToString:", *MEMORY[0x1E0CF2B38]);
      v102 = fmin(a16 / v55, a17 / a12);
      v100 = fmax(a16 / v55, a17 / a12);
      if (v101)
        v99 = v100;
      else
        v99 = v102;
      if (!v101)
        v100 = v102;
    }
    memset(&v143, 0, sizeof(v143));
    CGAffineTransformMakeScale(&v143, v99, v100);
    v103 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v103;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    t2 = v143;
    CGAffineTransformConcat(&v142, &t1, &t2);
    v104 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v104;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
    v142 = v143;
    v105 = 0;
    *(_QWORD *)&v104 = 0;
    v106 = v55;
    v107 = a12;
    v145 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v104 - 8), &v142);
    CGAffineTransformMakeTranslation(&v116, (a16 - v145.size.width) * 0.5, (a17 - v145.size.height) * 0.5);
    v108 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v108;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    result = CGAffineTransformConcat(&v142, &t1, &v116);
    v109 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v109;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
  }
  if (a18 && a19)
  {
    CGAffineTransformMakeScale(&v115, -1.0, 1.0);
    v110 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v110;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v115);
    v111 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v111;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v114, a16, 0.0);
    v112 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v112;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    result = CGAffineTransformConcat(&v143, &v142, &v114);
    v113 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v113;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
  }
  if (a6)
    *a6 = v54;
  return result;
}

void sub_19EE270F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

float AVGestaltGetFloatAnswerWithDefault(uint64_t a1, float a2)
{
  void *v4;
  float result;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = (void *)objc_msgSend((id)sAVGestaltFloatDataBase, "objectForKeyedSubscript:", a1);
  if (!v4)
    return a2;
  objc_msgSend(v4, "floatValue");
  return result;
}

void *avcmdo_allMetadataObjectTypesInCollections(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "unionSet:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "metadataObjectTypes"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

void sub_19EE275A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19EE27A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_19EE285C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double ps_CGSizeForSettingsDictionary(void *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  int v5;

  if (!a1)
    return *MEMORY[0x1E0C9D820];
  if (objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]))
  {
    v2 = (_QWORD *)MEMORY[0x1E0CA8FD8];
    v3 = (_QWORD *)MEMORY[0x1E0CA90E0];
  }
  else
  {
    if (!objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]))
      return *MEMORY[0x1E0C9D820];
    v2 = (_QWORD *)MEMORY[0x1E0CF2CB8];
    v3 = (_QWORD *)MEMORY[0x1E0CF2D08];
  }
  v4 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", *v3), "intValue");
  v5 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", *v2), "intValue");
  if (v4 >= 1 && v5 >= 1)
    return (double)v4;
  return *MEMORY[0x1E0C9D820];
}

BOOL po_photoSettingsAreValid(void *a1, uint64_t a2, _QWORD *a3, void *a4, const __CFString **a5)
{
  NSObject *v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  char v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  void *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void *v74;
  float v75;
  float v76;
  double v77;
  const __CFString *v79;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD block[10];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  CMTime v113;
  CMTime v114;
  CMTime v115;
  CMTime v116;
  CMTime time2;
  CMTime time1;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  if (!a3)
  {
    if (a1)
      goto LABEL_7;
LABEL_271:
    v22 = CFSTR("Nil settings");
    goto LABEL_268;
  }
  if (!a1)
    goto LABEL_271;
  if (a3[2])
  {
    v83 = a3[2];
    if (objc_msgSend(a1, "uniqueID") <= *(_QWORD *)(v83 + 16))
    {
      v22 = CFSTR("Settings may not be re-used");
      goto LABEL_268;
    }
    v7 = *(NSObject **)(v83 + 264);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __po_photoSettingsAreValid_block_invoke;
    block[3] = &unk_1E421D668;
    block[4] = v83;
    block[5] = a1;
    block[6] = &v105;
    block[7] = &v101;
    block[8] = &v97;
    block[9] = &v93;
    dispatch_sync(v7, block);
    v8 = 1;
    goto LABEL_8;
  }
LABEL_7:
  v8 = 0;
  v83 = 0;
LABEL_8:
  v9 = objc_msgSend(a1, "processedFileType");
  v10 = v8 ^ 1;
  if (!v9)
    v10 = 1;
  if ((v10 & 1) == 0
    && !objc_msgSend(*(id *)(v83 + 48), "containsObject:", objc_msgSend(a1, "processedFileType")))
  {
    v22 = CFSTR("settings.processedFileType must be present in self.availablePhotoFileTypes");
    goto LABEL_268;
  }
  v11 = objc_msgSend(a1, "rawFileType");
  v12 = v8 ^ 1;
  if (!v11)
    v12 = 1;
  if ((v12 & 1) == 0
    && !objc_msgSend(*(id *)(v83 + 56), "containsObject:", objc_msgSend(a1, "rawFileType")))
  {
    v22 = CFSTR("settings.rawFileType must be present in self.availableRawPhotoFileTypes");
    goto LABEL_268;
  }
  if (objc_msgSend(a1, "rawPhotoPixelFormatType"))
  {
    if (v8)
    {
      if (!objc_msgSend(*(id *)(v83 + 40), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "rawPhotoPixelFormatType"))))
      {
        v22 = CFSTR("settings.rawPhotoPixelFormatType must be present in self.availableRawPhotoPixelFormatTypes");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "rawFileType"))
      {
        v13 = (void *)objc_msgSend(a3, "supportedRawPhotoPixelFormatTypesForFileType:", objc_msgSend(a1, "rawFileType"));
        if (!objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "rawPhotoPixelFormatType"))))
        {
          v22 = CFSTR("settings.rawPhotoPixelFormatType must be present in [self supportedRawPhotoPixelFormatTypesForFileType:settings.rawFileType]");
          goto LABEL_268;
        }
      }
      if ((objc_msgSend(a1, "isConstantColorEnabled") & 1) != 0)
      {
        v22 = CFSTR("When capturing a raw photo, settings.constantColorEnabled must be set to NO");
        goto LABEL_268;
      }
    }
    if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", objc_msgSend(a1, "rawPhotoPixelFormatType")))
    {
      if (objc_msgSend(a1, "HDRMode"))
      {
        v22 = CFSTR("When specifying Bayer raw capture, settings.HDRMode must be set to AVCaptureHDRModeOff");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "photoQualityPrioritization") != 1)
      {
        v22 = CFSTR("When specifying Bayer raw capture, settings.photoQualityPrioritization must be set to AVCapturePhotoQualityPrioritizationSpeed");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "digitalFlashMode"))
      {
        v22 = CFSTR("When specifying Bayer raw capture, settings.digitalFlashMode must be set to AVCaptureDigitalFlashModeOff");
        goto LABEL_268;
      }
      if (a4)
      {
        objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "videoZoomFactor");
        if (v14 != 1.0)
        {
          v22 = CFSTR("When specifying Bayer raw capture, the videoZoomFactor of the video device must be set to 1.0");
          goto LABEL_268;
        }
        objc_msgSend(a4, "videoScaleAndCropFactor");
        if (v15 != 1.0)
        {
          v22 = CFSTR("When specifying Bayer raw capture, the videoScaleAndCropFactor of the photo output's video connection must be set to 1.0");
          goto LABEL_268;
        }
      }
      if ((objc_msgSend(a1, "isAutoVirtualDeviceFusionEnabled") & 1) != 0)
      {
        v22 = CFSTR("When specifying Bayer raw capture, settings.autoVirtualDeviceFusionEnabled must be set to NO");
        goto LABEL_268;
      }
    }
    if (a2 && (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v22 = CFSTR("If you specify a non-nil raw pixel format type in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: or the deprecated captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:");
      goto LABEL_268;
    }
  }
  if (objc_msgSend(a1, "format"))
  {
    v16 = (void *)objc_msgSend(a1, "format");
    v17 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    v18 = (void *)objc_msgSend(a1, "format");
    v19 = objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
    v20 = v8 ^ 1;
    if (v17)
      v21 = v8 ^ 1;
    else
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v23 = v19;
      if (!v19)
        v20 = 1;
      if ((v20 & 1) == 0)
      {
        if (!objc_msgSend(*(id *)(v83 + 32), "containsObject:", v19))
        {
          v22 = CFSTR("The AVVideoCodecKey format must be present in self.availablePhotoCodecTypes");
          goto LABEL_268;
        }
        if (objc_msgSend(a1, "processedFileType")
          && !objc_msgSend((id)objc_msgSend(a3, "supportedPhotoCodecTypesForFileType:", objc_msgSend(a1, "processedFileType")), "containsObject:", v23))
        {
          v22 = CFSTR("The AVVideoCodecKey format must be present in [self supportedPhotoCodecTypesForFileType:settings.processedFileType]");
          goto LABEL_268;
        }
      }
    }
    else
    {
      if ((objc_msgSend(*(id *)(v83 + 24), "containsObject:", v17) & 1) == 0)
      {
        v22 = CFSTR("The CVPixelBufferPixelFormatTypeKey format must be present in self.availablePhotoPixelFormatTypes");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "processedFileType")
        && (objc_msgSend((id)objc_msgSend(a3, "supportedPhotoPixelFormatTypesForFileType:", objc_msgSend(a1, "processedFileType")), "containsObject:", v17) & 1) == 0)
      {
        v22 = CFSTR("The CVPixelBufferFormatTypeKey format must be present in [self supportedPhotoPixelFormatTypesForFileType:settings.processedFileType]");
        goto LABEL_268;
      }
    }
    if (a2)
    {
      v24 = (void *)objc_msgSend(a1, "processedFileType");
      if (objc_msgSend(v24, "isEqual:", *MEMORY[0x1E0CF2AE8])
        || (v25 = (void *)objc_msgSend(a1, "processedFileType"),
            objc_msgSend(v25, "isEqual:", *MEMORY[0x1E0CF2AF0])))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v22 = CFSTR("In order to capture HEIF containerized photos, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:");
          goto LABEL_268;
        }
      }
      if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("If you specify a non-nil format dictionary in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:, or the deprecated captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:");
        goto LABEL_268;
      }
    }
  }
  if (v8 && !*((_BYTE *)v102 + 24))
  {
    v22 = CFSTR("HDRMode must be set to a value present in the supportedHDRModes array");
    goto LABEL_268;
  }
  if ((v8 & objc_msgSend(a1, "photoQualityPrioritizationIsSetByClient")) == 1)
  {
    v26 = *(_QWORD *)(v83 + 80);
    if (v26 < objc_msgSend(a1, "photoQualityPrioritization"))
    {
      v22 = CFSTR("settings.photoQualityPrioritization must not be higher than self.maxPhotoQualityPrioritization");
      goto LABEL_268;
    }
  }
  if (objc_msgSend(a1, "isEV0PhotoDeliveryEnabled"))
  {
    if (v8 && !*((_BYTE *)v98 + 24))
    {
      v22 = CFSTR("EV0PhotoDeliveryEnabled must not be set to YES when EV0PhotoDeliverySupported is NO");
      goto LABEL_268;
    }
    if (!objc_msgSend(a1, "HDRMode"))
    {
      v22 = CFSTR("EV0PhotoDeliveryEnabled must be set to NO if HDRMode is AVCaptureHDRModeOff");
      goto LABEL_268;
    }
    if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v22 = CFSTR("If you specify EV0PhotoDeliveryEnabled=YES in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:");
      goto LABEL_268;
    }
  }
  if (v8 && !*((_BYTE *)v106 + 24))
  {
    v22 = CFSTR("flashMode must be set to a value present in the supportedFlashModes array");
    goto LABEL_268;
  }
  if (objc_msgSend(a1, "digitalFlashMode"))
  {
    if (v8)
    {
      if (!*(_BYTE *)(v83 + 128))
      {
        v22 = CFSTR("digitalFlashMode must be AVCaptureDigitalFlashModeOff if self.digitalFlashCaptureEnabled is NO");
        goto LABEL_268;
      }
      if (!*((_BYTE *)v94 + 24))
      {
        v22 = CFSTR("digitalFlashMode must be set to a value present in the supportedDigitalFlashModes array");
        goto LABEL_268;
      }
    }
    if (objc_msgSend(a1, "digitalFlashMode"))
    {
      if (objc_msgSend(a1, "flashMode") == 1)
      {
        v22 = CFSTR("Flash mode must not be on when Digital Flash mode is min or max");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "HDRMode") == 1)
      {
        v22 = CFSTR("HDR mode must not be on when Digital Flash mode is min or max");
        goto LABEL_268;
      }
    }
    if (objc_msgSend(a1, "livePhotoMovieFileURL"))
    {
      v22 = CFSTR("digitalFlashMode must be AVCaptureDigitalFlashModeOff when livePhotoMovieFileURL is non-nil");
      goto LABEL_268;
    }
  }
  if (objc_msgSend(a1, "livePhotoMovieFileURL"))
  {
    if (v8 && !*(_BYTE *)(v83 + 146))
    {
      v22 = CFSTR("livePhotoMovieFileURL must be nil if self.livePhotoCaptureEnabled is NO");
      goto LABEL_268;
    }
    if (!objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURL"), "isFileURL"))
    {
      v22 = CFSTR("livePhotoMovieFileURL must be a file url");
      goto LABEL_268;
    }
    if (a2
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v22 = CFSTR("If you specify a non-nil livePhotoMovieFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:");
      goto LABEL_268;
    }
    if (objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto"))
    {
      if ((objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURL"), "isEqual:", objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto")) & 1) != 0)
      {
        v22 = CFSTR("livePhotoMovieFileURLForOriginalPhoto may not be the same as livePhotoMovieFileURL");
        goto LABEL_268;
      }
      if (!objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto"), "isFileURL"))
      {
        v22 = CFSTR("livePhotoMovieFileURLForOriginalPhoto must be a file url");
        goto LABEL_268;
      }
    }
    if (v8)
    {
      if (*(_BYTE *)(v83 + 216))
      {
        v22 = CFSTR("Live Photos may not be captured while livePhotoCaptureSuspended is YES");
        goto LABEL_268;
      }
      if ((objc_msgSend(*(id *)(v83 + 152), "containsObject:", objc_msgSend(a1, "livePhotoVideoCodecType")) & 1) == 0)
      {
        v22 = CFSTR("livePhotoVideoCodecType must be present in self.availableLivePhotoVideoCodecTypes");
        goto LABEL_268;
      }
    }
  }
  if (objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto") && !objc_msgSend(a1, "livePhotoMovieFileURL"))
  {
    v22 = CFSTR("If you specify a non-nil livePhotoMovieFileURLForOriginalPhoto, you must also provide a non-nil livePhotoMovieFileURL");
    goto LABEL_268;
  }
  if (objc_msgSend(a1, "isAutoSpatialOverCaptureEnabled"))
  {
    if (a4 && !objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "isSpatialOverCaptureEnabled"))
    {
      v22 = CFSTR("If you set autoSpatialOverCaptureEnabled to YES, the source device's spatialOverCaptureEnabled property must also be set to YES");
      goto LABEL_268;
    }
    v27 = objc_msgSend(a1, "livePhotoMovieFileURL");
    if ((v27 != 0) != (objc_msgSend(a1, "spatialOverCaptureLivePhotoMovieFileURL") != 0))
    {
      v22 = CFSTR("If you set autoSpatialOverCaptureEnabled to YES and specify a non-nil livePhotoMovieFileURL, you must also specify a non-nil spatialOverCaptureLivePhotoMovieFileURL");
      goto LABEL_268;
    }
    v28 = objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto");
    if ((v28 != 0) != (objc_msgSend(a1, "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto") != 0))
    {
      v22 = CFSTR("If you set autoSpatialOverCaptureEnabled to YES and specify a non-nil livePhotoMovieFileURLForOriginalPhoto, you must also specify a non-nil spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      goto LABEL_268;
    }
  }
  v29 = objc_msgSend(a1, "HEICSFileURL");
  if (a2 && v29 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v22 = CFSTR("If you specify a non-nil HEICSFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingPhotoFileAtURL:resolvedSettings:error:");
    goto LABEL_268;
  }
  v30 = objc_msgSend(a1, "videoFileURL");
  if (a2 && v30 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v22 = CFSTR("If you specify a non-nil videoFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingVideoFileAtURL:resolvedSettings:previewPixelBuffer:recordedDuration:error:");
    goto LABEL_268;
  }
  if (v8)
  {
    if (objc_msgSend(a1, "isHighResolutionPhotoEnabled") && !*(_BYTE *)(v83 + 130))
    {
      v22 = CFSTR("settings.highResolutionPhotoEnabled may not be YES unless self.highResolutionCaptureEnabled is YES");
      goto LABEL_268;
    }
    if (objc_msgSend(a1, "maxPhotoDimensions")
      || (unint64_t)objc_msgSend(a1, "maxPhotoDimensions") >> 32)
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat"), "validateMaxPhotoDimensions:privateDimensionsEnabled:", objc_msgSend(a1, "maxPhotoDimensions"), objc_msgSend(a3, "arePrivatePhotoDimensionsEnabled")) & 1) == 0)
      {
        v22 = CFSTR("If you specify a maxPhotoDimensions, it must match one of the supportedMaxPhotoDimensions of the video devices's active format");
        goto LABEL_268;
      }
      if (*(_DWORD *)(v83 + 512) < (int)objc_msgSend(a1, "maxPhotoDimensions")
        || *(_DWORD *)(v83 + 516) < (int)((unint64_t)objc_msgSend(a1, "maxPhotoDimensions") >> 32))
      {
        v22 = CFSTR("If you specify a non-nil maxPhotoDimensions, it must not be larger than the maxPhotoDimensions set on the AVCapturePhotoOutput");
        goto LABEL_268;
      }
    }
  }
  if (objc_msgSend(a1, "livePhotoMovieFileURL"))
  {
    if ((objc_msgSend(a1, "isSquareCropEnabled") & 1) != 0)
    {
      v22 = CFSTR("Square crop must be NO when livePhotoMovieFileURL is non-nil");
      goto LABEL_268;
    }
  }
  else if (objc_msgSend(a1, "flashMode") == 1 && objc_msgSend(a1, "HDRMode") == 1)
  {
    v22 = CFSTR("HDR mode must not be on when flash mode is on");
    goto LABEL_268;
  }
  if (objc_msgSend(a1, "shutterSound") != 1108
    && (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementShutterSoundManipulation) & 1) == 0)
  {
    v31 = (void *)objc_msgSend((id)objc_msgSend(a3, "session"), "inputs");
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v124, 16);
    if (!v32)
    {
LABEL_126:
      v22 = CFSTR("You are not authorized to use custom shutter sounds");
      goto LABEL_268;
    }
    v33 = *(_QWORD *)v89;
LABEL_118:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v89 != v33)
        objc_enumerationMutation(v31);
      v35 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "device"), "deviceType"), "isEqual:", CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"))&& objc_msgSend((id)objc_msgSend(v35, "device"), "timeOfFlightProjectorMode") == 6)
      {
        break;
      }
      if (v32 == ++v34)
      {
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v124, 16);
        if (!v32)
          goto LABEL_126;
        goto LABEL_118;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_126;
  }
  v36 = objc_msgSend(a1, "isShutterSoundSuppressionEnabled");
  if (sIsForcedShutterSoundRegion)
    v37 = v36;
  else
    v37 = 0;
  if ((v37 & 1) != 0)
  {
    v22 = CFSTR("settings.shutterSoundSuppressionEnabled may not be set to YES unless self.shutterSoundSuppressionSupported is YES");
    goto LABEL_268;
  }
  if ((v8 & objc_msgSend(a1, "isProcessedPhotoZoomWithoutUpscalingEnabled")) == 1
    && !*(_BYTE *)(v83 + 434))
  {
    v22 = CFSTR("settings.processedPhotoZoomWithoutUpscalingEnabled may not be set to YES unless self.processedPhotoZoomWithoutUpscalingSupported is YES");
    goto LABEL_268;
  }
  if ((v8 & objc_msgSend(a1, "isAutoContentAwareDistortionCorrectionEnabled")) == 1
    && !*(_BYTE *)(v83 + 438))
  {
    v22 = CFSTR("settings.autoContentAwareDistortionCorrectionEnabled may not be set to YES unless self.contentAwareDistortionCorrectionEnabled is YES");
    goto LABEL_268;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_182;
  if (v83)
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "bracketedSettings"), "count") > *(_QWORD *)(v83 + 136))
    {
      v22 = CFSTR("bracketedSettings array exceeds -maxBracketedCapturePhotoCount");
      goto LABEL_268;
    }
    if (objc_msgSend(a1, "isLensStabilizationEnabled") && !*(_BYTE *)(v83 + 144))
    {
      v22 = CFSTR("settings.lensStabilizationEnabled may only be set to YES if self.lensStabilizationDuringBracketedCaptureSupported is YES");
      goto LABEL_268;
    }
  }
  if (!a4)
    goto LABEL_182;
  v38 = (void *)objc_msgSend(a4, "sourceDevice");
  v39 = (void *)objc_msgSend(v38, "activeFormat");
  v40 = (void *)objc_msgSend(a1, "bracketedSettings");
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = objc_opt_class();
  if (v41 != objc_opt_class())
  {
    if (v41 == objc_opt_class())
    {
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v110;
        while (2)
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v110 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
            objc_msgSend(v45, "exposureTargetBias");
            if (v46 != 3.4028e38)
            {
              objc_msgSend(v45, "exposureTargetBias");
              v48 = v47;
              objc_msgSend(v38, "minExposureTargetBias");
              if (v48 < v49)
              {
                v79 = CFSTR("%@ contains an out of range exposure target bias. Use AVCaptureDevice -minExposureTargetBias");
                goto LABEL_267;
              }
              objc_msgSend(v45, "exposureTargetBias");
              v51 = v50;
              objc_msgSend(v38, "maxExposureTargetBias");
              if (v51 > v52)
              {
                v79 = CFSTR("%@ contains an out of range exposure target bias. Use AVCaptureDevice -maxExposureTargetBias");
                goto LABEL_267;
              }
            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
          if (v42)
            continue;
          break;
        }
      }
    }
    goto LABEL_182;
  }
  if (!objc_msgSend(v38, "isExposureModeSupported:", 3))
  {
    v22 = CFSTR("Source device does not support manual exposure bracketed capture. Use AVCaptureDevice -isExposureModeSupported: with AVCaptureExposureModeCustom");
    goto LABEL_268;
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v53 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
  if (!v53)
    goto LABEL_182;
  v54 = *(_QWORD *)v120;
  while (2)
  {
    for (j = 0; j != v53; ++j)
    {
      if (*(_QWORD *)v120 != v54)
        objc_enumerationMutation(v40);
      v45 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
      objc_msgSend(v45, "ISO");
      if (v56 != 3.4028e38)
      {
        objc_msgSend(v45, "ISO");
        v58 = v57;
        objc_msgSend(v39, "minISO");
        if (v58 < v59)
        {
          v79 = CFSTR("%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -minISO");
          goto LABEL_267;
        }
        objc_msgSend(v45, "ISO");
        v61 = v60;
        objc_msgSend(v39, "maxISO");
        if (v61 > v62)
        {
          v79 = CFSTR("%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -maxISO");
          goto LABEL_267;
        }
      }
      if (v45)
        objc_msgSend(v45, "exposureDuration");
      else
        memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2))
      {
        if (v45)
        {
          objc_msgSend(v45, "exposureDuration");
          if (v39)
            goto LABEL_170;
LABEL_172:
          memset(&v115, 0, sizeof(v115));
        }
        else
        {
          memset(&v116, 0, sizeof(v116));
          if (!v39)
            goto LABEL_172;
LABEL_170:
          objc_msgSend(v39, "minExposureDuration");
        }
        if (CMTimeCompare(&v116, &v115) < 0)
        {
          v79 = CFSTR("%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -minExposureDuration");
        }
        else
        {
          if (v45)
          {
            objc_msgSend(v45, "exposureDuration");
            if (v39)
              goto LABEL_176;
LABEL_178:
            memset(&v113, 0, sizeof(v113));
          }
          else
          {
            memset(&v114, 0, sizeof(v114));
            if (!v39)
              goto LABEL_178;
LABEL_176:
            objc_msgSend(v39, "maxExposureDuration");
          }
          if (CMTimeCompare(&v114, &v113) <= 0)
            continue;
          v79 = CFSTR("%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -maxExposureDuration");
        }
LABEL_267:
        v22 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v79, v45);
        goto LABEL_268;
      }
    }
    v53 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
    if (v53)
      continue;
    break;
  }
LABEL_182:
  if (objc_msgSend(a1, "isDepthDataDeliveryEnabled"))
  {
    if (v8 && !*(_BYTE *)(v83 + 219))
    {
      v22 = CFSTR("settings.depthDataDeliveryEnabled must be NO if self.isDepthDataDeliveryEnabled is NO");
    }
    else
    {
      if (!a2 || (objc_opt_respondsToSelector() & 1) != 0)
        goto LABEL_187;
      v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set depthDataDeliveryEnabled to YES");
    }
LABEL_268:
    if (a5 && v22)
      *a5 = v22;
  }
  else
  {
LABEL_187:
    if (objc_msgSend(a1, "isPortraitEffectsMatteDeliveryEnabled"))
    {
      if (v8)
      {
        if (!*(_BYTE *)(v83 + 221))
        {
          v22 = CFSTR("settings.portraitEffectsMatteDeliveryEnabled must be NO if self.isPortraitEffectsMatteDeliveryEnabled is NO");
          goto LABEL_268;
        }
        if (!*(_BYTE *)(v83 + 219))
        {
          v22 = CFSTR("settings.depthDataDeliveryEnabled must be YES if settings.portraitEffectsMatteDeliveryEnabled is YES");
          goto LABEL_268;
        }
      }
      if (objc_msgSend(a1, "embedsPortraitEffectsMatteInPhoto")
        && !objc_msgSend(a1, "embedsDepthDataInPhoto"))
      {
        v22 = CFSTR("If settings.embedsPortraitEffectsMatteInPhoto is set to YES, settings.embedsDepthDataInPhoto must also be set to YES.");
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set portraitEffectsMatteDeliveryEnabled to YES");
        goto LABEL_268;
      }
    }
    if (objc_msgSend((id)objc_msgSend(a1, "enabledSemanticSegmentationMatteTypes"), "count"))
    {
      if (v8)
      {
        v63 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a1, "enabledSemanticSegmentationMatteTypes"));
        objc_msgSend(v63, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v83 + 232)));
        if (objc_msgSend(v63, "count"))
        {
          v22 = CFSTR("You may not set enabledSemanticSegmentationMatteTypes in your AVCapturePhotoSettings that are not present in your AVCapturePhotoOutput.enabledSemanticSegmentationMatteTypes");
          goto LABEL_268;
        }
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set enabledSemanticSegmentationMatteTypes");
        goto LABEL_268;
      }
    }
    v64 = objc_msgSend((id)objc_msgSend(a1, "photoFilters"), "count");
    v65 = v8 ^ 1;
    if (!v64)
      v65 = 1;
    if ((v65 & 1) == 0 && !*(_BYTE *)(v83 + 240))
    {
      v22 = CFSTR("settings.photoFilters must be empty if self.isFilterRenderingEnabled is NO");
      goto LABEL_268;
    }
    v66 = objc_msgSend((id)objc_msgSend(a1, "adjustedPhotoFilters"), "count");
    v67 = v8 ^ 1;
    if (!v66)
      v67 = 1;
    if ((v67 & 1) == 0 && !*(_BYTE *)(v83 + 240))
    {
      v22 = CFSTR("settings.adjustedPhotoFilters must be empty if self.isFilterRenderingEnabled is NO");
      goto LABEL_268;
    }
    if (objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count"))
    {
      if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count") < 2)
      {
        v22 = CFSTR("settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices must have 2 or more AVCaptureDevices");
        goto LABEL_268;
      }
      if (v8 && !*(_BYTE *)(v83 + 92))
      {
        v22 = CFSTR("settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may not be set to a non-empty array unless self.virtualDeviceConstituentPhotoDeliveryEnabled is YES");
        goto LABEL_268;
      }
      if (a4)
      {
        if (!objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "isVirtualDevice"))
        {
          v22 = CFSTR("settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may not be set to a non-empty array unless your photo output is not connected to a virtual device");
          goto LABEL_268;
        }
        v68 = (void *)objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "constituentDevices");
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v69 = (void *)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices");
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v84, v123, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v85;
          v22 = CFSTR("settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may only include devices present in the source virtual device's constituentDevices array");
LABEL_216:
          v72 = 0;
          while (1)
          {
            if (*(_QWORD *)v85 != v71)
              objc_enumerationMutation(v69);
            if ((objc_msgSend(v68, "containsObject:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v72)) & 1) == 0)
              goto LABEL_268;
            if (v70 == ++v72)
            {
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v84, v123, 16);
              if (v70)
                goto LABEL_216;
              break;
            }
          }
        }
      }
      if ((AVCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(a1, "adjustedPhotoFilters")) & 1) != 0)
      {
        v22 = CFSTR("settings.adjustedPhotoFilters must not contain any portrait filters if settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices is a non-empty array");
        goto LABEL_268;
      }
      if ((objc_msgSend(a1, "isConstantColorEnabled") & 1) != 0)
      {
        v22 = CFSTR("settings.constantColorEnabled must be NO if settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices is a non-empty array");
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices to a non-empty array");
        goto LABEL_268;
      }
    }
    if (objc_msgSend(a1, "isDualCameraDualPhotoDeliveryEnabled"))
    {
      if (v8 && !*(_BYTE *)(v83 + 94) && !*(_BYTE *)(v83 + 92))
      {
        v22 = CFSTR("settings.dualCameraDualPhotoDeliveryEnabled may not be set to YES unless self.dualCameraDualPhotoDeliveryEnabled is YES");
        goto LABEL_268;
      }
      if ((AVCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(a1, "adjustedPhotoFilters")) & 1) != 0)
      {
        v22 = CFSTR("settings.adjustedPhotoFilters must not contain any portrait filters if settings.dualCameraDualPhotoDeliveryEnabled is YES");
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set dualCameraDualPhotoDeliveryEnabled to YES");
        goto LABEL_268;
      }
    }
    if (objc_msgSend(a1, "isCameraCalibrationDataDeliveryEnabled"))
    {
      if (v8 && !objc_msgSend(a3, "isCameraCalibrationDataDeliverySupported"))
      {
        v22 = CFSTR("settings.cameraCalibrationDataDeliveryEnabled may not be set to YES unless self.cameraCalibrationDataDeliverySupported is YES");
        goto LABEL_268;
      }
      if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count") < 2)
      {
        v22 = CFSTR("settings.cameraCalibrationDataDeliveryEnabled may not be set to YES unless 2 or more AVCaptureDevices are added to settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices");
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set cameraCalibrationDataDeliveryEnabled to YES");
        goto LABEL_268;
      }
    }
    v73 = objc_msgSend(a3, "isAutoDeferredPhotoDeliveryEnabled") ^ 1;
    if (!a2)
      LOBYTE(v73) = 1;
    if ((v73 & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v22 = CFSTR("Your delegate must respond to the selector captureOutput:didFinishCapturingDeferredPhotoProxy:error: if you set AVCapturePhotoOutput.autoDeferredPhotoDeliveryEnabled to YES");
      goto LABEL_268;
    }
    if (objc_msgSend(a1, "isConstantColorEnabled"))
    {
      if (v8 && !*(_BYTE *)(v83 + 537))
      {
        v22 = CFSTR("settings.isConstantColorEnabled must be NO if self.isConstantColorEnabled is NO");
        goto LABEL_268;
      }
      if (objc_msgSend(a1, "flashMode") != 1 && objc_msgSend(a1, "flashMode") != 2)
      {
        v22 = CFSTR("settings.flashMode must be AVCaptureFlashModeOn or AVCaptureFlashModeAuto if settings.isConstantColorEnabled is YES");
        goto LABEL_268;
      }
    }
    if (objc_msgSend(a1, "isConstantColorFallbackPhotoDeliveryEnabled")
      && !objc_msgSend(a1, "isConstantColorEnabled"))
    {
      v22 = CFSTR("settings.isConstantColorEnabled must be YES if settings.isConstantColorFallbackPhotoDeliveryEnabled is YES");
      goto LABEL_268;
    }
    if (objc_msgSend(a1, "isAutoSpatialPhotoCaptureEnabled"))
    {
      if (v8)
      {
        if (!*(_BYTE *)(v83 + 541))
        {
          v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when self.spatialPhotoCaptureEnabled is NO");
          goto LABEL_268;
        }
        if (!*(_BYTE *)(v83 + 433))
        {
          v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when self.autoDeferredPhotoDeliveryEnabled is NO");
          goto LABEL_268;
        }
      }
      if (objc_msgSend(a1, "photoQualityPrioritization") != 3)
      {
        v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when settings.photoQualityPrioritization is not set to AVCapturePhotoQualityPrioritizationQuality");
        goto LABEL_268;
      }
      if (a4)
      {
        v74 = (void *)objc_msgSend(a4, "sourceDevice");
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v74, "constituentDevices"), "count") < 2)
        {
          v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when AVCaptureDevice.constituentDevices.count is less than 2");
          goto LABEL_268;
        }
        if ((__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v74, "constituentDevices"), "objectAtIndex:", 1), "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera"))
        {
          v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when AVCaptureDeviceTypeBuiltInWideAngleCamera is not second constituentDevice");
          goto LABEL_268;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "virtualDeviceSwitchOverVideoZoomFactors"), "firstObject"), "floatValue");
        v76 = v75;
        objc_msgSend(v74, "videoZoomFactor");
        if (v77 != v76)
        {
          v22 = CFSTR("settings.autoSpatialPhotoCaptureEnabled must not be set to YES when videoZoomFactor is not equal to Ultra Wide camera to Wide Angle camera switch over zoom factor : videoConnection.sourceDevice.virtualDeviceSwitchOverVideoZoomFactors.firstObject");
          goto LABEL_268;
        }
      }
    }
    v22 = 0;
  }
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  return v22 == 0;
}

void sub_19EE2BCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t po_figCaptureStillImageSettingsFileTypeForAVFileType(void *a1)
{
  uint64_t v2;

  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AF8]) & 1) != 0)
    return 1785096550;
  v2 = 1751476579;
  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AE8]) & 1) == 0)
  {
    if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AF0]) & 1) != 0)
    {
      return 1751476582;
    }
    else if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2B10]) & 1) != 0)
    {
      return 1953064550;
    }
    else if (objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AE0]))
    {
      return 1684956519;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void *po_deviceArrayToFigCaptureSourceDeviceTypesArray(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "figCaptureSourceDeviceType")));
      }
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

void sub_19EE2D10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t po_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

uint64_t AVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = 0;
  v6 = AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(a1, a2, &v9);
  v7 = v6;
  if (a3 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0);
    *a3 = AVErrorForClientProgrammingError();
  }
  return v7;
}

void sub_19EE2E33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void avcdpp_NotificationCallback(int a1, uint64_t a2, CFTypeRef cf, int a4, CFTypeRef a5)
{
  avcdpp_dispatchNotification(a2, cf, a5);
}

uint64_t __socvpl_figCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpatialNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_19EE2F1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE2F38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _registerAudioDevicesOnce()
{
  id v0;

  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  if (!sRegisteredAudioDevices)
  {
    if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
      v0 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    else
      v0 = (id)-[objc_class _devices](NSClassFromString(CFSTR("AVCaptureFigAudioDevice")), "_devices");
    sRegisteredAudioDevices = (uint64_t)v0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
}

void socvpl_figCaptureSessionNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFRunLoop *Main;
  uint64_t FigRunLoopMode;
  uint64_t v10;
  __CFRunLoop *v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a2, "session", MEMORY[0x1E0C809B0], 3221225472, __socvpl_figCaptureSessionNotification_block_invoke, &unk_1E4216898, a2, a3, a5), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    v10 = *MEMORY[0x1E0C9B270];
    v13[0] = FigRunLoopMode;
    v13[1] = v10;
    CFRunLoopPerformBlock(Main, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2), &v12);
    v11 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v11);
  }
  else
  {
    objc_msgSend(a2, "_handleSpatialNotification:payload:", a3, a5);
  }
}

void vpl_figCaptureSessionNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFRunLoop *Main;
  uint64_t FigRunLoopMode;
  uint64_t v10;
  __CFRunLoop *v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a2, "session", MEMORY[0x1E0C809B0], 3221225472, __vpl_figCaptureSessionNotification_block_invoke, &unk_1E4216898, a2, a3, a5), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    v10 = *MEMORY[0x1E0C9B270];
    v13[0] = FigRunLoopMode;
    v13[1] = v10;
    CFRunLoopPerformBlock(Main, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2), &v12);
    v11 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v11);
  }
  else
  {
    objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
  }
}

uint64_t AVCaptureGetFigRunLoopMode()
{
  return *MEMORY[0x1E0CA3680];
}

void di_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFRunLoop *Main;
  __CFRunLoop *v9;
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __di_notificationHandler_block_invoke;
  block[3] = &unk_1E4216898;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  if (objc_msgSend((id)objc_msgSend(a2, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
    v9 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v9);
  }
  else
  {
    objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
  }
}

void avcaptureFigCaptureSessionNotification(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  int v8;
  BOOL v9;
  __CFRunLoop *Main;
  uint64_t v11;
  __CFRunLoop *v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a2, "notifiesOnMainThread", MEMORY[0x1E0C809B0], 3221225472, __avcaptureFigCaptureSessionNotification_block_invoke, &unk_1E4216898, a2, a3, a5);
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04448]))
    v9 = 1;
  else
    v9 = v8 == 0;
  if (v9)
  {
    objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
  }
  else
  {
    Main = CFRunLoopGetMain();
    v11 = *MEMORY[0x1E0C9B270];
    v14[0] = *MEMORY[0x1E0CA3680];
    v14[1] = v11;
    CFRunLoopPerformBlock(Main, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2), &v13);
    v12 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v12);
  }
}

uint64_t __avcaptureFigCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_19EE313E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE31B38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE32230(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _registerServerConnectionDiedNotification()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v0, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D04AB8], 0, 0, &__block_literal_global_1087);
  JUMPOUT(0x1A1AF1070);
}

CFStringRef AVCaptureCopyClientCodeSigningIdentifier()
{
  if (AVCaptureCopyClientCodeSigningIdentifier_sOnceToken != -1)
    dispatch_once(&AVCaptureCopyClientCodeSigningIdentifier_sOnceToken, &__block_literal_global_4);
  if (AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier)
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier);
  else
    return 0;
}

void sub_19EE36AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double vpl_valueToRect(void *a1)
{
  __int128 v1;
  _OWORD v3[2];

  v1 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v3[0] = *MEMORY[0x1E0C9D648];
  v3[1] = v1;
  objc_msgSend(a1, "getValue:", v3);
  return *(double *)v3;
}

uint64_t vpl_rectToValue(double a1, double a2, double a3, double a4)
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

void sub_19EE38C20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19EE3A940(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE3AA58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE3AB68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL SettingsArePassthru(void *a1)
{
  return a1 && !objc_msgSend(a1, "count");
}

void sub_19EE3C780(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE3C8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t AVGestaltGetIntegerAnswer(uint64_t a1)
{
  void *v2;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v2 = (void *)objc_msgSend((id)sAVGestaltIntegerDataBase, "objectForKeyedSubscript:", a1);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

void sub_19EE3CEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE3D158(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19EE3E098(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x7F0], 8);
  _Unwind_Resume(a1);
}

void sub_19EE3E558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Block_object_dispose((const void *)(v32 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE3E6D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE3E978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE3EAE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE40510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE4088C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double AVCaptureMainScreenPixelSize()
{
  if (AVCaptureMainScreenPixelSize_onceToken != -1)
    dispatch_once(&AVCaptureMainScreenPixelSize_onceToken, &__block_literal_global_256);
  return *(float *)&AVCaptureMainScreenPixelSize_width;
}

void sub_19EE41520(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EE41948(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE41E08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE421F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE42544(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVGestaltGetStringAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  result = objc_msgSend((id)sAVGestaltStringDataBase, "objectForKeyedSubscript:", a1);
  if (!result)
    return a2;
  return result;
}

void sub_19EE42FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE4358C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE437A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE4399C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  result = objc_msgSend(v0, "isEqualToString:", 0x1E4220D28);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(v0, "isEqualToString:", 0x1E4221D68);
    if ((result & 1) == 0)
      return objc_msgSend(v0, "isEqualToString:", 0x1E4221D88);
  }
  return result;
}

void sub_19EE43E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE44460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t AVCIFilterArrayContainsPortraitFilters(void *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(a1);
        NSClassFromString(CFSTR("CIDepthEffect"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(CFSTR("CIPortraitEffect"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        return 1;
      }
      v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      result = 0;
      if (v3)
        continue;
      break;
    }
  }
  return result;
}

void avcdpp_dispatchNotification(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  __CFRunLoop *Main;
  __CFRunLoop *v5;
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __avcdpp_dispatchNotification_block_invoke;
  block[3] = &unk_1E4216628;
  block[4] = a1;
  block[5] = cf;
  block[6] = a3;
  if (cf)
    CFRetain(cf);
  if (a3)
    CFRetain(a3);
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
  v5 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v5);
}

void sub_19EE45C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avflashlightNotification(uint64_t a1, void *a2, void *a3, uint64_t a4, const void *a5)
{
  _QWORD block[7];

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D053A0]))
  {
    objc_msgSend(a2, "_reconnectToServer");
  }
  else
  {
    if (a3)
      CFRetain(a3);
    if (a5)
      CFRetain(a5);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __avflashlightNotification_block_invoke;
    block[3] = &unk_1E4216628;
    block[4] = a2;
    block[5] = a3;
    block[6] = a5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void sub_19EE46164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE465B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void __avflashlightNotification_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  const void *v4;

  v2 = (void *)MEMORY[0x1A1AF16C4]();
  objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
  objc_autoreleasePoolPop(v2);
}

void sub_19EE47004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EE47308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EE477A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE48318(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE48ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_19EE48CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE49028(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EE49734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE49880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t vto_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t AVSmartStyleSettingsGetSystemStyle(uint64_t a1)
{
  return objc_msgSend(_AVSmartStyleSettingsStateForBundleID(a1), "systemStyle");
}

id _AVSmartStyleSettingsStateForBundleID(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (AVSmartStyleSettingsPrewarm_onceToken != -1)
    dispatch_once(&AVSmartStyleSettingsPrewarm_onceToken, &__block_literal_global_71);
  os_unfair_lock_lock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  v2 = objc_msgSend((id)sSmartStyleSettingsStatesByBundleID, "objectForKeyedSubscript:", a1);
  if (v2)
  {
    v3 = (id)v2;
    os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  }
  else
  {
    v3 = +[AVSmartStyleSettingsState smartStyleSettingsStateForBundleID:](AVSmartStyleSettingsState, "smartStyleSettingsStateForBundleID:", a1);
    objc_msgSend((id)sSmartStyleSettingsStatesByBundleID, "setObject:forKeyedSubscript:", v3, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
    if (v3)
      objc_msgSend(v3, "installProprietaryDefaultListeners");
  }
  return v3;
}

uint64_t AVSmartStyleSettingsSetSystemStyle(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(_AVSmartStyleSettingsStateForBundleID(a2), "setSystemStyle:", a1);
}

AVCaptureSmartStyle *AVSmartStyleSettingsGetSystemStyleFast(void *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  AVCaptureSmartStyle *v15;

  v1 = (const __CFString *)AVSmartStyleSettingsSystemStylePreferenceKey(a1);
  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v4 = (void *)CFPreferencesCopyValue(v1, CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if ((v4
     || (v5 = (const __CFString *)AVSmartStyleSettingsSystemStylePreferenceKey(AVSmartStyleSettingsSystemStyle),
         (v4 = (void *)CFPreferencesCopyValue(v5, CFSTR("com.apple.cameracapture"), v2, v3)) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsCastTypeKey);
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
    v8 = v7;
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
    v10 = v9;
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
    LODWORD(v12) = v11;
    LODWORD(v13) = v8;
    LODWORD(v14) = v10;
    v15 = +[AVCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](AVCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v6, v13, v14, v12);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t AVSmartStyleSettingsGetSystemStyleEnabledForBundleID(uint64_t a1)
{
  return objc_msgSend(_AVSmartStyleSettingsStateForBundleID(a1), "systemStyleEnabled");
}

uint64_t AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(_AVSmartStyleSettingsStateForBundleID(a2), "setSystemStyleEnabled:", a1);
}

id AVSmartStyleSettingsGetSystemStyleEnabledStateForCameraApps()
{
  if (AVSmartStyleSettingsPrewarm_onceToken != -1)
    dispatch_once(&AVSmartStyleSettingsPrewarm_onceToken, &__block_literal_global_71);
  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVSmartStyleSettingsSystemStyleEnabledPreferenceKey());
}

uint64_t AVSmartStyleSettingsGetSystemStyleSupportedForBundleID()
{
  return 1;
}

uint64_t avcp_copyFirstAuxiliaryImageOfType()
{
  uint64_t Container;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  Container = CMPhotoDecompressionSessionCreate();
  if ((_DWORD)Container)
    return Container;
  Container = CMPhotoDecompressionSessionCreateContainer();
  if ((_DWORD)Container)
    return Container;
  else
    return CMPhotoDecompressionContainerGetImageCount();
}

uint64_t avcp_copyDNGFileDataRepresentationForSushiRawBuffer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  unint64_t v7;
  uint64_t v8;
  const void *v9;

  if (a1)
  {
    if (a2 && a5)
    {
      v7 = HIDWORD(a6);
      if ((int)a6 > SHIDWORD(a6))
        LODWORD(v7) = a6;
      if ((_DWORD)v7)
        v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (int)v7);
      else
        v8 = 0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", &unk_1E424CA80, *MEMORY[0x1E0D09378], v8, *MEMORY[0x1E0D093E0], 0);
      CMPhotoCompressionCreateDataContainerFromImage();
    }
    if (a4)
    {
      objc_msgSend(a4, "depthDataMap");
      v9 = (const void *)objc_msgSend(a4, "copyAuxiliaryMetadata");
      objc_msgSend(a4, "auxiliaryImageType");
    }
    else
    {
      v9 = 0;
    }
    CMPhotoDNGCreateDNGFromRAWPixelBufferAndAuxiliaryImage();

    if (v9)
      CFRelease(v9);
  }
  return 0;
}

__CVBuffer *avcp_copyCGImageForUncompressedBuffer(__CVBuffer *result)
{
  CGImageRef v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (result)
  {
    v2 = *MEMORY[0x1E0CECE98];
    v3[0] = MEMORY[0x1E0C9AAB0];
    VTCreateCGImageFromCVPixelBuffer(result, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1), &v1);
    return v1;
  }
  return result;
}

CFMutableDataRef avcp_copyTIFFFileDataRepresentationForImage(CGImage *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFMutableDataRef Mutable;
  uint64_t v7;
  _BOOL4 v8;
  const __CFDictionary *v9;
  CGImageDestination *v10;
  CGImageDestination *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!a1)
  {
    v11 = 0;
LABEL_8:
    if (Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    goto LABEL_10;
  }
  if (a3)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = MEMORY[0x1E0C9AAA0];
  v13 = *MEMORY[0x1E0CBC768];
  v14[0] = v7;
  v8 = 1;
  v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CF2B10], 1uLL, v9);
  v11 = v10;
  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, a2);
    v8 = !CGImageDestinationFinalize(v11);
  }
  if (v8)
    goto LABEL_8;
LABEL_10:
  if (v11)
    CFRelease(v11);
  return Mutable;
}

uint64_t _addAuxiliaryImage(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v10;
  void *v11;
  uint64_t result;

  if ((a1 != 0) != (a2 == 0))
  {
LABEL_14:
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  if (a1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = v10;
    if (a7)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", a7, *MEMORY[0x1E0D09360]);
    if (a4 == 4)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0D09358]);
    result = CMPhotoCompressionSessionAddAuxiliaryImage();
    if ((_DWORD)result)
      goto LABEL_14;
  }
  else
  {
    if (a7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    result = CMPhotoDNGCompressorAddAuxiliaryImage();
    if ((_DWORD)result)
      goto LABEL_14;
  }
  return result;
}

uint64_t esdds_handleStorageDeviceManagerCallback(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t k;
  uint64_t v9;
  AVExternalStorageDevice *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t m;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t n;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  os_log_type_t type;
  unsigned int v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  int v76;
  const char *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;
  _QWORD v86[19];

  v86[16] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](*(_QWORD *)(a3 + 8));
  if (dword_1EE53AAC8)
  {
    v70 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(*(id *)(a3 + 40), "count", v40, v41))
  {
    if (objc_msgSend(*(id *)(a3 + 32), "count"))
    {
      v27 = (id)objc_msgSend(*(id *)(a3 + 32), "copy");
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v42 = v27;
      v44 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      if (v44)
      {
        v43 = *(_QWORD *)v66;
        v48 = *MEMORY[0x1E0D05318];
        v28 = *MEMORY[0x1E0C9AE00];
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v66 != v43)
              objc_enumerationMutation(v42);
            v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v31 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
            if (!v31)
              goto LABEL_59;
            v32 = v31;
            v33 = 0;
            v34 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v62 != v34)
                  objc_enumerationMutation(a1);
                v36 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
                objc_msgSend(v30, "baseURL");
                v86[0] = 0;
                v37 = *(_QWORD *)(a3 + 24);
                v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 32);
                if (v38)
                  v38(v37, v36, v48, v28, v86);
                if (FigCFEqual())
                {
                  objc_msgSend(v30, "updateExternalStorageDeviceManager:andFigExternalStorageDeviceUUID:", *(_QWORD *)(a3 + 24), v36);
                  objc_msgSend(*(id *)(a3 + 40), "addObject:", v36);
                  v33 = 1;
                }
              }
              v32 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
            }
            while (v32);
            if ((v33 & 1) == 0)
            {
LABEL_59:
              objc_msgSend((id)a3, "willChangeValueForKey:", CFSTR("externalStorageDevices"));
              objc_msgSend(*(id *)(a3 + 32), "removeObject:", v30);
              objc_msgSend((id)a3, "didChangeValueForKey:", CFSTR("externalStorageDevices"));
            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        }
        while (v44);
      }
    }
  }
  if (objc_msgSend(a1, "count") || objc_msgSend(*(id *)(a3 + 40), "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v6; ++k)
        {
          if (*(_QWORD *)v58 != v7)
            objc_enumerationMutation(a1);
          v9 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
          if ((objc_msgSend(*(id *)(a3 + 40), "containsObject:", v9) & 1) == 0)
          {
            v10 = -[AVExternalStorageDevice initWithExternalStorageDeviceManager:figExternalStorageDeviceUUID:]([AVExternalStorageDevice alloc], "initWithExternalStorageDeviceManager:figExternalStorageDeviceUUID:", *(_QWORD *)(a3 + 24), v9);
            -[AVExternalStorageDevice baseURL](v10, "baseURL");
            objc_msgSend((id)a3, "willChangeValueForKey:", CFSTR("externalStorageDevices"));
            objc_msgSend(*(id *)(a3 + 32), "addObject:", v10);
            objc_msgSend((id)a3, "didChangeValueForKey:", CFSTR("externalStorageDevices"));
            objc_msgSend(*(id *)(a3 + 40), "addObject:", v9);

          }
        }
        v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
      }
      while (v6);
    }
    v11 = (id)objc_msgSend(*(id *)(a3 + 40), "copy");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v45 = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    if (v12)
    {
      v13 = v12;
      v47 = *(_QWORD *)v54;
      do
      {
        for (m = 0; m != v13; ++m)
        {
          if (*(_QWORD *)v54 != v47)
            objc_enumerationMutation(v45);
          v15 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m);
          if ((objc_msgSend(a1, "containsObject:", v15) & 1) == 0)
          {
            if (objc_msgSend(*(id *)(a3 + 40), "containsObject:", v15))
              objc_msgSend(*(id *)(a3 + 40), "removeObject:", v15);
            v16 = (id)objc_msgSend(*(id *)(a3 + 32), "copy");
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v50;
              do
              {
                for (n = 0; n != v18; ++n)
                {
                  if (*(_QWORD *)v50 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * n);
                  if (objc_msgSend((id)objc_msgSend(v21, "figExternalStorageDeviceUUID"), "isEqual:", v15)&& objc_msgSend(*(id *)(a3 + 32), "containsObject:", v21))
                  {
                    objc_msgSend((id)a3, "willChangeValueForKey:", CFSTR("externalStorageDevices"));
                    objc_msgSend(*(id *)(a3 + 32), "removeObject:", v21);
                    objc_msgSend((id)a3, "didChangeValueForKey:", CFSTR("externalStorageDevices"));
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
              }
              while (v18);
            }
          }
        }
        v13 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
      }
      while (v13);
    }
  }
  if (dword_1EE53AAC8)
  {
    v70 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v23 = v70;
    if (os_log_type_enabled(v22, type))
      v24 = v23;
    else
      v24 = v23 & 0xFFFFFFFE;
    if (v24)
    {
      v25 = *(_QWORD *)(a3 + 32);
      v26 = *(_QWORD *)(a3 + 40);
      v76 = 136316162;
      v77 = "esdds_handleStorageDeviceManagerCallback";
      v78 = 2112;
      v79 = a3;
      v80 = 2112;
      v81 = v25;
      v82 = 2112;
      v83 = v26;
      v84 = 2112;
      v85 = a1;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return MEMORY[0x1A1AF12A4](*(_QWORD *)(a3 + 8));
}

uint64_t avExternalStorageDeviceNotification(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05310]);
  if ((_DWORD)result)
    return objc_msgSend(a2, "_reconnectToServer");
  return result;
}

uint64_t getUISSystemReferenceAngleChangedNotification()
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
  v0 = (void *)getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr;
  v6 = getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr;
  if (!getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)UIKitServicesLibrary();
    v0 = dlsym(v1, "UISSystemReferenceAngleChangedNotification");
    v4[3] = (uint64_t)v0;
    getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getUISSystemReferenceAngleChangedNotification_cold_1();
  return *(_QWORD *)v0;
}

void sub_19EE52218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getFBSOrientationObserverClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getFBSOrientationObserverClass_softClass;
  v8 = getFBSOrientationObserverClass_softClass;
  if (!getFBSOrientationObserverClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getFBSOrientationObserverClass_block_invoke;
    v2[3] = &unk_1E42165D0;
    v2[4] = &v3;
    __getFBSOrientationObserverClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19EE523D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE5288C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19EE52C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E42165F0;
    v3 = 0;
    UIKitServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitServicesLibraryCore_frameworkLibrary)
    UIKitServicesLibrary_cold_1(&v1);
  return UIKitServicesLibraryCore_frameworkLibrary;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getFBSOrientationObserverClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4216608;
    v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    __getFBSOrientationObserverClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FBSOrientationObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getFBSOrientationObserverClass_block_invoke_cold_2();
  getFBSOrientationObserverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void sub_19EE55A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void AVAUVoiceIOInitializeListenersForBundleID(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t IsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *context;
  __CFString *v13;
  _QWORD v14[5];
  os_log_type_t type;
  int v16;
  _QWORD v17[18];

  v17[16] = *MEMORY[0x1E0C80C00];
  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  context = (void *)MEMORY[0x1A1AF16C4]();
  v13 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sKeysBeingObservedLock);
  v17[0] = AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v13);
  IsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID = AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v13);
  v4 = 0;
  v17[1] = IsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID;
  v5 = 1;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    v7 = v5;
    v8 = v17[v4];
    if ((objc_msgSend((id)sKeysBeingObserved, "containsObject:", v8, v10, v11) & 1) == 0)
    {
      v10 = v8;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAUVoiceIOChatFlavorObservingKey-%@"));
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __AVAUVoiceIOInitializeListenersForBundleID_block_invoke;
      v14[3] = &unk_1E4216450;
      v14[4] = v13;
      +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", v9, v8, 1, v14);
      objc_msgSend((id)sKeysBeingObserved, "addObject:", v8);
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&sKeysBeingObservedLock);
  objc_autoreleasePoolPop(context);
}

uint64_t vpio_translatedBundleIDForBundleID(uint64_t a1)
{
  id v2;
  uint64_t v3;

  os_unfair_lock_lock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  v2 = (id)sBundleIDTranslationMap;
  if (!sBundleIDTranslationMap)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    sBundleIDTranslationMap = (uint64_t)v2;
  }
  v3 = objc_msgSend(v2, "objectForKeyedSubscript:", a1);
  if (!v3)
  {
    objc_msgSend((id)sBundleIDTranslationMap, "setObject:forKeyedSubscript:", a1, a1);
    v3 = a1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  return v3;
}

id AVAUVoiceIOGetSupportedChatFlavorsForBundleID(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v2 = (void *)MEMORY[0x1A1AF16C4]();
  v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  v4 = (void *)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(v3)), "copy");
  if (!v4)
  {
    v4 = (void *)objc_msgSend(AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(v3), "copy");
    if (!dword_1EE53AB08)
      goto LABEL_8;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1EE53AB08)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_8:
  objc_autoreleasePoolPop(v2);
  return v4;
}

void AVAUVoiceIOSetSupportedChatFlavorsForBundleID(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", a2, AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(v5));
  objc_autoreleasePoolPop(v4);
}

uint64_t AVAUVoiceIOGetPreferredChatFlavorForBundleID(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v2 = (void *)MEMORY[0x1A1AF16C4]();
  v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  v4 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3)), "intValue");
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_autoreleasePoolPop(v2);
  return v4;
}

void AVAUVoiceIOSetActiveChatFlavorForBundleID(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2, v7, v8), AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(v5));
  objc_autoreleasePoolPop(v4);
}

void AVAUVoiceIORemoveActiveChatFlavorForBundleID(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v2 = (void *)MEMORY[0x1A1AF16C4]();
  v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", 0, AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(v3));
  objc_autoreleasePoolPop(v2);
}

void AVAUVoiceIOSetHiddenChatFlavorsForBundleID(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", a2, AVControlCenterAudioHiddenMicrophoneModesPreferenceKeyForTranslatedBundleID(v5));
  objc_autoreleasePoolPop(v4);
}

void AVAUVoiceIOSetVoiceProcessingBypassedForBundleID(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a2, v7, v8), AVControlCenterAudioVoiceProcessingBypassedPreferenceKeyForTranslatedBundleID(v5));
  objc_autoreleasePoolPop(v4);
}

uint64_t AVAUVoiceIOIsAutoChatFlavorEnabledForBundleID(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  id v4;
  uint64_t IsAutoMicrophoneEnabledForBundleIDAndMicMode;
  id v6;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;

  if (vpio_initializeDefaultsOnce_onceToken != -1)
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  v2 = (void *)MEMORY[0x1A1AF16C4]();
  v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  v4 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v3));
  if (v4)
  {
    IsAutoMicrophoneEnabledForBundleIDAndMicMode = objc_msgSend(v4, "BOOLValue");
    goto LABEL_10;
  }
  v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3));
  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;
  IsAutoMicrophoneEnabledForBundleIDAndMicMode = AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode((uint64_t)v3, v7);
  if (dword_1EE53AB08)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_10:
    if (dword_1EE53AB08)
    {
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  objc_autoreleasePoolPop(v2);
  return IsAutoMicrophoneEnabledForBundleIDAndMicMode;
}

void __vpio_initializeDefaultsOnce_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x1A1AF16C4]();
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  sKeysBeingObserved = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_autoreleasePoolPop(v0);
}

uint64_t __vpio_bundleIDsForTranslatedBundleID_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

CGImageMetadataTag *AVAuxiliaryMetadataArrayTagWithPrefixedKey(const CGImageMetadata *a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  CGImageMetadataTag *v5;
  CGImageMetadataTag *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGImageMetadataTag *v12;
  CFTypeID v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), a2, a3);
  v5 = CGImageMetadataCopyTagWithPath(a1, 0, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_21;
  if (CGImageMetadataTagGetType(v5) != kCGImageMetadataTypeArrayOrdered)
  {
    CFRelease(v6);
    goto LABEL_20;
  }
  v7 = (void *)CGImageMetadataTagCopyValue(v6);
  CFRelease(v6);
  if (!v7)
  {
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
  v6 = (CGImageMetadataTag *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(CGImageMetadataTag **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if (v12)
        {
          v13 = CFGetTypeID(*(CFTypeRef *)(*((_QWORD *)&v16 + 1) + 8 * v11));
          if (v13 == CGImageMetadataTagGetTypeID() && CGImageMetadataTagGetType(v12) == kCGImageMetadataTypeString)
          {
            v14 = (void *)CGImageMetadataTagCopyValue(v12);
            -[CGImageMetadataTag addObject:](v6, "addObject:", v14);

          }
          else if (v13 == CFNumberGetTypeID() || v13 == CFBooleanGetTypeID())
          {
            -[CGImageMetadataTag addObject:](v6, "addObject:", v12);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  CFRelease(v7);
LABEL_21:

  return v6;
}

id AVAuxiliaryMetadataStringTagWithPrefixedKey(const CGImageMetadata *a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  CGImageMetadataTag *v5;
  CGImageMetadataTag *v6;
  void *v7;

  v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), a2, a3);
  v5 = CGImageMetadataCopyTagWithPath(a1, 0, v4);
  if (v5)
  {
    v6 = v5;
    if (CGImageMetadataTagGetType(v5) == kCGImageMetadataTypeString)
      v7 = (void *)CGImageMetadataTagCopyValue(v6);
    else
      v7 = 0;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL AVAuxiliaryMetadataAddValue(CGImageMetadata *a1, CFStringRef xmlns, CFStringRef prefix, CFStringRef name, const void *a5)
{
  CGImageMetadataTagRef v8;
  CGImageMetadataTag *v9;
  __CFString *v10;
  _BOOL8 v11;

  v8 = CGImageMetadataTagCreate(xmlns, prefix, name, kCGImageMetadataTypeDefault, a5);
  if (v8)
  {
    v9 = v8;
    v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), prefix, name);
    v11 = CGImageMetadataSetTagWithPath(a1, 0, v10, v9);
    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    CFRelease(v9);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
    v11 = 0;
  }

  return v11;
}

void avcdds_addValidMultiCamCombinations(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5, uint64_t a6)
{
  unint64_t i;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a2)
  {
    for (i = a3; i <= objc_msgSend(a1, "count") - a2; avcdds_addValidMultiCamCombinations(a1, a2 - 1, i, a4, a5, a6))
      objc_msgSend(a4, "setObject:atIndexedSubscript:", objc_msgSend(a1, "objectAtIndexedSubscript:", i++), objc_msgSend(a4, "count") - a2);
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __avcdds_addValidMultiCamCombinations_block_invoke;
    v12[3] = &unk_1E42167B8;
    v12[4] = a4;
    v12[5] = &v13;
    if (!objc_msgSend((id)objc_msgSend(a4, "indexesOfObjectsPassingTest:", v12), "count") && v14[3] <= a6)
      objc_msgSend(a5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4));
    _Block_object_dispose(&v13, 8);
  }
}

void sub_19EE59C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __avcdds_addValidMultiCamCombinations_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;

  v7 = a3 + 1;
  while (1)
  {
    v8 = v7;
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v8 >= v9)
      break;
    v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8), "supportsMultiCamCaptureWithDevice:", a2);
    v7 = v8 + 1;
    if ((v10 & 1) == 0)
    {
      *a4 = 1;
      return v8 < v9;
    }
  }
  if (objc_msgSend(a2, "hasMediaType:", *MEMORY[0x1E0CF2B90]))
  {
    v11 = objc_msgSend((id)objc_msgSend(a2, "constituentDevices"), "count");
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v12;
  }
  return v8 < v9;
}

void sub_19EE5A14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getADJasperPointCloudClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppleDepthLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E42167D8;
    v5 = 0;
    AppleDepthLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleDepthLibraryCore_frameworkLibrary)
    __getADJasperPointCloudClass_block_invoke_cold_1(&v3);
  result = objc_getClass("ADJasperPointCloud");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getADJasperPointCloudClass_block_invoke_cold_2();
  getADJasperPointCloudClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t xy_to_XYZ(uint64_t a1, double a2, double a3)
{
  if (a3 < 1.0e-20)
    return 0;
  *(double *)a1 = a2 / a3;
  *(_QWORD *)(a1 + 8) = 0x3FF0000000000000;
  *(double *)(a1 + 16) = (1.0 - a2) / a3 + -1.0;
  return 1;
}

uint64_t XYZ_to_xy(double *a1, double *a2, double *a3)
{
  double v3;
  uint64_t result;

  v3 = a1[1];
  if (*a1 >= 1.0e-20 || v3 >= 1.0e-20 || a1[2] >= 1.0e-20)
  {
    *a2 = *a1 / (*a1 + v3 + a1[2]);
    *a3 = a1[1] / (a1[1] + *a1 + a1[2]);
    return 1;
  }
  else
  {
    result = 0;
    *a3 = NAN;
    *a2 = NAN;
  }
  return result;
}

double VectorMatrix(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double result;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  *a3 = v4 * a2[1] + *a1 * *a2 + v5 * a2[2];
  a3[1] = v4 * a2[4] + v3 * a2[3] + v5 * a2[5];
  result = v4 * a2[7] + v3 * a2[6] + v5 * a2[8];
  a3[2] = result;
  return result;
}

double InvertMatrix(double *a1, double *a2)
{
  double result;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  result = *a1;
  v3 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = -(*a1 * v7);
  v12 = v5 * -(v8 * v6) + *a1 * v6 * v10 + v5 * v4 * v9 + -(v4 * v3) * v10 + v3 * v7 * v8 + v11 * v9;
  if (v12 != 0.0)
  {
    *a2 = (v6 * v10 - v9 * v7) / v12;
    a2[1] = (v9 * v5 - v3 * v10) / v12;
    a2[2] = (v3 * v7 - v6 * v5) / v12;
    a2[3] = (v10 * -v4 + v8 * v7) / v12;
    a2[4] = (v5 * -v8 + result * v10) / v12;
    a2[5] = (v11 + v4 * v5) / v12;
    a2[6] = (v4 * v9 - v8 * v6) / v12;
    a2[7] = (v9 * -result + v8 * v3) / v12;
    result = (result * v6 - v4 * v3) / v12;
    a2[8] = result;
  }
  return result;
}

double xy_to_tempTint(double *a1, double *a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double result;

  v4 = 1.5 - a3 + a4 * 6.0;
  v5 = (a3 + a3) / v4;
  v6 = a4 * 3.0 / v4;
  v7 = 0.0;
  v8 = 0x100000000;
  v9 = 0x38u;
  v10 = 0.0;
  v11 = 0.0;
  do
  {
    v12 = v11;
    v13 = v10;
    v14 = v7;
    v15 = *(double *)((char *)&kTempTable + v9);
    v16 = sqrt(v15 * v15 + 1.0);
    v7 = 1.0 / v16;
    v10 = v15 / v16;
    v18 = *(double *)((char *)&kTempTable + v9 - 16);
    v17 = *(double *)((char *)&kTempTable + v9 - 8);
    v11 = (v6 - v17) * v7 - (v5 - v18) * v10;
    v8 -= 0x100000000;
    v19 = v9 + 32;
    if (v9 == 984)
      break;
    v9 += 32;
  }
  while (v11 > 0.0);
  if (v8)
  {
    v20 = 0.0;
    if (v11 <= 0.0)
      v20 = (v6 - v17) * v7 - (v5 - v18) * v10;
    v21 = -v20 / (v12 - v20);
  }
  else
  {
    v21 = 0.0;
  }
  v22 = (double *)((char *)&kTempTable + (-v8 >> 27));
  *a1 = 1000000.0 / ((1.0 - v21) * *(double *)((char *)&kTempTable + v19 - 56) + *v22 * v21);
  v23 = v14 * v21 + v7 * (1.0 - v21);
  v24 = v13 * v21 + v10 * (1.0 - v21);
  v25 = sqrt(v24 * v24 + v23 * v23);
  result = (v24 / v25 * (v6 - (v17 * (1.0 - v21) + v22[2] * v21))
          + (v5 - (v18 * (1.0 - v21) + v22[1] * v21)) * (v23 / v25))
         * -3000.0;
  *a2 = result;
  return result;
}

double tempTint_to_xy(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double *v9;
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
  double result;

  v4 = 0x20u;
  v5 = 1000000.0 / a3;
  do
  {
    v6 = *(double *)((char *)&kTempTable + v4);
    v7 = v4 + 32;
    if (v4 == 960)
      break;
    v4 += 32;
  }
  while (v5 >= v6);
  v8 = a4 * -0.000333333333;
  v9 = (double *)((char *)&kTempTable + v7);
  v10 = (v6 - v5) / (v6 - *(double *)((char *)&kTempTable + v7 - 64));
  v11 = *(v9 - 3) * (1.0 - v10) + *(v9 - 7) * v10;
  v12 = *(double *)((char *)&kTempTable + v7 - 40);
  v13 = (1.0 - v10) * *(v9 - 2) + *(v9 - 6) * v10;
  v14 = *(double *)((char *)&kTempTable + v7 - 8);
  v15 = sqrt(v12 * v12 + 1.0);
  v16 = sqrt(v14 * v14 + 1.0);
  v17 = (1.0 - v10) * (1.0 / v16) + 1.0 / v15 * v10;
  v18 = (1.0 - v10) * (v14 / v16) + v12 / v15 * v10;
  v19 = sqrt(v18 * v18 + v17 * v17);
  v20 = v11 + v17 / v19 * v8;
  v21 = v13 + v18 / v19 * v8;
  v22 = v20 * 1.5;
  v23 = v20 + v21 * -4.0 + 2.0;
  *a1 = v22 / v23;
  result = v21 / v23;
  *a2 = result;
  return result;
}

void sub_19EE5D4F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE5D6C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE5F7A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void AVCaptureStillImageOutputPlayShutterSound(void *a1, SystemSoundID a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend((id)objc_msgSend(a1, "session"), "outputs");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v8, "isRecording")
        && !objc_msgSend(v8, "isRecordingPaused"))
      {
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    AudioServicesPlaySystemSound(a2);
  }
}

const __CFString *ps_shortStringForFileType(void *a1)
{
  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AF8]) & 1) != 0)
    return CFSTR("JFIF");
  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AE0]) & 1) != 0)
    return CFSTR("DNG");
  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2B10]) & 1) != 0)
    return CFSTR("TIFF");
  if ((objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AF0]) & 1) != 0)
    return CFSTR("HEIF");
  if (objc_msgSend(a1, "isEqual:", *MEMORY[0x1E0CF2AE8]))
    return CFSTR("HEIC");
  return CFSTR("Unknown");
}

double AVCaptureGetCurrentProcessAuditToken@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (AVCaptureGetCurrentProcessAuditToken_sOnceToken != -1)
    dispatch_once(&AVCaptureGetCurrentProcessAuditToken_sOnceToken, &__block_literal_global_19);
  result = *(double *)&AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken;
  v3 = unk_1EE53A880;
  *a1 = AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken;
  a1[1] = v3;
  return result;
}

uint64_t AVCaptureCurrentClientIsFaceTimeVariant()
{
  if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1)
    dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_23);
  return AVCaptureCurrentClientIsFaceTimeVariant_sAnswer;
}

uint64_t AVCaptureClientIsRapport()
{
  if (AVCaptureClientIsRapport_sOnceToken != -1)
    dispatch_once(&AVCaptureClientIsRapport_sOnceToken, &__block_literal_global_44);
  return AVCaptureClientIsRapport_sAnswer;
}

uint64_t AVCaptureClientIsCameraOrDerivative()
{
  if (AVCaptureClientIsCameraOrDerivative_sOnceToken != -1)
    dispatch_once(&AVCaptureClientIsCameraOrDerivative_sOnceToken, &__block_literal_global_49);
  return AVCaptureClientIsCameraOrDerivative_sAnswer;
}

uint64_t AVControlCenterAudioSupportedMicrophoneModesPreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOSupportedChatFlavors"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOSupportedChatFlavors"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterAudioHiddenMicrophoneModesPreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOHiddenChatFlavors"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioHiddenMicrophoneModesPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOHiddenChatFlavors"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterAudioPreferredMicrophoneModePreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOChatFlavor"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOChatFlavor"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterAudioActiveMicrophoneModePreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOActiveChatFlavor"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOActiveChatFlavor"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterAudioVoiceProcessingBypassedPreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOBypassVoiceProcessing"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioVoiceProcessingBypassedPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOBypassVoiceProcessing"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOIsAutoChatFlavorEnabled"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AUVoiceIOIsAutoChatFlavorEnabled"), AVControlCenterAudioPreferencesKeyPrefix(a1));
}

uint64_t AVControlCenterDidOverwriteOrphanedSupportedMicrophoneModesPreferenceKey(void *a1)
{
  __CFString *v1;

  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DidOverwriteOrphanedAUVoiceIOSupportedChatFlavors"), AVControlCenterAudioPreferencesKeyPrefix(v1));
}

uint64_t AVControlCenterAudioAreMicrophoneModesSupported()
{
  if (AVControlCenterAudioAreMicrophoneModesSupported_onceToken != -1)
    dispatch_once(&AVControlCenterAudioAreMicrophoneModesSupported_onceToken, &__block_literal_global_75);
  return AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported;
}

void *AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(void *a1)
{
  void *v2;
  int v3;

  if (AVControlCenterAudioAreMicrophoneModesSupported_onceToken != -1)
    dispatch_once(&AVControlCenterAudioAreMicrophoneModesSupported_onceToken, &__block_literal_global_75);
  if (AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported)
  {
    if ((objc_msgSend(a1, "isEqual:", 0x1E4221E08) & 1) != 0)
      return &unk_1E424D7B0;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", a1, 1, 0);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "infoDictionary"), "objectForKey:ofClass:", CFSTR("NSAlwaysAllowMicrophoneModeControl"), objc_opt_class()), "BOOLValue"))
    {

      return &unk_1E424D7B0;
    }
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "infoDictionary"), "objectForKey:ofClass:", CFSTR("NSAllowMicModeControlWithoutSensorsActive"), objc_opt_class()), "BOOLValue");

    if (v3)
      return &unk_1E424D7B0;
  }
  return (void *)MEMORY[0x1E0C9AA60];
}

uint64_t AVControlCenterAudioMicrophoneMGAutoMode()
{
  if (AVControlCenterAudioMicrophoneMGAutoMode_onceToken != -1)
    dispatch_once(&AVControlCenterAudioMicrophoneMGAutoMode_onceToken, &__block_literal_global_87);
  return AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode;
}

BOOL AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode(uint64_t a1, uint64_t a2)
{
  if (AVControlCenterAudioMicrophoneMGAutoMode_onceToken != -1)
    dispatch_once(&AVControlCenterAudioMicrophoneMGAutoMode_onceToken, &__block_literal_global_87);
  return (unint64_t)(a2 - 3) < 0xFFFFFFFFFFFFFFFELL
      && AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode == 1;
}

uint64_t AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@eligible-effects-list"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

const __CFString *avcc_prefixedSignalPreferenceKeyForBundleID(void *a1)
{
  __CFString *v1;
  uint64_t v2;

  if (!a1)
    return CFSTR("signal/");
  v1 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v1)
    v1 = CFSTR("unknown");
  v2 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("signal/%@/"), v2);
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@background-replacement-enabled"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@background-replacement-unavailablereasons"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%@background-replacement-url-bookmark"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoeffects/%@/"), v3));
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementURLRemovedSignalKey()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@background-replacement-url-removed"), CFSTR("signal/"));
}

uint64_t AVControlCenterBlackenFramesPreferenceKey(void *a1, uint64_t a2)
{
  void *v3;
  __CFString *v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v4)
    v4 = CFSTR("unknown");
  v5 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(v3, "stringWithFormat:", CFSTR("%@blacken-frames-from-deviceid-%@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@/"), CFSTR("nonpersisting-global/"), v5), a2);
}

uint64_t AVSmartStyleSettingsSystemStylePreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle"), avsss_prefixedSystemStylePreferenceKeyForBundleID(a1));
}

uint64_t avsss_prefixedSystemStylePreferenceKeyForBundleID(void *a1)
{
  __CFString *v2;
  __CFString *v3;

  v2 = AVSmartStyleSettingsSystemStyle;
  if ((objc_msgSend(a1, "isEqualToString:", AVSmartStyleSettingsSystemStyle) & 1) == 0)
  {
    v3 = AVControlCenterPreferencesDomainForPreferencesDomain(a1);
    if (!v3)
      v3 = CFSTR("unknown");
    v2 = (__CFString *)-[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("smartStyle/%@/"), v2);
}

uint64_t AVSmartStyleSettingsSystemStyleTimestampPreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nonpersisting-global/%@systemstyle-backgrounded-timestamp"), avsss_prefixedSystemStylePreferenceKeyForBundleID(a1));
}

uint64_t AVSmartStyleSettingsSystemStyleEnabledPreferenceKey()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("systemstyle-enabled"));
}

uint64_t AVSmartStyleSettingsSystemStyleEnabledDefaultPreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle-enabled-default"), avsss_prefixedSystemStylePreferenceKeyForBundleID(a1));
}

uint64_t AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(void *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle-has-shown-opt-out-message"), avsss_prefixedSystemStylePreferenceKeyForBundleID(a1));
}

uint64_t AVCaptureGetFrameworkRadarComponentName()
{
  return 0;
}

void *AVCIFilterArrayDescription(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", &stru_1E421DB28);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = "";
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "appendFormat:", CFSTR("%s%@"), v6, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "name"));
        v6 = ", ";
      }
      while (v4 != v7);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = ", ";
    }
    while (v4);
  }
  return v2;
}

const __CFString *AVAppleMakerNoteProcessingFlagsToShortString()
{
  return &stru_1E421DB28;
}

BOOL validRectInUnitRectCoordinateSpace(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;
  CGRect v10;
  CGRect v11;

  if (CGRectIsNull(*(CGRect *)&a1))
    return 0;
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectEqualToRect(v9, *MEMORY[0x1E0C9D648]))
    return 0;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  return CGRectContainsRect(v10, v11);
}

BOOL AVCaptureShouldThrowForAPIViolations()
{
  if (AVCaptureShouldThrowForAPIViolations_onceToken != -1)
    dispatch_once(&AVCaptureShouldThrowForAPIViolations_onceToken, &__block_literal_global_263);
  return AVCaptureShouldThrowForAPIViolations_pardonAPIViolations == 0;
}

uint64_t AVCaptureGetDiskCapacityInGB()
{
  if (AVCaptureGetDiskCapacityInGB_onceToken != -1)
    dispatch_once(&AVCaptureGetDiskCapacityInGB_onceToken, &__block_literal_global_268);
  return AVCaptureGetDiskCapacityInGB_sDiskCapacityInGB;
}

uint64_t AVCaptureMovieFileURLIsValidForConnection(void *a1, double a2, double a3, uint64_t a4, const __CFString **a5)
{
  int IsFileOnExternalStorageDevice;
  int v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  BOOL v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  const __CFString *v19;
  uint64_t result;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;

  IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
  if (!a1)
    return 1;
  v10 = IsFileOnExternalStorageDevice;
  v11 = (void *)objc_msgSend(a1, "sourceDevice");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "figCaptureSourceVideoFormat"), "format");
  if (!FigCapturePixelFormatIs422())
    return 1;
  if (AVCaptureMovieFileURLIsValidForConnection_onceToken == -1)
  {
    if (v11)
    {
LABEL_5:
      objc_msgSend(v11, "activeVideoMaxFrameDuration");
      objc_msgSend(v11, "activeVideoMaxFrameDuration");
      v12 = (double)v24 / (double)v23;
      objc_msgSend(v11, "activeVideoMinFrameDuration");
      objc_msgSend(v11, "activeVideoMinFrameDuration");
      v13 = (double)v22 / (double)v21;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&AVCaptureMovieFileURLIsValidForConnection_onceToken, &__block_literal_global_271);
    if (v11)
      goto LABEL_5;
  }
  v12 = NAN;
  v13 = NAN;
LABEL_8:
  v14 = 0;
  if (a2 == 3840.0)
  {
    v15 = 0;
    v16 = 0;
    if (a3 == 2160.0)
    {
      v15 = v12 == v13 && v12 == 120.0;
      v14 = v12 == v13 && v12 == 60.0;
      v16 = v12 == v13 && v12 == 30.0;
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v17 = 0;
  if (a2 == 1920.0)
  {
    v18 = 0;
    if (a3 == 1080.0)
    {
      v17 = v12 == v13 && v12 == 60.0;
      v18 = v12 == v13 && v12 == 120.0;
    }
  }
  else
  {
    v18 = 0;
  }
  if (AVCaptureGetDiskCapacityInGB_onceToken == -1)
  {
    if (!v10)
      goto LABEL_31;
    return 1;
  }
  dispatch_once(&AVCaptureGetDiskCapacityInGB_onceToken, &__block_literal_global_268);
  if (v10)
    return 1;
LABEL_31:
  v19 = CFSTR("Capturing 4k120 with ProRes codec on this device is supported only on external storage device.");
  if (v14)
    v19 = CFSTR("Capturing 4k60 with ProRes codec on this device is supported only on external storage device.");
  if (!v14 && !v15)
  {
    if (AVCaptureGetDiskCapacityInGB_sDiskCapacityInGB > 0xFF)
      return 1;
    v19 = CFSTR("Capturing 1080p120 with ProRes codec on this device is supported only on external storage device.");
    if (v17)
      v19 = CFSTR("Capturing 1080p60 with ProRes codec on this device is supported only on external storage device.");
    if (v16)
      v19 = CFSTR("Capturing 4k30 with ProRes codec on this device is supported only on external storage device.");
    if (!v16 && !v17 && !v18)
      return 1;
  }
  result = 0;
  if (a5)
    *a5 = v19;
  return result;
}

uint64_t AVCaptureVTRotationFromDegrees(int a1)
{
  uint64_t result;
  uint64_t v3;

  result = 0;
  if (a1 > 179)
  {
    if (a1 == 180)
    {
      v3 = MEMORY[0x1E0CEDA30];
    }
    else
    {
      if (a1 != 270)
        return result;
      v3 = MEMORY[0x1E0CEDA38];
    }
  }
  else if (a1)
  {
    if (a1 != 90)
      return result;
    v3 = MEMORY[0x1E0CEDA40];
  }
  else
  {
    v3 = MEMORY[0x1E0CEDA28];
  }
  return *(_QWORD *)v3;
}

CFTypeRef AVCaptureGetTransformedDetectedObjectsInfo(const void *a1, uint64_t a2, void *a3)
{
  void *v6;
  const __CFString *v7;
  const void *v8;
  CFTypeRef result;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *DeepCopy;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = (void *)CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E0D04138], 0);
  v7 = (const __CFString *)*MEMORY[0x1E0D05030];
  v8 = (const void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05030]);
  if (v8 || (result = CMGetAttachment(a1, v7, 0), (v8 = result) != 0))
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v50 = *MEMORY[0x1E0C9BAA8];
    v51 = v10;
    v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v49 = 0;
    v48 = 0;
    objc_msgSend(a3, "getTransform:mirroredOut:rollAdjustmentOut:forConnection:", &v50, &v49, &v48, a2);
    if (*(double *)&v50 == 0.0)
      v11 = *(double *)&v51;
    else
      v11 = *(double *)&v50;
    v12 = fabs(v11);
    v13 = *(double *)&v50 / v12;
    v14 = *(double *)&v51 / v12;
    v15 = *(double *)&v52 / v12;
    if (*((double *)&v51 + 1) == 0.0)
      v16 = *((double *)&v50 + 1);
    else
      v16 = *((double *)&v51 + 1);
    v17 = fabs(v16);
    *(double *)&v50 = v13;
    *((double *)&v50 + 1) = *((double *)&v50 + 1) / v17;
    *(double *)&v51 = v14;
    *((double *)&v51 + 1) = *((double *)&v51 + 1) / v17;
    *(double *)&v52 = v15;
    *((double *)&v52 + 1) = *((double *)&v52 + 1) / v17;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, 1uLL);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v28 = DeepCopy;
    obj = (id)objc_msgSend(DeepCopy, "allValues");
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v45;
      v30 = *MEMORY[0x1E0D04FB0];
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(obj);
          v33 = v19;
          v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v19), "objectForKeyedSubscript:", v30);
          if (v20)
          {
            v21 = v20;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v41;
              do
              {
                v25 = 0;
                do
                {
                  if (*(_QWORD *)v41 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v25);
                  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v34[0] = MEMORY[0x1E0C809B0];
                  v34[1] = 3221225472;
                  v34[2] = __AVCaptureGetTransformedDetectedObjectsInfo_block_invoke;
                  v34[3] = &unk_1E4216BC0;
                  v35 = v50;
                  v36 = v51;
                  v37 = v52;
                  v34[4] = v27;
                  v38 = v48;
                  v39 = v49;
                  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v34);
                  objc_msgSend(v26, "addEntriesFromDictionary:", v27);

                  ++v25;
                }
                while (v23 != v25);
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
              }
              while (v23);
            }
          }
          v19 = v33 + 1;
        }
        while (v33 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v32);
    }
    return v28;
  }
  return result;
}

const __CFString *AVCaptureQOSClassToString(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch((_DWORD)a1)
    {
      case 0x15:
        return CFSTR("QOS_CLASS_DEFAULT");
      case 0x21:
        return CFSTR("QOS_CLASS_USER_INTERACTIVE");
      case 0x19:
        return CFSTR("QOS_CLASS_USER_INITIATED");
    }
  }
  else
  {
    switch((_DWORD)a1)
    {
      case 0:
        return CFSTR("QOS_CLASS_UNSPECIFIED");
      case 9:
        return CFSTR("QOS_CLASS_BACKGROUND");
      case 0x11:
        return CFSTR("QOS_CLASS_UTILITY");
    }
  }
  return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown QoS class %d"), a1);
}

NSString *__cdecl AVCaptureReactionSystemImageNameForType(AVCaptureReactionType reactionType)
{
  if (AVCaptureReactionSystemImageNameForType_onceToken != -1)
    dispatch_once(&AVCaptureReactionSystemImageNameForType_onceToken, &__block_literal_global_5);
  return (NSString *)objc_msgSend((id)AVCaptureReactionSystemImageNameForType_nameForType, "objectForKeyedSubscript:", reactionType);
}

void sub_19EE6AEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE6AFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EE6B184(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE6B2A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t vsndo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

void sub_19EE7B9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *AVCaptureDeviceTypeToString(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")) & 1) != 0)
    return CFSTR("Wide");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera")) & 1) != 0)
    return CFSTR("Tele");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualCamera")) & 1) != 0)
    return CFSTR("Dual");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")) & 1) != 0)
    return CFSTR("UltraWide");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera")) & 1) != 0)
    return CFSTR("DualWide");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera")) & 1) != 0)
    return CFSTR("Triple");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera")) & 1) != 0)
    return CFSTR("TimeOfFlight");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera")) & 1) != 0)
    return CFSTR("LiDARDepth");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")) & 1) != 0)
    return CFSTR("Overhead");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera")) & 1) != 0)
    return CFSTR("TrueDepth");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera")) & 1) != 0)
    return CFSTR("WideMetadata");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera")) & 1) != 0)
    return CFSTR("UltraWideMetadata");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera")) & 1) != 0)
    return CFSTR("InfraredMetadata");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeMicrophone")) & 1) != 0)
    return CFSTR("Microphone");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeExternal")) & 1) != 0)
    return CFSTR("External");
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeContinuityCamera")))
    return CFSTR("ContinuityCamera");
  return 0;
}

const __CFString *AVCaptureDeviceTypeToShortString(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")) & 1) != 0)
    return CFSTR("W");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera")) & 1) != 0)
    return CFSTR("T");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualCamera")) & 1) != 0)
    return CFSTR("D");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")) & 1) != 0)
    return CFSTR("UW");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera")) & 1) != 0)
    return CFSTR("DW");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera")) & 1) != 0)
    return CFSTR("3");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera")) & 1) != 0)
    return CFSTR("TOF");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera")) & 1) != 0)
    return CFSTR("LD");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")) & 1) != 0)
    return CFSTR("OH");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera")) & 1) != 0)
    return CFSTR("TD");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera")) & 1) != 0)
    return CFSTR("WM");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera")) & 1) != 0)
    return CFSTR("UWM");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera")) & 1) != 0)
    return CFSTR("IRM");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeMicrophone")) & 1) != 0)
    return CFSTR("MIC");
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeExternal")) & 1) != 0)
    return CFSTR("EXT");
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureDeviceTypeContinuityCamera")))
    return CFSTR("CC");
  return 0;
}

const __CFString *AVCaptureDevicePositionToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<Unknown>");
  else
    return off_1E42170E8[a1];
}

__CFString *AVCaptureVideoStabilizationModeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 6)
    return 0;
  else
    return off_1E4217100[a1 + 1];
}

uint64_t ___registerServerConnectionDiedNotification_block_invoke()
{
  id v0;
  id v1;

  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  v0 = (id)objc_msgSend((id)sRegisteredVideoDevices, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  v1 = (id)objc_msgSend((id)sRegisteredAudioDevices, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  if (objc_msgSend(v0, "count"))
    -[objc_class _reconnectDevices:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_reconnectDevices:", v0);
  if (objc_msgSend(v1, "count"))
    -[objc_class _reconnectDevices:](NSClassFromString(CFSTR("AVCaptureFigAudioDevice")), "_reconnectDevices:", v1);
  +[AVCaptureProprietaryDefaultsSingleton updateProprietaryDefaultsSource](AVCaptureProprietaryDefaultsSingleton, "updateProprietaryDefaultsSource");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceServerConnectionDiedNotification"), 0);
}

void ___registerVideoDevicesOnce_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  os_log_type_t type[5];
  _DWORD v49[32];
  _DWORD v50[34];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED700)
  {
    v49[0] = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    a1 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)MEMORY[0x1A1AF16C4](a1, a2);
  v46 = 0;
  v47 = 0;
  _refreshRegisteredDevices(CFSTR("AVCaptureFigVideoDevice"), &v47, &v46);
  if (objc_msgSend(v47, "count") || objc_msgSend(v46, "count"))
  {
    -[objc_class _setUpCameraHistoryOnce](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_setUpCameraHistoryOnce");
    -[objc_class _initiateRefreshPreferredCameraProperties:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_initiateRefreshPreferredCameraProperties:", 1);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = v47;
  v5 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v42, v51, 16, v26, v27);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v9, "_setConnected:", 1);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceWasConnectedNotification"), v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v6);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v46;
  v11 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v15, "_setConnected:", 0);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceWasDisconnectedNotification"), v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v12);
  }
  v36 = 0;
  v37 = 0;
  _refreshRegisteredDevices(CFSTR("AVCaptureFigAudioDevice"), &v37, &v36);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v37;
  v17 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceWasConnectedNotification"), *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    }
    while (v18);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v36;
  v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v28, type, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceWasDisconnectedNotification"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, type, 16);
    }
    while (v23);
  }
  objc_autoreleasePoolPop(v3);
}

void _refreshRegisteredDevices(void *a1, _QWORD *a2, _QWORD *a3)
{
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *UniqueIDsForDevices;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  os_unfair_lock_s *lock;
  _QWORD *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureFigAudioDevice")) & 1) != 0)
  {
    v31 = a2;
    v32 = a3;
    v6 = (os_unfair_lock_s *)&sRegisterAudioDevicesLock;
  }
  else
  {
    if (!objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureFigVideoDevice")))
      return;
    v31 = a2;
    v32 = a3;
    v6 = (os_unfair_lock_s *)&sRegisterVideoDevicesLock;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  lock = v6;
  os_unfair_lock_lock(v6);
  v9 = objc_msgSend(a1, "isEqualToString:", CFSTR("AVCaptureFigAudioDevice"));
  v10 = &sRegisteredAudioDevices;
  if (!v9)
    v10 = &sRegisteredVideoDevices;
  v11 = (void *)*v10;
  v28 = a1;
  v12 = (void *)-[objc_class _devicesWithPriorRegisteredDevices:](NSClassFromString((NSString *)a1), "_devicesWithPriorRegisteredDevices:", *v10);
  UniqueIDsForDevices = _getUniqueIDsForDevices(v11);
  v14 = _getUniqueIDsForDevices(v12);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(UniqueIDsForDevices, "containsObject:", objc_msgSend(v19, "uniqueID", v28, lock)) & 1) == 0
          && objc_msgSend(v19, "isConnected"))
        {
          objc_msgSend(v7, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v16);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16, v28);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v11);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if ((objc_msgSend(v14, "containsObject:", objc_msgSend(v24, "uniqueID")) & 1) == 0)
          objc_msgSend(v8, "addObject:", v24);
      }
      v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }
  v25 = objc_msgSend(v29, "isEqualToString:", CFSTR("AVCaptureFigAudioDevice"));
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v12);
  v27 = &sRegisteredAudioDevices;
  if (!v25)
    v27 = &sRegisteredVideoDevices;
  *v27 = v26;

  os_unfair_lock_unlock(lock);
  if (v31)
    *v31 = v7;
  if (v32)
    *v32 = v8;

}

void *_getUniqueIDsForDevices(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a1);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "uniqueID");
        if (v7)
          objc_msgSend(v2, "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  return v2;
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getCMContinuityCaptureCapabilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CMContinuityCaptureCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E42170D0;
    v5 = 0;
    CMContinuityCaptureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CMContinuityCaptureCoreLibraryCore_frameworkLibrary)
    __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CMContinuityCaptureCapabilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_2();
  getCMContinuityCaptureCapabilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t ccdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

uint64_t pdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

void sub_19EE800A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE81188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE8135C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE81554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE81728(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE81AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE81CFC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE81F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE822B8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EE82C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sioNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __sioNotificationHandler_block_invoke;
  v6[3] = &unk_1E4216898;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a5;
  return objc_msgSend(a2, "performBlockOnSessionNotifyingThread:", v6);
}

void sub_19EE83008(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE83B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

uint64_t __sioNotificationHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t AVCaptureMetadataObjectsOnly()
{
  if (AVCaptureMetadataObjectsOnly_onceToken != -1)
    dispatch_once(&AVCaptureMetadataObjectsOnly_onceToken, &__block_literal_global_11);
  return AVCaptureMetadataObjectsOnly_answer;
}

uint64_t AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(void *a1, uint64_t a2, uint64_t *a3)
{
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  CGRect v12;

  if (!a2)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    v8 = objc_msgSend(v9, "stringWithFormat:", CFSTR("Metadata value is an instance of %@, but there is no format description"), NSStringFromClass(v10));
    goto LABEL_27;
  }
  if (FigBoxedMetadataCreateForConstruction())
    goto LABEL_25;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = objc_msgSend(v6, "stringWithFormat:", CFSTR("Metadata value is an instance of %@, but format description does not properly describe face data"), NSStringFromClass(v7));
  objc_msgSend((id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces(), "objectForKey:", *MEMORY[0x1E0CA4C18]);
  if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
    goto LABEL_24;
  objc_msgSend(a1, "faceID");
  if (FigBoxedMetadataAppendSInt32())
    goto LABEL_25;
  objc_msgSend((id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces(), "objectForKey:", *MEMORY[0x1E0CA4C10]);
  if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
    goto LABEL_24;
  objc_msgSend(a1, "bounds");
  CGRectStandardize(v12);
  if (FigBoxedMetadataAppendValue())
    goto LABEL_25;
  if (objc_msgSend(a1, "hasRollAngle"))
  {
    objc_msgSend((id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces(), "objectForKey:", *MEMORY[0x1E0CA4C20]);
    if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
      goto LABEL_24;
    objc_msgSend(a1, "rollAngle");
    if (FigBoxedMetadataAppendFloat32())
      goto LABEL_25;
  }
  if (!objc_msgSend(a1, "hasYawAngle"))
    goto LABEL_13;
  if (!AVMetadataItemGetLocalIDForIdentifierInFormatDescription(a2, *MEMORY[0x1E0CA4C28]))
  {
LABEL_24:
    FigDebugAssert3();
    goto LABEL_27;
  }
  objc_msgSend(a1, "yawAngle");
  if (!FigBoxedMetadataAppendFloat32())
  {
LABEL_13:
    if (!FigBoxedMetadataEndConstruction())
      goto LABEL_26;
  }
LABEL_25:
  FigDebugAssert3();
LABEL_26:
  v8 = 0;
LABEL_27:
  if (a3)
    *a3 = v8;
  return 0;
}

uint64_t AVMetadataItemGetLocalIDForIdentifierInFormatDescription(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces(), "objectForKey:", a2);
  return FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
}

AVMetadataSalientObject *AVMetadataMakeMetadataObjectFromBoxedMetadata(uint64_t a1, void *a2, __int128 *a3, __int128 *a4)
{
  CGSize v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  double v14;
  double v15;
  char v16;
  float v17;
  float v18;
  CGSize v19;
  uint64_t v20;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsNull;
  __objc2_class *v26;
  AVMetadataFaceObject *v27;
  AVMetadataSalientObject *v28;
  CGSize v29;
  _BOOL4 v30;
  CGSize v31;
  _BOOL4 v32;
  CGSize v34;
  uint64_t v35;
  CGPoint origin;
  CGSize size;
  _BOOL4 v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  CGRect v56;
  _QWORD v57[2];

  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CA24B0]))
  {
    v46 = *a3;
    v49 = *((_QWORD *)a3 + 2);
    v40 = *a4;
    v43 = *((_QWORD *)a4 + 2);
    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v56.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v56.size = v8;
    FigBoxedMetadataGetFormatDescription();
    if (FigBoxedMetadataGetNumberOfItems() >= 1)
    {
      v9 = 0;
      v39 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0.0;
      v15 = 0.0;
      do
      {
        AVMetadataItemIdentifierForItemIndex();
        if (FigCFEqual())
        {
          while (1)
          {
            LODWORD(v12) = FigBoxedMetadataGetValueOfItemAtIndexAsSInt32();
            if (++v9 >= FigBoxedMetadataGetNumberOfItems())
              break;
            AVMetadataItemIdentifierForItemIndex();
            if (!FigCFEqual())
            {
              v12 = (int)v12;
              v13 = 1;
              goto LABEL_8;
            }
          }
          v12 = (int)v12;
          goto LABEL_22;
        }
LABEL_8:
        if (FigCFEqual())
        {
          AVMetadataItemBoundsFromBoxedMetadataForItemIndex(a1, v9, &v56);
          v11 = v16;
        }
        else if (FigCFEqual())
        {
          FigBoxedMetadataGetValueOfItemAtIndexAsFloat32();
          v15 = v17;
          v10 = 1;
        }
        else if (FigCFEqual())
        {
          FigBoxedMetadataGetValueOfItemAtIndexAsFloat32();
          v14 = v18;
          v39 = 1;
        }
        ++v9;
      }
      while (v9 < FigBoxedMetadataGetNumberOfItems());
      if ((v13 & 1) == 0)
        goto LABEL_38;
LABEL_22:
      if ((v11 & 1) != 0)
      {
        v27 = [AVMetadataFaceObject alloc];
        v54 = v46;
        v55 = v49;
        v52 = v40;
        v53 = v43;
        v28 = -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:](v27, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:", v12, v10 & 1, v39 & 1, 0, &v54, &v52, v15, v14, 0.0, *(_OWORD *)&v56.origin, *(_OWORD *)&v56.size);
        return v28;
      }
    }
    goto LABEL_38;
  }
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CA24B8]))
  {
    v47 = *a3;
    v50 = *((_QWORD *)a3 + 2);
    v41 = *a4;
    v44 = *((_QWORD *)a4 + 2);
    v57[0] = -1;
    v19 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v56.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v56.size = v19;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E0CA4C30], *MEMORY[0x1E0CA4C38], v57, &v56);
    v20 = v57[0];
    y = v56.origin.y;
    x = v56.origin.x;
    height = v56.size.height;
    width = v56.size.width;
    IsNull = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !IsNull)
    {
      v26 = AVMetadataHumanBodyObject;
LABEL_32:
      v54 = v47;
      v55 = v50;
      v52 = v41;
      v53 = v44;
      v28 = (AVMetadataSalientObject *)objc_msgSend([v26 alloc], "initWithBodyID:time:duration:bounds:", v20, &v54, &v52, x, y, width, height);
      return v28;
    }
    goto LABEL_38;
  }
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CA24A0]))
  {
    v47 = *a3;
    v50 = *((_QWORD *)a3 + 2);
    v41 = *a4;
    v44 = *((_QWORD *)a4 + 2);
    v57[0] = -1;
    v29 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v56.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v56.size = v29;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E0CA4BF0], *MEMORY[0x1E0CA4BF8], v57, &v56);
    v20 = v57[0];
    y = v56.origin.y;
    x = v56.origin.x;
    height = v56.size.height;
    width = v56.size.width;
    v30 = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !v30)
    {
      v26 = AVMetadataCatBodyObject;
      goto LABEL_32;
    }
LABEL_38:
    FigDebugAssert3();
    return 0;
  }
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CA24A8]))
  {
    v47 = *a3;
    v50 = *((_QWORD *)a3 + 2);
    v41 = *a4;
    v44 = *((_QWORD *)a4 + 2);
    v57[0] = -1;
    v31 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v56.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v56.size = v31;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E0CA4C00], *MEMORY[0x1E0CA4C08], v57, &v56);
    v20 = v57[0];
    y = v56.origin.y;
    x = v56.origin.x;
    height = v56.size.height;
    width = v56.size.width;
    v32 = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !v32)
    {
      v26 = AVMetadataDogBodyObject;
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CA24C0]))
  {
    v48 = *a3;
    v51 = *((_QWORD *)a3 + 2);
    v42 = *a4;
    v45 = *((_QWORD *)a4 + 2);
    v57[0] = 0;
    v34 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v56.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v56.size = v34;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E0CA4CB0], *MEMORY[0x1E0CA4CA8], v57, &v56);
    v35 = v57[0];
    origin = v56.origin;
    size = v56.size;
    v38 = CGRectIsNull(v56);
    if ((v35 & 0x8000000000000000) == 0 && !v38)
    {
      v54 = v48;
      v55 = v51;
      v52 = v42;
      v53 = v45;
      v28 = -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:]([AVMetadataSalientObject alloc], "initWithObjectID:time:duration:bounds:", v35, &v54, &v52, origin, size);
      return v28;
    }
    goto LABEL_38;
  }
  return 0;
}

void *AVMetadataMakeDependentSpecificationsForValue()
{
  uint64_t DataTypesForIdentifiersOfFieldsOfDetectedFaces;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    DataTypesForIdentifiersOfFieldsOfDetectedFaces = AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1 = *MEMORY[0x1E0CA4C30];
      v2 = *MEMORY[0x1E0CA2478];
      v3 = (uint64_t *)MEMORY[0x1E0CA4C38];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v1 = *MEMORY[0x1E0CA4BF0];
        v2 = *MEMORY[0x1E0CA2478];
        v3 = (uint64_t *)MEMORY[0x1E0CA4BF8];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1 = *MEMORY[0x1E0CA4C00];
          v2 = *MEMORY[0x1E0CA2478];
          v3 = (uint64_t *)MEMORY[0x1E0CA4C08];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            return (void *)MEMORY[0x1E0C9AA60];
          v1 = *MEMORY[0x1E0CA4CB0];
          v2 = *MEMORY[0x1E0CA2478];
          v3 = (uint64_t *)MEMORY[0x1E0CA4CA8];
        }
      }
    }
    v4 = *v3;
    v25[0] = v1;
    v25[1] = v4;
    v5 = *MEMORY[0x1E0CA2430];
    v26[0] = v2;
    v26[1] = v5;
    DataTypesForIdentifiersOfFieldsOfDetectedFaces = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  }
  v6 = (void *)DataTypesForIdentifiersOfFieldsOfDetectedFaces;
  if (!DataTypesForIdentifiersOfFieldsOfDetectedFaces)
    return (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_msgSend(v6, "allKeys", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = *MEMORY[0x1E0CA2528];
    v13 = *MEMORY[0x1E0CA2518];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v6, "objectForKey:", v15);
        v22[0] = v12;
        v22[1] = v13;
        v23[0] = v15;
        v23[1] = v16;
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }
  return v7;
}

uint64_t AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA2478];
  v1 = *MEMORY[0x1E0CA4C10];
  v6[0] = *MEMORY[0x1E0CA4C18];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CA2430];
  v7[0] = v0;
  v7[1] = v2;
  v3 = *MEMORY[0x1E0CA23F0];
  v4 = *MEMORY[0x1E0CA4C28];
  v6[2] = *MEMORY[0x1E0CA4C20];
  v6[3] = v4;
  v7[2] = v3;
  v7[3] = v3;
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

uint64_t AVMetadataItemIdentifierForItemIndex()
{
  uint64_t result;

  if (!FigBoxedMetadataGetLocalIDOfItemAtIndex()
    || (result = FigMetadataFormatDescriptionGetIdentifierForLocalID()) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  return result;
}

__n128 AVMetadataItemBoundsFromBoxedMetadataForItemIndex(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  __n128 result;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  FigBoxedMetadataGetValueOfItemAtIndex();
  result = *(__n128 *)MEMORY[0x1E0C9D628];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *a3 = *MEMORY[0x1E0C9D628];
  a3[1] = v5;
  return result;
}

uint64_t AVMetadataItemIDAndBoundsFromBoxedMetadata(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _OWORD *a5)
{
  uint64_t result;
  uint64_t i;

  FigBoxedMetadataGetFormatDescription();
  result = FigBoxedMetadataGetNumberOfItems();
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      AVMetadataItemIdentifierForItemIndex();
      if (FigCFEqual())
      {
        *a4 = (int)FigBoxedMetadataGetValueOfItemAtIndexAsSInt32();
      }
      else if (FigCFEqual())
      {
        AVMetadataItemBoundsFromBoxedMetadataForItemIndex(a1, i, a5);
      }
      result = FigBoxedMetadataGetNumberOfItems();
    }
  }
  return result;
}

uint64_t mfoNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "handleNotification:payload:", a3, a5);
}

void sub_19EE88D38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE89144(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE89AD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8A180(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8A37C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8B070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8B140(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8B694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8B794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8BB98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8BF48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8C0A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8C208(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8C7E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8CF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EE8DBCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8DC34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8DD60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EE8DEB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL AVMetadataObjectAdjustBaseClassProperties(uint64_t a1, CGRect *a2, double a3, double a4, double a5, double a6)
{
  char v6;
  __int128 v8;
  CGAffineTransform v10;
  CGRect v11;

  v6 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)a1), (int8x16_t)vcgezq_f64(*(float64x2_t *)a1)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)(a1 + 16)), (int8x16_t)vcgezq_f64(*(float64x2_t *)(a1 + 16)))))));
  if ((v6 & 1) == 0)
  {
    v8 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&v10.a = *(_OWORD *)a1;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tx = *(_OWORD *)(a1 + 32);
    v11 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v10);
    if (a2)
      *a2 = v11;
  }
  return (v6 & 1) == 0;
}

void sub_19EE943D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __figBarcodeTypeToAVFMachineReadableCodeType_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("org.gs1.UPC-E"), *MEMORY[0x1E0D83448], CFSTR("org.iso.Code39"), *MEMORY[0x1E0D83388], CFSTR("org.iso.Code39Mod43"), *MEMORY[0x1E0D83390], CFSTR("org.gs1.EAN-13"), *MEMORY[0x1E0D833C0], CFSTR("org.gs1.EAN-8"), *MEMORY[0x1E0D833C8], CFSTR("com.intermec.Code93"), *MEMORY[0x1E0D833A8], CFSTR("org.iso.Code128"), *MEMORY[0x1E0D83380], CFSTR("org.iso.QRCode"), *MEMORY[0x1E0D83440], CFSTR("org.iso.Aztec"),
             *MEMORY[0x1E0D83370],
             CFSTR("org.iso.PDF417"),
             *MEMORY[0x1E0D83418],
             CFSTR("org.ansi.Interleaved2of5"),
             *MEMORY[0x1E0D833E8],
             CFSTR("org.gs1.ITF14"),
             *MEMORY[0x1E0D833F8],
             CFSTR("org.iso.DataMatrix"),
             *MEMORY[0x1E0D833B8],
             CFSTR("Codabar"),
             *MEMORY[0x1E0D83378],
             CFSTR("org.gs1.GS1DataBar"),
             *MEMORY[0x1E0D833D0],
             CFSTR("org.gs1.GS1DataBarExpanded"),
             *MEMORY[0x1E0D833D8],
             CFSTR("org.gs1.GS1DataBarLimited"),
             *MEMORY[0x1E0D833E0],
             CFSTR("org.iso.MicroQR"),
             *MEMORY[0x1E0D83410],
             CFSTR("org.iso.MicroPDF417"),
             *MEMORY[0x1E0D83408],
             0);
  figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypes = result;
  return result;
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EE94EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE95094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EE952FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EE95868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19EE95D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void avpds_proprietaryDefaultsSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFRunLoop *Main;
  __CFRunLoop *v6;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __avpds_proprietaryDefaultsSourceNotificationHandler_block_invoke;
  v7[3] = &unk_1E4216408;
  v7[4] = a3;
  v7[5] = a5;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], v7);
  v6 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v6);
}

void sub_19EE96420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __avpds_proprietaryDefaultsSourceNotificationHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "_handleNotification:payload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void *avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_msgSend(a2, "formats", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return a1;
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
    v9 = objc_msgSend(v8, "isVideoBinned");
    if (v9 == objc_msgSend(a1, "isVideoBinned"))
    {
      if (CFEqual((CFTypeRef)objc_msgSend(v8, "formatDescription"), (CFTypeRef)objc_msgSend(a1, "formatDescription")))
        return v8;
    }
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        goto LABEL_3;
      return a1;
    }
  }
}

double __avcmcs_computeSystemPressureCost_block_invoke()
{
  double result;

  avcmcs_computeSystemPressureCost_allSlopes[0] = (uint64_t)&unk_1E424D8A0;
  unk_1EE53A560 = xmmword_19EEEA7B0;
  qword_1EE53A570 = 0x451C1000BE8F0D84;
  qword_1EE53A578 = &unk_1E424D8B8;
  qword_1EE53A580 = 0x457A000000000000;
  qword_1EE53A588 = 0;
  unk_1EE53A590 = 0;
  qword_1EE53A598 = &unk_1E424D8D0;
  qword_1EE53A5A0 = 0x459C400000000000;
  qword_1EE53A5A8 = 0;
  unk_1EE53A5B0 = 0;
  qword_1EE53A5B8 = &unk_1E424D8E8;
  unk_1EE53A5C0 = xmmword_19EEEA7C0;
  qword_1EE53A5D0 = 0x45825000BFB9999ALL;
  qword_1EE53A5D8 = &unk_1E424D900;
  unk_1EE53A5E0 = xmmword_19EEEA7D0;
  qword_1EE53A5F0 = 0x45223666BF67F62BLL;
  qword_1EE53A5F8 = &unk_1E424D918;
  unk_1EE53A600 = xmmword_19EEEA7E0;
  qword_1EE53A610 = 0x4569D000BF88F5C3;
  qword_1EE53A618 = &unk_1E424D930;
  result = 3.324546e25;
  qword_1EE53A620 = 0x453B800000000000;
  qword_1EE53A628 = 0;
  unk_1EE53A630 = 0;
  return result;
}

uint64_t fvd_prioritizeUsingCameraHistory(void *a1, void *a2, void *a3, char a4, char a5, int a6, void *a7)
{
  uint64_t result;
  uint64_t v12;
  void *v13;
  unint64_t i;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "count");
  if (result)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v20 = result;
    if (result)
    {
      v19 = *(_QWORD *)v23;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        if (objc_msgSend(a1, "count"))
        {
          for (i = 0; i < objc_msgSend(a1, "count"); ++i)
          {
            v15 = (_QWORD *)objc_msgSend(a1, "objectAtIndexedSubscript:", i);
            v16 = v15;
            if (((a4 & 1) != 0 || (objc_msgSend(v15, "isSuspended") & 1) == 0)
              && ((a5 & 1) != 0 || objc_msgSend(v16, "specialDeviceType") != 1)
              && objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DeviceUID")), "isEqualToString:", v16[10]))
            {
              if (objc_msgSend(v16, "specialDeviceType") == 2)
              {
                if (!a6)
                  goto LABEL_22;
              }
              else if (objc_msgSend(v16, "specialDeviceType") != 3 || (a6 & 1) == 0)
              {
LABEL_22:
                objc_msgSend(a2, "addObject:", v16);
                objc_msgSend(a1, "removeObjectAtIndex:", i);
                break;
              }
              if (fvd_deviceIsPresentInCameraList((uint64_t)v16, a7))
                goto LABEL_22;
            }
          }
        }
        result = objc_msgSend(a1, "count");
        if (!result)
          break;
        if (++v12 == v20)
        {
          result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v20 = result;
          if (result)
            goto LABEL_4;
          return result;
        }
      }
    }
  }
  return result;
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EE9E270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19EE9FB48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EE9FE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA01BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA0A2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA0B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA105C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA1340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA21E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA2388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA2C04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA34F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA3C84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA409C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA44FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA46AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA5388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  uint64_t v52;

  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA55F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA5948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA6314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA6BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA7938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA7A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA7B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA8638(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19EEA8A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEA9538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_19EEAA6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEAB748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fvd_deviceIsPresentInCameraList(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a2);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "objectForKeyedSubscript:", CFSTR("DeviceUID")), "isEqualToString:", *(_QWORD *)(a1 + 80)) & 1) != 0)return 1;
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

float AVGestaltGetFloatAnswer(uint64_t a1)
{
  void *v2;
  float result;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v2 = (void *)objc_msgSend((id)sAVGestaltFloatDataBase, "objectForKeyedSubscript:", a1);
  if (!v2)
    return NAN;
  objc_msgSend(v2, "floatValue");
  return result;
}

uint64_t AVGestaltGetStringAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  return objc_msgSend((id)sAVGestaltStringDataBase, "objectForKeyedSubscript:", a1);
}

uint64_t AVGestaltGetBoolAnswerWithError(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = objc_msgSend((id)sAVGestaltBoolDataBase, "objectForKeyedSubscript:", a1);
  v5 = (void *)v4;
  if (a2)
  {
    if (v4)
      v6 = 0;
    else
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    *a2 = v6;
  }
  return objc_msgSend(v5, "BOOLValue");
}

uint64_t AVGestaltGetIntegerAnswerWithError(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = objc_msgSend((id)sAVGestaltIntegerDataBase, "objectForKeyedSubscript:", a1);
  v5 = (void *)v4;
  if (a2)
  {
    if (v4)
      v6 = 0;
    else
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    *a2 = v6;
  }
  return objc_msgSend(v5, "integerValue");
}

uint64_t AVGestaltGetFloatAnswerWithError(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = objc_msgSend((id)sAVGestaltFloatDataBase, "objectForKeyedSubscript:", a1);
  v5 = (void *)v4;
  if (a2)
  {
    if (v4)
      v6 = 0;
    else
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    *a2 = v6;
  }
  return objc_msgSend(v5, "floatValue");
}

uint64_t AVGestaltGetStringAnswerWithError(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = objc_msgSend((id)sAVGestaltStringDataBase, "objectForKeyedSubscript:", a1);
  v5 = v4;
  if (a2)
  {
    if (v4)
      v6 = 0;
    else
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    *a2 = v6;
  }
  return v5;
}

uint64_t AVGestaltGetBoolAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v4 = (void *)objc_msgSend((id)sAVGestaltBoolDataBase, "objectForKeyedSubscript:", a1);
  if (v4)
    return objc_msgSend(v4, "BOOLValue");
  else
    return a2;
}

BOOL AVGestaltIsQuestionValid(uint64_t a1, int *a2)
{
  int v4;
  _BOOL8 result;
  uint64_t v6;
  BOOL v7;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  if (objc_msgSend((id)sAVGestaltBoolDataBase, "objectForKeyedSubscript:", a1))
  {
    v4 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend((id)sAVGestaltIntegerDataBase, "objectForKeyedSubscript:", a1))
  {
    v4 = 1;
LABEL_7:
    result = 1;
    if (!a2)
      return result;
    goto LABEL_8;
  }
  if (objc_msgSend((id)sAVGestaltFloatDataBase, "objectForKeyedSubscript:", a1))
  {
    result = 1;
    v4 = 2;
    if (!a2)
      return result;
LABEL_8:
    *a2 = v4;
    return result;
  }
  v6 = objc_msgSend((id)sAVGestaltStringDataBase, "objectForKeyedSubscript:", a1);
  v7 = v6 == 0;
  result = v6 != 0;
  if (v7)
    v4 = -1;
  else
    v4 = 3;
  if (a2)
    goto LABEL_8;
  return result;
}

uint64_t AVGestaltGetQuestions()
{
  void *v0;
  void *v1;
  void *v2;

  if (avgestalt_buildDataBase_onceToken != -1)
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  v0 = (void *)objc_msgSend((id)sAVGestaltBoolDataBase, "allKeys");
  v1 = (void *)objc_msgSend(v0, "arrayByAddingObjectsFromArray:", objc_msgSend((id)sAVGestaltIntegerDataBase, "allKeys"));
  v2 = (void *)objc_msgSend(v1, "arrayByAddingObjectsFromArray:", objc_msgSend((id)sAVGestaltFloatDataBase, "allKeys"));
  return objc_msgSend(v2, "arrayByAddingObjectsFromArray:", objc_msgSend((id)sAVGestaltStringDataBase, "allKeys"));
}

uint64_t AVCaptureDeferredPhotoIdentifierFromMakerNoteDictionary(void *a1)
{
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("25")), "unsignedIntValue");
  v3 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("32"));
  v4 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("43"));
  if ((v2 & 0x1000) == 0)
    return 0;
  if (!v3 || v4 == 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v4);
}

void sub_19EEAFF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *avcdpp_failureReasonStringForErrorStatus(int a1)
{
  if ((a1 + 16828) <= 8 && ((0x1DFu >> (a1 - 68)) & 1) != 0)
    return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (reason: %@)"), off_1E421D080[a1 + 16828]);
  else
    return &stru_1E421DB28;
}

void sub_19EEB0ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EEB12B0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

uint64_t ado_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "_handleNotification:payload:", a3, a5);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EEB72C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB73E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB750C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB7700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB7954(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB7B88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB7DC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB84AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB8920(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB8C14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEB8F18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t vpl_rectToString(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g,%g,%gx%g)"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

void sub_19EEBA52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

unint64_t avcmdo_addCMTimeToHistoryForDetector(void *a1, __int128 *a2, uint64_t a3)
{
  void *v6;
  unint64_t result;
  __int128 v8;
  uint64_t v9;

  v6 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:");
  if (!v6)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, a3);
  }
  v8 = *a2;
  v9 = *((_QWORD *)a2 + 2);
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v8));
  result = objc_msgSend(v6, "count");
  if (result >= 3)
    return objc_msgSend(v6, "removeObjectAtIndex:", 0);
  return result;
}

uint64_t avcmdo_nextTimeForDetector@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTimeEpoch epoch;
  CMTime v11;
  CMTime rhs;
  CMTime lhs;
  CMTime v14;
  CMTime v15;
  CMTime v16;

  v4 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(v4 + 16);
  v5 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  if (objc_msgSend(v5, "count") == 2)
  {
    memset(&v16, 0, sizeof(v16));
    v6 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    if (v6)
      objc_msgSend(v6, "CMTimeValue");
    else
      memset(&v16, 0, sizeof(v16));
    memset(&v15, 0, sizeof(v15));
    v8 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    if (v8)
      objc_msgSend(v8, "CMTimeValue");
    else
      memset(&v15, 0, sizeof(v15));
    memset(&v14, 0, sizeof(v14));
    lhs = v16;
    rhs = v15;
    CMTimeSubtract(&v14, &lhs, &rhs);
    rhs = v16;
    v11 = v14;
    CMTimeAdd(&lhs, &rhs, &v11);
    *(_OWORD *)a3 = *(_OWORD *)&lhs.value;
    epoch = lhs.epoch;
LABEL_14:
    *(_QWORD *)(a3 + 16) = epoch;
    return objc_msgSend(v5, "removeAllObjects");
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    memset(&v16, 0, sizeof(v16));
    v7 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    if (v7)
    {
      objc_msgSend(v7, "CMTimeValue");
      LODWORD(v7) = v16.timescale;
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
    }
    memset(&v15, 0, sizeof(v15));
    CMTimeMakeWithSeconds(&v15, 0.0333333333, (int32_t)v7);
    lhs = v16;
    rhs = v15;
    CMTimeAdd(&v14, &lhs, &rhs);
    *(_OWORD *)a3 = *(_OWORD *)&v14.value;
    epoch = v14.epoch;
    goto LABEL_14;
  }
  return objc_msgSend(v5, "removeAllObjects");
}

void sub_19EEBE730(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBEB88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBF3FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBF630(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EEBF6EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBFC30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBFDD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBFE30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBFE88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEBFEE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC03A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EEC0608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC07E0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19EEC0F80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC11A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC1210(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC3790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19EEC4150(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC44F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC47BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC4B3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC4BBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC4C0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC4F7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC515C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5364(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5524(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5770(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void AVCaptureSessionSetXCTestClientAuthorizedToStealDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;

  if ((AVCaptureIsRunningInXCTest() & 1) != 0)
  {
    if (a1)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 8) + 225) = 1;
      return;
    }
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    v4 = CFSTR("*** Can't pass a nil AVCaptureSession");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    v4 = CFSTR("*** Not supported when running outside of xctest");
  }
  v5 = (void *)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v5);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
}

void sub_19EEC5B34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5B94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5C94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5D84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC5FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EEC61F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCapturePrewarm(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = mach_absolute_time();
  v3 = mach_continuous_time();
  return AVCapturePrewarmWithTime(a1, v2, v3);
}

uint64_t AVCapturePrewarmWithTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("AVCapturePrewarmUserInteractionAbsoluteTimeKey");
  v6[1] = CFSTR("AVCapturePrewarmUserInteractionContinuousTimeKey");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  return AVCapturePrewarmWithOptions(a1, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
}

uint64_t AVCaptureSessionIsLaunchPrewarmingEnabled()
{
  if (AVCaptureSessionIsLaunchPrewarmingEnabled_onceToken != -1)
    dispatch_once(&AVCaptureSessionIsLaunchPrewarmingEnabled_onceToken, &__block_literal_global_687);
  return AVCaptureSessionIsLaunchPrewarmingEnabled_launchPrewarmingEnabled;
}

uint64_t __avcs_platformSupportsDeferredProcessing_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  avcs_platformSupportsDeferredProcessing_answer = result;
  return result;
}

void sub_19EEC6B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_19EEC765C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19EEC7838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t po_createPreviewJPEGRepresentationForSampleBuffer(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", &unk_1E424D2C0, *MEMORY[0x1E0D09378], a2, *MEMORY[0x1E0D093E0], 0);
  CMPhotoCompressionCreateDataContainerFromImage();
  return 0;
}

void sub_19EEC9804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EEC9F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19EECA40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EECA6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EECCA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t po_metadataWithMakerNoteProcessingFlags(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CBCF70];
  v2 = CFSTR("25");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

BOOL po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(void *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  if (!objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "livePhotoMovieEnabled"))
    return 1;
  v2 = objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "isEV0PhotoDeliveryEnabled");
  v3 = objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
  v4 = objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "livePhotoMovieFileURL");
  v5 = v4 != 0;
  if (v2)
  {
    v6 = v4;
    v7 = objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
    v8 = v6 ? 2 : 1;
    if (v7)
      v5 = v8;
  }
  if (v3)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
      ++v5;
    if (v2)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        ++v5;
      }
    }
  }
  v9 = (objc_msgSend(a1, "firedCallbackFlags") >> 7) & 1;
  v10 = ((objc_msgSend(a1, "firedCallbackFlags") >> 5) & 1) + v9;
  v11 = (objc_msgSend(a1, "firedCallbackFlags") >> 8) & 1;
  return v10 + v11 + ((objc_msgSend(a1, "firedCallbackFlags") >> 6) & 1) == v5;
}

uint64_t __po_photoSettingsAreValid_block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "flashMode")));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "HDRMode")));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "digitalFlashMode")));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
  return result;
}

AVCaptureReactionType _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType(uint64_t a1)
{
  AVCaptureReactionType *v1;
  AVCaptureReactionType result;

  switch(a1)
  {
    case 0:
      v1 = &AVCaptureReactionTypeConfetti;
      goto LABEL_11;
    case 1:
      v1 = &AVCaptureReactionTypeThumbsUp;
      goto LABEL_11;
    case 2:
      v1 = &AVCaptureReactionTypeThumbsDown;
      goto LABEL_11;
    case 3:
      v1 = &AVCaptureReactionTypeBalloons;
      goto LABEL_11;
    case 4:
      v1 = &AVCaptureReactionTypeFireworks;
      goto LABEL_11;
    case 5:
      v1 = &AVCaptureReactionTypeRain;
      goto LABEL_11;
    case 6:
      v1 = &AVCaptureReactionTypeHeart;
      goto LABEL_11;
    case 7:
      v1 = &AVCaptureReactionTypeLasers;
LABEL_11:
      result = *v1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void AVControlCenterModulesPrewarm()
{
  if (AVControlCenterModulesPrewarm_onceToken != -1)
    dispatch_once(&AVControlCenterModulesPrewarm_onceToken, &__block_literal_global_368);
}

__CFString *AVControlCenterPreferencesDomainForCurrentProcess()
{
  __CFString *v0;

  v0 = AVCaptureClientPreferencesDomain();
  return AVControlCenterPreferencesDomainForPreferencesDomain(v0);
}

uint64_t AVControlCenterAudioPreferencesKeyPrefix(__CFString *a1)
{
  uint64_t v1;

  if (!a1)
    a1 = CFSTR("unknown");
  v1 = -[__CFString stringByReplacingOccurrencesOfString:withString:](a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AUVoiceIOClients/%@/"), v1);
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a3), "setEnabled:forVideoEffect:", a2, a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t AVControlCenterVideoEffectsModulePerformReactionEffect(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "performReactionEffect:forCaptureDeviceWithID:", a1, objc_msgSend(a3, "uniqueID"));
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t AVControlCenterVideoEffectsModuleUpdateActiveReactions(uint64_t a1, CMTime *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime time;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = _AVControlCenterModuleStateForBundleID(a4);
  v10 = objc_msgSend(a5, "uniqueID");
  time = *a2;
  result = objc_msgSend(v9, "updateActiveReactions:currentRenderPTS:requestedTriggers:forCaptureDeviceWithID:", a1, &time, a3, v10);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t AVControlCenterVideoEffectsObserveGesturesDefaultDisabled(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];

  if (AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_onceToken != -1)
    dispatch_once(&AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_onceToken, &__block_literal_global_403);
  v2 = AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey();
  if (!a1)
    return +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver, v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke_2;
  v4[3] = &unk_1E421DB08;
  v4[4] = a1;
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver, v2, 0, v4);
}

uint64_t AVControlCenterIsManualFramingEnabledForDevice(void *a1)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingEnabledForDevice:", a1);
}

uint64_t AVControlCenterStartPanningAtPoint(void *a1, double a2, double a3)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "startPanningAtPoint:", a2, a3);
}

uint64_t AVControlCenterPanWithTranslation(void *a1, double a2, double a3)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "panWithTranslation:", a2, a3);
}

double AVControlCenterManualFramingMaxAvailableVideoZoomFactor(void *a1)
{
  uint64_t v1;
  double v2;
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(a1, "uniqueID");
  _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(v1, *MEMORY[0x1E0D03C98]);
  v3 = v2;
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;

  v3 = _AVControlCenterModuleStateForBundleID(a1);
  v4 = (void *)objc_msgSend(v3, "zoomFactorConstantsByManualFramingDeviceType");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v3, "manualFramingDeviceType"))), "objectForKeyedSubscript:", a2), "floatValue");
  return objc_msgSend(v3, "manualFramingDeviceType");
}

double AVControlCenterManualFramingMinAvailableVideoZoomFactor(void *a1)
{
  uint64_t v1;
  double v2;
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(a1, "uniqueID");
  _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(v1, *MEMORY[0x1E0D03CA0]);
  v3 = v2;
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t AVControlCenterManualFramingSetVideoZoomFactor(void *a1, double a2)
{
  id v4;
  double v5;
  double v6;
  double v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = _AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID"));
  v5 = AVControlCenterManualFramingMinAvailableVideoZoomFactor(a1);
  v6 = AVControlCenterManualFramingMaxAvailableVideoZoomFactor(a1);
  if (v5 > a2 || v6 < a2)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid videoZoomFactor %.3f. Valid range: [%.3f, %.3f]"), *(_QWORD *)&a2, *(_QWORD *)&v5, *(_QWORD *)&v6);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  if (objc_msgSend(v4, "manualFramingDeviceType", v6) == 2)
    v8 = a2 + a2;
  else
    v8 = a2;
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(v4, "setManualFramingOriginalZoomFactor:convertedZoomFactor:", a2, v8, v12, v13);
}

double AVControlCenterManualFramingGetVideoZoomFactor(void *a1)
{
  double v1;
  double v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingOriginalVideoZoomFactor");
  v2 = v1;
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterPerformOneShotFraming(void *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID", v4, v5)), "performOneShotFraming");
}

uint64_t AVControlCenterResetFraming(void *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID", v4, v5)), "resetFraming");
}

uint64_t AVControlCenterManualFramingIsAtDefaultForDevice(void *a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingIsAtDefault");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterCenterStageFieldOfViewRestrictedToWideForDevice(void *a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "centerStageFieldOfViewRestrictedToWide");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterCenterStageSetFieldOfViewRestrictedToWideForDevice(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a2, "uniqueID", v6, v7)), "setCenterStageFieldOfViewRestrictedToWide:", a1);
}

uint64_t AVControlCenterDeviceHasWideCamera()
{
  return 0;
}

uint64_t AVControlCenterDeviceHasUltraWideCamera()
{
  return 0;
}

uint64_t AVControlCenterGetManualFramingDeviceType(void *a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingDeviceType");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterSetManualFramingDeviceType(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a2, "uniqueID", v6, v7)), "setManualFramingDeviceType:", a1);
}

double AVControlCenterGetManualFramingDefaultZoomFactorForDevice()
{
  return 1.0;
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectIntensitySupportedForDevice(void *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur"))
    && (v22 = 0u,
        v23 = 0u,
        v20 = 0u,
        v21 = 0u,
        v4 = (void *)objc_msgSend(a2, "formats"),
        (v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16)) != 0))
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isBackgroundBlurApertureSupported") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v9 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (void *)objc_msgSend(a2, "formats", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "isStudioLightingIntensitySupported") & 1) != 0)
            return 1;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
  }
  return v9;
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "getEffectIntensityForVideoEffect:", a1);
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID(uint64_t a1, uint64_t a2, float a3)
{
  id v5;
  double v6;

  v5 = _AVControlCenterModuleStateForBundleID(a2);
  *(float *)&v6 = a3;
  return objc_msgSend(v5, "setEffectIntensityForVideoEffect:forVideoEffect:", a1, v6);
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "getEffectIntensityRangeForVideoEffect:", a1);
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "getEffectIntensityDefaultForVideoEffect:", a1);
}

uint64_t AVControlCenterBlackenFramesFromDeviceForBundleID(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(a3), "enableBlackenFrames:forDeviceUID:", a1, objc_msgSend(a2, "uniqueID"));
}

uint64_t AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "supportedMicrophoneModes");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetMicrophoneModeForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "microphoneMode");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "activeMicrophoneMode");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetHiddenMicrophoneModesForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "hiddenMicrophoneModes");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "setMicrophoneMode:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "voiceProcessingBypassed");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleIsAutoSupportedForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "isAutoMicrophoneModeSupported");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a1), "isAutoMicrophoneModeEnabled");
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "setAutoMicrophoneModeEnabled:", a1);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

void fad_figCaptureSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFRunLoop *Main;
  __CFRunLoop *v6;
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __fad_figCaptureSourceNotificationHandler_block_invoke;
  block[3] = &unk_1E4216898;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
  v6 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v6);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __fad_figCaptureSourceNotificationHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNotification:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void getUISSystemReferenceAngleChangedNotification_cold_1()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getUISSystemReferenceAngleChangedNotification(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AVCaptureDeviceRotationCoordinator.m"), 47, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

void UIKitServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UIKitServicesLibrary(void)"), CFSTR("AVCaptureDeviceRotationCoordinator.m"), 45, CFSTR("%s"), *a1);
  __break(1u);
}

void __getFBSOrientationObserverClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)"), CFSTR("AVCaptureDeviceRotationCoordinator.m"), 41, CFSTR("%s"), *a1);
  __break(1u);
}

void __getFBSOrientationObserverClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBSOrientationObserverClass(void)_block_invoke"), CFSTR("AVCaptureDeviceRotationCoordinator.m"), 42, CFSTR("Unable to find class %s"), "FBSOrientationObserver");
  __break(1u);
}

void __getADJasperPointCloudClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleDepthLibrary(void)"), CFSTR("AVPointCloudData.m"), 26, CFSTR("%s"), *a1);
  __break(1u);
}

void __getADJasperPointCloudClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getADJasperPointCloudClass(void)_block_invoke"), CFSTR("AVPointCloudData.m"), 28, CFSTR("Unable to find class %s"), "ADJasperPointCloud");
  __break(1u);
}

void __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CMContinuityCaptureCoreLibrary(void)"), CFSTR("AVCaptureDevice.m"), 75, CFSTR("%s"), *a1);
  __break(1u);
}

void __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCMContinuityCaptureCapabilitiesClass(void)_block_invoke"), CFSTR("AVCaptureDevice.m"), 76, CFSTR("Unable to find class %s"), "CMContinuityCaptureCapabilities");
  __break(1u);
}

uint64_t AVErrorForClientProgrammingError()
{
  return MEMORY[0x1E0CF2A78]();
}

uint64_t AVLocalizedError()
{
  return MEMORY[0x1E0CF2B40]();
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatus()
{
  return MEMORY[0x1E0CF2B48]();
}

uint64_t AVLocalizedStringFromTable()
{
  return MEMORY[0x1E0CF2B50]();
}

uint64_t AVLocalizedStringFromTableWithBundleIdentifier()
{
  return MEMORY[0x1E0CF2B58]();
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CF2B60]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t AVMethodExceptionReasonWithClassAndSelector()
{
  return MEMORY[0x1E0CF2C00]();
}

uint64_t AVMethodExceptionReasonWithObjectAndSelector()
{
  return MEMORY[0x1E0CF2C08]();
}

uint64_t AVOSTypeForString()
{
  return MEMORY[0x1E0CF2C10]();
}

uint64_t AVRequestConcreteImplementation()
{
  return MEMORY[0x1E0CF2C20]();
}

uint64_t AVRequireConcreteObject()
{
  return MEMORY[0x1E0CF2C28]();
}

uint64_t AVStringForOSType()
{
  return MEMORY[0x1E0CF2C30]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
  MEMORY[0x1E0C92148](*(_QWORD *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
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

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1E0CBC2C8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC390](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC418](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1E0CBC448](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC450](xmlns, prefix, name, *(_QWORD *)&type, value);
}

CGImageMetadataType CGImageMetadataTagGetType(CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC458](tag);
}

CFTypeID CGImageMetadataTagGetTypeID(void)
{
  return MEMORY[0x1E0CBC460]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1E0C9EAA0](desc, sizeOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1E0C9ED40]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1E0C9ED48](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9ED80](allocator, target, *(_QWORD *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDE0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE70](allocator, sourceDescription, otherSourceDescription, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE90](allocator, *(_QWORD *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1E0C9EEC8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1E0C9EED0]();
}

uint64_t CMPhotoCompressionCreateDataContainerFromImage()
{
  return MEMORY[0x1E0D08B80]();
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1E0D08B98]();
}

uint64_t CMPhotoCompressionSessionAddMetadataFromImageProperties()
{
  return MEMORY[0x1E0D08C10]();
}

uint64_t CMPhotoCompressionSessionAddThumbnail()
{
  return MEMORY[0x1E0D08C18]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1E0D08C38]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1E0D08C40]();
}

uint64_t CMPhotoCompressionSessionInvalidate()
{
  return MEMORY[0x1E0D08C68]();
}

uint64_t CMPhotoCompressionSessionOpenExistingContainerForModification()
{
  return MEMORY[0x1E0D08C88]();
}

uint64_t CMPhotoDNGCompressorAddAuxiliaryImage()
{
  return MEMORY[0x1E0D08CD8]();
}

uint64_t CMPhotoDNGCompressorCreateFromSourceDNGWithModificationHandler()
{
  return MEMORY[0x1E0D08CF0]();
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateData()
{
  return MEMORY[0x1E0D08CF8]();
}

uint64_t CMPhotoDNGCompressorReplaceMainImageOptions()
{
  return MEMORY[0x1E0D08D20]();
}

uint64_t CMPhotoDNGCompressorReplaceMainImageProperties()
{
  return MEMORY[0x1E0D08D28]();
}

uint64_t CMPhotoDNGCompressorSetCompressedPreviewImage()
{
  return MEMORY[0x1E0D08D30]();
}

uint64_t CMPhotoDNGCompressorSetPreviewImage()
{
  return MEMORY[0x1E0D08D40]();
}

uint64_t CMPhotoDNGCompressorSetPreviewImageFromRAW()
{
  return MEMORY[0x1E0D08D48]();
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBuffer()
{
  return MEMORY[0x1E0D08D68]();
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBufferAndAuxiliaryImage()
{
  return MEMORY[0x1E0D08D70]();
}

uint64_t CMPhotoDNGUnpack()
{
  return MEMORY[0x1E0D08D88]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageMetadataForIndex()
{
  return MEMORY[0x1E0D08DB8]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndex()
{
  return MEMORY[0x1E0D08DD0]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1E0D08E48]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex()
{
  return MEMORY[0x1E0D08ED8]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageTypeForIndex()
{
  return MEMORY[0x1E0D08F00]();
}

uint64_t CMPhotoDecompressionContainerGetImageCount()
{
  return MEMORY[0x1E0D08F20]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1E0D08FE0]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1E0D08FE8]();
}

uint64_t CMPhotoDetermineMIAFCompliantThumbnailMaxPixelSize()
{
  return MEMORY[0x1E0D09090]();
}

uint64_t CMPointCloudFormatDescriptionGetNumberOfPoints()
{
  return MEMORY[0x1E0C9EF00]();
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
  MEMORY[0x1E0C9EF18](target, key);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF58](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1E0C9F048]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0C8](target, key, value, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F528](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

uint64_t CVDataBufferGetPixelFormatType()
{
  return MEMORY[0x1E0CA8998]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8BA8](pool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t ErrorIsAVFoundationError()
{
  return MEMORY[0x1E0CF2D10]();
}

uint64_t FigAudioSessionClockCreateForAVAudioSession()
{
  return MEMORY[0x1E0CC27D0]();
}

uint64_t FigBoxedMetadataAppendCFTypedValue()
{
  return MEMORY[0x1E0C9F888]();
}

uint64_t FigBoxedMetadataAppendFloat32()
{
  return MEMORY[0x1E0C9F8A8]();
}

uint64_t FigBoxedMetadataAppendSInt32()
{
  return MEMORY[0x1E0C9F8B0]();
}

uint64_t FigBoxedMetadataAppendValue()
{
  return MEMORY[0x1E0C9F8B8]();
}

uint64_t FigBoxedMetadataCreateForConstruction()
{
  return MEMORY[0x1E0C9F8C8]();
}

uint64_t FigBoxedMetadataEndConstruction()
{
  return MEMORY[0x1E0C9F8D8]();
}

uint64_t FigBoxedMetadataGetBlockBuffer()
{
  return MEMORY[0x1E0C9F8E0]();
}

uint64_t FigBoxedMetadataGetFormatDescription()
{
  return MEMORY[0x1E0C9F8E8]();
}

uint64_t FigBoxedMetadataGetLocalIDOfItemAtIndex()
{
  return MEMORY[0x1E0C9F8F0]();
}

uint64_t FigBoxedMetadataGetNumberOfItems()
{
  return MEMORY[0x1E0C9F8F8]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndex()
{
  return MEMORY[0x1E0C9F910]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndexAsFloat32()
{
  return MEMORY[0x1E0C9F918]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndexAsSInt32()
{
  return MEMORY[0x1E0C9F920]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1E0C9FC00]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1E0C9FD10]();
}

uint64_t FigCFNumberGetSInt64()
{
  return MEMORY[0x1E0C9FD98]();
}

uint64_t FigCaptureCameraRequires180DegreesRotation()
{
  return MEMORY[0x1E0D03970]();
}

uint64_t FigCaptureCompressedPixelFormatForPixelFormat()
{
  return MEMORY[0x1E0D03978]();
}

uint64_t FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm()
{
  return MEMORY[0x1E0D03980]();
}

uint64_t FigCaptureDeferredPhotoProcessorRemoteCopyPhotoProcessor()
{
  return MEMORY[0x1E0D03988]();
}

uint64_t FigCaptureFirmwareToNVMExtrinsicMatrixTransform()
{
  return MEMORY[0x1E0D03990]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x1E0D03998]();
}

uint64_t FigCaptureGetTCCServer()
{
  return MEMORY[0x1E0D039A0]();
}

uint64_t FigCapturePixelFormatBytesPerPixel()
{
  return MEMORY[0x1E0D039A8]();
}

uint64_t FigCapturePixelFormatIs420()
{
  return MEMORY[0x1E0D039B0]();
}

uint64_t FigCapturePixelFormatIs422()
{
  return MEMORY[0x1E0D039B8]();
}

uint64_t FigCapturePixelFormatIsTenBit()
{
  return MEMORY[0x1E0D039C0]();
}

uint64_t FigCapturePlatformIdentifier()
{
  return MEMORY[0x1E0D039C8]();
}

uint64_t FigCapturePlatformMountsCamerasInLandscapeOrientation()
{
  return MEMORY[0x1E0D039D0]();
}

uint64_t FigCapturePlatformSupportsExclaves()
{
  return MEMORY[0x1E0D039D8]();
}

uint64_t FigCapturePlatformSupportsHTPC16x8Compression()
{
  return MEMORY[0x1E0D039E0]();
}

uint64_t FigCapturePlatformSupportsUniversalCompression()
{
  return MEMORY[0x1E0D039E8]();
}

uint64_t FigCapturePlatformSupportsUniversalLossyCompression()
{
  return MEMORY[0x1E0D039F0]();
}

uint64_t FigCaptureSessionCreate()
{
  return MEMORY[0x1E0D039F8]();
}

uint64_t FigCaptureSessionRemoteCancelPrewarm()
{
  return MEMORY[0x1E0D03A00]();
}

uint64_t FigCaptureSessionRemoteCreate()
{
  return MEMORY[0x1E0D03A08]();
}

uint64_t FigCaptureSessionRemotePrewarmWithOptions()
{
  return MEMORY[0x1E0D03A10]();
}

uint64_t FigCaptureSourceCopySources()
{
  return MEMORY[0x1E0D03A18]();
}

uint64_t FigCaptureSourceGetMediaTypeForUniqueID()
{
  return MEMORY[0x1E0D03A20]();
}

uint64_t FigCaptureSourceRemoteBeginGeneratingConnectionDiedNotifications()
{
  return MEMORY[0x1E0D03A28]();
}

uint64_t FigCaptureSourceRemoteCopyCaptureSources()
{
  return MEMORY[0x1E0D03A30]();
}

uint64_t FigCaptureSourceRemoteCopyProxySource()
{
  return MEMORY[0x1E0D03A38]();
}

uint64_t FigCaptureSourceRemoteMaxStillImageJPEGDataSize()
{
  return MEMORY[0x1E0D03A40]();
}

uint64_t FigCaptureSourceRemoteShowSystemUserInterface()
{
  return MEMORY[0x1E0D03A48]();
}

uint64_t FigCaptureTCCAccessPreflight()
{
  return MEMORY[0x1E0D03A60]();
}

uint64_t FigCaptureTCCAccessRequest()
{
  return MEMORY[0x1E0D03A68]();
}

uint64_t FigCaptureTransformExtrinsicMatrix()
{
  return MEMORY[0x1E0D03A70]();
}

uint64_t FigCaptureUncompressedPixelFormatForPixelFormat()
{
  return MEMORY[0x1E0D03A78]();
}

uint64_t FigCaptureVideoStabilizationStrengthToString()
{
  return MEMORY[0x1E0D03A80]();
}

uint64_t FigConsolidateMovieFragments()
{
  return MEMORY[0x1E0CC2918]();
}

uint64_t FigCopyBacktrace()
{
  return MEMORY[0x1E0CA01B0]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x1E0CA04E0]();
}

uint64_t FigDepthConvertBuffer()
{
  return MEMORY[0x1E0D03AB0]();
}

uint64_t FigDepthRotateBuffer()
{
  return MEMORY[0x1E0D03AB8]();
}

uint64_t FigDepthRotateCalibrationData()
{
  return MEMORY[0x1E0D03AC0]();
}

uint64_t FigExternalStorageDeviceManagerRemoteCreate()
{
  return MEMORY[0x1E0D03AC8]();
}

uint64_t FigExternalStorageDeviceManagerRemoteSupported()
{
  return MEMORY[0x1E0D03AD0]();
}

uint64_t FigFileIsFileOnExternalStorageDevice()
{
  return MEMORY[0x1E0CA08C8]();
}

uint64_t FigFlashlightCreate()
{
  return MEMORY[0x1E0D03AD8]();
}

uint64_t FigFlashlightRemoteCreate()
{
  return MEMORY[0x1E0D03AE0]();
}

uint64_t FigFlatDictionaryGetMakerNoteKeySpace()
{
  return MEMORY[0x1E0D03AE8]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1E0CA0A58]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1E0CA0A70]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x1E0CA0AE0]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x1E0CA0AE8]();
}

uint64_t FigHostTimeToNanoseconds()
{
  return MEMORY[0x1E0CA0CD8]();
}

uint64_t FigLocalQueueSetReceiverHandler()
{
  return MEMORY[0x1E0D03B08]();
}

uint64_t FigLocalQueueUnsetReceiverHandler()
{
  return MEMORY[0x1E0D03B10]();
}

uint64_t FigMetadataFormatDescriptionGetIdentifierForLocalID()
{
  return MEMORY[0x1E0CA0E78]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1E0CA0E88]();
}

uint64_t FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray()
{
  return MEMORY[0x1E0CC2BD0]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1E0CA0F80]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x1E0CA1028]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1E0CA11D0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1E0CA11D8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1E0CA11E0]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1E0CA11F0]();
}

uint64_t FigRemoteOperationReceiverCreateMessageReceiver()
{
  return MEMORY[0x1E0D03B18]();
}

uint64_t FigRemoteQueueReceiverSetHandler()
{
  return MEMORY[0x1E0D03B30]();
}

uint64_t FigRemoteQueueReceiverUnsetHandler()
{
  return MEMORY[0x1E0D03B38]();
}

uint64_t FigRewriteMetadata()
{
  return MEMORY[0x1E0CC2F98]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1E0CA1550]();
}

uint64_t FigSimpleMutexCheckIsLockedOnThisThread()
{
  return MEMORY[0x1E0CA1560]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1E0CA1570]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1E0CA1578]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1E0CA1580]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1E0CA1590]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1E0CA1810]();
}

uint64_t FigVirtualCaptureCardGetCMBaseObject()
{
  return MEMORY[0x1E0CA1A78]();
}

uint64_t FigVirtualCaptureCardRemoteCreate()
{
  return MEMORY[0x1E0CA1A88]();
}

uint64_t FigVirtualCaptureCardRemoteSupported()
{
  return MEMORY[0x1E0CA1A90]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x1E0D83330]();
}

uint64_t MRCDescriptorDecodePayload()
{
  return MEMORY[0x1E0D83338]();
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1E0CECCD8](allocator, pixelRotationSessionOut);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _FigIsCurrentDispatchQueue()
{
  return MEMORY[0x1E0CA1F40]();
}

uint64_t _FigIsNotCurrentDispatchQueue()
{
  return MEMORY[0x1E0CA1F48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1E0CA1F60]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1E0CA1F68]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x1E0CA1F70]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x1E0CA1F88]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

