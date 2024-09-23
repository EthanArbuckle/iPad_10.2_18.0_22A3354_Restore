@implementation LUIUserSwitchTestOngoingIndicatorController

- (LUIUserSwitchTestOngoingIndicatorController)initWithCancelButtonAction:(id)a3
{
  id v4;
  LUIUserSwitchTestOngoingIndicatorController *v5;
  id v6;
  id cancelButtonActionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LUIUserSwitchTestOngoingIndicatorController;
  v5 = -[LUIUserSwitchTestOngoingIndicatorController init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cancelButtonActionBlock = v5->_cancelButtonActionBlock;
    v5->_cancelButtonActionBlock = v6;

  }
  return v5;
}

- (void)show
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  -[LUIUserSwitchTestOngoingIndicatorController setBaseView:](self, "setBaseView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController baseView](self, "baseView"));
  -[LUIUserSwitchTestOngoingIndicatorController _moveElementsToView:](self, "_moveElementsToView:", v6);

  -[LUIUserSwitchTestOngoingIndicatorController _showIndicatorViewAnimated](self, "_showIndicatorViewAnimated");
}

- (void)hide
{
  void *v3;
  void (**v4)(void);
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController cancelButtonActionBlock](self, "cancelButtonActionBlock"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController cancelButtonActionBlock](self, "cancelButtonActionBlock"));
    v4[2]();

  }
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DDB8;
  v6[3] = &unk_100068C58;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DDEC;
  v5[3] = &unk_100069018;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.200000003);
}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DECC;
  v6[3] = &unk_100068C58;
  v6[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController cancelButtonActionBlock](self, "cancelButtonActionBlock"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController cancelButtonActionBlock](self, "cancelButtonActionBlock"));
    v5[2]();

  }
  else
  {
    -[LUIUserSwitchTestOngoingIndicatorController hide](self, "hide");
  }
}

- (LUIUserSwitchTestOngoingIndicatorView)indicatorView
{
  LUIUserSwitchTestOngoingIndicatorView *indicatorView;
  LUIUserSwitchTestOngoingIndicatorView *v4;
  LUIUserSwitchTestOngoingIndicatorView *v5;
  void *v6;

  indicatorView = self->_indicatorView;
  if (!indicatorView)
  {
    v4 = objc_opt_new(LUIUserSwitchTestOngoingIndicatorView);
    v5 = self->_indicatorView;
    self->_indicatorView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorView cancelButton](self->_indicatorView, "cancelButton"));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "cancelButtonTapped:", 64);

    indicatorView = self->_indicatorView;
  }
  return indicatorView;
}

- (void)_moveElementsToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v13, "setFrame:", v8, 60.0, v10, v12);

  objc_msgSend(v4, "center");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v16, "center");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v19, "setCenter:", v15, v18);

  v20 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorController indicatorView](self, "indicatorView"));
  objc_msgSend(v20, "setAutoresizingMask:", 37);

}

- (void)_showIndicatorViewAnimated
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000E10C;
  v2[3] = &unk_100068C58;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.200000003);
}

- (id)cancelButtonActionBlock
{
  return self->_cancelButtonActionBlock;
}

- (void)setCancelButtonActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIView)baseView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_baseView);
}

- (void)setBaseView:(id)a3
{
  objc_storeWeak((id *)&self->_baseView, a3);
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_destroyWeak((id *)&self->_baseView);
  objc_storeStrong(&self->_cancelButtonActionBlock, 0);
}

@end
