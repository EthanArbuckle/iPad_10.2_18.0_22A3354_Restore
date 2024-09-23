@implementation FMDMovieProxCardViewController

- (FMDMovieProxCardViewController)initWithMovieURL:(id)a3 adjustmentsURL:(id)a4 movieDimensions:(CGSize)a5 productHeight:(double)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  FMDMovieProxCardViewController *v13;
  FMDMovieProxCardMovieView *v14;
  FMDMovieProxCardMovieView *movieView;
  FMDMovieProxCardViewController *v16;
  objc_super v18;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FMDMovieProxCardViewController;
  v13 = -[FMDMovieProxCardViewController initWithContentView:](&v18, "initWithContentView:", 0);
  if (v13)
  {
    v14 = -[FMDMovieProxCardMovieView initWithMovieURL:adjustmentsURL:]([FMDMovieProxCardMovieView alloc], "initWithMovieURL:adjustmentsURL:", v11, v12);
    movieView = v13->_movieView;
    v13->_movieView = v14;

    v13->_movieDimensions.width = width;
    v13->_movieDimensions.height = height;
    v13->_productHeight = a6;
    v16 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[10];

  v48.receiver = self;
  v48.super_class = (Class)FMDMovieProxCardViewController;
  -[FMDMovieProxCardViewController viewDidLoad](&v48, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  objc_msgSend(v8, "sendSubviewToBack:", v9);

  v10 = objc_alloc_init((Class)UILayoutGuide);
  objc_msgSend(v10, "setIdentifier:", CFSTR("PRXMovieContentGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView"));
  objc_msgSend(v11, "addLayoutGuide:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainContentGuide"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
  -[FMDMovieProxCardViewController movieDimensions](self, "movieDimensions");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", v14));
  v49[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "widthAnchor"));
  -[FMDMovieProxCardViewController movieDimensions](self, "movieDimensions");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:"));
  v49[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v49[2] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v49[3] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
  -[FMDMovieProxCardViewController productHeight](self, "productHeight");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToConstant:"));
  v49[4] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v49[5] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v49[6] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v15));
  v49[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v31 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v18));
  v49[8] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v49[9] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDMovieProxCardViewController;
  -[FMDMovieProxCardViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  objc_msgSend(v5, "play");

  -[FMDMovieProxCardViewController setAuxiliaryViewsAlpha:](self, "setAuxiliaryViewsAlpha:", 0.0);
  -[FMDMovieProxCardViewController fadeInAuxiliaryViewsOverDuration:delay:completion:](self, "fadeInAuxiliaryViewsOverDuration:delay:completion:", 0, 1.5, 0.5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDMovieProxCardViewController;
  -[FMDMovieProxCardViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  objc_msgSend(v5, "pause");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController movieView](self, "movieView"));
  objc_msgSend(v6, "setPlayer:", 0);

}

- (void)fadeInAuxiliaryViewsOverDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v10 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018274;
  v11[3] = &unk_100034760;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018280;
  v9[3] = &unk_1000359F0;
  v8 = v10;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v11, v9, a3, a4);

}

- (void)setAuxiliaryViewsAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleTextView"));
  objc_msgSend(v6, "setAlpha:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitleLabel"));
  objc_msgSend(v8, "setAlpha:", a3);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardViewController contentView](self, "contentView", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "auxiliaryViews"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "setAlpha:", a3);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (FMDMovieProxCardMovieView)movieView
{
  return self->_movieView;
}

- (CGSize)movieDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_movieDimensions.width;
  height = self->_movieDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)productHeight
{
  return self->_productHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieView, 0);
}

@end
