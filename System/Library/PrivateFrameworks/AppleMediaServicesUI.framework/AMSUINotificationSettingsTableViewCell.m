@implementation AMSUINotificationSettingsTableViewCell

- (AMSUINotificationSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AMSUINotificationSettingsTableViewCell *v4;
  id v5;
  uint64_t v6;
  UISwitch *itemSwitch;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMSUINotificationSettingsTableViewCell;
  v4 = -[AMSUINotificationSettingsTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    itemSwitch = v4->_itemSwitch;
    v4->_itemSwitch = (UISwitch *)v6;

    -[UISwitch addTarget:action:forControlEvents:](v4->_itemSwitch, "addTarget:action:forControlEvents:", v4, sel_switchToggled_, 4096);
    -[AMSUINotificationSettingsTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_itemSwitch);
    -[AMSUINotificationSettingsTableViewCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[AMSUINotificationSettingsTableViewCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

    -[AMSUINotificationSettingsTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)setItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_storeStrong((id *)&self->_item, a3);
  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v5, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  v10 = objc_msgSend(v5, "isEnabled");
  -[AMSUINotificationSettingsTableViewCell itemSwitch](self, "itemSwitch");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOn:", v10);

}

- (void)switchToggled:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_msgSend(a3, "isOn");
  -[AMSUINotificationSettingsTableViewCell item](self, "item");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setEnabled:", v4);

  -[AMSUINotificationSettingsTableViewCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AMSUINotificationSettingsTableViewCell delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUINotificationSettingsTableViewCell itemSwitch](self, "itemSwitch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUINotificationSettingsTableViewCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationInAppSettingsTableViewCellDidToggleValue:forItem:", v7, v8);

  }
}

- (AMSUINotificationInAppSettingsTableViewCellDelegate)delegate
{
  return (AMSUINotificationInAppSettingsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSNotificationSettingsItem)item
{
  return self->_item;
}

- (UISwitch)itemSwitch
{
  return self->_itemSwitch;
}

- (void)setItemSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_itemSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSwitch, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
