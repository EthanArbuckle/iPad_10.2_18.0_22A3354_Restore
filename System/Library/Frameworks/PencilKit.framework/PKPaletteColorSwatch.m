@implementation PKPaletteColorSwatch

- (PKPaletteColorSwatch)init
{
  return (PKPaletteColorSwatch *)-[PKPaletteColorSwatch initWithSelectionRingInset:bulletInset:](self, 3.0, 5.0);
}

- (id)initWithSelectionRingInset:(double)a3 bulletInset:
{
  id *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)PKPaletteColorSwatch;
  v5 = (id *)objc_msgSendSuper2(&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    *((double *)v5 + 56) = a2;
    *((double *)v5 + 57) = a3;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[PKPaletteColorSwatch _updateBackgroundView](v6);
    -[PKPaletteColorSwatch _updateColorBulletView](v6);
    -[PKPaletteColorSwatch _updateSelectionHighlight](v6);
    objc_msgSend(v6, "setShowsLargeContentViewer:", 1);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    objc_msgSend(v6, "addInteraction:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v6);
    objc_storeStrong(v6 + 55, v9);

    v10 = v6[55];
  }
  else
  {
    objc_msgSend(0, "setShowsLargeContentViewer:", 1);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    objc_msgSend(0, "addInteraction:", v11);

    v10 = 0;
  }
  objc_msgSend(v6, "addInteraction:", v10);
  objc_msgSend(v6, "setHitTestInsets:", -12.0, -12.0, -12.0, -12.0);
  return v6;
}

- (void)_updateBackgroundView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;

  if (a1)
  {
    objc_msgSend(a1, "colorBackgroundView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = (void *)objc_msgSend(a1, "newColorBackgroundView");
      objc_msgSend(a1, "setColorBackgroundView:", v3);

      objc_msgSend(a1, "colorBackgroundView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addSubview:", v4);

    }
    if (objc_msgSend(a1, "wantsBackgroundViewColor"))
    {
      -[PKPaletteColorSwatch _uiColor](a1);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(a1, "colorBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v20);

    v6 = objc_msgSend(a1, "isSelected");
    objc_msgSend(a1, "selectionRingMaskLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || v7)
    {
      if (v7)
        v17 = v6;
      else
        v17 = 1;
      if ((v17 & 1) == 0)
      {
        objc_msgSend(a1, "colorBackgroundView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setMask:", 0);

        objc_msgSend(a1, "setSelectionRingMaskLayer:", 0);
      }
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      objc_msgSend(a1, "setSelectionRingMaskLayer:", v8);

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "CGColor");
      objc_msgSend(a1, "selectionRingMaskLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFillColor:", v10);

      v12 = *MEMORY[0x1E0CD2B70];
      objc_msgSend(a1, "selectionRingMaskLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFillRule:", v12);

      objc_msgSend(a1, "selectionRingMaskLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "colorBackgroundView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMask:", v14);

    }
    if (v6)
      objc_msgSend(a1, "setNeedsLayout");

  }
}

- (void)_updateColorBulletView
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = objc_msgSend(a1, "wantsColorBulletVisible");
    objc_msgSend(a1, "colorBulletView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2 || v3)
    {
      if (v3)
        v7 = v2;
      else
        v7 = 1;
      if ((v7 & 1) == 0)
      {
        objc_msgSend(a1, "colorBulletView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        objc_msgSend(a1, "setColorBulletView:", 0);
      }
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(a1, "setColorBulletView:", v5);

      objc_msgSend(a1, "colorBulletView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addSubview:", v6);

    }
    if (v2)
    {
      -[PKPaletteColorSwatch _uiColor](a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "colorBulletView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

      objc_msgSend(a1, "setNeedsLayout");
    }
  }
}

- (void)_updateSelectionHighlight
{
  double v2;
  void *v3;
  id v4;

  if (a1)
  {
    if (a1[417])
      v2 = 0.5;
    else
      v2 = 1.0;
    objc_msgSend(a1, "colorBackgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", v2);

    objc_msgSend(a1, "colorBulletView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", v2);

  }
}

- (UIColor)presentationColor
{
  void *v2;
  void *v3;

  -[PKPaletteColorSwatch swatchColor](self, "swatchColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  CGPath *Mutable;
  void *v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v55.receiver = self;
  v55.super_class = (Class)PKPaletteColorSwatch;
  -[PKPaletteColorSwatch layoutSubviews](&v55, sel_layoutSubviews);
  -[PKPaletteColorSwatch bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPaletteColorSwatch colorBackgroundView](self, "colorBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKPaletteColorSwatch bounds](self, "bounds");
  v12 = CGRectGetWidth(v56) * 0.5;
  -[PKPaletteColorSwatch colorBackgroundView](self, "colorBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v12);

  -[PKPaletteColorSwatch layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v12);

  -[PKPaletteColorSwatch colorBulletView](self, "colorBulletView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKPaletteColorSwatch bounds](self, "bounds");
    v58 = CGRectInset(v57, self->_bulletInset, self->_bulletInset);
    x = v58.origin.x;
    y = v58.origin.y;
    width = v58.size.width;
    height = v58.size.height;
    -[PKPaletteColorSwatch colorBulletView](self, "colorBulletView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", x, y, width, height);

    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v22 = CGRectGetWidth(v59) * 0.5;
    -[PKPaletteColorSwatch colorBulletView](self, "colorBulletView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", v22);

    -[PKPaletteColorSwatch colorBulletView](self, "colorBulletView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderWidth:", 0.5);

    -[PKPaletteColorSwatch traitCollection](self, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceStyle");

    if (v28 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 0.16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 0.08;
    }
    objc_msgSend(v29, "colorWithAlphaComponent:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_retainAutorelease(v32);
    v34 = objc_msgSend(v33, "CGColor");
    -[PKPaletteColorSwatch colorBulletView](self, "colorBulletView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBorderColor:", v34);

  }
  -[PKPaletteColorSwatch selectionRingMaskLayer](self, "selectionRingMaskLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[PKPaletteColorSwatch bounds](self, "bounds");
    v61 = CGRectInset(v60, self->_selectionInset, self->_selectionInset);
    v38 = v61.origin.x;
    v39 = v61.origin.y;
    v40 = v61.size.width;
    v41 = v61.size.height;
    -[PKPaletteColorSwatch colorBackgroundView](self, "colorBackgroundView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;

    -[PKPaletteColorSwatch selectionRingMaskLayer](self, "selectionRingMaskLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    Mutable = CGPathCreateMutable();
    v62.origin.x = v45;
    v62.origin.y = v47;
    v62.size.width = v49;
    v62.size.height = v51;
    CGPathAddRect(Mutable, 0, v62);
    v63.origin.x = v38;
    v63.origin.y = v39;
    v63.size.width = v40;
    v63.size.height = v41;
    CGPathAddEllipseInRect(Mutable, 0, v63);
    -[PKPaletteColorSwatch selectionRingMaskLayer](self, "selectionRingMaskLayer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setPath:", Mutable);

    CGPathRelease(Mutable);
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
  }
}

- (void)setSwatchColor:(id)a3
{
  PKSwatchColor *v5;
  PKSwatchColor **p_swatchColor;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  PKSwatchColor *v11;

  v5 = (PKSwatchColor *)a3;
  p_swatchColor = &self->_swatchColor;
  if (self->_swatchColor != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_swatchColor, a3);
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
    -[PKSwatchColor identifier](*p_swatchColor, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("multi"));

    if (v8)
    {
      _PencilKitBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Show More Colors"), CFSTR("Show More Colors"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorSwatch setLargeContentTitle:](self, "setLargeContentTitle:", v10);

    }
    else
    {
      -[PKSwatchColor identifier](*p_swatchColor, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorSwatch setLargeContentTitle:](self, "setLargeContentTitle:", v9);
    }

    v5 = v11;
  }

}

- (id)_uiColor
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "presentationColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[54];
  if (!v3)
  {
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceStyle");

  }
  +[PKInkingTool convertColor:fromUserInterfaceStyle:to:](PKInkingTool, "convertColor:fromUserInterfaceStyle:to:", v2, 1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteColorSwatch;
  -[PKPaletteColorSwatch traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (self)
  {
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
  }
}

- (void)setColorUserInterfaceStyle:(_QWORD *)a1
{
  if (a1)
  {
    if (a1[54] != a2)
    {
      a1[54] = a2;
      -[PKPaletteColorSwatch _updateBackgroundView](a1);
      -[PKPaletteColorSwatch _updateColorBulletView](a1);
    }
  }
}

- (id)newColorBackgroundView
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (BOOL)wantsBackgroundViewColor
{
  return 1;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0DC3D90]);
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithView:", v7);

  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorSwatch traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = (void *)MEMORY[0x1E0DC3B30];
  if (v11 == 6)
  {
    objc_msgSend(v5, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v5, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    objc_msgSend(v12, "shapeWithRoundedRect:cornerRadius:", v15, v17, v19, v21, v23 * 0.5);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v5, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v24, "bezierPathWithOvalInRect:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shapeWithPath:", v22);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a5, "rect", a3, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PKPaletteColorSwatch hitTestInsets](self, "hitTestInsets");
  v15 = v14;
  -[PKPaletteColorSwatch hitTestInsets](self, "hitTestInsets");
  v17 = v16;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v20 = CGRectInset(v19, v15, v17);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (PKSwatchColor)swatchColor
{
  return self->_swatchColor;
}

- (UIView)colorBackgroundView
{
  return self->_colorBackgroundView;
}

- (void)setColorBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_colorBackgroundView, a3);
}

- (CAShapeLayer)selectionRingMaskLayer
{
  return self->_selectionRingMaskLayer;
}

- (void)setSelectionRingMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRingMaskLayer, a3);
}

- (UIView)colorBulletView
{
  return self->_colorBulletView;
}

- (void)setColorBulletView:(id)a3
{
  objc_storeStrong((id *)&self->_colorBulletView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorBulletView, 0);
  objc_storeStrong((id *)&self->_selectionRingMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorBackgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_swatchColor, 0);
}

@end
