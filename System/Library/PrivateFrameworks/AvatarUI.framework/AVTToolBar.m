@implementation AVTToolBar

+ (double)defaultToolBarHeight
{
  return 60.0;
}

- (AVTToolBar)initWithButtons:(id)a3
{
  id v4;
  AVTToolBar *v5;
  AVTToolBar *v6;
  AVTToolBar *v7;
  uint64_t v8;
  NSArray *buttons;
  _QWORD v11[4];
  AVTToolBar *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTToolBar;
  v5 = -[AVTToolBar initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__AVTToolBar_initWithButtons___block_invoke;
    v11[3] = &unk_1EA51F1B8;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v4, "avt_map:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    buttons = v7->_buttons;
    v7->_buttons = (NSArray *)v8;

    -[AVTToolBar setupView](v7, "setupView");
    -[AVTToolBar setupBorder](v7, "setupBorder");

  }
  return v6;
}

id __30__AVTToolBar_initWithButtons___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDefault");

  objc_msgSend(v2, "buttonWithTitle:isDefault:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buttonWithTitle:(id)a3 isDefault:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "setRole:", 1);
  objc_msgSend(v8, "setTitle:forState:", v6, 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 90.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  return v8;
}

- (void)setupBorder
{
  id v3;
  UIView *v4;
  UIView *border;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[AVTToolBar bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
  border = self->_border;
  self->_border = v4;

  +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_border, "setBackgroundColor:", v6);

  -[UIView setAutoresizingMask:](self->_border, "setAutoresizingMask:", 34);
  -[AVTToolBar addSubview:](self, "addSubview:", self->_border);
}

- (void)setupView
{
  objc_class *v3;
  AVTToolBar *v4;
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
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v19);
  -[AVTToolBar bounds](self, "bounds");
  objc_msgSend(v18, "setFrame:");
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  -[AVTToolBar addSubview:](self, "addSubview:", v18);
  -[AVTToolBar setVisualEffectView:](self, "setVisualEffectView:", v18);
  v3 = (objc_class *)MEMORY[0x1E0CEA9E0];
  v4 = self;
  v5 = [v3 alloc];
  -[AVTToolBar buttons](v4, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v6);

  objc_msgSend(v7, "setAlignment:", 3);
  objc_msgSend(v7, "setDistribution:", 1);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setSpacing:", 8.0);
  -[AVTToolBar addSubview:](v4, "addSubview:", v7);
  objc_msgSend(v7, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTToolBar topAnchor](v4, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(v7, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTToolBar bottomAnchor](v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTToolBar trailingAnchor](v4, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -20.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTToolBar addConstraints:](v4, "addConstraints:", v15);

}

- (double)borderWidth
{
  return AVTRoundToViewScale(self, 1.0);
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
  v8.super_class = (Class)AVTToolBar;
  -[AVTToolBar layoutSubviews](&v8, sel_layoutSubviews);
  -[AVTToolBar bounds](self, "bounds");
  v4 = v3;
  -[AVTToolBar borderWidth](self, "borderWidth");
  v6 = v5;
  -[AVTToolBar border](self, "border");
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
    -[AVTToolBar visualEffectView](self, "visualEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    if (v3)
      objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTToolBar setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (void)setEnabled:(BOOL)a3 forButtonAtIndex:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  id v11;

  v5 = a3;
  -[AVTToolBar buttons](self, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a4)
  {
    -[AVTToolBar buttons](self, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setEnabled:", v5);
    v10 = 0.7;
    if (v5)
      v10 = 1.0;
    objc_msgSend(v11, "setAlpha:", v10);

  }
}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[AVTToolBar buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[AVTToolBar delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolbar:didSelectButton:atIndex:", self, v4, v6);

}

- (AVTToolBarDelegate)delegate
{
  return (AVTToolBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
