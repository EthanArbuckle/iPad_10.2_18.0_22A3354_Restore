@implementation SUUIStackedImageView

- (SUUIStackedImageView)initWithFrame:(CGRect)a3
{
  SUUIStackedImageView *v3;
  SUUIStackedImageView *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  MPUStackView *stackView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIStackedImageView;
  v3 = -[SUUIStackedImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_stackDepth = 3;
    v5 = SUUIMPUFoundationFramework();
    v6 = SUUIWeakLinkedClassForString(CFSTR("MPUBorderedImageStackItemView"), v5);
    v7 = objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("MPUStackView"), v5));
    -[SUUIStackedImageView bounds](v4, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:itemClass:itemReuseIdentifier:", v6, CFSTR("0"));
    stackView = v4->_stackView;
    v4->_stackView = (MPUStackView *)v8;

    -[MPUStackView setDataSource:](v4->_stackView, "setDataSource:", v4);
    -[MPUStackView setForcesIntegralY:](v4->_stackView, "setForcesIntegralY:", 1);
    -[SUUIStackedImageView addSubview:](v4, "addSubview:", v4->_stackView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MPUStackView setDataSource:](self->_stackView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIStackedImageView;
  -[SUUIStackedImageView dealloc](&v3, sel_dealloc);
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  float v6;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_opt_class();
  if (v5)
  {
    objc_msgSend(v5, "_configurationForSize:", width, height, 0);
    v6 = 0.0 * (double)0;
  }
  else
  {
    v6 = 0.0;
  }
  return floorf(v6);
}

- (UIView)perspectiveTargetView
{
  return (UIView *)-[MPUStackView perspectiveTargetView](self->_stackView, "perspectiveTargetView");
}

- (void)setBorderDrawingCache:(id)a3
{
  MPUBorderDrawingCache *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (MPUBorderDrawingCache *)a3;
  if (self->_borderDrawingCache != v5)
  {
    objc_storeStrong((id *)&self->_borderDrawingCache, a3);
    -[MPUStackView items](self->_stackView, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setBorderDrawingCache:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIStackedImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIStackedImageView;
    -[SUUIImageView setImage:](&v15, sel_setImage_, v4);
    -[MPUStackView items](self->_stackView, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setImage:", v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  int64_t v12;

  height = a3.height;
  width = a3.width;
  -[MPUStackView setBaseSize:](self->_stackView, "setBaseSize:");
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v6 = (void *)objc_opt_class();
  if (v6)
  {
    objc_msgSend(v6, "_configurationForSize:", width, height);
    v8 = *((double *)&v10 + 1);
    v7 = *(double *)&v10;
  }
  else
  {
    v12 = 0;
    v8 = 0.0;
    v7 = 0.0;
    v10 = 0u;
    v11 = 0u;
  }
  -[MPUStackView setMaximumRelativeOffsetStep:](self->_stackView, "setMaximumRelativeOffsetStep:", v7, v8);
  -[MPUStackView setSizeInsetStep:](self->_stackView, "setSizeInsetStep:", v11);
  if (self->_stackDepth != v12)
  {
    self->_stackDepth = v12;
    -[MPUStackView reloadData](self->_stackView, "reloadData");
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIStackedImageView;
  -[SUUIImageView setImageSize:](&v9, sel_setImageSize_, width, height);
}

- (void)setPerspectiveTargetView:(id)a3
{
  -[MPUStackView setPerspectiveTargetView:](self->_stackView, "setPerspectiveTargetView:", a3);
}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[MPUStackView setVanishingPoint:](self->_stackView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self->_stackView, "updateForChangedDistanceFromVanishingPoint");
}

- (CGPoint)vanishingPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[MPUStackView vanishingPoint](self->_stackView, "vanishingPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIStackedImageView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SUUIStackedImageView;
    -[SUUIStackedImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[SUUIStackedImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  -[SUUIStackedImageView center](self, "center");
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUIStackedImageView;
    -[SUUIStackedImageView setCenter:](&v9, sel_setCenter_, x, y);
    -[SUUIStackedImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  double v10;
  MPUStackView *stackView;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  -[SUUIImageView imageSize](self, "imageSize");
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x24BDBF148] && v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[SUUIStackedImageView image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v5 = v9;
    v6 = v10;

  }
  stackView = self->_stackView;
  -[SUUIStackedImageView bounds](self, "bounds");
  -[MPUStackView setFrame:](stackView, "setFrame:", SUUIImageRectForBounds(0, v5, v6, v12, v13, v14, v15));
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self->_stackView, "updateForChangedDistanceFromVanishingPoint");
  v16.receiver = self;
  v16.super_class = (Class)SUUIStackedImageView;
  -[SUUIImageView layoutSubviews](&v16, sel_layoutSubviews);
}

- (int64_t)numberOfItemsInStackView:(id)a3
{
  return self->_stackDepth;
}

- (void)stackView:(id)a3 applyAttributesToItem:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  MPUBorderConfiguration *borderConfiguration;
  uint64_t v11;
  MPUBorderConfiguration *v12;
  MPUBorderConfiguration *v13;
  MPUBorderConfiguration *v14;
  void *v15;
  MPUBorderConfiguration *v16;
  void *v17;
  MPUBorderConfiguration *v18;
  void *v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  double v25;
  void *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  v8 = a3;
  v9 = a4;
  borderConfiguration = self->_borderConfiguration;
  if (!borderConfiguration)
  {
    v11 = SUUIMPUFoundationFramework();
    v12 = (MPUBorderConfiguration *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("MPUBorderConfiguration"), v11));
    v13 = self->_borderConfiguration;
    self->_borderConfiguration = v12;

    if (stackView_applyAttributesToItem_atIndex__sOnce != -1)
      dispatch_once(&stackView_applyAttributesToItem_atIndex__sOnce, &__block_literal_global_44);
    v14 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setDropShadowColor:](v14, "setDropShadowColor:", v15);

    -[MPUBorderConfiguration setDropShadowEdges:](self->_borderConfiguration, "setDropShadowEdges:", 11);
    -[MPUBorderConfiguration setDropShadowWidth:](self->_borderConfiguration, "setDropShadowWidth:", 1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale);
    v16 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setBorderColor:](v16, "setBorderColor:", v17);

    -[MPUBorderConfiguration setBorderWidth:](self->_borderConfiguration, "setBorderWidth:", 1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale);
    v18 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setFillColor:](v18, "setFillColor:", v19);

    borderConfiguration = self->_borderConfiguration;
  }
  if ((unint64_t)a5 >= 5)
    a5 = 5;
  -[MPUBorderConfiguration setFillAlpha:](borderConfiguration, "setFillAlpha:", stackView_applyAttributesToItem_atIndex__sItemOverlayCenterWhiteAlphas[a5]);
  -[MPUBorderConfiguration setBorderAlpha:](self->_borderConfiguration, "setBorderAlpha:", stackView_applyAttributesToItem_atIndex__sItemOverlayBorderWhiteAlphas[a5]);
  objc_msgSend(v9, "setBorderConfiguration:", self->_borderConfiguration);
  objc_msgSend(v9, "setImageAlpha:", stackView_applyAttributesToItem_atIndex__sItemImageAlphas[a5]);
  objc_msgSend(v9, "setImageContentsRect:", stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 1], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 2], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 3]);
  v20 = a5 - 1;
  v21 = *MEMORY[0x24BDBD8B8];
  v22 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v28.c = v22;
  v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v28.tx = v23;
  if (((0x15uLL >> a5) & 1) == 0 || v20 <= 1)
  {
    v24 = 1.0;
    if (((0x15uLL >> a5) & 1) != 0)
      v25 = 1.0;
    else
      v25 = -1.0;
    if (v20 < 2)
      v24 = -1.0;
    *(_OWORD *)&v27.a = v21;
    *(_OWORD *)&v27.c = v22;
    *(_OWORD *)&v27.tx = v23;
    CGAffineTransformScale(&v28, &v27, v25, v24);
  }
  v27 = v28;
  objc_msgSend(v9, "setImageTransform:", &v27);
  -[SUUIStackedImageView image](self, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v26);

}

void __64__SUUIStackedImageView_stackView_applyAttributesToItem_atIndex___block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  stackView_applyAttributesToItem_atIndex__sScreenScale = v0;

}

- (void)stackView:(id)a3 didCreateItem:(id)a4
{
  objc_msgSend(a4, "setBorderDrawingCache:", self->_borderDrawingCache);
}

+ (SUUIStackedImageConfiguration)_configurationForSize:(SEL)a3
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 3;
  if (a4.height < a4.width)
    a4.width = a4.height;
  if (a4.width < 50.0)
  {
    *(_OWORD *)&retstr->var0.vertical = xmmword_241EFC730;
    retstr->var1.height = 1.0;
    return result;
  }
  if (a4.width < 80.0)
  {
    __asm { FMOV            V1.2D, #2.0 }
    retstr->var0 = (UIOffset)xmmword_241EFC720;
    retstr->var1 = _Q1;
    retstr->var2 = 4;
    return result;
  }
  if (a4.width >= 100.0)
  {
    if (a4.width >= 120.0)
    {
      if (a4.width >= 160.0)
        __asm { FMOV            V0.2D, #9.0 }
      else
        __asm { FMOV            V0.2D, #6.0 }
      __asm { FMOV            V1.2D, #3.0 }
      goto LABEL_16;
    }
    __asm { FMOV            V0.2D, #4.0 }
  }
  else
  {
    __asm { FMOV            V0.2D, #3.0 }
  }
  __asm { FMOV            V1.2D, #2.0 }
LABEL_16:
  retstr->var0 = _Q0;
  retstr->var1 = _Q1;
  return result;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  return self->_borderDrawingCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_borderConfiguration, 0);
}

@end
