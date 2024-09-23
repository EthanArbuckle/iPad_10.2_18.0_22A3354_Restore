@implementation RestoreFromComputerController

- (RestoreFromComputerController)init
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  void *v6;
  RestoreFromComputerController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_COMPUTER"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)RestoreFromComputerController;
  location = -[RestoreFromComputerController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v4, &stru_100284738, 0);
  objc_storeStrong(&location, location);

  if (location)
  {
    v5 = objc_alloc_init((Class)sub_1000B8A8C());
    v6 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v5;

    objc_msgSend(*((id *)location + 3), "setDelegate:", location);
    objc_msgSend(*((id *)location + 3), "registerForStatus");
  }
  v7 = (RestoreFromComputerController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)dealloc
{
  ATConnection *v2;
  ATConnection *v3;
  objc_super v4;
  SEL v5;
  RestoreFromComputerController *v6;

  v6 = self;
  v5 = a2;
  v2 = -[RestoreFromComputerController airTrafficConnection](self, "airTrafficConnection");
  -[ATConnection unregisterForStatus](v2, "unregisterForStatus");

  v3 = -[RestoreFromComputerController airTrafficConnection](v6, "airTrafficConnection");
  -[ATConnection setDelegate:](v3, "setDelegate:", 0);

  v4.receiver = v6;
  v4.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  id v2;
  UIImage *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *v19;
  NSArray *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  objc_super v29;
  SEL v30;
  RestoreFromComputerController *v31;
  _QWORD v32[5];

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController viewDidLoad](&v29, "viewDidLoad");
  v2 = objc_alloc((Class)UIImageView);
  v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ConnectToComputer"));
  location = objc_msgSend(v2, "initWithImage:", v3);

  objc_msgSend(location, "setContentMode:", 1);
  objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = -[RestoreFromComputerController contentView](v31, "contentView");
  objc_msgSend(v4, "addSubview:", location);

  v5 = objc_msgSend(location, "topAnchor");
  v6 = -[RestoreFromComputerController contentView](v31, "contentView");
  v7 = objc_msgSend(v6, "topAnchor");
  v8 = objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  -[RestoreFromComputerController setImageViewTopConstraint:](v31, "setImageViewTopConstraint:", v8);

  v9 = objc_msgSend(location, "heightAnchor");
  v10 = objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
  -[RestoreFromComputerController setImageViewHeightConstraint:](v31, "setImageViewHeightConstraint:", v10);

  v27 = -[RestoreFromComputerController contentView](v31, "contentView");
  v26 = objc_msgSend(v27, "trailingAnchor");
  v25 = objc_msgSend(location, "trailingAnchor");
  v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v32[0] = v24;
  v23 = -[RestoreFromComputerController contentView](v31, "contentView");
  v11 = objc_msgSend(v23, "bottomAnchor");
  v12 = objc_msgSend(location, "bottomAnchor");
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v32[1] = v13;
  v14 = -[RestoreFromComputerController contentView](v31, "contentView");
  v15 = objc_msgSend(v14, "leadingAnchor");
  v16 = objc_msgSend(location, "leadingAnchor");
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v32[2] = v17;
  v18 = -[RestoreFromComputerController imageViewTopConstraint](v31, "imageViewTopConstraint");
  v32[3] = v18;
  v19 = -[RestoreFromComputerController imageViewHeightConstraint](v31, "imageViewHeightConstraint");
  v32[4] = v19;
  v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 5);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  -[RestoreFromComputerController _updateImageViewHeight](v31, "_updateImageViewHeight");
  -[RestoreFromComputerController _updateImageViewPadding](v31, "_updateImageViewPadding");
  -[RestoreFromComputerController _updateHeaderForConnectedToComputer:animated:](v31, "_updateHeaderForConnectedToComputer:animated:", 0, 0);
  v21 = -[RestoreFromComputerController headerView](v31, "headerView");
  objc_msgSend(v21, "setAlpha:", 0.0);

  v22 = -[RestoreFromComputerController contentView](v31, "contentView");
  objc_msgSend(v22, "setAlpha:", 0.0);

  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, char);
  void *v8;
  RestoreFromComputerController *v9;
  void **v10;
  int v11;
  int v12;
  id (*v13)(uint64_t);
  void *v14;
  RestoreFromComputerController *v15;
  BOOL v16;
  SEL v17;
  RestoreFromComputerController *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000B91B4;
  v14 = &unk_100280730;
  v15 = self;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000B91DC;
  v8 = &unk_1002808D0;
  v9 = v18;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v10, &v4, 0.5);
  v3.receiver = v18;
  v3.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController viewDidAppear:](&v3, "viewDidAppear:", v16);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v15, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  RestoreFromComputerController *v9;
  BOOL v10;
  SEL v11;
  RestoreFromComputerController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000B93CC;
  v8 = &unk_100280730;
  v9 = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v4, 0.25);
  v3.receiver = v12;
  v3.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController viewWillDisappear:](&v3, "viewWillDisappear:", v10);
  objc_storeStrong((id *)&v9, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  RestoreFromComputerController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
  -[RestoreFromComputerController _updateImageViewHeight](v4, "_updateImageViewHeight");
  -[RestoreFromComputerController _updateImageViewPadding](v4, "_updateImageViewPadding");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  RestoreFromComputerController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)RestoreFromComputerController;
  -[RestoreFromComputerController traitCollectionDidChange:](&v3, "traitCollectionDidChange:", location[0]);
  -[RestoreFromComputerController _updateImageViewPadding](v5, "_updateImageViewPadding");
  objc_storeStrong(location, 0);
}

- (void)_updateImageViewHeight
{
  id v2;
  id v3;
  CGFloat v4;
  NSLayoutConstraint *v5;
  CGRect v7;

  v2 = -[RestoreFromComputerController navigationController](self, "navigationController");
  v3 = objc_msgSend(v2, "view");
  objc_msgSend(v3, "frame");
  v4 = CGRectGetHeight(v7) * 0.55;

  v5 = -[RestoreFromComputerController imageViewHeightConstraint](self, "imageViewHeightConstraint");
  -[NSLayoutConstraint setConstant:](v5, "setConstant:", v4);

}

- (void)_updateImageViewPadding
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  NSLayoutConstraint *v13;
  double v14;
  double v15;
  id v16;
  double MaxY;
  double v18;
  id v19;
  NSLayoutConstraint *v20;
  CGRect rect;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v29;

  v2 = -[RestoreFromComputerController view](self, "view");
  v3 = -[RestoreFromComputerController contentView](self, "contentView");
  objc_msgSend(v3, "frame");
  v24 = v4;
  v23 = v5;
  v26 = v6;
  v25 = v7;
  v8 = -[RestoreFromComputerController scrollView](self, "scrollView");
  objc_msgSend(v2, "convertRect:fromView:", v8, v23, v24, v25, v26);
  v27.origin.y = v9;
  v27.origin.x = v10;
  v27.size.height = v11;
  v27.size.width = v12;

  v13 = -[RestoreFromComputerController imageViewHeightConstraint](self, "imageViewHeightConstraint");
  -[NSLayoutConstraint constant](v13, "constant");
  v15 = v14;

  v22 = v15;
  v16 = -[RestoreFromComputerController view](self, "view");
  objc_msgSend(v16, "frame");
  rect = v29;
  MaxY = CGRectGetMaxY(v29);
  v18 = MaxY - CGRectGetMinY(v27) - v22;

  v19 = -[RestoreFromComputerController scrollView](self, "scrollView", v18, *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y, *(_QWORD *)&rect.size.width, *(_QWORD *)&rect.size.height);
  objc_msgSend(v19, "setScrollEnabled:", v18 < 0.0);

  v20 = -[RestoreFromComputerController imageViewTopConstraint](self, "imageViewTopConstraint", v18);
  if (v18 <= 0.0)
    -[NSLayoutConstraint setConstant:](v20, "setConstant:", 0.0);
  else
    -[NSLayoutConstraint setConstant:](v20, "setConstant:", v18);

}

- (void)_updateHeaderForConnectedToComputer:(BOOL)a3 animated:(BOOL)a4
{
  NSBundle *v4;
  NSString *v5;

  if (a3)
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("CONNECTED_TO_COMPUTER"), &stru_100284738, CFSTR("Localizable"));
  }
  else
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_COMPUTER"), &stru_100284738, CFSTR("Localizable"));
  }
  -[RestoreFromComputerController _setHeaderTitle:animated:](self, "_setHeaderTitle:animated:", v5, a4);

}

- (void)_setHeaderTitle:(id)a3 animated:(BOOL)a4
{
  NSString *v5;
  unsigned __int8 v6;
  id v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, char);
  void *v12;
  RestoreFromComputerController *v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  RestoreFromComputerController *v20;
  int v21;
  BOOL v22;
  id location[2];
  RestoreFromComputerController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v5 = -[RestoreFromComputerController headerTitle](v24, "headerTitle");
  v6 = -[NSString isEqualToString:](v5, "isEqualToString:", location[0]);

  if ((v6 & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    if (v22)
    {
      v15 = _NSConcreteStackBlock;
      v16 = -1073741824;
      v17 = 0;
      v18 = sub_1000B9ADC;
      v19 = &unk_100280730;
      v20 = v24;
      v8 = _NSConcreteStackBlock;
      v9 = -1073741824;
      v10 = 0;
      v11 = sub_1000B9B2C;
      v12 = &unk_100281AF8;
      v13 = v24;
      v14 = location[0];
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v15, &v8, 0.5);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong((id *)&v20, 0);
    }
    else
    {
      v7 = -[RestoreFromComputerController headerView](v24, "headerView");
      objc_msgSend(v7, "setTitle:", location[0]);

    }
    -[RestoreFromComputerController setHeaderTitle:](v24, "setHeaderTitle:", location[0]);
    v21 = 0;
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void **block;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13[3];
  id v14;
  id location[2];
  RestoreFromComputerController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = objc_msgSend(v14, "objectForKey:", CFSTR("ConnectedLibraries"));
  v6 = objc_msgSend(v5, "count");

  v13[2] = v6;
  v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1000B9DB4;
  v12 = &unk_100280BA8;
  v13[0] = v16;
  v13[1] = v6;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionWasInterrupted:(id)a3
{
  void *v3;
  void **v4;
  int v5;
  int v6;
  id (*v7)(uint64_t);
  void *v8;
  RestoreFromComputerController *v9;
  id location[2];
  RestoreFromComputerController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000B9EC0;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (ATConnection)airTrafficConnection
{
  return self->_airTrafficConnection;
}

- (void)setAirTrafficConnection:(id)a3
{
  objc_storeStrong((id *)&self->_airTrafficConnection, a3);
}

- (NSLayoutConstraint)imageViewTopConstraint
{
  return self->_imageViewTopConstraint;
}

- (void)setImageViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewTopConstraint, a3);
}

- (NSLayoutConstraint)imageViewHeightConstraint
{
  return self->_imageViewHeightConstraint;
}

- (void)setImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_airTrafficConnection, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
