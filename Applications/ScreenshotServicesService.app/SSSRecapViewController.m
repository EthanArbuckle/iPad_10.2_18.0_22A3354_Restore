@implementation SSSRecapViewController

+ (BOOL)recapAvailable
{
  __int128 v3;
  uint64_t v4;

  if (!qword_1000AD780)
  {
    v3 = off_100092820;
    v4 = 0;
    qword_1000AD780 = _sl_dlopen(&v3, 0);
  }
  return qword_1000AD780 != 0;
}

- (SSSRecapViewController)initWithScreenshot:(id)a3
{
  SSSScreenshot *v4;
  SSSRecapViewController *v5;
  SSSScreenshot *screenshot;
  objc_super v8;

  v4 = (SSSScreenshot *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSSRecapViewController;
  v5 = -[SSSRecapViewController init](&v8, "init");
  screenshot = v5->_screenshot;
  v5->_screenshot = v4;

  return v5;
}

- (void)loadScreenshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SSSRecapViewController *v19;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;

  if (!qword_1000AD780)
  {
    v21 = off_100092820;
    v22 = 0;
    qword_1000AD780 = _sl_dlopen(&v21, 0);
  }
  if (!qword_1000AD780)
    exit(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController screenshot](self, "screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appleInternalOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recapMovie"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screenRecording"));
  if (v7)
  {
    -[SSSRecapViewController finishLoadingScreenshot](self, "finishLoadingScreenshot");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController screenshot](self, "screenshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageProvider"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032E18;
    v20[3] = &unk_100092800;
    v20[4] = self;
    objc_msgSend(v9, "requestOutputImageForSaving:", v20);

    v10 = NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@.recapmov"), v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100032F0C;
    v16[3] = &unk_100092168;
    v17 = v14;
    v18 = v6;
    v19 = self;
    v15 = v14;
    objc_msgSend(v18, "writeToURL:completion:", v15, v16);

  }
}

- (void)finishLoadingScreenshot
{
  void *v3;
  objc_class *v4;
  RCPVizualizerView *v5;
  RCPVizualizerView *traceView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  RCPTimelineView *v14;
  RCPTimelineView *timelineView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v3 = (void *)qword_1000AD790;
  v29 = qword_1000AD790;
  if (!qword_1000AD790)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100033DD8;
    v24 = &unk_100091848;
    v25 = &v26;
    sub_100033DD8((uint64_t)&v21);
    v3 = (void *)v27[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v26, 8);
  v5 = (RCPVizualizerView *)objc_msgSend([v4 alloc], "initWithFrame:", 100.0, 100.0, 500.0, 500.0);
  traceView = self->_traceView;
  self->_traceView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController screenshot](self, "screenshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environmentDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appleInternalOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recapMovie"));
  -[RCPVizualizerView setRecapMovie:](self->_traceView, "setRecapMovie:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", self->_traceView);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v12 = (void *)qword_1000AD798;
  v29 = qword_1000AD798;
  if (!qword_1000AD798)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100033E2C;
    v24 = &unk_100091848;
    v25 = &v26;
    sub_100033E2C((uint64_t)&v21);
    v12 = (void *)v27[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v26, 8);
  v14 = (RCPTimelineView *)objc_msgSend([v13 alloc], "initWithFrame:", 100.0, 600.0, 500.0, 100.0);
  timelineView = self->_timelineView;
  self->_timelineView = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController screenshot](self, "screenshot"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "environmentDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appleInternalOptions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recapMovie"));
  -[RCPTimelineView setRecapMovie:](self->_timelineView, "setRecapMovie:", v19);

  -[RCPTimelineView setDelegate:](self->_timelineView, "setDelegate:", self->_traceView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_timelineView);

}

- (void)viewDidLoad
{
  UINavigationBar *v3;
  UINavigationBar *topBar;
  UINavigationBar *v5;
  void *v6;
  void *v7;
  UINavigationBar *v8;
  UIImage *v9;
  UINavigationBar *v10;
  UIImage *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  id v29;
  id v30;
  NSAttributedStringKey v31;
  void *v32;

  v28.receiver = self;
  v28.super_class = (Class)SSSRecapViewController;
  -[SSSRecapViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (UINavigationBar *)objc_alloc_init((Class)UINavigationBar);
  topBar = self->_topBar;
  self->_topBar = v3;

  v5 = self->_topBar;
  v31 = NSForegroundColorAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v32 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  -[UINavigationBar setTitleTextAttributes:](v5, "setTitleTextAttributes:", v7);

  -[UINavigationBar setDelegate:](self->_topBar, "setDelegate:", self);
  v8 = self->_topBar;
  v9 = objc_opt_new(UIImage);
  -[UINavigationBar setShadowImage:](v8, "setShadowImage:", v9);

  v10 = self->_topBar;
  v11 = objc_opt_new(UIImage);
  -[UINavigationBar setBackgroundImage:forBarMetrics:](v10, "setBackgroundImage:forBarMetrics:", v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_topBar);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UINavigationBar intrinsicContentSize](self->_topBar, "intrinsicContentSize");
  -[UINavigationBar setFrame:](self->_topBar, "setFrame:", v15, v17, v19, v20);
  v21 = objc_alloc_init((Class)UINavigationItem);
  v22 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "_sharePushed:");
  v30 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  objc_msgSend(v21, "setRightBarButtonItems:animated:", v23, 0);

  v24 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_donePushed:");
  v29 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  objc_msgSend(v21, "setLeftBarButtonItems:animated:", v25, 0);

  -[UINavigationBar pushNavigationItem:animated:](self->_topBar, "pushNavigationItem:animated:", v21, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v27, "setBackgroundColor:", v26);

  -[SSSRecapViewController loadScreenshot](self, "loadScreenshot");
}

- (void)_donePushed:(id)a3
{
  -[SSSRecapViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4 + -150.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  -[RCPTimelineView setFrame:](self->_timelineView, "setFrame:", 50.0, v5, v7 + -100.0, 100.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = v12 + -100.0 + -150.0;
  v14 = v13 / v12;
  if ((v10 + -100.0) / v10 < v13 / v12)
    v14 = (v10 + -100.0) / v10;
  -[RCPVizualizerView setFrame:](self->_traceView, "setFrame:", (v10 + -100.0 - v10 * v14) * 0.5 + 50.0, (v13 - v12 * v14) * 0.5 + 50.0);
}

- (int)_preferredStatusBarVisibility
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController parentViewController](self, "parentViewController"));
  v3 = objc_msgSend(v2, "_preferredStatusBarVisibility");

  return v3;
}

- (void)_sharePushed:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = -[RCPTimelineView startCropTimestamp](self->_timelineView, "startCropTimestamp", a3);
  v5 = -[RCPTimelineView endCropTimestamp](self->_timelineView, "endCropTimestamp");
  if (v5)
    v6 = (uint64_t)v5;
  else
    v6 = -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController screenshot](self, "screenshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environmentDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appleInternalOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recapMovie"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trimmedFrom:to:", v4, v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003390C;
  v14[3] = &unk_100092168;
  v14[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[SSSRecapViewController tapToRadarURL](self, "tapToRadarURL"));
  v16 = v10;
  v12 = v10;
  v13 = v15;
  objc_msgSend(v11, "writeToURL:completion:", v13, v14);

}

- (id)tapToRadarURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HHmmss.SSS'Z"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierISO8601));
  objc_msgSend(v2, "setCalendar:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  objc_msgSend(v2, "setLocale:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringFromDate:", v6));

  v8 = NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@.recapmov"), v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
  return v11;
}

- (void)tapToRadar:(id)a3 screenshot:(id)a4
{
  UIImage *v5;
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = (UIImage *)a4;
  v6 = a3;
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByDeletingPathExtension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("screenshot-%@.jpg"), v10));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v11));

  v12 = UIImageJPEGRepresentation(v5, 0.8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "writeToFile:atomically:", v20, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n\nSee attached screenshot, and recapmov file.\nhttps://toolsweb.apple.com/apps/recapedit"), "stringByAddingPercentEncodingWithAllowedCharacters:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new?attachments=%@&autoDiagnostics=0&screenshot=%@&deleteOnAttach=1&description=%@"), v17, v20, v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));

  if (v19)
    objc_msgSend(v16, "openURL:options:completionHandler:", v19, &__NSDictionary0__struct, 0);

}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_traceView, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
}

@end
