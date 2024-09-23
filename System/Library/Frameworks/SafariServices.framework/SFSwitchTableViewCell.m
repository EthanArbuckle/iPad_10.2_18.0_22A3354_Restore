@implementation SFSwitchTableViewCell

- (SFSwitchTableViewCell)initWithReuseIdentifier:(id)a3
{
  SFSwitchTableViewCell *v3;
  UISwitch *v4;
  UISwitch *switchView;
  SFSwitchTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFSwitchTableViewCell;
  v3 = -[SFSwitchTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, a3);
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    switchView = v3->_switchView;
    v3->_switchView = v4;

    -[UISwitch addTarget:action:forControlEvents:](v3->_switchView, "addTarget:action:forControlEvents:", v3, sel__switchViewStateDidChange_, 4096);
    -[SFSwitchTableViewCell setAccessoryView:](v3, "setAccessoryView:", v3->_switchView);
    v6 = v3;
  }

  return v3;
}

- (void)setSwitchOn:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UISwitch isOn](self->_switchView, "isOn") != a3)
    -[UISwitch setOn:](self->_switchView, "setOn:", v3);
}

- (BOOL)isSwitchOn
{
  return -[UISwitch isOn](self->_switchView, "isOn");
}

- (void)_switchViewStateDidChange:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "switchTableViewCell:didChangeSwitchState:", self, objc_msgSend(v5, "isOn"));

}

- (SFSwitchTableViewCellDelegate)delegate
{
  return (SFSwitchTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switchView, 0);
}

@end
