@implementation SUSUIPasscodeEntryView

- (SUSUIPasscodeEntryView)initWithFrame:(CGRect)a3
{
  id v3;
  UIView *v4;
  UIView *containerView;
  _UIBackdropView *v6;
  _UIBackdropView *blurView;
  SBUIPasscodeLockView *v8;
  SBUIPasscodeLockView *passcodeView;
  SUSUIPasscodeEntryView *v11;
  id v12;
  SBUIPasscodeLockView *v13;
  id v14;
  SBUIPasscodeLockView *v15;
  id v16;
  uint64_t v17;
  objc_super v18;
  SEL v19;
  SUSUIPasscodeEntryView *v20;
  CGRect v21;

  v21 = a3;
  v19 = a2;
  v20 = 0;
  v18.receiver = self;
  v18.super_class = (Class)SUSUIPasscodeEntryView;
  v20 = -[SUSUIPasscodeEntryView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    v3 = objc_alloc((Class)UIView);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    containerView = v20->_containerView;
    v20->_containerView = v4;

    -[UIView setAutoresizingMask:](v20->_containerView, "setAutoresizingMask:");
    -[UIView setBackgroundColor:](v20->_containerView, "setBackgroundColor:");
    -[SUSUIPasscodeEntryView addSubview:](v20, "addSubview:", v20->_containerView);
    v17 = 2030;
    v6 = (_UIBackdropView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2030);
    blurView = v20->_blurView;
    v20->_blurView = v6;

    -[_UIBackdropView setAutoresizingMask:](v20->_blurView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v20->_containerView, "addSubview:", v20->_blurView);
    v8 = (SBUIPasscodeLockView *)-[SUSUIPasscodeEntryView createPasscodeView](v20, "createPasscodeView");
    passcodeView = v20->_passcodeView;
    v20->_passcodeView = v8;

    v12 = +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", v17);
    v16 = objc_msgSend(v12, "combinedTintColor");

    -[SBUIPasscodeLockView setAutoresizingMask:](v20->_passcodeView, "setAutoresizingMask:", 18);
    v13 = v20->_passcodeView;
    v14 = objc_msgSend(v16, "colorWithAlphaComponent:", 1.0);
    -[SBUIPasscodeLockView setCustomBackgroundColor:](v13, "setCustomBackgroundColor:");

    -[SBUIPasscodeLockView setShowsEmergencyCallButton:](v20->_passcodeView, "setShowsEmergencyCallButton:", 0);
    v15 = v20->_passcodeView;
    objc_msgSend(v16, "alphaComponent");
    -[SBUIPasscodeLockView setBackgroundAlpha:](v15, "setBackgroundAlpha:");
    -[UIView addSubview:](v20->_containerView, "addSubview:", v20->_passcodeView);
    -[UIView setAlpha:](v20->_containerView, "setAlpha:", 0.0);
    objc_storeStrong(&v16, 0);
  }
  v11 = v20;
  objc_storeStrong((id *)&v20, 0);
  return v11;
}

- (void)setPasscodeViewsToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  void **v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  SUSUIPasscodeEntryView *v10;
  id v11;
  BOOL v12;
  void **v13;
  int v14;
  int v15;
  id (*v16)(uint64_t);
  void *v17;
  SUSUIPasscodeEntryView *v18;
  BOOL v19;
  id location;
  BOOL v21;
  BOOL v22;
  SEL v23;
  SUSUIPasscodeEntryView *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v24->_dismissing = !v22;
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_100004B34;
  v17 = &unk_100014690;
  v18 = v24;
  v19 = v22;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100004B8C;
  v9 = &unk_1000146B8;
  v10 = v24;
  v12 = v22;
  v11 = location;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v13, 0.4);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&location, 0);
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SUSUIPasscodeEntryView bounds](self, "bounds");
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  -[_UIBackdropView setFrame:](self->_blurView, "setFrame:", v2, v3, v4, v5);
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:", v6, v7, v8, v9);
}

- (id)createPasscodeView
{
  return +[SBUIPasscodeLockViewFactory passcodeLockViewForUsersCurrentStyle](SBUIPasscodeLockViewFactory, "passcodeLockViewForUsersCurrentStyle", a2, self);
}

- (SBUIPasscodeLockView)passcodeLockView
{
  return self->_passcodeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
