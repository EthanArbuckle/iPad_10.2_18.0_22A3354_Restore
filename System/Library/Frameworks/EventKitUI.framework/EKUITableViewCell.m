@implementation EKUITableViewCell

+ (id)reuseIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EKUITableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_1 != -1)
    dispatch_once(&reuseIdentifier_onceToken_1, block);
  return (id)reuseIdentifier_reuseIdentifier_1;
}

void __36__EKUITableViewCell_reuseIdentifier__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reuseIdentifier_reuseIdentifier_1;
  reuseIdentifier_reuseIdentifier_1 = v1;

}

+ (double)rowSeparatorThickness
{
  return 1.0 / EKUIScaleFactor();
}

+ (BOOL)vibrant
{
  return 0;
}

- (EKUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUITableViewCell *v4;
  EKUITableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUITableViewCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKUITableViewCell setSeparatorEdges:](v4, "setSeparatorEdges:", 4);
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUITableViewCell;
  -[EKUITableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[EKUITableViewCell _layoutSeparator](self, "_layoutSeparator");
}

- (void)_layoutSeparator
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  if (self->_bottomSeparatorViewForNonOpaqueTables)
  {
    objc_msgSend((id)objc_opt_class(), "rowSeparatorThickness");
    v4 = v3;
    -[EKUITableViewCell bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = -[EKUITableViewCell usesInsetMargin](self, "usesInsetMargin");
    v12 = 15.0;
    if (!v11)
    {
      -[EKUITableViewCell separatorInset](self, "separatorInset", 15.0);
      if (v13 > 0.0)
      {
        if (CalInterfaceIsLeftToRight())
        {
          -[EKUITableViewCell separatorInset](self, "separatorInset");
          v6 = v6 + v14;
        }
        -[EKUITableViewCell separatorInset](self, "separatorInset");
        v8 = v8 - v15;
      }
      -[EKUITableViewCell separatorInset](self, "separatorInset");
      if (v16 > 0.0)
      {
        if ((CalInterfaceIsLeftToRight() & 1) == 0)
        {
          -[EKUITableViewCell separatorInset](self, "separatorInset");
          v6 = v6 + v17;
        }
        -[EKUITableViewCell separatorInset](self, "separatorInset");
        v8 = v8 - v18;
      }
      v12 = v6;
    }
    -[RowSeparatorView setFrame:](self->_bottomSeparatorViewForNonOpaqueTables, "setFrame:", v12, v10 - v4, v8, v4);
  }
  if (self->_topSeparatorViewForNonOpaqueTables)
  {
    -[EKUITableViewCell bounds](self, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend((id)objc_opt_class(), "rowSeparatorThickness");
    v26 = v25;
    if (CalInterfaceIsLeftToRight())
    {
      -[EKUITableViewCell safeAreaInsets](self, "safeAreaInsets");
      v28 = v27;
      -[EKUITableViewCell _contentMargin](self, "_contentMargin");
      v20 = v28 + v29;
    }
    else
    {
      -[EKUITableViewCell safeAreaInsets](self, "safeAreaInsets");
      v31 = v30;
      -[EKUITableViewCell _contentMargin](self, "_contentMargin");
      v24 = v24 - (v31 + v32);
    }
    -[RowSeparatorView setFrame:](self->_topSeparatorViewForNonOpaqueTables, "setFrame:", v20, v22, v24, v26);
  }
}

- (void)setUsesInsetMargin:(BOOL)a3
{
  self->_usesInsetMargin = a3;
  -[EKUITableViewCell _setMarginExtendsToFullWidth:](self, "_setMarginExtendsToFullWidth:", !a3);
}

- (void)setRowSeparatorColor:(id)a3
{
  UIColor **p_rowSeparatorColor;
  RowSeparatorView *bottomSeparatorViewForNonOpaqueTables;
  RowSeparatorView *topSeparatorViewForNonOpaqueTables;
  id v8;

  v8 = a3;
  p_rowSeparatorColor = &self->_rowSeparatorColor;
  objc_storeStrong((id *)&self->_rowSeparatorColor, a3);
  bottomSeparatorViewForNonOpaqueTables = self->_bottomSeparatorViewForNonOpaqueTables;
  if (bottomSeparatorViewForNonOpaqueTables)
    -[RowSeparatorView setBackgroundColor:](bottomSeparatorViewForNonOpaqueTables, "setBackgroundColor:", *p_rowSeparatorColor);
  topSeparatorViewForNonOpaqueTables = self->_topSeparatorViewForNonOpaqueTables;
  if (topSeparatorViewForNonOpaqueTables)
    -[RowSeparatorView setBackgroundColor:](topSeparatorViewForNonOpaqueTables, "setBackgroundColor:", *p_rowSeparatorColor);

}

- (void)setRowSeparatorVisualEffect:(id)a3
{
  UIVisualEffect **p_rowSeparatorVisualEffect;
  id v6;

  p_rowSeparatorVisualEffect = &self->_rowSeparatorVisualEffect;
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, a3);
  v6 = a3;
  -[UIVisualEffectView setEffect:](self->_bottomRowSeparatorParentView, "setEffect:", *p_rowSeparatorVisualEffect);
  -[UIVisualEffectView setEffect:](self->_topRowSeparatorParentView, "setEffect:", *p_rowSeparatorVisualEffect);

}

- (id)separatorParentView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  -[EKUITableViewCell bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (id)separatorView
{
  RowSeparatorView *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_alloc_init(RowSeparatorView);
  -[RowSeparatorView setVibrant:](v3, "setVibrant:", objc_msgSend((id)objc_opt_class(), "vibrant"));
  if (objc_msgSend((id)objc_opt_class(), "vibrant"))
  {
    -[UIVisualEffectView contentView](self->_bottomRowSeparatorParentView, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKUITableViewCell rowSeparatorColor](self, "rowSeparatorColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[EKUITableViewCell rowSeparatorColor](self, "rowSeparatorColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[RowSeparatorView setBackgroundColor:](v3, "setBackgroundColor:", v5);

  return v3;
}

- (void)updateRowSeparators
{
  unint64_t v2;
  unint64_t v3;
  EKUITableViewCell *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *topRowSeparatorParentView;
  uint64_t v8;
  UIVisualEffectView *bottomRowSeparatorParentView;
  uint64_t v10;
  UIVisualEffect *rowSeparatorVisualEffect;
  RowSeparatorView *bottomSeparatorViewForNonOpaqueTables;
  uint64_t v13;
  RowSeparatorView *v14;
  RowSeparatorView *v15;
  RowSeparatorView *topSeparatorViewForNonOpaqueTables;
  uint64_t v17;
  RowSeparatorView *v18;
  RowSeparatorView *v19;
  UIVisualEffectView *v20;
  UIVisualEffectView *v21;
  UIVisualEffectView *v22;
  UIVisualEffectView *v23;
  id v24;

  if (self->_drawsOwnRowSeparators)
  {
    v2 = (self->_separatorEdges >> 2) & 1;
    v3 = self->_separatorEdges & 1;
  }
  else
  {
    LODWORD(v2) = 0;
    LODWORD(v3) = 0;
  }
  v4 = self;
  v24 = v4;
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(), "vibrant"))
  {
    v24 = v4;
    if ((_DWORD)v2 && (v24 = v4, !v4->_bottomRowSeparatorParentView))
    {
      -[EKUITableViewCell separatorParentView](v4, "separatorParentView");
      v8 = objc_claimAutoreleasedReturnValue();
      bottomRowSeparatorParentView = v4->_bottomRowSeparatorParentView;
      v4->_bottomRowSeparatorParentView = (UIVisualEffectView *)v8;

      -[EKUITableViewCell rowSeparatorVisualEffect](v4, "rowSeparatorVisualEffect");
      v10 = objc_claimAutoreleasedReturnValue();
      rowSeparatorVisualEffect = v4->_rowSeparatorVisualEffect;
      v4->_rowSeparatorVisualEffect = (UIVisualEffect *)v10;

      -[UIVisualEffectView contentView](v4->_bottomRowSeparatorParentView, "contentView");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      -[EKUITableViewCell addSubview:](v4, "addSubview:", v4->_bottomRowSeparatorParentView);
      if ((_DWORD)v3)
      {
LABEL_8:
        if (!v4->_topRowSeparatorParentView)
        {
          -[EKUITableViewCell separatorParentView](v4, "separatorParentView");
          v6 = objc_claimAutoreleasedReturnValue();
          topRowSeparatorParentView = v4->_topRowSeparatorParentView;
          v4->_topRowSeparatorParentView = (UIVisualEffectView *)v6;

          -[UIVisualEffectView contentView](v4->_topRowSeparatorParentView, "contentView");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          -[EKUITableViewCell addSubview:](v4, "addSubview:", v4->_topRowSeparatorParentView);
          goto LABEL_12;
        }
      }
    }
    else if ((_DWORD)v3)
    {
      goto LABEL_8;
    }
    v5 = v4;
  }
LABEL_12:
  bottomSeparatorViewForNonOpaqueTables = v4->_bottomSeparatorViewForNonOpaqueTables;
  if ((_DWORD)v2)
  {
    if (!bottomSeparatorViewForNonOpaqueTables)
    {
      -[EKUITableViewCell separatorView](v4, "separatorView");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v4->_bottomSeparatorViewForNonOpaqueTables;
      v4->_bottomSeparatorViewForNonOpaqueTables = (RowSeparatorView *)v13;

      objc_msgSend(v24, "addSubview:", v4->_bottomSeparatorViewForNonOpaqueTables);
    }
  }
  else if (bottomSeparatorViewForNonOpaqueTables)
  {
    -[RowSeparatorView removeFromSuperview](bottomSeparatorViewForNonOpaqueTables, "removeFromSuperview");
    v15 = v4->_bottomSeparatorViewForNonOpaqueTables;
    v4->_bottomSeparatorViewForNonOpaqueTables = 0;

  }
  topSeparatorViewForNonOpaqueTables = v4->_topSeparatorViewForNonOpaqueTables;
  if ((_DWORD)v3)
  {
    if (!topSeparatorViewForNonOpaqueTables)
    {
      -[EKUITableViewCell separatorView](v4, "separatorView");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v4->_topSeparatorViewForNonOpaqueTables;
      v4->_topSeparatorViewForNonOpaqueTables = (RowSeparatorView *)v17;

      objc_msgSend(v5, "addSubview:", v4->_topSeparatorViewForNonOpaqueTables);
    }
  }
  else if (topSeparatorViewForNonOpaqueTables)
  {
    -[RowSeparatorView removeFromSuperview](topSeparatorViewForNonOpaqueTables, "removeFromSuperview");
    v19 = v4->_topSeparatorViewForNonOpaqueTables;
    v4->_topSeparatorViewForNonOpaqueTables = 0;

  }
  if (objc_msgSend((id)objc_opt_class(), "vibrant"))
  {
    if ((v2 & 1) == 0)
    {
      v20 = v4->_bottomRowSeparatorParentView;
      if (v20)
      {
        -[UIVisualEffectView removeFromSuperview](v20, "removeFromSuperview");
        v21 = v4->_bottomRowSeparatorParentView;
        v4->_bottomRowSeparatorParentView = 0;

      }
    }
    if ((v3 & 1) == 0)
    {
      v22 = v4->_topRowSeparatorParentView;
      if (v22)
      {
        -[UIVisualEffectView removeFromSuperview](v22, "removeFromSuperview");
        v23 = v4->_topRowSeparatorParentView;
        v4->_topRowSeparatorParentView = 0;

      }
    }
  }

}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  self->_drawsOwnRowSeparators = a3;
  -[EKUITableViewCell updateRowSeparators](self, "updateRowSeparators");
}

- (void)setSeparatorEdges:(unint64_t)a3
{
  self->_separatorEdges = a3;
  -[EKUITableViewCell updateRowSeparators](self, "updateRowSeparators");
}

- (void)setDisableSelectedBackground:(BOOL)a3
{
  self->_disableSelectedBackground = a3;
  if (a3)
    -[EKUITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  else
    -[EKUITableViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", 0);
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_disableSelectedBackground)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isSelected") && (objc_msgSend(v7, "isHighlighted") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v6);

    }
    -[EKUITableViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

    v4 = v7;
  }

}

- (void)_setMarginExtendsToFullWidth:(BOOL)a3
{
  double v3;

  v3 = 15.0;
  if (a3)
    v3 = 0.0;
  -[EKUITableViewCell _setMarginWidth:](self, "_setMarginWidth:", v3);
}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (BOOL)disableSelectedBackground
{
  return self->_disableSelectedBackground;
}

- (UIColor)rowSeparatorColor
{
  return self->_rowSeparatorColor;
}

- (UIVisualEffect)rowSeparatorVisualEffect
{
  return self->_rowSeparatorVisualEffect;
}

- (unint64_t)separatorEdges
{
  return self->_separatorEdges;
}

- (BOOL)usesInsetMargin
{
  return self->_usesInsetMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_rowSeparatorColor, 0);
  objc_storeStrong((id *)&self->_topSeparatorViewForNonOpaqueTables, 0);
  objc_storeStrong((id *)&self->_topRowSeparatorParentView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorViewForNonOpaqueTables, 0);
  objc_storeStrong((id *)&self->_bottomRowSeparatorParentView, 0);
}

@end
