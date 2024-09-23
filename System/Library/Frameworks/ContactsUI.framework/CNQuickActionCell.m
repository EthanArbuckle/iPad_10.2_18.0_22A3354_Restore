@implementation CNQuickActionCell

- (CNQuickActionCell)initWithFrame:(CGRect)a3
{
  CNQuickActionCell *v3;
  CNQuickActionButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CNQuickActionCell;
  v3 = -[CNQuickActionCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(CNQuickActionButton);
  -[CNQuickActionButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNQuickActionCell contentView](v3, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[CNQuickActionCell setButton:](v3, "setButton:", v4);
  v13 = CFSTR("button");
  -[CNQuickActionCell button](v3, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[button]|"), 0, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[button]|"), 0, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
  return v3;
}

- (void)setShowTitle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showTitle != a3)
  {
    v3 = a3;
    self->_showTitle = a3;
    -[CNQuickActionCell button](self, "button");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowTitle:", v3);

  }
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showBackgroundPlatter != a3)
  {
    v3 = a3;
    self->_showBackgroundPlatter = a3;
    -[CNQuickActionCell button](self, "button");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowBackgroundPlatter:", v3);

  }
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (CNQuickActionButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
