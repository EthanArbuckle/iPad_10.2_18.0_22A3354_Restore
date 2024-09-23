@implementation PBAPasscodeEntryViewController

- (PBAPasscodeEntryViewController)initWithLightBackground:(BOOL)a3
{
  PBAPasscodeEntryViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBAPasscodeEntryViewController;
  result = -[PBAPasscodeEntryViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0, 0);
  if (result)
    result->_useLightBackground = a3;
  return result;
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    -[PBAPasscodeEntryViewController _updatePasscodeStatusTextAnimated:](self, "_updatePasscodeStatusTextAnimated:", 1);
  }

}

- (void)setSubtitleText:(id)a3
{
  NSString *v4;
  NSString *subtitleText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    subtitleText = self->_subtitleText;
    self->_subtitleText = v4;

    -[PBAPasscodeEntryViewController _updatePasscodeStatusTextAnimated:](self, "_updatePasscodeStatusTextAnimated:", 1);
  }

}

- (void)setTitleText:(id)a3 subtitleText:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSString *v9;
  NSString *titleText;
  NSString *v11;
  NSString *subtitleText;

  v5 = a5;
  v8 = a4;
  v9 = (NSString *)objc_msgSend(a3, "copy");
  titleText = self->_titleText;
  self->_titleText = v9;

  v11 = (NSString *)objc_msgSend(v8, "copy");
  subtitleText = self->_subtitleText;
  self->_subtitleText = v11;

  -[PBAPasscodeEntryViewController _updatePasscodeStatusTextAnimated:](self, "_updatePasscodeStatusTextAnimated:", v5);
}

- (void)resetPasscodeEntryFieldForFailure:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAPasscodeEntryViewController passcodeLockView](self, "passcodeLockView"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "resetForFailedPasscode");
  else
    objc_msgSend(v4, "resetForSuccess");

}

- (void)loadView
{
  SBUIPasscodeLockView *v3;
  SBUIPasscodeLockView *passcodeLockView;
  SBUIPasscodeLockView *v5;
  void *v6;
  SBUIPasscodeLockView *v7;
  uint64_t v8;
  SBUIPasscodeLockView *v9;
  SBUIPasscodeLockView *v10;
  SBUIPasscodeLockView *v11;
  SBUIPasscodeLockView *v12;
  SBUIPasscodeLockView *v13;
  SBUIPasscodeLockView *v14;
  void *v15;
  SBUIPasscodeLockView *v16;
  SBUIPasscodeLockView *v17;
  SBUIPasscodeLockView *v18;
  void *v19;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v3 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory lightPasscodeLockViewForUsersCurrentStyle](SBUIPasscodeLockViewFactory, "lightPasscodeLockViewForUsersCurrentStyle"));
    passcodeLockView = self->_passcodeLockView;
    self->_passcodeLockView = v3;

    v5 = self->_passcodeLockView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.65, 1.0));
    -[SBUIPasscodeLockView setCustomBackgroundColor:](v5, "setCustomBackgroundColor:", v6);

    v7 = self->_passcodeLockView;
    v8 = objc_opt_class(SBUIPasscodeLockViewWithKeypad);
    v9 = v7;
    v10 = v9;
    if (v8)
    {
      if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v14 = v11;

    v13 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(-[SBUIPasscodeLockView _numberPad](v14, "_numberPad"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[SBUIPasscodeLockView setReduceTransparencyButtonColor:](v13, "setReduceTransparencyButtonColor:", v15);

  }
  else if (self->_useLightBackground)
  {
    v12 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory lightPasscodeLockViewForUsersCurrentStyle](SBUIPasscodeLockViewFactory, "lightPasscodeLockViewForUsersCurrentStyle"));
    v13 = self->_passcodeLockView;
    self->_passcodeLockView = v12;
  }
  else
  {
    v16 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory passcodeLockViewForUsersCurrentStyle](SBUIPasscodeLockViewFactory, "passcodeLockViewForUsersCurrentStyle"));
    v17 = self->_passcodeLockView;
    self->_passcodeLockView = v16;

    v18 = self->_passcodeLockView;
    v13 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2030));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIPasscodeLockView combinedTintColor](v13, "combinedTintColor"));
    -[SBUIPasscodeLockView setCustomBackgroundColor:](v18, "setCustomBackgroundColor:", v19);

  }
  -[SBUIPasscodeLockView setDelegate:](self->_passcodeLockView, "setDelegate:", self);
  -[SBUIPasscodeLockView setShowsEmergencyCallButton:](self->_passcodeLockView, "setShowsEmergencyCallButton:", 0);
  -[SBUIPasscodeLockView setBiometricAuthenticationAllowed:](self->_passcodeLockView, "setBiometricAuthenticationAllowed:", 0);
  -[PBAPasscodeEntryViewController setView:](self, "setView:", self->_passcodeLockView);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBAPasscodeEntryViewController;
  -[PBAPasscodeEntryViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_homeButtonPressed:");
  objc_msgSend(v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  objc_msgSend(v3, "setAllowedPressTypes:", &off_1000194D8);
  objc_msgSend(v3, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v3, "setCancelsTouchesInView:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAPasscodeEntryViewController view](self, "view"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBAPasscodeEntryViewController;
  -[PBAPasscodeEntryViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBAPasscodeEntryViewController;
  -[PBAPasscodeEntryViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAPasscodeEntryViewController view](self, "view"));
  objc_msgSend(v5, "becomeFirstResponder");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updatePasscodeStatusTextAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PBAPasscodeEntryViewController passcodeLockView](self, "passcodeLockView"));
  objc_msgSend(v5, "updateStatusText:subtitle:animated:", self->_titleText, self->_subtitleText, v3);

}

- (void)_homeButtonPressed:(id)a3
{
  -[PBAPasscodeEntryViewController _userRequestedDismissal](self, "_userRequestedDismissal", a3);
}

- (void)_userCancelledEntry
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "passcodeEntryViewControllerEntryCancelled:") & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeEntryViewControllerEntryCancelled:", self);

}

- (void)_userRequestedDismissal
{
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBUIPasscodeLockView passcode](self->_passcodeLockView, "passcode"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[PBAPasscodeEntryViewController _userCancelledEntry](self, "_userCancelledEntry");
  if ((objc_opt_respondsToSelector(WeakRetained, "passcodeEntryViewControllerCancelButtonPressed:") & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeEntryViewControllerCancelButtonPressed:", self);

}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  PBAPasscodeEntryViewControllerDelegate **p_delegate;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "passcode"));

  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "passcodeEntryViewControllerEntryBegan:") & 1) != 0)
      objc_msgSend(WeakRetained, "passcodeEntryViewControllerEntryBegan:", self);
  }
  else
  {
    -[PBAPasscodeEntryViewController _userCancelledEntry](self, "_userCancelledEntry");
  }

}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "passcodeEntryViewControllerEntryCompleted:passcode:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    objc_msgSend(WeakRetained, "passcodeEntryViewControllerEntryCompleted:passcode:", self, v6);

  }
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  -[PBAPasscodeEntryViewController _userRequestedDismissal](self, "_userRequestedDismissal", a3);
}

- (PBAPasscodeEntryViewControllerDelegate)delegate
{
  return (PBAPasscodeEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeLockView, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
