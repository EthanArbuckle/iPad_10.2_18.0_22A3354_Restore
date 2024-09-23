@implementation AAUISwitchTableViewCell

- (AAUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AAUISwitchTableViewCell *v4;
  AAUISwitchTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISwitchTableViewCell;
  v4 = -[AAUISwitchTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    _AAUISwitchTableViewCellInit(v4);
  return v5;
}

- (AAUISwitchTableViewCell)initWithCoder:(id)a3
{
  AAUISwitchTableViewCell *v3;
  AAUISwitchTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUISwitchTableViewCell;
  v3 = -[AAUISwitchTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _AAUISwitchTableViewCellInit(v3);
  return v4;
}

- (void)_delegate_switchTableViewCellDidUpdateValue
{
  id v3;

  -[AAUISwitchTableViewCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "switchTableViewCellDidUpdateValue:", self);

}

- (UISwitch)control
{
  return self->_control;
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (AAUISwitchTableViewCellDelegate)delegate
{
  return (AAUISwitchTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_control, 0);
}

@end
