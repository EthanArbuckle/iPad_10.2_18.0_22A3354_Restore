@implementation AirPlayProxCardViewController

- (AirPlayProxCardViewController)initWithTitle:(id)a3 subTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 shouldAnimate:(BOOL)a7 actionTitle:(id)a8 bottomSubtitle:(id)a9 completion:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AirPlayProxCardViewController *v22;
  AirPlayProxCardViewController *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
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
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  objc_super v56;
  _QWORD v57[3];

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v53 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v56.receiver = self;
  v56.super_class = (Class)AirPlayProxCardViewController;
  v22 = -[AirPlayProxCardViewController initWithContentView:](&v56, "initWithContentView:", 0);
  v23 = v22;
  if (!v22)
    goto LABEL_16;
  -[AirPlayProxCardViewController setTitle:](v22, "setTitle:", v16);
  -[AirPlayProxCardViewController setSubtitle:](v23, "setSubtitle:", v17);
  -[AirPlayProxCardViewController setDismissalType:](v23, "setDismissalType:", 3);
  -[AirPlayProxCardViewController setShouldAnimate:](v23, "setShouldAnimate:", v11);
  -[AirPlayProxCardViewController setBottomTrayTitle:](v23, "setBottomTrayTitle:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 96.0));
  v25 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v18, v24));
  v26 = (void *)v25;
  if (v25)
  {
    v45 = v24;
    v46 = v21;
    v47 = v20;
    v48 = v19;
    v49 = v18;
    v50 = v17;
    v51 = v16;
    v52 = (void *)v25;
    v27 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v53)
      objc_msgSend(v27, "setTintColor:", v53);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AirPlayProxCardViewController contentView](v23, "contentView"));
    objc_msgSend(v28, "addSubview:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AirPlayProxCardViewController contentView](v23, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mainContentGuide"));

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:", v43));
    v57[0] = v42;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v57[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerXAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    v57[2] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    v17 = v50;
    v16 = v51;
    v19 = v48;
    v18 = v49;
    v21 = v46;
    v20 = v47;
    v24 = v45;
LABEL_6:
    v26 = v52;
    if (dword_10001EBD8 <= 50
      && (dword_10001EBD8 != -1 || _LogCategory_Initialize(&dword_10001EBD8, 33554482)))
    {
      LogPrintF(&dword_10001EBD8, "-[AirPlayProxCardViewController initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:]", 33554482, "[%{ptr}] Initialize proxCard with title: %@", v23, v16);
    }
    goto LABEL_13;
  }
  if (dword_10001EBD8 <= 90)
  {
    v52 = 0;
    if (dword_10001EBD8 != -1 || _LogCategory_Initialize(&dword_10001EBD8, 33554522))
      LogPrintF(&dword_10001EBD8, "-[AirPlayProxCardViewController initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:]", 33554522, "[%{ptr}] Error creating image with name %@", v23, v18);
    goto LABEL_6;
  }
LABEL_13:
  if (v21)
  {
    v38 = v26;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100006BF4;
    v54[3] = &unk_100018748;
    v55 = v21;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v19, 0, v54));
    v40 = -[AirPlayProxCardViewController addAction:](v23, "addAction:", v39);

    v26 = v38;
  }

LABEL_16:
  return v23;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)AirPlayProxCardViewController;
  -[AirPlayProxCardViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  if (-[AirPlayProxCardViewController shouldAnimate](self, "shouldAnimate"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSymbolScaleEffect scaleUpEffect](NSSymbolScaleEffect, "scaleUpEffect"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirPlayProxCardViewController contentView](self, "contentView", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
          v12 = objc_opt_class(UIImageView);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
            objc_msgSend(v11, "addSymbolEffect:", v4);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

@end
