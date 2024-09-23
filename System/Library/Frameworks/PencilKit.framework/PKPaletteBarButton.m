@implementation PKPaletteBarButton

- (PKPaletteBarButton)initWithBarButtonItem:(id)a3
{
  id v5;
  PKPaletteBarButton *v6;
  PKPaletteBarButton *v7;
  id *p_barButtonItem;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteBarButton;
  v6 = -[PKPaletteButton initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_barButtonItem = (id *)&v6->_barButtonItem;
    objc_storeStrong((id *)&v6->_barButtonItem, a3);
    -[PKPaletteBarButton _updateForButtonItemChange](v7, "_updateForButtonItemChange");
    -[PKPaletteBarButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", v7, sel__handleTouchUpInside_event_, 64);
    objc_msgSend(*p_barButtonItem, "_setViewOwner:", v7);
    -[PKPaletteButton button](v7, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_barButtonItem, "setView:", v9);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPaletteBarButton;
  -[PKPaletteButton layoutSubviews](&v22, sel_layoutSubviews);
  -[PKPaletteBarButton customView](self, "customView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v21[0] = *MEMORY[0x1E0C9BAA8];
  v21[1] = v4;
  v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v21);

  -[PKPaletteBarButton bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKPaletteBarButton customView](self, "customView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[PKPaletteButton button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "transform");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
  }
  -[PKPaletteBarButton customView](self, "customView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  objc_msgSend(v16, "setTransform:", v17);

}

- (void)setCustomView:(id)a3
{
  UIView *v5;
  UIView **p_customView;
  UIView *customView;
  PKPaletteBarButton *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_customView = &self->_customView;
  customView = self->_customView;
  v9 = v5;
  if (customView != v5)
  {
    -[UIView superview](customView, "superview");
    v8 = (PKPaletteBarButton *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_customView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customView, a3);
    if (*p_customView)
      -[PKPaletteBarButton addSubview:](self, "addSubview:");
  }

}

- (void)setScalingFactor:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteBarButton;
  -[PKPaletteButton setScalingFactor:](&v4, sel_setScalingFactor_, a3);
  -[PKPaletteBarButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateForButtonItemChange
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

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PKPaletteBarButton setCustomView:](self, "setCustomView:", 0);
    -[PKPaletteButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_imageForState:compact:type:", 0, 0, 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteButton button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "_imageByApplyingDefaultImageSymbolConfigurationWithImage:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setImage:forState:", v13, 0);
      objc_msgSend(v12, "setTitle:forState:", 0, 0);
    }
    else
    {
      objc_msgSend(v11, "setImage:forState:", 0, 0);
      if (!v7)
      {
        objc_msgSend(v12, "setTitle:forState:", 0, 0);
        goto LABEL_8;
      }
      objc_msgSend(v12, "setTitle:forState:", v7, 0);
      objc_msgSend(v12, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLineBreakMode:", 4);
    }

LABEL_8:
    goto LABEL_9;
  }
  -[PKPaletteButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteBarButton setCustomView:](self, "setCustomView:", v7);
LABEL_9:

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteButton button](self, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v15);

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteButton setEnabled:](self, "setEnabled:", objc_msgSend(v17, "isEnabled"));

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteButton setHidden:](self, "setHidden:", objc_msgSend(v18, "isHidden"));

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteButton setSelected:](self, "setSelected:", objc_msgSend(v19, "isSelected"));

  -[PKPaletteBarButton _updateMenu](self, "_updateMenu");
}

- (void)_updateMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id location;

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_menuIsPrimary");

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_secondaryActionsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);

    if ((_DWORD)v6)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __33__PKPaletteBarButton__updateMenu__block_invoke;
      v20[3] = &unk_1E777AB68;
      v10 = v20;
      v20[4] = v8;
      v11 = &v21;
      objc_copyWeak(&v21, &location);
      -[PKPaletteBarButton setMenuProvider:](self, "setMenuProvider:", v20);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __33__PKPaletteBarButton__updateMenu__block_invoke_3;
      v18[3] = &unk_1E777AB68;
      v10 = v18;
      v18[4] = v8;
      v11 = &v19;
      objc_copyWeak(&v19, &location);
      -[PKPaletteBarButton setMenuProvider:](self, "setMenuProvider:", v18);
    }
    objc_destroyWeak(v11);

    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __33__PKPaletteBarButton__updateMenu__block_invoke_4;
    v16 = &unk_1E777AB90;
    v17 = v4;
    -[PKPaletteBarButton setMenuProvider:](self, "setMenuProvider:", &v13);

  }
  else
  {
    -[PKPaletteBarButton setMenuProvider:](self, "setMenuProvider:", 0);
  }
  -[PKPaletteBarButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", self->_menuProvider != 0, v13, v14, v15, v16);
  -[PKPaletteBarButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v6);
  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteBarButton _setProxySender:](self, "_setProxySender:", v12);

}

id __33__PKPaletteBarButton__updateMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0DC3428];
    v9 = objc_loadWeakRetained(v5);
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v5);
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __33__PKPaletteBarButton__updateMenu__block_invoke_2;
    v17[3] = &unk_1E777AB40;
    objc_copyWeak(&v18, v5);
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, v12, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC39D0];
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "menuWithTitle:children:", &stru_1E777DEE8, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
  }

  return v7;
}

void __33__PKPaletteBarButton__updateMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerActionForEvent:", 0);

}

id __33__PKPaletteBarButton__updateMenu__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __33__PKPaletteBarButton__updateMenu__block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC36B8];
  -[PKPaletteBarButton menuProvider](self, "menuProvider", a3, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("PK-UIBarButtonItemContextMenu"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredMenuElementOrder:", objc_msgSend(v8, "preferredMenuElementOrder"));

  return v7;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double Width;
  double v31;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v33.receiver = self;
  v33.super_class = (Class)PKPaletteBarButton;
  -[PKPaletteBarButton _contextMenuInteraction:styleForMenuWithConfiguration:](&v33, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteBarButton window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PKPaletteBarButton window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[PKPaletteBarButton window](self, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actualSceneBounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v34.origin.x = v10;
    v34.origin.y = v12;
    v34.size.width = v14;
    v34.size.height = v16;
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    if (!CGRectEqualToRect(v34, v37))
    {
      v26 = *MEMORY[0x1E0DC49E8];
      v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      -[PKPaletteBarButton window](self, "window");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      Width = CGRectGetWidth(v35);
      v36.origin.x = v19;
      v36.origin.y = v21;
      v36.size.width = v23;
      v36.size.height = v25;
      v31 = Width - CGRectGetWidth(v36);

      objc_msgSend(v5, "setPreferredEdgeInsets:", v26, v27, v28, v31);
    }
  }
  return v5;
}

- (void)setTintColor:(id)a3
{
  objc_super v3;

  if (a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)PKPaletteBarButton;
    -[PKPaletteBarButton setTintColor:](&v3, sel_setTintColor_);
  }
}

- (void)_handleTouchUpInside:(id)a3 event:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPaletteBarButton _checkCurrentBarButtonItemState](self, "_checkCurrentBarButtonItemState");
  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_triggerActionForEvent:", v5);

}

- (void)_checkCurrentBarButtonItemState
{
  void *v3;
  void *v4;
  void *v5;
  PKPaletteBarButton *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteBarButton barButtonItem](self, "barButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_viewOwner");
  v6 = (PKPaletteBarButton *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteButton button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v7 || v6 != self)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected view(%@) or viewOwner(%@) for UIBarButtonItem represented by PKPaletteBarButton"), v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    -[UIBarButtonItem _setViewOwner:](self->_barButtonItem, "_setViewOwner:", self);
    -[PKPaletteButton button](self, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setView:](self->_barButtonItem, "setView:", v12);

  }
}

+ (id)_imageByApplyingDefaultImageSymbolConfigurationWithImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isSymbolImage"))
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageByApplyingSymbolConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (UIView)customView
{
  return self->_customView;
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (void)setMenuProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end
