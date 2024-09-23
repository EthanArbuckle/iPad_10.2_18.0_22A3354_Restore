id *sub_1000049F0(id *result, void *a2)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  const __CFString *v29;

  if (a2)
  {
    v2 = result;
    objc_msgSend(a2, "acceleration");
    v4 = v3;
    v6 = fabs(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "xThreshold"));
    objc_msgSend(v7, "doubleValue");
    if (v6 > fabs(v8))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "zThreshold"));
      objc_msgSend(v9, "doubleValue");
      v11 = fabs(v10);

      if (fabs(v4) <= v11)
        return (id *)objc_msgSend(v2[4], "stop");
    }
    v12 = DiagnosticLogHandleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "xThreshold"));
      objc_msgSend(v15, "doubleValue");
      v17 = fabs(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "zThreshold"));
      objc_msgSend(v18, "doubleValue");
      v20 = 134219010;
      v21 = v6;
      v22 = 2048;
      v23 = fabs(v4);
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = fabs(v19);
      v28 = 2112;
      v29 = CFSTR("IncorrectOrientationNotification");
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Gyroscope values { x: %f z: %f } are out of the thresholds allowed { x: %f z: %f }. Posting %@", (uint8_t *)&v20, 0x34u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("IncorrectOrientationNotification"), 0);

    return (id *)objc_msgSend(v2[4], "stop");
  }
  return result;
}

void sub_100004F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100004F9C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "acceleration");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v7 > *(double *)(v10 + 24))
      *(double *)(v10 + 24) = v7;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v7 < *(double *)(v11 + 24))
      *(double *)(v11 + 24) = v7;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 > *(double *)(v12 + 24))
      *(double *)(v12 + 24) = v8;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v8 < *(double *)(v13 + 24))
      *(double *)(v13 + 24) = v8;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v9 > *(double *)(v14 + 24))
      *(double *)(v14 + 24) = v9;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v16 = *(double *)(v15 + 24);
    if (v9 < v16)
    {
      *(double *)(v15 + 24) = v9;
      v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v22 = vabdd_f64(v17, v18);
    v23 = vabdd_f64(v19, v20);
    v24 = vabdd_f64(v21, v16);
    if (v23 < v24)
      v23 = v24;
    if (v22 >= v23)
      v25 = v22;
    else
      v25 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "threshold"));
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    if (v25 > v28)
    {
      v29 = DiagnosticLogHandleForCategory(3);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "threshold"));
        objc_msgSend(v34, "doubleValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17 - v18));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 - v20));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21 - v16));
        v39 = 138413058;
        v40 = v35;
        v41 = 2112;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        v45 = 2112;
        v46 = v38;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Motion detection threshold value %@ exceeded. X: %@ Y: %@ Z: %@", (uint8_t *)&v39, 0x2Au);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("MotionDetectedNotification"), 0);

    }
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v32 + 24))
    {
      *(_BYTE *)(v32 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0x10000000000000;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0x10000000000000;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x10000000000000;
    }
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "motionManager"));
    objc_msgSend(v33, "stopAccelerometerUpdates");

  }
}

id numberOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

void forceTouchImageCallback(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  signed int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  signed int v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006E64;
  v18[3] = &unk_10000C3B8;
  v6 = a4;
  v19 = v6;
  v20 = a3;
  if (qword_100011A60 != -1)
    dispatch_once(&qword_100011A60, v18);
  v7 = objc_msgSend(v6, "deviceOrientation");
  if (v7 == (id)5)
  {
    v8 = objc_msgSend(v6, "upFrameNumber");
    v9 = objc_msgSend(v6, "faceUpPixelMaps");
  }
  else
  {
    v8 = objc_msgSend(v6, "downFrameNumber");
    v9 = objc_msgSend(v6, "faceDownPixelMaps");
  }
  v10 = (void *)v9[v8];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
  v12 = objc_msgSend(v11, "numFramesToRecord");

  if (v8 >= v12)
  {
    if (v7 == (id)5)
    {
      if ((objc_msgSend(v6, "isFinishedFaceUpPixelMaps") & 1) != 0)
        goto LABEL_16;
      objc_msgSend(v6, "setIsFinishedFaceUpPixelMaps:", 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006E70;
      block[3] = &unk_10000C390;
      v17 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v13 = v17;
    }
    else
    {
      if ((objc_msgSend(v6, "isFinishedFaceDownPixelMaps") & 1) != 0)
        goto LABEL_16;
      objc_msgSend(v6, "setIsFinishedFaceDownPixelMaps:", 1);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006EB4;
      v14[3] = &unk_10000C390;
      v15 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      v13 = v15;
    }

    goto LABEL_16;
  }
  memcpy(v10, a2, 2 * *(__int16 *)(a3 + 16) * (uint64_t)*(__int16 *)(a3 + 18));
  if (v7 == (id)5)
    objc_msgSend(v6, "setUpFrameNumber:", objc_msgSend(v6, "upFrameNumber") + 1);
  else
    objc_msgSend(v6, "setDownFrameNumber:", objc_msgSend(v6, "downFrameNumber") + 1);
LABEL_16:

}

void sub_100006D30(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "flipInstructionImageView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_100006E64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRowZeroAtBottom:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 38));
}

void sub_100006E70(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "samplingTimer"));
  objc_msgSend(v1, "samplingFinished:", v2);

}

void sub_100006EB4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "samplingTimer"));
  objc_msgSend(v1, "samplingFinished:", v2);

}

void sub_100007B78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007B9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10000813C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007B90();
  sub_100007B78((void *)&_mh_execute_header, v0, v1, "You started the test with the device in an orientation that is not Face Up", v2, v3, v4, v5, v6);
  sub_100007B88();
}

void sub_100008168()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007B90();
  sub_100007B78((void *)&_mh_execute_header, v0, v1, "The angle at which the device is at is too steep to get a stable reading", v2, v3, v4, v5, v6);
  sub_100007B88();
}

void sub_100008194()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007B90();
  sub_100007B78((void *)&_mh_execute_header, v0, v1, "The test was cancelled due to Excessive Motion", v2, v3, v4, v5, v6);
  sub_100007B88();
}

void sub_1000081C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007B90();
  sub_100007B78((void *)&_mh_execute_header, v0, v1, "The device was not flipped in the time allocated", v2, v3, v4, v5, v6);
  sub_100007B88();
}

void sub_1000081EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007B90();
  sub_100007B78((void *)&_mh_execute_header, v0, v1, "Test cancelled by touching display", v2, v3, v4, v5, v6);
  sub_100007B88();
}

void sub_100008218(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100007B9C((void *)&_mh_execute_header, a2, a3, "Ended Swollen Battery Test with status code: %@.", (uint8_t *)&v3);
}

void sub_100008284(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
  v6 = 138412290;
  v7 = v4;
  sub_100007B9C((void *)&_mh_execute_header, a2, v5, "%@", (uint8_t *)&v6);

}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceleration");
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

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allocatePixelMaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocatePixelMaps");
}

id objc_msgSend_angleTolerance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "angleTolerance");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attitude");
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioRouteChanged");
}

id objc_msgSend_batteryTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryTemp");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_builtInDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builtInDevice");
}

id objc_msgSend_celsiusTemperatureFromService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "celsiusTemperatureFromService:");
}

id objc_msgSend_checkIfCorrectOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIfCorrectOrientation:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_determineBatteryGasGaugeTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineBatteryGasGaugeTemp");
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMotion");
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceOrientation");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableSensorMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableSensorMonitoring");
}

id objc_msgSend_displayLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLink");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downFrameNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downFrameNumber");
}

id objc_msgSend_enableSensorMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSensorMonitoring");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_faceDownPixelMaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceDownPixelMaps");
}

id objc_msgSend_faceUpPixelMaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceUpPixelMaps");
}

id objc_msgSend_flipInstructionImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipInstructionImageView");
}

id objc_msgSend_flipSetupTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipSetupTimeout");
}

id objc_msgSend_flipSetupTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipSetupTimer");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithThreshold:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_instructionImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructionImageName");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerActive");
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerAvailable");
}

id objc_msgSend_isCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCompleted");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinishedFaceDownPixelMaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinishedFaceDownPixelMaps");
}

id objc_msgSend_isFinishedFaceUpPixelMaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinishedFaceUpPixelMaps");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mergeFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFrames:");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumbers");
}

id objc_msgSend_monitoringAngle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoringAngle");
}

id objc_msgSend_motionDetectionMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionDetectionMonitor");
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManager");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numFramesToRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numFramesToRecord");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_parseHIDLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHIDLocationID:");
}

id objc_msgSend_pixelMapHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pixelMapHeight");
}

id objc_msgSend_pixelMapWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pixelMapWidth");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portType");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForLocalNotifications");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationMatrix");
}

id objc_msgSend_rowZeroAtBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rowZeroAtBottom");
}

id objc_msgSend_samplingFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingFinished:");
}

id objc_msgSend_samplingSetupTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingSetupTimeout");
}

id objc_msgSend_samplingSetupTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingSetupTimer");
}

id objc_msgSend_samplingTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingTimeout");
}

id objc_msgSend_samplingTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplingTimer");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAccelerometerUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccelerometerUpdateInterval:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAngleTolerance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAngleTolerance:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBatteryTemp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryTemp:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setDeviceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceOrientation:");
}

id objc_msgSend_setDisplayLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayLink:");
}

id objc_msgSend_setDownFrameNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownFrameNumber:");
}

id objc_msgSend_setFaceDownPixelMaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceDownPixelMaps:");
}

id objc_msgSend_setFaceUpPixelMaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceUpPixelMaps:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFlipInstructionImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlipInstructionImageView:");
}

id objc_msgSend_setFlipSetupTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlipSetupTimeout:");
}

id objc_msgSend_setFlipSetupTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlipSetupTimer:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCompleted:");
}

id objc_msgSend_setIsFinishedFaceDownPixelMaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFinishedFaceDownPixelMaps:");
}

id objc_msgSend_setIsFinishedFaceUpPixelMaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFinishedFaceUpPixelMaps:");
}

id objc_msgSend_setMonitoringAngle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoringAngle:");
}

id objc_msgSend_setMotionDetectionMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionDetectionMonitor:");
}

id objc_msgSend_setMotionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionManager:");
}

id objc_msgSend_setNumFramesToRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumFramesToRecord:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPixelMapHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPixelMapHeight:");
}

id objc_msgSend_setPixelMapWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPixelMapWidth:");
}

id objc_msgSend_setSamplingSetupTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSamplingSetupTimeout:");
}

id objc_msgSend_setSamplingSetupTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSamplingSetupTimer:");
}

id objc_msgSend_setSamplingTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSamplingTimeout:");
}

id objc_msgSend_setSamplingTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSamplingTimer:");
}

id objc_msgSend_setShowsDeviceMovementDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsDeviceMovementDisplay:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setUpFrameNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpFrameNumber:");
}

id objc_msgSend_setupAngleMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAngleMonitoring");
}

id objc_msgSend_setupAngleMotionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAngleMotionManager");
}

id objc_msgSend_setupExcessiveMotionNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupExcessiveMotionNotification");
}

id objc_msgSend_setupHIDForceTouchImageRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHIDForceTouchImageRecognizer");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAccelerometerUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccelerometerUpdatesToQueue:withHandler:");
}

id objc_msgSend_startDeviceMotionUpdatesUsingReferenceFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesUsingReferenceFrame:");
}

id objc_msgSend_startExcessiveMotionMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startExcessiveMotionMonitoring");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccelerometerUpdates");
}

id objc_msgSend_stopExcessiveMotionMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopExcessiveMotionMonitoring");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureData");
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threshold");
}

id objc_msgSend_touchAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchAllowed");
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForLocalNotifications");
}

id objc_msgSend_upFrameNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upFrameNumber");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xThreshold");
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zThreshold");
}
