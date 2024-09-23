@implementation PHCarPlayInCallDialerView

- (PHCarPlayInCallDialerView)initWithFrame:(CGRect)a3
{
  PHCarPlayInCallDialerView *v3;
  void *v4;
  PHCarPlayInCallDialerLCDView *v5;
  void *v6;
  void *v7;
  PHCarPlayNumberPad *v8;
  void *v9;
  PHCarPlayNumberPad *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[5];
  _QWORD v55[4];

  v53.receiver = self;
  v53.super_class = (Class)PHCarPlayInCallDialerView;
  v3 = -[PHCarPlayInCallDialerView initWithFrame:](&v53, "initWithFrame:", 0.0, 0.0, 147.0, 180.0);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHCarPlayInCallDialerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init(PHCarPlayInCallDialerLCDView);
    -[PHAbstractDialerView setLcdView:](v3, "setLcdView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    objc_msgSend(v6, "setDelegate:", v3);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = [PHCarPlayNumberPad alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerView traitCollection](v3, "traitCollection"));
    v10 = -[PHCarPlayNumberPad initWithUserInterfaceStyle:](v8, "initWithUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    -[PHAbstractDialerView setPhonePadView:](v3, "setPhonePadView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v14, "frame");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v17, "setFrame:", 0.0, 52.0, v13, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v19, "setPlaysSounds:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v21, "setBackgroundColor:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    objc_msgSend(v22, "setOpaque:", 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    -[PHCarPlayInCallDialerView addSubview:](v3, "addSubview:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    -[PHCarPlayInCallDialerView addSubview:](v3, "addSubview:", v24);

    v25 = objc_alloc_init((Class)UILayoutGuide);
    -[PHCarPlayInCallDialerView addLayoutGuide:](v3, "addLayoutGuide:", v25);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerView topAnchor](v3, "topAnchor"));
    +[PHCarPlayInCallKeypadViewController fakeNavigationBarHeight](PHCarPlayInCallKeypadViewController, "fakeNavigationBarHeight");
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v48));
    v55[0] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerView bottomAnchor](v3, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v26));
    v55[1] = v27;
    v52 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerView leadingAnchor](v3, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v55[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerView trailingAnchor](v3, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v55[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 9, 0, v3, 9, 1.0, 0.0));
    v54[0] = v49;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v3, "phonePadView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 10, 0, v52, 10, 1.0, 0.0));
    v54[1] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    LODWORD(v38) = 1148846080;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v37, 11, 0, v3, 3, 1.0, 30.0, v38));
    v54[2] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 7, 0, 0, 0, 1.0, 147.0));
    v54[3] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v3, "lcdView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 9, 0, v3, 9, 1.0, 0.0));
    v54[4] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 5));
    -[PHCarPlayInCallDialerView addConstraints:](v3, "addConstraints:", v44);

  }
  return v3;
}

@end
