@implementation HUIconSwitchCell

- (HUIconSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUIconSwitchCell *v4;
  UISwitch *v5;
  UISwitch *switchView;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUIconSwitchCell;
  v4 = -[HUTitleDescriptionCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0CEAA38]);
    switchView = v4->_switchView;
    v4->_switchView = v5;

    -[HUIconSwitchCell switchView](v4, "switchView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconSwitchCell setAccessoryView:](v4, "setAccessoryView:", v7);

    -[HUIconSwitchCell switchView](v4, "switchView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v4, sel__toggleOn_, 4096);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUIconSwitchCell;
  -[HUTitleDescriptionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUTitleDescriptionCell setDisabled:](self, "setDisabled:", 0);
  -[HUIconSwitchCell switchView](self, "switchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconSwitchCell setAccessoryView:](self, "setAccessoryView:", v3);

  -[HUIconSwitchCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isOn
{
  void *v2;
  char v3;

  -[HUIconSwitchCell switchView](self, "switchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[HUIconSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUIconSwitchCell switchView](self, "switchView");
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
  if (-[HUIconSwitchCell isOn](self, "isOn") != a3)
  {
    -[HUIconSwitchCell switchView](self, "switchView");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUIconSwitchCell;
  -[HUTitleDescriptionCell updateUIWithAnimation:](&v16, sel_updateUIWithAnimation_);
  -[HUIconCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  v8 = objc_msgSend(v7, "integerValue");
  if (v8 == 2)
  {
    v9 = 1;
  }
  else
  {
    if (v8 != 1)
      goto LABEL_7;
    v9 = 0;
  }
  -[HUIconSwitchCell setOn:animated:](self, "setOn:animated:", v9, v3);
LABEL_7:
  if (-[HUIconCell isDisabled](self, "isDisabled"))
  {
    v10 = 0;
  }
  else
  {
    -[HUIconCell item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "BOOLValue") ^ 1;

  }
  -[HUIconSwitchCell switchView](self, "switchView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", v10);

  -[HUIconSwitchCell switchView](self, "switchView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v10);

}

- (void)_toggleOn:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  int v8;
  HUIconSwitchCell *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[HUIconSwitchCell isOn](self, "isOn");
    v6 = CFSTR("off");
    if (v5)
      v6 = CFSTR("on");
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  -[HUIconSwitchCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switchCell:didTurnOn:", self, -[HUIconSwitchCell isOn](self, "isOn"));

}

- (HUIconSwitchCellDelegate)delegate
{
  return (HUIconSwitchCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
  objc_storeStrong((id *)&self->_switchView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
