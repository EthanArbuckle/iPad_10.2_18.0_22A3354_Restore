@implementation TouchIdViewControllerWithCoachings

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewControllerWithCoachings viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  -[TouchIdViewControllerWithCoachings _updateUI](self, "_updateUI");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewControllerWithCoachings viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[TouchIdViewControllerWithCoachings _updateUI](self, "_updateUI");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewControllerWithCoachings willTransitionToTraitCollection:withTransitionCoordinator:](&v6, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewControllerWithCoachings traitCollection](self, "traitCollection"));
  -[LAUIPhysicalButtonView setStyle:](self->_coachingView, "setStyle:", objc_msgSend(v5, "userInterfaceStyle") == (id)2);

}

- (void)_setupUI
{
  objc_super v3;

  -[TouchIdViewControllerWithCoachings _setupCoachingView](self, "_setupCoachingView");
  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewController _setupUI](&v3, "_setupUI");
}

- (void)_configureUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewController _configureUI](&v3, "_configureUI");
  -[LAUIPhysicalButtonView setIsInstructionHidden:](self->_coachingView, "setIsInstructionHidden:", -[TouchIdViewController _isSensorActive](self, "_isSensorActive") ^ 1);
}

- (void)_presentUI:(id)a3
{
  objc_super v4;
  _QWORD v5[5];

  -[TouchIdViewControllerWithCoachings _setupDimming](self, "_setupDimming", a3);
  v5[1] = 3221225472;
  v5[2] = sub_10000FEF8;
  v5[3] = &unk_100079A08;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)TouchIdViewControllerWithCoachings;
  v5[0] = _NSConcreteStackBlock;
  -[TouchIdViewController _presentUI:](&v4, "_presentUI:", v5);
}

- (void)_dismissUIWithCompletionHandler:(id)a3
{
  LAUIPhysicalButtonView *coachingView;
  id v5;
  objc_super v6;

  coachingView = self->_coachingView;
  v5 = a3;
  -[LAUIPhysicalButtonView removeFromSuperview](coachingView, "removeFromSuperview");
  v6.receiver = self;
  v6.super_class = (Class)TouchIdViewControllerWithCoachings;
  -[TouchIdViewController _dismissUIWithCompletionHandler:](&v6, "_dismissUIWithCompletionHandler:", v5);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_setupCoachingView
{
  LAUIPhysicalButtonView *v3;
  LAUIPhysicalButtonView *coachingView;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;

  v3 = (LAUIPhysicalButtonView *)objc_msgSend(objc_alloc((Class)LAUIPhysicalButtonView), "initWithStyle:", 1);
  coachingView = self->_coachingView;
  self->_coachingView = v3;

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID"), &stru_10007CCD0, CFSTR("MobileUI")));
  -[LAUIPhysicalButtonView setInstruction:](self->_coachingView, "setInstruction:", v8);

  -[LAUIPhysicalButtonView setAnimationStyle:](self->_coachingView, "setAnimationStyle:", 2);
  -[LAUIPhysicalButtonView setAnimating:](self->_coachingView, "setAnimating:", 1);
}

- (void)_setupDimming
{
  double v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001010C;
  v6[3] = &unk_100079EC8;
  v6[4] = self;
  v3 = sub_10001010C((uint64_t)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewController dimmingView](self, "dimmingView"));
  objc_msgSend(v4, "setDimLevel:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TouchIdViewController dimmingView](self, "dimmingView"));
  objc_msgSend(v5, "setDimEnabled:", 1);

}

- (void)_updateUI
{
  _QWORD block[5];

  -[LAUIPhysicalButtonView setAnimating:](self->_coachingView, "setAnimating:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000101E8;
  block[3] = &unk_100079A08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingView, 0);
}

@end
