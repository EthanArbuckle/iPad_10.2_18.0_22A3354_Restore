@implementation TradeInToolViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  id v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  void *v41;
  void *v42;
  dispatch_semaphore_t v43;
  id v44;
  _QWORD v45[4];
  id v46;
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;

  v6 = a3;
  v7 = a4;
  -[TradeInToolViewController setInputs:](self, "setInputs:", v6);
  v42 = v7;
  -[DisplayViewController setDiagnosticResponder:](self, "setDiagnosticResponder:", v7);
  v43 = dispatch_semaphore_create(0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v9, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController inputs](self, "inputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageFileNames"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v15 = 0;
    *(_QWORD *)&v14 = 138412546;
    v40 = v14;
    while (1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController inputs](self, "inputs", v40));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageFileNames"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v15));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathExtension"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URLByAppendingPathExtension:", v22));

      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = sub_100004660;
      v53 = sub_100004670;
      v54 = 0;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100004678;
      v45[3] = &unk_1000082C0;
      v24 = v18;
      v46 = v24;
      v48 = &v49;
      v25 = v43;
      v47 = v25;
      objc_msgSend(v42, "getAsset:completion:", v24, v45);
      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      if (v50[5])
      {
        v26 = DiagnosticLogHandleForCategory(3);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v23;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Saving image data to [%@]", buf, 0xCu);
        }

        v28 = (void *)v50[5];
        v44 = 0;
        v29 = objc_msgSend(v28, "writeToURL:options:error:", v23, 268435457, &v44);
        v30 = v44;
        if (v29)
        {
          objc_msgSend(v41, "addObject:", v23);
          v31 = 0;
        }
        else
        {
          v34 = DiagnosticLogHandleForCategory(3);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v40;
            v56 = v23;
            v57 = 2112;
            v58 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
          }

          -[TradeInToolViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100008498);
          v31 = 1;
        }

      }
      else
      {
        v32 = DiagnosticLogHandleForCategory(3);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
        }

        -[TradeInToolViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000084B0);
        v31 = 1;
      }

      _Block_object_dispose(&v49, 8);
      if (v31)
        break;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController inputs](self, "inputs"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "imageFileNames"));
      v38 = objc_msgSend(v37, "count");

      if ((unint64_t)v38 <= ++v15)
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    v39 = objc_msgSend(v41, "copy");
    -[TradeInToolViewController setTradeInImages:](self, "setTradeInImages:", v39);

  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TradeInToolViewController;
  -[DisplayViewController setupView](&v29, "setupView");
  -[TradeInToolViewController setShouldShowPressHomeLabel:](self, "setShouldShowPressHomeLabel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "panGestureRecognizer"));
  objc_msgSend(v4, "setMinimumNumberOfTouches:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panGestureRecognizer"));
  objc_msgSend(v6, "setMaximumNumberOfTouches:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController tradeInImages](self, "tradeInImages"));
  v11 = v9 * (double)((unint64_t)objc_msgSend(v10, "count") + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v15, "setContentSize:", v11, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TRADE_IN_TOOL_COMPLETE_TITLE"), &stru_100008380, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v18, "setMessage:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100008380, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v21, "setButtonTitle:", v20);

  objc_initWeak(&location, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_1000049E8;
  v26 = &unk_100008298;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v22, "setButtonAction:", &v23);

  -[TradeInToolViewController setUpViewAccessibilitySettings](self, "setUpViewAccessibilitySettings", v23, v24, v25, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)setUpViewAccessibilitySettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRADE_IN_TOOL_QR_IMAGE_AREA"), &stru_100008380, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v7, "setIsAccessibilityElement:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
  objc_msgSend(v10, "setAccessibilityElements:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TradeInToolViewController;
  -[TradeInToolViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = objc_claimAutoreleasedReturnValue(-[DisplayViewController animatedScrollingQueue](self, "animatedScrollingQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004C24;
  v5[3] = &unk_100008298;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TradeInToolViewController;
  -[TradeInToolViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "becomeFirstResponder");

  LODWORD(v4) = UIAccessibilityScreenChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v5);

}

- (void)start
{
  dispatch_queue_attr_t v3;
  dispatch_queue_t v4;
  NSObject *v5;

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  v5 = objc_claimAutoreleasedReturnValue(v3);
  v4 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-8381.animatedScrollingQueue", v5);
  -[DisplayViewController setAnimatedScrollingQueue:](self, "setAnimatedScrollingQueue:", v4);

  -[TradeInToolViewController setupView](self, "setupView");
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  -[TradeInToolViewController setFinished:](self, "setFinished:", 1);
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6 * v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController tradeInImages](self, "tradeInImages"));
  -[TradeInToolViewController frameForPage:](self, "frameForPage:", objc_msgSend(v3, "count"));
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
  return &stru_100008380;
}

- (int)maxNumPages
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController tradeInImages](self, "tradeInImages"));
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)imageViewForPage:(int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)UIImageView);
  -[TradeInToolViewController frameForPage:](self, "frameForPage:", v3);
  v6 = objc_msgSend(v5, "initWithFrame:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController tradeInImages](self, "tradeInImages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v9));
  objc_msgSend(v6, "setImage:", v10);

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  if ((_DWORD)v3 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("TRADE_IN_TOOL_LIGHT_QR_CODE");
    goto LABEL_5;
  }
  if (!(_DWORD)v3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("TRADE_IN_TOOL_DARK_QR_CODE");
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_100008380, 0));
    objc_msgSend(v6, "setAccessibilityLabel:", v14);

  }
  objc_msgSend(v6, "setAccessibilityTraits:", UIAccessibilityTraitImage);

  return v6;
}

- (void)didUpdateCurrentImageView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v5 = a3;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
    v22[0] = v6;
    v22[1] = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
    objc_msgSend(v8, "setAccessibilityElements:", v7);

    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v5);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_actionButton"));
    v21[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
    v21[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TradeInToolViewController view](self, "view"));
    objc_msgSend(v13, "setAccessibilityElements:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ANNOUNCE_TRADE_IN_TOOL_DONE"), &stru_100008380, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_actionButton"));
    objc_msgSend(v17, "setAccessibilityLabel:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_actionButton"));
    objc_msgSend(v19, "becomeFirstResponder");

    LODWORD(v19) = UIAccessibilityLayoutChangedNotification;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_actionButton"));
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v19, v20);

  }
}

- (TradeInToolInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSArray)tradeInImages
{
  return self->_tradeInImages;
}

- (void)setTradeInImages:(id)a3
{
  objc_storeStrong((id *)&self->_tradeInImages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tradeInImages, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
