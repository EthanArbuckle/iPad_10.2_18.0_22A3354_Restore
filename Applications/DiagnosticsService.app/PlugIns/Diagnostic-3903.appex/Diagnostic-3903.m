void sub_10000437C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  objc_msgSend(v3, "noInputTimeout");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "noInputTimedOut", 0, 0));
  objc_msgSend(*(id *)(a1 + 32), "setTimeoutTimer:", v2);

}

id sub_1000043F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timedOut");
}

void sub_100004C54(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subviews"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "tag") == (id)1)
        {

          return;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "endTestWithStatusCode:", &off_1000086C8);
}

void sub_1000055DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000589C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000058BC(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  TouchResponsePixel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    v7 = objc_opt_new(TouchResponsePixel);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("xPos"), &off_100008728, &off_100008738, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v8, "doubleValue");
    -[TouchResponsePixel setX:](v7, "setX:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("yPos"), &off_100008728, &off_100008738, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v9, "doubleValue");
    -[TouchResponsePixel setY:](v7, "setY:");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("width"), &off_100008748, &off_100008738, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v10, "doubleValue");
    -[TouchResponsePixel setWidth:](v7, "setWidth:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("height"), &off_100008748, &off_100008738, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v11, "doubleValue");
    -[TouchResponsePixel setHeight:](v7, "setHeight:");

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if (a4 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

void sub_100005B28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000055DC((void *)&_mh_execute_header, a1, a3, "[ERROR] - Touch Response Test: Parameter not found.", a5, a6, a7, a8, 0);
}

void sub_100005B5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000055DC((void *)&_mh_execute_header, a1, a3, "[ERROR] - Touch Response Test: Device not connected to power.", a5, a6, a7, a8, 0);
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
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

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryState");
}

id objc_msgSend_blockColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_celsiusTemperatureFromService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "celsiusTemperatureFromService:");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_colorWithHexValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithHexValue:error:");
}

id objc_msgSend_connectedToPowerRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedToPowerRequired");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
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

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_dictionaryFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromRequiredKey:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
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

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "height");
}

id objc_msgSend_highlightView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highlightView:");
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

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nativeScale");
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noInputTimeout");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_parseHIDLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHIDLocationID:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
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

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryMonitoringEnabled:");
}

id objc_msgSend_setBlockColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockColor:");
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

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setMultiTouchHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultiTouchHelper:");
}

id objc_msgSend_setNoInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoInputTimeout:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTestFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestFinished:");
}

id objc_msgSend_setTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutSeconds:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTouchMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchMap:");
}

id objc_msgSend_setTouchMapDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchMapDictionary:");
}

id objc_msgSend_setTouchRegions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchRegions:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setX_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setX:");
}

id objc_msgSend_setY_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setY:");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag");
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureData");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_testFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testFinished");
}

id objc_msgSend_timeoutSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutSeconds");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_touchMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchMap");
}

id objc_msgSend_touchMapDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchMapDictionary");
}

id objc_msgSend_touchRegions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchRegions");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "width");
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "x");
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "y");
}
