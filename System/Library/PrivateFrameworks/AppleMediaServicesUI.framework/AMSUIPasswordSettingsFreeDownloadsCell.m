@implementation AMSUIPasswordSettingsFreeDownloadsCell

- (AMSUIPasswordSettingsFreeDownloadsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AMSUIPasswordSettingsFreeDownloadsCell *v4;
  AMSUIPasswordSettingsFreeDownloadsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSUIPasswordSettingsFreeDownloadsCell;
  v4 = -[AMSUIPasswordSettingsFreeDownloadsCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[AMSUIPasswordSettingsFreeDownloadsCell _setup](v4, "_setup");
  return v5;
}

- (void)_setup
{
  UISwitch *v3;
  UISwitch *toggle;
  id v5;
  void *v6;
  id v7;

  v3 = (UISwitch *)objc_alloc_init(MEMORY[0x24BEBD9B8]);
  toggle = self->_toggle;
  self->_toggle = v3;

  -[UISwitch addTarget:action:forControlEvents:](self->_toggle, "addTarget:action:forControlEvents:", self, sel__toggleChanged_, 4096);
  -[AMSUIPasswordSettingsFreeDownloadsCell setAccessoryView:](self, "setAccessoryView:", self->_toggle);
  v5 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AMSUIPasswordSettingsFreeDownloadsCell bounds](self, "bounds");
  v7 = (id)objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[AMSUIPasswordSettingsFreeDownloadsCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);
}

- (int64_t)selectionStyle
{
  return 0;
}

- (void)_toggleChanged:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AMSUIPasswordSettingsFreeDownloadsCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AMSUIPasswordSettingsFreeDownloadsCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "freeDownloadsToggle:changedValue:", v7, objc_msgSend(v7, "isOn"));

  }
}

- (AMSUIPasswordSettingsFreeDownloadsCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AMSUIPasswordSettingsFreeDownloadsCellDelegate *)a3;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
  objc_storeStrong((id *)&self->_toggle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
}

@end
