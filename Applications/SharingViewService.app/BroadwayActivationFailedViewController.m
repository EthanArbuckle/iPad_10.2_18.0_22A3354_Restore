@implementation BroadwayActivationFailedViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  int64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationFailedViewController viewWillAppear:]", 30, "FailedVC ViewWillAppear");
  v20.receiver = self;
  v20.super_class = (Class)BroadwayActivationFailedViewController;
  -[SVSBaseViewController viewWillAppear:](&v20, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 1);

  v6 = SFFontForTextStyleWithAdditionalSymbolicTraits(UIFontTextStyleTitle1, 0x8000);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setFont:", v7);

  objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setAdjustsFontForContentSizeCategory:", 0);
  v8 = SFFontForTextStyleWithAdditionalSymbolicTraits(UIFontTextStyleSubheadline, 0x8000);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setFont:", v9);

  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setAdjustsFontForContentSizeCategory:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", kCTFontUIFontDesignRounded, 8.0, UIFontWeightMedium));
  objc_msgSend(*(id *)((char *)&self->_subheadLabel + 1), "setFont:", v10);

  objc_msgSend(*(id *)((char *)&self->_subheadLabel + 1), "setAdjustsFontForContentSizeCategory:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.54, 1.0));
  objc_msgSend(*(id *)((char *)&self->_subheadLabel + 1), "setTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "physicalCard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nameOnCard"));
  if (v13)
  {
    objc_msgSend(*(id *)((char *)&self->_subheadLabel + 1), "setText:", v13);
  }
  else
  {
    v14 = objc_opt_new(NSString);
    objc_msgSend(*(id *)((char *)&self->_subheadLabel + 1), "setText:", v14);

  }
  v15 = -[BroadwayActivationFailedViewController failureResult](self, "failureResult");
  v16 = CFSTR("BROADWAY_ERROR_SERVICES_UNAVAILABLE");
  if (v15 == 7)
    v16 = CFSTR("BROADWAY_ERROR_INCORRECT_ACTIVATION_CODE");
  if (v15 == 5)
    v17 = CFSTR("BROADWAY_ERROR_NOT_YET_SHIPPED");
  else
    v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v19);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationFailedViewController viewDidDisappear:]", 30, "FailedVC ViewDidDisappear");
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationFailedViewController;
  -[BroadwayActivationFailedViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationFailedViewController handleDismissButton:]", 30, "Dismiss button");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (int64_t)failureResult
{
  return *(int64_t *)((char *)&self->_cardNameLabel + 1);
}

- (void)setFailureResult:(int64_t)a3
{
  *(UILabel **)((char *)&self->_cardNameLabel + 1) = (UILabel *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_subheadLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
