void sub_100002EFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100002F28(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  ComponentOrientationSpecification *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_dictionaryFromRequiredKey:limitedToKeys:failed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v8 = objc_opt_new(ComponentOrientationSpecification);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("lowerBoundOffsetX"), v9, v10, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v11, "floatValue");
  -[ComponentOrientationSpecification setLowerBoundOffsetThresholdX:](v8, "setLowerBoundOffsetThresholdX:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("upperBoundOffsetX"), v12, v13, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v14, "floatValue");
  -[ComponentOrientationSpecification setUpperBoundOffsetThresholdX:](v8, "setUpperBoundOffsetThresholdX:");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("lowerBoundOffsetY"), v15, v16, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v17, "floatValue");
  -[ComponentOrientationSpecification setLowerBoundOffsetThresholdY:](v8, "setLowerBoundOffsetThresholdY:");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("upperBoundOffsetY"), v18, v19, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v20, "floatValue");
  -[ComponentOrientationSpecification setUpperBoundOffsetThresholdY:](v8, "setUpperBoundOffsetThresholdY:");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("lowerBoundOffsetZ"), v21, v22, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v23, "floatValue");
  -[ComponentOrientationSpecification setLowerBoundOffsetThresholdZ:](v8, "setLowerBoundOffsetThresholdZ:");

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMin"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "boundOffsetMax"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("upperBoundOffsetZ"), v24, v25, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v26, "floatValue");
  -[ComponentOrientationSpecification setUpperBoundOffsetThresholdZ:](v8, "setUpperBoundOffsetThresholdZ:");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("zeroRangeThreshold"), &off_100010BB0, &off_100010BA0, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v27, "floatValue");
  -[ComponentOrientationSpecification setZeroRangeThreshold:](v8, "setZeroRangeThreshold:");

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("degreesShiftRangeThreshold"), &off_100010BB0, &off_100010BA0, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v28, "floatValue");
  -[ComponentOrientationSpecification setDegreesShiftRangeThreshold:](v8, "setDegreesShiftRangeThreshold:");

  if (v8 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v8, v29);
  }
  else if (a4)
  {
    *a4 = 1;
  }

}

void sub_100005A7C(_Unwind_Exception *a1)
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

void sub_100006E60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008FE0(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(DAHIDEventMonitor);
  v2 = (void *)qword_1000160F8;
  qword_1000160F8 = (uint64_t)v1;

}

void sub_100009500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009518(uint64_t a1)
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
      sub_100009DC0();

  }
}

void sub_100009980(_Unwind_Exception *a1)
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

void sub_100009B60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100009B7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpSystemClient");
}

void sub_100009CC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id numberOrNullForDouble()
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
}

void sub_100009D28(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Interactive Accelerometer and Gyroscope Test: Failed Test Specifications sanity check", v1, 2u);
}

void sub_100009D68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009CE0();
  sub_100009CC8((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
  sub_100009CD8();
}

void sub_100009D94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009CE0();
  sub_100009CC8((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
  sub_100009CD8();
}

void sub_100009DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009CE0();
  sub_100009CC8((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
  sub_100009CD8();
}

void sub_100009DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009CE0();
  sub_100009CC8((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
  sub_100009CD8();
}

void sub_100009E18()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100009CE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
  sub_100009CD8();
}

void sub_100009E50(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_100009E8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009CE0();
  sub_100009CC8((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
  sub_100009CD8();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEvents");
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDSystemClient");
}

id objc_msgSend__solveForInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_solveForInput:");
}

id objc_msgSend__updateForRotation_shiftAngle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateForRotation:shiftAngle:");
}

id objc_msgSend__updateOffsetLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateOffsetLabel:");
}

id objc_msgSend_addNotStationaryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotStationaryData");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addStationaryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStationaryData");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attitude");
}

id objc_msgSend_average_key_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "average:key:size:");
}

id objc_msgSend_averagedRawData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averagedRawData");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "begin");
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomInnerCircle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomInnerCircle");
}

id objc_msgSend_bottomOuterCircle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomOuterCircle");
}

id objc_msgSend_boundOffsetMax(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundOffsetMax");
}

id objc_msgSend_boundOffsetMin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundOffsetMin");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bubbleContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleContainer");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_checkWithinOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkWithinOffset");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpSystemClient");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_componentOrientationSpecifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentOrientationSpecifications");
}

id objc_msgSend_componentSensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentSensor");
}

id objc_msgSend_copiedMotionManagerData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copiedMotionManagerData");
}

id objc_msgSend_copiedRawComponentData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copiedRawComponentData");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyMonitoring");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_debuggingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debuggingEnabled");
}

id objc_msgSend_degreesLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "degreesLabel");
}

id objc_msgSend_degreesShift(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "degreesShift");
}

id objc_msgSend_degreesShiftRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "degreesShiftRange");
}

id objc_msgSend_degreesShiftRangeThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "degreesShiftRangeThreshold");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_determineTestingOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineTestingOrientation");
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMotion");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteSuccessfully(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCompleteSuccessfully");
}

id objc_msgSend_displayLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLink");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_dk_arrayFromRequiredKey_inSet_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:inSet:maxLength:failed:");
}

id objc_msgSend_dk_dictionaryFromRequiredKey_limitedToKeys_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromRequiredKey:limitedToKeys:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_inSet_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:inSet:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_filterContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterContainer");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_findServiceClientForHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findServiceClientForHIDEvent:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptor");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_framesLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "framesLevel");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_holdStationaryTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdStationaryTimeout");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
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

id objc_msgSend_isDebuggingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDebuggingEnabled");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLeveled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLeveled");
}

id objc_msgSend_lastDisplayDegrees(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDisplayDegrees");
}

id objc_msgSend_lastLevelChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLevelChange");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leftLevelTic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftLevelTic");
}

id objc_msgSend_levelBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "levelBottom");
}

id objc_msgSend_levelContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "levelContainer");
}

id objc_msgSend_levelHoldContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "levelHoldContainer");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lowerBoundOffsetThresholdX(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowerBoundOffsetThresholdX");
}

id objc_msgSend_lowerBoundOffsetThresholdY(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowerBoundOffsetThresholdY");
}

id objc_msgSend_lowerBoundOffsetThresholdZ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowerBoundOffsetThresholdZ");
}

id objc_msgSend_mHIDEventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mHIDEventQueue");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_motionManagerData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManagerData");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_notStationaryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notStationaryData");
}

id objc_msgSend_notStationaryTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notStationaryTimeout");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientation");
}

id objc_msgSend_orientationMissed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationMissed");
}

id objc_msgSend_orientationsIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationsIndex");
}

id objc_msgSend_orientationsParameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationsParameter");
}

id objc_msgSend_outputDataRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDataRate");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameters");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
}

id objc_msgSend_postInteractiveTestEvent_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postInteractiveTestEvent:info:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicates");
}

id objc_msgSend_previousRotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousRotation");
}

id objc_msgSend_previousShift(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousShift");
}

id objc_msgSend_rawComponentData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawComponentData");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_rightLevelTic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightLevelTic");
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationMatrix");
}

id objc_msgSend_rotationOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationOrientation");
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationRate");
}

id objc_msgSend_samplingRawData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingRawData");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_secondsToRunOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsToRunOrientation");
}

id objc_msgSend_serviceClientSetPropertyValue_forKey_forHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceClientSetPropertyValue:forKey:forHIDEvent:");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setAllowsEdgeAntialiasing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsEdgeAntialiasing:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAveragedRawData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAveragedRawData:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBottomInnerCircle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomInnerCircle:");
}

id objc_msgSend_setBottomOuterCircle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomOuterCircle:");
}

id objc_msgSend_setBoundOffsetMax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoundOffsetMax:");
}

id objc_msgSend_setBoundOffsetMin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoundOffsetMin:");
}

id objc_msgSend_setBubbleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBubbleContainer:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setComponentOrientationSpecifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentOrientationSpecifications:");
}

id objc_msgSend_setComponentSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentSensor:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setCopiedMotionManagerData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCopiedMotionManagerData:");
}

id objc_msgSend_setCopiedRawComponentData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCopiedRawComponentData:");
}

id objc_msgSend_setCurrentRotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentRotation:");
}

id objc_msgSend_setCurrentShift_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentShift:");
}

id objc_msgSend_setCurrentlyMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyMonitoring:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDebuggingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDebuggingEnabled:");
}

id objc_msgSend_setDegreesLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDegreesLabel:");
}

id objc_msgSend_setDegreesShift_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDegreesShift:");
}

id objc_msgSend_setDegreesShiftRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDegreesShiftRange:");
}

id objc_msgSend_setDegreesShiftRangeThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDegreesShiftRangeThreshold:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setDidCompleteSuccessfully_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidCompleteSuccessfully:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayLink:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFilterContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterContainer:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFontDescriptor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFramesLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFramesLevel:");
}

id objc_msgSend_setHIDSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDSystemClient:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHoldStationaryTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHoldStationaryTimeout:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsLeveled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLeveled:");
}

id objc_msgSend_setLastDisplayDegrees_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDisplayDegrees:");
}

id objc_msgSend_setLastLevelChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastLevelChange:");
}

id objc_msgSend_setLeftLevelTic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftLevelTic:");
}

id objc_msgSend_setLevelBottom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLevelBottom:");
}

id objc_msgSend_setLevelContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLevelContainer:");
}

id objc_msgSend_setLevelHoldContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLevelHoldContainer:");
}

id objc_msgSend_setLowerBoundOffsetThresholdX_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowerBoundOffsetThresholdX:");
}

id objc_msgSend_setLowerBoundOffsetThresholdY_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowerBoundOffsetThresholdY:");
}

id objc_msgSend_setLowerBoundOffsetThresholdZ_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowerBoundOffsetThresholdZ:");
}

id objc_msgSend_setMHIDEventQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMHIDEventQueue:");
}

id objc_msgSend_setManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManager:");
}

id objc_msgSend_setMotionManagerData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionManagerData:");
}

id objc_msgSend_setNotStationaryData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotStationaryData:");
}

id objc_msgSend_setNotStationaryTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotStationaryTimeout:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setOrientationMissed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationMissed:");
}

id objc_msgSend_setOrientationsIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationsIndex:");
}

id objc_msgSend_setOrientationsParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationsParameter:");
}

id objc_msgSend_setOutputDataRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputDataRate:");
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParameters:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreviousOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousOrientation:");
}

id objc_msgSend_setPreviousRotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousRotation:");
}

id objc_msgSend_setPreviousShift_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousShift:");
}

id objc_msgSend_setRawComponentData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawComponentData:");
}

id objc_msgSend_setRightLevelTic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightLevelTic:");
}

id objc_msgSend_setRotationOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRotationOrientation:");
}

id objc_msgSend_setSamplingRawData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSamplingRawData:");
}

id objc_msgSend_setSecondsToRunOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondsToRunOrientation:");
}

id objc_msgSend_setShowsDeviceMovementDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsDeviceMovementDisplay:");
}

id objc_msgSend_setSpecifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecifications:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStationaryData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStationaryData:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTestingOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestingOrientation:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTicContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTicContainer:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTopInnerCircle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopInnerCircle:");
}

id objc_msgSend_setTopOuterCircle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopOuterCircle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUpperBoundOffsetThresholdX_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpperBoundOffsetThresholdX:");
}

id objc_msgSend_setUpperBoundOffsetThresholdY_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpperBoundOffsetThresholdY:");
}

id objc_msgSend_setUpperBoundOffsetThresholdZ_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpperBoundOffsetThresholdZ:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setZeroRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZeroRange:");
}

id objc_msgSend_setZeroRangeAndDegreesShiftRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZeroRangeAndDegreesShiftRange");
}

id objc_msgSend_setZeroRangeThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZeroRangeThreshold:");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_specifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specifications");
}

id objc_msgSend_startAnimations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimations");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDeviceMotionUpdatesUsingReferenceFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesUsingReferenceFrame:");
}

id objc_msgSend_startMonitoringWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWithHIDEvents:");
}

id objc_msgSend_stationaryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stationaryData");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemClientSetupWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientSetupWithHIDEvents:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_testingOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testingOrientation");
}

id objc_msgSend_ticContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticContainer");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_topInnerCircle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topInnerCircle");
}

id objc_msgSend_topOuterCircle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topOuterCircle");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateColors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateColors");
}

id objc_msgSend_updateTicsForOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTicsForOrientation:");
}

id objc_msgSend_upperBoundOffsetThresholdX(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upperBoundOffsetThresholdX");
}

id objc_msgSend_upperBoundOffsetThresholdY(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upperBoundOffsetThresholdY");
}

id objc_msgSend_upperBoundOffsetThresholdZ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upperBoundOffsetThresholdZ");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_zeroRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zeroRange");
}

id objc_msgSend_zeroRangeThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zeroRangeThreshold");
}
