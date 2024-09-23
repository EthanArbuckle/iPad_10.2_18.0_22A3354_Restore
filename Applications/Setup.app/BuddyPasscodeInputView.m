@implementation BuddyPasscodeInputView

- (void)setPasscode:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)passcode
{
  return 0;
}

- (id)passcodeField
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id v2;
  unsigned __int8 v3;

  v2 = -[BuddyPasscodeInputView passcodeField](self, "passcodeField", a2, self);
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3 & 1;
}

- (BOOL)isFirstResponder
{
  id v2;
  unsigned __int8 v3;

  v2 = -[BuddyPasscodeInputView passcodeField](self, "passcodeField", a2, self);
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  id v2;
  unsigned __int8 v3;
  objc_super v5;
  SEL v6;
  BuddyPasscodeInputView *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeInputView;
  -[BuddyPasscodeInputView resignFirstResponder](&v5, "resignFirstResponder");
  v2 = -[BuddyPasscodeInputView passcodeField](v7, "passcodeField");
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3 & 1;
}

- (void)shakePasscode
{
  double v2;
  double v3;
  double v4;
  double v5;
  CAMediaTimingFunction *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  NSNumber *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CAMediaTimingFunction *v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  NSNumber *v22;
  id v23;
  double v24;
  id location[3];
  id v26[2];
  id v27[3];

  v27[2] = self;
  v27[1] = (id)a2;
  v27[0] = self;
  v26[1] = (id)0x4052C00000000000;
  v26[0] = +[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x"));
  objc_msgSend(v26[0], "setMass:", 1.20000005);
  objc_msgSend(v26[0], "setStiffness:", 1200.0);
  objc_msgSend(v26[0], "setDamping:", 12.0);
  LODWORD(v2) = 1028389654;
  LODWORD(v3) = 990057071;
  LODWORD(v4) = 1059712716;
  LODWORD(v5) = 1.0;
  v6 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
  objc_msgSend(v26[0], "setTimingFunction:", v6);

  objc_msgSend(v26[0], "setDuration:", 0.666999996);
  objc_msgSend(v26[0], "setInitialVelocity:", 0.0);
  objc_msgSend(v26[0], "setFillMode:", kCAFillModeBackwards);
  v7 = objc_msgSend(v27[0], "layer");
  objc_msgSend(v7, "position");
  location[1] = v8;
  location[2] = v9;
  v10 = *(double *)&v8 + 75.0;
  *(float *)&v10 = v10;
  v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10);
  objc_msgSend(v26[0], "setFromValue:", v11);

  v12 = objc_msgSend(v27[0], "layer");
  objc_msgSend(v12, "addAnimation:forKey:", v26[0], CFSTR("spring"));

  location[0] = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position.x"));
  LODWORD(v13) = 1054276898;
  LODWORD(v14) = 0;
  LODWORD(v15) = 1058305108;
  LODWORD(v16) = 1.0;
  v17 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v13, v14, v15, v16);
  objc_msgSend(location[0], "setTimingFunction:", v17);

  objc_msgSend(location[0], "setDuration:", 0.100000001);
  objc_msgSend(location[0], "setFillMode:", kCAFillModeBackwards);
  v18 = objc_msgSend(v27[0], "layer");
  objc_msgSend(v18, "position");
  v24 = v19;
  v20 = v19 - 75.0;
  *(float *)&v20 = v20;
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20, *(_QWORD *)&v24, v21);
  objc_msgSend(location[0], "setFromValue:", v22);

  v23 = objc_msgSend(v27[0], "layer");
  objc_msgSend(v23, "addAnimation:forKey:", location[0], CFSTR("force"));

  objc_storeStrong(location, 0);
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, 0);
}

- (CGSize)intrinsicContentSize
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = -[BuddyPasscodeInputView passcodeField](self, "passcodeField");
  objc_msgSend(v2, "frame");
  v8 = v3;
  v7 = v4;

  v6 = v8;
  v5 = v7;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BuddyPasscodeInputViewDelegate)delegate
{
  return (BuddyPasscodeInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
