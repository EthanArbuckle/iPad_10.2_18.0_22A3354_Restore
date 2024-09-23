@implementation CNQuickActionButton

- (CNQuickActionButton)initWithFrame:(CGRect)a3
{
  CNQuickActionButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNQuickActionButton;
  v3 = -[CNQuickActionButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CNQuickActionButton button](v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", v3, sel_performAction, 64);

  -[CNQuickActionButton button](v3, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel_onLongPress_);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

  -[CNQuickActionButton button](v3, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  +[CNUIColorRepository quickActionButtonTintColor](CNUIColorRepository, "quickActionButtonTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionButton button](v3, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v9);

  return v3;
}

- (void)setAction:(id)a3
{
  void *v5;
  void *v6;
  CNQuickAction *v7;

  v7 = (CNQuickAction *)a3;
  if (self->_action != v7)
  {
    objc_storeStrong((id *)&self->_action, a3);
    -[CNQuickAction imageForContext:](v7, "imageForContext:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionButton button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:forState:", v5, 0);

  }
}

- (void)setShowTitle:(BOOL)a3
{
  self->_showTitle = a3;
  -[CNQuickActionButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  if (self->_showBackgroundPlatter != a3)
  {
    self->_showBackgroundPlatter = a3;
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transportBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionButton button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[CNQuickActionButton button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    if (v9 == 0.0)
    {
      if (RoundToScale_onceToken != -1)
        dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
      v9 = *(double *)&RoundToScale___s;
    }
    v10 = 19.0;
    if (v9 != 1.0)
      v10 = round(v9 * 18.5) / v9;

    -[CNQuickActionButton button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v10);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = 1.0 / v14;
    -[CNQuickActionButton button](self, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderWidth:", v15);

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transportBorderColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[CNQuickActionButton button](self, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderColor:", v19);

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CNQuickActionButton;
  -[CNQuickActionButton updateConstraints](&v23, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNQuickActionButton activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E08];
  v24 = CFSTR("button");
  -[CNQuickActionButton button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNQuickActionButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 7, 0, 0, 0, 1.0, 37.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[CNQuickActionButton button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, 0, 0, 1.0, 37.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  if (-[CNQuickActionButton showTitle](self, "showTitle"))
  {
    -[CNQuickActionButton label](self, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("label"));

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[button]-[label]|"), 512, 0, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v17);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[CNQuickActionButton button](self, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, self, 9, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

    v21 = (void *)MEMORY[0x1E0CB3718];
    -[CNQuickActionButton button](self, "button");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, self, 10, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  -[CNQuickActionButton setActivatedConstraints:](self, "setActivatedConstraints:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);

}

- (void)performAction
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[CNQuickActionButton action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "setSourceView:", self);
    -[CNQuickActionButton delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionButton action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "quickActionButton:performAction:", self, v5);

    if ((v6 & 1) == 0)
      objc_msgSend(v7, "perform");
    objc_msgSend(v7, "setSourceView:", 0);
    v3 = v7;
  }

}

- (void)onLongPress:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[CNQuickActionButton action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLongPress:", 1);

    -[CNQuickActionButton performAction](self, "performAction");
    -[CNQuickActionButton action](self, "action");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsLongPress:", 0);

  }
}

- (UIButton)button
{
  UIButton *button;
  UIButton *v4;
  UIButton *v5;

  button = self->_button;
  if (!button)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_button;
    self->_button = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    button = self->_button;
  }
  -[CNQuickActionButton addSubview:](self, "addSubview:", button);
  return self->_button;
}

- (UILabel)label
{
  UILabel *label;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_label;
    self->_label = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_label, "setFont:", v7);

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 1);
    -[CNQuickActionButton tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_label, "setTextColor:", v8);

    label = self->_label;
  }
  -[CNQuickActionButton addSubview:](self, "addSubview:", label);
  -[CNQuickActionButton action](self, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleForContext:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v10);

  -[UILabel sizeToFit](self->_label, "sizeToFit");
  return self->_label;
}

- (CNQuickAction)action
{
  return self->_action;
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (CNQuickActionButtonDelegate)delegate
{
  return (CNQuickActionButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
