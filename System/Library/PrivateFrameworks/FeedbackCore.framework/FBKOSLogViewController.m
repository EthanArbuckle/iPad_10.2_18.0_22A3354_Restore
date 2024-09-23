@implementation FBKOSLogViewController

+ (BOOL)canDisplayURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("logarchive"));

  return v5;
}

- (void)setOSLogURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FBKOSLogViewerDataSource *v8;
  uint64_t v9;
  FBKOSLogViewerDataSource *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  -[FBKOSLogViewController setLogURL:](self, "setLogURL:", v4);
  -[FBKOSLogViewController logURL](self, "logURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOSLogViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  objc_initWeak(&location, self);
  v8 = [FBKOSLogViewerDataSource alloc];
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __38__FBKOSLogViewController_setOSLogURL___block_invoke;
  v13[3] = &unk_24E156E50;
  objc_copyWeak(&v14, &location);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __38__FBKOSLogViewController_setOSLogURL___block_invoke_2;
  v11[3] = &unk_24E156E78;
  objc_copyWeak(&v12, &location);
  v10 = -[FBKOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:](v8, "initWithArchive:pageSize:pageCompletion:error:", v4, 200, v13, v11);
  -[FBKOSLogViewController setLogSource:](self, "setLogSource:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __38__FBKOSLogViewController_setOSLogURL___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLoading:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

void __38__FBKOSLogViewController_setOSLogURL___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLoading:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)FBKOSLogViewController;
  -[FBKOSLogViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[FBKOSLogViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "setAutoresizingMask:", 45);
  -[FBKOSLogViewController setSpinner:](self, "setSpinner:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_shareArchive_);
  v13[0] = v7;
  v13[1] = v6;
  v13[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOSLogViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v8, 0);

  -[FBKOSLogViewController setLoading:](self, "setLoading:", 0);
  v9 = *MEMORY[0x24BEBE770];
  -[FBKOSLogViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRowHeight:", v9);

  -[FBKOSLogViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEstimatedRowHeight:", 80.0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKOSLogViewController;
  -[FBKOSLogViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[FBKOSLogViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", -[FBKOSLogViewController previousToolbarHidden](self, "previousToolbarHidden"));

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[FBKOSLogViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOSLogViewController setPreviousToolbarHidden:](self, "setPreviousToolbarHidden:", objc_msgSend(v5, "isToolbarHidden"));

  v7.receiver = self;
  v7.super_class = (Class)FBKOSLogViewController;
  -[FBKOSLogViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[FBKOSLogViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKOSLogViewController;
  -[FBKOSLogViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[FBKOSLogViewController logSource](self, "logSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "foundCorruptDate");

  if ((v5 & 1) == 0)
    -[FBKOSLogViewController nextPage](self, "nextPage");
}

- (void)shareArchive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[11];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKOSLogViewController logURL](self, "logURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE8F650]);
    -[FBKOSLogViewController logURL](self, "logURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v8, 0);

    objc_msgSend(v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBarButtonItem:", v4);

    objc_msgSend(v9, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPermittedArrowDirections:", 2);

    v12 = *MEMORY[0x24BE8F6E0];
    v19[0] = *MEMORY[0x24BE8F6C8];
    v19[1] = v12;
    v13 = *MEMORY[0x24BE8F6F8];
    v19[2] = *MEMORY[0x24BE8F6F0];
    v19[3] = v13;
    v14 = *MEMORY[0x24BE8F698];
    v19[4] = *MEMORY[0x24BE8F6A0];
    v19[5] = v14;
    v15 = *MEMORY[0x24BE8F688];
    v19[6] = *MEMORY[0x24BE8F700];
    v19[7] = v15;
    v16 = *MEMORY[0x24BE8F6E8];
    v19[8] = *MEMORY[0x24BE8F6D0];
    v19[9] = v16;
    v19[10] = *MEMORY[0x24BE8F6D8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExcludedActivityTypes:", v17);

    -[FBKOSLogViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)nextPage
{
  id v3;

  -[FBKOSLogViewController setLoading:](self, "setLoading:", 1);
  -[FBKOSLogViewController logSource](self, "logSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextPage");

}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_loading = a3;
  -[FBKOSLogViewController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  char v6;
  void *v8;
  int64_t v9;

  -[FBKOSLogViewController logSource](self, "logSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "foundCorruptDate");

  if ((v6 & 1) != 0)
    return 1;
  -[FBKOSLogViewController logSource](self, "logSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfLogs");

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  FBKOSLogTableViewCell *v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("FBKOSLogCell"));
  v7 = (FBKOSLogTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[FBKOSLogTableViewCell initWithStyle:reuseIdentifier:]([FBKOSLogTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("FBKOSLogCell"));
  -[FBKOSLogViewController logSource](self, "logSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "foundCorruptDate");

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("CORRUPT_FILE"), &stru_24E15EAF8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKOSLogTableViewCell logLabel](v7, "logLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  else
  {
    -[FBKOSLogViewController logSource](self, "logSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logAtIndex:", objc_msgSend(v6, "row"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v14 = v10;
    else
      v14 = CFSTR("-");
    -[FBKOSLogTableViewCell logLabel](v7, "logLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v14;
  void *v15;
  int v16;

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
    -[FBKOSLogViewController logSource](self, "logSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "foundCorruptDate");

    if ((v14 & 1) == 0 && !-[FBKOSLogViewController isLoading](self, "isLoading"))
    {
      -[FBKOSLogViewController logSource](self, "logSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasMoreLogs");

      if (v16)
        -[FBKOSLogViewController nextPage](self, "nextPage");
    }
  }
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setLogURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (FBKOSLogViewerDataSource)logSource
{
  return (FBKOSLogViewerDataSource *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setLogSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
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
