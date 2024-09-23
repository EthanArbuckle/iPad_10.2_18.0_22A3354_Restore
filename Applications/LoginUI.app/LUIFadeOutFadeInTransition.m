@implementation LUIFadeOutFadeInTransition

- (LUIFadeOutFadeInTransition)initWithWallpaperVariant:(int64_t)a3 backgroundStyle:(int64_t)a4
{
  LUIFadeOutFadeInTransition *v6;
  UIView *v7;
  void *v8;
  UIView *blackView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LUIFadeOutFadeInTransition;
  v6 = -[LUIFadeOutFadeInTransition init](&v11, "init");
  if (v6)
  {
    v7 = (UIView *)objc_alloc_init((Class)UIView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UIView setOpaque:](v7, "setOpaque:", 0);
    blackView = v6->_blackView;
    v6->_blackView = v7;

    v6->_backgroundStyle = a4;
    v6->_wallpaperVariant = a3;
  }
  return v6;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  LUIFadeOutFadeInTransition *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIFadeOutFadeInTransition blackView](self, "blackView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v7, "addSubview:", v8);
  -[LUIFadeOutFadeInTransition transitionDuration:](self, "transitionDuration:", v4);
  v11 = v10 * 0.5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007EC4;
  v23[3] = &unk_100068C30;
  v24 = v5;
  v25 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100007F04;
  v17[3] = &unk_100068EB8;
  v18 = v7;
  v19 = v6;
  v20 = self;
  v21 = v4;
  v22 = v25;
  v12 = v25;
  v13 = v4;
  v14 = v6;
  v15 = v7;
  v16 = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v23, v17, v11);

}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (UIView)blackView
{
  return (UIView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBlackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (void)setWallpaperVariant:(int64_t)a3
{
  self->_wallpaperVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackView, 0);
}

@end
