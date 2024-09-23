@implementation FunCameraStickerBrowserViewController

- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3 stickerSize:(int64_t)a4
{
  id v7;
  FunCameraStickerBrowserViewController *v8;
  FunCameraStickerBrowserViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FunCameraStickerBrowserViewController;
  v8 = -[FunCameraStickerBrowserViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_effectTypeIdentifier, a3);
    v9->_stickerSize = a4;
  }

  return v9;
}

- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3
{
  id v5;
  FunCameraStickerBrowserViewController *v6;
  FunCameraStickerBrowserViewController *v7;

  v5 = a3;
  v6 = -[FunCameraStickerBrowserViewController initWithEffectTypeIdentifier:stickerSize:](self, "initWithEffectTypeIdentifier:stickerSize:", v5, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_effectTypeIdentifier, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[4];

  v37.receiver = self;
  v37.super_class = (Class)FunCameraStickerBrowserViewController;
  -[FunCameraStickerBrowserViewController viewDidLoad](&v37, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)MSStickerBrowserView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v11 = objc_msgSend(v5, "initWithFrame:stickerSize:", -[FunCameraStickerBrowserViewController stickerSize](self, "stickerSize"), v7, v8, v9, v10);
  -[FunCameraStickerBrowserViewController setStickerBrowser:](self, "setStickerBrowser:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v12, "setDataSource:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v14, "addSubview:", v15);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v38[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v38[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v38[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v38[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FunCameraStickerBrowserViewController;
  -[FunCameraStickerBrowserViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v4, "_startAnimating");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FunCameraStickerBrowserViewController;
  -[FunCameraStickerBrowserViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v4, "_stopAnimating");

}

- (NSMutableDictionary)stickerCache
{
  NSMutableDictionary *stickerCache;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  stickerCache = self->_stickerCache;
  if (!stickerCache)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5 = self->_stickerCache;
    self->_stickerCache = v4;

    stickerCache = self->_stickerCache;
  }
  return stickerCache;
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController dataSource](self, "dataSource", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController effectTypeIdentifier](self, "effectTypeIdentifier"));
  v6 = objc_msgSend(v4, "funCamStickerBrowser:numberOfStickersForEffectTypeIdentifier:", self, v5);

  return (int64_t)v6;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerCache](self, "stickerCache", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController dataSource](self, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController effectTypeIdentifier](self, "effectTypeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "funCamStickerBrowser:stickerForIndex:forEffectTypeIdentifier:", self, a4, v10));

    v12 = objc_alloc((Class)MSSticker);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "previewUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
    v8 = objc_msgSend(v12, "initWithContentsOfFileURL:localizedDescription:error:", v13, v14, 0);

    if (v8)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerCache](self, "stickerCache"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v16);

    }
  }
  return v8;
}

- (void)reloadStickers
{
  id v3;

  -[FunCameraStickerBrowserViewController setStickerCache:](self, "setStickerCache:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v3, "reloadData");

}

- (void)reloadStickerAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerCache](self, "stickerCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
  objc_msgSend(v7, "_reloadStickersAtIndexes:", v8);

}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double y;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];

  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
    objc_msgSend(v10, "prepareForSnapshotting");

    y = CGPointZero.y;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
    objc_msgSend(v12, "setContentOffset:", CGPointZero.x, y);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;

    v24[1] = 3221225472;
    v24[2] = sub_10000276C;
    v24[3] = &unk_100004190;
    v24[4] = self;
    v23 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v15, v17);
    v24[0] = _NSConcreteStackBlock;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithActions:", v24));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
    objc_msgSend(v19, "setContentOffset:", v7, v9);

    v4[2](v4, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraStickerBrowserViewController stickerBrowser](self, "stickerBrowser"));
      objc_msgSend(v22, "_startAnimating");

    }
  }
}

- (NSString)effectTypeIdentifier
{
  return self->_effectTypeIdentifier;
}

- (FunCameraStickerBrowserViewControllerDataSource)dataSource
{
  return (FunCameraStickerBrowserViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (MSStickerBrowserView)stickerBrowser
{
  return self->_stickerBrowser;
}

- (void)setStickerBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_stickerBrowser, a3);
}

- (void)setStickerCache:(id)a3
{
  objc_storeStrong((id *)&self->_stickerCache, a3);
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_stickerBrowser, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_effectTypeIdentifier, 0);
}

@end
