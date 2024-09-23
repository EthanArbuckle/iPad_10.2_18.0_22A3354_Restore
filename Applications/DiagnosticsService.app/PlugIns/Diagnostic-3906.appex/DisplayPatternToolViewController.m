@implementation DisplayPatternToolViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  id v31;
  TestImage *v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  unsigned int v43;
  id v44;
  void *v45;
  unsigned int v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  void *v53;
  void *v54;
  dispatch_semaphore_t v55;
  void *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  NSObject *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  id v72;

  v6 = a3;
  v57 = a4;
  v53 = v6;
  -[DisplayPatternToolViewController setInputs:](self, "setInputs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "drawColor"));
  -[DisplayViewController setDrawColor:](self, "setDrawColor:", v8);

  -[DisplayViewController setDiagnosticResponder:](self, "setDiagnosticResponder:", v57);
  v55 = dispatch_semaphore_create(0);
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageFileNames"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    *(_QWORD *)&v14 = 138412546;
    v52 = v14;
    while (1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs", v52));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageFileNames"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v15));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "URLByAppendingPathComponent:", v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathExtension"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathExtension:", v24));

      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = sub_100003E30;
      v67 = sub_100003E40;
      v68 = 0;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100003E48;
      v59[3] = &unk_10000C350;
      v16 = v20;
      v60 = v16;
      v62 = &v63;
      v26 = v55;
      v61 = v26;
      objc_msgSend(v57, "getAsset:completion:", v16, v59);
      v17 = (void *)v25;
      dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
      if (v64[5])
      {
        v27 = DiagnosticLogHandleForCategory(3);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v25;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Saving image data to [%@]", buf, 0xCu);
        }

        v29 = (void *)v64[5];
        v58 = 0;
        v30 = objc_msgSend(v29, "writeToURL:options:error:", v25, 268435457, &v58);
        v31 = v58;
        if (v30)
        {
          v32 = objc_opt_new(TestImage);
          -[TestImage setFile:](v32, "setFile:", v25);
          -[TestImage setAssetName:](v32, "setAssetName:", v16);
          objc_msgSend(v54, "setObject:atIndexedSubscript:", v32, v15);

          v33 = 0;
        }
        else
        {
          v36 = DiagnosticLogHandleForCategory(3);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v52;
            v70 = v25;
            v71 = 2112;
            v72 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
          }

          -[DisplayPatternToolViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C7B8);
          v33 = 1;
        }

      }
      else
      {
        v34 = DiagnosticLogHandleForCategory(3);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v70 = (uint64_t)v16;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
        }

        -[DisplayPatternToolViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C7D0);
        v33 = 1;
      }

      _Block_object_dispose(&v63, 8);
      if (v33)
        break;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageFileNames"));
      v40 = objc_msgSend(v39, "count");

      if ((unint64_t)v40 <= ++v15)
        goto LABEL_19;
    }
  }
  else
  {
    v17 = 0;
    v16 = 0;
LABEL_19:
    v41 = objc_msgSend(v54, "copy");
    -[DisplayPatternToolViewController setTestImages:](self, "setTestImages:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    v43 = objc_msgSend(v42, "randomizeImageOrder");

    if (v43)
      -[DisplayPatternToolViewController shuffleImageOrder](self, "shuffleImageOrder");
    -[DisplayPatternToolViewController setCurrentTag:](self, "setCurrentTag:", 1);
    -[DisplayViewController setPage:](self, "setPage:", 0);
    -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 0);
    v44 = objc_alloc_init((Class)NSMutableArray);
    -[DisplayPatternToolViewController setAllResults:](self, "setAllResults:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    v46 = objc_msgSend(v45, "disableAmbientLightAdaptation");

    if (v46)
    {
      v47 = objc_alloc_init((Class)CBClient);
      -[DisplayPatternToolViewController setClient:](self, "setClient:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController client](self, "client"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "blueLightClient"));
      -[DisplayPatternToolViewController setBlueLightClient:](self, "setBlueLightClient:", v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController client](self, "client"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "adaptationClient"));
      -[DisplayPatternToolViewController setAdaptationClient:](self, "setAdaptationClient:", v51);

    }
  }

}

- (BOOL)isGestureEnded:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "state") == (id)3 || objc_msgSend(v3, "state") == (id)4 || objc_msgSend(v3, "state") == (id)5;

  return v4;
}

- (void)start
{
  void *v3;
  void *v4;
  dispatch_queue_attr_t v5;
  dispatch_queue_t v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  v8 = objc_claimAutoreleasedReturnValue(v5);
  v6 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-3906.animatedScrollingQueue", v8);
  -[DisplayViewController setAnimatedScrollingQueue:](self, "setAnimatedScrollingQueue:", v6);

  -[DisplayPatternToolViewController setupView](self, "setupView");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  LODWORD(v4) = objc_msgSend(v7, "disableAmbientLightAdaptation");

  if ((_DWORD)v4)
  {
    -[DisplayPatternToolViewController saveColorAdjustmentStates](self, "saveColorAdjustmentStates");
    -[DisplayPatternToolViewController disableAdaptationAndBlueLightReduction](self, "disableAdaptationAndBlueLightReduction");
  }
  -[DisplayPatternToolViewController addPanGesture](self, "addPanGesture");
  -[DisplayPatternToolViewController addTapGesture](self, "addTapGesture");

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DisplayPatternToolViewController;
  -[DisplayPatternToolViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  -[DisplayPatternToolViewController saveAndMaximizeBrightness](self, "saveAndMaximizeBrightness");
  objc_initWeak(&location, self);
  v4 = objc_claimAutoreleasedReturnValue(-[DisplayViewController animatedScrollingQueue](self, "animatedScrollingQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004144;
  v5[3] = &unk_10000C328;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DisplayPatternToolViewController;
  -[DisplayPatternToolViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)shuffleImageOrder
{
  void *v3;
  char *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v4 = (char *)objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v8 = objc_msgSend(v5, "mutableCopy");

  if (v4)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v6, v6 + arc4random_uniform((uint32_t)v4));
      ++v6;
      --v4;
    }
    while (v4);
  }
  v7 = objc_msgSend(v8, "copy");
  -[DisplayPatternToolViewController setTestImages:](self, "setTestImages:", v7);

}

- (void)setupView
{
  DADrawableView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  DADrawableView *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v3 = [DADrawableView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController drawColor](self, "drawColor"));
  v15 = -[DADrawableView initWithFrame:rectangleFillColor:rectangleEdgeColor:](v3, "initWithFrame:rectangleFillColor:rectangleEdgeColor:", v13, v14, v6, v8, v10, v12);
  -[DisplayPatternToolViewController setDrawableView:](self, "setDrawableView:", v15);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v19);
        v21 = objc_alloc((Class)UIView);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v22, "bounds");
        v23 = objc_msgSend(v21, "initWithFrame:");
        objc_msgSend(v20, "setDrawingOverlay:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "drawingOverlay"));
        objc_msgSend(v24, "setUserInteractionEnabled:", 1);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v17);
  }

  v46.receiver = self;
  v46.super_class = (Class)DisplayPatternToolViewController;
  -[DisplayViewController setupView](&v46, "setupView");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "panGestureRecognizer"));
  objc_msgSend(v26, "setMinimumNumberOfTouches:", 2);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v27, "frame");
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v31 = objc_msgSend(v30, "count");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v32, "frame");
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v35, "setContentSize:", v29 * (double)((unint64_t)v31 + 1), v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SWIPE_RIGHT_TO_PREVIOUS_SCREEN"), &stru_10000C668, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v38, "setMessage:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10000C668, 0));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v41, "setButtonTitle:", v40);

  objc_initWeak(&location, self);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100004698;
  v43[3] = &unk_10000C328;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v42, "setButtonAction:", v43);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (CGRect)frameForPage:(int)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = (double)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6 * v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;

  v14 = 0.0;
  v15 = v7;
  v16 = v10;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (void)handleViewDidScroll:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs", a3));
  v5 = objc_msgSend(v4, "resetBrightnessOnChange");

  if (v5)
  {
    LODWORD(v6) = 1.0;
    -[DisplayPatternToolViewController animateToBrightness:](self, "animateToBrightness:", v6);
  }
}

- (void)handleViewDidEndDecelerating:(id)a3
{
  signed int v4;
  signed int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = -[DisplayViewController page](self, "page", a3);
  v5 = -[DisplayPatternToolViewController maxNumPages](self, "maxNumPages");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController panGesture](self, "panGesture"));
  v7 = v6;
  if (v4 >= v5)
  {
    objc_msgSend(v6, "setEnabled:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController tapGesture](self, "tapGesture"));
    v10 = v8;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "setEnabled:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController tapGesture](self, "tapGesture"));
    v10 = v8;
    v9 = 1;
  }
  objc_msgSend(v8, "setEnabled:", v9);

}

- (CGRect)frameForConfirmation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  -[DisplayPatternToolViewController frameForPage:](self, "frameForPage:", objc_msgSend(v3, "count"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)labelForConfirmation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DISPLAY_TOOL_COMPLETED"), &stru_10000C668, 0));

  return v3;
}

- (id)imageViewForPage:(int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)UIImageView);
  -[DisplayPatternToolViewController frameForPage:](self, "frameForPage:", v3);
  v6 = objc_msgSend(v5, "initWithFrame:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v8 = (int)v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "file"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v11));
  objc_msgSend(v6, "setImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawingOverlay"));
  objc_msgSend(v6, "addSubview:", v15);

  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  return v6;
}

- (int)maxNumPages
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)didUpdateCurrentImageView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  if (v5)
    objc_msgSend(v5, "insertSubview:atIndex:", v4, 0);
  else
    objc_msgSend(v4, "removeFromSuperview");

}

- (void)addPanGesture
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "panOccurred:");
  -[DisplayPatternToolViewController setPanGesture:](self, "setPanGesture:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v5 = objc_msgSend(v4, "brightnessAdjustable");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController panGesture](self, "panGesture"));
  v7 = v6;
  if (v5)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v6, "setMaximumNumberOfTouches:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController panGesture](self, "panGesture"));
  objc_msgSend(v9, "setMinimumNumberOfTouches:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController panGesture](self, "panGesture"));
  objc_msgSend(v10, "setDelegate:", self);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController panGesture](self, "panGesture"));
  objc_msgSend(v12, "addGestureRecognizer:", v11);

}

- (void)addTapGesture
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapOccurred:");
  -[DisplayPatternToolViewController setTapGesture:](self, "setTapGesture:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController tapGesture](self, "tapGesture"));
  objc_msgSend(v4, "setDelegate:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController tapGesture](self, "tapGesture"));
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (void)panOccurred:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  float Current;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  int v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  int v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;

  v6 = a3;
  if (!-[DisplayViewController isAnimatedScrolling](self, "isAnimatedScrolling"))
  {
    if (objc_msgSend(v6, "state") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
      objc_msgSend(v6, "locationInView:", v7);
      -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
      objc_msgSend(v8, "setScrollEnabled:", 0);

      if (objc_msgSend(v6, "numberOfTouches") == (id)1)
      {
        -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 1);
      }
      else if (objc_msgSend(v6, "numberOfTouches") == (id)2)
      {
        -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));

        if (v9)
          -[DisplayPatternToolViewController cancelTimerForHideBrightnessIndicator](self, "cancelTimerForHideBrightnessIndicator");
        else
          -[DisplayPatternToolViewController drawBrightnessIndicator](self, "drawBrightnessIndicator");
      }
    }
    if (-[DisplayPatternToolViewController isGestureEnded:](self, "isGestureEnded:", v6))
      -[DisplayPatternToolViewController hideBrightnessIndicatorWithDelay](self, "hideBrightnessIndicatorWithDelay");
    if ((id)-[DisplayPatternToolViewController currentPanType](self, "currentPanType") == (id)2)
    {
      if (objc_msgSend(v6, "numberOfTouches") == (id)2)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
        objc_msgSend(v6, "locationInView:", v10);
        v12 = v11;
        v14 = v13;

        v15 = -[DisplayPatternToolViewController originPoint](self, "originPoint");
        v17 = (v16 - v14) / 500.0;
        Current = BKSDisplayBrightnessGetCurrent(v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController diagnosticResponder](self, "diagnosticResponder"));
        *(float *)&v20 = v17 + Current;
        objc_msgSend(v19, "setScreenToBrightness:animate:", 0, v20);

        *(float *)&v21 = Current;
        -[DisplayPatternToolViewController updateBrightnessIndicator:](self, "updateBrightnessIndicator:", v21);
        v22 = DiagnosticLogHandleForCategory(3);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v71 = 134218496;
          v72 = Current;
          v73 = 2048;
          v74 = v17;
          v75 = 2048;
          v76 = v17 + Current;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Setting brightness to (%f + %f) = %f", (uint8_t *)&v71, 0x20u);
        }

        -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:", v12, v14);
        if (-[DisplayPatternToolViewController isGestureEnded:](self, "isGestureEnded:", v6))
        {
          -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
          objc_msgSend(v24, "setScrollEnabled:", 1);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
          objc_msgSend(v6, "velocityInView:", v25);
          v27 = v26;

          HIDWORD(v28) = 1083512832;
          if (v27 > 1350.0)
          {
            LODWORD(v28) = 0;
LABEL_30:
            -[DisplayPatternToolViewController animateToBrightness:](self, "animateToBrightness:", v28);
            goto LABEL_49;
          }
          HIDWORD(v28) = -1063970816;
          if (v27 < -1350.0)
          {
            LODWORD(v28) = 1.0;
            goto LABEL_30;
          }
        }
      }
      else if (-[DisplayPatternToolViewController isGestureEnded:](self, "isGestureEnded:", v6))
      {
        -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
        objc_msgSend(v31, "setScrollEnabled:", 1);

      }
    }
    else if (-[DisplayPatternToolViewController isGestureEnded:](self, "isGestureEnded:", v6))
    {
      -[DisplayPatternToolViewController setCurrentPanType:](self, "setCurrentPanType:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
      objc_msgSend(v29, "setScrollEnabled:", 1);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
      objc_msgSend(v30, "endDrawing");

      -[DisplayPatternToolViewController addedRectangleView](self, "addedRectangleView");
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
      objc_msgSend(v6, "locationInView:", v32);
      v34 = v33;
      v36 = v35;

      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v38 = vabdd_f64(v37, v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
      objc_msgSend(v39, "minimumSquareLength");
      v41 = v40;
      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v43 = v42;
      if (v38 >= v41)
      {
        v47 = 0;
        if (v42 >= v34)
          v45 = v34;
        else
          v45 = v42;
      }
      else
      {
        -[DisplayPatternToolViewController originPoint](self, "originPoint");
        v45 = v44;
        if (v34 >= v43)
        {
          v47 = 0;
        }
        else
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
          objc_msgSend(v3, "minimumSquareLength");
          v45 = v45 - v46;
          v47 = 1;
        }
      }
      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v49 = vabdd_f64(v48, v36);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
      objc_msgSend(v50, "minimumSquareLength");
      v52 = v51;
      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v54 = v53;
      if (v49 >= v52)
      {
        v58 = 0;
        if (v53 >= v36)
          v56 = v36;
        else
          v56 = v53;
      }
      else
      {
        -[DisplayPatternToolViewController originPoint](self, "originPoint");
        v56 = v55;
        if (v36 >= v54)
        {
          v58 = 0;
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
          objc_msgSend(v4, "minimumSquareLength");
          v56 = v56 - v57;
          v58 = 1;
        }
      }
      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v60 = vabdd_f64(v59, v34);
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
      objc_msgSend(v61, "minimumSquareLength");
      v63 = v62;

      if (v60 >= v63)
        v63 = v60;
      -[DisplayPatternToolViewController originPoint](self, "originPoint");
      v65 = vabdd_f64(v64, v36);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
      objc_msgSend(v66, "minimumSquareLength");
      v68 = v67;

      if (v65 >= v68)
        v69 = v65;
      else
        v69 = v68;
      -[DisplayPatternToolViewController setRectangle:](self, "setRectangle:", v45, v56, v63, v69);
      if (v58)

      if (v47)
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
      -[DisplayPatternToolViewController rectangle](self, "rectangle");
      objc_msgSend(v70, "updateDrawing:");

    }
  }
LABEL_49:

}

- (void)tapOccurred:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  if (!-[DisplayViewController isAnimatedScrolling](self, "isAnimatedScrolling"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController view](self, "view"));
    objc_msgSend(v20, "locationInView:", v4);
    -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:");

    -[DisplayPatternToolViewController originPoint](self, "originPoint");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    objc_msgSend(v7, "minimumSquareLength");
    v9 = v6 - v8 * 0.5;
    -[DisplayPatternToolViewController originPoint](self, "originPoint");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    objc_msgSend(v12, "minimumSquareLength");
    v14 = v11 - v13 * 0.5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    objc_msgSend(v15, "minimumSquareLength");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
    objc_msgSend(v18, "minimumSquareLength");
    -[DisplayPatternToolViewController setRectangle:](self, "setRectangle:", v9, v14, v17, v19);

    -[DisplayPatternToolViewController addedRectangleView](self, "addedRectangleView");
  }

}

- (void)removeShape:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  DisplayPatternToolViewController *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "drawColor"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_ITEM"), &stru_10000C668, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_10000C668, 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000055E0;
  v20[3] = &unk_10000C378;
  v12 = v4;
  v21 = v12;
  v22 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 2, v20));
  objc_msgSend(v9, "addAction:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10000C668, 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005614;
  v18[3] = &unk_10000C3A0;
  v19 = v12;
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v18));
  objc_msgSend(v9, "addAction:", v17);

  -[DisplayPatternToolViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)drawBrightnessIndicator
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
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
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v53;

  v3 = objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 0);
  -[DisplayPatternToolViewController setBrightnessIndicator:](self, "setBrightnessIndicator:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  objc_msgSend(v4, "bounds");
  v6 = v5 * 0.100000001;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  objc_msgSend(v7, "bounds");
  v9 = v8 * 0.5;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v10, "setCenter:", v6, v9);

  memset(&v53, 0, sizeof(v53));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeRotation(&t2, -1.57079633);
  CGAffineTransformConcat(&v53, &t1, &t2);

  CGAffineTransformMakeScale(&v49, 1.0, 1.5);
  v48 = v53;
  CGAffineTransformConcat(&v50, &v48, &v49);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  v47 = v50;
  objc_msgSend(v13, "setTransform:", &v47);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v15, "setProgressTintColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v17, "setTrackTintColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v18, "addSubview:", v19);

  *(float *)&v21 = BKSDisplayBrightnessGetCurrent(v20);
  -[DisplayPatternToolViewController updateBrightnessIndicator:](self, "updateBrightnessIndicator:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v23, "setBorderWidth:", 1.0);

  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  v25 = objc_msgSend(v24, "CGColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
  objc_msgSend(v27, "setBorderColor:", v25);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v28, "frame");
  v30 = v6 - v29 * 0.5 + -2.0;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v31, "frame");
  v33 = v9 - v32 * 0.5 + -2.0;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v34, "frame");
  v36 = v35 + 4.0;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v37, "frame");
  v39 = v38 + 4.0;

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[DSShapeView rectangleWithFrame:borderColor:fillColor:borderWidth:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:borderWidth:", v40, v41, 1, v30, v33, v36, v39));
  -[DisplayPatternToolViewController setBorderViewBlack:](self, "setBorderViewBlack:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController borderViewBlack](self, "borderViewBlack"));
  objc_msgSend(v43, "addSubview:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController drawableView](self, "drawableView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController borderViewWhite](self, "borderViewWhite"));
  objc_msgSend(v45, "addSubview:", v46);

}

- (void)updateBrightnessIndicator:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (void)cancelTimerForHideBrightnessIndicator
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)hideBrightnessIndicatorWithDelay
{
  _QWORD block[5];

  -[DisplayPatternToolViewController cancelTimerForHideBrightnessIndicator](self, "cancelTimerForHideBrightnessIndicator");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B18;
  block[3] = &unk_10000C3C8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideBrightnessIndicator
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController borderViewBlack](self, "borderViewBlack"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController borderViewWhite](self, "borderViewWhite"));
  objc_msgSend(v4, "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController brightnessIndicator](self, "brightnessIndicator"));
  objc_msgSend(v5, "removeFromSuperview");

  -[DisplayPatternToolViewController setBorderViewBlack:](self, "setBorderViewBlack:", 0);
  -[DisplayPatternToolViewController setBorderViewWhite:](self, "setBorderViewWhite:", 0);
  -[DisplayPatternToolViewController setBrightnessIndicator:](self, "setBrightnessIndicator:", 0);
}

- (void)addedRectangleView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[7];
  _QWORD v35[7];

  -[DisplayPatternToolViewController rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drawColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DSShapeView rectangleWithFrame:borderColor:fillColor:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:", v12, v13, v4, v6, v8, v10));

  objc_msgSend(v14, "setTag:", -[DisplayPatternToolViewController currentTag](self, "currentTag"));
  -[DisplayPatternToolViewController setCurrentTag:](self, "setCurrentTag:", (char *)-[DisplayPatternToolViewController currentTag](self, "currentTag") + 1);
  v15 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "removeShape:");
  objc_msgSend(v14, "addGestureRecognizer:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", -[DisplayViewController page](self, "page")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "drawingOverlay"));
  objc_msgSend(v18, "addSubview:", v14);

  v34[0] = CFSTR("xPos");
  objc_msgSend(v14, "frame");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[0] = v33;
  v34[1] = CFSTR("yPos");
  objc_msgSend(v14, "frame");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
  v35[1] = v32;
  v34[2] = CFSTR("width");
  objc_msgSend(v14, "frame");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
  v35[2] = v21;
  v34[3] = CFSTR("height");
  objc_msgSend(v14, "frame");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
  v35[3] = v23;
  v34[4] = CFSTR("image");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController testImages](self, "testImages"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", -[DisplayViewController page](self, "page")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "assetName"));
  v35[4] = v26;
  v34[5] = CFSTR("tag");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "tag")));
  v35[5] = v27;
  v34[6] = CFSTR("brightness");
  *(float *)&v28 = BKSDisplayBrightnessGetCurrent(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
  v35[6] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 7));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults"));
  objc_msgSend(v31, "addObject:", v30);

}

- (void)removeResultWithTag:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tag")));
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults"));
          objc_msgSend(v13, "removeObject:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)saveColorAdjustmentStates
{
  void *v3;
  void *v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "getBlueLightStatus:", v5);

  -[DisplayPatternToolViewController setBlueLightStatusActive:](self, "setBlueLightStatusActive:", LOBYTE(v5[0]));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController adaptationClient](self, "adaptationClient"));
  -[DisplayPatternToolViewController setColorAdaptationStatus:](self, "setColorAdaptationStatus:", objc_msgSend(v4, "getEnabled"));

}

- (void)resetColorAdjustmentStates
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "setActive:", -[DisplayPatternToolViewController blueLightStatusActive](self, "blueLightStatusActive"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController adaptationClient](self, "adaptationClient"));
  objc_msgSend(v4, "setEnabled:", -[DisplayPatternToolViewController colorAdaptationStatus](self, "colorAdaptationStatus"));

}

- (void)disableAdaptationAndBlueLightReduction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController adaptationClient](self, "adaptationClient"));
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void)saveAndMaximizeBrightness
{
  double v3;
  double v4;
  id v5;

  *(float *)&v3 = BKSDisplayBrightnessGetCurrent(self);
  -[DisplayPatternToolViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController diagnosticResponder](self, "diagnosticResponder"));
  LODWORD(v4) = 1.0;
  objc_msgSend(v5, "setScreenToBrightness:animate:", 0, v4);

}

- (void)resetBrightness
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController diagnosticResponder](self, "diagnosticResponder"));
  -[DisplayPatternToolViewController originalScreenBrightness](self, "originalScreenBrightness");
  objc_msgSend(v3, "setScreenToBrightness:animate:", 0);

}

- (void)animateToBrightness:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController diagnosticResponder](self, "diagnosticResponder"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setScreenToBrightness:animate:", 1, v4);

}

- (void)cleanUp
{
  void *v3;
  unsigned int v4;

  -[DisplayPatternToolViewController resetBrightness](self, "resetBrightness");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "disableAmbientLightAdaptation");

  if (v4)
    -[DisplayPatternToolViewController resetColorAdjustmentStates](self, "resetColorAdjustmentStates");
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DisplayPatternToolViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  -[DisplayPatternToolViewController parseResults](self, "parseResults");
  -[DisplayPatternToolViewController setFinished:](self, "setFinished:", 1);
}

- (void)parseResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController result](self, "result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusCode"));
  if (objc_msgSend(v4, "isEqualToNumber:", &off_10000C818))
  {

LABEL_4:
    v27 = (id)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController result](self, "result"));
    objc_msgSend(v27, "setData:", &__NSDictionary0__struct);

    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusCode"));
  v7 = objc_msgSend(v6, "isEqualToNumber:", &off_10000C7D0);

  if (v7)
    goto LABEL_4;
  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v15), "mutableCopy");
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("tag"));
        objc_msgSend(v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v10, "copy");
  -[DisplayPatternToolViewController setAllResults:](self, "setAllResults:", v17);

  v32[0] = CFSTR("displayResX");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v18, "bounds");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
  v33[0] = v20;
  v32[1] = CFSTR("displayResY");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v21, "bounds");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
  v33[1] = v23;
  v32[2] = CFSTR("anomaliesDetected");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController allResults](self, "allResults"));
  v33[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolViewController result](self, "result"));
  objc_msgSend(v26, "setData:", v25);

}

- (NSArray)testImages
{
  return self->_testImages;
}

- (void)setTestImages:(id)a3
{
  objc_storeStrong((id *)&self->_testImages, a3);
}

- (int64_t)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(int64_t)a3
{
  self->_currentTag = a3;
}

- (CGRect)rectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectangle.origin.x;
  y = self->_rectangle.origin.y;
  width = self->_rectangle.size.width;
  height = self->_rectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGPoint)originPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originPoint.x;
  y = self->_originPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginPoint:(CGPoint)a3
{
  self->_originPoint = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (unint64_t)currentPanType
{
  return self->_currentPanType;
}

- (void)setCurrentPanType:(unint64_t)a3
{
  self->_currentPanType = a3;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (CBClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void)setBlueLightClient:(id)a3
{
  objc_storeStrong((id *)&self->_blueLightClient, a3);
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (void)setAdaptationClient:(id)a3
{
  objc_storeStrong((id *)&self->_adaptationClient, a3);
}

- (BOOL)blueLightStatusActive
{
  return self->_blueLightStatusActive;
}

- (void)setBlueLightStatusActive:(BOOL)a3
{
  self->_blueLightStatusActive = a3;
}

- (BOOL)colorAdaptationStatus
{
  return self->_colorAdaptationStatus;
}

- (void)setColorAdaptationStatus:(BOOL)a3
{
  self->_colorAdaptationStatus = a3;
}

- (DADrawableView)drawableView
{
  return self->_drawableView;
}

- (void)setDrawableView:(id)a3
{
  objc_storeStrong((id *)&self->_drawableView, a3);
}

- (DisplayPatternToolInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (UIProgressView)brightnessIndicator
{
  return self->_brightnessIndicator;
}

- (void)setBrightnessIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessIndicator, a3);
}

- (DSShapeView)borderViewWhite
{
  return self->_borderViewWhite;
}

- (void)setBorderViewWhite:(id)a3
{
  objc_storeStrong((id *)&self->_borderViewWhite, a3);
}

- (DSShapeView)borderViewBlack
{
  return self->_borderViewBlack;
}

- (void)setBorderViewBlack:(id)a3
{
  objc_storeStrong((id *)&self->_borderViewBlack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderViewBlack, 0);
  objc_storeStrong((id *)&self->_borderViewWhite, 0);
  objc_storeStrong((id *)&self->_brightnessIndicator, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_drawableView, 0);
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_blueLightClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_testImages, 0);
}

@end
