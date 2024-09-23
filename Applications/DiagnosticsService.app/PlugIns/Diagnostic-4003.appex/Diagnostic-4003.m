void sub_100004F5C(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(DAHIDEventMonitor);
  v2 = (void *)qword_10000CA98;
  qword_10000CA98 = (uint64_t)v1;

}

void sub_10000547C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005494(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __IOHIDServiceClient *v5;
  uint64_t v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "HIDEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HIDServiceClient")));
  v5 = (__IOHIDServiceClient *)objc_msgSend(v4, "pointerValue");

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(v5, *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 64)) != 0;
  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000064DC();

  }
}

void sub_1000058FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _HIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;

  if (a2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "delegate"));
    objc_msgSend(v5, "handleHIDEvent:", a4);

  }
  return 0;
}

void sub_100005ADC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100005AF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpSystemClient");
}

void sub_100005C44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100006004(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100006484()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C5C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
  sub_100005C54();
}

void sub_1000064B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C5C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
  sub_100005C54();
}

void sub_1000064DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C5C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
  sub_100005C54();
}

void sub_100006508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C5C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
  sub_100005C54();
}

void sub_100006534()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100005C5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
  sub_100005C54();
}

void sub_10000656C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_1000065A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C5C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
  sub_100005C54();
}

void sub_1000065D4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ambient Light Sensor NOT found. (0)", v1, 2u);
}

id objc_msgSend_ALSDataCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ALSDataCount");
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEvents");
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDSystemClient");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brightnessFactor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessFactor");
}

id objc_msgSend_brightnessResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessResponder");
}

id objc_msgSend_brightnessSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessSystemClient");
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpSystemClient");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyForKey:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyMonitoring");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_eventMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMonitor");
}

id objc_msgSend_findServiceClientForHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findServiceClientForHIDEvent:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_mHIDEventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mHIDEventQueue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_serviceClientSetPropertyValue_forKey_forHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceClientSetPropertyValue:forKey:forHIDEvent:");
}

id objc_msgSend_setALSDataCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setALSDataCount:");
}

id objc_msgSend_setBrightnessFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessFactor:");
}

id objc_msgSend_setBrightnessResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessResponder:");
}

id objc_msgSend_setBrightnessSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessSystemClient:");
}

id objc_msgSend_setCurrentlyMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyMonitoring:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMonitor:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setHIDSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDSystemClient:");
}

id objc_msgSend_setMHIDEventQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMHIDEventQueue:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setScreenToBrightness_animate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenToBrightness:animate:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_startMonitoringWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWithHIDEvents:");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_systemClientSetupWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientSetupWithHIDEvents:");
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardown");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}
