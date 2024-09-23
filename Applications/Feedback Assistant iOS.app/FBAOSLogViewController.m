@implementation FBAOSLogViewController

+ (BOOL)canDisplayURL:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("logarchive"));

  return v5;
}

- (void)setOSLogURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FBAOSLogViewerDataSource *v8;
  FBAOSLogViewerDataSource *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  -[FBAOSLogViewController setLogURL:](self, "setLogURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logURL](self, "logURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setTitle:", v6);

  objc_initWeak(&location, self);
  v8 = [FBAOSLogViewerDataSource alloc];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003DF14;
  v12[3] = &unk_1000E77B8;
  objc_copyWeak(&v13, &location);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003DF74;
  v10[3] = &unk_1000E77E0;
  objc_copyWeak(&v11, &location);
  v9 = -[FBAOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:](v8, "initWithArchive:pageSize:pageCompletion:error:", v4, 200, v12, v10);
  -[FBAOSLogViewController setLogSource:](self, "setLogSource:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[3];

  v11.receiver = self;
  v11.super_class = (Class)FBAOSLogViewController;
  -[FBAOSLogViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "setAutoresizingMask:", 45);
  -[FBAOSLogViewController setSpinner:](self, "setSpinner:", v4);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v4);
  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "shareArchive:");
  v12[0] = v7;
  v12[1] = v6;
  v12[2] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  -[FBAOSLogViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v8, 0);

  -[FBAOSLogViewController setLoading:](self, "setLoading:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setRowHeight:", UITableViewAutomaticDimension);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setEstimatedRowHeight:", 80.0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAOSLogViewController;
  -[FBAOSLogViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "setToolbarHidden:", -[FBAOSLogViewController previousToolbarHidden](self, "previousToolbarHidden"));

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationController](self, "navigationController"));
  -[FBAOSLogViewController setPreviousToolbarHidden:](self, "setPreviousToolbarHidden:", objc_msgSend(v5, "isToolbarHidden"));

  v7.receiver = self;
  v7.super_class = (Class)FBAOSLogViewController;
  -[FBAOSLogViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "setToolbarHidden:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAOSLogViewController;
  -[FBAOSLogViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
  v5 = objc_msgSend(v4, "foundCorruptDate");

  if ((v5 & 1) == 0)
    -[FBAOSLogViewController nextPage](self, "nextPage");
}

- (void)shareArchive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[11];
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logURL](self, "logURL"));

  if (v5)
  {
    v6 = objc_alloc((Class)UIActivityViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logURL](self, "logURL"));
    v15 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v9 = objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v8, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
    objc_msgSend(v10, "setBarButtonItem:", v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
    objc_msgSend(v11, "setPermittedArrowDirections:", 2);

    v14[0] = UIActivityTypePostToFacebook;
    v14[1] = UIActivityTypePostToTwitter;
    v14[2] = UIActivityTypePostToWeibo;
    v14[3] = UIActivityTypePrint;
    v14[4] = UIActivityTypeCopyToPasteboard;
    v14[5] = UIActivityTypeAssignToContact;
    v14[6] = UIActivityTypeSaveToCameraRoll;
    v14[7] = UIActivityTypeAddToReadingList;
    v14[8] = UIActivityTypePostToFlickr;
    v14[9] = UIActivityTypePostToVimeo;
    v14[10] = UIActivityTypePostToTencentWeibo;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 11));
    objc_msgSend(v9, "setExcludedActivityTypes:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController navigationController](self, "navigationController"));
    objc_msgSend(v13, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)nextPage
{
  id v3;

  -[FBAOSLogViewController setLoading:](self, "setLoading:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
  objc_msgSend(v3, "nextPage");

}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_loading = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController spinner](self, "spinner"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource", a3, a4));
  v6 = objc_msgSend(v5, "foundCorruptDate");

  if ((v6 & 1) != 0)
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
  v9 = objc_msgSend(v8, "numberOfLogs");

  return (int64_t)v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  FBAOSLogTableViewCell *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v6 = a4;
  v7 = (FBAOSLogTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("FBAOSLogCell")));
  if (!v7)
    v7 = -[FBAOSLogTableViewCell initWithStyle:reuseIdentifier:]([FBAOSLogTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("FBAOSLogCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
  v9 = objc_msgSend(v8, "foundCorruptDate");

  if (v9)
  {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("CORRUPT_FILE"), &stru_1000EA660, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogTableViewCell logLabel](v7, "logLabel"));
    objc_msgSend(v12, "setText:", v11);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "logAtIndex:", objc_msgSend(v6, "row")));

    if (v10)
      v14 = v10;
    else
      v14 = CFSTR("-");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogTableViewCell logLabel](v7, "logLabel"));
    objc_msgSend(v11, "setText:", v14);
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v6 + v7;
  objc_msgSend(v4, "contentSize");
  v10 = (uint64_t)(v9 - (double)(uint64_t)v8);
  objc_msgSend(v4, "bounds");
  v12 = v11;

  if (v10 <= (uint64_t)(v12 * 20.0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
    v14 = objc_msgSend(v13, "foundCorruptDate");

    if ((v14 & 1) == 0 && !-[FBAOSLogViewController isLoading](self, "isLoading"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewController logSource](self, "logSource"));
      v16 = objc_msgSend(v15, "hasMoreLogs");

      if (v16)
        -[FBAOSLogViewController nextPage](self, "nextPage");
    }
  }
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FBAOSLogViewerDataSource)logSource
{
  return (FBAOSLogViewerDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)previousToolbarHidden
{
  return self->_previousToolbarHidden;
}

- (void)setPreviousToolbarHidden:(BOOL)a3
{
  self->_previousToolbarHidden = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinner);
}

- (void)setSpinner:(id)a3
{
  objc_storeWeak((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinner);
  objc_storeStrong((id *)&self->_logSource, 0);
  objc_storeStrong((id *)&self->_logURL, 0);
}

@end
