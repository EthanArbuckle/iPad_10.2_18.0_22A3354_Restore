@implementation AVControlItem

- (AVControlItem)initWithTitle:(id)a3 type:(int64_t)a4
{
  id v6;
  AVControlItem *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVControlItem;
  v7 = -[AVControlItem init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_type = a4;
    v7->_enabled = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_secondGenerationControl = 1;
    -[AVControlItem _createButton](v7, "_createButton");
  }

  return v7;
}

- (UIMenu)menu
{
  return (UIMenu *)-[AVButton menu](self->_button, "menu");
}

- (void)setAction:(id)a3
{
  void *v4;
  id action;

  if (self->_action != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    action = self->_action;
    self->_action = v4;

    -[AVControlItem _updateShowsMenuAsPrimaryActionStateIfNeeded](self, "_updateShowsMenuAsPrimaryActionStateIfNeeded");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

    -[AVControlItem _updateButton](self, "_updateButton");
    -[AVControlItem _updateTintColor](self, "_updateTintColor");
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[AVControlItem _updateButton](self, "_updateButton");
    -[AVControlItem _updateTintColor](self, "_updateTintColor");
    v5 = v6;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVControlItem _updateButton](self, "_updateButton");
  }
}

- (void)setMenu:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVButton menu](self->_button, "menu");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[AVButton setMenu:](self->_button, "setMenu:", v6);
    -[AVControlItem _updateShowsMenuAsPrimaryActionStateIfNeeded](self, "_updateShowsMenuAsPrimaryActionStateIfNeeded");
    -[AVControlItem _updateButton](self, "_updateButton");
    v5 = v6;
  }

}

- (void)setTintColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    +[AVBackdropView secondaryGlyphTintColor](AVBackdropView, "secondaryGlyphTintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_tintColor != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_tintColor, v4);
    -[AVControlItem _updateTintColor](self, "_updateTintColor");
    v4 = v5;
  }

}

- (void)setTitleFont:(id)a3
{
  id v4;
  double v5;
  id obj;

  v4 = a3;
  if (!v4)
  {
    v5 = 20.0;
    if (!self->_secondGenerationControl)
      v5 = 12.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if ((-[UIFont isEqual:](self->_titleFont, "isEqual:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, obj);
    -[AVControlItem _updateButton](self, "_updateButton");
  }

}

- (id)titleFont
{
  return self->_titleFont;
}

- (void)_updateTintColor
{
  void *v3;

  -[AVControlItem tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView applyGlyphTintColor:toView:](AVBackdropView, "applyGlyphTintColor:toView:", v3, self->_button);

  -[AVControlItem _notifyDelegateOfChangesIfNeeded](self, "_notifyDelegateOfChangesIfNeeded");
}

- (void)setSecondGenerationControl:(BOOL)a3
{
  if (self->_secondGenerationControl != a3)
  {
    self->_secondGenerationControl = a3;
    -[AVControlItem _createButton](self, "_createButton");
  }
}

- (UIView)view
{
  return (UIView *)self->_button;
}

- (void)_createButton
{
  AVButton *button;
  _BOOL8 v4;
  AVButton *v5;
  AVButton *v6;

  button = self->_button;
  if (button)
  {
    self->_button = 0;

  }
  v4 = !self->_secondGenerationControl && self->_type == 2;
  +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", self->_title, self->_secondGenerationControl);
  v5 = (AVButton *)objc_claimAutoreleasedReturnValue();
  v6 = self->_button;
  self->_button = v5;

  -[AVButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTouchUpInside_, 64);
  -[AVButton setUsesBackgroundEffectViewForTextOnlyButtons:](self->_button, "setUsesBackgroundEffectViewForTextOnlyButtons:", v4);
  -[AVControlItem setTitleFont:](self, "setTitleFont:", 0);
  -[AVControlItem setTintColor:](self, "setTintColor:", 0);
  -[AVControlItem _updateButton](self, "_updateButton");
}

- (void)setAccessibilityLabel:(id)a3
{
  -[AVButton setAccessibilityLabel:](self->_button, "setAccessibilityLabel:", a3);
}

- (id)accessibilityLabel
{
  return -[AVButton accessibilityLabel](self->_button, "accessibilityLabel");
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  -[AVButton setAccessibilityAttributedLabel:](self->_button, "setAccessibilityAttributedLabel:", a3);
}

- (id)accessibilityAttributedLabel
{
  return (id)-[AVButton accessibilityAttributedLabel](self->_button, "accessibilityAttributedLabel");
}

- (void)setAccessibilityHint:(id)a3
{
  -[AVButton setAccessibilityHint:](self->_button, "setAccessibilityHint:", a3);
}

- (id)accessibilityHint
{
  return (id)-[AVButton accessibilityHint](self->_button, "accessibilityHint");
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  -[AVButton setAccessibilityAttributedHint:](self->_button, "setAccessibilityAttributedHint:", a3);
}

- (id)accessibilityAttributedHint
{
  return (id)-[AVButton accessibilityAttributedHint](self->_button, "accessibilityAttributedHint");
}

- (void)setAccessibilityIdentifier:(id)a3
{
  -[AVButton setAccessibilityIdentifier:](self->_button, "setAccessibilityIdentifier:", a3);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)-[AVButton accessibilityIdentifier](self->_button, "accessibilityIdentifier");
}

- (void)_buttonTouchUpInside:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AVControlItem action](self, "action", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVControlItem action](self, "action");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)_formattedTitleString
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (self->_secondGenerationControl)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CA80F0]);
    v4 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[AVControlItem title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = *MEMORY[0x1E0DC1138];
    -[AVControlItem titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CA80D0];
    v17[0] = v6;
    v17[1] = v3;
    v8 = *MEMORY[0x1E0DC1140];
    v16[1] = v7;
    v16[2] = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v10);

    return v11;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[AVControlItem title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, 0);

    return v15;
  }
}

- (void)_notifyDelegateOfChangesIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[AVControlItem delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AVControlItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[AVControlItem delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlItemDidUpdateVisualConfiguration:", self);

    }
  }
}

- (void)_updateButton
{
  AVButton *button;
  void *v4;
  AVButton *v5;
  void *v6;
  void *v7;
  _BOOL4 secondGenerationControl;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  button = self->_button;
  -[AVControlItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVButton setAccessibilityLabel:](button, "setAccessibilityLabel:", v4);

  -[AVButton setEnabled:](self->_button, "setEnabled:", -[AVControlItem isEnabled](self, "isEnabled"));
  v5 = self->_button;
  -[AVControlItem image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVButton setImage:forState:](v5, "setImage:forState:", v6, 0);

  -[AVControlItem image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[AVButton setAppliesTransformToImageViewWhenHighlighted:](self->_button, "setAppliesTransformToImageViewWhenHighlighted:", 1);
  secondGenerationControl = self->_secondGenerationControl;
  -[AVControlItem image](self, "image");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (secondGenerationControl)
  {
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      -[AVControlItem _formattedTitleString](self, "_formattedTitleString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[AVButton setAttributedTitle:forState:](self->_button, "setAttributedTitle:forState:", v11, 0);
  }
  else
  {
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      -[AVControlItem title](self, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[AVButton setTitle:forState:](self->_button, "setTitle:forState:", v11, 0);
  }

  -[AVButton titleLabel](self->_button, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVControlItem titleFont](self, "titleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  -[AVControlItem _notifyDelegateOfChangesIfNeeded](self, "_notifyDelegateOfChangesIfNeeded");
}

- (void)_updateShowsMenuAsPrimaryActionStateIfNeeded
{
  -[AVButton setShowsMenuAsPrimaryAction:](self->_button, "setShowsMenuAsPrimaryAction:", self->_action == 0);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)action
{
  return self->_action;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (AVControlItemDelegate)delegate
{
  return (AVControlItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isSecondGenerationControl
{
  return self->_secondGenerationControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
