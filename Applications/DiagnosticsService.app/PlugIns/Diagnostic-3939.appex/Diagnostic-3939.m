void sub_100004420(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(DAHIDEventMonitor);
  v2 = (void *)qword_1000167E8;
  qword_1000167E8 = (uint64_t)v1;

}

void sub_100004940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004958(uint64_t a1)
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
      sub_10000A9FC();

  }
}

void sub_100004DC0(_Unwind_Exception *a1)
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

void sub_100004FA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100004FBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpSystemClient");
}

void sub_100005108(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100007C78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007C88(uint64_t a1)
{

}

void sub_100007C90(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100007CDC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = DiagnosticLogHandleForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Haptic engine was reset", buf, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hapticEngine"));
    v14 = 0;
    objc_msgSend(v4, "startAndReturnError:", &v14);
    v5 = v14;

    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10000AB8C((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }

}

void sub_100007DC4(id a1, int64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  int64_t v6;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Haptic engine stoped for reason %ld", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100007E68(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "buttonEventMonitor"));
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "addTarget:action:forButtonEvents:propagate:", v3, "didReceiveButtonEvent:", objc_msgSend(v3, "targetButtonEvents"), 0);

}

void sub_10000859C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonParameters"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segments"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "switchParameters"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
    v5 = v9;
    if (v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "switchParameters"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "states"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "touchButtonParameters"));

      if (!v10)
        return;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "touchButtonParameters"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetEvents"));
    }
  }
  v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(a1 + 32), "currentSegment")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "range"));

  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    v15 = objc_msgSend(v13, "transitionAssetRange");
    v17 = v16;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000874C;
    v19[3] = &unk_100010560;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v13;
    v18 = v13;
    objc_msgSend(v14, "showTransitionWithRange:WithCompletionHandler:", v15, v17, v19);

  }
}

void sub_10000874C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "spriteImage"));
  v4 = objc_msgSend(*(id *)(a1 + 40), "displayAssetRange");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonSwitchSpecification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset"));
  objc_msgSend(v9, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DASpriteImage imagesFromSprite:inRange:withImageSize:](DASpriteImage, "imagesFromSprite:inRange:withImageSize:", v3, v4, v6));
  objc_msgSend(v2, "setAnimationImages:", v10);

  objc_msgSend(*(id *)(a1 + 40), "displayAssetRange");
  v12 = (double)v11 / 60.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testImage"));
  objc_msgSend(v13, "setAnimationRepeatCount:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testImage"));
  objc_msgSend(v14, "setAnimationDuration:", v12);

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testImage"));
  objc_msgSend(v15, "startAnimating");

}

uint64_t sub_100008A78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100008B58(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C68;
  block[3] = &unk_100010430;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
    +[CBSUtilities disableTouchButtonEvents](CBSUtilities, "disableTouchButtonEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  v3 = objc_msgSend(v2, "currentlyMonitoring");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
    objc_msgSend(v4, "stopMonitoring");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hapticEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hapticEngine"));
    objc_msgSend(v6, "stopWithCompletionHandler:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setHapticEngine:", 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100008C68(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimer"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeoutTimer"));
    objc_msgSend(v3, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setTimeoutTimer:", 0);
  }
}

intptr_t sub_100008D50(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100008DD4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  void *v22;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v3, "setStatusCode:", v2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusCode"));
  v6 = objc_msgSend(v5, "isEqualToNumber:", &off_1000111B0);

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000ABF0(v8, v9, v10, v11, v12, v13, v14, v15);

    goto LABEL_7;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allResults"));

  if (!v16)
  {
LABEL_7:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    objc_msgSend(v17, "setData:", &__NSDictionary0__struct);
    goto LABEL_8;
  }
  v21 = CFSTR("inputEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allResults"));
  v22 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v19, "setData:", v18);

LABEL_8:
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void sub_10000920C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009248(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "touchButtonParameters"));

  v6 = objc_loadWeakRetained(v2);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setupTest");

    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "setAllResults:", v8);

    objc_msgSend(*(id *)(a1 + 32), "startTimer");
    objc_msgSend(*(id *)(a1 + 32), "showNextSegment");
    objc_msgSend(*(id *)(a1 + 32), "setIsInputMonitoringPaused:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonEventMonitor"));
    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "addTarget:action:forButtonEvents:propagate:", v11, "didReceiveButtonEvent:", objc_msgSend(v11, "targetButtonEvents"), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setIsInputMonitoringPaused:", 0);
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "resetTimer");

}

void sub_100009384(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "touchButtonParameters"));

  v6 = objc_loadWeakRetained(v2);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "timedOut");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonEventMonitor"));
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "addTarget:action:forButtonEvents:propagate:", v9, "didReceiveButtonEvent:", objc_msgSend(v9, "targetButtonEvents"), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setIsInputMonitoringPaused:", 0);
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "setButtonFailure:", 1);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "showNextSegment");

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "resetTimer");

}

id sub_100009CA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetTimer");
}

void sub_100009D68(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t IntegerValue;
  float FloatValue;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD block[5];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[4];
  _QWORD v43[4];
  uint8_t buf[4];
  uint64_t v45;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "touchButtonParameters"));

  if (v3
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isInputMonitoringPaused") & 1) == 0
    && IOHIDEventGetType(*(_QWORD *)(a1 + 40)) == 42)
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found touch sensitive button event %@", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v8 * 1000.0)));

    IntegerValue = IOHIDEventGetIntegerValue(*(_QWORD *)(a1 + 40), 2752516);
    FloatValue = IOHIDEventGetFloatValue(*(_QWORD *)(a1 + 40), 2752514);
    v12 = _UIEventHIDGetChildForceStageEvent(*(_QWORD *)(a1 + 40));
    if (v12)
      v13 = (uint64_t)IOHIDEventGetFloatValue(v12, 2686976);
    else
      v13 = -1;
    v42[0] = CFSTR("type");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "type"));
    v43[0] = v14;
    v42[1] = CFSTR("identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v43[1] = v16;
    v43[2] = v9;
    v37 = (void *)v9;
    v42[2] = CFSTR("timestamp");
    v42[3] = CFSTR("eventData");
    v40[0] = CFSTR("touch");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", IntegerValue));
    v41[0] = v17;
    v40[1] = CFSTR("stage");
    v36 = v13;
    v35 = IntegerValue;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v13));
    v41[1] = v18;
    v40[2] = CFSTR("positionY");
    *(float *)&v19 = FloatValue;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
    v41[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 3));
    v43[3] = v21;
    v22 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));

    v23 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allResults"));
    objc_msgSend(v24, "addObject:", v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "targetEvents"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(a1 + 32), "currentSegment")));

    v27 = objc_msgSend(v26, "eventType");
    if (v27 == (id)1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v35));
      v34 = objc_msgSend(v32, "isEqualToNumber:", v33);

      v28 = v37;
      if (!v34)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v28 = v37;
      if (v27)
        goto LABEL_21;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v36));
      v31 = objc_msgSend(v29, "isEqualToNumber:", v30);

      if ((v31 & 1) == 0)
        goto LABEL_21;
    }
    if (objc_msgSend(v3, "resetTimer"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A298;
      block[3] = &unk_100010430;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    if (objc_msgSend(v26, "performHapticOnEvent"))
      objc_msgSend(*(id *)(a1 + 32), "playHaptic");
    objc_msgSend(*(id *)(a1 + 32), "setCurrentSegmentActionCount:", objc_msgSend(*(id *)(a1 + 32), "currentSegmentActionCount") + 1);
    objc_msgSend(*(id *)(a1 + 32), "showNextSegment");
    goto LABEL_21;
  }
LABEL_22:

}

uint64_t _UIEventHIDGetChildForceStageEvent(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A6BC;
  v3[3] = &unk_100010690;
  v3[4] = &v4;
  _UIEventHIDEnumerateChildren(a1, 41, v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A298(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetTimer");
}

void sub_10000A534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10000A554(id a1, NSError *a2)
{
  return 1;
}

void sub_10000A55C(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v11 = 0;
  objc_msgSend(v1, "startAtTime:error:", &v11, 0.0);
  v2 = v11;
  if (v2)
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000AC24((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

  }
}

void _UIEventHIDEnumerateChildren(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, const void *, CFIndex, _BYTE *);
  const __CFArray *Children;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const void *ValueAtIndex;
  const void *v12;
  BOOL v13;
  char v14;

  v5 = a3;
  if (!(_DWORD)a2 || IOHIDEventConformsTo(a1, a2))
  {
    Children = (const __CFArray *)IOHIDEventGetChildren(a1);
    if (Children)
    {
      v7 = Children;
      Count = CFArrayGetCount(Children);
      v14 = 0;
      if (Count >= 1)
      {
        v9 = Count;
        v10 = 0;
        do
        {
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
            v12 = ValueAtIndex;
            if (!(_DWORD)a2 || IOHIDEventGetType(ValueAtIndex) == (_DWORD)a2)
              break;
            if (++v10 >= v9)
              goto LABEL_14;
          }
          v5[2](v5, v12, v10++, &v14);
          if (v14)
            v13 = 0;
          else
            v13 = v10 < v9;
        }
        while (v13);
      }
    }
  }
LABEL_14:

}

uint64_t sub_10000A6BC(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

void sub_10000A98C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A9A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005120();
  sub_100005108((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
  sub_100005118();
}

void sub_10000A9D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005120();
  sub_100005108((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
  sub_100005118();
}

void sub_10000A9FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005120();
  sub_100005108((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
  sub_100005118();
}

void sub_10000AA28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005120();
  sub_100005108((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
  sub_100005118();
}

void sub_10000AA54()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100005120();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
  sub_100005118();
}

void sub_10000AA8C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_10000AAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005120();
  sub_100005108((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
  sub_100005118();
}

void sub_10000AAF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005108((void *)&_mh_execute_header, a1, a3, "Failed to parse Specification", a5, a6, a7, a8, 0);
}

void sub_10000AB28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A98C((void *)&_mh_execute_header, a2, a3, "Failed to initialize haptic engine with error: %@", a5, a6, a7, a8, 2u);
  sub_10000A99C();
}

void sub_10000AB8C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A98C((void *)&_mh_execute_header, a2, a3, "Failed to start haptic engine after reset with error: %@", a5, a6, a7, a8, 2u);
  sub_10000A99C();
}

void sub_10000ABF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005108((void *)&_mh_execute_header, a1, a3, "[ERROR] - Button/Switch Input Test: Predicate not found.", a5, a6, a7, a8, 0);
}

void sub_10000AC24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A98C((void *)&_mh_execute_header, a2, a3, "Unable to play haptic with error: %@", a5, a6, a7, a8, 2u);
  sub_10000A99C();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEvents");
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDSystemClient");
}

id objc_msgSend__cameraCaptureShutterConfigurationWithOptionsProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cameraCaptureShutterConfigurationWithOptionsProvider:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInteraction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forButtonEvents_propagate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forButtonEvents:propagate:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
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

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asset");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonEventMonitor");
}

id objc_msgSend_buttonFailure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonFailure");
}

id objc_msgSend_buttonParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonParameters");
}

id objc_msgSend_buttonSwitchSpecification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonSwitchSpecification");
}

id objc_msgSend_buttonSwitchState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonSwitchState");
}

id objc_msgSend_checkCurrentSwitchState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCurrentSwitchState");
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpSystemClient");
}

id objc_msgSend_cleanUpWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpWithCompletion:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createPlayerWithPattern_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPlayerWithPattern:error:");
}

id objc_msgSend_currentSegment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSegment");
}

id objc_msgSend_currentSegmentActionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSegmentActionCount");
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyMonitoring");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableTouchButtonEvents");
}

id objc_msgSend_displayAssetRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAssetRange");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_dictionaryFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:");
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

id objc_msgSend_dk_stringFromRequiredKey_inSet_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:inSet:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTouchButtonEvents");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_expectedEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedEvent");
}

id objc_msgSend_findServiceClientForHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findServiceClientForHIDEvent:");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getNextEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNextEvent");
}

id objc_msgSend_getTypeForEvent_type_eventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTypeForEvent:type:eventType:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_hapticEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hapticEngine");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_imagesFromSprite_inRange_withImageSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagesFromSprite:inRange:withImageSize:");
}

id objc_msgSend_initAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAndReturnError:");
}

id objc_msgSend_initWithConfigurations_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfigurations:delegate:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_startingState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:startingState:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCheckerBoardActive");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEventAcceptable_type_eventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEventAcceptable:type:eventType:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isInputMonitoringPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInputMonitoringPaused");
}

id objc_msgSend_isSecondEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSecondEvent");
}

id objc_msgSend_listenForInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenForInputTimeout");
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noInputTimeout");
}

id objc_msgSend_notifyWhenPlayersFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhenPlayersFinished:");
}

id objc_msgSend_numberOfActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfActions");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameters");
}

id objc_msgSend_performHapticOnEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performHapticOnEvent");
}

id objc_msgSend_playHaptic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playHaptic");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "position");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicates");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetTimer");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segments");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationImages:");
}

id objc_msgSend_setAnimationRepeatCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationRepeatCount:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonEventMonitor:");
}

id objc_msgSend_setButtonFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonFailure:");
}

id objc_msgSend_setButtonParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonParameters:");
}

id objc_msgSend_setButtonSwitchSpecification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonSwitchSpecification:");
}

id objc_msgSend_setButtonSwitchState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonSwitchState:");
}

id objc_msgSend_setCurrentSegment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSegment:");
}

id objc_msgSend_setCurrentSegmentActionCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSegmentActionCount:");
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

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setHIDSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDSystemClient:");
}

id objc_msgSend_setHapticEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHapticEngine:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsInputMonitoringPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInputMonitoringPaused:");
}

id objc_msgSend_setIsSecondEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSecondEvent:");
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

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParameters:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setResetHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResetHandler:");
}

id objc_msgSend_setSpecifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecifications:");
}

id objc_msgSend_setSpriteImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpriteImage:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStoppedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoppedHandler:");
}

id objc_msgSend_setSwitchParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwitchParameters:");
}

id objc_msgSend_setTargetButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetButtonEvents:");
}

id objc_msgSend_setTestImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestImage:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTouchButtonParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchButtonParameters:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTest");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showNextSegment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNextSegment");
}

id objc_msgSend_showTransitionWithRange_WithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTransitionWithRange:WithCompletionHandler:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_specificationFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specificationFromArray:");
}

id objc_msgSend_specifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specifications");
}

id objc_msgSend_spriteImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spriteImage");
}

id objc_msgSend_startAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAndReturnError:");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startAtTime_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAtTime:error:");
}

id objc_msgSend_startMonitoringWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWithHIDEvents:");
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimer");
}

id objc_msgSend_startWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithCompletionHandler:");
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithPriority:completion:");
}

id objc_msgSend_startingState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startingState");
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "states");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWithCompletion:");
}

id objc_msgSend_stopWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWithCompletionHandler:");
}

id objc_msgSend_switchParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchParameters");
}

id objc_msgSend_systemClientSetupWithHIDEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientSetupWithHIDEvents:");
}

id objc_msgSend_targetButtonEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetButtonEvents");
}

id objc_msgSend_targetEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetEvents");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_testImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testImage");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timedOut");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_touchButtonParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchButtonParameters");
}

id objc_msgSend_transitionAssetRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionAssetRange");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
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
