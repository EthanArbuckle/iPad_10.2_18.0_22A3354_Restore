@implementation AXUIVoiceOverBluetoothDevicePlaceholderCell

- (AXUIVoiceOverBluetoothDevicePlaceholderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXUIVoiceOverBluetoothDevicePlaceholderCell *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverBluetoothDevicePlaceholderCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    -[UIActivityIndicatorView startAnimating](v5->_spinner, "startAnimating");
    -[AXUIVoiceOverBluetoothDevicePlaceholderCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_spinner);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)AXUIVoiceOverBluetoothDevicePlaceholderCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  float v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXUIVoiceOverBluetoothDevicePlaceholderCell;
  -[PSTableCell layoutSubviews](&v14, sel_layoutSubviews);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v4 = v3;
  v6 = v5;
  v7 = 10.0;
  if (!objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection"))
  {
    -[AXUIVoiceOverBluetoothDevicePlaceholderCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v7 = v9 - v4 + -10.0;

  }
  -[AXUIVoiceOverBluetoothDevicePlaceholderCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = (v11 - v6) * 0.5;
  v13 = ceilf(v12);

  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v7, v13, v4, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
