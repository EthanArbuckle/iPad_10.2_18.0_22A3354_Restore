@implementation CFXFilterPickerCollectionViewCell

- (void)configureCellAppearence
{
  void *v3;
  id v4;

  -[CFXFilterPickerCollectionViewCell CFX_updateLayerProperties](self, "CFX_updateLayerProperties");
  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  if (-[CFXFilterPickerCollectionViewCell isInCompactMode](self, "isInCompactMode"))
  {
    -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
}

+ (UIColor)selectionColor
{
  if (selectionColor_onceToken != -1)
    dispatch_once(&selectionColor_onceToken, &__block_literal_global_52);
  return (UIColor *)(id)selectionColor_selectionColor;
}

void __51__CFXFilterPickerCollectionViewCell_selectionColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)selectionColor_selectionColor;
  selectionColor_selectionColor = v0;

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXFilterPickerCollectionViewCell;
  -[CFXEffectPickerCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  if (-[CFXFilterPickerCollectionViewCell isInCompactMode](self, "isInCompactMode"))
  {
    -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
}

- (void)setEffect:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCell;
  -[CFXEffectPickerCollectionViewCell setEffect:](&v4, sel_setEffect_, a3);
  -[CFXFilterPickerCollectionViewCell CFX_updateTitle](self, "CFX_updateTitle");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCell;
  -[CFXFilterPickerCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[CFXFilterPickerCollectionViewCell CFX_updateSelectionView](self, "CFX_updateSelectionView");
  -[CFXFilterPickerCollectionViewCell CFX_updateTitle](self, "CFX_updateTitle");
}

- (void)setCompactMode:(BOOL)a3
{
  self->_compactMode = a3;
  -[CFXFilterPickerCollectionViewCell CFX_updateLayerProperties](self, "CFX_updateLayerProperties");
  -[CFXFilterPickerCollectionViewCell CFX_updateTitle](self, "CFX_updateTitle");
  -[CFXFilterPickerCollectionViewCell CFX_updateSelectionView](self, "CFX_updateSelectionView");
}

- (void)CFX_updateLayerProperties
{
  _BOOL4 v3;
  uint64_t *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v3 = -[CFXFilterPickerCollectionViewCell isInCompactMode](self, "isInCompactMode");
  v4 = (uint64_t *)&kCompactFilterPickerCellContentCornerRadius;
  if (!v3)
    v4 = &kDefaultEffectPickerCellContentCornerRadius;
  v5 = *(double *)v4;
  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 3.0);

  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 12.0);

  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClipsToBounds:", 1);

  +[CFXFilterPickerCollectionViewCell selectionColor](CFXFilterPickerCollectionViewCell, "selectionColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v16, "CGColor");
  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderColor:", v13);

}

- (void)CFX_updateSelectionView
{
  double v3;
  id v4;

  v3 = 0.0;
  if (!-[CFXFilterPickerCollectionViewCell isInCompactMode](self, "isInCompactMode"))
    v3 = (double)-[CFXFilterPickerCollectionViewCell isSelected](self, "isSelected");
  -[CFXFilterPickerCollectionViewCell selectionView](self, "selectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)CFX_updateTitle
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v3 = -[CFXFilterPickerCollectionViewCell isSelected](self, "isSelected");
  -[CFXEffectPickerCollectionViewCell effect](self, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v3)
    objc_msgSend((id)objc_opt_class(), "selectionColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (double)(-[CFXFilterPickerCollectionViewCell isInCompactMode](self, "isInCompactMode") ^ 1);
  -[CFXFilterPickerCollectionViewCell titleView](self, "titleView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

}

- (BOOL)isInCompactMode
{
  return self->_compactMode;
}

- (UILabel)titleView
{
  return (UILabel *)objc_getProperty(self, a2, 680, 1);
}

- (void)setTitleView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (UIView)selectionView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_selectionView);
}

- (void)setSelectionView:(id)a3
{
  objc_storeWeak((id *)&self->_selectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionView);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
