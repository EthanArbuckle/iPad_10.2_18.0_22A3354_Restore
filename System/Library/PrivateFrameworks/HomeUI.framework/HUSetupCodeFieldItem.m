@implementation HUSetupCodeFieldItem

- (HUSetupCodeFieldItem)init
{
  HUSetupCodeFieldItem *v2;
  HUSetupCodeFieldItem *v3;
  NSNumber *value;
  UILabel *v5;
  UILabel *digitLabel;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUSetupCodeFieldItem;
  v2 = -[HUSetupCodeFieldItem init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_active = 0;
    v2->_itemNumber = 0;
    value = v2->_value;
    v2->_value = 0;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    digitLabel = v3->_digitLabel;
    v3->_digitLabel = v5;

    -[UILabel setAutoresizingMask:](v3->_digitLabel, "setAutoresizingMask:", 18);
    -[UILabel setTextAlignment:](v3->_digitLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_digitLabel, "setFont:", v7);

    -[HUSetupCodeFieldItem addSubview:](v3, "addSubview:", v3->_digitLabel);
    -[UILabel setClipsToBounds:](v3->_digitLabel, "setClipsToBounds:", 0);
    -[HUSetupCodeFieldItem setClipsToBounds:](v3, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[HUSetupCodeFieldItem layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", v9);

    -[HUSetupCodeFieldItem layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 2.0);

    -[HUSetupCodeFieldItem layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 6.0);

  }
  return v3;
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HUSetupCodeFieldItem value](self, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v9)
  {
    objc_storeStrong((id *)&self->_value, a3);
    -[HUSetupCodeFieldItem value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupCodeFieldItem digitLabel](self, "digitLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
}

- (void)activate
{
  -[HUSetupCodeFieldItem setActive:](self, "setActive:", 1);
}

- (void)deactivate
{
  -[HUSetupCodeFieldItem setActive:](self, "setActive:", 0);
}

- (void)clear
{
  -[HUSetupCodeFieldItem setValue:](self, "setValue:", 0);
}

- (unint64_t)itemNumber
{
  return self->_itemNumber;
}

- (void)setItemNumber:(unint64_t)a3
{
  self->_itemNumber = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (UILabel)digitLabel
{
  return self->_digitLabel;
}

- (void)setDigitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_digitLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitLabel, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
