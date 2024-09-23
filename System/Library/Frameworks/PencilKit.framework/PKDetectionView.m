@implementation PKDetectionView

- (PKDetectionView)init
{
  PKDetectionView *v2;
  uint64_t v3;
  UIContextMenuInteraction *menuInteraction;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDetectionView;
  v2 = -[PKDetectionView init](&v7, sel_init);
  -[PKDetectionView setOpaque:](v2, "setOpaque:", 0);
  -[PKDetectionView setContentMode:](v2, "setContentMode:", 3);
  -[PKDetectionView setTintAdjustmentMode:](v2, "setTintAdjustmentMode:", 1);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v2);
  menuInteraction = v2->_menuInteraction;
  v2->_menuInteraction = (UIContextMenuInteraction *)v3;

  -[PKDetectionView addInteraction:](v2, "addInteraction:", v2->_menuInteraction);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v2, sel_tapHandler_);
  -[PKDetectionView addGestureRecognizer:](v2, "addGestureRecognizer:", v5);

  return v2;
}

- (PKDetectionItem)item
{
  return (PKDetectionItem *)(id)objc_opt_new();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4688];
}

- (CGRect)drawingBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PKDetectionView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_underlineThickness
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[PKDetectionView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_strokeWidth");
  v4 = v3 * 0.5;

  result = fmin(v4, 10.0);
  if (result < 1.0)
    return 1.0;
  return result;
}

- (id)_underlineColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKDetectionView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKDetectionView tintColor](self, "tintColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform *p_drawingTransform;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double v26;
  double v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PKDetectionView _underlineColor](self, "_underlineColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDetectionView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDetectionView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v6)
  {
    if (v8 == 2)
    {
      *(_QWORD *)&v23 = 0;
      v27 = 0.0;
      *(_QWORD *)&v28 = 0;
      v26 = 0.0;
      if (objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v23, &v28, &v27, &v26))
      {
        v9 = fmin(v27 + 0.7, 1.0);
        v10 = 0.0;
        if (*(double *)&v28 + -0.1 >= 0.0)
          v10 = *(double *)&v28 + -0.1;
        v27 = v9;
        *(double *)&v28 = v10;
        v26 = fmin(v26 + 0.2, 1.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", *(double *)&v23);
        v11 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v11;
      }
    }
  }
  objc_msgSend(v4, "set");
  -[PKDetectionView item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemSpaceBaselinePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  -[PKDetectionView _setLineDashFor:](self, "_setLineDashFor:", v14);
  -[PKDetectionView _underlineThickness](self, "_underlineThickness");
  objc_msgSend(v14, "setLineWidth:");
  objc_msgSend(v14, "setLineCapStyle:", 1);
  objc_msgSend(v14, "setLineJoinStyle:", 1);
  p_drawingTransform = &self->_drawingTransform;
  v16 = *(_OWORD *)&self->_drawingTransform.c;
  v23 = *(_OWORD *)&self->_drawingTransform.a;
  v24 = v16;
  v25 = *(_OWORD *)&self->_drawingTransform.tx;
  objc_msgSend(v14, "applyTransform:", &v23);
  objc_msgSend(v14, "stroke");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v17, "BOOLForKey:", CFSTR("internalSettings.datadetectors.showBounds"));

  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "set");

    -[PKDetectionView item](self, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemSpaceBoundsPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    objc_msgSend(v21, "setLineWidth:", 0.5);
    v28 = xmmword_1BE4FC350;
    objc_msgSend(v21, "setLineDash:count:phase:", &v28, 2, 0.0);
    v22 = *(_OWORD *)&p_drawingTransform->c;
    v23 = *(_OWORD *)&p_drawingTransform->a;
    v24 = v22;
    v25 = *(_OWORD *)&p_drawingTransform->tx;
    objc_msgSend(v21, "applyTransform:", &v23);
    objc_msgSend(v21, "stroke");

  }
}

- (BOOL)hitTest:(CGPoint)a3
{
  double v4;
  __int128 v5;
  void *v6;
  void *v7;
  char v8;
  double y;
  double x;
  float64x2_t v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  y = a3.y;
  x = a3.x;
  if ((-[PKDetectionView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[PKDetectionView alpha](self, "alpha");
  if (v4 <= 0.0)
    return 0;
  v5 = *(_OWORD *)&self->_drawingTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->_drawingTransform.a;
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tx = *(_OWORD *)&self->_drawingTransform.tx;
  CGAffineTransformInvert(&v14, &v13);
  v12 = vaddq_f64(*(float64x2_t *)&v14.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v14.c, y), *(float64x2_t *)&v14.a, x));
  -[PKDetectionView item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemSpaceBoundsPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsPoint:", *(_OWORD *)&v12);

  return v8;
}

- (void)tapHandler:(id)a3
{
  double MidX;
  double MaxY;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];
  _BYTE v10[48];
  CGRect v11;
  CGRect v12;

  objc_msgSend(a3, "locationInView:", self);
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    -[PKDetectionView bounds](self, "bounds");
    MidX = CGRectGetMidX(v11);
    -[PKDetectionView bounds](self, "bounds");
    MaxY = CGRectGetMaxY(v12);
    -[PKDetectionView item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionView menuInteraction](self, "menuInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionView drawingTransform](self, "drawingTransform");
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v9[0] = *MEMORY[0x1E0C9BAA8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v6, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:", v7, self, v9, v10, MidX, MaxY);

  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (CGAffineTransform)drawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].d;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.tx = v3;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)setMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_menuInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuInteraction, 0);
}

@end
