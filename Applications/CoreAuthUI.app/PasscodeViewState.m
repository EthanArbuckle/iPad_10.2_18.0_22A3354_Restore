@implementation PasscodeViewState

- (PasscodeViewState)initWithRawValue:(int64_t)a3 title:(id)a4 subtitle:(id)a5 accessoryView:(id)a6 style:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PasscodeViewState *v17;
  PasscodeViewState *v18;
  PasscodeViewStyle *v19;
  PasscodeViewStyle *style;
  objc_super v22;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PasscodeViewState;
  v17 = -[PasscodeViewState init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    v17->_rawValue = a3;
    objc_storeStrong((id *)&v17->_title, a4);
    objc_storeStrong((id *)&v18->_subtitle, a5);
    objc_storeStrong((id *)&v18->_accessoryView, a6);
    if (v16)
      v19 = (PasscodeViewStyle *)v16;
    else
      v19 = (PasscodeViewStyle *)objc_claimAutoreleasedReturnValue(+[PasscodeViewStyle defaultStyleWithBackgroundStyle:](PasscodeViewStyle, "defaultStyleWithBackgroundStyle:", 0));
    style = v18->_style;
    v18->_style = v19;

  }
  return v18;
}

+ (id)activeStateWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5
{
  id v7;
  id v8;
  id v9;
  PasscodeViewState *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PasscodeViewState initWithRawValue:title:subtitle:accessoryView:style:]([PasscodeViewState alloc], "initWithRawValue:title:subtitle:accessoryView:style:", 0, v9, v8, v7, 0);

  return v10;
}

+ (id)backOffStateWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  PasscodeViewState *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PasscodeViewState initWithRawValue:title:subtitle:accessoryView:style:]([PasscodeViewState alloc], "initWithRawValue:title:subtitle:accessoryView:style:", 1, v6, v5, 0, 0);

  return v7;
}

- (id)withStyle:(id)a3
{
  id v4;
  PasscodeViewState *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PasscodeViewState *v10;

  v4 = a3;
  v5 = [PasscodeViewState alloc];
  v6 = -[PasscodeViewState rawValue](self, "rawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState subtitle](self, "subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self, "accessoryView"));
  v10 = -[PasscodeViewState initWithRawValue:title:subtitle:accessoryView:style:](v5, "initWithRawValue:title:subtitle:accessoryView:style:", v6, v7, v8, v9, v4);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  BOOL v19;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = -[PasscodeViewState rawValue](self, "rawValue");
    if (v8 != objc_msgSend(v7, "rawValue"))
      goto LABEL_8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState style](self, "style"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "style"));

    if (v9 != v10)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState title](self, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState subtitle](self, "subtitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitle"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewState accessoryView](self, "accessoryView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryView"));
      v19 = v17 == v18;

    }
    else
    {
LABEL_8:
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (PasscodeViewStyle)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
