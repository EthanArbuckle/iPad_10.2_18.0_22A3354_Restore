@implementation SFPasswordBreachToggleCell

- (SFPasswordBreachToggleCell)initWithReuseIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  SFPasswordBreachToggleCell *v7;
  id v8;
  UISwitch *v9;
  UISwitch *toggleSwitch;
  UISwitch *v11;
  void *v12;
  SFPasswordBreachToggleCell *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFPasswordBreachToggleCell;
  v7 = -[SFPasswordBreachToggleCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 0, a3);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3D18]);
    v9 = (UISwitch *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SFPasswordBreachToggleCell setAccessoryView:](v7, "setAccessoryView:", v9);
    toggleSwitch = v7->_toggleSwitch;
    v7->_toggleSwitch = v9;
    v11 = v9;

    -[UISwitch addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", v7, sel__userToggledBreachDetection_, 4096);
    -[SFPasswordBreachToggleCell textLabel](v7, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    objc_storeWeak((id *)&v7->_delegate, v6);
    v13 = v7;
  }

  return v7;
}

- (void)setCurrentPasswordBreachState:(BOOL)a3
{
  -[UISwitch setOn:](self->_toggleSwitch, "setOn:", a3);
}

- (void)_userToggledBreachDetection:(id)a3
{
  SFPasswordBreachToggleCellDelegate **p_delegate;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(WeakRetained, "didSetPasswordBreachDetectionState:", v5);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toggleSwitch, 0);
}

@end
