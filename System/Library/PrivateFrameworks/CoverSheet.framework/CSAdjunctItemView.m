@implementation CSAdjunctItemView

- (CSAdjunctItemView)initWithRecipe:(int64_t)a3
{
  CSAdjunctItemView *v4;
  CSAdjunctItemView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAdjunctItemView;
  v4 = -[CSAdjunctItemView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_recipe = a3;
    -[CSAdjunctItemView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  objc_msgSend(WeakRetained, "preferredContentSize");
  v7 = v6;

  v8 = objc_loadWeakRetained((id *)&self->_platterView);
  objc_msgSend(v8, "sizeThatFitsContentWithSize:", width, v7);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  id WeakRetained;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  objc_msgSend(WeakRetained, "preferredContentSize");
  v5 = v4;

  v6 = objc_loadWeakRetained((id *)&self->_platterView);
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", self->_sizeToMimic.width, v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  -[CSAdjunctItemView _updateSizeToMimic](self, "_updateSizeToMimic");
  v3.receiver = self;
  v3.super_class = (Class)CSAdjunctItemView;
  -[CSAdjunctItemView layoutSubviews](&v3, sel_layoutSubviews);
}

- (NSString)description
{
  return (NSString *)-[CSAdjunctItemView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setContentHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeWeak((id *)&self->_contentHost, v4);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v4, "platterView"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = v8;
      self->_isContentHostPlatterView = 1;
      objc_msgSend(v8, "_setContinuousCornerRadius:", 18.0);
      -[CSAdjunctItemView _setPlatterView:](self, "_setPlatterView:", v9);
    }
    else
    {
      self->_isContentHostPlatterView = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", self->_recipe);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = objc_msgSend(v4, "usesBackgroundView");
      else
        v10 = 1;
      objc_msgSend(v9, "setUsesBackgroundView:", v10);
      objc_msgSend(v9, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
      objc_msgSend(v9, "_setContinuousCornerRadius:", 18.0);
      -[CSAdjunctItemView _setPlatterView:](self, "_setPlatterView:", v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "_continuousCornerRadius");
        objc_msgSend(v4, "setContainerCornerRadius:");
      }
      objc_msgSend(v9, "customContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v4, "requiredVisualStyleCategories", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v21;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v13);
              v18 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "integerValue");
              objc_msgSend(v9, "visualStylingProviderForCategory:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setVisualStylingProvider:forCategory:", v19, v18);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v15);
        }

      }
    }

    -[CSAdjunctItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CSAdjunctItemView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSizeToMimic:(CGSize)a3
{
  if (self->_sizeToMimic.width != a3.width || self->_sizeToMimic.height != a3.height)
  {
    self->_sizeToMimic = a3;
    -[CSAdjunctItemView _updateSizeToMimic](self, "_updateSizeToMimic");
    -[CSAdjunctItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CSAdjunctItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString **p_materialGroupNameBase;
  id WeakRetained;
  id v7;

  p_materialGroupNameBase = &self->_materialGroupNameBase;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", *p_materialGroupNameBase) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    if (!self->_isContentHostPlatterView)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
      objc_msgSend(WeakRetained, "setMaterialGroupNameBase:", *p_materialGroupNameBase);

    }
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSAdjunctItemView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSAdjunctItemView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[CSAdjunctItemView succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", WeakRetained, CFSTR("platterView"));

  MTStringFromMaterialRecipe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("materialRecipe"));

  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_materialGroupNameBase, CFSTR("materialGroupBaseName"));
  v9 = objc_loadWeakRetained((id *)&self->_contentHost);
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("contentHost"));

  v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isContentHostPlatterView, CFSTR("isContentHostPlatterView"));
  v12 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("sizeToMimic"), self->_sizeToMimic.width, self->_sizeToMimic.height);
  return v4;
}

- (void)_updateSizeToMimic
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setContainerSize:", self->_sizeToMimic.width, self->_sizeToMimic.height);

}

- (void)_setPlatterView:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "removeFromSuperview");
    objc_storeWeak((id *)&self->_platterView, obj);
    -[CSAdjunctItemView bounds](self, "bounds");
    objc_msgSend(obj, "setFrame:");
    -[CSAdjunctItemView addSubview:](self, "addSubview:", obj);
    objc_msgSend(obj, "setAutoresizingMask:", 18);
  }

}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (CGSize)sizeToMimic
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeToMimic.width;
  height = self->_sizeToMimic.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CSAdjunctItemHosting)contentHost
{
  return (CSAdjunctItemHosting *)objc_loadWeakRetained((id *)&self->_contentHost);
}

- (PLPlatterView)platterView
{
  return (PLPlatterView *)objc_loadWeakRetained((id *)&self->_platterView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_contentHost);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end
