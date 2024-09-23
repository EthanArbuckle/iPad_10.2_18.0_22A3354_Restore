@implementation PLPhotosApplication

- (void)_endedTest:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v5)
  {
    -[PLPhotosApplication setCurrentTestName:](self, "setCurrentTestName:", 0);
    -[PLPhotosApplication setCurrentTestOptions:](self, "setCurrentTestOptions:", 0);
    -[PLPhotosApplication ppt_endPausingChanges](self, "ppt_endPausingChanges");
    PXPPTDidEndTest(v6);
  }
  -[PLPhotosApplication _callCompletionHandlersForTest:](self, "_callCompletionHandlersForTest:", v6);

}

- (void)startedTest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = PLPPTGetLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication px_firstKeyWindow](self, "px_firstKeyWindow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = sub_1000067E0((unint64_t)objc_msgSend(v8, "interfaceOrientation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Started Test:%@ Device Orientation:%@", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  v12 = objc_msgSend(v11, "containsString:", CFSTR("scroll"));

  if (v12)
    -[PLPhotosApplication ppt_beginPausingChanges](self, "ppt_beginPausingChanges");
  PXPPTWillStartTest(v4);
  v13.receiver = self;
  v13.super_class = (Class)PLPhotosApplication;
  -[PLPhotosApplication startedTest:](&v13, "startedTest:", v4);

}

- (BOOL)launchedToTest
{
  objc_super v4;

  if ((PFProcessIsLaunchedToExecuteTests(self, a2) & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PLPhotosApplication;
  return -[PLPhotosApplication launchedToTest](&v4, "launchedToTest");
}

- (void)_callCompletionHandlersForTest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10007C110, "objectForKeyedSubscript:", v3));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10007C110, "objectForKeyedSubscript:", v3));
  objc_msgSend(v6, "removeAllObjects");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_10007C108)
  {
    (*(void (**)(void))(qword_10007C108 + 16))();
    v14 = (void *)qword_10007C108;
    qword_10007C108 = 0;

  }
  v15 = PLPPTGetLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication px_firstKeyWindow](self, "px_firstKeyWindow"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "windowScene"));
    v19 = sub_1000067E0((unint64_t)objc_msgSend(v18, "interfaceOrientation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished Test:%@ Device Orientation:%@", buf, 0x16u);

  }
  v21.receiver = self;
  v21.super_class = (Class)PLPhotosApplication;
  -[PLPhotosApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](&v21, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", v10, v11, v12, v13);
  -[PLPhotosApplication _endedTest:](self, "_endedTest:", v10);

}

- (id)_extendLaunchTest
{
  if (_os_feature_enabled_impl("Photos", "Lemonade"))
    return CFSTR("PhotosApplicationLaunchExtended");
  else
    return 0;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (id)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication px_firstKeyWindow](self, "px_firstKeyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return v3;
}

- (void)_installWillFinishTestHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100041FB8;
    v7[3] = &unk_10006AFA8;
    v8 = objc_retainBlock((id)qword_10007C108);
    v9 = v3;
    v4 = v8;
    v5 = objc_msgSend(v7, "copy");
    v6 = (void *)qword_10007C108;
    qword_10007C108 = (uint64_t)v5;

  }
}

- (void)_addTest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)qword_10007C110;
  if (!qword_10007C110)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)qword_10007C110;
    qword_10007C110 = (uint64_t)v7;

    v6 = (void *)qword_10007C110;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend((id)qword_10007C110, "setObject:forKeyedSubscript:", v9, v12);
  }
  v10 = objc_msgSend(v5, "copy");
  v11 = objc_retainBlock(v10);
  objc_msgSend(v9, "addObject:", v11);

}

- (void)ppt_beginPausingChanges
{
  id AssociatedObject;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  AssociatedObject = objc_getAssociatedObject(self, &unk_10007C118);
  v7 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PLPhotosApplication (Testing)"), 60.0));

  objc_setAssociatedObject(self, &unk_10007C118, v5, (void *)0x301);
  if (v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    objc_msgSend(v6, "px_endPausingChanges:", v7);

  }
}

- (void)ppt_endPausingChanges
{
  id AssociatedObject;
  void *v4;
  id v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_10007C118);
  v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    objc_msgSend(v4, "px_endPausingChanges:", v5);

    objc_setAssociatedObject(self, &unk_10007C118, 0, (void *)0x301);
  }

}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 gridView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  unint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollViewController"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scrollView"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PXGPPTSettings sharedInstance](PXGPPTSettings, "sharedInstance"));
  v17 = objc_msgSend(v16, "shouldTestNestedScrollView");

  if (v17)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_1000300A0;
    v33 = sub_1000300B0;
    v34 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100041E94;
    v26[3] = &unk_10006AFD0;
    v15 = v15;
    v27 = v15;
    v28 = &v29;
    objc_msgSend(v15, "px_enumerateDescendantSubviewsUsingBlock:", v26);
    v18 = (void *)v30[5];
    if (v18)
    {
      v19 = v18;

      v15 = v19;
    }
    else
    {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("No nested scroll view found in %@"), v15);
    }

    _Block_object_dispose(&v29, 8);
  }
  v20 = -[PLPhotosApplication ppt_determineAxisForScrollView:withOptions:](self, "ppt_determineAxisForScrollView:withOptions:", v15, v11);
  objc_msgSend(v12, "ppt_prepareForTest:withOptions:isScrollTest:", v10, v11, 1);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100041F7C;
  v23[3] = &unk_10006AFF8;
  v24 = v12;
  v25 = v10;
  v21 = v12;
  v22 = v10;
  -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:", v22, v11, v15, v20, v23, v13);

}

- (unint64_t)ppt_determineAxisForScrollView:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("scrollAxis")));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("horizontal")) & 1) != 0)
    goto LABEL_9;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("vertical")) & 1) != 0)
  {
    v7 = 2;
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "alwaysBounceHorizontal") & 1) != 0
    || !objc_msgSend(v5, "px_isScrolledAtEdge:", 0))
  {
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "px_isScrolledAtEdge:", 2))
    v7 = 2;
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  PLPhotosApplication *v19;
  id v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100041E88;
  v18 = &unk_10006D648;
  v19 = self;
  v13 = v11;
  v20 = v13;
  v14 = objc_retainBlock(&v15);
  if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:](PhotosTestingRPTHelper, "shouldUseRPTScrollingForRPTOptions:", v12, v15, v16, v17, v18, v19)&& +[PhotosTestingRPTHelper isRPTAvailable](PhotosTestingRPTHelper, "isRPTAvailable"))
  {
    +[PhotosTestingRPTHelper runTestWithName:RPTOptions:scrollBounds:completionHandler:](PhotosTestingRPTHelper, "runTestWithName:RPTOptions:scrollBounds:completionHandler:", v13, v12, 0, x, y, width, height);
  }
  else
  {
    ((void (*)(void ***))v14[2])(v14);
  }

}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6
{
  -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", a3, a4, a5, 2, a6);
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 completionHandler:(id)a7
{
  -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 extraResultsBlock:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  dispatch_queue_global_t global_queue;
  NSObject *v48;
  void *v49;
  double v50;
  double v51;
  dispatch_time_t v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[5];
  __CFString *v63;
  id v64;
  _QWORD *v65;
  _QWORD v66[5];
  __CFString *v67;
  id v68;
  _QWORD *v69;
  _QWORD v70[4];
  _QWORD block[7];
  _QWORD v72[4];
  id v73;
  _QWORD v74[5];
  id v75;
  id v76;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v16)
  {
    if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:](PhotosTestingRPTHelper, "shouldUseRPTScrollingForRPTOptions:", v15))
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100041CD0;
      v74[3] = &unk_10006C240;
      v74[4] = self;
      v19 = v14;
      v75 = v19;
      v20 = v18;
      v76 = v20;
      v21 = objc_retainBlock(v74);
      if (+[PhotosTestingRPTHelper isRPTAvailable](PhotosTestingRPTHelper, "isRPTAvailable"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
        objc_msgSend(v16, "frame");
        objc_msgSend(v22, "convertRect:toView:", 0);
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;

        objc_msgSend(v16, "adjustedContentInset");
        v32 = v31 + 60.0;
        v35 = v34 + 20.0;
        v37 = v24 + v35;
        v38 = v26 + v32;
        v39 = v28 - (v35 + v36 + 20.0);
        v40 = v30 - (v32 + v33 + 35.0);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_100041D18;
        v72[3] = &unk_10006B020;
        v73 = v20;
        +[PhotosTestingRPTHelper runTestWithName:RPTOptions:scrollBounds:completionHandler:](PhotosTestingRPTHelper, "runTestWithName:RPTOptions:scrollBounds:completionHandler:", v19, v15, v72, v37, v38, v39, v40);

      }
      else
      {
        ((void (*)(_QWORD *))v21[2])(v21);
      }

    }
    else
    {
      v59 = a6;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[PUPerformanceDiagnosticsSettings sharedInstance](PUPerformanceDiagnosticsSettings, "sharedInstance"));
      objc_msgSend(v41, "scrollTestCPUWarmupDuration");
      v43 = v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[PUPerformanceDiagnosticsSettings sharedInstance](PUPerformanceDiagnosticsSettings, "sharedInstance"));
      objc_msgSend(v44, "scrollTestCPUSustainDuration");
      v46 = v45;

      if (v43 > 0.0 || v46 > 0.0)
      {
        if (v46 > 0.0)
        {
          global_queue = dispatch_get_global_queue(2, 0);
          v48 = objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100041D30;
          block[3] = &unk_10006B048;
          block[4] = self;
          *(double *)&block[5] = v43;
          *(double *)&block[6] = v46;
          dispatch_async(v48, block);

        }
        -[PLPhotosApplication _computeFibonnaciNumbersForDuration:](self, "_computeFibonnaciNumbersForDuration:", v43);
      }
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x2020000000;
      v70[3] = 0;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[PUPerformanceDiagnosticsSettings sharedInstance](PUPerformanceDiagnosticsSettings, "sharedInstance"));
      objc_msgSend(v49, "scrollTestRampUpDuration");
      v51 = v50;

      v52 = dispatch_time(0, (uint64_t)(v51 * 1000000000.0));
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100041D44;
      v66[3] = &unk_10006B070;
      v69 = v70;
      v66[4] = self;
      v67 = CFSTR("steady");
      v53 = v14;
      v68 = v53;
      dispatch_after(v52, (dispatch_queue_t)&_dispatch_main_q, v66);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100041DE0;
      v62[3] = &unk_10006B070;
      v65 = v70;
      v62[4] = self;
      v63 = CFSTR("steady");
      v54 = v53;
      v64 = v54;
      -[PLPhotosApplication _installWillFinishTestHandler:](self, "_installWillFinishTestHandler:", v62);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("iterations")));
      v56 = objc_msgSend(v55, "intValue");
      v57 = -[PLPhotosApplication _scrollTestDelta:options:](self, "_scrollTestDelta:options:", v16, v15);
      v58 = -[PLPhotosApplication _scrollTestLength:options:](self, "_scrollTestLength:options:", v16, v15);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100041E2C;
      v60[3] = &unk_10006B098;
      v61 = v18;
      objc_msgSend(v16, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", v54, v56, v57, v58, v59, v17, v60);

      _Block_object_dispose(v70, 8);
    }
  }
  else
  {
    -[PLPhotosApplication failedTest:](self, "failedTest:", v14);
    if (v18)
      (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
  }

}

- (void)_computeFibonnaciNumbersForDuration:(double)a3
{
  double v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  do
    objc_msgSend(v4, "timeIntervalSinceNow");
  while (v3 > 0.0);

}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  BOOL v36;
  PLPhotosApplication *v37;
  PLPhotosApplication *v38;
  id v39;
  _QWORD *v40;
  void *v41;
  unsigned int v42;
  PLPhotosApplication *v44;
  id v45;
  objc_super v46;
  _QWORD v47[5];
  _QWORD *v48;
  _QWORD v49[4];
  id v50;
  PLPhotosApplication *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  unsigned __int8 v56;
  _QWORD v57[4];
  id v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("parentTestName")));
  if (v8)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication ppt_testDefinitions](self, "ppt_testDefinitions"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v10)
    {
      v11 = v10;
      v44 = self;
      v45 = v6;
      v12 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("testName"), v44, v45));
          v16 = objc_msgSend(v15, "isEqualToString:", v8);

          if (v16)
          {
            v17 = objc_msgSend(v14, "mutableCopy");
            objc_msgSend(v17, "addEntriesFromDictionary:", v7);

            v7 = v17;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v11)
          continue;
        break;
      }
LABEL_12:
      self = v44;
      v6 = v45;
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ImageManager")));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("neutered"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManagerSettings sharedSettings](PHImageManagerSettings, "sharedSettings"));
    v21 = objc_msgSend(v20, "allowImageRequests");
    v22 = objc_msgSend(v20, "allowCaching");
    objc_msgSend(v20, "setAllowImageRequests:", 0);
    objc_msgSend(v20, "setAllowCaching:", 0);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100041BAC;
    v57[3] = &unk_10006B0C0;
    v58 = v20;
    v59 = v21;
    v60 = v22;
    v23 = v20;
    -[PLPhotosApplication _addTest:completionHandler:](self, "_addTest:completionHandler:", v6, v57);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ImageModulation")));
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("all"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance"));
    v27 = objc_msgSend(v26, "isEnabled");
    v28 = objc_msgSend(v26, "HDRConsideration");
    objc_msgSend(v26, "setEnabled:", 1);
    objc_msgSend(v26, "setHDRConsideration:", 1);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100041BDC;
    v53[3] = &unk_10006B0E8;
    v56 = v27;
    v54 = v26;
    v55 = v28;
    v29 = v26;
    -[PLPhotosApplication _addTest:completionHandler:](self, "_addTest:completionHandler:", v6, v53);

  }
  v30 = objc_msgSend(v6, "copy");
  -[PLPhotosApplication setCurrentTestName:](self, "setCurrentTestName:", v30);

  v31 = objc_msgSend(v7, "copy");
  -[PLPhotosApplication setCurrentTestOptions:](self, "setCurrentTestOptions:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("selector")));
  v33 = v32;
  if (v32 && (objc_msgSend(v32, "isEqualToString:", &stru_10006E450) & 1) == 0)
  {
    v37 = self;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100041C08;
    v49[3] = &unk_10006B110;
    v50 = v33;
    v38 = v37;
    v51 = v38;
    v39 = v7;
    v52 = v39;
    v40 = objc_retainBlock(v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("RequiresImportSource")));
    v42 = objc_msgSend(v41, "BOOLValue");

    if (v42)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100041CC4;
      v47[3] = &unk_10006B528;
      v47[4] = v38;
      v48 = v40;
      -[PLPhotosApplication _performBlockWhenImportSourceIsReady:](v38, "_performBlockWhenImportSourceIsReady:", v47);

    }
    else
    {
      -[PLPhotosApplication _performTestWithBlock:](v38, "_performTestWithBlock:", v40);
    }

    goto LABEL_26;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[PhotosTestingRPTHelper gesturePerformerForTestWithName:options:](PhotosTestingRPTHelper, "gesturePerformerForTestWithName:options:", v6, v7));
  v35 = PXPhotosApplicationTryRunningSwiftPPTTest(v6, v7, self, v34, self);

  if ((v35 & 1) != 0)
  {
LABEL_26:
    v36 = 1;
    goto LABEL_27;
  }
  v46.receiver = self;
  v46.super_class = (Class)PLPhotosApplication;
  v36 = -[PLPhotosApplication runTest:options:](&v46, "runTest:options:", v6, v7);
LABEL_27:

  return v36;
}

- (void)failedTest:(id)a3 withFailureFormat:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  uint64_t *v10;
  uint64_t v11;

  v10 = &v11;
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v11);

  v9.receiver = self;
  v9.super_class = (Class)PLPhotosApplication;
  -[PLPhotosApplication failedTest:withFailure:](&v9, "failedTest:withFailure:", v7, v8);
  -[PLPhotosApplication _endedTest:](self, "_endedTest:", v7);

}

- (void)_performTestWithBlock:(id)a3
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = (void (**)(_QWORD))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewControllerIfExists](self, "_tabbedLibraryViewControllerIfExists"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ppt_navigationControllerForContentMode:", 10));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topViewController"));
  if (v7)
  {
    v8 = objc_opt_class(PXCuratedLibraryUIViewController);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v12 = (objc_class *)objc_opt_class(PXCuratedLibraryUIViewController);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "px_descriptionForAssertionMessage"));
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 650, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("navigator.topViewController"), v14, v15);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetsDataSourceManager"));
  objc_msgSend(v10, "performChanges:", &stru_10006B150);

  v5[2](v5);
}

- (void)_performBlockWhenImportSourceIsReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importViewController"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100041B90;
  v15[3] = &unk_10006D4D0;
  v7 = v4;
  v16 = v7;
  v8 = objc_retainBlock(v15);
  v9 = v8;
  if (v6)
  {
    if (v8)
      ((void (*)(_QWORD *))v8[2])(v8);
  }
  else
  {
    v10 = PLPPTGetLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Waiting for the import source", v14, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", self, CFSTR("importViewController"), 1, off_10007AAA8);

    v13 = objc_retainBlock(v9);
    objc_setAssociatedObject(self, &off_10007AAB0, v13, (void *)0x303);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id AssociatedObject;
  void (**v16)(_QWORD);
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  void (**v25)(_QWORD);
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  objc_super v33;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (off_10007AAA8 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
    objc_msgSend(v14, "removeObserver:forKeyPath:", self, CFSTR("importViewController"));

    AssociatedObject = objc_getAssociatedObject(self, &off_10007AAB0);
    v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (v16)
    {
      objc_setAssociatedObject(self, &off_10007AAB0, 0, (void *)0x303);
      v17 = PLPPTGetLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Import souce is ready. Running pending ppt test", buf, 2u);
      }

      v16[2](v16);
    }
    goto LABEL_15;
  }
  if (off_10007AAB8 == a6)
  {
    v16 = (void (**)(_QWORD))v12;
    if (v16)
    {
      v19 = objc_opt_class(PXGAnimator);
      if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
      {
LABEL_10:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
        v21 = objc_msgSend(v20, "BOOLValue");

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
        v23 = objc_msgSend(v22, "BOOLValue");

        if (v21 && (v23 & 1) == 0)
        {
          objc_msgSend(v16, "removeObserver:forKeyPath:", self, CFSTR("animating"));
          v24 = objc_getAssociatedObject(self, &off_10007AAC0);
          v25 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(v24);
          if (v25)
          {
            objc_setAssociatedObject(self, &off_10007AAC0, 0, (void *)0x303);
            v25[2](v25);
          }

        }
LABEL_15:

        goto LABEL_16;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v30 = (objc_class *)objc_opt_class(PXGAnimator);
      v31 = NSStringFromClass(v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "px_descriptionForAssertionMessage"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 689, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("object"), v29, v32);

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v27 = (objc_class *)objc_opt_class(PXGAnimator);
      v28 = NSStringFromClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 689, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("object"), v29);
    }

    goto LABEL_10;
  }
  v33.receiver = self;
  v33.super_class = (Class)PLPhotosApplication;
  -[PLPhotosApplication observeValueForKeyPath:ofObject:change:context:](&v33, "observeValueForKeyPath:ofObject:change:context:", v11, v12, v13, a6);
LABEL_16:

}

- (void)startedCurrentTest
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  if (!+[PhotosTestingRPTHelper isRPTStyleTestName:](PhotosTestingRPTHelper, "isRPTStyleTestName:"))
    -[PLPhotosApplication startedTest:](self, "startedTest:", v3);

}

- (void)finishedCurrentTest
{
  void *v4;
  unsigned __int8 v5;
  void *v6;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 722, CFSTR("%s must be called on the main thread"), "-[PLPhotosApplication(Testing) finishedCurrentTest]");

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v5 = +[PhotosTestingRPTHelper isRPTStyleTestName:](PhotosTestingRPTHelper, "isRPTStyleTestName:", v4);

  if ((v5 & 1) == 0)
    -[PLPhotosApplication finishedCurrentTestWithExtraResults:](self, "finishedCurrentTestWithExtraResults:", 0);
}

- (void)finishedCurrentTestWithExtraResults:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  -[PLPhotosApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", v5, v4);

}

- (void)failedCurrentTest
{
  -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Unknown"));
}

- (void)failedCurrentTestWithFailure:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  -[PLPhotosApplication failedTest:withFailure:](self, "failedTest:withFailure:", v6, v5);

}

- (int)_scrollTestLength:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contentSize");
  v9 = v8;
  objc_msgSend(v6, "contentSize");
  if (v9 >= v10)
    v10 = v9;
  v11 = (int)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fullLength")));
  v13 = objc_msgSend(v12, "intValue");

  if (v13 != 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollLength")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollLength")));
      v16 = objc_msgSend(v15, "intValue");

    }
    else
    {
      v16 = (int)fmax((double)-[PLPhotosApplication _scrollTestDelta:options:](self, "_scrollTestDelta:options:", v6, v7)* 120.0, 10000.0);
    }
    if (v16 < v11)
      v11 = v16;
  }

  return v11;
}

- (int)_scrollTestDelta:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("fullScreen")));
  v8 = objc_msgSend(v7, "intValue");

  if (v8 == 1)
  {
    objc_msgSend(v5, "frame");
    v10 = v9;
    objc_msgSend(v5, "frame");
    if (v10 < v11)
      v10 = v11;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("offset")));
    v13 = v12;
    if (v12)
      v14 = (double)(int)objc_msgSend(v12, "intValue");
    else
      v14 = 50.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v15, "refreshRate");
    v17 = v16;

    v10 = round(v14 * (v17 / 0.0166666667));
  }

  return (int)v10;
}

- (unint64_t)_scrollAxisForTestWithOptions:(id)a3
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("scrollAxis")));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("horizontal"));

  if (v4)
    return 1;
  else
    return 2;
}

- (void)_navigateToDestination:(id)a3 completionHandler:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041AB0;
  v6[3] = &unk_10006B178;
  v6[4] = self;
  v7 = a4;
  v5 = v7;
  +[PXPPTNavigationHelper navigateToDestination:options:completionHandler:](PXPPTNavigationHelper, "navigateToDestination:options:completionHandler:", a3, 0, v6);

}

- (id)_scrollViewToTestForViewController:(id)a3
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  PLPhotosApplication *v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD *v19;
  SEL v20;
  _QWORD v21[4];
  _QWORD v22[3];
  double v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000300A0;
  v28 = sub_1000300B0;
  v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentScrollView"));
  if (!v25[5] && objc_msgSend(v5, "isViewLoaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0.0;
    v7 = objc_msgSend(v6, "bounds");
    v23 = PXSizeGetArea(v7, v8, v9) * 0.5;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000418B4;
    v14[3] = &unk_10006B1A0;
    v10 = v6;
    v17 = v21;
    v18 = &v24;
    v15 = v10;
    v16 = self;
    v19 = v22;
    v20 = a2;
    objc_msgSend(v10, "px_enumerateDescendantSubviewsUsingBlock:", v14);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);

  }
  v11 = (void *)v25[5];
  if (!v11)
  {
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Couldn't find scroll view for view controller %@"), v5);
    v11 = (void *)v25[5];
  }
  v12 = v11;
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_tungstenViewToTestForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000300A0;
  v14 = sub_1000300B0;
  v15 = 0;
  if (objc_msgSend(v4, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004183C;
    v9[3] = &unk_10006B1C8;
    v9[4] = &v10;
    objc_msgSend(v5, "px_enumerateDescendantSubviewsUsingBlock:", v9);

  }
  v6 = (void *)v11[5];
  if (!v6)
  {
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Couldn't find a PXGView for view controller %@"), v4);
    v6 = (void *)v11[5];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)runScrollTestOnScrollView:(id)a3 withOptions:(id)a4 subTestName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = -[PLPhotosApplication ppt_determineAxisForScrollView:withOptions:](self, "ppt_determineAxisForScrollView:withOptions:", v10, v13);
  PXPPTWillBeginScrollTestOnScrollView(v10);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000417E8;
  v17[3] = &unk_10006B1F0;
  v18 = v10;
  v19 = v11;
  v15 = v11;
  v16 = v10;
  -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:", v12, v13, v16, v14, 0, v17);

}

- (void)measureScrollingOfScrollView:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041778;
  v12[3] = &unk_10006B1F0;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v11, v9, v7, v12);

}

- (void)runBaselineScrollTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init((Class)sub_10003B500());
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004161C;
    v9[3] = &unk_10006B268;
    v9[4] = self;
    v10 = v5;
    v11 = v4;
    v12 = v6;
    v8 = v6;
    objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, v9);

  }
  else
  {
    -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
  }

}

- (void)runScrollAlbumTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041544;
  v4[3] = &unk_10006B290;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToAlbumForCurrentTest:](v5, "_navigateToAlbumForCurrentTest:", v4);

}

- (void)runScrollMessagesStackTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "librarySpecificFetchOptions"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 2, 203, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v8, v6));
  v10 = v9;
  if (v8 && (unint64_t)objc_msgSend(v9, "count") >= 0xA)
  {
    LOBYTE(v18) = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:", v8, v10, 0, 0, 0, 0, v18));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoLibrary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v12));

    v14 = objc_msgSend(objc_alloc((Class)PXMessagesStackBalloonViewController), "initWithDataSourceManager:mediaProvider:", v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));

    if (v16)
    {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("There is already a presented view controller in photos"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100041464;
      v19[3] = &unk_10006B110;
      v19[4] = self;
      v20 = v14;
      v21 = v4;
      objc_msgSend(v17, "presentViewController:animated:completion:", v20, 1, v19);

    }
  }
  else
  {
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("The favorites album must have at least 10 assets"));
  }

}

- (void)runScrollPeopleHomeTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000412D8;
  v4[3] = &unk_10006B2E0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](v5, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v4);

}

- (void)runScrollPeopleHomeSortedTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041140;
  v4[3] = &unk_10006B2E0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](v5, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v4);

}

- (void)runScrollPeopleDetailTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041094;
  v4[3] = &unk_10006B308;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToPhotosDetailsForCurrentTestAnimated:willTapHandler:willTransitionHandler:didTransitionHandler:completion:](v5, "_navigateToPhotosDetailsForCurrentTestAnimated:willTapHandler:willTransitionHandler:didTransitionHandler:completion:", 1, 0, 0, 0, v4);

}

- (void)runScrollForYouTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100040F80;
  v21[3] = &unk_10006D648;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance"));
  v23 = objc_msgSend(v22, "copy");
  v5 = v23;
  v6 = v22;
  v7 = objc_retainBlock(v21);
  objc_msgSend(v6, "setShowVerticalSampleGadgets:", 1);
  objc_msgSend(v6, "setShowHorizontalGadget:", 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040F8C;
  v18[3] = &unk_10006D648;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"));
  v20 = objc_msgSend(v19, "copy");
  v8 = v20;
  v9 = v19;
  v10 = objc_retainBlock(v18);
  objc_msgSend(v9, "setInvitationsDataSourceType:", 1);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100040F98;
  v14[3] = &unk_10006B358;
  v14[4] = self;
  v15 = v4;
  v16 = v7;
  v17 = v10;
  v11 = v10;
  v12 = v7;
  v13 = v4;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](self, "_navigateToForYouForCurrentTest:", v14);

}

- (void)runScrollMapTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040E30;
  v4[3] = &unk_10006B380;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](v5, "_navigateToMyAlbumListForCurrentTest:", v4);

}

- (void)runZoomMapTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040D08;
  v4[3] = &unk_10006B380;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](v5, "_navigateToMyAlbumListForCurrentTest:", v4);

}

- (void)runScrollSearchHomeTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040BE4;
  v4[3] = &unk_10006B3A8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToSearchTabForCurrentTest:](v5, "_navigateToSearchTabForCurrentTest:", v4);

}

- (void)runScrollSearchResultsTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040A40;
  v4[3] = &unk_10006B3A8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToSearchTabForCurrentTest:](v5, "_navigateToSearchTabForCurrentTest:", v4);

}

- (void)runScrollCuratedLibraryTabTest:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  int64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomLevel")));
  v6 = -[PLPhotosApplication _zoomLevelFromTestDefinitionZoomLevelName:](self, "_zoomLevelFromTestDefinitionZoomLevelName:", v5);
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100040880;
    v8[3] = &unk_10006B438;
    v11 = v6;
    v8[4] = self;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
    v10 = v4;
    v7 = v9;
    -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v8);

  }
  else
  {
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("invalid zoomLevel specified in test definition: ”%@”"), v5);
  }

}

- (int64_t)_zoomLevelFromTestDefinitionZoomLevelName:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_10006E450));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("years")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("months")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("days")) & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("allphotos")))
  {
    v5 = 4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)runScrollAlbumsTabTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004075C;
  v4[3] = &unk_10006B460;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToAlbumsTabForCurrentTest:](v5, "_navigateToAlbumsTabForCurrentTest:", v4);

}

- (void)runScrollMyAlbumListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000406EC;
  v4[3] = &unk_10006B380;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](v5, "_navigateToMyAlbumListForCurrentTest:", v4);

}

- (void)runScrollSharedAlbumListTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004067C;
  v4[3] = &unk_10006B380;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToSharedAlbumListForCurrentTest:](v5, "_navigateToSharedAlbumListForCurrentTest:", v4);

}

- (void)runScrollHorizontallyMyAlbumsTest:(id)a3
{
  -[PLPhotosApplication _scrollHorizontallyAlbumListType:options:](self, "_scrollHorizontallyAlbumListType:options:", 1, a3);
}

- (void)runScrollHorizontallySharedAlbumsTest:(id)a3
{
  -[PLPhotosApplication _scrollHorizontallyAlbumListType:options:](self, "_scrollHorizontallyAlbumListType:options:", 2, a3);
}

- (void)runScrollHorizontallySyndicatedContentItemsTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040474;
  v4[3] = &unk_10006B488;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](v5, "_navigateToForYouForCurrentTest:", v4);

}

- (void)_navigateToContentSyndicationSeeAllGridWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000402EC;
  v5[3] = &unk_10006B4D8;
  v6 = a3;
  v4 = v6;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](self, "_navigateToForYouForCurrentTest:", v5);

}

- (void)runScrollContentSyndicationAllAssetsGridTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040250;
  v4[3] = &unk_10006B500;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToContentSyndicationSeeAllGridWithCompletionHandler:](v5, "_navigateToContentSyndicationSeeAllGridWithCompletionHandler:", v4);

}

- (id)_assetForGridViewController:(id)a3 startFromEnd:(BOOL)a4 assetCollection:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDataSource"));

  if (a4)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastAssetCollection"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstAssetCollection"));
  v10 = (void *)v9;
  v11 = objc_alloc((Class)PXAssetCollectionReference);
  v12 = PXSimpleIndexPathNull[1];
  v20 = PXSimpleIndexPathNull[0];
  v21 = v12;
  v13 = objc_msgSend(v11, "initWithAssetCollection:keyAssetReference:indexPath:", v10, 0, &v20);
  v20 = 0u;
  v21 = 0u;
  if (v8)
    objc_msgSend(v8, "indexPathForAssetCollectionReference:", v13);
  v19[0] = v20;
  v19[1] = v21;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsInSectionIndexPath:", v19));
  v15 = v14;
  if (a4)
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
  else
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  v17 = (void *)v16;
  if (a5 && v16)
    *a5 = objc_retainAutorelease(v10);

  return v17;
}

- (id)_oneUpViewControllerForViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  if (v5)
  {
    v6 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    else
      v7 = v5;
    v8 = v7;

    v4 = v8;
  }
  v9 = objc_opt_class(PUOneUpViewController);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    v10 = v4;
  else
    v10 = 0;

  return v10;
}

- (void)_navigateToContentSyndicationOneUpWithCompleteHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003FFE4;
  v4[3] = &unk_10006B578;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToContentSyndicationSeeAllGridWithCompletionHandler:](v5, "_navigateToContentSyndicationSeeAllGridWithCompletionHandler:", v4);

}

- (void)runScrollSyndicatedContentOneUpTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003FF9C;
  v4[3] = &unk_10006B5A0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToContentSyndicationOneUpWithCompleteHandler:](v5, "_navigateToContentSyndicationOneUpWithCompleteHandler:", v4);

}

- (void)runScrubSyndicatedContentOneUpTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003FF54;
  v4[3] = &unk_10006B5A0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToContentSyndicationOneUpWithCompleteHandler:](v5, "_navigateToContentSyndicationOneUpWithCompleteHandler:", v4);

}

- (void)_scrollHorizontallyAlbumListType:(unint64_t)a3 options:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FDE0;
  v7[3] = &unk_10006B5C8;
  v8 = a4;
  v9 = a3;
  v7[4] = self;
  v6 = v8;
  -[PLPhotosApplication _navigateToAlbumsTabForCurrentTest:](self, "_navigateToAlbumsTabForCurrentTest:", v7);

}

- (id)_horizontalAlbumListGadgetForType:(unint64_t)a3 fromAlbumsGadgetViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dataSourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gadgetsOfType:", 11));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003FD9C;
  v11[3] = &unk_10006B5E8;
  v11[4] = a3;
  v8 = PXFind(v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)runScrollActivityFeedTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FBB4;
  v7[3] = &unk_10006B290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "navigateToCloudFeedWithCompletion:", v7);

}

- (void)runScrollMemoriesTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FB4C;
  v7[3] = &unk_10006B610;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[PLPhotosApplication _navigateToMemoryFeedWithCompletionHandler:](self, "_navigateToMemoryFeedWithCompletionHandler:", v7);

}

- (void)runScrollIncomingCMMInvitationViewTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  NSLog(CFSTR("runScrollIncomingCMMInvitationViewTest called."));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003FADC;
  v6[3] = &unk_10006B290;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLPhotosApplication _navigateToIncomingCMMInvitationForCurrentTest:](self, "_navigateToIncomingCMMInvitationForCurrentTest:", v6);

}

- (void)runScrollIncomingCMMInvitationViewSelectingTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  NSLog(CFSTR("runScrollIncomingCMMInvitationViewSelectingTest called."));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003FA6C;
  v6[3] = &unk_10006B290;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLPhotosApplication _navigateToIncomingCMMInvitationForCurrentTest:selecting:](self, "_navigateToIncomingCMMInvitationForCurrentTest:selecting:", v6, 1);

}

- (void)runScrollOutgoingCMMInvitationViewTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  NSLog(CFSTR("runScrollOutgoingCMMInvitationViewTest called."));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F9FC;
  v6[3] = &unk_10006B290;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLPhotosApplication _navigateToOutgoingCMMInvitationForCurrentTest:](self, "_navigateToOutgoingCMMInvitationForCurrentTest:", v6);

}

- (void)runShowOneUpDetailsTest:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F8B4;
  v7[3] = &unk_10006D648;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)runShowOneUpDetailsSyndicationTest:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F694;
  v4[3] = &unk_10006B660;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_configureLibraryFilterModeWithTestOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t LibraryFilterViewModeWithSharedLibraryOrPreview;
  void *v8;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("libraryFilterMode")));
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("shared")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("personal")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("all")) & 1) == 0)
      {
        -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("sharedLibraryMode option is invalid: %@"), v5);
        goto LABEL_9;
      }
      v6 = 0;
    }
    LibraryFilterViewModeWithSharedLibraryOrPreview = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview(1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003F688;
    v9[3] = &unk_10006B6A8;
    v9[4] = LibraryFilterViewModeWithSharedLibraryOrPreview;
    -[PLPhotosApplication _addTest:completionHandler:](self, "_addTest:completionHandler:", v8, v9);

    PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview(v6, 1);
  }
LABEL_9:

}

- (void)runOneUpToggleDetailsTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PLPhotosApplication _configureLibraryFilterModeWithTestOptions:](self, "_configureLibraryFilterModeWithTestOptions:", v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F678;
  v6[3] = &unk_10006B6D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLPhotosApplication _navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:](self, "_navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:", 1, v6);

}

- (void)runOneUpDetailsTransitionSyndicationTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F5F0;
  v6[3] = &unk_10006B6F8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[PLPhotosApplication _navigateToContentSyndicationOneUpWithCompleteHandler:](self, "_navigateToContentSyndicationOneUpWithCompleteHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_oneUpDetailsTransitionWith:(id)a3 testOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  dispatch_time_t v22;
  _QWORD block[4];
  id v24;
  PLPhotosApplication *v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:](PhotosTestingRPTHelper, "shouldUseRPTScrollingForRPTOptions:", v7))
  {
    objc_msgSend(v6, "ppt_scrollableBoundsForTesting");
    -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollBounds:](self, "ppt_performScrollTest:withOptions:scrollBounds:", v8, v7, UIEdgeInsetsZero.left + v9, v10 + 50.0, v11 - (UIEdgeInsetsZero.left + UIEdgeInsetsZero.right), v12 + -220.0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterations")));
    v14 = objc_msgSend(v13, "integerValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterationDelta")));
    v16 = objc_msgSend(v15, "integerValue");
    if (v16)
      v17 = (uint64_t)v16;
    else
      v17 = 750;

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "browsingSession"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetsDataSource"));
    v21 = objc_msgSend(v20, "isEmpty");

    if ((v21 & 1) != 0)
    {
      -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
    }
    else
    {
      objc_msgSend(v6, "ppt_toggleAccessoryView");
      v22 = dispatch_time(0, 1000000 * v17);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003F22C;
      block[3] = &unk_10006B770;
      v28 = v17;
      v24 = v6;
      v25 = self;
      v26 = v8;
      v27 = v29;
      dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    _Block_object_dispose(v29, 8);
  }

}

- (void)_runScrollTestWithOneUpViewController:(id)a3 options:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ppt_mainScrollView"));
  v7 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    objc_msgSend(v8, "scrollViewWillBeginDragging:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
    -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", v9, v10, v6, 1, 0);

  }
  else
  {
    -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
  }

}

- (void)runScrollOneUpTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLPhotosApplication *v8;

  v4 = a3;
  -[PLPhotosApplication _configureLibraryFilterModeWithTestOptions:](self, "_configureLibraryFilterModeWithTestOptions:", v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F1B0;
  v6[3] = &unk_10006B6D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](self, "_navigateToAssetInOneUpForCurrentTest:", v6);

}

- (void)runPageSwipeOneUpTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F0B8;
  v4[3] = &unk_10006B6D0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](v5, "_navigateToAssetInOneUpForCurrentTest:", v4);

}

- (void)_runScrubTestWithOneUpViewController:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ppt_scrubberView"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(UIScrollView);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  v14 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    objc_msgSend(v15, "scrollViewWillBeginDragging:", v9);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
    -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:](self, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", v16, v6, v9, 1, 0);

  }
  else
  {
    -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
  }

}

- (void)runScrubOneUpTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F0A8;
  v4[3] = &unk_10006B6D0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](v5, "_navigateToAssetInOneUpForCurrentTest:", v4);

}

- (void)runSkimFullQualityOneUpPhotosTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003E8E0;
  v3[3] = &unk_10006B638;
  v3[4] = self;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](self, "_navigateToAssetInOneUpForCurrentTest:", v3);
}

- (void)runLoadFullScreenSharingOneUpTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[3];
  id v9;

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E6CC;
  v7[3] = &unk_10006B838;
  v7[4] = self;
  v7[5] = v8;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](self, "_navigateToAssetInOneUpForCurrentTest:", v7);
  _Block_object_dispose(v8, 8);

}

- (void)tearDownSharingTest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  PLPhotosApplication *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E5E4;
  v5[3] = &unk_10006D648;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[PLPhotosApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v5);

}

- (void)_runSharingTest:(id)a3 withActivityType:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  PLPhotosApplication *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E004;
  v7[3] = &unk_10006B8D8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](v8, "_navigateToAssetInOneUpForCurrentTest:", v7);

}

- (void)runMessageSharingTest:(id)a3
{
  -[PLPhotosApplication _runSharingTest:withActivityType:](self, "_runSharingTest:withActivityType:", CFSTR("MFMessageShareComposeViewDidShow"), UIActivityTypeMessage);
}

- (void)runMailSharingTest:(id)a3
{
  -[PLPhotosApplication _runSharingTest:withActivityType:](self, "_runSharingTest:withActivityType:", CFSTR("MFMailShareComposeViewDidShow"), UIActivityTypeMail);
}

- (void)runScrollShareSheetTestNatural:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DFF0;
  block[3] = &unk_10006D620;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runScrollShareSheetCarouselTest:(id)a3
{
  -[PLPhotosApplication _runSharingTest:withActivityType:](self, "_runSharingTest:withActivityType:", CFSTR("ScrollShareSheetCarousel"), 0);
}

- (void)runLoadOneUpDocumentMenuTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLPhotosApplication *v8;

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003DC78;
  v6[3] = &unk_10006B6D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](self, "_navigateToAssetInOneUpForCurrentTest:", v6);

}

- (void)_runLoadOneUpDocumentMenuActionsSubTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  -[PLPhotosApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("LoadOneUpDocumentMenuActionsSubTest"), v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ppt_barsController"));
  v6 = objc_msgSend(v8, "ppt_documentMenuActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  -[PLPhotosApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", CFSTR("LoadOneUpDocumentMenuActionsSubTest"), v7);

}

- (void)_runPhotoEditTestWithOptions:(id)a3 afterEditOpenedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  id v15;

  v6 = a3;
  v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations")));
  v9 = objc_msgSend(v8, "integerValue");

  v15 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003D8D4;
  v11[3] = &unk_10006B9A0;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  v13 = v14;
  -[PLPhotosApplication _navigateToAssetInOneUpForCurrentTest:](self, "_navigateToAssetInOneUpForCurrentTest:", v11);

  _Block_object_dispose(v14, 8);
}

- (void)runLoadPhotoEditorOneUpTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006B9E0);
}

- (void)runLoadPhotoEditorOneUpTestWaitUntilRendered:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BA00);
}

- (void)runLoadPhotoEditorOpenFiltersTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BA20);
}

- (void)runLoadPhotoEditorDepthTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BA40);
}

- (void)runLoadPhotoEditorOpenAdjustmentsTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BA60);
}

- (void)runLoadPhotoEditorOpenCropTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BA80);
}

- (void)runLoadPhotoEditorOpenPerspectiveTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BAA0);
}

- (void)runLoadPhotoEditorApplyAutoenhanceTest:(id)a3
{
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, &stru_10006BAC0);
}

- (void)_runSelectedSliderTestForViewController:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PLPhotosApplication *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollSteps")));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollIterations")));
  v11 = objc_msgSend(v10, "integerValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("targetRate")));
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v6, "ppt_configureSelectedSliderWithSteps:", v9);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000300A0;
  v30 = sub_1000300B0;
  v31 = 0;
  v14 = objc_alloc((Class)NSTimer);
  v15 = (_QWORD)v11 * (_QWORD)v9;
  v16 = v27[5];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003D15C;
  v20[3] = &unk_10006BAE8;
  v23 = &v26;
  v17 = v6;
  v24 = v32;
  v25 = v15;
  v21 = v17;
  v22 = self;
  v18 = objc_msgSend(v14, "initWithFireDate:interval:repeats:block:", v16, 1, v20, 1.0 / (double)(uint64_t)v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v19, "addTimer:forMode:", v18, kCFRunLoopDefaultMode);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

}

- (void)runScrollLightAdjustmentTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CFA0;
  v4[3] = &unk_10006BB10;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](v5, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", v3, v4);

}

- (void)runScrollColorAdjustmentTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CDE4;
  v4[3] = &unk_10006BB10;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](v5, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", v3, v4);

}

- (void)runScrollBWAdjustmentTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CC28;
  v4[3] = &unk_10006BB10;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](v5, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", v3, v4);

}

- (void)runLivePhotoPlaybackInEditTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003CA84;
  v3[3] = &unk_10006BB38;
  v3[4] = self;
  -[PLPhotosApplication _runPhotoEditTestWithOptions:afterEditOpenedBlock:](self, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:", a3, v3);
}

- (void)runLivePhotoPlaybackTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003C954;
  v3[3] = &unk_10006BB60;
  v3[4] = self;
  -[PLPhotosApplication _navigateToLivePhotosForCurrentTest:](self, "_navigateToLivePhotosForCurrentTest:", v3);
}

- (BOOL)_purgeVariationsCaches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variationCache"));

  objc_msgSend(v4, "purgeAll");
  objc_opt_class(PLPhotoEditRenderer);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)qword_10007C130;
  v23 = qword_10007C130;
  if (!qword_10007C130)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003C688;
    v19[3] = &unk_10006D288;
    v19[4] = &v20;
    sub_10003C688((uint64_t)v19);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v6, "clearCacheDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "librarySpecificFetchOptions"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("additionalAttributes.variationSuggestionStates != 0")));
  objc_msgSend(v8, "setInternalPredicate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v8));
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "photoLibrary"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003C824;
    v17[3] = &unk_10006D620;
    v12 = v10;
    v18 = v12;
    v16 = 0;
    v13 = objc_msgSend(v11, "performChangesAndWait:error:", v17, &v16);
    v14 = v16;
    if ((v13 & 1) == 0)
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Unable to reset autoloop suggestion state error:%@ assets:%ld %@"), v14, objc_msgSend(v12, "count"), v12);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)_navigateToLivePhotosForCurrentTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BFCC;
  v4[3] = &unk_10006BBD8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:](v5, "_navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:", 1, 1, v4);

}

- (void)runBaselineTransitionTest:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  SEL v14;

  v5 = a3;
  v6 = objc_alloc_init((Class)sub_10003B500());
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)PUNavigationController), "initWithRootViewController:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003B5B8;
    v10[3] = &unk_10006BCA0;
    v10[4] = self;
    v11 = v5;
    v13 = v7;
    v14 = a2;
    v12 = v6;
    v9 = v7;
    objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, v10);

  }
  else
  {
    -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
  }

}

- (void)runSelectAlbumsTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  __CFString *v13;
  _QWORD v14[4];
  __CFString *v15;
  PLPhotosApplication *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[3];
  id v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v20 = v6;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("albums")));
  v8 = (void *)v7;
  v9 = CFSTR("visible");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxAlbumsCount")));
  v12 = objc_msgSend(v11, "integerValue");

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003ABD4;
  v14[3] = &unk_10006BD68;
  v13 = v10;
  v15 = v13;
  v16 = self;
  v17 = v19;
  v18 = v12;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](self, "_navigateToMyAlbumListForCurrentTest:", v14);

  _Block_object_dispose(v19, 8);
}

- (void)runSelectPhotosTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[7];
  _QWORD v10[3];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPhotosCount")));
  v8 = objc_msgSend(v7, "integerValue");

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100038FB0;
  v9[3] = &unk_10006BED0;
  v9[4] = self;
  v9[5] = v10;
  v9[6] = v8;
  -[PLPhotosApplication _navigateToAlbumForCurrentTest:](self, "_navigateToAlbumForCurrentTest:", v9);
  _Block_object_dispose(v10, 8);

}

- (void)runSelectPhotosVisualIntelligenceTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[7];
  _QWORD v10[3];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPhotosCount")));
  v8 = objc_msgSend(v7, "integerValue");

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000384D8;
  v9[3] = &unk_10006BED0;
  v9[4] = self;
  v9[5] = v10;
  v9[6] = v8;
  -[PLPhotosApplication _navigateToAlbumForCurrentTest:](self, "_navigateToAlbumForCurrentTest:", v9);
  _Block_object_dispose(v10, 8);

}

- (void)runCuratedLibraryZoomLevelTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[3];
  id v9;

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000380A0;
  v7[3] = &unk_10006BF20;
  v7[4] = self;
  v7[5] = v8;
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v7);
  _Block_object_dispose(v8, 8);

}

- (void)runCuratedLibraryFilterTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[3];
  id v9;

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v6 = objc_msgSend(v5, "integerValue");

  v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037CE4;
  v7[3] = &unk_10006BF20;
  v7[4] = self;
  v7[5] = v8;
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v7);
  _Block_object_dispose(v8, 8);

}

- (void)_performActionsWithCuratedLibraryVC:(id)a3 actionsTypesAndNames:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "first"));
  if (objc_msgSend(v13, "canPerformActionType:", v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
    v17 = PXCuratedLibraryZoomLevelDescription(objc_msgSend(v12, "zoomLevel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v25 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_10006E450));

    v26 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "second"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Filter%@%@-Latency"), v19, v20));

    -[PLPhotosApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("Latency"), v16);
    -[PLPhotosApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", v21, v16);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100037B50;
    v29[3] = &unk_10006BF98;
    v29[4] = self;
    v30 = v16;
    v31 = v21;
    v32 = v9;
    v34 = v26;
    v33 = v25;
    v22 = v21;
    v23 = v16;
    -[PLPhotosApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionPerformerForActionType:", v15));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100037C2C;
    v27[3] = &unk_10006BFC0;
    v27[4] = self;
    v28 = v15;
    objc_msgSend(v24, "performActionWithCompletionHandler:", v27);

    v10 = v26;
    v8 = v25;
  }
  else
  {
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Unable to perform action %@"), v15);
  }

}

- (void)_gridView:(id)a3 performBlockAfterAnimationsCompleted:(id)a4
{
  id v7;
  id AssociatedObject;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  AssociatedObject = objc_getAssociatedObject(self, &off_10007AAC0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 2768, CFSTR("Completion block already exists!"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "engine"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ppt_animator"));

  objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("animating"), 3, off_10007AAB8);
  v12 = objc_retainBlock(v7);

  objc_setAssociatedObject(self, &off_10007AAC0, v12, (void *)0x303);
}

- (void)_transitionCuratedLibraryVC:(id)a3 toZoomLevelsWithSubTestNames:(id)a4 taskHandler:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  PLPhotosApplication *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v12, "count");
  if (!v15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication-Testing.m"), 2781, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "first"));
  v18 = objc_msgSend(v17, "integerValue");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "second"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100037AE0;
  v25[3] = &unk_10006C010;
  v26 = v12;
  v27 = self;
  v28 = v11;
  v29 = v14;
  v30 = v13;
  v31 = v15;
  v20 = v13;
  v21 = v11;
  v22 = v12;
  v23 = v14;
  -[PLPhotosApplication _curatedLibraryVC:transitionToZoomLevel:animationSubTestName:task:then:](self, "_curatedLibraryVC:transitionToZoomLevel:animationSubTestName:task:then:", v21, v18, v19, v20, v25);

}

- (void)_curatedLibraryVC:(id)a3 transitionToZoomLevel:(int64_t)a4 animationSubTestName:(id)a5 task:(id)a6 then:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  PLPhotosApplication *v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "gridView"));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100037968;
  v26[3] = &unk_10006C010;
  v19 = v13;
  v27 = v19;
  v28 = self;
  v20 = v16;
  v29 = v20;
  v30 = v14;
  v31 = v15;
  v32 = a4;
  v21 = v15;
  v22 = v14;
  -[PLPhotosApplication _gridView:performBlockAfterAnimationsCompleted:](self, "_gridView:performBlockAfterAnimationsCompleted:", v18, v26);
  if (objc_msgSend(v19, "length"))
    -[PLPhotosApplication pu_startedAnimationSubTest:forTest:](self, "pu_startedAnimationSubTest:forTest:", v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewProvider"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewModel"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100037A0C;
  v25[3] = &unk_10006B3F0;
  v25[4] = a4;
  objc_msgSend(v24, "performChanges:", v25);

}

- (void)_runRotationTestWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[3];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations")));
  v7 = objc_msgSend(v6, "integerValue");

  v11 = v7;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037734;
  v9[3] = &unk_10006C088;
  v9[4] = self;
  v9[5] = v10;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000377CC;
  v8[3] = &unk_10006D620;
  -[PLPhotosApplication ppt_startIterationWithBlock:completion:](self, "ppt_startIterationWithBlock:completion:", v9, v8);
  _Block_object_dispose(v10, 8);

}

- (void)runActivityFeedRotationTest:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037728;
  v5[3] = &unk_10006C0B0;
  v5[4] = self;
  objc_msgSend(v4, "navigateToCloudFeedWithCompletion:", v5);

}

- (void)runAlbumsRotationTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003771C;
  v3[3] = &unk_10006C0D8;
  v3[4] = self;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](self, "_navigateToMyAlbumListForCurrentTest:", v3);
}

- (void)runCuratedLibraryRotationTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100037710;
  v3[3] = &unk_10006C100;
  v3[4] = self;
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v3);
}

- (void)startSwitchTabTest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  objc_msgSend(v6, "ppt_runTabSwitchingTestWithName:options:delegate:completionHandler:", v5, v4, self, 0);

}

- (id)_tabbedLibraryViewController
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication contentViewController](self, "contentViewController"));
  v3 = objc_opt_class(PUTabbedLibraryViewController);
  if (v3 && (objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)_tabbedLibraryViewControllerIfExists
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication contentViewController](self, "contentViewController"));
  v4 = objc_opt_class(PUTabbedLibraryViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication contentViewController](self, "contentViewController"));
  else
    v6 = 0;
  return v6;
}

- (void)_navigateToAssetInOneUpForCurrentTest:(id)a3
{
  -[PLPhotosApplication _navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:](self, "_navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:", 0, a3);
}

- (void)_navigateToAssetInOneUpPreferLocationAndFace:(BOOL)a3 forCurrentTest:(id)a4
{
  id v4;
  _QWORD v5[4];
  PLPhotosApplication *v6;
  id v7;
  BOOL v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000372A0;
  v5[3] = &unk_10006C178;
  v8 = a3;
  v6 = self;
  v7 = a4;
  v4 = v7;
  -[PLPhotosApplication _navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:](v6, "_navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:", 1, 0, v5);

}

- (void)_navigateToAssetForCurrentTestInOneUp:(BOOL)a3 startFromEnd:(BOOL)a4 completion:(id)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  PLPhotosApplication *v17;
  _QWORD *v18;
  _QWORD *v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[5];
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;
  BOOL v27;
  _QWORD v28[3];
  char v29;

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000365AC;
  v24[3] = &unk_10006C1A0;
  v26 = a3;
  v24[4] = self;
  v8 = a5;
  v25 = v8;
  v27 = a4;
  v9 = objc_retainBlock(v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("fakeAlbum")));
  v12 = v11;
  if (v11 && objc_msgSend(v11, "isEqualToString:", CFSTR("Activity")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000366B0;
    v22[3] = &unk_10006C2B8;
    v22[4] = self;
    v23 = v9;
    objc_msgSend(v13, "navigateToCloudFeedWithCompletion:", v22);

    v14 = v23;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036868;
    v15[3] = &unk_10006C1F0;
    v19 = v28;
    v16 = v10;
    v17 = self;
    v18 = v9;
    v20 = a4;
    v21 = a3;
    -[PLPhotosApplication _navigateToAlbumForCurrentTest:](self, "_navigateToAlbumForCurrentTest:", v15);

    v14 = v16;
  }

  _Block_object_dispose(v28, 8);
}

- (void)_navigateToAlbumForCurrentTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  unsigned __int8 v47;
  void *v48;
  PLPhotosApplication *v49;
  void *v50;
  __CFString *v51;
  _QWORD v52[4];
  id v53;
  PLPhotosApplication *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("album")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("all photos")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("recents")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("camera roll")))
  {
    v8 = CFSTR("camera-roll");
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("import history")))
    v8 = (__CFString *)PXProgrammaticNavigationWellKnownNameImportHistory;
  if (v7)
  {
    v9 = CFSTR("album");
    if (v8)
    {
LABEL_9:
      v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("photos://%@?name=%@"), v9, v8);
      v11 = objc_alloc((Class)PXProgrammaticNavigationDestination);
      v12 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
      v14 = objc_msgSend(v11, "initWithURL:", v13);

      -[PLPhotosApplication _navigateToDestination:completionHandler:](self, "_navigateToDestination:completionHandler:", v14, v4);
      goto LABEL_93;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("userAlbum")));
    v16 = v15;
    if (v15)
    {
      v17 = v15;

      v9 = CFSTR("userAlbum");
      v8 = v17;
    }
    else
    {
      v9 = CFSTR("album");
    }

    if (v8)
      goto LABEL_9;
  }
  v50 = v5;
  v51 = v8;
  v49 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "albums"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "array"));

  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v60 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v61;
LABEL_16:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v26);
      v28 = objc_msgSend(v27, "kindValue");
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("All Photos")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("Recents")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("Camera Roll")))
      {
        if (v28 == 1613)
          goto LABEL_77;
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("User Album")))
      {
        if (v28 == 2)
          goto LABEL_77;
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("Faces")))
        {
          if (v28 == 4001 || objc_msgSend(v27, "kindValue") == 15)
            goto LABEL_77;
          goto LABEL_23;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("Events")))
        {
          if (v28 == 4002 || objc_msgSend(v27, "kindValue") == 12)
          {
LABEL_77:
            v31 = v27;

            if (v31)
              goto LABEL_88;
            goto LABEL_78;
          }
          goto LABEL_23;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("Live Photos")))
        {
          if (v28 == 1621)
            goto LABEL_77;
        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Depth")))
          {
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Videos")))
            {
              if (v28 == 1606)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Animated")))
            {
              if (v28 == 1622)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Panoramas")))
            {
              if (v28 == 1605)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Long Exposure")))
            {
              if (v28 == 1623)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Time-lapse")))
            {
              if (v28 == 1610)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("Slo-mo")))
            {
              if (v28 == 1615)
                goto LABEL_77;
              goto LABEL_23;
            }
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Portrait")))
            {
              if (objc_msgSend(v6, "isEqualToString:", CFSTR("Screenshots")))
              {
                if (v28 == 1618)
                  goto LABEL_77;
              }
              else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Unable to Upload")))
              {
                if (v28 == 1624)
                  goto LABEL_77;
              }
              else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Bursts")))
              {
                if (v28 == 1614)
                  goto LABEL_77;
              }
              else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Duplicates")))
              {
                if (v28 == 1634)
                  goto LABEL_77;
              }
              else
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
                v47 = objc_msgSend(v6, "isEqualToString:", v29);

                if ((v47 & 1) != 0)
                  goto LABEL_77;
              }
              goto LABEL_23;
            }
          }
          if (v28 == 1620)
            goto LABEL_77;
        }
      }
LABEL_23:
      if (v24 == (id)++v26)
      {
        v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        v24 = v30;
        if (v30)
          goto LABEL_16;
        break;
      }
    }
  }

LABEL_78:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "albumListForContentMode:", 1));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v48 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "albums"));
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v57;
    v46 = v4;
LABEL_80:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v37)
        objc_enumerationMutation(v34);
      v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "title"));
      v41 = objc_msgSend(v6, "isEqualToString:", v40);

      if ((v41 & 1) != 0)
        break;
      if (v36 == (id)++v38)
      {
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        v4 = v46;
        if (v36)
          goto LABEL_80;
        goto LABEL_86;
      }
    }
    v31 = v39;

    v4 = v46;
    if (!v31)
      goto LABEL_89;
LABEL_88:
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](v49, "_tabbedLibraryViewController"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000363FC;
    v52[3] = &unk_10006C218;
    v55 = v4;
    v53 = v6;
    v54 = v49;
    objc_msgSend(v43, "navigateToAlbum:animated:completion:", v31, 1, v52);

  }
  else
  {
LABEL_86:

LABEL_89:
    v44 = PLPPTGetLog(v42);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v6;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to navigate to album %@", buf, 0xCu);
    }

    -[PLPhotosApplication failedCurrentTest](v49, "failedCurrentTest");
  }
  v5 = v50;

  v12 = v51;
LABEL_93:

}

- (void)_navigateToMyAlbumListForCurrentTest:(id)a3
{
  -[PLPhotosApplication _navigateToAlbumListGadgetType:completion:](self, "_navigateToAlbumListGadgetType:completion:", 1, a3);
}

- (void)_navigateToSharedAlbumListForCurrentTest:(id)a3
{
  -[PLPhotosApplication _navigateToAlbumListGadgetType:completion:](self, "_navigateToAlbumListGadgetType:completion:", 2, a3);
}

- (void)_navigateToAlbumListGadgetType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036260;
  v7[3] = &unk_10006C268;
  v8 = a4;
  v9 = a3;
  v7[4] = self;
  v6 = v8;
  -[PLPhotosApplication _navigateToAlbumsTabForCurrentTest:](self, "_navigateToAlbumsTabForCurrentTest:", v7);

}

- (void)_navigateToCuratedLibraryTabForCurrentTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithType:revealMode:", 1, 3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036148;
  v7[3] = &unk_10006C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLPhotosApplication _navigateToDestination:completionHandler:](self, "_navigateToDestination:completionHandler:", v5, v7);

}

- (void)_navigateToAlbumsTabForCurrentTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035FFC;
  v7[3] = &unk_10006C290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "navigateToContentMode:animated:completion:", 13, 0, v7);

}

- (void)_navigateToMemoryFeedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)PXProgrammaticNavigationDestination);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("photos://memoryfeed")));
  v7 = objc_msgSend(v5, "initWithURL:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035EEC;
  v9[3] = &unk_10006B4B0;
  v10 = v4;
  v8 = v4;
  -[PLPhotosApplication _navigateToDestination:completionHandler:](self, "_navigateToDestination:completionHandler:", v7, v9);

}

- (void)_navigateToPeopleHomeAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035E7C;
  v9[3] = &unk_10006C2B8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "navigateToPeopleAlbumAnimated:revealPersonWithLocalIdentifier:completion:", v4, 0, v9);

}

- (void)_navigateToForYouForCurrentTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035D30;
  v7[3] = &unk_10006C290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "navigateToContentMode:animated:completion:", 11, 0, v7);

}

- (void)_navigateToSearchTabForCurrentTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035BE0;
  v7[3] = &unk_10006C290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "navigateToContentMode:animated:completion:", 12, 0, v7);

}

- (void)_navigateToPhotosDetailsForCurrentTestAnimated:(BOOL)a3 willTapHandler:(id)a4 willTransitionHandler:(id)a5 didTransitionHandler:(id)a6 completion:(id)a7
{
  Block_layout *v11;
  Block_layout *v12;
  Block_layout *v13;
  Block_layout *v14;
  Block_layout *v15;
  Block_layout *v16;
  Block_layout *v17;
  Block_layout *v18;
  Block_layout *v19;
  Block_layout *v20;
  Block_layout *v21;
  id v22;
  Block_layout *v23;
  Block_layout *v24;
  Block_layout *v25;
  _QWORD *v26;
  dispatch_time_t v27;
  _QWORD *v28;
  Block_layout *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  PLPhotosApplication *v33;
  Block_layout *v34;
  id v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  Block_layout *v39;
  Block_layout *v40;
  Block_layout *v41;
  BOOL v42;

  if (a4)
    v11 = (Block_layout *)a4;
  else
    v11 = &stru_10006C2D8;
  v12 = (Block_layout *)a7;
  v13 = (Block_layout *)a6;
  v14 = (Block_layout *)a5;
  v15 = objc_retainBlock(v11);
  if (v14)
    v16 = v14;
  else
    v16 = &stru_10006C2F8;
  v17 = objc_retainBlock(v16);

  if (v13)
    v18 = v13;
  else
    v18 = &stru_10006C318;
  v19 = objc_retainBlock(v18);

  if (v12)
    v20 = v12;
  else
    v20 = &stru_10006C358;
  v21 = objc_retainBlock(v20);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100035414;
  v37[3] = &unk_10006C3A8;
  v42 = a3;
  v37[4] = self;
  v39 = v17;
  v40 = v19;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v38 = v22;
  v41 = v21;
  v23 = v21;
  v24 = v19;
  v25 = v17;
  v26 = objc_retainBlock(v37);
  v27 = dispatch_time(0, 2000000000);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10003564C;
  v31[3] = &unk_10006C448;
  v32 = v22;
  v33 = self;
  v34 = v15;
  v35 = v26;
  v36 = a3;
  v28 = v26;
  v29 = v15;
  v30 = v22;
  dispatch_after(v27, (dispatch_queue_t)&_dispatch_main_q, v31);

}

- (void)_navigateToIncomingCMMInvitationForCurrentTest:(id)a3
{
  -[PLPhotosApplication _navigateToIncomingCMMInvitationForCurrentTest:selecting:](self, "_navigateToIncomingCMMInvitationForCurrentTest:selecting:", a3, 0);
}

- (void)_navigateToIncomingCMMInvitationForCurrentTest:(id)a3 selecting:(BOOL)a4
{
  id v4;
  _QWORD v5[4];
  PLPhotosApplication *v6;
  id v7;
  BOOL v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003527C;
  v5[3] = &unk_10006C498;
  v8 = a4;
  v6 = self;
  v7 = a3;
  v4 = v7;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](v6, "_navigateToForYouForCurrentTest:", v5);

}

- (void)_navigateToOutgoingCMMInvitationForCurrentTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PLPhotosApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035124;
  v4[3] = &unk_10006C4C0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](v5, "_navigateToForYouForCurrentTest:", v4);

}

- (void)_navigateToLatestMemoryInForYouWithWillPresentHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035118;
  v8[3] = &unk_10006C4E8;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](self, "_navigateToForYouForCurrentTest:", v8);

}

- (void)_navigateToStoryPlayerWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a4;
  v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", a3, &v15));
  v8 = v15;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100035108;
  v12[3] = &unk_10006B528;
  v13 = v8;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "presentViewController:animated:completion:", v7, 0, v12);

}

- (void)_dismissStoryPlayer:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000350F8;
  v8[3] = &unk_10006D4D0;
  v9 = a5;
  v7 = v9;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", v5, v8);

}

- (void)_navigateToStoryFeedWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXStoryUIFactory feedViewControllerWithConfiguration:](PXStoryUIFactory, "feedViewControllerWithConfiguration:", a3));
  objc_msgSend(v7, "setModalPresentationStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000350E8;
  v11[3] = &unk_10006B528;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 0, v11);

}

- (void)_dismissStoryFeed:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000350D8;
  v6[3] = &unk_10006D4D0;
  v7 = a4;
  v5 = v7;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 0, v6);

}

- (void)runRequestOriginalTest:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v4, "setVersion:", 2);
  objc_msgSend(v4, "setDeliveryMode:", 1);
  objc_msgSend(v4, "setResizeMode:", 0);
  objc_msgSend(v4, "setNetworkAccessAllowed:", 1);
  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 0, v4, PHImageManagerMaximumSize.width, PHImageManagerMaximumSize.height);

}

- (void)runRequestFullscreenTest:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v15, "setDeliveryMode:", 0);
  objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v15, "setAllowSecondaryDegradedImage:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v10 = objc_msgSend(v9, "scale");
  v12 = PXSizeScale(v10, v6, v8, v11);
  v14 = v13;

  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 0, v15, v12, v14);
}

- (void)runRequestGridSizeTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  Class *v9;
  id v10;
  id v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;

  v27 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v27, "setDeliveryMode:", 0);
  objc_msgSend(v27, "setNetworkAccessAllowed:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windows"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (Class *)PUPhotosGridViewControllerPadSpec_ptr;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v9 = (Class *)PUPhotosGridViewControllerPhoneSpec_ptr;
  v10 = objc_alloc_init(*v9);
  v11 = objc_alloc_init((Class)PUSectionedGridLayout);
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v28);
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v10, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:", v11, Width, v13, v14, v15, v16);
  objc_msgSend(v11, "itemSize");
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  v22 = objc_msgSend(v21, "scale");
  v24 = PXSizeScale(v22, v18, v20, v23);
  v26 = v25;

  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 1, v27, v24, v26);
}

- (void)_runRequestImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 options:(id)a5
{
  double height;
  double width;
  void *v7;
  unsigned int v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  double Center;
  double v35;
  double v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *context;
  _QWORD v60[5];
  id v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD v65[4];
  id v66;
  PLPhotosApplication *v67;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  SEL v75;
  double v76;
  double v77;
  double v78;
  int64_t v79;
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[4];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  void *v94;
  _QWORD v95[3];
  UTType *v96;

  height = a3.height;
  width = a3.width;
  v49 = a5;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestOptions](self, "currentTestOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("speed")));
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("fast"));

  if (v8)
    v9 = 0.0;
  else
    v9 = 1.0;
  v10 = 10;
  if (v8)
    v10 = 200;
  v56 = v10;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("imageType")));
  if (objc_msgSend(v50, "isEqualToString:", CFSTR("jpeg")))
  {
    v96 = UTTypeJPEG;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
  }
  else if (objc_msgSend(v50, "isEqualToString:", CFSTR("heif")))
  {
    v95[0] = UTTypeHEIC;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", CFSTR("public.avci")));
    v95[1] = v11;
    v95[2] = UTTypeHEIF;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 3));

  }
  else
  {
    if ((objc_msgSend(v50, "isEqualToString:", CFSTR("*")) & 1) == 0)
    {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Invalid image type:%@"), v50);
      goto LABEL_40;
    }
    v57 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "librarySpecificFetchOptions"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0));
  v94 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
  objc_msgSend(v52, "setInternalSortDescriptors:", v14);

  objc_msgSend(v52, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v52, "setIncludeAssetSourceTypes:", 1);
  objc_msgSend(v52, "setIncludeHiddenAssets:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithMediaType:options:](PHAsset, "fetchAssetsWithMediaType:options:", 1, v52));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v15;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v89;
LABEL_14:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v89 != v54)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v16);
      context = objc_autoreleasePoolPush();
      if (v57)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset originalUniformTypeIdentifierForAsset:](PHAsset, "originalUniformTypeIdentifierForAsset:", v17));
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v19 = v57;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v85;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v85 != v21)
                objc_enumerationMutation(v19);
              if (v18)
              {
                v23 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v18));
                LOBYTE(v23) = objc_msgSend(v24, "isEqual:", v23);

                if ((v23 & 1) != 0)
                {

                  goto LABEL_29;
                }
              }
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
            if (v20)
              continue;
            break;
          }
        }

      }
      else
      {
LABEL_29:
        objc_msgSend(v58, "addObject:", v17);
      }
      v25 = (unint64_t)objc_msgSend(v58, "count") < v56;
      objc_autoreleasePoolPop(context);
      if (!v25)
        break;
      if ((id)++v16 == v55)
      {
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
        if (v55)
          goto LABEL_14;
        break;
      }
    }
  }

  if ((unint64_t)objc_msgSend(v58, "count") >= v56)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("preview")));
    v29 = objc_msgSend(v28, "isEqual:", CFSTR("true"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "windows"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));

      v33 = objc_alloc((Class)UIImageView);
      Center = PXRectGetCenter(objc_msgSend(v32, "bounds"));
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "screen"));
      v38 = objc_msgSend(v37, "scale");
      v40 = PXSizeScale(v38, width, height, 1.0 / v39);
      PXRectWithCenterAndSize(Center, v36, v40, v41);
      v42 = objc_msgSend(v33, "initWithFrame:");

      objc_msgSend(v42, "setContentMode:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
      objc_msgSend(v42, "setBackgroundColor:", v43);

      objc_msgSend(v32, "addSubview:", v42);
    }
    else
    {
      v42 = 0;
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x2020000000;
    v83[3] = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x2020000000;
    v82[3] = 0;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    v81[3] = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    v80[3] = 0;
    +[PXPPTLoadingLatencyMeter startMeasurementsForOutputType:](PXPPTLoadingLatencyMeter, "startMeasurementsForOutputType:", CFSTR("Image"));
    -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100034954;
    v65[3] = &unk_10006C5B0;
    v71 = v83;
    v75 = a2;
    v66 = v58;
    v67 = self;
    v76 = v9;
    v45 = v44;
    v68 = v45;
    v77 = width;
    v78 = height;
    v79 = a4;
    v69 = v49;
    v72 = v82;
    v73 = v81;
    v70 = v42;
    v74 = v80;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100034BE4;
    v60[3] = &unk_10006C5D8;
    v62 = v80;
    v63 = v81;
    v60[4] = self;
    v64 = v82;
    v27 = v70;
    v61 = v27;
    -[PLPhotosApplication ppt_startIterationWithBlock:completion:](self, "ppt_startIterationWithBlock:completion:", v65, v60);

    _Block_object_dispose(v80, 8);
    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v82, 8);
    _Block_object_dispose(v83, 8);

  }
  else
  {
    v26 = objc_msgSend(v58, "count");
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "componentsJoinedByString:", CFSTR(", ")));
    -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Need %lu but only found %lu assets of specified types:[%@]"), v56, v26, v27);
  }

LABEL_40:
}

- (void)runHyperionInitialSyncTest:(id)a3
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[5];

  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  -[PLPhotosApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("createMaster"), v4);

  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034030;
  block[3] = &unk_10006D620;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)runHyperionSoftResetSyncTest:(id)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest", a3);
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033F9C;
  block[3] = &unk_10006D620;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)runHyperionHardResetSyncTest:(id)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest", a3);
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033F08;
  block[3] = &unk_10006D620;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)runImagePicker:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sourceType")));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SavedPhotosAlbum")) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    objc_msgSend(v4, "isEqualToString:", CFSTR("PhotoLibrary"));
    v5 = 0;
  }
  if (+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", v5))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100033CE8;
    v6[3] = &unk_10006C6A8;
    v6[4] = self;
    v6[5] = v5;
    -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](self, "_navigateToMyAlbumListForCurrentTest:", v6);
  }
  else
  {
    -[PLPhotosApplication failedCurrentTest](self, "failedCurrentTest");
  }

}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  BOOL v20;
  id location;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000300A0;
  v26 = sub_1000300B0;
  v27 = 0;
  objc_initWeak(&location, v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033C58;
  v16[3] = &unk_10006C6D0;
  v18 = &v22;
  v20 = a5;
  objc_copyWeak(&v19, &location);
  v13 = v11;
  v17 = v13;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, v12, v16));
  v15 = (void *)v23[5];
  v23[5] = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

}

- (void)runLoadPeopleHomeTest:(id)a3
{
  -[PLPhotosApplication _runLoadPeopleHome:withOptions:](self, "_runLoadPeopleHome:withOptions:", 0, a3);
}

- (void)runLoadPeopleHomeAlphaSortedTest:(id)a3
{
  -[PLPhotosApplication _runLoadPeopleHome:withOptions:](self, "_runLoadPeopleHome:withOptions:", 1, a3);
}

- (void)_runLoadPeopleHome:(unint64_t)a3 withOptions:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "px_localDefaults"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v7, "setNumber:forKey:", v8, PXPeopleHomeSortingTypeKey);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100033B8C;
  v9[3] = &unk_10006C6F8;
  v9[4] = self;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v9);

}

- (void)runLoadPeopleBootstrapTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000338AC;
  v3[3] = &unk_10006C6F8;
  v3[4] = self;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 1, v3);
}

- (void)runLoadPeopleDetailTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003379C;
  v3[3] = &unk_10006C6F8;
  v3[4] = self;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v3);
}

- (void)runMergePeopleTest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003355C;
  v5[3] = &unk_10006C760;
  objc_copyWeak(&v6, &location);
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)runCommitPeopleBootstrapTest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033114;
  v5[3] = &unk_10006C760;
  objc_copyWeak(&v6, &location);
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)runNamePeoplePersonTest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032F60;
  v5[3] = &unk_10006C760;
  objc_copyWeak(&v6, &location);
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)runFavoritePeopleTest:(id)a3
{
  -[PLPhotosApplication _runPersonTypeChangeTestToType:withOptions:](self, "_runPersonTypeChangeTestToType:withOptions:", 1, a3);
}

- (void)runUnfavoritePeopleTest:(id)a3
{
  -[PLPhotosApplication _runPersonTypeChangeTestToType:withOptions:](self, "_runPersonTypeChangeTestToType:withOptions:", 0, a3);
}

- (void)_runPersonTypeChangeTestToType:(int64_t)a3 withOptions:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  _QWORD v11[4];
  id v12[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032AD8;
  v11[3] = &unk_10006C7D8;
  v12[1] = (id)a3;
  objc_copyWeak(v12, &location);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100032BA0;
  v8[3] = &unk_10006C850;
  v10[1] = (id)a3;
  v7 = objc_retainBlock(v11);
  v9 = v7;
  objc_copyWeak(v10, &location);
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v8);
  objc_destroyWeak(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

- (void)runAlphaSortPeopleTest:(id)a3
{
  -[PLPhotosApplication _runSortingPeopleHomeTestToType:withOptions:](self, "_runSortingPeopleHomeTestToType:withOptions:", 1, a3);
}

- (void)runCustomSortPeopleTest:(id)a3
{
  -[PLPhotosApplication _runSortingPeopleHomeTestToType:withOptions:](self, "_runSortingPeopleHomeTestToType:withOptions:", 0, a3);
}

- (void)_runSortingPeopleHomeTestToType:(unint64_t)a3 withOptions:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000329C4;
  v4[3] = &unk_10006C878;
  v4[4] = self;
  v4[5] = a3;
  -[PLPhotosApplication _navigateToPeopleHomeAnimated:withCompletion:](self, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v4);
}

- (void)runPerformSearchPlainText:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003289C;
  v3[3] = &unk_10006C8F0;
  v3[4] = self;
  -[PLPhotosApplication _navigateToSearchTabForCurrentTest:](self, "_navigateToSearchTabForCurrentTest:", v3);
}

- (void)runShowSearchHomeTest:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003288C;
  v7[3] = &unk_10006C8A0;
  v7[4] = self;
  -[PLPhotosApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPT_SearchHomeViewDidLoad"), 1, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032894;
  v6[3] = &unk_10006C8A0;
  v6[4] = self;
  -[PLPhotosApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, CFSTR("PPT_SearchHomeViewDidAppear"), 1, v6);

  -[PLPhotosApplication _navigateToSearchTabForCurrentTest:](self, "_navigateToSearchTabForCurrentTest:", 0);
}

- (void)runLoadSearchZeroKeywordsTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100032548;
  v3[3] = &unk_10006C8F0;
  v3[4] = self;
  -[PLPhotosApplication _navigateToSearchTabForCurrentTest:](self, "_navigateToSearchTabForCurrentTest:", v3);
}

- (void)runLaunchAssetPickerTest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000321CC;
  v5[3] = &unk_10006C940;
  objc_copyWeak(&v6, &location);
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)runScrollAssetPickerTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)PHPickerConfiguration);
  v6 = objc_msgSend(objc_alloc((Class)PUPickerCoordinator), "initWithPHConfiguration:coordinatorActionHandler:loadingStatusManager:", v5, 0, 0);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031F0C;
  v9[3] = &unk_10006C990;
  v7 = v6;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v11 = v8;
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)runScrollAssetPickerAlbumsTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)PHPickerConfiguration);
  v6 = objc_msgSend(objc_alloc((Class)PUPickerCoordinator), "initWithPHConfiguration:coordinatorActionHandler:loadingStatusManager:", v5, 0, 0);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031BA4;
  v9[3] = &unk_10006C990;
  v7 = v6;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v11 = v8;
  -[PLPhotosApplication _navigateToCuratedLibraryTabForCurrentTest:](self, "_navigateToCuratedLibraryTabForCurrentTest:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)runPerformAssetPickerPlainTextSearch:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)PHPickerConfiguration);
  v6 = objc_msgSend(objc_alloc((Class)PUPickerCoordinator), "initWithPHConfiguration:coordinatorActionHandler:loadingStatusManager:", v5, 0, 0);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000318E8;
  v8[3] = &unk_10006CA08;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[PLPhotosApplication _navigateToAlbumsTabForCurrentTest:](self, "_navigateToAlbumsTabForCurrentTest:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)launchUIImagePickerControllerWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[PLPhotosApplication _launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:](self, "_launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:", v4, 0, v6);

}

- (void)launchUIImagePickerControllerWithSavedPhotosAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[PLPhotosApplication _launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:](self, "_launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:", v4, 2, v6);

}

- (void)_launchUIImagePickerControllerWithOptions:(id)a3 sourceType:(int64_t)a4 mediaTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031760;
  v11[3] = &unk_10006CA58;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a4;
  v10 = v9;
  v12 = v10;
  -[PLPhotosApplication _navigateToMyAlbumListForCurrentTest:](self, "_navigateToMyAlbumListForCurrentTest:", v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)runAutoLoopGenerationTest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PLPhotosApplication *v19;
  _QWORD v20[4];
  id v21;
  PLPhotosApplication *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iterations")));
  v5 = objc_msgSend(v4, "integerValue");

  if (-[PLPhotosApplication _purgeVariationsCaches](self, "_purgeVariationsCaches"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "librarySpecificFetchOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 2, 213, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "librarySpecificFetchOptions"));

    v26 = PHAssetPropertySetOriginalMetadata;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v10, "setFetchPropertySets:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v12, v10));

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100031294;
    v23[3] = &unk_10006CA80;
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = v14;
    v25 = v5;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);
    v15 = objc_msgSend(v14, "copy");
    v16 = objc_msgSend(v15, "mutableCopy");
    if (objc_msgSend(v16, "count") >= v5)
    {
      -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100031308;
      v20[3] = &unk_10006CAF8;
      v21 = v16;
      v22 = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100031418;
      v17[3] = &unk_10006D648;
      v18 = v15;
      v19 = self;
      -[PLPhotosApplication ppt_startIterationWithBlock:completion:](self, "ppt_startIterationWithBlock:completion:", v20, v17);

    }
    else
    {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", CFSTR("Library only contains %lu live photos that can be converted to autoloops, need %ld."), objc_msgSend(v16, "count"), v5);
    }

  }
}

- (void)_convertAsset:(id)a3 toVariationType:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerWithAsset:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
  v19[0] = objc_msgSend(v9, "identifier");
  v19[1] = 0;
  v19[2] = 0;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXIndexPathSet indexPathSetWithIndexPath:](PXIndexPathSet, "indexPathSetWithIndexPath:", v19));
  v11 = objc_msgSend(objc_alloc((Class)PXSectionedSelectionManager), "initWithDataSourceManager:", v8);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100031288;
  v17[3] = &unk_10006CB20;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "performChanges:", v17);
  v13 = objc_msgSend(objc_alloc((Class)PXPhotoKitAssetActionManager), "initWithSelectionManager:", v11);
  v14 = PXAssetActionTypeForSelectingAssetVariationType(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionPerformerForActionType:", v15));

  objc_msgSend(v16, "performActionWithCompletionHandler:", v7);
}

- (void)runTungstenRenderTextTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)PXGPPTTextRenderingTester);
  +[PXPPTLoadingLatencyMeter startMeasurementsForOutputType:](PXPPTLoadingLatencyMeter, "startMeasurementsForOutputType:", CFSTR("Texture"));
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003121C;
  v8[3] = &unk_10006D648;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[PXPPTLoadingLatencyMeter sharedInstance](PXPPTLoadingLatencyMeter, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003125C;
  v7[3] = &unk_10006CB48;
  v6 = v9;
  objc_msgSend(v5, "runRenderTextTestWithOptions:latencyMeter:completionHandler:failureHandler:", v4, v6, v8, v7);

}

- (void)runTungstenGridLayoutGenerationTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)PXGPPTLayoutTester);
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031074;
  v8[3] = &unk_10006CB70;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "runGridLayoutTestWithOptions:completionHandler:", v4, v8);

  -[PLPhotosApplication finishedCurrentTestWithExtraResults:](self, "finishedCurrentTestWithExtraResults:", v7);
}

- (void)runTungstenEditorialLayoutGenerationTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)PXGPPTLayoutTester);
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030ECC;
  v8[3] = &unk_10006CB70;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "runEditorialLayoutTestWithOptions:completionHandler:", v4, v8);

  -[PLPhotosApplication finishedCurrentTestWithExtraResults:](self, "finishedCurrentTestWithExtraResults:", v7);
}

- (void)runTungstenAnimationTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  PLPhotosApplication *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  PLPhotosApplication *v33;
  id v34;
  id v35;
  uint64_t v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfSprites")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_integerValues"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("animationDuration")));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));
  v11 = objc_msgSend(v10, "integerValue");

  v12 = objc_alloc_init((Class)PXGPPTAnimationLayout);
  v13 = objc_msgSend(objc_alloc((Class)PXGPPTViewController), "initWithLayout:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100030928;
  v31[3] = &unk_10006CBC0;
  v15 = v12;
  v32 = v15;
  v33 = self;
  v34 = v14;
  v16 = v13;
  v35 = v16;
  v36 = v9;
  v17 = v14;
  v18 = objc_retainBlock(v31);
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100030A40;
  v24[3] = &unk_10006CC60;
  v25 = v6;
  v26 = v15;
  v29 = v18;
  v30 = v11;
  v27 = v16;
  v28 = self;
  v20 = v16;
  v21 = v18;
  v22 = v15;
  v23 = v6;
  objc_msgSend(v19, "presentViewController:animated:completion:", v20, 1, v24);

}

- (void)runTungstenScrollingTest:(id)a3
{
  id v4;
  _UNKNOWN **v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _UNKNOWN **v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  PLPhotosApplication *v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v4 = a3;
  v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[PXGPPTSettings scrollingPresetNames](PXGPPTSettings, "scrollingPresetNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preset")));
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("<currentSettings>"));

  if (v7)
  {

    v5 = &off_100071CE8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PXGPPTSettings sharedInstance](PXGPPTSettings, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v12 = objc_msgSend(v5, "count");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100030490;
  v21[3] = &unk_10006CD28;
  v29 = v7;
  v22 = v5;
  v23 = v8;
  v24 = v9;
  v25 = self;
  v26 = v11;
  v27 = v4;
  v28 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000305FC;
  v19[3] = &unk_10006D648;
  v19[4] = self;
  v20 = v28;
  v13 = v28;
  v14 = v4;
  v15 = v11;
  v16 = v9;
  v17 = v8;
  v18 = v5;
  PXIterateAsynchronously(v12, v21, v19);

}

- (void)runTungstenVideoPlaybackAndScrollingTest:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t i;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned __int8 v34;
  BOOL v35;
  _QWORD v36[4];
  NSObject *v37;
  void ***v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  v3 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v4 = (void *)qword_10007C140;
  v48 = qword_10007C140;
  if (!qword_10007C140)
  {
    v39 = _NSConcreteStackBlock;
    v40 = 3221225472;
    v41 = (uint64_t)sub_10002FF08;
    v42 = (uint64_t (*)(uint64_t, uint64_t))&unk_10006D288;
    v43 = (void (*)(uint64_t))&v45;
    sub_10002FF08((uint64_t)&v39);
    v4 = (void *)v46[3];
  }
  v26 = v3;
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v45, 8);
  v6 = objc_alloc_init(v5);
  v28 = objc_alloc_init((Class)NSMutableDictionary);
  for (i = 0; i != 5; ++i)
  {
    v8 = dispatch_semaphore_create(0);
    v39 = 0;
    v40 = (uint64_t)&v39;
    v41 = 0x3032000000;
    v42 = sub_1000300A0;
    v43 = sub_1000300B0;
    v44 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000300B8;
    v36[3] = &unk_10006CD50;
    v38 = &v39;
    v11 = v8;
    v37 = v11;
    objc_msgSend(v6, "generateVideoWithFileNameSuffix:completionHandler:", v10, v36);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (*(_QWORD *)(v40 + 40))
    {
      v12 = objc_alloc((Class)PXFileBackedAssetDescription);
      v13 = objc_msgSend(v12, "initWithURL:", *(_QWORD *)(v40 + 40));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_100071A28, CFSTR("mediaType"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_100071A70, CFSTR("playbackStyle"));
      if (v13)
      {
        v49 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, v15);

      }
    }

    _Block_object_dispose(&v39, 8);
  }
  v16 = objc_msgSend(objc_alloc((Class)PXFileBackedAssetsDataSource), "initWithFileBackedAssetDescriptionsBySection:", v28);
  v17 = objc_msgSend(objc_alloc((Class)PXGPPTVideoPlaybackViewController), "initWithAssetsDataSource:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance"));
  v20 = objc_msgSend(v19, "enableInlinePlayback");
  v21 = objc_msgSend(v19, "maxNumberOfPlayingItems") != 0;
  objc_msgSend(v19, "setEnableInlinePlayback:", 1);
  objc_msgSend(v19, "setMaxNumberOfPlayingItems:", 0x7FFFFFFFFFFFFFFFLL);
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002FFCC;
  v29[3] = &unk_10006CDC8;
  v29[4] = self;
  v30 = v26;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v35 = v21;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v26;
  objc_msgSend(v23, "presentViewController:animated:completion:", v24, 1, v29);

}

- (void)runInteractiveMemoryScrubbingTest:(id)a3
{
  -[PLPhotosApplication _runStoryPlayerTest:usingBlock:](self, "_runStoryPlayerTest:usingBlock:", a3, &stru_10006CE08);
}

- (void)runInteractiveMemoryScrollingTest:(id)a3
{
  -[PLPhotosApplication _runStoryPlayerTest:usingBlock:](self, "_runStoryPlayerTest:usingBlock:", a3, &stru_10006CE28);
}

- (void)runInteractiveMemoryPlaybackStartTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLPhotosApplication *v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)PXStoryPPTPerformer), "initWithDelegate:testOptions:", self, v4);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FE04;
  v7[3] = &unk_10006CE78;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PLPhotosApplication _navigateToLatestMemoryInForYouWithWillPresentHandler:completionHandler:](self, "_navigateToLatestMemoryInForYouWithWillPresentHandler:completionHandler:", v7, 0);

}

- (void)runInteractiveMemoryPlaybackTest:(id)a3
{
  -[PLPhotosApplication _runStoryPlayerTest:usingBlock:](self, "_runStoryPlayerTest:usingBlock:", a3, &stru_10006CE98);
}

- (void)runTransitionToFullscreenInteractiveMemoryTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  __CFString *v12;
  id v13;
  __CFString *v14;
  __CFString *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication currentTestName](self, "currentTestName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations")));

  v7 = objc_msgSend(v6, "integerValue");
  -[PLPhotosApplication startedTest:](self, "startedTest:", v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F9EC;
  v11[3] = &unk_10006CF60;
  v11[4] = self;
  v12 = CFSTR("Transition");
  v13 = v5;
  v14 = CFSTR("Presentation");
  v15 = CFSTR("Dismissal");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002FB2C;
  v9[3] = &unk_10006D648;
  v9[4] = self;
  v10 = v13;
  v8 = v13;
  PXIterateAsynchronously(v7, v11, v9);

}

- (void)runInteractiveMemoryExportTest:(id)a3
{
  -[PLPhotosApplication _runStoryPlayerTest:usingBlock:](self, "_runStoryPlayerTest:usingBlock:", a3, &stru_10006CF80);
}

- (void)runInteractiveMemoryRecipeProductionTest:(id)a3
{
  -[PLPhotosApplication _runHeadlessStoryTest:usingBlock:](self, "_runHeadlessStoryTest:usingBlock:", a3, &stru_10006CFC0);
}

- (void)runInteractiveMemoryTimelineProductionTest:(id)a3
{
  -[PLPhotosApplication _runHeadlessStoryTest:usingBlock:](self, "_runHeadlessStoryTest:usingBlock:", a3, &stru_10006CFE0);
}

- (void)_runStoryPlayerTest:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)PXStoryPPTPerformer), "initWithDelegate:testOptions:", self, v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F784;
  v11[3] = &unk_10006D058;
  v12 = v8;
  v13 = v6;
  v11[4] = self;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v9, "enumerateStoryConfigurationsUsingBlock:completion:", v11, 0);

}

- (void)_runHeadlessStoryTest:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)PXStoryPPTPerformer), "initWithDelegate:testOptions:", self, v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F684;
  v11[3] = &unk_10006D0A8;
  v12 = v8;
  v13 = v6;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v9, "enumerateStoryConfigurationsUsingBlock:completion:", v11, 0);

}

- (void)runInteractiveMemoryFeedScrollingTest:(id)a3
{
  -[PLPhotosApplication _runStoryFeedTest:usingBlock:](self, "_runStoryFeedTest:usingBlock:", a3, &stru_10006D0E8);
}

- (void)_runStoryFeedTest:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)PXStoryPPTPerformer), "initWithDelegate:testOptions:", self, v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F424;
  v11[3] = &unk_10006D138;
  v12 = v8;
  v13 = v6;
  v11[4] = self;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v9, "enumerateFeedConfigurationsUsingBlock:completion:", v11, 0);

}

- (void)runAssetViewScrubbingTest:(id)a3
{
  -[PLPhotosApplication _runAssetViewTest:usingBlock:](self, "_runAssetViewTest:usingBlock:", a3, &stru_10006D178);
}

- (void)runAssetViewLocalizedTitleTest:(id)a3
{
  -[PLPhotosApplication _runAssetViewTest:usingBlock:](self, "_runAssetViewTest:usingBlock:", a3, &stru_10006D198);
}

- (void)_runAssetViewTest:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PLPhotosApplication *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UIViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setModalPresentationStyle:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXDisplayAssetViewPPTConfiguration defaultConfigurations](PXDisplayAssetViewPPTConfiguration, "defaultConfigurations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication rootViewController](self, "rootViewController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002F284;
  v17[3] = &unk_10006D1E8;
  v18 = v8;
  v19 = self;
  v21 = v11;
  v22 = v7;
  v20 = v6;
  v13 = v11;
  v14 = v7;
  v15 = v6;
  v16 = v8;
  objc_msgSend(v12, "presentViewController:animated:completion:", v16, 1, v17);

}

- (void)_runImportTestCommonInit:(id)a3 navigateToImportTab:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ImportWaitForAllAssets")));

  LODWORD(v9) = objc_msgSend(v11, "BOOLValue");
  v12 = &PUImportPPTDriverReplyWhenAllContentIsReadyKey;
  if (!(_DWORD)v9)
    v12 = &PUImportPPTDriverReplyWhenAnyContentIsReadyKey;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *v12);
  if (v5)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PUImportPPTDriverNavigateToImportTabKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PUImportPPTDriver sharedInstance](PUImportPPTDriver, "sharedInstance"));
  objc_msgSend(v13, "setTestOptions:", v10);
  if (-[PLPhotosApplication conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___PXImportViewControllerProvider))objc_msgSend(v13, "setImportViewControllerProvider:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotosApplication _tabbedLibraryViewController](self, "_tabbedLibraryViewController"));
  objc_msgSend(v13, "setTabbedLibraryViewController:", v14);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002F250;
  v17[3] = &unk_10006D210;
  v18 = v13;
  v19 = v8;
  v17[4] = self;
  v15 = v13;
  v16 = v8;
  objc_msgSend(v15, "ppt_insertImportDataSourceWithOptions:completionHandler:", v10, v17);

}

- (void)runImportGridScrollLoadingAssetsTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F140;
  v6[3] = &unk_10006D238;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLPhotosApplication _runImportTestCommonInit:navigateToImportTab:completionHandler:](self, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v5, 1, v6);

}

- (void)runImportGridContentLoadingTest:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F0E0;
  v5[3] = &unk_10006D260;
  v5[4] = self;
  -[PLPhotosApplication _runImportTestCommonInit:navigateToImportTab:completionHandler:](self, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v4, 1, v5);

}

- (void)runImportGridDeleteAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLPhotosApplication *v8;

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F058;
  v6[3] = &unk_10006D238;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PLPhotosApplication _runImportTestCommonInit:navigateToImportTab:completionHandler:](self, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v5, 1, v6);

}

- (void)runImportGridImportAssetsToLibrary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLPhotosApplication *v8;

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002EFD0;
  v6[3] = &unk_10006D238;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PLPhotosApplication _runImportTestCommonInit:navigateToImportTab:completionHandler:](self, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v5, 1, v6);

}

- (void)runImportGridThumbnailTests:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLPhotosApplication *v8;

  v4 = a3;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002EF48;
  v6[3] = &unk_10006D238;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PLPhotosApplication _runImportTestCommonInit:navigateToImportTab:completionHandler:](self, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v5, 1, v6);

}

- (void)runImportCycleImportSource:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[PLPhotosApplication startedCurrentTest](self, "startedCurrentTest");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10002EC48;
  v19 = sub_10002EC70;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002EC78;
  v14[3] = &unk_10006D2B0;
  v14[5] = &v15;
  v14[6] = 20;
  v14[4] = self;
  v5 = objc_retainBlock(v14);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002ED34;
  v10[3] = &unk_10006D328;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v21;
  v8 = objc_retainBlock(v10);
  v9 = (void *)v16[5];
  v16[5] = (uint64_t)v8;

  ((void (*)(_QWORD *, uint64_t, uint64_t))v7[2])(v7, 1, v22[3]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)runCMMInvitationsScrollTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002E8CC;
  v13[3] = &unk_10006D648;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"));
  v15 = objc_msgSend(v14, "copy");
  v5 = v15;
  v6 = v14;
  v7 = objc_retainBlock(v13);
  objc_msgSend(v6, "setInvitationsDataSourceType:", 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002E8D8;
  v10[3] = &unk_10006D3C8;
  v10[4] = self;
  v11 = v4;
  v12 = v7;
  v8 = v7;
  v9 = v4;
  -[PLPhotosApplication _navigateToForYouForCurrentTest:](self, "_navigateToForYouForCurrentTest:", v10);

}

- (void)runPrepareForSharingTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002E6D0;
  v3[3] = &unk_10006C0B0;
  v3[4] = self;
  -[PLPhotosApplication _navigateToAlbumForCurrentTest:](self, "_navigateToAlbumForCurrentTest:", v3);
}

@end
