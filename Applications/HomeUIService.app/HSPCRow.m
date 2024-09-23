@implementation HSPCRow

+ (NSString)_reuseIdentifier
{
  return (NSString *)CFSTR("HSPCRow");
}

+ (CGSize)leftImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 24.0;
  v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)horizontalLeadingMargin
{
  return 16.0;
}

+ (double)horizontalTrailingMargin
{
  return 8.0;
}

+ (double)horizontalSpacing
{
  return 12.0;
}

+ (double)leadingSeparatorMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
  v3 = v2;
  +[HSPCRow leftImageSize](HSPCRow, "leftImageSize");
  v5 = v3 + v4;
  +[HSPCRow horizontalSpacing](HSPCRow, "horizontalSpacing");
  return v5 + v6;
}

- (HSPCRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSPCRow *v4;
  HSPCRow *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HSPCRow;
  v4 = -[HSPCRow initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HSPCRow setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v7 = (void *)objc_opt_new(UIView, v6);
    -[HSPCRow setBackgroundView:](v5, "setBackgroundView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow backgroundView](v5, "backgroundView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow contentView](v5, "contentView"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    -[HSPCRow setBackgroundColor:](v5, "setBackgroundColor:", v12);

    v13 = objc_alloc((Class)UITextField);
    -[HSPCRow bounds](v5, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    objc_msgSend(v14, "setClearButtonMode:", 3);
    objc_msgSend(v14, "setAutocapitalizationType:", 1);
    objc_msgSend(v14, "setReturnKeyType:", 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow contentView](v5, "contentView"));
    objc_msgSend(v15, "addSubview:", v14);

    objc_storeWeak((id *)&v5->_textField, v14);
  }
  return v5;
}

- (UIView)leftView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_leftView);
}

- (void)setLeftView:(id)a3
{
  objc_storeWeak((id *)&self->_leftView, a3);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (BOOL)constraintsSet
{
  return self->_constraintsSet;
}

- (void)setConstraintsSet:(BOOL)a3
{
  self->_constraintsSet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_leftView);
}

@end
