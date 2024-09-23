@implementation ToolbarItemConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_title, 0);
}

uint64_t __57__ToolbarItemConfiguration_buttonConfigurationWithStyle___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

id __57__ToolbarItemConfiguration_buttonConfigurationWithStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0DC1138];
  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = *MEMORY[0x1E0DC4AD0];
  v4 = a2;
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setValuesFromDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEmphasized:(BOOL)a3
{
  self->_emphasized = a3;
}

- (id)buttonConfigurationWithStyle:(int64_t)a3
{
  void *v5;
  id *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)MEMORY[0x1E0DC4AD0];
  if (!self->_emphasized)
    v6 = (id *)MEMORY[0x1E0DC4A88];
  v7 = *v6;
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    v8 = 2.0;
    if (!self->_emphasized)
      v8 = 4.0;
    objc_msgSend(v5, "setImagePadding:", v8);
    if (a3 == 1)
    {
      v9 = 3;
    }
    else if (self->_title)
    {
      v9 = 2;
    }
    else
    {
      v9 = 3;
    }
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v10);

  }
  if (a3 != 1 && self->_title)
  {
    -[ToolbarItemConfiguration title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v5, "setTitle:", v11);
    -[ToolbarItemConfiguration attributedTitle](self, "attributedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "setAttributedTitle:", v12);
    objc_msgSend(v5, "setTitleLineBreakMode:", 4);

  }
  if (self->_emphasized)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v13);

    objc_msgSend(v5, "setTitleTextAttributesTransformer:", &__block_literal_global_3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v14);

  }
  if (self->_showsIndicator)
  {
    objc_msgSend(v5, "setIndicator:", 3);
    objc_msgSend(v5, "setIndicatorColorTransformer:", &__block_literal_global_14);
  }

  return v5;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (NSString)title
{
  id title;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    title = self->_title;
  else
    title = 0;
  return (NSString *)title;
}

- (NSAttributedString)attributedTitle
{
  id title;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    title = self->_title;
  else
    title = 0;
  return (NSAttributedString *)title;
}

+ (id)configurationForTabGroup:(id)a3
{
  id v3;
  ToolbarItemConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(ToolbarItemConfiguration);
  objc_msgSend(v3, "displayTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ToolbarItemConfiguration setTitle:](v4, "setTitle:", v5);
  return v4;
}

- (ToolbarItemConfiguration)init
{
  ToolbarItemConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ToolbarItemConfiguration;
  result = -[ToolbarItemConfiguration init](&v3, sel_init);
  *(_WORD *)&result->_showsIndicator = 257;
  return result;
}

- (void)setTitle:(id)a3
{
  void *v4;
  id title;

  v4 = (void *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

+ (id)configurationForTabGroupPicker
{
  ToolbarItemConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(ToolbarItemConfiguration);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("list.bullet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ToolbarItemConfiguration setImage:](v2, "setImage:", v3);

  -[ToolbarItemConfiguration setShowsIndicator:](v2, "setShowsIndicator:", 0);
  return v2;
}

- (void)setShowsIndicator:(BOOL)a3
{
  self->_showsIndicator = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

+ (id)configurationForProfile:(id)a3
{
  id v3;
  ToolbarItemConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(ToolbarItemConfiguration);
  objc_msgSend(v3, "symbolImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ToolbarItemConfiguration setImage:](v4, "setImage:", v5);

  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ToolbarItemConfiguration setTitle:](v4, "setTitle:", v6);

  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ToolbarItemConfiguration setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);
  return v4;
}

+ (id)configurationForTabGroup:(id)a3 inProfile:(id)a4
{
  id v6;
  id v7;
  ToolbarItemConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ToolbarItemConfiguration);
  objc_msgSend(v6, "symbolImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ToolbarItemConfiguration setImage:](v8, "setImage:", v9);

  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ToolbarItemConfiguration setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributedTitleForTabGroup:inProfile:primaryColor:secondaryColor:", v7, v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ToolbarItemConfiguration setAttributedTitle:](v8, "setAttributedTitle:", v13);
  return v8;
}

+ (id)attributedTitleForTabGroup:(id)a3 inProfile:(id)a4 primaryColor:(id)a5 secondaryColor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (uint64_t *)MEMORY[0x1E0DC1140];
  if (v11)
  {
    v28 = *MEMORY[0x1E0DC1140];
    v29[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v10, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v14);

  if (v12)
  {
    v26 = *v13;
    v27 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "displayTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR(" — %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithString:attributes:", v22, v18);
  objc_msgSend(v17, "appendAttributedString:", v23);

  v24 = (void *)objc_msgSend(v17, "mutableCopy");
  return v24;
}

- (void)setAttributedTitle:(id)a3
{
  void *v4;
  id title;

  v4 = (void *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (UIImage)image
{
  return self->_image;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, a3);
}

- (BOOL)showsIndicator
{
  return self->_showsIndicator;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

@end
