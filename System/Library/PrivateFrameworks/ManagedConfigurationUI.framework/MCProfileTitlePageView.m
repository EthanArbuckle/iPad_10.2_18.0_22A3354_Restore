@implementation MCProfileTitlePageView

- (MCProfileTitlePageView)initWithFrame:(CGRect)a3
{
  MCProfileTitlePageView *v3;
  MCProfileTitlePageView *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  UIView *topBarView;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *bottomBarView;
  uint64_t v14;
  UIButton *cancelButton;
  uint64_t v16;
  UIButton *installButton;
  uint64_t v18;
  UIButton *infoButton;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MCProfileTitlePageView;
  v3 = -[MCSectionBasedTableView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MCProfileTitlePageView safeAreaInsets](v3, "safeAreaInsets");
    v6 = v5 + 127.0;
    -[MCSectionBasedTableView tableView](v4, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentInset:", 55.0, 0.0, v6, 0.0);

    v8 = objc_opt_new();
    topBarView = v4->_topBarView;
    v4->_topBarView = (UIView *)v8;

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_topBarView, "setBackgroundColor:", v11);

    -[MCProfileTitlePageView _createBottomView](v4, "_createBottomView");
    v12 = objc_claimAutoreleasedReturnValue();
    bottomBarView = v4->_bottomBarView;
    v4->_bottomBarView = (UIView *)v12;

    -[MCProfileTitlePageView _createCancelButton](v4, "_createCancelButton");
    v14 = objc_claimAutoreleasedReturnValue();
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIButton *)v14;

    -[MCProfileTitlePageView _createInstallButton](v4, "_createInstallButton");
    v16 = objc_claimAutoreleasedReturnValue();
    installButton = v4->_installButton;
    v4->_installButton = (UIButton *)v16;

    -[MCProfileTitlePageView _createInfoButton](v4, "_createInfoButton");
    v18 = objc_claimAutoreleasedReturnValue();
    infoButton = v4->_infoButton;
    v4->_infoButton = (UIButton *)v18;

    -[UIView addSubview:](v4->_bottomBarView, "addSubview:", v4->_cancelButton);
    -[UIView addSubview:](v4->_bottomBarView, "addSubview:", v4->_installButton);
    -[UIView addSubview:](v4->_topBarView, "addSubview:", v4->_infoButton);
    -[MCProfileTitlePageView addSubview:](v4, "addSubview:", v4->_topBarView);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  CGFloat v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v30.receiver = self;
  v30.super_class = (Class)MCProfileTitlePageView;
  -[MCSectionBasedTableView layoutSubviews](&v30, sel_layoutSubviews);
  if (MCUIIsiPhone())
    v3 = 44.0;
  else
    v3 = 50.0;
  -[MCProfileTitlePageView bounds](self, "bounds");
  Width = CGRectGetWidth(v31);
  -[MCProfileTitlePageView topBarView](self, "topBarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, v3);

  -[MCProfileTitlePageView cancelButton](self, "cancelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;

  -[MCProfileTitlePageView installButton](self, "installButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;

  -[MCProfileTitlePageView safeAreaInsets](self, "safeAreaInsets");
  v13 = v12 + v8 + v11 + 17.0 + 10.0;
  -[MCProfileTitlePageView bounds](self, "bounds");
  v14 = CGRectGetHeight(v32) - v13;
  -[MCProfileTitlePageView bounds](self, "bounds");
  v15 = CGRectGetWidth(v33);
  -[MCProfileTitlePageView bottomBarView](self, "bottomBarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", 0.0, v14, v15, v13);

  LODWORD(v16) = MCUIIsiPad();
  -[MCProfileTitlePageView bounds](self, "bounds");
  v17 = CGRectGetWidth(v34);
  if ((_DWORD)v16)
  {
    v18 = (v17 + -360.0) * 0.5;
    -[MCProfileTitlePageView installButton](self, "installButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 360.0;
  }
  else
  {
    v20 = v17 + -48.0;
    -[MCProfileTitlePageView installButton](self, "installButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 24.0;
  }
  objc_msgSend(v19, "setFrame:", v18, 17.0, v20, v11);

  -[MCProfileTitlePageView installButton](self, "installButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = CGRectGetMaxY(v35) + 5.0;
  -[MCProfileTitlePageView bounds](self, "bounds");
  v23 = CGRectGetWidth(v36) + -48.0;
  -[MCProfileTitlePageView cancelButton](self, "cancelButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", 24.0, v22, v23, v8);

  -[MCProfileTitlePageView infoButton](self, "infoButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v26 = CGRectGetWidth(v37);

  -[MCProfileTitlePageView topBarView](self, "topBarView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v28 = CGRectGetWidth(v38) - v26 + -12.0;
  -[MCProfileTitlePageView infoButton](self, "infoButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v28, 7.0, v26, 30.0);

}

- (id)_createInstallButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedStringByDevice(CFSTR("ENROLL_MY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  return v2;
}

- (id)_createCancelButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CANCEL_AND_DELETE_PROFILE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  return v2;
}

- (id)_createInfoButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CERT_DETAILS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v4, 0);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(v2, "sizeToFit");
  return v2;
}

- (id)_createBottomView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.150000006);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v3);
    objc_msgSend(v2, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    objc_msgSend(v2, "insertSubview:atIndex:", v6, 0);

  }
  return v2;
}

- (void)showBottomView:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];
  BOOL v6;

  v4 = 0.200000003;
  if (!a4)
    v4 = 0.0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MCProfileTitlePageView_showBottomView_animated___block_invoke;
  v5[3] = &unk_1EA2B5E40;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, v4);
}

void __50__MCProfileTitlePageView_showBottomView_animated___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "bottomBarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (UIView)topBarView
{
  return self->_topBarView;
}

- (UIView)bottomBarView
{
  return self->_bottomBarView;
}

- (UIButton)installButton
{
  return self->_installButton;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_installButton, 0);
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_topBarView, 0);
}

@end
