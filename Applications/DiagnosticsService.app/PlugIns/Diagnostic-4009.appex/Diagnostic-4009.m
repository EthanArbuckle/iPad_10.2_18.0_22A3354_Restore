void sub_1000051CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;

  v9 = objc_autoreleasePoolPush();
  objc_msgSend(a2, "_receivedNotification:notificationObject:notificationPayload:", a3, a4, a5);
  objc_autoreleasePoolPop(v9);
}

void sub_1000054E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000054F8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (CFStringCompare(*(CFStringRef *)(a1 + 40), kFigCaptureStreamNotification_StreamStarted, 0))
  {
    if (CFStringCompare(*(CFStringRef *)(a1 + 40), kFigCaptureStreamNotification_StreamStopped, 0) == kCFCompareEqualTo)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "streamStopSemaphore"));

      if (v2)
      {
        v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "streamStopSemaphore"));
LABEL_7:
        v5 = v3;
        dispatch_semaphore_signal(v3);

      }
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "streamStartSemaphore"));

    if (v4)
    {
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "streamStartSemaphore"));
      goto LABEL_7;
    }
  }

}

void sub_100005714(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005884(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char **sub_100005994()
{
  char **v0;
  const char *v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  const char *v4;

  v0 = off_1000160A0;
  v1 = off_1000160A0[0];
  while (1)
  {
    if (!v1)
      goto LABEL_5;
    v2 = IOServiceMatching(v1);
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
    if (MatchingService)
      break;
    v4 = v0[5];
    v0 += 5;
    v1 = v4;
    if (!v4)
    {
LABEL_5:
      v1 = 0;
      if (!v0[1])
      {
        v1 = 0;
        if (!v0[2])
        {
          v1 = 0;
          if (!*((_DWORD *)v0 + 6))
            return v0;
        }
      }
    }
  }
  IOObjectRelease(MatchingService);
  return v0;
}

void sub_100005B14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005C18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000062B0(id a1, NSString *a2, OSDCaptureStream *a3, BOOL *a4)
{
  -[OSDCaptureStream teardown](a3, "teardown");
}

id sub_10000650C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "runCameraTest");
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void sub_100007460(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  unsigned int v4;

  objc_msgSend(*(id *)(a1 + 32), "setSoloFrameCount:", objc_msgSend(*(id *)(a1 + 32), "soloFrameCount") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "soloFrameCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v4 = objc_msgSend(v3, "framesToSample");

  if (v2 == v4)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000077C8(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  unsigned int v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlphaSyncFrameCount:", objc_msgSend(*(id *)(a1 + 32), "alphaSyncFrameCount") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "alphaSyncFrameCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v4 = objc_msgSend(v3, "framesToSample");

  if (v2 == v4)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100007848(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  unsigned int v4;

  objc_msgSend(*(id *)(a1 + 32), "setBravoSyncFrameCount:", objc_msgSend(*(id *)(a1 + 32), "bravoSyncFrameCount") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "bravoSyncFrameCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v4 = objc_msgSend(v3, "framesToSample");

  if (v2 == v4)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100007A70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000083B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008608(id a1)
{
  OSDCameraCenter *v1;
  void *v2;
  OSDCaptureDevice *v3;

  v1 = objc_opt_new(OSDCameraCenter);
  v2 = (void *)qword_1000163A8;
  qword_1000163A8 = (uint64_t)v1;

  v3 = objc_alloc_init(OSDCaptureDevice);
  objc_msgSend((id)qword_1000163A8, "setDevice:", v3);

}

void sub_10000904C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000090D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009B74(uint64_t a1, uint64_t a2, __int128 *a3)
{
  id WeakRetained;
  __int128 v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = *a3;
  v7 = *((_QWORD *)a3 + 2);
  objc_msgSend(WeakRetained, "_receivedPixelBuffer:time:", a2, &v6);

}

void sub_100009BD0(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  id WeakRetained;
  __int128 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  objc_msgSend(WeakRetained, "_receivedEvent:timestamp:info:", a2, &v8, a4);

}

void sub_10000A050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_10000A08C(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "doubleValue");
  if (v5 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v7, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }

}

void sub_10000A44C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_processBuffer:", *(_QWORD *)(a1 + 40));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
}

void sub_10000A914()
{
  __assert_rtn("-[OSDCaptureStream initWithStream:]", "OSDCaptureDevice.m", 219, "stream != NULL");
}

void sub_10000A93C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A70((void *)&_mh_execute_header, a2, a3, "Failed with error: %@", a5, a6, a7, a8, 2u);
  sub_100007A80();
}

void sub_10000A9A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A70((void *)&_mh_execute_header, a2, a3, "Unable to get supported camera formats to validate minimum framerate support with error: %@", a5, a6, a7, a8, 2u);
  sub_100007A80();
}

void sub_10000AA08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A70((void *)&_mh_execute_header, a2, a3, "Requested minimum framerate %@ is not supported by this camera. Unable to proceed", a5, a6, a7, a8, 2u);
  sub_100007A80();
}

void sub_10000AA6C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A70((void *)&_mh_execute_header, a2, a3, "NSError variable was nil.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

void sub_10000AAD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A70((void *)&_mh_execute_header, a2, a3, "NSError variable was previously assigned.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend__backCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_backCamera:");
}

id objc_msgSend__checkProtocol_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkProtocol:error:");
}

id objc_msgSend__checkProtocol_obj_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkProtocol:obj:error:");
}

id objc_msgSend__enableMotionDataMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableMotionDataMetadata:error:");
}

id objc_msgSend__enableMultiVideoOutput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableMultiVideoOutput:error:");
}

id objc_msgSend__frameCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frameCounter");
}

id objc_msgSend__frontCameraWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frontCameraWithDevice:error:");
}

id objc_msgSend__frontSuperWideCameraWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frontSuperWideCameraWithDevice:error:");
}

id objc_msgSend__getStreamErrorFor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getStreamErrorFor:error:");
}

id objc_msgSend__imageQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageQueue");
}

id objc_msgSend__processBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processBuffer:");
}

id objc_msgSend__rearSuperWideCameraWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rearSuperWideCameraWithDevice:error:");
}

id objc_msgSend__receivedEvent_timestamp_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedEvent:timestamp:info:");
}

id objc_msgSend__receivedNotification_notificationObject_notificationPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedNotification:notificationObject:notificationPayload:");
}

id objc_msgSend__receivedPixelBuffer_time_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedPixelBuffer:time:");
}

id objc_msgSend__registerForStreamNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerForStreamNotifications:");
}

id objc_msgSend__setStreamHandlers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setStreamHandlers:error:");
}

id objc_msgSend__showFrameOnPreviewLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showFrameOnPreviewLayer:");
}

id objc_msgSend__startStreaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startStreaming:");
}

id objc_msgSend__telephotoCameraWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_telephotoCameraWithDevice:error:");
}

id objc_msgSend__unregisterForStreamNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unregisterForStreamNotifications:");
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate:");
}

id objc_msgSend_alphaCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphaCamera");
}

id objc_msgSend_alphaSyncFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphaSyncFrameCount");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attentionDetectionSetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attentionDetectionSetting");
}

id objc_msgSend_backCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backCamera");
}

id objc_msgSend_backingCopyProperty_dest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backingCopyProperty:dest:");
}

id objc_msgSend_backingRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backingRef");
}

id objc_msgSend_backingSetProperty_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backingSetProperty:value:");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "begin");
}

id objc_msgSend_bravoCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bravoCamera");
}

id objc_msgSend_bravoSyncFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bravoSyncFrameCount");
}

id objc_msgSend_cameraForSource_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraForSource:error:");
}

id objc_msgSend_cameraImp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraImp");
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDevice");
}

id objc_msgSend_captureStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStream");
}

id objc_msgSend_captureStreamForPortType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStreamForPortType:error:");
}

id objc_msgSend_checkProtocol_obj_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkProtocol:obj:error:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyProperty_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyProperty:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRef");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAttentionDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAttentionDetection");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_inSet_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:inSet:failed:");
}

id objc_msgSend_doneWithDeviceAndStreams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithDeviceAndStreams");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableAgileClocking_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableAgileClocking:error:");
}

id objc_msgSend_enableCameraMaxDataRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCameraMaxDataRate:error:");
}

id objc_msgSend_enableCameraTestPatternPN9_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCameraTestPatternPN9:error:");
}

id objc_msgSend_enableMaxDataRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMaxDataRate");
}

id objc_msgSend_enableTestPatternPN9(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTestPatternPN9");
}

id objc_msgSend_enableTestPatternPN9_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTestPatternPN9:error:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorCountForType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorCountForType:error:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_formatIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatIndex");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameCount");
}

id objc_msgSend_frameHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameHandler");
}

id objc_msgSend_frameSampleTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameSampleTimeout");
}

id objc_msgSend_framesToSample(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "framesToSample");
}

id objc_msgSend_frontCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontCamera");
}

id objc_msgSend_getDeviceAndStreams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceAndStreams:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_implementorActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "implementorActive:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCaptureDevice_cameraSource_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureDevice:cameraSource:error:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStream:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStreaming");
}

id objc_msgSend_ispVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ispVersion");
}

id objc_msgSend_minimumFrameRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumFrameRate");
}

id objc_msgSend_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_owners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "owners");
}

id objc_msgSend_portToStreamMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portToStreamMap");
}

id objc_msgSend_previewLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewLayer");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_runCameraTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runCameraTest");
}

id objc_msgSend_setAlphaCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlphaCamera:");
}

id objc_msgSend_setAlphaSyncFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlphaSyncFrameCount:");
}

id objc_msgSend_setAttentionDetectionSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttentionDetectionSetting:");
}

id objc_msgSend_setBackCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackCamera:");
}

id objc_msgSend_setBravoCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBravoCamera:");
}

id objc_msgSend_setBravoSyncFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBravoSyncFrameCount:");
}

id objc_msgSend_setBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuffer:");
}

id objc_msgSend_setCameraMinimumFrameRate_frameRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraMinimumFrameRate:frameRate:error:");
}

id objc_msgSend_setCameraProperties_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraProperties:error:");
}

id objc_msgSend_setCaptureStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureStream:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setEnableMaxDataRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableMaxDataRate:");
}

id objc_msgSend_setEnableTestPatternPN9_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableTestPatternPN9:");
}

id objc_msgSend_setError_withDomain_withCode_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:withDomain:withCode:format:");
}

id objc_msgSend_setFormatIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatIndex:");
}

id objc_msgSend_setFormatIndex_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatIndex:error:");
}

id objc_msgSend_setFrameHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameHandler:");
}

id objc_msgSend_setFrameRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameRate:error:");
}

id objc_msgSend_setFrameSampleTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameSampleTimeout:");
}

id objc_msgSend_setFramesToSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFramesToSample:");
}

id objc_msgSend_setFrontCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontCamera:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsStreaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsStreaming:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMinimumFrameRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumFrameRate:");
}

id objc_msgSend_setMinimumFrameRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumFrameRate:error:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOwners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwners:");
}

id objc_msgSend_setPreviewLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewLayer:");
}

id objc_msgSend_setProperty_BOOLean_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:BOOLean:error:");
}

id objc_msgSend_setProperty_number_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:number:error:");
}

id objc_msgSend_setProperty_value_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:value:error:");
}

id objc_msgSend_setSoloFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoloFrameCount:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStreamStartSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamStartSemaphore:");
}

id objc_msgSend_setStreamStopSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamStopSemaphore:");
}

id objc_msgSend_setStreamTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamTime:");
}

id objc_msgSend_setStreamingOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamingOptions:");
}

id objc_msgSend_setTelephotoCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelephotoCamera:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_frameCounter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_frameCounter:");
}

id objc_msgSend_setupCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCaptureDevice:");
}

id objc_msgSend_setupCaptureStreams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCaptureStreams:");
}

id objc_msgSend_sharedCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCenter");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_soloFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soloFrameCount");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_start_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start:");
}

id objc_msgSend_startStreamingWithOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStreamingWithOptions:error:");
}

id objc_msgSend_stop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop:");
}

id objc_msgSend_stopStreaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopStreaming:");
}

id objc_msgSend_streamCamera_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamCamera:error:");
}

id objc_msgSend_streamRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamRef");
}

id objc_msgSend_streamStartSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamStartSemaphore");
}

id objc_msgSend_streamStopSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamStopSemaphore");
}

id objc_msgSend_streamTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamTime");
}

id objc_msgSend_streamingOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamingOptions");
}

id objc_msgSend_supportedFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedFormats:");
}

id objc_msgSend_syncAndStreamCameras_bravo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncAndStreamCameras:bravo:error:");
}

id objc_msgSend_syncCameras_slave_skipSlaveFrames_enableSlaveOutput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCameras:slave:skipSlaveFrames:enableSlaveOutput:error:");
}

id objc_msgSend_syncSlave_skipFrames_enableOutput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSlave:skipFrames:enableOutput:error:");
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardown");
}

id objc_msgSend_telephotoCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephotoCamera");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_useMaxAvailableDataRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useMaxAvailableDataRate:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}
