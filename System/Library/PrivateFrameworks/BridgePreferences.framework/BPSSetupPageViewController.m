@implementation BPSSetupPageViewController

- (BPSSetupPageViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewController;
  return -[BPSSetupPageViewController init](&v3, sel_init);
}

- (void)viewDidLoad
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BPSSetupPageViewController;
  -[BPSSetupPageViewController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6B68]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = self->_titleLabel;
  BPSRegularFontWithSize(24.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = self->_titleLabel;
  BPSTextColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[BPSSetupPageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_titleLabel);

  -[BPSSetupPageViewController updateTitleLabel](self, "updateTitleLabel");
}

- (void)updateTitleLabel
{
  void *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  UILabel *v7;
  id v8;

  -[BPSSetupPageViewController titleString](self, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    titleLabel = self->_titleLabel;
    -[BPSSetupPageViewController titleString](self, "titleString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](titleLabel, "setText:", v5);
LABEL_5:

    goto LABEL_6;
  }
  -[BPSSetupPageViewController titleAttributedString](self, "titleAttributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = self->_titleLabel;
    -[BPSSetupPageViewController titleAttributedString](self, "titleAttributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v7, "setAttributedText:", v5);
    goto LABEL_5;
  }
LABEL_6:
  -[BPSSetupPageViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (CGRect)computedTitleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[BPSSetupPageViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UILabel frame](self->_titleLabel, "frame");
  }
  else
  {
    v3 = *MEMORY[0x24BDBF090];
    v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  UILabel *titleLabel;
  UILabel *v8;
  double v9;
  double v10;
  double v11;
  _OWORD v12[2];
  int64x2_t v13;
  int64x2_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BPSSetupPageViewController;
  -[BPSSetupPageViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[BPSSetupPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");

  LODWORD(v6) = -[BPSSetupPageViewController contentViewIsInAdjustedScrollView](self, "contentViewIsInAdjustedScrollView");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 + -28.0, 1.79769313e308);
  titleLabel = self->_titleLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  v8 = self->_titleLabel;
  -[BPSSetupPageViewController verticalTitleInset](self, "verticalTitleInset");
  v12[0] = xmmword_2114A2320;
  v12[1] = xmmword_2114A23B0;
  v13 = vdupq_n_s64(0x4058000000000000uLL);
  v14 = v13;
  v10 = v9 + BPSScreenValueGetRelevantValue((uint64_t)v12);
  v11 = 64.0;
  if (!(_DWORD)v6)
    v11 = 0.0;
  -[UILabel _setFirstLineBaselineFrameOriginY:](v8, "_setFirstLineBaselineFrameOriginY:", v10 - v11);

}

- (double)verticalTitleInset
{
  return 0.0;
}

- (BOOL)contentViewIsInAdjustedScrollView
{
  return 0;
}

- (UIView)contentView
{
  UIView *contentView;
  void *v4;
  id v5;
  UIView *v6;
  UIView *v7;

  contentView = self->_contentView;
  if (!contentView)
  {
    -[BPSSetupPageViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v4, "bounds");
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_contentView;
    self->_contentView = v6;

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
    objc_msgSend(v4, "addSubview:", self->_contentView);

    contentView = self->_contentView;
  }
  return contentView;
}

- (id)titleString
{
  return 0;
}

- (id)titleAttributedString
{
  return 0;
}

- (id)followUpIdentifier
{
  return 0;
}

- (id)localizedTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bps_setup_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[BPSSetupPageViewController localizedTitle]";
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)followUpActions
{
  return 0;
}

- (id)localizedInformativeText
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bps_setup_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[BPSSetupPageViewController localizedInformativeText]";
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)wantsFollowUpNotification
{
  return 0;
}

- (id)_baseIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[BPSFollowUpController baseDomainIdentifier](BPSFollowUpController, "baseDomainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupPageViewController followUpIdentifier](self, "followUpIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BPSSetupPageViewController _baseIdentifier](self, "_baseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B400]);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    bps_setup_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_21147E000, v11, OS_LOG_TYPE_DEFAULT, "Add FollowUp for identifier %{public}@...", buf, 0xCu);
    }

    bps_setup_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "...for device: %{public}@", buf, 0xCu);
    }

    v20[0] = CFSTR("title");
    -[BPSSetupPageViewController localizedTitle](self, "localizedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v20[1] = CFSTR("description");
    -[BPSSetupPageViewController localizedInformativeText](self, "localizedInformativeText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    v20[2] = CFSTR("followUpActions");
    -[BPSSetupPageViewController followUpActions](self, "followUpActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSFollowUpAttributes attributeWithOptions:](BPSFollowUpAttributes, "attributeWithOptions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__BPSSetupPageViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke;
    v18[3] = &unk_24CBE4B20;
    v19 = v7;
    +[BPSFollowUpController addFollowUpForIdentifier:withAttributes:withCompletion:](BPSFollowUpController, "addFollowUpForIdentifier:withAttributes:withCompletion:", v10, v17, v18);

  }
  else
  {
    bps_setup_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }

}

uint64_t __73__BPSSetupPageViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addFollowUpForPageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BPSSetupPageViewController _baseIdentifier](self, "_baseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bps_setup_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Add Global FollowUp for %{public}@", buf, 0xCu);
    }

    v14[0] = CFSTR("title");
    -[BPSSetupPageViewController localizedTitle](self, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v14[1] = CFSTR("description");
    -[BPSSetupPageViewController localizedInformativeText](self, "localizedInformativeText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    v14[2] = CFSTR("followUpActions");
    -[BPSSetupPageViewController followUpActions](self, "followUpActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSFollowUpAttributes attributeWithOptions:](BPSFollowUpAttributes, "attributeWithOptions:", v11);
    v7 = objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__BPSSetupPageViewController_addFollowUpForPageWithCompletion___block_invoke;
    v12[3] = &unk_24CBE4B20;
    v13 = v4;
    +[BPSFollowUpController addFollowUpForIdentifier:withAttributes:withCompletion:](BPSFollowUpController, "addFollowUpForIdentifier:withAttributes:withCompletion:", v5, v7, v12);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
  }

}

uint64_t __63__BPSSetupPageViewController_addFollowUpForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeFollowupForPageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BPSSetupPageViewController followUpIdentifier](self, "followUpIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bps_setup_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Remove identifier %{public}@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__BPSSetupPageViewController_removeFollowupForPageWithCompletion___block_invoke;
    v8[3] = &unk_24CBE4B20;
    v9 = v4;
    +[BPSFollowUpController removeFollowUpForIdentifier:withCompletion:](BPSFollowUpController, "removeFollowUpForIdentifier:withCompletion:", v5, v8);
    v7 = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Removing a FollowUp requires dictating an identifier!", buf, 2u);
  }

}

uint64_t __66__BPSSetupPageViewController_removeFollowupForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BPSBuddyControllerDelegate)delegate
{
  return (BPSBuddyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
