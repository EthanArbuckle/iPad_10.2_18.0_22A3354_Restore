@implementation STRestrictionsPINNavigationController

+ (BOOL)st_shouldAnimate
{
  return objc_msgSend(a1, "st_isPad") ^ 1;
}

- (void)viewWillLayoutSubviews
{
  CGRect v3;

  -[STRestrictionsPINNavigationController lastKnownSuperviewFrame](self, "lastKnownSuperviewFrame");
  if (CGRectGetWidth(v3) == 0.0)
    -[STRestrictionsPINNavigationController _adjustToSuperviewFrame](self, "_adjustToSuperviewFrame");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  v5 = a4;
  -[STRestrictionsPINNavigationController setPrefersStatusBarHiddenOverride:](self, "setPrefersStatusBarHiddenOverride:", 1);
  -[STRestrictionsPINNavigationController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STRestrictionsPINNavigationController view](self, "view"));
  objc_msgSend(v6, "frame");
  v11.receiver = self;
  v11.super_class = (Class)STRestrictionsPINNavigationController;
  -[STRestrictionsPINNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v5, v7, v8);

  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004DA8;
  v10[3] = &unk_100008450;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004DB0;
  v9[3] = &unk_100008450;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v10, v9);

}

- (BOOL)prefersStatusBarHidden
{
  objc_super v4;

  if (-[STRestrictionsPINNavigationController prefersStatusBarHiddenOverride](self, "prefersStatusBarHiddenOverride"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STRestrictionsPINNavigationController;
  return -[STRestrictionsPINNavigationController prefersStatusBarHidden](&v4, "prefersStatusBarHidden");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_opt_class(self), "st_isPad"))
    return -[STRestrictionsPINNavigationController internalSupportedOrientations](self, "internalSupportedOrientations");
  else
    return 26;
}

+ (BOOL)st_isPad
{
  if (qword_10000D340 != -1)
    dispatch_once(&qword_10000D340, &stru_100008470);
  return byte_10000D348;
}

- (void)_adjustToSuperviewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat v13;
  CGFloat MidY;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[STRestrictionsPINNavigationController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[STRestrictionsPINNavigationController lastKnownSuperviewFrame](self, "lastKnownSuperviewFrame");
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(v17, v20))
  {
    -[STRestrictionsPINNavigationController setLastKnownSuperviewFrame:](self, "setLastKnownSuperviewFrame:", v5, v7, v9, v11);
    if (objc_msgSend((id)objc_opt_class(self), "st_isPad"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
      objc_msgSend(v12, "setCornerRadius:", 10.0);

      objc_msgSend(v16, "setClipsToBounds:", 1);
      -[STRestrictionsPINNavigationController _freezeSupportedOrientations](self, "_freezeSupportedOrientations");
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      v13 = CGRectGetMidX(v18) + -160.0;
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      MidY = CGRectGetMidY(v19);
      v15 = v16;
      v7 = MidY + -240.0;
      v11 = 480.0;
      v9 = 320.0;
      v5 = v13;
    }
    else
    {
      v15 = v16;
    }
    objc_msgSend(v15, "setFrame:", v5, v7, v9, v11);
  }

}

- (void)_freezeSupportedOrientations
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STRestrictionsPINNavigationController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (char *)objc_msgSend(v5, "interfaceOrientation");

  if ((unint64_t)(v6 - 2) > 2)
    v7 = 2;
  else
    v7 = qword_100006400[(_QWORD)(v6 - 2)];
  -[STRestrictionsPINNavigationController setInternalSupportedOrientations:](self, "setInternalSupportedOrientations:", v7);
}

- (unint64_t)internalSupportedOrientations
{
  return self->_internalSupportedOrientations;
}

- (void)setInternalSupportedOrientations:(unint64_t)a3
{
  self->_internalSupportedOrientations = a3;
}

- (CGRect)lastKnownSuperviewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_lastKnownSuperviewFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setLastKnownSuperviewFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_lastKnownSuperviewFrame, &v3, 32, 1, 0);
}

- (BOOL)prefersStatusBarHiddenOverride
{
  return self->_prefersStatusBarHiddenOverride;
}

- (void)setPrefersStatusBarHiddenOverride:(BOOL)a3
{
  self->_prefersStatusBarHiddenOverride = a3;
}

@end
