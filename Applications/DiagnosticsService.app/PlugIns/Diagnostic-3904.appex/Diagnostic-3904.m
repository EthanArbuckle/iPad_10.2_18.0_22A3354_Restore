BOOL sub_100003884(id a1, id a2)
{
  id v2;
  id v3;
  id v4;
  BOOL v5;
  char v7;

  v2 = a2;
  v7 = 0;
  v3 = objc_msgSend(v2, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("xPos"), &off_1000087F8, &off_1000087E8, &v7);
  v4 = objc_msgSend(v2, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("yPos"), &off_1000087F8, &off_1000087E8, &v7);
  v5 = v7 == 0;

  return v5;
}

void sub_100003EB8(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  objc_msgSend(v3, "noInputTimeout");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "noInputTimedOut", 0, 0));
  objc_msgSend(*(id *)(a1 + 32), "setTimeoutTimer:", v2);

}

id sub_100003F30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timedOut");
}

void sub_100004B38(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "targetView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("007AFF"), 0));
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

void sub_100005610(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000058F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005610((void *)&_mh_execute_header, a1, a3, "[ERROR] - Touch Accuracy Test: Parameter not found.", a5, a6, a7, a8, 0);
}

void sub_10000592C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005610((void *)&_mh_execute_header, a1, a3, "[ERROR] - Touch Accuracy Test: Device not connected to power.", a5, a6, a7, a8, 0);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_badTaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "badTaps");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryState");
}

id objc_msgSend_blockHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockHeight");
}

id objc_msgSend_blockWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockWidth");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_celsiusTemperatureFromService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "celsiusTemperatureFromService:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_checkForNextTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForNextTarget");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorWithHexValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithHexValue:error:");
}

id objc_msgSend_connectedToPowerRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedToPowerRequired");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_goodTaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "goodTaps");
}

id objc_msgSend_handleTouchBegan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTouchBegan:");
}

id objc_msgSend_handleTouchEnded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTouchEnded:");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_initWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBool:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBatteryCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBatteryCharging");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isPowerConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowerConnected");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_multiTouchHelper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiTouchHelper");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noInputTimeout");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfBlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBlocks");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parseHIDLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHIDLocationID:");
}

id objc_msgSend_partialInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partialInputTimeout");
}

id objc_msgSend_placeNextTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeNextTarget:");
}

id objc_msgSend_positions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positions");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
}

id objc_msgSend_postInteractiveTestEvent_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postInteractiveTestEvent:info:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBadTaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBadTaps:");
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryMonitoringEnabled:");
}

id objc_msgSend_setBlockHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockHeight:");
}

id objc_msgSend_setBlockWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockWidth:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setConnectedToPowerRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedToPowerRequired:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setGoodTaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGoodTaps:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMultiTouchHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultiTouchHelper:");
}

id objc_msgSend_setNoInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoInputTimeout:");
}

id objc_msgSend_setNumberOfBlocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfBlocks:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPartialInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPartialInputTimeout:");
}

id objc_msgSend_setPositions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPositions:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTargetView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetView:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTouchLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchLocation:");
}

id objc_msgSend_setTouchStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchStatus:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shufflePositions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shufflePositions");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_targetView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetView");
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureData");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_totalTaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTaps");
}

id objc_msgSend_touchLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchLocation");
}

id objc_msgSend_touchStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchStatus");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
