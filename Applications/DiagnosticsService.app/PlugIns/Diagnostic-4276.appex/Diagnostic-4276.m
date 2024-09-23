void sub_100002720(id a1)
{
  DAOpticalProximityManager *v1;
  void *v2;

  v1 = objc_alloc_init(DAOpticalProximityManager);
  v2 = (void *)qword_100011C80;
  qword_100011C80 = (uint64_t)v1;

}

void MTProximityChangedCallbackFunc(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[DAOpticalProximityManager sharedInstance](DAOpticalProximityManager, "sharedInstance"));
  objc_msgSend(v3, "handleNewProximityValue:", a2);

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

void sub_100002D7C(id a1)
{
  DADopplerProximityManager *v1;
  void *v2;

  v1 = objc_alloc_init(DADopplerProximityManager);
  v2 = (void *)qword_100011C90;
  qword_100011C90 = (uint64_t)v1;

}

void sub_10000301C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_100003034(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "activateProximitySensor");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100003064(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRunLoop");
}

void sub_1000034F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a7 == 132)
  {
    v18 = v10;
    v19 = v9;
    v20 = v7;
    v21 = v8;
    v11 = *(_DWORD *)(a6 + 16);
    v12 = a1;
    v13 = v12[7];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100003764;
    v15[3] = &unk_10000C4A8;
    v16 = v12;
    v17 = v11;
    v14 = v12;
    dispatch_async(v13, v15);

  }
}

void sub_100003764(uint64_t a1)
{
  float *v2;
  float v3;
  uint64_t v4;
  NSObject *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isUpdating"))
  {
    v3 = *(float *)(a1 + 40);
    v2 = (float *)(a1 + 40);
    objc_msgSend(*((id *)v2 - 1), "handleNewProximityValue:", (int)v3);
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000071B8(v2, v5);

  }
}

void sub_100003FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003FD0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003FE0(uint64_t a1)
{

}

void sub_100003FE8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  uint8_t buf[4];
  uint64_t v25;

  v3 = a2;
  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v6)
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asset data for [%@] is nil", buf, 0xCu);
    }

    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("Image asset data is nil.");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15 = -7;
    goto LABEL_11;
  }
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got asset data for [%@]", buf, 0xCu);
  }

  v8 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v3);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to load asset data for [%@]", buf, 0xCu);
    }

    v22 = NSLocalizedDescriptionKey;
    v23 = CFSTR("Downloaded image data is not compatible with UIImage.");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v15 = -6;
LABEL_11:
    v17 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAProximitySensorErrorDomain"), v15, v14));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_100004928(uint64_t a1)
{
  id *v1;
  id v2;
  NSObject *v3;
  NSObject *v4;
  _UNKNOWN **v5;
  uint64_t v6;

  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "testPhase");
  if (v2 == (id)2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "result"));
    v4 = v3;
    v5 = &off_10000CB00;
    goto LABEL_7;
  }
  if (v2 == (id)1)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "result"));
    v4 = v3;
    v5 = &off_10000CAE8;
    goto LABEL_7;
  }
  if (!v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "result"));
    v4 = v3;
    v5 = &off_10000CAD0;
LABEL_7:
    -[NSObject setStatusCode:](v3, "setStatusCode:", v5);
    goto LABEL_10;
  }
  v6 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100007334(v1, v4);
LABEL_10:

  return objc_msgSend(*v1, "setTestPhase:", 3);
}

id sub_1000049F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTestPhase:", 0);
}

void sub_100004BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004BE0(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (a2 < 200 && v7 == 1)
  {
    v9 = v5;
    v8 = 0;
LABEL_7:
    *(_QWORD *)(v6 + 24) = v8;
    objc_msgSend(*(id *)(a1 + 32), "resetHoldTimerWithProximityState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v5 = v9;
    goto LABEL_8;
  }
  if (a2 > 200 && !v7)
  {
    v9 = v5;
    v8 = 1;
    goto LABEL_7;
  }
LABEL_8:

}

void sub_10000504C(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "stopHoldTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "holdTime"));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v5, "holdTimerFinished:", v6, 0, v4));
  objc_msgSend(*(id *)(a1 + 32), "setHoldTimer:", v7);

}

void sub_1000054EC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "instructionImageView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_1000055B4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "instructionImageView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100005858(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100006424(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(DAHIDEventMonitor);
  v2 = (void *)qword_100011CA0;
  qword_100011CA0 = (uint64_t)v1;

}

void sub_100006944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000695C(uint64_t a1)
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
      sub_100007418();

  }
}

void sub_100006DC4(_Unwind_Exception *a1)
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

void sub_100006FA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100006FC0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpSystemClient");
}

void sub_10000710C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007130(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Found %li dopplers, which is unexpected. Taking the first one.", (uint8_t *)&v3, 0xCu);
}

double sub_1000071B8(float *a1, NSObject *a2)
{
  double v2;
  double result;
  int v4;
  double v5;

  v2 = *a1;
  v4 = 134217984;
  v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "ProxVal = %f", (uint8_t *)&v4, 0xCu);
  return result;
}

void sub_100007234(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "proximityState");
  objc_msgSend(a1, "testPhase");
  sub_10000587C();
  sub_100005858((void *)&_mh_execute_header, v2, v3, "Hit unexpected proximity state (%lu) with test phase (%lu).", v4, v5, v6, v7, v8);
  sub_10000586C();
}

void sub_1000072B4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "testPhase");
  objc_msgSend(a1, "proximityState");
  sub_10000587C();
  sub_100005858((void *)&_mh_execute_header, v2, v3, "Hit unexpected test phase (%lu) with proximity state (%lu).", v4, v5, v6, v7, v8);
  sub_10000586C();
}

void sub_100007334(id *a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = objc_msgSend(*a1, "testPhase");
  v4 = 134217984;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Hit unexpected test phase (%lu) while timed out.", (uint8_t *)&v4, 0xCu);
}

void sub_1000073C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007124();
  sub_10000710C((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
  sub_10000711C();
}

void sub_1000073EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007124();
  sub_10000710C((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
  sub_10000711C();
}

void sub_100007418()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007124();
  sub_10000710C((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
  sub_10000711C();
}

void sub_100007444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007124();
  sub_10000710C((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
  sub_10000711C();
}

void sub_100007470()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007124();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
  sub_10000711C();
}

void sub_1000074A8(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_1000074E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007124();
  sub_10000710C((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
  sub_10000711C();
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEvents");
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDSystemClient");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateProximitySensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateProximitySensor");
}

id objc_msgSend_actualCloseStateThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actualCloseStateThreshold");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_assetDownloadTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDownloadTimeout");
}

id objc_msgSend_backupDopplerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupDopplerState");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buffer");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpSystemClient");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
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

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_deactivateProximitySensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateProximitySensor");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deregisterForCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterForCallback");
}

id objc_msgSend_deviceRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRef");
}

id objc_msgSend_deviceSetDetectionModeActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSetDetectionModeActive:");
}

id objc_msgSend_deviceSetStreamEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSetStreamEnabled:");
}

id objc_msgSend_deviceStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStart");
}

id objc_msgSend_deviceStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStop");
}

id objc_msgSend_deviceUsageMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUsageMap");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableProximitySensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableProximitySensor");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromKey_maxLength_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downImage");
}

id objc_msgSend_downImageFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downImageFileName");
}

id objc_msgSend_downloadImageAsset_withResponder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadImageAsset:withResponder:error:");
}

id objc_msgSend_enableProximitySensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableProximitySensor");
}

id objc_msgSend_endTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTest");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMonitor");
}

id objc_msgSend_findServiceClientForHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findServiceClientForHIDEvent:");
}

id objc_msgSend_finishEarlyWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishEarlyWithStatus:");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getHIDReportForDevice_reportType_reportID_buffer_bufferSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHIDReportForDevice:reportType:reportID:buffer:bufferSize:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_handleNewProximityValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNewProximityValue:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hideInstructionImageAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideInstructionImageAnimated:");
}

id objc_msgSend_holdTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdTime");
}

id objc_msgSend_holdTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdTimer");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_instructionImageForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructionImageForPhase:");
}

id objc_msgSend_instructionImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructionImageView");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isUpdating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUpdating");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
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

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
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

id objc_msgSend_opticalSensorPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opticalSensorPresent");
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

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryUsage");
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryUsagePage");
}

id objc_msgSend_proxDeviceRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxDeviceRef");
}

id objc_msgSend_proxQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxQueue");
}

id objc_msgSend_proxRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxRunLoop");
}

id objc_msgSend_proximityManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proximityManager");
}

id objc_msgSend_proximityState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proximityState");
}

id objc_msgSend_registerForCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForCallback");
}

id objc_msgSend_registerProximityChangedCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerProximityChangedCallback");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resetHoldTimerWithProximityState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetHoldTimerWithProximityState:");
}

id objc_msgSend_resetTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetTimeoutTimer");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_retrieveHIDDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveHIDDevice");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduleProximityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleProximityUpdates");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_sensorData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorData");
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorType");
}

id objc_msgSend_setActualCloseStateThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActualCloseStateThreshold:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAssetDownloadTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetDownloadTimeout:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCurrentlyMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyMonitoring:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDownImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownImage:");
}

id objc_msgSend_setDownImageFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownImageFileName:");
}

id objc_msgSend_setEventMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMonitor:");
}

id objc_msgSend_setHIDReportForDevice_reportType_reportID_buffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDReportForDevice:reportType:reportID:buffer:");
}

id objc_msgSend_setHIDSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDSystemClient:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHoldTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHoldTime:");
}

id objc_msgSend_setHoldTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHoldTimer:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setInstructionImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstructionImageView:");
}

id objc_msgSend_setMHIDEventQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMHIDEventQueue:");
}

id objc_msgSend_setNoInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoInputTimeout:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProxDeviceRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxDeviceRef:");
}

id objc_msgSend_setProxRunLoop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxRunLoop:");
}

id objc_msgSend_setProximityManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProximityManager:");
}

id objc_msgSend_setProximityState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProximityState:");
}

id objc_msgSend_setSensorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSensorType:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTestPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestPhase:");
}

id objc_msgSend_setTimedOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimedOut:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setUpImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpImage:");
}

id objc_msgSend_setUpImageFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpImageFileName:");
}

id objc_msgSend_setUpdating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdating:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupUI");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showAlertWithTitle_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithTitle:message:");
}

id objc_msgSend_startMonitoringWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWithHIDEvents:");
}

id objc_msgSend_startProximitySensorUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProximitySensorUpdatesWithHandler:");
}

id objc_msgSend_stopHoldTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopHoldTimer");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopProximitySensorUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopProximitySensorUpdates");
}

id objc_msgSend_stopTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTimeoutTimer");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_systemClientSetupWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientSetupWithHIDEvents:");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_testPhase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testPhase");
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timedOut");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_unregisterProximityChangedCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterProximityChangedCallback");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_upImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upImage");
}

id objc_msgSend_upImageFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upImageFileName");
}

id objc_msgSend_usageDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageDeviceMap");
}

id objc_msgSend_usageFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageFromDevice:");
}

id objc_msgSend_usageSubscribers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageSubscribers");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
