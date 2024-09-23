@implementation MTUISwitchTableViewCell

- (MTUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTUISwitchTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTUISwitchTableViewCell;
  v4 = -[MTUIBaseTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[MTUISwitchTableViewCell setEnabledSwitch:](v4, "setEnabledSwitch:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUISwitchTableViewCell enabledSwitch](v4, "enabledSwitch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOnTintColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_switchTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUISwitchTableViewCell enabledSwitch](v4, "enabledSwitch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v8);

    -[MTUISwitchTableViewCell enabledSwitch](v4, "enabledSwitch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v4, sel_switchAction_, 4096);

    -[MTUISwitchTableViewCell enabledSwitch](v4, "enabledSwitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUISwitchTableViewCell setAccessoryView:](v4, "setAccessoryView:", v11);

    -[MTUISwitchTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)switchAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTUISwitchTableViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTUISwitchTableViewCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switchDidChangeToState:senderCell:", objc_msgSend(v6, "isOn"), self);

  }
}

- (void)setSwitchStateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTUISwitchTableViewCell enabledSwitch](self, "enabledSwitch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (MTUISwitchTableViewCellDelegate)delegate
{
  return (MTUISwitchTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (void)setEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
