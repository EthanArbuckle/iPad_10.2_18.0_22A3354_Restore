@implementation HUAlarmEditableTextCell

- (HUAlarmEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUAlarmEditableTextCell *v4;
  HUAlarmEditableTextCell *v5;
  id v6;
  uint64_t v7;
  UITextField *textField;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUAlarmEditableTextCell;
  v4 = -[HUAlarmEditableTextCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    -[HUAlarmEditableTextCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CEAAD0]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textField = v5->_textField;
    v5->_textField = (UITextField *)v7;

    -[UITextField setBorderStyle:](v5->_textField, "setBorderStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v5->_textField, "setFont:", v9);

    -[UITextField setAdjustsFontSizeToFitWidth:](v5->_textField, "setAdjustsFontSizeToFitWidth:", 1);
    -[UITextField setReturnKeyType:](v5->_textField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v5->_textField, "setClearButtonMode:", 3);
    -[UITextField setDelegate:](v5->_textField, "setDelegate:", v5);
    -[UITextField setEnablesReturnKeyAutomatically:](v5->_textField, "setEnablesReturnKeyAutomatically:", 1);
    -[UITextField _clearButton](v5->_textField, "_clearButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_flatImageWithColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextField _clearButton](v5->_textField, "_clearButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:forState:", v13, 0);

    -[HUAlarmEditableTextCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5->_textField);

  }
  return v5;
}

- (int64_t)autocapitalizationType
{
  void *v2;
  int64_t v3;

  -[HUAlarmEditableTextCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocapitalizationType");

  return v3;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  id v4;

  -[HUAlarmEditableTextCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", a3);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUAlarmEditableTextCell;
  -[HUAlarmEditableTextCell layoutSubviews](&v15, sel_layoutSubviews);
  -[HUAlarmEditableTextCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isUserInteractionEnabled");

  -[HUAlarmEditableTextCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[HUAlarmEditableTextCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  UIRectCenteredYInRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[HUAlarmEditableTextCell textField](self, "textField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", kHUEditAlarmTitleFinishedNotification, 0);

  }
  return v4 != 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[HUAlarmEditableTextCell isUserInteractionEnabled](self, "isUserInteractionEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HUAlarmEditableTextCell;
    -[HUAlarmEditableTextCell setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, v3);
    -[UITextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", v3);
    -[HUAlarmEditableTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_enabled = a3;
  -[HUAlarmEditableTextCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  -[HUAlarmEditableTextCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[HUAlarmEditableTextCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  -[HUAlarmEditableTextCell textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v7);

  -[HUAlarmEditableTextCell textField](self, "textField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClearButtonMode:", v8);

}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
