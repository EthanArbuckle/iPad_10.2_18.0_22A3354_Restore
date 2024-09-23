BOOL sub_100001FC4(id a1, id a2)
{
  id v2;
  id v3;
  id v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "compare:", &off_10000CA90);
  v4 = objc_msgSend(v2, "compare:", &off_10000CAA0);

  return (unint64_t)v4 < 2 && (unint64_t)v3 + 1 < 2;
}

void sub_10000390C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  id *v43;

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003974(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003984(uint64_t a1)
{

}

void sub_10000398C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  signed int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  signed int v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _BYTE *v43;
  char v44;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v44 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "inputs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "gridRows") - 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("y"), &off_10000C970, v10, &v44));
    v12 = objc_msgSend(v11, "intValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "gridColumns") - 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("x"), &off_10000C970, v14, &v44));
    v16 = objc_msgSend(v15, "intValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("startingColor"), 7, &v44));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v17, 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("successColor"), 7, &v44));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v19, 0));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("failedColor"), 7, &v44));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v21, 0));

    if (!v44 && v18 && v20 && v22)
    {
      v43 = a4;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputs"));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16
                                                                  + objc_msgSend(v23, "gridColumns") * v12;

      v24 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputs"));
      v26 = objc_msgSend(v25, "gridRows");
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputs"));
      v28 = objc_msgSend(v27, "gridColumns") * v26;

      if (v24 >= v28)
      {
        v29 = DiagnosticLogHandleForCategory(3);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_100006FC0(v30, v31, v32, v33, v34, v35, v36, v37);

        objc_msgSend(v8, "endTestWithStatusCode:", &off_10000C988);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *v43 = 0;
      }
      v38 = (void *)v8[12];
      v39 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[ColorOptions colorOptionsWithStarting:success:failed:](ColorOptions, "colorOptionsWithStarting:success:failed:", v18, v20, v22));
      objc_msgSend(v38, "replaceObjectAtIndex:withObject:", v39, v40);

      v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)));
      objc_msgSend(v41, "addObject:", v42);

    }
    else
    {
      objc_msgSend(v8, "endTestWithStatusCode:", &off_10000C9A0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 0;
    }

  }
}

id sub_1000053F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retryButtonAction");
}

id sub_1000053FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueButtonAction");
}

void forceTouchPathCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  float v8;
  float v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  unsigned int v57;
  _QWORD v58[4];
  id v59;
  id v60;
  unsigned int v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  id location[3];

  v6 = a5;
  objc_initWeak(location, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
  if (v7)
  {

    goto LABEL_33;
  }
  if ((objc_msgSend(v6, "shouldIgnoreForceEvents") & 1) != 0)
    goto LABEL_33;
  objc_msgSend(v6, "setTouchEventRecognized:", (*(_DWORD *)(a4 + 20) - 1) < 4);
  if (objc_msgSend(v6, "timeoutTimerFireDelayed"))
  {
    objc_msgSend(v6, "setTimeoutTimerFireDelayed:", 0);
    objc_msgSend(v6, "partialInputTimedOut");
    goto LABEL_33;
  }
  v8 = *(float *)(a4 + 32);
  v9 = *(float *)(a4 + 36);
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeScale(&v64, 1.0, -1.0);
  v62 = v64;
  CGAffineTransformTranslate(&v63, &v62, 0.0, -1.0);
  v64 = v63;
  v10 = *(_OWORD *)&v63.a;
  v11 = *(_OWORD *)&v63.c;
  v12 = *(_OWORD *)&v63.tx;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
  v14 = objc_msgSend(v13, "gridRows");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
  v56 = objc_msgSend(v15, "gridColumns");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
  v17 = objc_msgSend(v16, "gridColumns");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridIndexes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "testCoordinatesIndex")));
  v57 = objc_msgSend(v19, "intValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:"));
  if ((objc_msgSend(v21, "isEqualToNumber:", &off_10000CA00) & 1) != 0)
    goto LABEL_9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v57));
  if ((objc_msgSend(v23, "isEqualToNumber:", &off_10000CA18) & 1) != 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v57));
  v37 = objc_msgSend(v36, "isEqualToNumber:", &off_10000CA30);
  if (vcvtmd_u64_f64((*(double *)&v12 + *(double *)&v11 * v9 + *(double *)&v10 * v8) * (double)v56)
     + v17
     * vcvtmd_u64_f64((*((double *)&v12 + 1) + *((double *)&v11 + 1) * v9 + *((double *)&v10 + 1) * v8) * (double)v14) == v57)
    v38 = 1;
  else
    v38 = v37;

  if ((v38 & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
    objc_msgSend(v39, "setObject:atIndexedSubscript:", &off_10000C9B8, v57);

    objc_msgSend(v6, "setPressureRatio:", 0.0);
    objc_msgSend(v6, "presentRingWithTestCoordinateGridIndex:", v57);
    goto LABEL_33;
  }
LABEL_10:
  v24 = *(float *)(a4 + 52);
  objc_msgSend(v6, "maximumPressure");
  if (v24 >= *(float *)&v25)
    *(float *)&v25 = v24;
  objc_msgSend(v6, "setMaximumPressure:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pressurePoints"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v6, "pressureIndex")));
  objc_msgSend(v28, "doubleValue");
  objc_msgSend(v6, "setPressureRatio:", v24 / v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v57));
  v32 = (int)objc_msgSend(v31, "intValue");

  if (!v32)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusLabel"));
    objc_msgSend(v40, "setText:", &stru_10000C830);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v41, "timeIntervalSince1970");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v42 * 1000.0)));
    objc_msgSend(v6, "setForceTouchStarted:", v43);

    objc_msgSend(v6, "presentRingWithTestCoordinateGridIndex:", v57);
    if ((objc_msgSend(v6, "timerInvalidated") & 1) == 0)
    {
      objc_msgSend(v6, "setTimerInvalidated:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeoutTimer"));

      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeoutTimer"));
        objc_msgSend(v45, "invalidate");

        objc_msgSend(v6, "setTimeoutTimer:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
        objc_msgSend(v46, "partialInputTimeout");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v6, "partialInputTimedOut", 0, 0));
        objc_msgSend(v6, "setTimeoutTimer:", v47);

      }
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
    objc_msgSend(v48, "setObject:atIndexedSubscript:", &off_10000CA48, v57);
    goto LABEL_32;
  }
  if (v32 == 1)
  {
    objc_msgSend(v6, "presentRingWithTestCoordinateGridIndex:", v57);
    objc_msgSend(v6, "pressureRatio");
    if (v49 < 1.0)
      goto LABEL_33;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeoutTimer"));

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeoutTimer"));
      objc_msgSend(v51, "invalidate");

      objc_msgSend(v6, "setTimeoutTimer:", 0);
    }
    if (objc_msgSend(v6, "timeoutTimerFireDelayed"))
    {
      objc_msgSend(v6, "setPressureReachedAfterTimeout:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
      objc_msgSend(v48, "setObject:atIndexedSubscript:", &off_10000CA18, v57);
    }
    else
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "detectedPressurePoints"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputs"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "pressurePoints"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", objc_msgSend(v6, "pressureIndex")));
      objc_msgSend(v52, "addObject:", v55);

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
      objc_msgSend(v48, "setObject:atIndexedSubscript:", &off_10000CA00, v57);
    }
LABEL_32:

    goto LABEL_33;
  }
  if (v32 == 2 && (objc_msgSend(v6, "touchEventRecognized") & 1) == 0)
  {
    objc_msgSend(v6, "setShouldIgnoreForceEvents:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gridStatus"));
    objc_msgSend(v33, "setObject:atIndexedSubscript:", &off_10000CA30, v57);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "forceTouchRingView"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100006078;
    v58[3] = &unk_10000C3F0;
    objc_copyWeak(&v60, location);
    v61 = v57;
    v59 = v6;
    objc_msgSend(v34, "playCircleAnimationWithCompletion:", v58);

    objc_destroyWeak(&v60);
  }
LABEL_33:
  objc_destroyWeak(location);

}

void sub_100005E54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 168));
  _Unwind_Resume(a1);
}

id sub_100006078(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v2 = (id *)(a1 + 40);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testCoordinates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", *(unsigned int *)(a1 + 48)));
  objc_msgSend(v5, "CGPointValue");
  objc_msgSend(v3, "playCheckAnimationAtPoint:");

  WeakRetained = objc_loadWeakRetained(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "inputs"));
  LODWORD(v4) = objc_msgSend(v7, "hapticFeedback");

  if ((_DWORD)v4)
    AudioServicesPlaySystemSound(0x5B1u);
  return objc_msgSend(*(id *)(a1 + 32), "setShouldIgnoreForceEvents:", 0);
}

void sub_100006FB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006FC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006FB0((void *)&_mh_execute_header, a1, a3, "Coordinate exceeded max index bound", a5, a6, a7, a8, 0);
}

void sub_100006FF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006FB0((void *)&_mh_execute_header, a1, a3, "[ERROR] - Force Touch Digitizer Test: Predicate/Specifications not found.", a5, a6, a7, a8, 0);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPointValue");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLineToPoint:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
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

id objc_msgSend_animationCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationCompletion");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPath");
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_check(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "check");
}

id objc_msgSend_checkForNextTargetWithTestCoordinateGridIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForNextTargetWithTestCoordinateGridIndex:");
}

id objc_msgSend_circle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "circle");
}

id objc_msgSend_circlePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "circlePath");
}

id objc_msgSend_circlePathAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "circlePathAnimation");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorInterpolationFromColor_toColor_atRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorInterpolationFromColor:toColor:atRatio:");
}

id objc_msgSend_colorOptionsWithStarting_success_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorOptionsWithStarting:success:failed:");
}

id objc_msgSend_colorWithHexValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithHexValue:error:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_detectedPressurePoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedPressurePoints");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromKey_types_maxLength_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:");
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

id objc_msgSend_endingCircleRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endingCircleRatio");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_failed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failed");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_forceTouchEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceTouchEnded");
}

id objc_msgSend_forceTouchRingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceTouchRingView");
}

id objc_msgSend_forceTouchSensitivityText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceTouchSensitivityText");
}

id objc_msgSend_forceTouchStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceTouchStarted");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_gridColumns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridColumns");
}

id objc_msgSend_gridIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridIndexes");
}

id objc_msgSend_gridRows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridRows");
}

id objc_msgSend_gridStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridStatus");
}

id objc_msgSend_hapticFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hapticFeedback");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_ringCenter_startingCircleRadius_startingCircleRatio_endingCircleRatio_ringStartingColor_ringSuccessColor_ringFailedColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:ringCenter:startingCircleRadius:startingCircleRatio:endingCircleRatio:ringStartingColor:ringSuccessColor:ringFailedColor:");
}

id objc_msgSend_initWithStarting_success_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStarting:success:failed:");
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

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_maximumCircleRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumCircleRatio");
}

id objc_msgSend_maximumPressure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumPressure");
}

id objc_msgSend_minimumCircleRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumCircleRatio");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noInputTimeout");
}

id objc_msgSend_noInputTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noInputTimerFired");
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

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_partialInputTimedOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partialInputTimedOut");
}

id objc_msgSend_partialInputTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partialInputTimeout");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_playCheckAnimationAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playCheckAnimationAtPoint:");
}

id objc_msgSend_playCircleAnimationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playCircleAnimationWithCompletion:");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
}

id objc_msgSend_postInteractiveTestEvent_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postInteractiveTestEvent:info:");
}

id objc_msgSend_presentRingWithTestCoordinateGridIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentRingWithTestCoordinateGridIndex:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_pressureIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressureIndex");
}

id objc_msgSend_pressurePoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressurePoints");
}

id objc_msgSend_pressureRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressureRatio");
}

id objc_msgSend_pressureReachedAfterTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressureReachedAfterTimeout");
}

id objc_msgSend_pressureTargetMissed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressureTargetMissed");
}

id objc_msgSend_randomizeCoordinates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "randomizeCoordinates");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperlayer");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_ringCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ringCenter");
}

id objc_msgSend_ringFailedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ringFailedColor");
}

id objc_msgSend_ringShouldGrow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ringShouldGrow");
}

id objc_msgSend_ringStartingColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ringStartingColor");
}

id objc_msgSend_ringSuccessColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ringSuccessColor");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAnimationCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationCompletion:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setCheck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheck:");
}

id objc_msgSend_setCirclePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCirclePath:");
}

id objc_msgSend_setCirclePathAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCirclePathAnimation:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndingCircleRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndingCircleRatio:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForceTouchEnded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceTouchEnded:");
}

id objc_msgSend_setForceTouchRingView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceTouchRingView:");
}

id objc_msgSend_setForceTouchSensitivityText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceTouchSensitivityText:");
}

id objc_msgSend_setForceTouchStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceTouchStarted:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setGridColumns_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGridColumns:");
}

id objc_msgSend_setGridIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGridIndexes:");
}

id objc_msgSend_setGridRows_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGridRows:");
}

id objc_msgSend_setHapticFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHapticFeedback:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineJoin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineJoin:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setMaximumPressure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumPressure:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNoInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoInputTimeout:");
}

id objc_msgSend_setNoInputTimerFired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoInputTimerFired:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPartialInputTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPartialInputTimeout:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPressureIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressureIndex:");
}

id objc_msgSend_setPressurePoints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressurePoints:");
}

id objc_msgSend_setPressureRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressureRatio:");
}

id objc_msgSend_setPressureReachedAfterTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressureReachedAfterTimeout:");
}

id objc_msgSend_setPressureTargetMissed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressureTargetMissed:");
}

id objc_msgSend_setRandomizeCoordinates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRandomizeCoordinates:");
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepeatCount:");
}

id objc_msgSend_setRingCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRingCenter:");
}

id objc_msgSend_setRingFailedColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRingFailedColor:");
}

id objc_msgSend_setRingStartingColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRingStartingColor:");
}

id objc_msgSend_setRingSuccessColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRingSuccessColor:");
}

id objc_msgSend_setShouldIgnoreForceEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreForceEvents:");
}

id objc_msgSend_setStartingCircleRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartingCircleRatio:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStatusLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusLabel:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStrokeEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeEnd:");
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeStart:");
}

id objc_msgSend_setTestCoordinateColorsParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCoordinateColorsParameter:");
}

id objc_msgSend_setTestCoordinatesIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCoordinatesIndex:");
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

id objc_msgSend_setTimedOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimedOut:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTimeoutTimerFireDelayed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimerFireDelayed:");
}

id objc_msgSend_setTimerInvalidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimerInvalidated:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTouchEventRecognized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchEventRecognized:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupHIDForceTouchRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHIDForceTouchRecognizer");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldIgnoreForceEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldIgnoreForceEvents");
}

id objc_msgSend_shuffleCoordinates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shuffleCoordinates");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starting");
}

id objc_msgSend_startingCircleRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startingCircleRadius");
}

id objc_msgSend_startingCircleRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startingCircleRatio");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusLabel");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "success");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_testCoordinateColorsParameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCoordinateColorsParameter");
}

id objc_msgSend_testCoordinates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCoordinates");
}

id objc_msgSend_testCoordinatesColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCoordinatesColor");
}

id objc_msgSend_testCoordinatesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCoordinatesCount");
}

id objc_msgSend_testCoordinatesIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCoordinatesIndex");
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

id objc_msgSend_timeoutTimerFireDelayed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimerFireDelayed");
}

id objc_msgSend_timerInvalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerInvalidated");
}

id objc_msgSend_touchEventRecognized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchEventRecognized");
}

id objc_msgSend_undetectedPressurePoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "undetectedPressurePoints");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateCircleWithPressureRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCircleWithPressureRatio:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
