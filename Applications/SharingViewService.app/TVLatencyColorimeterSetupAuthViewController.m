@implementation TVLatencyColorimeterSetupAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[4];

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupAuthViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)TVLatencyColorimeterSetupAuthViewController;
  -[SVSBaseViewController viewWillAppear:](&v14, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_INSTRUCTIONS_APPLETV"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v6);

  v7 = *(uint64_t *)((char *)&self->_pinLabel1 + 1);
  v16[0] = *(PINEntryView **)((char *)&self->_pinEntryView + 1);
  v16[1] = v7;
  v8 = *(uint64_t *)((char *)&self->_pinLabel3 + 1);
  v16[2] = *(UILabel **)((char *)&self->_pinLabel2 + 1);
  v16[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setDigits:", v9);

  v10 = *(uint64_t *)((char *)&self->_pinWell1 + 1);
  v15[0] = *(UILabel **)((char *)&self->_pinLabel4 + 1);
  v15[1] = v10;
  v11 = *(uint64_t *)((char *)&self->_pinWell3 + 1);
  v15[2] = *(UIView **)((char *)&self->_pinWell2 + 1);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setWells:", v12);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F9ABC;
  v13[3] = &unk_10017E1C8;
  v13[4] = self;
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setTextChangedHandler:", v13);
  -[TVLatencyColorimeterSetupAuthViewController showWithFlags:throttleSeconds:](self, "showWithFlags:throttleSeconds:", 0, 0xFFFFFFFFLL);
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupAuthViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupAuthViewController;
  -[TVLatencyColorimeterSetupAuthViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupAuthViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setDisabled:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController mainController](self, "mainController"));
  objc_msgSend(v4, "dismiss:", 5);

}

- (void)_handlePINEntered:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD handler[4];
  dispatch_source_t v10;
  id v11;
  TVLatencyColorimeterSetupAuthViewController *v12;

  v4 = a3;
  objc_msgSend(*(id *)((char *)&self->_pinWell4 + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->_pinWell4 + 1), "startAnimating");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController mainController](self, "mainController"));
  v6 = objc_msgSend(v5, "testFlags");

  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000F9A48;
    handler[3] = &unk_10017E218;
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v11 = v4;
    v12 = self;
    v7 = v10;
    dispatch_source_set_event_handler(v7, handler);
    SFDispatchTimerSet(v7, 1.0, -1.0, -4.0);
    dispatch_resume(v7);

  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[SVSBaseViewController mainController](self, "mainController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject colorCalibratorSetupSession](v7, "colorCalibratorSetupSession"));
    objc_msgSend(v8, "pairSetupTryPIN:", v4);

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

  objc_msgSend(*(id *)((char *)&self->_pinWell4 + 1), "setHidden:", 1, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if ((a3 & 0x10000) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_INCORRECT"), &stru_10017E3D8, CFSTR("Localizable")));
    v9 = (id *)((char *)&self->_titleLabel + 1);
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v11);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_INSTRUCTIONS_APPLETV"), &stru_10017E3D8, CFSTR("Localizable")));
    v9 = (id *)((char *)&self->_titleLabel + 1);
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v8);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  v12 = (void *)v10;
  objc_msgSend(*v9, "setTextColor:", v10);

  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setText:", &stru_10017E3D8);
}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pinWell4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinEntryView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
