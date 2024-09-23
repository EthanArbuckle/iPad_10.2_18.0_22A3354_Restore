@implementation HKMedicalIDEditorSwitchCell

- (HKMedicalIDEditorSwitchCell)initWithTitle:(id)a3 defaultState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HKMedicalIDEditorSwitchCell *v7;
  HKMedicalIDEditorSwitchCell *v8;
  UISwitch *v9;
  UISwitch *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicalIDEditorSwitchCell;
  v7 = -[HKMedicalIDEditorSwitchCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 0, CFSTR("HKMedicalIDEditorSwitchCellIdentifier"));
  v8 = v7;
  if (v7)
  {
    -[HKMedicalIDEditorSwitchCell setSeparatorInset:](v7, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v9 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v10 = v8->_switch;
    v8->_switch = v9;

    -[UISwitch addTarget:action:forControlEvents:](v8->_switch, "addTarget:action:forControlEvents:", v8, sel__switchSwitched_, 4096);
    -[HKMedicalIDEditorSwitchCell setAccessoryView:](v8, "setAccessoryView:", v8->_switch);
    -[HKMedicalIDEditorSwitchCell textLabel](v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v6);

    -[HKMedicalIDEditorSwitchCell textLabel](v8, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorSwitchCell textLabel](v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    -[UISwitch setOn:](v8->_switch, "setOn:", v4);
  }

  return v8;
}

- (void)_switchSwitched:(id)a3
{
  HKMedicalIDEditorSwitchDelegate **p_delegate;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(WeakRetained, "switchWasChanged:", v5);
}

- (void)setUIDisabled
{
  void *v3;

  -[HKMedicalIDEditorSwitchCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[HKMedicalIDEditorSwitchCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[UISwitch setEnabled:](self->_switch, "setEnabled:", 0);
}

- (HKMedicalIDEditorSwitchDelegate)delegate
{
  return (HKMedicalIDEditorSwitchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);
}

@end
