@implementation PBADataRecoveryErrorViewController

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v17 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PREBOARD_RECOVERY_GIVE_UP")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_100018D78, CFSTR("PreBoard")));
  objc_msgSend(v7, "setText:", v10);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v17, "addSubview:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -20.0));
  objc_msgSend(v16, "setActive:", 1);

  -[PBADataRecoveryErrorViewController setView:](self, "setView:", v17);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
