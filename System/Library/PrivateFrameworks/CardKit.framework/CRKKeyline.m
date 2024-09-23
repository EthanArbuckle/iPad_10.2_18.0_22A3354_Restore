@implementation CRKKeyline

- (CRKKeyline)initWithType:(int64_t)a3 direction:(int64_t)a4 visualEffectStyle:(unint64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  CRKKeyline *v11;
  CRKKeyline *v12;
  uint64_t v13;
  UIView *keylineView;
  UIView *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRKKeyline;
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = -[CRKKeyline initWithFrame:](&v18, sel_initWithFrame_, a3, a4, *MEMORY[0x24BDBF090], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v7, v8, v9, v10);
    keylineView = v12->_keylineView;
    v12->_keylineView = (UIView *)v13;

    v12->_visualEffectStyle = a5;
    v15 = v12->_keylineView;
    -[CRKKeyline _keylineColorForVisualEffectStyle:](v12, "_keylineColorForVisualEffectStyle:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setHidden:](v12->_keylineView, "setHidden:", a3 == 0);
    -[CRKKeyline addSubview:](v12, "addSubview:", v12->_keylineView);
  }
  return v12;
}

- (id)_keylineColorForVisualEffectStyle:(unint64_t)a3
{
  double v3;

  v3 = 0.0;
  if (a3 == 1)
    v3 = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v3, 0.18);
}

- (double)_roundedKeylineThickness
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  result = 1.0;
  if (v4 != 1.0)
    return 1.0 / v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  int64_t direction;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CRKKeyline _roundedKeylineThickness](self, "_roundedKeylineThickness");
  direction = self->_direction;
  if (direction)
  {
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (direction == 1)
    {
      v8 = height;
      width = v6;
    }
    else
    {
      width = *MEMORY[0x24BDBF148];
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CRKKeyline sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)defaultKeylineInsetForCurrentDevice
{
  void *v2;
  uint64_t v3;
  double result;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 16.0;
  if (v3 != 2)
  {
    v5 = CRKIsLargeDevice();
    result = 16.0;
    if (v5)
      return 20.0;
  }
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t type;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRKKeyline;
  -[CRKKeyline layoutSubviews](&v21, sel_layoutSubviews);
  -[CRKKeyline bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  type = self->_type;
  v12 = 0.0;
  if (type == 1)
  {
    -[CRKKeyline defaultKeylineInsetForCurrentDevice](self, "defaultKeylineInsetForCurrentDevice");
    v13 = v16;
  }
  else if (type == 2)
  {
    -[CRKKeyline defaultKeylineInsetForCurrentDevice](self, "defaultKeylineInsetForCurrentDevice");
    v12 = v17;
    v13 = 43.0;
  }
  else
  {
    v13 = 0.0;
    if (type == 3)
    {
      -[CRKKeyline defaultKeylineInsetForCurrentDevice](self, "defaultKeylineInsetForCurrentDevice");
      v13 = v14;
      -[CRKKeyline defaultKeylineInsetForCurrentDevice](self, "defaultKeylineInsetForCurrentDevice");
      v12 = v15;
    }
  }
  v18 = CRKIsRTL(self);
  if (v18)
    v19 = v12;
  else
    v19 = v13;
  if (v18)
    v20 = v13;
  else
    v20 = v12;
  -[UIView setFrame:](self->_keylineView, "setFrame:", v4 + v19, v6, v8 - (v19 + v20), v10);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)direction
{
  return self->_direction;
}

- (unint64_t)visualEffectStyle
{
  return self->_visualEffectStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keylineView, 0);
}

@end
