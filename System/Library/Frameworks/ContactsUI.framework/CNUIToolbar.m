@implementation CNUIToolbar

- (CNUIToolbar)initWithItems:(id)a3
{
  id v5;
  CNUIToolbar *v6;
  CNUIToolbar *v7;
  CNUIToolbar *v8;
  uint64_t v9;
  NSArray *buttons;
  _QWORD v12[4];
  CNUIToolbar *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIToolbar;
  v6 = -[CNUIToolbar initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __29__CNUIToolbar_initWithItems___block_invoke;
    v12[3] = &unk_1E2048C40;
    v8 = v7;
    v13 = v8;
    objc_msgSend(v5, "_cn_map:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    buttons = v8->_buttons;
    v8->_buttons = (NSArray *)v9;

    -[CNUIToolbar setupView](v8, "setupView");
    -[CNUIToolbar setupBorder](v8, "setupBorder");

  }
  return v7;
}

- (id)buttonForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 127);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDefault") & 1) != 0)
  {
    v6 = 1;
LABEL_5:
    objc_msgSend(v5, "setRole:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isCancel"))
  {
    v6 = 2;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", 90.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  return v5;
}

- (void)setupBorder
{
  id v3;
  UIView *v4;
  UIView *border;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CNUIToolbar bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
  border = self->_border;
  self->_border = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_border, "setBackgroundColor:", v6);

  -[UIView setAutoresizingMask:](self->_border, "setAutoresizingMask:", 34);
  -[CNUIToolbar addSubview:](self, "addSubview:", self->_border);
}

- (void)setupView
{
  objc_class *v3;
  CNUIToolbar *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v19);
  -[CNUIToolbar bounds](self, "bounds");
  objc_msgSend(v18, "setFrame:");
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  -[CNUIToolbar addSubview:](self, "addSubview:", v18);
  -[CNUIToolbar setVisualEffectView:](self, "setVisualEffectView:", v18);
  v3 = (objc_class *)MEMORY[0x1E0DC3CA8];
  v4 = self;
  v5 = [v3 alloc];
  -[CNUIToolbar buttons](v4, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v6);

  objc_msgSend(v7, "setAlignment:", 3);
  objc_msgSend(v7, "setDistribution:", 4);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setSpacing:", 8.0);
  -[CNUIToolbar addSubview:](v4, "addSubview:", v7);
  objc_msgSend(v7, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIToolbar topAnchor](v4, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(v7, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIToolbar bottomAnchor](v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIToolbar trailingAnchor](v4, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -20.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIToolbar addConstraints:](v4, "addConstraints:", v15);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[CNUIToolbar _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  if (v3 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v3 = *(double *)&RoundToScale___s;
  }
  v4 = 1.0;
  if (v3 != 1.0)
    v4 = round(v3) / v3;

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNUIToolbar;
  -[CNUIToolbar layoutSubviews](&v8, sel_layoutSubviews);
  -[CNUIToolbar bounds](self, "bounds");
  v4 = v3;
  -[CNUIToolbar borderWidth](self, "borderWidth");
  v6 = v5;
  -[CNUIToolbar border](self, "border");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

}

- (void)setIsAnimating:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_isAnimating != a3)
  {
    v3 = a3;
    self->_isAnimating = a3;
    -[CNUIToolbar visualEffectView](self, "visualEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNUIToolbar setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (BOOL)isEnabledForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNUIToolbar items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[CNUIToolbar buttons](self, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "isEnabled");
  return (char)v8;
}

- (void)setEnabled:(BOOL)a3 forItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;

  v4 = a3;
  v6 = a4;
  -[CNUIToolbar items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CNUIToolbar buttons](self, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setEnabled:", v4);
    v10 = 0.7;
    if (v4)
      v10 = 1.0;
    objc_msgSend(v11, "setAlpha:", v10);

  }
}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v4 = a3;
  -[CNUIToolbar buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[CNUIToolbar items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "actionBlock");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v9);

}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIView)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
  objc_storeStrong((id *)&self->_border, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

uint64_t __29__CNUIToolbar_initWithItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "buttonForItem:", a2);
}

+ (double)defaultToolBarHeight
{
  return 60.0;
}

@end
