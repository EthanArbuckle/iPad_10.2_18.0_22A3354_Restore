@implementation SUUISettingsTableHeaderFooterView

- (void)displaySettingsHeaderFooterDescriptionView:(id)a3
{
  SUUISettingsHeaderFooterDescriptionView **p_settingsHeaderFooterDescriptionView;
  id v6;
  void *v7;

  p_settingsHeaderFooterDescriptionView = &self->_settingsHeaderFooterDescriptionView;
  objc_storeStrong((id *)&self->_settingsHeaderFooterDescriptionView, a3);
  v6 = a3;
  -[SUUISettingsTableHeaderFooterView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", *p_settingsHeaderFooterDescriptionView);

  -[SUUISettingsTableHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  SUUISettingsHeaderFooterDescriptionView *settingsHeaderFooterDescriptionView;

  -[SUUISettingsHeaderFooterDescriptionView removeFromSuperview](self->_settingsHeaderFooterDescriptionView, "removeFromSuperview");
  settingsHeaderFooterDescriptionView = self->_settingsHeaderFooterDescriptionView;
  self->_settingsHeaderFooterDescriptionView = 0;

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUISettingsTableHeaderFooterView;
  -[SUUISettingsTableHeaderFooterView layoutSubviews](&v12, sel_layoutSubviews);
  -[SUUISettingsTableHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUISettingsTableHeaderFooterView layoutMargins](self, "layoutMargins");
  -[SUUISettingsHeaderFooterDescriptionView setLayoutMargins:](self->_settingsHeaderFooterDescriptionView, "setLayoutMargins:");
  -[SUUISettingsHeaderFooterDescriptionView setFrame:](self->_settingsHeaderFooterDescriptionView, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsHeaderFooterDescriptionView, 0);
}

@end
