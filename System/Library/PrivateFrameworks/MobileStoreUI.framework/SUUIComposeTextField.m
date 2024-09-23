@implementation SUUIComposeTextField

- (SUUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7;
  SUUIComposeTextField *v8;
  SUUIComposeTextField *v9;
  id *p_configuration;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *label;
  UILabel *v15;
  void *v16;
  UITextField *v17;
  UITextField *textField;
  UITextField *v19;
  void *v20;
  UITextField *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIComposeTextField;
  v8 = -[SUUIComposeTextField initWithFrame:](&v26, sel_initWithFrame_, 0.0, 0.0, 0.0, 44.0);
  v9 = v8;
  if (v8)
  {
    p_configuration = (id *)&v8->_configuration;
    objc_storeStrong((id *)&v8->_configuration, a3);
    v9->_style = a4;
    objc_msgSend((id)objc_opt_class(), "labelFontForStyle:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_configuration, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      label = v9->_label;
      v9->_label = v13;

      -[UILabel setFont:](v9->_label, "setFont:", v11);
      -[UILabel setText:](v9->_label, "setText:", v12);
      v15 = v9->_label;
      objc_msgSend((id)objc_opt_class(), "labelColorForStyle:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v15, "setTextColor:", v16);

      -[UILabel sizeToFit](v9->_label, "sizeToFit");
      -[SUUIComposeTextField addSubview:](v9, "addSubview:", v9->_label);
    }
    v17 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    textField = v9->_textField;
    v9->_textField = v17;

    -[UITextField addTarget:action:forControlEvents:](v9->_textField, "addTarget:action:forControlEvents:", v9, sel__textChanged_, 0x20000);
    -[UITextField setAutocapitalizationType:](v9->_textField, "setAutocapitalizationType:", 2);
    -[UITextField setAutocorrectionType:](v9->_textField, "setAutocorrectionType:", 0);
    -[UITextField setDelegate:](v9->_textField, "setDelegate:", v9);
    v19 = v9->_textField;
    objc_msgSend((id)objc_opt_class(), "labelFontForStyle:", v9->_style);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v19, "setFont:", v20);

    -[UITextField setKeyboardType:](v9->_textField, "setKeyboardType:", 0);
    v21 = v9->_textField;
    objc_msgSend(v7, "placeholder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v21, "setPlaceholder:", v22);

    -[UITextField setClipsToBounds:](v9->_textField, "setClipsToBounds:", 0);
    objc_msgSend(*p_configuration, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIComposeTextField setText:](v9, "setText:", v23);

    -[SUUIComposeTextField addSubview:](v9, "addSubview:", v9->_textField);
    -[UITextField sizeToFit](v9->_textField, "sizeToFit");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIComposeTextField setBackgroundColor:](v9, "setBackgroundColor:", v24);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextField removeTarget:action:forControlEvents:](self->_textField, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeTextField;
  -[SUUIComposeTextField dealloc](&v3, sel_dealloc);
}

+ (id)labelFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a3, 17.0);
}

+ (id)labelColorForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor", a3);
}

- (SUUIComposeTextFieldConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isValid
{
  return self->_currentTextLength > 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)text
{
  return -[UITextField text](self->_textField, "text");
}

- (void)setText:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  if (v4 <= -[SUUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"))
  {
    v6 = v7;
  }
  else
  {
    objc_msgSend(v7, "substringToIndex:", -[SUUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"));
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  v8 = v6;
  -[UITextField setText:](self->_textField, "setText:", v6);
  self->_currentTextLength = objc_msgSend(v8, "length");

}

- (void)drawRect:(CGRect)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;

  v4 = 0;
  if (-[SUUIComposeTextFieldConfiguration columnIndex](self->_configuration, "columnIndex", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v5 = 0.0;
  }
  else
  {
    v5 = 15.0;
  }
  -[SUUIComposeTextFieldConfiguration borderInsets](self->_configuration, "borderInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SUUIComposeTextField bounds](self, "bounds");
  v46 = v15;
  v47 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "set");

  v22 = -[SUUIComposeTextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v23 = v22;
  if (v7 > 0.0)
  {
    v24 = v17 - v5;
    if (v22 == 1)
    {
      v25 = CGRectWithFlippedOriginRelativeToBoundingRect(v5, 0.0, v24, v7, v47, v46, v17, v19);
      v4 = v26;
      v7 = v27;
    }
    else
    {
      v25 = v5;
    }
    v28 = v4;
    v29 = v7;
    UIRectFillUsingBlendMode(*(CGRect *)(&v24 - 2), kCGBlendModeNormal);
  }
  if (v11 > 0.0)
  {
    v30 = v17 - v5;
    v31 = v19 - v11;
    if (v23 == 1)
    {
      v5 = CGRectWithFlippedOriginRelativeToBoundingRect(v5, v31, v30, v11, v47, v46, v17, v19);
      v11 = v32;
    }
    v33 = v5;
    v34 = v11;
    UIRectFillUsingBlendMode(*(CGRect *)(&v31 - 1), kCGBlendModeNormal);
  }
  if (v9 > 0.0)
  {
    v35 = 0;
    if (v23 == 1)
    {
      v36 = CGRectWithFlippedOriginRelativeToBoundingRect(0.0, 0.0, v9, v19, v47, v46, v17, v19);
      v9 = v38;
    }
    else
    {
      v37 = v19;
      v36 = 0.0;
    }
    v39 = v9;
    UIRectFillUsingBlendMode(*(CGRect *)(&v35 - 1), kCGBlendModeNormal);
  }
  if (v13 > 0.0)
  {
    v40 = v17 - v13;
    v41 = 0;
    if (v23 == 1)
    {
      v40 = CGRectWithFlippedOriginRelativeToBoundingRect(v40, 0.0, v13, v19, v47, v46, v17, v19);
      v13 = v42;
      v19 = v43;
    }
    v44 = v13;
    v45 = v19;
    UIRectFillUsingBlendMode(*(CGRect *)&v40, kCGBlendModeNormal);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIComposeTextField;
  -[SUUIComposeTextField hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UITextField *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UITextField *)self)
  {
    v5 = self->_textField;

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *label;
  double width;
  double height;
  float v14;
  double v15;
  double v16;
  double MaxX;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  double v26;
  CGFloat v27;
  CGRect v28;

  -[SUUIComposeTextField bounds](self, "bounds");
  v27 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -[SUUIComposeTextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    width = v28.size.width;
    height = v28.size.height;
    v14 = (v9 - v28.size.height) * 0.5;
    v15 = floorf(v14);
    v16 = 15.0;
    v28.origin.x = 15.0;
    v28.origin.y = v15;
    MaxX = CGRectGetMaxX(v28);
    v18 = 4.0;
    if (v10 == 1)
    {
      v16 = CGRectWithFlippedOriginRelativeToBoundingRect(15.0, v15, width, height, v27, v5, v7, v9);
      v18 = 4.0;
      v15 = v19;
      width = v20;
      height = v21;
    }
    v22 = MaxX + v18;
    -[UILabel setFrame:](self->_label, "setFrame:", v16, v15, width, height);
  }
  else
  {
    v22 = 15.0;
  }
  -[UITextField frame](self->_textField, "frame");
  v24 = (v9 - v23) * 0.5;
  v25 = floorf(v24);
  v26 = v7 + -15.0 - v22;
  if (v10 == 1)
    v22 = CGRectWithFlippedOriginRelativeToBoundingRect(v22, v25, v26, v23, v27, v5, v7, v9);
  -[UITextField setFrame:](self->_textField, "setFrame:", v22, v25, v26);
}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  int64_t currentTextLength;
  int64_t v10;
  uint64_t v11;
  BOOL v12;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  if (self->_currentTextLength <= location + length)
    currentTextLength = location + length;
  else
    currentTextLength = self->_currentTextLength;
  if (-[SUUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"))
    v10 = -[SUUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength");
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = objc_msgSend(v8, "length") - length + currentTextLength;
  if (v11 <= v10)
    self->_currentTextLength = v11 & ~(v11 >> 63);
  v12 = v11 <= v10;

  return v12;
}

- (void)_textChanged:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "composeTextFieldValidityChanged:", self);

}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
