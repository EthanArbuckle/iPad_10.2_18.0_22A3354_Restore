@implementation AXUIVoiceOverBluetoothDeviceTableCell

- (AXUIVoiceOverBluetoothDeviceTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXUIVoiceOverBluetoothDeviceTableCell *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, 1, a4, a5);
  if (v5)
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    -[UIActivityIndicatorView setHidesWhenStopped:](v5->_spinner, "setHidesWhenStopped:", 1);
    -[AXUIVoiceOverBluetoothDeviceTableCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_spinner);

    -[AXUIVoiceOverBluetoothDeviceTableCell _updateCheckMarkIcon](v5, "_updateCheckMarkIcon");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)setChecked:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805E8]) = a3;
  -[AXUIVoiceOverBluetoothDeviceTableCell _updateCheckMarkIcon](self, "_updateCheckMarkIcon");
}

- (void)setDeviceState:(int)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_state = a3;
  if ((a3 - 2) < 3)
  {
    v4 = 4;
    goto LABEL_5;
  }
  if (a3 < 2)
  {
    v4 = 0;
LABEL_5:
    -[AXUIVoiceOverBluetoothDeviceTableCell setAccessoryType:](self, "setAccessoryType:", v4);
    -[AXUIVoiceOverBluetoothDeviceTableCell detailTextLabel](self, "detailTextLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);
LABEL_6:

    return;
  }
  if (a3 == 5)
  {
    -[AXUIVoiceOverBluetoothDeviceTableCell setAccessoryType:](self, "setAccessoryType:", 4);
    AXUILocalizedStringForKey(CFSTR("PAIRED_AND_CONNECTED"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverBluetoothDeviceTableCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    goto LABEL_6;
  }
}

- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4
{
  unsigned int v4;
  uint64_t v5;

  if (a4)
    v4 = 5;
  else
    v4 = 2;
  if (a3)
    v5 = v4;
  else
    v5 = 0;
  -[AXUIVoiceOverBluetoothDeviceTableCell setDeviceState:](self, "setDeviceState:", v5);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  unsigned int state;
  BOOL v16;
  int v17;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  float v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  objc_super v37;
  objc_super v38;
  objc_super v39;
  CGRect v40;

  v39.receiver = self;
  v39.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  -[PSTableCell layoutSubviews](&v39, sel_layoutSubviews);
  v38.receiver = self;
  v38.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  -[PSTableCell titleLabel](&v38, sel_titleLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[PSTableCell iconImageView](self, "iconImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v13 = v12;
  }
  else
  {
    v13 = 0.0;
  }
  v14 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AXUIVoiceOverBluetoothDeviceTableCell semanticContentAttribute](self, "semanticContentAttribute"));
  state = self->_state;
  v16 = state > 4;
  v17 = (1 << state) & 0x1A;
  if (v16 || v17 == 0)
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    -[AXUIVoiceOverBluetoothDeviceTableCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v33;
  }
  else
  {
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    v20 = v19;
    v22 = v21;
    if (v14)
    {
      -[AXUIVoiceOverBluetoothDeviceTableCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24 - v20 + -10.0;

    }
    else
    {
      v25 = 10.0;
    }
    -[AXUIVoiceOverBluetoothDeviceTableCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = (v27 - v22) * 0.5;
    v29 = floorf(v28);

    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v25, v29, v20, v22);
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[AXUIVoiceOverBluetoothDeviceTableCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31 - v20;
  }

  v34 = v32 + -20.0 + -12.0 - v13;
  -[AXUIVoiceOverBluetoothDeviceTableCell _updateCheckMarkIcon](self, "_updateCheckMarkIcon");
  if (v14)
  {
    objc_msgSend(v11, "frame");
    v5 = CGRectGetMinX(v40) + 10.0;
  }
  objc_msgSend(v3, "setFrame:", v5, v7, v34, v9);
  objc_msgSend(v3, "setNeedsDisplay");
  if ((self->_state & 0xFFFFFFFE) == 4)
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellValue1BlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  -[PSTableCell titleLabel](&v37, sel_titleLabel);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextColor:", v35);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[AXUIVoiceOverBluetoothDeviceTableCell _updateCheckMarkIcon](self, "_updateCheckMarkIcon");
}

- (void)_updateCheckMarkIcon
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805E8]);
  -[PSTableCell iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AXUIVoiceOverBluetoothDeviceTableCell checkedImage](AXUIVoiceOverBluetoothDeviceTableCell, "checkedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

    -[PSTableCell iconImageView](self, "iconImageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[AXUIVoiceOverBluetoothDeviceTableCell selectedCheckedImage](AXUIVoiceOverBluetoothDeviceTableCell, "selectedCheckedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlightedImage:", v6);

  }
  else
  {
    +[AXUIVoiceOverBluetoothDeviceTableCell spacerImage](AXUIVoiceOverBluetoothDeviceTableCell, "spacerImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v7);

    -[PSTableCell iconImageView](self, "iconImageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlightedImage:", 0);
  }

}

+ (id)spacerImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)spacerImage__spacer;
  if (!spacerImage__spacer)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("SearchResultsCheckmarkClear.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)spacerImage__spacer;
    spacerImage__spacer = v3;

    v2 = (void *)spacerImage__spacer;
  }
  return v2;
}

+ (id)checkedImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)checkedImage__checkedImage;
  if (!checkedImage__checkedImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)checkedImage__checkedImage;
    checkedImage__checkedImage = v5;

    v2 = (void *)checkedImage__checkedImage;
  }
  return v2;
}

+ (id)selectedCheckedImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)selectedCheckedImage__selectedChecked;
  if (!selectedCheckedImage__selectedChecked)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UIPreferencesWhiteCheck.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)selectedCheckedImage__selectedChecked;
    selectedCheckedImage__selectedChecked = v3;

    v2 = (void *)selectedCheckedImage__selectedChecked;
  }
  return v2;
}

+ (id)textForBTPairedState:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 5)
  {
    v5 = 0;
  }
  else
  {
    AXUILocalizedStringForKey(off_1E76ABC30[a3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "appendString:", v5);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
