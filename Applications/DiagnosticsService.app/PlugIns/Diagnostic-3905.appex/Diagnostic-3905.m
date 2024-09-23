void sub_10000221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002244(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  UnexpectedTouchPixel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    v7 = objc_opt_new(UnexpectedTouchPixel);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("xPos"), &off_1000087F0, &off_100008800, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v8, "doubleValue");
    -[UnexpectedTouchPixel setX:](v7, "setX:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("yPos"), &off_1000087F0, &off_100008800, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v9, "doubleValue");
    -[UnexpectedTouchPixel setY:](v7, "setY:");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("width"), &off_100008810, &off_100008800, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v10, "doubleValue");
    -[UnexpectedTouchPixel setWidth:](v7, "setWidth:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("height"), &off_100008810, &off_100008800, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v11, "doubleValue");
    -[UnexpectedTouchPixel setHeight:](v7, "setHeight:");

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

void sub_100004264(uint64_t a1)
{
  float v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setSecondsTicked:", objc_msgSend(*(id *)(a1 + 32), "secondsTicked") + 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressBar"));
  v2 = (float)(int)objc_msgSend(*(id *)(a1 + 32), "secondsTicked");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  *(float *)&v4 = v2 / (float)(int)(60 * objc_msgSend(v3, "minutesToRun"));
  objc_msgSend(v5, "setProgress:animated:", 1, v4);

}

void sub_1000042FC(uint64_t a1, int a2)
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  unsigned int v7;
  signed int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD block[5];

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressBar"));
    objc_msgSend(v3, "progress");
    v5 = v4;

    if (v5 >= 1.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TEST_COMPLETED"), &stru_1000086A8, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressLabel"));
      objc_msgSend(v13, "setText:", v12);

      v14 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004494;
      block[3] = &unk_100008298;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
      v7 = objc_msgSend(v15, "minutesToRun");
      v8 = objc_msgSend(*(id *)(a1 + 32), "secondsTicked");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedTimeRemaining:", ((int)(((unint64_t)(2004318071 * v8) >> 32) - v8) >> 5)+ ((((unint64_t)(2004318071 * v8) >> 32) - v8) >> 31)+ v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressLabel"));
      objc_msgSend(v10, "setText:", v9);

    }
  }
}

id sub_100004494(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTest");
}

void sub_100004E98(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fadeColor"));
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
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

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
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

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
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

id objc_msgSend_darkTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "darkTextColor");
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

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_doNotDisturbLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doNotDisturbLabel");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_fadeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeColor");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "height");
}

id objc_msgSend_highlightView_touchEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highlightView:touchEvent:");
}

id objc_msgSend_hitPixelTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hitPixelTimes");
}

id objc_msgSend_hitPixels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hitPixels");
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

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressViewStyle:");
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

id objc_msgSend_isBatteryCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBatteryCharging");
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

id objc_msgSend_localizedTimeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedTimeRemaining:");
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

id objc_msgSend_minutesToRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minutesToRun");
}

id objc_msgSend_multiTouchHelper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiTouchHelper");
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nativeScale");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_parseHIDLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHIDLocationID:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_progressBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressBar");
}

id objc_msgSend_progressLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressLabel");
}

id objc_msgSend_progressTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressTimer");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
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

id objc_msgSend_secondsTicked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsTicked");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryMonitoringEnabled:");
}

id objc_msgSend_setConnectedToPowerRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedToPowerRequired:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDoNotDisturbLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotDisturbLabel:");
}

id objc_msgSend_setFadeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFadeColor:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFormattingContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormattingContext:");
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setHitPixelTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHitPixelTimes:");
}

id objc_msgSend_setHitPixels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHitPixels:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMaximumUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumUnitCount:");
}

id objc_msgSend_setMinutesToRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinutesToRun:");
}

id objc_msgSend_setMultiTouchHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultiTouchHelper:");
}

id objc_msgSend_setMultipleTouchEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultipleTouchEnabled:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgress_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:animated:");
}

id objc_msgSend_setProgressBar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressBar:");
}

id objc_msgSend_setProgressLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressLabel:");
}

id objc_msgSend_setProgressTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressTimer:");
}

id objc_msgSend_setProgressView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressView:");
}

id objc_msgSend_setSecondsTicked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondsTicked:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTouchColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchColor:");
}

id objc_msgSend_setTouchEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchEvents:");
}

id objc_msgSend_setTouchMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchMap:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
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

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureData");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_touchColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchColor");
}

id objc_msgSend_touchEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchEvents");
}

id objc_msgSend_touchMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchMap");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
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
