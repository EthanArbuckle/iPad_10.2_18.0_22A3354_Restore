@implementation CFXOverlayEffectPickerView

- (id)effectPickerNibName
{
  return CFSTR("CFXOverlayEffectPickerView");
}

- (id)effectPickerCellNibName
{
  return CFSTR("CFXEffectPickerCollectionViewCell");
}

- (id)effectPickerCellReuseIdentifier
{
  return CFSTR("EffectCell");
}

- (void)subviewsDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXOverlayEffectPickerView;
  -[CFXEffectPickerView subviewsDidLoad](&v6, sel_subviewsDidLoad);
  -[CFXOverlayEffectPickerView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInset:", 9.0, 16.0, 0.0, 16.0);

  -[CFXOverlayEffectPickerView collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumLineSpacing:", 16.0);

  -[CFXOverlayEffectPickerView collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumInteritemSpacing:", 16.0);

  -[CFXOverlayEffectPickerView updateThumbnailColumnSizeForCollectionSize](self, "updateThumbnailColumnSizeForCollectionSize");
}

- (void)updateThumbnailColumnSizeForCollectionSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  void *v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;

  -[CFXOverlayEffectPickerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXOverlayEffectPickerView collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CFXOverlayEffectPickerView collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentInset");
    v15 = v6 + v14;
    v17 = v8 + v16;
    v19 = v10 - (v14 + v18);
    v21 = v12 - (v16 + v20);

    v27.origin.x = v15;
    v27.origin.y = v17;
    v27.size.width = v19;
    v27.size.height = v21;
    Width = CGRectGetWidth(v27);
    -[CFXOverlayEffectPickerView collectionViewLayout](self, "collectionViewLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "minimumInteritemSpacing");
    v25 = (4.0 + -1.0) * v24;

    v26 = floor((Width - v25) / 4.0);
    if (v26 > 0.0)
    {
      -[CFXEffectPickerView setThumbnailSize:](self, "setThumbnailSize:", v26, v26);
      -[CFXEffectPickerView setCellSize:](self, "setCellSize:", v26, v26);
    }
  }
}

- (void)didResizeCollectionViewToSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXOverlayEffectPickerView;
  -[CFXEffectPickerView didResizeCollectionViewToSize:](&v4, sel_didResizeCollectionViewToSize_, a3.width, a3.height);
  -[CFXOverlayEffectPickerView updateThumbnailColumnSizeForCollectionSize](self, "updateThumbnailColumnSizeForCollectionSize");
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (JTCollectionView)collectionView
{
  return (JTCollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (JTCollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
