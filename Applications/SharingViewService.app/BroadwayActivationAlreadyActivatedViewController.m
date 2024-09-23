@implementation BroadwayActivationAlreadyActivatedViewController

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
  objc_super v15;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationAlreadyActivatedViewController viewWillAppear:]", 30, "AlreadyActivatedVC ViewWillAppear");
  v15.receiver = self;
  v15.super_class = (Class)BroadwayActivationAlreadyActivatedViewController;
  -[SVSBaseViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
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
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationAlreadyActivatedViewController viewDidDisappear:]", 30, "AlreadyActivatedVC ViewDidDisappear");
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationAlreadyActivatedViewController;
  -[BroadwayActivationAlreadyActivatedViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleOKButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationAlreadyActivatedViewController handleOKButton:]", 30, "OK button");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleContactSupportButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationAlreadyActivatedViewController handleContactSupportButton:]", 30, "Contact Support button");
  objc_msgSend(self->super._mainController, "dismiss:completion:", 5, &stru_10017DDC8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_subheadLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
