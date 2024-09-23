@implementation HUUserSwitchCell

- (HUUserSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUUserSwitchCell *v4;
  UISwitch *v5;
  UISwitch *switchView;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *activityIndicator;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUUserSwitchCell;
  v4 = -[HUAvatarTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0CEAA38]);
    switchView = v4->_switchView;
    v4->_switchView = v5;

    v7 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0CEA2C8]);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = v7;

    v4->_overrideDefaultContentConfiguration = 1;
    -[HUUserSwitchCell switchView](v4, "switchView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserSwitchCell setAccessoryView:](v4, "setAccessoryView:", v9);

    -[HUUserSwitchCell switchView](v4, "switchView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v4, sel__toggleOn_, 4096);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUUserSwitchCell;
  -[HUAvatarTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUUserSwitchCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v3);

  -[HUUserSwitchCell setDisabled:](self, "setDisabled:", 0);
  -[HUUserSwitchCell switchView](self, "switchView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserSwitchCell setAccessoryView:](self, "setAccessoryView:", v4);

  -[HUUserSwitchCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)defaultContentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[HUUserSwitchCell overrideDefaultContentConfiguration](self, "overrideDefaultContentConfiguration"))
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryTextProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v4);

    objc_msgSend(v3, "setTextToSecondaryTextVerticalPadding:", 4.0);
    objc_msgSend(v3, "setTextToSecondaryTextHorizontalPadding:", 4.0);
    return v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUUserSwitchCell;
    -[HUUserSwitchCell defaultContentConfiguration](&v7, sel_defaultContentConfiguration);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)configurationState
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUUserSwitchCell;
  -[HUUserSwitchCell configurationState](&v5, sel_configurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisabled:", -[HUUserSwitchCell isDisabled](self, "isDisabled"));
  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;

  self->_disabled = a3;
  v4 = !a3;
  -[HUUserSwitchCell switchView](self, "switchView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v4);

  -[HUUserSwitchCell switchView](self, "switchView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

  -[HUUserSwitchCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUAvatarTableViewCell contentConfiguration](self, "contentConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvatarTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (void)setLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      -[HUUserSwitchCell activityIndicator](self, "activityIndicator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserSwitchCell setAccessoryView:](self, "setAccessoryView:", v4);

      -[HUUserSwitchCell activityIndicator](self, "activityIndicator");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startAnimating");
    }
    else
    {
      -[HUUserSwitchCell switchView](self, "switchView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserSwitchCell setAccessoryView:](self, "setAccessoryView:", v5);

      -[HUUserSwitchCell activityIndicator](self, "activityIndicator");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopAnimating");
    }

  }
}

- (BOOL)isOn
{
  void *v2;
  char v3;

  -[HUUserSwitchCell switchView](self, "switchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[HUUserSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUUserSwitchCell switchView](self, "switchView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOn:", v3);

  }
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[HUUserSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUUserSwitchCell switchView](self, "switchView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOn:animated:", v5, v4);

  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUUserSwitchCell;
  -[HUAvatarTableViewCell updateUIWithAnimation:](&v14, sel_updateUIWithAnimation_);
  -[HUAvatarTableViewCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    if (v8 == 2)
    {
      v9 = 1;
      goto LABEL_6;
    }
    if (v8 == 1)
    {
      v9 = 0;
LABEL_6:
      -[HUUserSwitchCell setOn:animated:](self, "setOn:animated:", v9, v3);
    }
  }
  v10 = -[HUUserSwitchCell isDisabled](self, "isDisabled") ^ 1;
  -[HUUserSwitchCell switchView](self, "switchView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", v10);

  v12 = -[HUUserSwitchCell isDisabled](self, "isDisabled") ^ 1;
  -[HUUserSwitchCell switchView](self, "switchView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v12);

}

- (void)_toggleOn:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  int v8;
  HUUserSwitchCell *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[HUUserSwitchCell isOn](self, "isOn");
    v6 = CFSTR("off");
    if (v5)
      v6 = CFSTR("on");
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  -[HUUserSwitchCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userSwitchCell:didTurnOn:", self, -[HUUserSwitchCell isOn](self, "isOn"));

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (HUUserSwitchCellDelegate)delegate
{
  return (HUUserSwitchCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)overrideDefaultContentConfiguration
{
  return self->_overrideDefaultContentConfiguration;
}

- (void)setOverrideDefaultContentConfiguration:(BOOL)a3
{
  self->_overrideDefaultContentConfiguration = a3;
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
  objc_storeStrong((id *)&self->_switchView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
