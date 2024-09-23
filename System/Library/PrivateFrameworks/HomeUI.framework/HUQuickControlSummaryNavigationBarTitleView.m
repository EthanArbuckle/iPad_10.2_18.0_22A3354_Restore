@implementation HUQuickControlSummaryNavigationBarTitleView

- (HUQuickControlSummaryNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  HUQuickControlSummaryNavigationBarTitleView *v3;
  HUQuickControlSummaryView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUQuickControlSummaryView);
    objc_storeStrong((id *)&v3->_titleView, v4);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](v3->_titleView, "setPreservesSuperviewLayoutMargins:", 1);
    -[HUQuickControlSummaryNavigationBarTitleView addSubview:](v3, "addSubview:", v3->_titleView);
    -[_UINavigationBarTitleView setHideStandardTitle:](v3, "setHideStandardTitle:", 1);
    -[_UINavigationBarTitleView setPreferredContentAlignment:](v3, "setPreferredContentAlignment:", 1);
    v3->_leadingMargin = 0.0;
    v3->_trailingMargin = 40.0;
    v3->_navigationBarMinHeight = 50.0;
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
    {
      -[HUQuickControlSummaryNavigationBarTitleView layoutMargins](v3, "layoutMargins");
      v6 = v5;
      v8 = v7;
      -[UIView setLayoutMargins:](v3->_titleView, "setLayoutMargins:", 0.0);
      -[HUQuickControlSummaryNavigationBarTitleView setLayoutMargins:](v3, "setLayoutMargins:", 0.0, v6, 0.0, v8);
    }

  }
  return v3;
}

- (HUQuickControlSummaryView)summaryView
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HUQuickControlSummaryView *)v5;
}

- (void)updateTitleView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v13 = 136315394;
      v14 = "-[HUQuickControlSummaryNavigationBarTitleView updateTitleView:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s Not updating titleView because same as before %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    if (v8)
    {
      v13 = 136315394;
      v14 = "-[HUQuickControlSummaryNavigationBarTitleView updateTitleView:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s Updating to new titleView %@", (uint8_t *)&v13, 0x16u);
    }

    -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[HUQuickControlSummaryNavigationBarTitleView setTitleView:](self, "setTitleView:", v4);
    -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreservesSuperviewLayoutMargins:", 1);

    -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryNavigationBarTitleView addSubview:](self, "addSubview:", v12);

    -[HUQuickControlSummaryNavigationBarTitleView updateConstraints](self, "updateConstraints");
  }

}

- (void)updateLeadingMargin:(double)a3
{
  double v5;
  float v6;
  float v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlSummaryNavigationBarTitleView leadingMargin](self, "leadingMargin");
  *(float *)&v5 = v5;
  v6 = a3;
  v7 = vabds_f32(*(float *)&v5, v6);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= 0.00000011921)
  {
    if (v9)
    {
      v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateLeadingMargin:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating to new leadingMargin %f", (uint8_t *)&v10, 0x16u);
    }

    -[HUQuickControlSummaryNavigationBarTitleView setLeadingMargin:](self, "setLeadingMargin:", a3);
    -[HUQuickControlSummaryNavigationBarTitleView updateConstraints](self, "updateConstraints");
  }
  else
  {
    if (v9)
    {
      v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateLeadingMargin:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Not updating leadingMargin %f because same as before", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)updateTrailingMargin:(double)a3
{
  double v5;
  float v6;
  float v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlSummaryNavigationBarTitleView trailingMargin](self, "trailingMargin");
  *(float *)&v5 = v5;
  v6 = a3;
  v7 = vabds_f32(*(float *)&v5, v6);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= 0.00000011921)
  {
    if (v9)
    {
      v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateTrailingMargin:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating to new trailingMargin %f", (uint8_t *)&v10, 0x16u);
    }

    -[HUQuickControlSummaryNavigationBarTitleView setTrailingMargin:](self, "setTrailingMargin:", a3);
    -[HUQuickControlSummaryNavigationBarTitleView updateConstraints](self, "updateConstraints");
  }
  else
  {
    if (v9)
    {
      v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateTrailingMargin:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Not updating trailingMargin %f because same as before", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  -[HUQuickControlSummaryNavigationBarTitleView updateConstraints](&v29, sel_updateConstraints);
  -[HUQuickControlSummaryNavigationBarTitleView contentConstraints](self, "contentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUQuickControlSummaryNavigationBarTitleView contentConstraints](self, "contentConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView layoutMarginsGuide](self, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView trailingMargin](self, "trailingMargin");
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryNavigationBarTitleView trailingAnchor](self, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryNavigationBarTitleView trailingMargin](self, "trailingMargin");
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  v28 = v11;
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView leadingMargin](self, "leadingMargin");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = v11;
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryNavigationBarTitleView setContentConstraints:](self, "setContentConstraints:", v25);

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlSummaryNavigationBarTitleView contentConstraints](self, "contentConstraints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v27);

}

- (void)layoutSubviews
{
  char v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  -[HUQuickControlSummaryNavigationBarTitleView layoutSubviews](&v13, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials");
  -[HUQuickControlSummaryNavigationBarTitleView navigationBarMinHeight](self, "navigationBarMinHeight");
  v5 = v4;
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  if ((v3 & 1) == 0)
  {
    -[HUQuickControlSummaryNavigationBarTitleView layoutMargins](self, "layoutMargins");
    v10 = v8 + v9;
    -[HUQuickControlSummaryNavigationBarTitleView layoutMargins](self, "layoutMargins");
    v8 = v10 + v11;
  }

  if (v5 >= v8)
    v12 = v5;
  else
    v12 = v8;
  -[_UINavigationBarTitleView setHeight:](self, "setHeight:", v12);
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = !a4;
  -[HUQuickControlSummaryNavigationBarTitleView titleView](self, "titleView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentConstraints, a3);
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (double)navigationBarMinHeight
{
  return self->_navigationBarMinHeight;
}

- (void)setNavigationBarMinHeight:(double)a3
{
  self->_navigationBarMinHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
