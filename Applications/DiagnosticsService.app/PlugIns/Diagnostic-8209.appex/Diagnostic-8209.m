void sub_100006A34(id a1)
{
  qword_1000159D0 = (uint64_t)os_log_create("com.apple.telephony.abm", "diagext");
}

void sub_100006BA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RFSelfDiagExtensionHelper;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100006C78(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100007B70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100007D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000841C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000086E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008BD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008D1C(uint64_t a1)
{

  return a1;
}

void sub_100008D44(id *a1)
{

  operator delete(a1);
}

_QWORD *sub_100008D6C(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = off_100010470;
  v2[1] = v3;
  return v2;
}

id sub_100008DB0(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id result;

  v3 = *(void **)(a1 + 8);
  *a2 = off_100010470;
  result = v3;
  a2[1] = result;
  return result;
}

void sub_100008DE4(uint64_t a1)
{

}

void sub_100008DEC(id *a1)
{

  operator delete(a1);
}

void sub_100008E14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, v3 - (_QWORD)v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "delegate"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "delegate"));
    objc_msgSend(v7, "handleAWDMetricEvent:", v5);

  }
  if (v4)
    operator delete(v4);
}

void sub_100008EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008EE4(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

_UNKNOWN **sub_100008F50()
{
  return &off_1000104E0;
}

intptr_t sub_1000090CC(uint64_t a1)
{
  pthread_setname_np("DE.WifiScanner.RunLoop");
  objc_msgSend(*(id *)(a1 + 32), "setFServerRunLoopRef:", CFRunLoopGetCurrent());
  return dispatch_semaphore_signal((dispatch_semaphore_t)objc_msgSend(*(id *)(a1 + 32), "fWaitForResult"));
}

uint64_t sub_10000910C(void *a1)
{
  CFRunLoopSourceRef v2;
  __CFRunLoopSource *v3;
  __CFRunLoop *Current;
  void (**v5)(void);
  __CFRunLoop *v6;
  CFRunLoopSourceContext v8;

  memset(&v8, 0, sizeof(v8));
  v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v8);
  if (v2)
  {
    v3 = v2;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v3, kCFRunLoopDefaultMode);
    v5 = objc_retainBlock(a1);
    v5[2]();
    while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u) - 1) > 1)
      ;
    v6 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v6, v3, kCFRunLoopDefaultMode);
    CFRelease(v3);

  }
  return 0;
}

id sub_10000A18C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id result;

  result = a4;
  if (a4)
    return objc_msgSend(a4, "wifiScanCompleted:withError:", a2, a3);
  return result;
}

id sub_10000A4DC(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  double FloatValue;
  void *v7;
  void *v8;

  if (result)
  {
    if (a4)
    {
      v5 = result;
      result = (id)IOHIDEventGetType(a4);
      if ((_DWORD)result == 12)
      {
        result = objc_msgSend(v5, "fIsMonitoring");
        if ((_DWORD)result)
        {
          FloatValue = IOHIDEventGetFloatValue(a4, 786432);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueQueue"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)FloatValue));
          objc_msgSend(v7, "addObject:", v8);

          return objc_msgSend(v5, "determineEnclosureState");
        }
      }
    }
  }
  return result;
}

void sub_10000A8C4(uint64_t a1)
{
  const void *v2;
  os_log_s *v3;
  const void *v4;
  os_log_s *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: release system client", buf, 2u);
    }
  }
  v4 = *(const void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: release service client", v6, 2u);
    }
  }
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_abortTesting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortTesting:");
}

id objc_msgSend_addAWDConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAWDConfiguration:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_averageSampleQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageSampleQueue");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "command");
}

id objc_msgSend_commandDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandDescription");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentALSEnclosedState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentALSEnclosedState");
}

id objc_msgSend_currentWifiAvailabilityState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentWifiAvailabilityState");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_detectChamberReadyALSThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberReadyALSThreshold");
}

id objc_msgSend_detectChamberReadyWaitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberReadyWaitTime");
}

id objc_msgSend_detectChamberSensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberSensor");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAutoJoin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAutoJoin");
}

id objc_msgSend_disableNetworkReconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableNetworkReconnect");
}

id objc_msgSend_ds_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ds_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_ds_numberFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ds_numberFromKey:defaultValue:failed:");
}

id objc_msgSend_ds_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ds_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_enableAutoJoin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableAutoJoin");
}

id objc_msgSend_enableNetworkReconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableNetworkReconnect");
}

id objc_msgSend_fALSEnclosedLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fALSEnclosedLimit");
}

id objc_msgSend_fALSEnclosedSampleCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fALSEnclosedSampleCount");
}

id objc_msgSend_fAlertTestComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fAlertTestComplete");
}

id objc_msgSend_fAvailabilityState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fAvailabilityState");
}

id objc_msgSend_fEnclosedStateFlag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fEnclosedStateFlag");
}

id objc_msgSend_fIsMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fIsMonitoring");
}

id objc_msgSend_fIsScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fIsScanning");
}

id objc_msgSend_fMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fMonitoring");
}

id objc_msgSend_fScanIntervalInSec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fScanIntervalInSec");
}

id objc_msgSend_fScanRepeatRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fScanRepeatRequired");
}

id objc_msgSend_fSensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fSensor");
}

id objc_msgSend_fServerRunLoopRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fServerRunLoopRef");
}

id objc_msgSend_fWaitForResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fWaitForResult");
}

id objc_msgSend_getBasebandResultWaitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBasebandResultWaitTime");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getOSLogHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOSLogHandler");
}

id objc_msgSend_handleALSEnclosedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleALSEnclosedEvent:");
}

id objc_msgSend_handleAWDMetricEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAWDMetricEvent:");
}

id objc_msgSend_handleChamberOpenEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleChamberOpenEvent:");
}

id objc_msgSend_handleWifiAvailabilityEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleWifiAvailabilityEvent:");
}

id objc_msgSend_initMonitorChamber_ALSThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initMonitorChamber:ALSThreshold:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCheckerBoardActive");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTestSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTestSupported:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadTestConfigFromUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTestConfigFromUserDefaults");
}

id objc_msgSend_measureType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "measureType");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_prepareSetupForTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareSetupForTest");
}

id objc_msgSend_recoverBasebandState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverBasebandState:");
}

id objc_msgSend_releaseALSClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseALSClient");
}

id objc_msgSend_releaseWifiManagerClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseWifiManagerClient");
}

id objc_msgSend_removeAWDConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAWDConfiguration");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAll");
}

id objc_msgSend_restoreSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreSetup");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_runRFSelfDiag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRFSelfDiag");
}

id objc_msgSend_scanAndGetWifiAvailability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanAndGetWifiAvailability:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setBasebandFTM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBasebandFTM");
}

id objc_msgSend_setCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommand:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetectChamberReadyALSThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberReadyALSThreshold:");
}

id objc_msgSend_setDetectChamberReadyWaitTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberReadyWaitTime:");
}

id objc_msgSend_setDetectChamberSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberSensor:");
}

id objc_msgSend_setEnclosedLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnclosedLimit:");
}

id objc_msgSend_setFALSEnclosedLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFALSEnclosedLimit:");
}

id objc_msgSend_setFALSEnclosedSampleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFALSEnclosedSampleCount:");
}

id objc_msgSend_setFAlertTestComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFAlertTestComplete:");
}

id objc_msgSend_setFAvailabilityState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFAvailabilityState:");
}

id objc_msgSend_setFEnclosedStateFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFEnclosedStateFlag:");
}

id objc_msgSend_setFIsMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFIsMonitoring:");
}

id objc_msgSend_setFIsScanning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFIsScanning:");
}

id objc_msgSend_setFMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFMonitoring:");
}

id objc_msgSend_setFScanIntervalInSec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFScanIntervalInSec:");
}

id objc_msgSend_setFScanRepeatRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFScanRepeatRequired:");
}

id objc_msgSend_setFSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFSensor:");
}

id objc_msgSend_setFServerRunLoopRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFServerRunLoopRef:");
}

id objc_msgSend_setFWaitForResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFWaitForResult:");
}

id objc_msgSend_setFactoryTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFactoryTest");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setMeasureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMeasureType:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTestCompleteAlertTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteAlertTime:");
}

id objc_msgSend_setTestCompleteChimeAlertEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteChimeAlertEnabled:");
}

id objc_msgSend_setTestCompleteVibrationAlertEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteVibrationAlertEnabled:");
}

id objc_msgSend_setTimeForNextScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeForNextScan");
}

id objc_msgSend_setValueQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValueQueue:");
}

id objc_msgSend_setupALSClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupALSClient");
}

id objc_msgSend_setupHIDClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHIDClient");
}

id objc_msgSend_setupWifiManagerClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWifiManagerClient");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_startAlertsTestComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAlertsTestComplete:");
}

id objc_msgSend_startBasebandRFSelfTest_TestCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBasebandRFSelfTest:TestCommand:");
}

id objc_msgSend_startMonitorChamberOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitorChamberOpen");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoring:");
}

id objc_msgSend_startRunLoop_sync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunLoop_sync");
}

id objc_msgSend_startWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWiFiNetworkScan");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopAlertsTestComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAlertsTestComplete");
}

id objc_msgSend_stopMonitorChamber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitorChamber");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWiFiNetworkScan");
}

id objc_msgSend_testCompleteAlertTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteAlertTime");
}

id objc_msgSend_testCompleteChimeAlertEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteChimeAlertEnabled");
}

id objc_msgSend_testCompleteVibrationAlertEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteVibrationAlertEnabled");
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testConfiguration");
}

id objc_msgSend_updateEnclosedCheckRunningFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEnclosedCheckRunningFlag:");
}

id objc_msgSend_valueQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueQueue");
}

id objc_msgSend_waitForChamberClosed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForChamberClosed:");
}
