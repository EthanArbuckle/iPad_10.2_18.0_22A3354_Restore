@implementation ProxCardKitTestStartViewController

- (ProxCardKitTestStartViewController)init
{
  ProxCardKitTestStartViewController *v2;
  ProxCardKitTestStartViewController *v3;
  ProxCardKitTestStartViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ProxCardKitTestStartViewController *v9;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[4];
  ProxCardKitTestStartViewController *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ProxCardKitTestStartViewController;
  v2 = -[ProxCardKitTestStartViewController init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    -[ProxCardKitTestStartViewController setTitle:](v2, "setTitle:", CFSTR("ProxCardKit Test"));
    -[ProxCardKitTestStartViewController setDismissalType:](v3, "setDismissalType:", 3);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100108DC4;
    v14[3] = &unk_10017DA08;
    v4 = v3;
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", &stru_10017E3D8, 0, v14));
    -[ProxCardKitTestStartViewController setInfoButtonAction:](v4, "setInfoButtonAction:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestStartViewController infoButton](v4, "infoButton"));
    objc_msgSend(v6, "setAlpha:", 0.0);

    location = 0;
    objc_initWeak(&location, v4);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100108E20;
    v11[3] = &unk_10017E008;
    objc_copyWeak(&v12, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Next"), 0, v11));
    v8 = -[ProxCardKitTestStartViewController addAction:](v4, "addAction:", v7);

    v9 = v4;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *pView;
  void *v7;
  id v8;
  void *v9;
  UIImageView *v10;
  UIImageView *rView;
  void *v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *xView;
  void *v17;
  void *v18;
  UIImageView *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _QWORD v60[8];
  _QWORD v61[3];
  _BYTE v62[128];

  v59.receiver = self;
  v59.super_class = (Class)ProxCardKitTestStartViewController;
  -[ProxCardKitTestStartViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("p.square.fill")));
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  pView = self->_pView;
  self->_pView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIImageView setTintColor:](self->_pView, "setTintColor:", v7);

  v8 = objc_alloc((Class)UIImageView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("r.square.fill")));
  v10 = (UIImageView *)objc_msgSend(v8, "initWithImage:", v9);
  rView = self->_rView;
  self->_rView = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  -[UIImageView setTintColor:](self->_rView, "setTintColor:", v12);

  v13 = objc_alloc((Class)UIImageView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("x.square.fill")));
  v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
  xView = self->_xView;
  self->_xView = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIImageView setTintColor:](self->_xView, "setTintColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 72.0));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = self->_rView;
  v61[0] = self->_pView;
  v61[1] = v19;
  v61[2] = self->_xView;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 3));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v25, "setPreferredSymbolConfiguration:", v18);
        objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestStartViewController contentView](self, "contentView"));
        objc_msgSend(v26, "addSubview:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v22);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestStartViewController contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mainContentGuide"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_pView, "centerYAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_rView, "centerYAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v60[0] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_rView, "centerYAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v60[1] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_xView, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_rView, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v60[2] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_rView, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_pView, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v54, 1.0));
  v60[3] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_xView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_rView, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v40, 1.0));
  v60[4] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_rView, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v60[5] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_rView, "topAnchor"));
  v42 = v28;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
  v60[6] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_rView, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v34));
  v60[7] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD *v7;
  Block_layout *v8;
  _QWORD v9[4];
  CGAffineTransform v10;
  uint64_t v11;
  CGAffineTransform v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ProxCardKitTestStartViewController;
  -[ProxCardKitTestStartViewController viewDidAppear:](&v13, "viewDidAppear:", a3);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeScale(&v12, 1.2, 1.2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100108A6C;
  v9[3] = &unk_10017DA28;
  v10 = v12;
  v11 = 0x3FE999999999999ALL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100108AC0;
  v6[3] = &unk_10017DA90;
  v6[4] = self;
  v7 = objc_retainBlock(v9);
  v8 = &stru_10017DA68;
  v4 = v7;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 8, v6, 0, 1.0, 0.0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100108C60;
  v5[3] = &unk_10017E1F0;
  v5[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v5, 0, 0.5, 3.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xView, 0);
  objc_storeStrong((id *)&self->_rView, 0);
  objc_storeStrong((id *)&self->_pView, 0);
}

@end
