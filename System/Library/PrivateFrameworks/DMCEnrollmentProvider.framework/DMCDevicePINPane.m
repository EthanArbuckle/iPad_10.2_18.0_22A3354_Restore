@implementation DMCDevicePINPane

- (DMCDevicePINPane)initWithFrame:(CGRect)a3
{
  DMCDevicePINPane *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)DMCDevicePINPane;
  v3 = -[DevicePINPane initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__DMCDevicePINPane_initWithFrame___block_invoke;
    v7[3] = &unk_24D52E2D0;
    objc_copyWeak(&v8, &location);
    v5 = (id)-[DMCDevicePINPane registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __34__DMCDevicePINPane_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "titleText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setTitle:", v1);

}

- (void)setStyle:(unint64_t)a3
{
  id v4;

  self->_style = a3;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75678]), "setBackgroundColor:", v4);

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *titleText;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  titleText = self->_titleText;
  self->_titleText = v5;

  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75678]);
  -[DMCDevicePINPane _textFont](self, "_textFont");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:font:", v4, v8);

}

- (UIView)descriptionLabel
{
  return (UIView *)-[DMCDevicePINPane valueForKeyPath:](self, "valueForKeyPath:", CFSTR("_pinView._titleLabel"));
}

- (UIView)passcodeField
{
  return (UIView *)-[DMCDevicePINPane valueForKeyPath:](self, "valueForKeyPath:", CFSTR("_pinView._passcodeField"));
}

- (id)_textFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
