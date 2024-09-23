@implementation SharingViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SharingItem *v9;
  void *v10;
  void *v11;
  SharingItem *v12;
  id v13;
  void *v14;
  id v15;
  void ***v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, int);
  void *v20;
  id v21;
  id location;
  objc_super v23;
  SharingItem *v24;

  v23.receiver = self;
  v23.super_class = (Class)SharingViewController;
  -[SharingViewController viewDidAppear:](&v23, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController presentationContext](self, "presentationContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharingData"));

  if (v8)
  {
    v9 = [SharingItem alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController presentationContext](self, "presentationContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sharingData"));
    v12 = -[SharingItem initWithData:](v9, "initWithData:", v11);

    v13 = objc_alloc((Class)UIActivityViewController);
    v24 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v15 = objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v14, 0);

    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1000040FC;
    v20 = &unk_10000C408;
    objc_copyWeak(&v21, &location);
    v16 = objc_retainBlock(&v17);
    objc_msgSend(v15, "setCompletionWithItemsHandler:", v16, v17, v18, v19, v20);
    -[SharingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    v12 = (SharingItem *)objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", &off_10000CAA8, 0);
    -[SharingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

@end
