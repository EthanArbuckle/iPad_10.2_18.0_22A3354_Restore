@implementation TVLatencySetupAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[4];

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupAuthViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v15.receiver = self;
  v15.super_class = (Class)TVLatencySetupAuthViewController;
  -[TVLatencySetupBaseViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleKeyboardWillShow:", UIKeyboardWillShowNotification, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_INSTRUCTIONS_APPLETV"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_activityIndicatorView + 1), "setText:", v7);

  v8 = *(uint64_t *)((char *)&self->_pinLabel1 + 1);
  v17[0] = *(PINEntryView **)((char *)&self->_pinEntryView + 1);
  v17[1] = v8;
  v9 = *(uint64_t *)((char *)&self->_pinLabel3 + 1);
  v17[2] = *(UILabel **)((char *)&self->_pinLabel2 + 1);
  v17[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setDigits:", v10);

  v11 = *(uint64_t *)((char *)&self->_pinWell1 + 1);
  v16[0] = *(UILabel **)((char *)&self->_pinLabel4 + 1);
  v16[1] = v11;
  v12 = *(uint64_t *)((char *)&self->_pinWell3 + 1);
  v16[2] = *(UIView **)((char *)&self->_pinWell2 + 1);
  v16[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setWells:", v13);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011A26C;
  v14[3] = &unk_10017E1C8;
  v14[4] = self;
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setTextChangedHandler:", v14);
  -[TVLatencySetupAuthViewController showWithFlags:throttleSeconds:](self, "showWithFlags:throttleSeconds:", 0, 0xFFFFFFFFLL);
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "becomeFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupAuthViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)TVLatencySetupAuthViewController;
  -[TVLatencySetupAuthViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupAuthViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setDisabled:", 1);
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (void)_handleKeyboardWillShow:(id)a3
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
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  CGRect v31;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10011A1B4;
  v30[3] = &unk_10017E1F0;
  v30[4] = self;
  v4 = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupAuthViewController view](self, "view"));
  objc_msgSend(v15, "convertRect:fromView:", 0, v8, v10, v12, v14);
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
  v22 = (unint64_t)objc_msgSend(v21, "integerValue");

  if (!BYTE1(self->_pinWell4))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController bottomMarginConstraint](self, "bottomMarginConstraint"));
    objc_msgSend(v23, "constant");
    *(_QWORD *)(&self->_viewBottomConstantValid + 1) = v24;

    BYTE1(self->_pinWell4) = 1;
  }
  v25 = *(double *)(&self->_viewBottomConstantValid + 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupAuthViewController view](self, "view"));
  objc_msgSend(v26, "bounds");
  v27 = v25 + CGRectGetHeight(v31) - v17;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController bottomMarginConstraint](self, "bottomMarginConstraint"));
  objc_msgSend(v28, "setConstant:", v27);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10011A23C;
  v29[3] = &unk_10017E1F0;
  v29[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v22 | 4, v29, 0, v20, 0.0);

}

- (void)_handlePINEntered:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD handler[4];
  dispatch_source_t v7;
  id v8;
  TVLatencySetupAuthViewController *v9;

  v4 = a3;
  objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "startAnimating");
  if (objc_msgSend(self->super.super._mainController, "testFlags"))
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10011A154;
    handler[3] = &unk_10017E218;
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v8 = v4;
    v9 = self;
    v5 = v7;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet(v5, 1.0, -1.0, -4.0);
    dispatch_resume(v5);

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "latencySetupSession"));
    -[NSObject pairSetupTryPIN:](v5, "pairSetupTryPIN:", v4);
  }

}

- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "setHidden:", 1, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if ((a3 & 0x10000) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_INCORRECT"), &stru_10017E3D8, CFSTR("Localizable")));
    v9 = (id *)((char *)&self->_activityIndicatorView + 1);
    objc_msgSend(*(id *)((char *)&self->_activityIndicatorView + 1), "setText:", v11);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_INSTRUCTIONS_APPLETV"), &stru_10017E3D8, CFSTR("Localizable")));
    v9 = (id *)((char *)&self->_activityIndicatorView + 1);
    objc_msgSend(*(id *)((char *)&self->_activityIndicatorView + 1), "setText:", v8);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  v12 = (void *)v10;
  objc_msgSend(*v9, "setTextColor:", v10);

  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setText:", &stru_10017E3D8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pinWell3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinEntryView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), 0);
}

@end
