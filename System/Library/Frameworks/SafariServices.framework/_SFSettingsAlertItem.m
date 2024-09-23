@implementation _SFSettingsAlertItem

- (_SFSettingsAlertItem)initWithType:(int64_t)a3 action:(int64_t)a4
{
  _SFSettingsAlertItem *v6;
  _SFSettingsAlertItem *v7;
  _SFSettingsAlertItem *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertItem;
  v6 = -[_SFSettingsAlertItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_actionType = a4;
    v6->_enabled = 1;
    v8 = v6;
  }

  return v7;
}

- (void)_buttonCommonInitWithTextStyle:(id)a3 icon:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[_SFSettingsAlertItem setTextStyle:](self, "setTextStyle:", a3);
  -[_SFSettingsAlertItem setIcon:](self, "setIcon:", v9);

  -[_SFSettingsAlertItem setHandler:](self, "setHandler:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertItem setTintColor:](self, "setTintColor:", v10);

}

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 0, a6);
  objc_msgSend(v16, "setTitle:", v15);

  objc_msgSend(v16, "_buttonCommonInitWithTextStyle:icon:handler:", v14, v13, v12);
  return v16;
}

+ (id)singleLineButtonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 1, a6);
  objc_msgSend(v16, "setTitle:", v15);

  objc_msgSend(v16, "_buttonCommonInitWithTextStyle:icon:handler:", v14, v13, v12);
  return v16;
}

+ (id)stepperWithController:(id)a3 action:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 2, a4);
  objc_msgSend(v10, "setController:", v9);

  objc_msgSend(v10, "setHandler:", v8);
  return v10;
}

+ (id)optionsGroupWithTitle:(id)a3 action:(int64_t)a4 subItemAction:(int64_t)a5 controller:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  int64_t v27;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 3, a4);
  objc_msgSend(v12, "setTitle:", v11);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "values");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke;
  v24[3] = &unk_1E4AC4BD8;
  v25 = v10;
  v26 = v13;
  v27 = a5;
  v15 = v13;
  v16 = v10;
  objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSubItems:", v17);

  objc_msgSend(v12, "setHandler:", &__block_literal_global_39);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "flattenedImageWithColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageWithRenderingMode:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIcon:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v22);

  objc_msgSend(v12, "setController:", v16);
  objc_msgSend(v12, "setTextStyle:", *MEMORY[0x1E0DC4A88]);
  objc_msgSend(v12, "setViewConfigurationBlock:", &__block_literal_global_13);

  return v12;
}

+ (id)optionGroupOptionWithAttributedTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 4, a6);
  objc_msgSend(v16, "setAttributedTitle:", v15);

  objc_msgSend(v16, "_buttonCommonInitWithTextStyle:icon:handler:", v14, v13, v12);
  return v16;
}

+ (id)paletteWithAction:(int64_t)a3 controller:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:action:", 5, a3);
  objc_msgSend(v7, "setController:", v6);

  return v7;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_selected = a3;
  -[_SFSettingsAlertItem view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[_SFSettingsAlertItem view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeWeak((id *)&self->_view, obj);
    objc_msgSend(obj, "setEnabled:", -[_SFSettingsAlertItem isEnabled](self, "isEnabled"));
    objc_msgSend(obj, "setSelected:", -[_SFSettingsAlertItem isSelected](self, "isSelected"));
    -[_SFSettingsAlertItem accessibilityIdentifier](self, "accessibilityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItem viewAsUIView](self, "viewAsUIView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v5);

  }
}

- (void)setSubItems:(id)a3
{
  NSArray *v4;
  NSArray *subItems;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  subItems = self->_subItems;
  if (subItems != v4 && !-[NSArray isEqualToArray:](subItems, "isEqualToArray:", v4))
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    v7 = self->_subItems;
    self->_subItems = v6;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v4;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 192), self);
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *accessibilityIdentifier;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  accessibilityIdentifier = self->_accessibilityIdentifier;
  self->_accessibilityIdentifier = v5;

  -[_SFSettingsAlertItem viewAsUIView](self, "viewAsUIView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v4);

}

- (void)updateOptionsGroupDetailLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  _SFOptionsGroupDetailLabel *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (self->_type == 3)
  {
    v3 = self->_controller;
    objc_msgSend(v3, "values");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53___SFSettingsAlertItem_updateOptionsGroupDetailLabel__block_invoke;
    v14[3] = &unk_1E4AC4C80;
    v13 = v3;
    v15 = v13;
    objc_msgSend(v4, "safari_firstObjectPassingTest:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFSettingsAlertItem viewAsButton](self, "viewAsButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "accessoryView");
      v9 = (_SFOptionsGroupDetailLabel *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(_SFOptionsGroupDetailLabel);
      -[_SFOptionsGroupDetailLabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFOptionsGroupDetailLabel setTextColor:](v9, "setTextColor:", v10);

      -[_SFOptionsGroupDetailLabel setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
      -[_SFOptionsGroupDetailLabel setNumberOfLines:](v9, "setNumberOfLines:", 0);
      LODWORD(v11) = 1144733696;
      -[_SFOptionsGroupDetailLabel setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 0, v11);
      objc_msgSend(v6, "setAccessoryView:", v9);
    }
    objc_msgSend(v13, "attributedStringForValue:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFOptionsGroupDetailLabel setAttributedText:](v9, "setAttributedText:", v12);

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSAttributedString *attributedTitle;
  NSString *v10;

  v4 = (NSString *)a3;
  title = self->_title;
  if (title != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](title, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_title;
      self->_title = v7;

      attributedTitle = self->_attributedTitle;
      self->_attributedTitle = 0;

      -[_SFSettingsAlertItem _updateButtonTitle](self, "_updateButtonTitle");
      v4 = v10;
    }
  }

}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;
  BOOL v6;
  NSString *v7;
  NSString *title;
  NSAttributedString *v9;
  NSAttributedString *v10;
  NSAttributedString *v11;

  v4 = (NSAttributedString *)a3;
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != v4)
  {
    v11 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedTitle, "isEqualToAttributedString:", v4);
    v4 = v11;
    if (!v6)
    {
      -[NSAttributedString string](v11, "string");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v7;

      v9 = (NSAttributedString *)-[NSAttributedString copy](v11, "copy");
      v10 = self->_attributedTitle;
      self->_attributedTitle = v9;

      -[_SFSettingsAlertItem _updateButtonTitle](self, "_updateButtonTitle");
      v4 = v11;
    }
  }

}

- (void)_updateButtonTitle
{
  void *v3;
  id v4;

  -[_SFSettingsAlertItem view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_attributedTitle)
    objc_msgSend(v3, "setAttributedText:");
  else
    objc_msgSend(v3, "setText:", self->_title);

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSAttributedString *attributedSubtitle;
  NSString *v10;
  void *v11;
  NSString *v12;

  v4 = (NSString *)a3;
  subtitle = self->_subtitle;
  if (subtitle != v4)
  {
    v12 = v4;
    v6 = -[NSString isEqualToString:](subtitle, "isEqualToString:", v4);
    v4 = v12;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v12, "copy");
      v8 = self->_subtitle;
      self->_subtitle = v7;

      attributedSubtitle = self->_attributedSubtitle;
      self->_attributedSubtitle = 0;

      v10 = self->_subtitle;
      -[_SFSettingsAlertItem view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDetailText:", v10);

      v4 = v12;
    }
  }

}

- (void)setAttributedSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  NSAttributedString *v6;
  NSAttributedString *attributedSubtitle;
  id v8;

  v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_msgSend(v8, "string");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v4;

    v6 = (NSAttributedString *)objc_msgSend(v8, "copy");
    attributedSubtitle = self->_attributedSubtitle;
    self->_attributedSubtitle = v6;

    -[_SFSettingsAlertItem _updateButtonSubtitle](self, "_updateButtonSubtitle");
  }

}

- (void)_updateButtonSubtitle
{
  void *v3;
  id v4;

  -[_SFSettingsAlertItem view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_attributedSubtitle)
    objc_msgSend(v3, "setAttributedDetailText:");
  else
    objc_msgSend(v3, "setDetailText:", self->_subtitle);

}

- (SFSettingsAlertItemView)viewAsUIView
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = WeakRetained;
  else
    v3 = 0;

  return (SFSettingsAlertItemView *)v3;
}

- (_SFSettingsAlertButton)viewAsButton
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = WeakRetained;
  else
    v3 = 0;

  return (_SFSettingsAlertButton *)v3;
}

- (void)setBadgeView:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_badgeView, a3);
  v5 = a3;
  -[_SFSettingsAlertItem viewAsButton](self, "viewAsButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryView:", v5);

}

- (void)setStatusImageView:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_statusImageView, a3);
  v5 = a3;
  -[_SFSettingsAlertItem viewAsButton](self, "viewAsButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusImageView:", v5);

}

- (void)setComponentsArrangement:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *componentsArrangement;
  id v7;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  componentsArrangement = self->_componentsArrangement;
  self->_componentsArrangement = v5;

  -[_SFSettingsAlertItem viewAsButton](self, "viewAsButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComponentsArrangement:", v4);

}

- (void)setIcon:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_icon, a3);
  v5 = a3;
  -[_SFSettingsAlertItem view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)setShowsIndicatorDot:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showsIndicatorDot = a3;
  -[_SFSettingsAlertItem viewAsButton](self, "viewAsButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsIndicatorDot:", v3);

}

- (NSString)menuAction
{
  unint64_t v2;
  id *v3;

  v2 = self->_actionType - 9;
  if (v2 > 0x25)
    v3 = (id *)MEMORY[0x1E0D4F068];
  else
    v3 = (id *)qword_1E4AC4D58[v2];
  return (NSString *)*v3;
}

- (BOOL)isConfigurable
{
  void *v2;
  char v3;

  -[_SFSettingsAlertItem menuAction](self, "menuAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SFIsMenuActionConfigurable();

  return v3;
}

- (BOOL)isFavorited
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertItem menuAction](self, "menuAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "browsingAssistant_isMenuActionFavorited:", v4);

  return v5;
}

- (void)setFavorited:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertItem menuAction](self, "menuAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browsingAssistant_setMenuActionFavorited:favorited:", v5, v3);

}

- (void)setUpSelectionHandlerIfNeededWithViewController:(id)a3
{
  id v4;
  void *v5;
  id selectionHandler;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  if (!self->_selectionHandler)
  {
    v4 = a3;
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72___SFSettingsAlertItem_setUpSelectionHandlerIfNeededWithViewController___block_invoke;
    v7[3] = &unk_1E4AC4CA8;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    v5 = (void *)MEMORY[0x1A8598C40](v7);
    selectionHandler = self->_selectionHandler;
    self->_selectionHandler = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (UIColor)overrideColor
{
  UIColor *tintColor;
  void *v4;
  UIColor *v5;
  UIColor *v6;

  tintColor = self->_tintColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIColor isEqual:](tintColor, "isEqual:", v4) & 1) != 0)
    v5 = 0;
  else
    v5 = self->_tintColor;
  v6 = v5;

  return v6;
}

- (void)notifyObserversItemDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSPointerArray allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "menuItemDidUpdate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSPointerArray *observers;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSPointerArray addPointer:](observers, "addPointer:", v4);

}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (NSArray)componentsArrangement
{
  return self->_componentsArrangement;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)keepsMenuPresented
{
  return self->_keepsMenuPresented;
}

- (void)setKeepsMenuPresented:(BOOL)a3
{
  self->_keepsMenuPresented = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (BOOL)showsIndicatorDot
{
  return self->_showsIndicatorDot;
}

- (id)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong(&self->_controller, a3);
}

- (NSArray)subItems
{
  return self->_subItems;
}

- (id)viewConfigurationBlock
{
  return self->_viewConfigurationBlock;
}

- (void)setViewConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SFSettingsAlertItemView)view
{
  return (SFSettingsAlertItemView *)objc_loadWeakRetained((id *)&self->_view);
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void)setBadgeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (UIMenu)popUpMenu
{
  return self->_popUpMenu;
}

- (void)setPopUpMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)showsStatusAlert
{
  return self->_showsStatusAlert;
}

- (void)setShowsStatusAlert:(BOOL)a3
{
  self->_showsStatusAlert = a3;
}

- (_SFSettingsAlertItem)group
{
  return (_SFSettingsAlertItem *)objc_loadWeakRetained((id *)&self->_group);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_popUpMenu, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_viewConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_subItems, 0);
  objc_storeStrong(&self->_controller, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_componentsArrangement, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
