@implementation ActionCellAccessory

- (ActionCellAccessory)initWithAction:(id)a3
{
  return -[ActionCellAccessory initWithAction:visibilityProvider:](self, "initWithAction:visibilityProvider:", a3, &__block_literal_global_63);
}

uint64_t __38__ActionCellAccessory_initWithAction___block_invoke()
{
  return 1;
}

- (ActionCellAccessory)initWithAction:(id)a3 visibilityProvider:(id)a4
{
  id v6;
  void *v7;
  ActionCellAccessory *v8;
  void *v9;
  id visibilityProvider;
  ActionCellAccessory *v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:primaryAction:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ActionCellAccessory initWithCustomView:placement:](self, "initWithCustomView:placement:", v7, 1);
  if (v8)
  {
    v9 = _Block_copy(v6);
    visibilityProvider = v8->_visibilityProvider;
    v8->_visibilityProvider = v9;

    -[UICellAccessory setReservedLayoutWidth:](v8, "setReservedLayoutWidth:", 30.0);
    v11 = v8;
  }

  return v8;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  void *v5;
  UIImageSymbolConfiguration *v6;

  v6 = (UIImageSymbolConfiguration *)a3;
  if (self->_preferredSymbolConfiguration != v6)
  {
    objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
    -[ActionCellAccessory customView](self, "customView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

  }
}

- (void)applyContentConfiguration:(id)a3 forState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v14;
    -[ActionCellAccessory customView](self, "customView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (*((unsigned int (**)(void))self->_visibilityProvider + 2))() ^ 1;
    objc_msgSend(v8, "setHidden:", v9);
    -[UICellAccessory setHidden:](self, "setHidden:", v9);
    objc_msgSend(v7, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleColor:forState:", v11, 0);

    if ((objc_msgSend(v7, "safari_usesWhiteText") & 1) != 0)
    {
      objc_msgSend(v7, "textProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "color");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v12);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ActionCellAccessory;
  v4 = -[UICellAccessory copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = _Block_copy(self->_visibilityProvider);
  v6 = (void *)v4[10];
  v4[10] = v5;

  objc_msgSend(v4, "setPreferredSymbolConfiguration:", self->_preferredSymbolConfiguration);
  return v4;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong(&self->_visibilityProvider, 0);
}

@end
