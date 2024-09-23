@implementation HUGridFlowLayoutCellAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridFlowLayoutCellAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HUGridFlowLayoutCellAttributes normalizedWallpaperRect](self, "normalizedWallpaperRect");
  objc_msgSend(v4, "setNormalizedWallpaperRect:");
  -[HUGridFlowLayoutCellAttributes backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffectViewGrouper:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HUGridFlowLayoutCellAttributes *v4;
  HUGridFlowLayoutCellAttributes *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v4 = (HUGridFlowLayoutCellAttributes *)a3;
  if (v4 == self)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HUGridFlowLayoutCellAttributes normalizedWallpaperRect](self, "normalizedWallpaperRect");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[HUGridFlowLayoutCellAttributes normalizedWallpaperRect](v5, "normalizedWallpaperRect");
      v28.origin.x = v14;
      v28.origin.y = v15;
      v28.size.width = v16;
      v28.size.height = v17;
      v27.origin.x = v7;
      v27.origin.y = v9;
      v27.size.width = v11;
      v27.size.height = v13;
      if (CGRectEqualToRect(v27, v28))
      {
        -[HUGridFlowLayoutCellAttributes backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridFlowLayoutCellAttributes backgroundEffectViewGrouper](v5, "backgroundEffectViewGrouper");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v18 == (void *)v19)
        {

        }
        else
        {
          v20 = (void *)v19;
          -[HUGridFlowLayoutCellAttributes backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridFlowLayoutCellAttributes backgroundEffectViewGrouper](v5, "backgroundEffectViewGrouper");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqual:", v22);

          if (!v23)
            goto LABEL_6;
        }
        v26.receiver = self;
        v26.super_class = (Class)HUGridFlowLayoutCellAttributes;
        v24 = -[UICollectionViewLayoutAttributes isEqual:](&v26, sel_isEqual_, v5);
        goto LABEL_11;
      }
LABEL_6:
      v24 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v24 = 0;
  }
LABEL_12:

  return v24;
}

- (CGRect)normalizedWallpaperRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedWallpaperRect.origin.x;
  y = self->_normalizedWallpaperRect.origin.y;
  width = self->_normalizedWallpaperRect.size.width;
  height = self->_normalizedWallpaperRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedWallpaperRect:(CGRect)a3
{
  self->_normalizedWallpaperRect = a3;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper
{
  return (HUBackgroundEffectViewGrouping *)objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);
}

- (void)setBackgroundEffectViewGrouper:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundEffectViewGrouper, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundEffectViewGrouper);
}

@end
