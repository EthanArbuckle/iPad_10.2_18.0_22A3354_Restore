void sub_1DB284258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *_notificationRegistrationDebugErrorString(int a1)
{
  const __CFString *result;

  result = CFSTR("OK");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("INVALID_NAME");
      break;
    case 2:
      result = CFSTR("INVALID_TOKEN");
      break;
    case 3:
      result = CFSTR("INVALID_PORT");
      break;
    case 4:
      result = CFSTR("INVALID_FILE");
      break;
    case 5:
      result = CFSTR("INVALID_SIGNAL");
      break;
    case 6:
      result = CFSTR("INVALID_REQUEST");
      break;
    case 7:
      result = CFSTR("NOT_AUTHORIZED");
      break;
    default:
      if (a1 == 1000000)
        result = CFSTR("FAILED");
      else
        result = CFSTR("UNKNOWN");
      break;
  }
  return result;
}

void sub_1DB2847B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB284998(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB28626C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2869A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB286D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB286E20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB289E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB28A70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DB28B588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB28D660(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    v10 = *(NSObject **)(v9 + 536);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BKUICurvesView parser:didStartElement:namespaceURI:qualifiedName:attributes:].cold.1(a9, v10, v11, v12, v13, v14, v15, v16);
    objc_end_catch();
    JUMPOUT(0x1DB28D618);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1DB291230(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

id getBYFlowSkipControllerClass()
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
  v0 = (void *)getBYFlowSkipControllerClass_softClass;
  v7 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBYFlowSkipControllerClass_block_invoke;
    v3[3] = &unk_1EA27FEE8;
    v3[4] = &v4;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB29145C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBYFlowSkipIdentifierFaceID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *BYFlowSkipIdentifierFaceID_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr;
  v7 = getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr)
  {
    v1 = (void *)SetupAssistantLibrary();
    v0 = (id *)dlsym(v1, "BYFlowSkipIdentifierFaceID");
    v5[3] = (uint64_t)v0;
    getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    BYFlowSkipIdentifierFaceID_cold_1 = (_Unwind_Exception *)getBYFlowSkipIdentifierFaceID_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(BYFlowSkipIdentifierFaceID_cold_1);
  }
  return *v0;
}

void sub_1DB291FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v13 - 152));
  _Unwind_Resume(a1);
}

void sub_1DB292A74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;
  id *v3;

  v3 = v1;
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DB292EB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB293664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  SetupAssistantLibrary();
  result = objc_getClass("BYFlowSkipController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
  getBYFlowSkipControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id _BKUILoggingFacility()
{
  if (_BKUILoggingFacility_onceToken != -1)
    dispatch_once(&_BKUILoggingFacility_onceToken, &__block_literal_global_1);
  return (id)_BKUILoggingFacility_oslog;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1DB2980B0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 128));
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1DB298A68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DB298F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initBKDevice()
{
  Class result;

  if (BiometricKitLibrary_sOnce != -1)
    dispatch_once(&BiometricKitLibrary_sOnce, &__block_literal_global_2);
  result = objc_getClass("BKDevice");
  classBKDevice = (uint64_t)result;
  getBKDeviceClass_0 = (uint64_t (*)())BKDeviceFunction;
  return result;
}

id BKDeviceFunction()
{
  return (id)classBKDevice;
}

Class initBKDeviceDescriptor()
{
  Class result;

  if (BiometricKitLibrary_sOnce != -1)
    dispatch_once(&BiometricKitLibrary_sOnce, &__block_literal_global_2);
  result = objc_getClass("BKDeviceDescriptor");
  classBKDeviceDescriptor = (uint64_t)result;
  getBKDeviceDescriptorClass_0 = (uint64_t (*)())BKDeviceDescriptorFunction;
  return result;
}

id BKDeviceDescriptorFunction()
{
  return (id)classBKDeviceDescriptor;
}

Class initSFClient()
{
  Class result;

  if (SharingLibrary_sOnce != -1)
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global_365);
  result = objc_getClass("SFClient");
  classSFClient = (uint64_t)result;
  getSFClientClass = (uint64_t (*)())SFClientFunction;
  return result;
}

id SFClientFunction()
{
  return (id)classSFClient;
}

Class initLAContext()
{
  Class result;

  if (LocalAuthenticationLibrary_sOnce != -1)
    dispatch_once(&LocalAuthenticationLibrary_sOnce, &__block_literal_global_368);
  result = objc_getClass("LAContext");
  classLAContext = (uint64_t)result;
  getLAContextClass = (uint64_t (*)())LAContextFunction;
  return result;
}

id LAContextFunction()
{
  return (id)classLAContext;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_7(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

void sub_1DB2A4A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _initalInterfaceOrientationFor(int a1, uint64_t a2)
{
  int64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", 0);
  result = objc_msgSend(MEMORY[0x1E0CEABB8], "bkui_reverseLeftRight:", v4);
  if (a2)
    v6 = a2;
  else
    v6 = result;
  if (a1)
    return v6;
  return result;
}

void _layoutNavigationBarCopy(void *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a1;
  objc_msgSend(a2, "size");
  v4 = v3;
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v4, v5);

}

void sub_1DB2A58C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1DB2A5D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getBKDeviceClass()
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
  v0 = (void *)getBKDeviceClass_softClass;
  v7 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceClass_block_invoke;
    v3[3] = &unk_1EA27FEE8;
    v3[4] = &v4;
    __getBKDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2A6CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBKDeviceDescriptorClass()
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
  v0 = (void *)getBKDeviceDescriptorClass_softClass;
  v7 = getBKDeviceDescriptorClass_softClass;
  if (!getBKDeviceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceDescriptorClass_block_invoke;
    v3[3] = &unk_1EA27FEE8;
    v3[4] = &v4;
    __getBKDeviceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2A6D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  void *v0;

  if (!BiometricKitLibraryCore_frameworkLibrary)
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

BKUIFingerPrintPosedVideoPlayerView *__getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  BKUIFingerPrintPosedVideoPlayerView *result;
  BKUIFingerPrintPosedVideoPlayerView *v3;
  SEL v4;
  id v5;
  id v6;

  BiometricKitLibrary();
  result = (BKUIFingerPrintPosedVideoPlayerView *)objc_getClass("BKDeviceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BKUIFingerPrintPosedVideoPlayerView *)__getBKDeviceDescriptorClass_block_invoke_cold_1();
    return -[BKUIFingerPrintPosedVideoPlayerView initWithAssetName:subdirectory:](v3, v4, v5, v6);
  }
  return result;
}

void sub_1DB2A9170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2A961C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2A96D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2A9788(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AA3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AA9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1DB2ABA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2ABC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke_0(uint64_t a1)
{
  BiometricKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary_0();
  }
}

void BiometricKitLibrary_0()
{
  void *v0;

  if (!BiometricKitLibraryCore_frameworkLibrary_0)
    BiometricKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!BiometricKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBKDeviceDescriptorClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BiometricKitLibrary_0();
  result = objc_getClass("BKDeviceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)__getBMStreamsClass_block_invoke(v3);
  }
  return result;
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMStreamsClass_block_invoke_cold_1();
  getBMStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  void *v0;

  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBMDiscoverabilitySignalEventClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDiscoverabilitySignalEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1();
  getBMDiscoverabilitySignalEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double timingEaseInOut_block_invoke(double a1)
{
  double (**v2)(double);
  double v3;

  _QUINTIC_GENERATOR(-2.0, 3.0, 0.0);
  v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v3 = v2[2](a1);

  return v3;
}

id _QUINTIC_GENERATOR(double a1, double a2, double a3)
{
  void *v3;
  void *v4;
  _QWORD aBlock[9];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___QUINTIC_GENERATOR_block_invoke;
  aBlock[3] = &__block_descriptor_72_e8_d16__0d8l;
  aBlock[4] = 0;
  aBlock[5] = 0;
  *(double *)&aBlock[6] = a1;
  *(double *)&aBlock[7] = a2;
  *(double *)&aBlock[8] = a3;
  v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);

  return v4;
}

double timingEaseOut_block_invoke_2(double a1)
{
  double (**v2)(double);
  double v3;

  _QUINTIC_GENERATOR(1.0, -3.0, 3.0);
  v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v3 = v2[2](a1);

  return v3;
}

double timingEaseIn_block_invoke_3(double a1)
{
  double (**v2)(double);
  double v3;

  _QUINTIC_GENERATOR(1.0, 0.0, 0.0);
  v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v3 = v2[2](a1);

  return v3;
}

void sub_1DB2ACEC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2ACFC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AD46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

double _radiansForOrientations(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;
  double *v4;

  result = 0.0;
  switch(a2)
  {
    case 1:
      v3 = a1 - 2;
      if ((unint64_t)(a1 - 2) < 3)
      {
        v4 = (double *)&unk_1DB2DF7F0;
        goto LABEL_10;
      }
      break;
    case 2:
      v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 4)
      {
        v4 = (double *)&unk_1DB2DF840;
        goto LABEL_10;
      }
      break;
    case 3:
      v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 4)
      {
        v4 = (double *)&unk_1DB2DF820;
        goto LABEL_10;
      }
      break;
    case 4:
      v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 3)
      {
        v4 = (double *)&unk_1DB2DF808;
LABEL_10:
        result = v4[v3];
      }
      break;
    default:
      return result;
  }
  return result;
}

double _UIRotationRadiansForDeviceOrientation(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 2) <= 2)
    return dbl_1DB2DF860[a1 - 2];
  return result;
}

const __CFString *_deviceOrientationToString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("UIDeviceOrientationPortrait");
  else
    return off_1EA2806E0[a1];
}

double _landscapeRightRadiansForOrientations(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 1) <= 3)
    return dbl_1DB2DF898[a1 - 1];
  return result;
}

void sub_1DB2B0E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_1DB2B2174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B229C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B2308(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DB2B24B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B25BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B26CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B27DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DB2B28E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<InstanceInfo>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA27F538, MEMORY[0x1E0DE42D0]);
}

void sub_1DB2B29B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InstanceInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

double _degreesToRadians(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double _arrowContainerCenter()
{
  return 14.0;
}

void sub_1DB2B86FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAUIPhysicalButtonViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
  {
    LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAUIPhysicalButtonView");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAUIPhysicalButtonViewClass_block_invoke_cold_1();
    free(v3);
  }
  getLAUIPhysicalButtonViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB2B9494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2BAAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2BC32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2BC7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2BEB98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2BEC44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2BECF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1DB2C0EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2C2CF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DB2C3540(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Block_object_dispose((const void *)(v3 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2C361C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2C6930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2C74B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2CA890(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1DB2CB838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MetalLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MetalLibraryCore_frameworkLibrary;
  }
  else
  {
    MetalLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MetalLibraryCore_frameworkLibrary;
    if (!MetalLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MTLCreateSystemDefaultDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMTLCreateSystemDefaultDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB2D0158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2D3A18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2D3B50(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1DB2D53A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

uint64_t *sub_1DB2D5630()
{
  return &qword_1F02D69A0;
}

uint64_t sub_1DB2D563C()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = qword_1F02D69A0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1DB2D568C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  qword_1F02D69A0 = a1;
  qword_1F02D69A8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB2D56E4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DB2D5728()
{
  uint64_t v0;

  v0 = sub_1DB2D9054();
  __swift_allocate_value_buffer(v0, qword_1F02D6DD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02D6DD8);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_1DB2D9048();
}

uint64_t sub_1DB2D57C8()
{
  uint64_t v0;

  if (qword_1F02D6C18 != -1)
    swift_once();
  v0 = sub_1DB2D9054();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02D6DD8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1DB2D5828@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02D6C18 != -1)
    swift_once();
  v2 = sub_1DB2D9054();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02D6DD8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1DB2D58D8()
{
  return 0x100000000;
}

id sub_1DB2D58F4()
{
  return objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
}

uint64_t sub_1DB2D5920()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v6[2];

  v0 = sub_1DB2D90CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB2D90F0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEFA78];
  MEMORY[0x1E0C80A78]();
  sub_1DB2D9084();
  MEMORY[0x1E0C80A78]();
  sub_1DB2D64B4(0, &qword_1F02D69B0);
  sub_1DB2D9078();
  v6[1] = MEMORY[0x1E0DEE9D8];
  sub_1DB2D6434(&qword_1F02D69B8, v4, MEMORY[0x1E0DEFA88]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D69C0);
  sub_1DB2D6474(&qword_1F02D69C8, &qword_1F02D69C0);
  sub_1DB2D9108();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D8], v0);
  return sub_1DB2D90FC();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AC00C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AC018](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DB2D5B68(int a1, int a2, uint64_t (*a3)(), uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t aBlock;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t (*v33)();
  uint64_t v34;

  v5 = v4;
  v10 = sub_1DB2D9060();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB2D9084();
  result = MEMORY[0x1E0C80A78]();
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState];
  if ((v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState + 4] & 1) != 0
    || *(_DWORD *)v18 != a1
    || (v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState + 4] & 1) != 0
    || *(_DWORD *)&v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState] != a2)
  {
    *(_DWORD *)v18 = a1;
    v18[4] = 0;
    v19 = &v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState];
    *(_DWORD *)v19 = a2;
    v19[4] = 0;
    v26 = v15;
    v27 = result;
    sub_1DB2D9078();
    v33 = a3;
    v34 = a4;
    aBlock = MEMORY[0x1E0C809B0];
    v30 = 1107296256;
    v25 = v11;
    v31 = sub_1DB2D5ED8;
    v32 = &block_descriptor;
    _Block_copy(&aBlock);
    v28 = MEMORY[0x1E0DEE9D8];
    v24[1] = sub_1DB2D6434(&qword_1F02D69E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    swift_retain();
    v24[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D69E8);
    sub_1DB2D6474(&qword_1F02D69F0, &qword_1F02D69E8);
    sub_1DB2D9108();
    sub_1DB2D90B4();
    swift_allocObject();
    sub_1DB2D9090();
    swift_release();
    sub_1DB2D64B4(0, &qword_1F02D69F8);
    v20 = (void *)sub_1DB2D90D8();
    v21 = swift_allocObject();
    swift_weakInit();
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v5;
    *(_QWORD *)(v22 + 24) = v21;
    v33 = sub_1DB2D653C;
    v34 = v22;
    aBlock = MEMORY[0x1E0C809B0];
    v30 = 1107296256;
    v31 = sub_1DB2D5ED8;
    v32 = &block_descriptor_6;
    v23 = _Block_copy(&aBlock);
    v5;
    swift_retain();
    sub_1DB2D906C();
    v28 = MEMORY[0x1E0DEE9D8];
    sub_1DB2D9108();
    sub_1DB2D90A8();
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
    swift_release();
    swift_release();
    sub_1DB2D90E4();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DB2D5ED8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_1DB2D5F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id result;
  uint64_t i;

  v1 = v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState;
  *(_DWORD *)v1 = 0;
  *(_BYTE *)(v1 + 4) = 1;
  v2 = v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState;
  *(_DWORD *)v2 = 0;
  *(_BYTE *)(v2 + 4) = 1;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations);
  v4 = objc_msgSend(v3, sel_allObjects);
  sub_1DB2D90B4();
  v5 = sub_1DB2D90C0();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    return objc_msgSend(v3, sel_removeAllObjects);
  }
  swift_bridgeObjectRetain();
  result = (id)sub_1DB2D9120();
  v6 = (uint64_t)result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
        MEMORY[0x1DF0AB6F4](i, v5);
      else
        swift_retain();
      sub_1DB2D909C();
      swift_release();
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

id sub_1DB2D6108()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_1DB2D6128()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v1 = sub_1DB2D90CC();
  v14 = *(_QWORD *)(v1 - 8);
  v15 = v1;
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB2D90F0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEFA78];
  MEMORY[0x1E0C80A78]();
  sub_1DB2D9084();
  MEMORY[0x1E0C80A78]();
  v5 = &v0[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState];
  *(_DWORD *)v5 = 0;
  v5[4] = 1;
  v6 = &v0[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState];
  *(_DWORD *)v6 = 0;
  v6[4] = 1;
  v7 = OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations;
  v8 = (void *)objc_opt_self();
  v9 = v0;
  *(_QWORD *)&v0[v7] = objc_msgSend(v8, sel_weakObjectsHashTable);
  v10 = OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_stateQueue;
  sub_1DB2D64B4(0, &qword_1F02D69B0);
  sub_1DB2D9078();
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1DB2D6434(&qword_1F02D69B8, v4, MEMORY[0x1E0DEFA88]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D69C0);
  sub_1DB2D6474(&qword_1F02D69C8, &qword_1F02D69C0);
  sub_1DB2D9108();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v3, *MEMORY[0x1E0DEF8D8], v15);
  *(_QWORD *)&v9[v10] = sub_1DB2D90FC();

  v11 = (objc_class *)type metadata accessor for EnrollStateDispatchWorkItemsManager();
  v16.receiver = v9;
  v16.super_class = v11;
  return objc_msgSendSuper2(&v16, sel_init);
}

id sub_1DB2D63A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnrollStateDispatchWorkItemsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_1DB2D6408(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
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

uint64_t sub_1DB2D6434(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0AC024](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB2D6474(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0AC024](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB2D64B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DB2D64EC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB2D6510()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB2D653C()
{
  uint64_t v0;
  void *v1;
  unsigned int v2;
  uint64_t result;

  v1 = *(void **)(*(_QWORD *)(v0 + 16)
                + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations);
  swift_beginAccess();
  v2 = objc_msgSend(v1, sel_containsObject_, swift_weakLoadStrong());
  result = swift_release();
  if (v2)
  {
    swift_beginAccess();
    objc_msgSend(v1, sel_removeObject_, swift_weakLoadStrong());
    return swift_release();
  }
  return result;
}

_DWORD *sub_1DB2D65F8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_1DB2D6608(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t type metadata accessor for EnrollStateDispatchWorkItemsManager()
{
  return objc_opt_self();
}

void type metadata accessor for BKUIPearlEnrollState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F02D6A38)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F02D6A38);
  }
}

uint64_t sub_1DB2D6688()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DB2D66AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_1DB2D66B8()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1DB2D66D4()
{
  return swift_deallocClassInstance();
}

id sub_1DB2D66E4()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1F02D6D28 = (uint64_t)result;
  return result;
}

uint64_t sub_1DB2D6734(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6DF0);
}

uint64_t sub_1DB2D6758()
{
  return sub_1DB2D67D4(&qword_1F02D6D30, (uint64_t)qword_1F02D6DF0);
}

uint64_t sub_1DB2D6774@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D30, (uint64_t)qword_1F02D6DF0, a1);
}

uint64_t sub_1DB2D6790(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E08);
}

uint64_t sub_1DB2D67B8()
{
  return sub_1DB2D67D4(&qword_1F02D6D38, (uint64_t)qword_1F02D6E08);
}

uint64_t sub_1DB2D67D4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1DB2D903C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1DB2D6814@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D38, (uint64_t)qword_1F02D6E08, a1);
}

uint64_t sub_1DB2D6830@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DB2D903C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1DB2D6898(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E20);
}

uint64_t sub_1DB2D68B4()
{
  return sub_1DB2D67D4(&qword_1F02D6D40, (uint64_t)qword_1F02D6E20);
}

uint64_t sub_1DB2D68D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D40, (uint64_t)qword_1F02D6E20, a1);
}

uint64_t sub_1DB2D68EC(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E38);
}

uint64_t sub_1DB2D6908()
{
  return sub_1DB2D67D4(&qword_1F02D6D48, (uint64_t)qword_1F02D6E38);
}

uint64_t sub_1DB2D6924@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D48, (uint64_t)qword_1F02D6E38, a1);
}

uint64_t sub_1DB2D6940(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E50);
}

uint64_t sub_1DB2D6964()
{
  return sub_1DB2D67D4(&qword_1F02D6D50, (uint64_t)qword_1F02D6E50);
}

uint64_t sub_1DB2D6980@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D50, (uint64_t)qword_1F02D6E50, a1);
}

uint64_t sub_1DB2D699C(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E68);
}

uint64_t sub_1DB2D69C0()
{
  return sub_1DB2D67D4(&qword_1F02D6D58, (uint64_t)qword_1F02D6E68);
}

uint64_t sub_1DB2D69DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D58, (uint64_t)qword_1F02D6E68, a1);
}

uint64_t sub_1DB2D69F8(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E80);
}

uint64_t sub_1DB2D6A1C()
{
  return sub_1DB2D67D4(&qword_1F02D6D60, (uint64_t)qword_1F02D6E80);
}

uint64_t sub_1DB2D6A38@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D60, (uint64_t)qword_1F02D6E80, a1);
}

uint64_t sub_1DB2D6A54(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6E98);
}

uint64_t sub_1DB2D6A80()
{
  return sub_1DB2D67D4(&qword_1F02D6D68, (uint64_t)qword_1F02D6E98);
}

uint64_t sub_1DB2D6A9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D68, (uint64_t)qword_1F02D6E98, a1);
}

uint64_t sub_1DB2D6AB8(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6EB0);
}

uint64_t sub_1DB2D6AE4()
{
  return sub_1DB2D67D4(&qword_1F02D6D70, (uint64_t)qword_1F02D6EB0);
}

uint64_t sub_1DB2D6B00@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D70, (uint64_t)qword_1F02D6EB0, a1);
}

uint64_t sub_1DB2D6B1C(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6EC8);
}

uint64_t sub_1DB2D6B48()
{
  return sub_1DB2D67D4(&qword_1F02D6D78, (uint64_t)qword_1F02D6EC8);
}

uint64_t sub_1DB2D6B64@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D78, (uint64_t)qword_1F02D6EC8, a1);
}

uint64_t sub_1DB2D6B80(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6EE0);
}

uint64_t sub_1DB2D6BAC()
{
  return sub_1DB2D67D4(&qword_1F02D6D80, (uint64_t)qword_1F02D6EE0);
}

uint64_t sub_1DB2D6BC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D80, (uint64_t)qword_1F02D6EE0, a1);
}

uint64_t sub_1DB2D6BE4(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6EF8);
}

uint64_t sub_1DB2D6C10()
{
  return sub_1DB2D67D4(&qword_1F02D6D88, (uint64_t)qword_1F02D6EF8);
}

uint64_t sub_1DB2D6C2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D88, (uint64_t)qword_1F02D6EF8, a1);
}

uint64_t sub_1DB2D6C48(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F10);
}

uint64_t sub_1DB2D6C6C()
{
  return sub_1DB2D67D4(&qword_1F02D6D90, (uint64_t)qword_1F02D6F10);
}

uint64_t sub_1DB2D6C88@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D90, (uint64_t)qword_1F02D6F10, a1);
}

uint64_t sub_1DB2D6CA4(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F28);
}

uint64_t sub_1DB2D6CD0()
{
  return sub_1DB2D67D4(&qword_1F02D6D98, (uint64_t)qword_1F02D6F28);
}

uint64_t sub_1DB2D6CEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6D98, (uint64_t)qword_1F02D6F28, a1);
}

uint64_t sub_1DB2D6D08(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F40);
}

uint64_t sub_1DB2D6D2C()
{
  return sub_1DB2D67D4(&qword_1F02D6DA0, (uint64_t)qword_1F02D6F40);
}

uint64_t sub_1DB2D6D48@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DA0, (uint64_t)qword_1F02D6F40, a1);
}

uint64_t sub_1DB2D6D64(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F58);
}

uint64_t sub_1DB2D6D88()
{
  return sub_1DB2D67D4(&qword_1F02D6DA8, (uint64_t)qword_1F02D6F58);
}

uint64_t sub_1DB2D6DA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DA8, (uint64_t)qword_1F02D6F58, a1);
}

uint64_t sub_1DB2D6DC0(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F70);
}

uint64_t sub_1DB2D6DE4()
{
  return sub_1DB2D67D4(&qword_1F02D6DB0, (uint64_t)qword_1F02D6F70);
}

uint64_t sub_1DB2D6E00@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DB0, (uint64_t)qword_1F02D6F70, a1);
}

uint64_t sub_1DB2D6E1C(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6F88);
}

uint64_t sub_1DB2D6E44()
{
  return sub_1DB2D67D4(&qword_1F02D6DB8, (uint64_t)qword_1F02D6F88);
}

uint64_t sub_1DB2D6E60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DB8, (uint64_t)qword_1F02D6F88, a1);
}

uint64_t sub_1DB2D6E7C(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6FA0);
}

uint64_t sub_1DB2D6EA4()
{
  return sub_1DB2D67D4(&qword_1F02D6DC0, (uint64_t)qword_1F02D6FA0);
}

uint64_t sub_1DB2D6EC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DC0, (uint64_t)qword_1F02D6FA0, a1);
}

uint64_t sub_1DB2D6EDC(uint64_t a1)
{
  return sub_1DB2D6F00(a1, qword_1F02D6FB8);
}

uint64_t sub_1DB2D6F00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_1DB2D903C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1F02D6D20 != -1)
    swift_once();
  v4 = (id)qword_1F02D6D28;
  return sub_1DB2D9030();
}

uint64_t sub_1DB2D6F98()
{
  return sub_1DB2D67D4(&qword_1F02D6DC8, (uint64_t)qword_1F02D6FB8);
}

uint64_t sub_1DB2D6FB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB2D6830(&qword_1F02D6DC8, (uint64_t)qword_1F02D6FB8, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t getBYFlowSkipIdentifierFaceID_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[BKUIPearlEnrollViewController(ButtonActionWithNavigation) updatePeriocularEnrollmentSettings:].cold.1(v0);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:].cold.1(v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKDeviceDescriptorClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BKUIFingerPrintPosedVideoPlayerView load].cold.1(v0);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1(v0);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[BKUIPearlPositioningGuideView _startDisplay].cold.1(v0);
}

uint64_t __getLAUIPhysicalButtonViewClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:].cold.1(v0);
}

uint64_t sub_1DB2D9030()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t sub_1DB2D903C()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t sub_1DB2D9048()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DB2D9054()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DB2D9060()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DB2D906C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DB2D9078()
{
  return MEMORY[0x1E0DEF588]();
}

uint64_t sub_1DB2D9084()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DB2D9090()
{
  return MEMORY[0x1E0DEF6F8]();
}

uint64_t sub_1DB2D909C()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1DB2D90A8()
{
  return MEMORY[0x1E0DEF718]();
}

uint64_t sub_1DB2D90B4()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1DB2D90C0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DB2D90CC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DB2D90D8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DB2D90E4()
{
  return MEMORY[0x1E0DEF908]();
}

uint64_t sub_1DB2D90F0()
{
  return MEMORY[0x1E0DEFA78]();
}

uint64_t sub_1DB2D90FC()
{
  return MEMORY[0x1E0DEFA90]();
}

uint64_t sub_1DB2D9108()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DB2D9114()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DB2D9120()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AudioServicesPlaySystemSoundWithVibration()
{
  return MEMORY[0x1E0C92168]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1E0C9D3E8](path1, path2);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDE0](desc);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1E0CBB1D0]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x1E0CBB1D8]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x1E0CBB260]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB278](client, key, property);
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingBlock()
{
  return MEMORY[0x1E0CBB280]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1E0CBB298]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x1E0DAC8C0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0CEB048]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1E0DDDDE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void operator delete(void *__p)
{
  off_1EA27F550(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA27F558(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t matrix_look_at()
{
  return MEMORY[0x1E0D02888]();
}

uint64_t matrix_ortho()
{
  return MEMORY[0x1E0D02890]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

