@implementation PasscodeContentViewControllerFullScreen

- (PasscodeContentViewControllerFullScreen)initWithPasscode:(id)a3 options:(id)a4
{
  id v6;
  PasscodeContentViewControllerFullScreen *v7;
  PasscodeContentViewBackground *v8;
  PasscodeContentViewBackground *background;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PasscodeContentViewControllerFullScreen;
  v7 = -[PasscodeContentViewControllerFullScreen init](&v11, "init");
  if (v7)
  {
    v8 = objc_alloc_init(PasscodeContentViewBackground);
    background = v7->_background;
    v7->_background = v8;

    objc_storeStrong((id *)&v7->_passcode, a3);
  }

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init((Class)UIView);
  -[PasscodeContentViewControllerFullScreen setView:](self, "setView:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (BOOL)becomeFirstResponder
{
  return -[SBUIPasscodeLockView becomeFirstResponder](self->_passcodeView, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PasscodeContentViewControllerFullScreen;
  -[PasscodeContentViewControllerFullScreen resignFirstResponder](&v4, "resignFirstResponder");
  return -[SBUIPasscodeLockView resignFirstResponder](self->_passcodeView, "resignFirstResponder");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setState:(id)a3
{
  PasscodeViewState *v5;
  PasscodeViewState *v6;
  int64_t v7;
  PasscodeViewState *v8;

  v5 = (PasscodeViewState *)a3;
  v6 = v5;
  if (self->_state != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_state, a3);
    v7 = -[PasscodeViewState rawValue](self->_state, "rawValue");
    if (v7 == 1)
    {
      -[PasscodeContentViewControllerFullScreen _showBackOffView](self, "_showBackOffView");
      goto LABEL_6;
    }
    v6 = v8;
    if (!v7)
    {
      -[PasscodeContentViewControllerFullScreen _showPasscodeView](self, "_showPasscodeView");
LABEL_6:
      v6 = v8;
    }
  }

}

- (NSString)passcode
{
  return (NSString *)-[SBUIPasscodeLockView passcode](self->_passcodeView, "passcode");
}

- (void)animateToSucessStateWithCompletion:(id)a3
{
  SBUIPasscodeLockView *passcodeView;

  passcodeView = self->_passcodeView;
  if (passcodeView)
    -[SBUIPasscodeLockView autofillForSuccessfulMesaAttemptWithCompletion:](passcodeView, "autofillForSuccessfulMesaAttemptWithCompletion:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)animateToFailureStateWithCompletion:(id)a3
{
  SBUIPasscodeLockView *passcodeView;
  void (**v4)(void);

  passcodeView = self->_passcodeView;
  v4 = (void (**)(void))a3;
  -[SBUIPasscodeLockView resetForFailedPasscode](passcodeView, "resetForFailedPasscode");
  v4[2]();

}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewPasscodeDidChange:", self);

}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewPasscodeEntered:", self);

}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewCancelButtonPressed:", self);

}

- (void)passcodeBackOffViewCanceled:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewCancelButtonPressed:", self);

}

- (void)_showPasscodeView
{
  SBUIPasscodeLockView *WeakRetained;
  SBUIPasscodeLockView *passcodeView;
  PasscodeActiveViewFactory *v5;
  Passcode *passcode;
  void *v7;
  SBUIPasscodeLockView *v8;
  SBUIPasscodeLockView *v9;
  SBUIPasscodeLockView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBUIPasscodeLockView *v15;
  void *v16;
  SBUIPasscodeLockView *v17;
  void *v18;
  PasscodeContentViewBackground *background;
  void *v20;

  WeakRetained = (SBUIPasscodeLockView *)objc_loadWeakRetained((id *)&self->_contentView);
  passcodeView = self->_passcodeView;

  v5 = objc_alloc_init(PasscodeActiveViewFactory);
  passcode = self->_passcode;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState style](self->_state, "style"));
  v8 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(-[PasscodeActiveViewFactory passcodeViewForPasscode:style:](v5, "passcodeViewForPasscode:style:", passcode, v7));
  v9 = self->_passcodeView;
  self->_passcodeView = v8;

  -[SBUIPasscodeLockView setDelegate:](self->_passcodeView, "setDelegate:", self);
  -[PasscodeContentViewControllerFullScreen _embedSubview:](self, "_embedSubview:", self->_passcodeView);
  v10 = self->_passcodeView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState title](self->_state, "title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState subtitle](self->_state, "subtitle"));
  -[SBUIPasscodeLockView updateStatusText:subtitle:animated:](v10, "updateStatusText:subtitle:animated:", v11, v12, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self->_state, "accessoryView"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self->_state, "accessoryView"));
    objc_msgSend(v14, "removeFromSuperview");

    v15 = self->_passcodeView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self->_state, "accessoryView"));
    -[SBUIPasscodeLockView addSubview:](v15, "addSubview:", v16);

    v17 = self->_passcodeView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self->_state, "accessoryView"));
    -[SBUIPasscodeLockView bringSubviewToFront:](v17, "bringSubviewToFront:", v18);

  }
  background = self->_background;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState style](self->_state, "style"));
  -[PasscodeContentViewBackground applyBackgroundForStyle:toView:](background, "applyBackgroundForStyle:toView:", v20, self->_passcodeView);

  -[PasscodeContentViewControllerFullScreen _setContentView:animated:withCompletion:](self, "_setContentView:animated:withCompletion:", self->_passcodeView, WeakRetained != passcodeView, &stru_1000799C0);
}

- (void)_showBackOffView
{
  PasscodeBackOffView *WeakRetained;
  PasscodeBackOffView *backOffView;
  PasscodeBackOffView *v5;
  PasscodeBackOffView *v6;
  PasscodeBackOffView *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  PasscodeContentViewBackground *background;
  void *v13;

  WeakRetained = (PasscodeBackOffView *)objc_loadWeakRetained((id *)&self->_contentView);
  backOffView = self->_backOffView;

  v5 = self->_backOffView;
  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init(PasscodeBackOffView);
  v7 = self->_backOffView;
  self->_backOffView = v6;

  v8 = WeakRetained != backOffView;
  -[PasscodeBackOffView setDelegate:](self->_backOffView, "setDelegate:", self);
  -[PasscodeContentViewControllerFullScreen _embedSubview:](self, "_embedSubview:", self->_backOffView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState style](self->_state, "style"));
  -[PasscodeBackOffView setHasWhiteBackground:](self->_backOffView, "setHasWhiteBackground:", objc_msgSend(v9, "rawValue") == (id)1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState title](self->_state, "title"));
  -[PasscodeBackOffView setTitle:](self->_backOffView, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState subtitle](self->_state, "subtitle"));
  -[PasscodeBackOffView setSubtitle:](self->_backOffView, "setSubtitle:", v11);

  background = self->_background;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState style](self->_state, "style"));
  -[PasscodeContentViewBackground applyBackgroundForStyle:toView:](background, "applyBackgroundForStyle:toView:", v13, self->_backOffView);

  -[PasscodeContentViewControllerFullScreen _setContentView:animated:withCompletion:](self, "_setContentView:animated:withCompletion:", self->_backOffView, v8, &stru_1000799E0);
}

- (void)_setContentView:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  double v11;
  id v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained == v8)
  {
    v9[2](v9);
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_100006BC4;
    v22 = sub_100006BD4;
    v23 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_storeWeak((id *)&self->_contentView, v8);
    objc_msgSend(v8, "setAlpha:", 0.0);
    -[PasscodeContentViewControllerFullScreen _embedSubview:](self, "_embedSubview:", v8);
    v11 = 0.0;
    if (v6)
    {
      if (v19[5])
        v11 = 0.5;
      else
        v11 = 0.01;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006BDC;
    v16[3] = &unk_100079A08;
    v12 = v8;
    v17 = v12;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006BE8;
    v13[3] = &unk_100079A30;
    v15 = &v18;
    v14 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v16, v13, v11, 0.0);
    objc_msgSend(v12, "becomeFirstResponder");

    _Block_object_dispose(&v18, 8);
  }

}

- (void)_embedSubview:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeContentViewControllerFullScreen view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v4, "layoutIfNeeded");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
}

- (PasscodeViewState)state
{
  return self->_state;
}

- (PasscodeViewDelegate)delegate
{
  return (PasscodeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_backOffView, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
