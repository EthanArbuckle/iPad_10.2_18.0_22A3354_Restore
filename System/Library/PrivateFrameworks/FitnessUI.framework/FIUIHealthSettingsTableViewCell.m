@implementation FIUIHealthSettingsTableViewCell

- (FIUIHealthSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FIUIHealthSettingsTableViewCell *v4;
  FIUIHealthSettingsTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FIUIHealthSettingsTableViewCell;
  v4 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[FIUIHealthSettingsTableViewCell setAccessoryType:](v4, "setAccessoryType:", 0);
    -[FIUIHealthSettingsTableViewCell setEditingAccessoryType:](v5, "setEditingAccessoryType:", 0);
    -[FIUIHealthSettingsTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell detailTextLabel](v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE0B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](v5, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[FIUIHealthSettingsTableViewCell detailTextLabel](v5, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v11);

  }
  return v5;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (id)inputView
{
  return self->_inputView;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIHealthSettingsTableViewCell;
  -[FIUIHealthSettingsTableViewCell becomeFirstResponder](&v6, sel_becomeFirstResponder);
  -[FIUIHealthSettingsTableViewCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIHealthSettingsTableViewCell;
  -[FIUIHealthSettingsTableViewCell resignFirstResponder](&v6, sel_resignFirstResponder);
  objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  return 1;
}

- (FIUIHealthSettingsForceUpdatable)forceUpdatable
{
  return (FIUIHealthSettingsForceUpdatable *)objc_loadWeakRetained((id *)&self->_forceUpdatable);
}

- (void)setForceUpdatable:(id)a3
{
  objc_storeWeak((id *)&self->_forceUpdatable, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forceUpdatable);
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end
