@implementation SFStartPageCustomizationCell

- (SFStartPageCustomizationCell)initWithFrame:(CGRect)a3
{
  SFStartPageCustomizationCell *v3;
  UISwitch *v4;
  UISwitch *v5;
  SFStartPageCustomizationCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFStartPageCustomizationCell;
  v3 = -[SFStartPageCustomizationCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v5 = v3->_switch;
    v3->_switch = v4;

    -[UISwitch addTarget:action:forControlEvents:](v3->_switch, "addTarget:action:forControlEvents:", v3, sel_valueDidChange_, 4096);
    -[SFStartPageCustomizationCell setAccessories:](v3, "setAccessories:", MEMORY[0x1E0C9AA60]);
    v6 = v3;
  }

  return v3;
}

- (BOOL)isOn
{
  return -[UISwitch isOn](self->_switch, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[UISwitch setOn:animated:](self->_switch, "setOn:animated:", a3, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
}

- (void)setAccessories:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = objc_msgSend(v4, "count");

  if (v6)
    v7 = 12.0;
  else
    v7 = 0.0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "sf_initWithCustomView:placement:trailingPadding:", self->_switch, 1, v7);
  objc_msgSend(v5, "insertObject:atIndex:", v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)SFStartPageCustomizationCell;
  -[SFStartPageCustomizationCell setAccessories:](&v9, sel_setAccessories_, v5);

}

- (void)valueDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageCustomizationCellDidChangeValue:", self);

}

- (SFStartPageCustomizationCellDelegate)delegate
{
  return (SFStartPageCustomizationCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
