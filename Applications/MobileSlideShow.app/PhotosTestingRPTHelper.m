@implementation PhotosTestingRPTHelper

+ (BOOL)isRPTAvailable
{
  if (qword_10007C150 != -1)
    dispatch_once(&qword_10007C150, &stru_10006D4A8);
  return byte_10007C148;
}

+ (BOOL)isRPTStyleTestName:(id)a3
{
  return _objc_msgSend(a3, "hasSuffix:", CFSTR("Natural"));
}

+ (BOOL)shouldUseRPTScrollingForRPTOptions:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RPT_Style")));
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("swipe")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("oscillation")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("shareSheet"));

  return v4;
}

+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  RPTGetBoundsForView(a5);
  objc_msgSend(a1, "runTestWithName:RPTOptions:scrollBounds:completionHandler:", v12, v11, v10);

}

+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollBounds:(CGRect)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000434BC;
  v33[3] = &unk_10006D4D0;
  v15 = a6;
  v34 = v15;
  v16 = objc_retainBlock(v33);
  v17 = objc_msgSend(a1, "isRPTAvailable");
  if ((_DWORD)v17)
  {
    v32 = v13;
    v18 = objc_msgSend(a1, "_speedFromTestName:", v13);
    v19 = objc_msgSend(a1, "_axisFromOptions:", v14);
    objc_msgSend(a1, "_pagesFromOptions:", v14);
    v21 = v20;
    v22 = objc_msgSend(a1, "_iterationsFromOptions:", v14);
    v23 = objc_msgSend(a1, "_contentStartFromEndFromOptions:", v14);
    v24 = objc_msgSend(a1, "_swipeCountFromOptions:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RPT_Style")));
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("swipe")))
    {
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_swipeTestParamsWithScrollBounds:contentFromEnd:axis:speed:swipeCount:iterations:completionHandler:", v23, v19, v18, v24, v22, v15, x, y, width, height));
    }
    else
    {
      if (!objc_msgSend(v25, "isEqualToString:", CFSTR("oscillation")))
      {
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("shareSheet"));
        v13 = v32;
        if ((_DWORD)v26)
        {
          v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_shareSheetScrollTestParamsWithScrollBounds:pages:iterations:completionHandler:", v22, v15, x, y, width, height, v21));
          v29 = v26;
          if (v26)
            goto LABEL_10;
        }
        goto LABEL_13;
      }
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_oscillationScrollTestParamsWithScrollBounds:contentFromEnd:axis:speed:pages:iterations:completionHandler:", v23, v19, v18, v22, v15, x, y, width, height, v21));
    }
    v29 = v26;
    v13 = v32;
    if (v26)
    {
LABEL_10:
      objc_msgSend(v29, "setTestName:", v13);
      +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v29);

LABEL_16:
      goto LABEL_17;
    }
LABEL_13:
    v30 = PLPPTGetLog(v26);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to generate RPT scroll test (%@) for test params, options is: %@", buf, 0x16u);
    }

    ((void (*)(_QWORD *))v16[2])(v16);
    goto LABEL_16;
  }
  v27 = PLPPTGetLog(v17);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed: RecapPerformanceTesting framework is not available.", buf, 2u);
  }

  ((void (*)(_QWORD *))v16[2])(v16);
LABEL_17:

}

+ (id)_swipeTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 swipeCount:(int64_t)a7 iterations:(int64_t)a8 completionHandler:(id)a9
{
  _BOOL8 v13;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v13 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a9;
  v20 = objc_msgSend(a1, "_RPTScrollDirectionForContentFromEnd:scrollVertical:", v13, a5 == 2);
  v21 = objc_msgSend(objc_alloc((Class)RPTDirectionalSwipeTestParameters), "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", CFSTR("scrollOut"), 1, _UIScrollDirectionFromRPTScrollDirection(v20), 0, x, y, width, height);
  objc_msgSend(a1, "_configSwipeParams:forSpeed:returnTrip:", v21, a6, 0);
  objc_msgSend(v21, "setShouldFlick:", 1);
  v22 = objc_msgSend(objc_alloc((Class)RPTDirectionalSwipeTestParameters), "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", CFSTR("scrollBack"), 1, _UIScrollDirectionFromRPTScrollDirection(objc_msgSend(a1, "_RPTOppositeOfDirection:", v20)), 0, x, y, width, height);
  objc_msgSend(a1, "_configSwipeParams:forSpeed:returnTrip:", v22, a6, 1);
  objc_msgSend(v22, "setShouldFlick:", 1);
  if (a7 >= 1)
  {
    objc_msgSend(v21, "setSwipeCount:", a7);
    objc_msgSend(v22, "setSwipeCount:", a7);
  }
  v30[0] = v21;
  v30[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_paramsArrayByParams:iterations:", v23, a8));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000434A0;
  v28[3] = &unk_10006D4D0;
  v29 = v19;
  v25 = v19;
  v26 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", 0, v24, v28);

  return v26;
}

+ (id)_oscillationScrollTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 pages:(double)a7 iterations:(int64_t)a8 completionHandler:(id)a9
{
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;

  v11 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a9;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  if (a5 == 2)
    v22 = CGRectGetHeight(*(CGRect *)&v18);
  else
    v22 = CGRectGetWidth(*(CGRect *)&v18);
  v23 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", 0, objc_msgSend(a1, "_RPTScrollDirectionForContentFromEnd:scrollVertical:", v11, a5 == 2), 0, x, y, width, height, v22);
  objc_msgSend(v23, "setIterationDurationFactor:", 0.7);
  v31 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_paramsArrayByParams:iterations:", v24, a8));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100043484;
  v29[3] = &unk_10006D4D0;
  v30 = v17;
  v26 = v17;
  v27 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", 0, v25, v29);

  return v27;
}

+ (id)_shareSheetScrollTestParamsWithScrollBounds:(CGRect)a3 pages:(double)a4 iterations:(int64_t)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a6;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v13 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", 0, 0, 0, x, y, width, height, CGRectGetHeight(v22));
  objc_msgSend(v13, "setPreventSheetDismissal:", 1);
  objc_msgSend(v13, "setShouldFlick:", 0);
  v21 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_paramsArrayByParams:iterations:", v14, a5));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100043468;
  v19[3] = &unk_10006D4D0;
  v20 = v12;
  v16 = v12;
  v17 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", 0, v15, v19);

  return v17;
}

+ (id)_paramsArrayByParams:(id)a3 iterations:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  if (a4 >= 1)
  {
    do
    {
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      --a4;
    }
    while (a4);
  }

  return v6;
}

+ (void)_configSwipeParams:(id)a3 forSpeed:(int64_t)a4 returnTrip:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a5;
  v7 = a3;
  if (a4 == 2)
  {
    v8 = !v5;
    v9 = 16;
    v10 = 12;
  }
  else if (a4 == 1)
  {
    v8 = !v5;
    v9 = 10;
    v10 = 8;
  }
  else
  {
    if (a4)
      goto LABEL_11;
    v8 = !v5;
    v9 = 8;
    v10 = 6;
  }
  if (v8)
    v11 = v9;
  else
    v11 = v10;
  v13 = v7;
  objc_msgSend(v7, "setSwipeCount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PXGesturePerformer swipeSpeedFactor:](PXGesturePerformer, "swipeSpeedFactor:", a4));
  objc_msgSend(v13, "setSwipeSpeedFactor:", v12);

  v7 = v13;
LABEL_11:

}

+ (int64_t)_speedFromTestName:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  int64_t v6;
  void *v7;
  unsigned int v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "containsString:", CFSTR("slow"));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    v8 = objc_msgSend(v7, "containsString:", CFSTR("fast"));

    if (v8)
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

+ (unint64_t)_axisFromOptions:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RPT_Axis")));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("horizontal")))
    v4 = 1;
  else
    v4 = 2;

  return v4;
}

+ (BOOL)_contentStartFromEndFromOptions:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RPT_ContentStartPos")));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("begin")) ^ 1;

  return v4;
}

+ (int64_t)_swipeCountFromOptions:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RPT_SwipeCount")));
  v4 = (uint64_t)objc_msgSend(v3, "integerValue");

  return v4 & ~(v4 >> 63);
}

+ (double)_pagesFromOptions:(id)a3
{
  void *v3;
  float v4;
  float v5;
  double v6;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pages")));
  objc_msgSend(v3, "floatValue");
  v5 = v4;
  v6 = v4;

  result = 1.0;
  if (v5 > 0.0)
    return v6;
  return result;
}

+ (int64_t)_iterationsFromOptions:(id)a3
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iterations")));
  v4 = (int64_t)objc_msgSend(v3, "integerValue");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

+ (int64_t)_RPTOppositeOfDirection:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_100056C78[a3];
}

+ (int64_t)_RPTScrollDirectionForContentFromEnd:(BOOL)a3 scrollVertical:(BOOL)a4
{
  int64_t v4;
  void *v6;
  void *v7;
  id v8;

  if (a4)
    return !a3;
  if (a3)
    v4 = 3;
  else
    v4 = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
  v8 = objc_msgSend(v7, "layoutDirection");

  if (v8 == (id)1)
    return (int64_t)objc_msgSend(a1, "_RPTOppositeOfDirection:", v4);
  return v4;
}

+ (id)gesturePerformerForTestWithName:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  _PhotosTestingRPTGesturePerformer *v9;
  void *v11;

  v7 = a4;
  v8 = a3;
  if ((objc_msgSend(a1, "isRPTAvailable") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PhotosTestingRPTHelper.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isRPTAvailable"));

  }
  v9 = -[_PhotosTestingRPTGesturePerformer initWithTestName:testOptions:]([_PhotosTestingRPTGesturePerformer alloc], "initWithTestName:testOptions:", v8, v7);

  return v9;
}

@end
