@implementation ProxCardKitTestEndViewController

- (ProxCardKitTestEndViewController)init
{
  ProxCardKitTestEndViewController *v2;
  ProxCardKitTestEndViewController *v3;
  ProxCardKitTestEndViewController *v4;
  void *v5;
  id v6;
  ProxCardKitTestEndViewController *v7;
  _QWORD v9[4];
  ProxCardKitTestEndViewController *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ProxCardKitTestEndViewController;
  v2 = -[ProxCardKitTestEndViewController init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    -[ProxCardKitTestEndViewController setTitle:](v2, "setTitle:", CFSTR("ProxCardKit Test"));
    -[ProxCardKitTestEndViewController setDismissalType:](v3, "setDismissalType:", 2);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010AA8C;
    v9[3] = &unk_10017DA08;
    v4 = v3;
    v10 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Done"), 0, v9));
    v6 = -[ProxCardKitTestEndViewController addAction:](v4, "addAction:", v5);

    v7 = v4;
  }

  return v3;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];

  v24.receiver = self;
  v24.super_class = (Class)ProxCardKitTestEndViewController;
  -[ProxCardKitTestEndViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.seal.fill")));
  v5 = objc_msgSend(v3, "initWithImage:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 72.0));
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestEndViewController contentView](self, "contentView"));
  objc_msgSend(v8, "addSubview:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestEndViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainContentGuide"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v22));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v19));
  v25[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v25[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v25[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

@end
