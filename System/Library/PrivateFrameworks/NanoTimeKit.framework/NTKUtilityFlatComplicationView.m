@implementation NTKUtilityFlatComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NTKUtilityFlatComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilityFlatComplicationView *v3;
  NTKUtilityFlatComplicationView *v4;
  uint64_t v5;
  CLKUIColoringLabel *label;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKUtilityFlatComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[NTKUtilityComplicationView _newStandardLabelSubview](v3, "_newStandardLabelSubview");
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v5;

    objc_storeStrong((id *)&v4->_activeLabel, v4->_label);
    -[NTKUtilityFlatComplicationView _updateHighlightViewCornerRadius](v4, "_updateHighlightViewCornerRadius");
  }
  return v4;
}

+ (void)circleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 interior:(BOOL *)a6 forPlacement:(unint64_t)a7 forDevice:(id)a8
{
  char v8;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  _BYTE v22[208];
  uint64_t v23;
  _BYTE v24[200];
  uint64_t v25;
  _OWORD v26[13];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v8 = a7;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  memset(v26, 0, sizeof(v26));
  v21 = a8;
  _LayoutConstants_49(v21, v26);
  if (a6)
    *a6 = 0;
  v13 = *(double *)&v28;
  v14 = *((double *)&v27 + 1);
  v15 = *(double *)&v29;
  v16 = *((double *)&v28 + 1);
  if ((v8 & 1) != 0)
  {
    _LayoutConstants_49(v21, v24);
    v18 = v25;
    v17 = 0;
    if ((v8 & 2) == 0)
    {
      v14 = (v8 & 8) != 0 ? -v14 : v13;
      if ((v8 & 8) == 0)
        v16 = v15;
    }
    if (a3)
      goto LABEL_14;
  }
  else
  {
    if ((v8 & 4) == 0)
    {
      v17 = 0;
      v18 = 0;
      v14 = 0.0;
      v16 = 0.0;
      if (!a3)
        goto LABEL_15;
LABEL_14:
      *(_QWORD *)a3 = v18;
      goto LABEL_15;
    }
    _LayoutConstants_49(v21, v22);
    v18 = v23;
    if ((v8 & 8) != 0)
      v19 = v14;
    else
      v19 = v13;
    if ((v8 & 8) != 0)
      v20 = v16;
    else
      v20 = v15;
    if ((v8 & 2) != 0)
      v14 = -v14;
    else
      v14 = v19;
    if ((v8 & 2) == 0)
      v16 = v20;
    v17 = 1;
    if (a3)
      goto LABEL_14;
  }
LABEL_15:
  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = v16;
  if (a6)
    *a6 = v17;

}

- (void)updateTextWidthIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _BYTE v9[336];
  double v10;
  double v11;
  double v12;

  -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v11 = 0.0;
    v12 = 0.0;
    -[CLKUICurvedColoringLabel sizeToFit](self->_curvedLabel, "sizeToFit");
    -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", 0, &v12, &v11);
    v4 = fabs(v12);
    v5 = fabs(v11);
    v11 = v5;
    v12 = v4;
    if (v4 >= v5)
      v6 = v4;
    else
      v6 = v5;
    if (v4 >= v5)
      v4 = v5;
    v7 = v6 - v4;
    -[NTKUtilityComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v8, v9);
    -[NTKUtilityFlatComplicationView setTextWidthInRadians:](self, "setTextWidthInRadians:", v7 + v10);

  }
}

- (void)setTextWidthInRadians:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_textWidthInRadians = a3;
    -[NTKUtilityFlatComplicationView delegate](self, "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[NTKUtilityFlatComplicationView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[NTKUtilityFlatComplicationView delegate](self, "delegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "utilityComplicationView:didChangeTextWidth:", self, self->_textWidthInRadians);

      }
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CLKUICurvedColoringLabel *curvedLabel;
  void *v9;
  BOOL v10;
  void *v11;
  char isKindOfClass;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  _BYTE v31[304];
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  curvedLabel = self->_curvedLabel;
  if (curvedLabel)
  {
    -[CLKUICurvedColoringLabel path](curvedLabel, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = 0;
    }
    else
    {
      v28 = 0.0;
      v29 = 0.0;
      v26 = 0.0;
      v27 = 0.0;
      -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", &v28, &v27, &v26);
      -[CLKUICurvedColoringLabel convertPoint:fromView:](self->_curvedLabel, "convertPoint:fromView:", self, x, y);
      v15 = v14;
      v17 = v16;
      -[CLKUICurvedColoringLabel circleRadius](self->_curvedLabel, "circleRadius");
      v19 = v18;
      v20 = -[CLKUICurvedColoringLabel interior](self->_curvedLabel, "interior");
      v22 = v26;
      v21 = v27;
      -[NTKUtilityComplicationView device](self, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_49(v23, v31);
      v10 = NTKUtilityComplicationCurvedPointInside(v20, v15, v17, v19, v28, v29, v21, v22, v24, v32, v33, v34, v35);

    }
  }
  else
  {
    -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NTKUtilityFlatComplicationView bounds](self, "bounds");
      v38 = CGRectInset(v37, 0.0, -20.0);
      v36.x = x;
      v36.y = y;
      v13 = CGRectContainsPoint(v38, v36);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)NTKUtilityFlatComplicationView;
      v13 = -[NTKUtilityComplicationView pointInside:withEvent:](&v30, sel_pointInside_withEvent_, v7, x, y);
    }
    v10 = v13;
  }

  return v10;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  CLKUIColoringLabel *v8;
  CLKUIColoringLabel *v9;
  void *v10;
  CLKUICurvedColoringLabel *v11;
  CLKUICurvedColoringLabel *v12;
  UIImageView *v13;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v15;
  void *v16;
  CLKUICurvedColoringLabel *v17;
  CLKUICurvedColoringLabel *curvedLabel;
  UIImageView *curvedHighlightView;
  CLKUICurvedColoringLabel *v20;
  CLKUICurvedColoringLabel *v21;
  void *v22;
  UIImageView *v23;
  CLKUIColoringLabel *v24;
  CLKUIColoringLabel *v25;
  id v26;
  objc_super v27;

  -[NTKUtilityComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceCategory");

  if (v6 == 1)
    a3 = 0;
  v7 = -[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle");
  v27.receiver = self;
  v27.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView setTextLayoutStyle:](&v27, sel_setTextLayoutStyle_, a3);
  if (-[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") != v7)
  {
    if (a3 == 2)
    {
      label = self->_label;
      if (label)
      {
        -[CLKUIColoringLabel removeFromSuperview](label, "removeFromSuperview");
        v15 = self->_label;
        self->_label = 0;

        -[NTKUtilityComplicationView highlightView](self, "highlightView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

      }
      v17 = -[NTKUtilityComplicationView _newStandardCurvedLabelSubview](self, "_newStandardCurvedLabelSubview");
      curvedLabel = self->_curvedLabel;
      self->_curvedLabel = v17;

      -[CLKUICurvedColoringLabel setFilterProvider:](self->_curvedLabel, "setFilterProvider:", self);
      objc_storeStrong((id *)&self->_activeLabel, self->_curvedLabel);
      v13 = -[NTKUtilityComplicationView _newCurvedPathHighlightView](self, "_newCurvedPathHighlightView");
      goto LABEL_12;
    }
    if (a3 == 1)
    {
      v8 = self->_label;
      if (v8)
      {
        -[CLKUIColoringLabel removeFromSuperview](v8, "removeFromSuperview");
        v9 = self->_label;
        self->_label = 0;

        -[NTKUtilityComplicationView highlightView](self, "highlightView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

      }
      v11 = -[NTKUtilityComplicationView _newStandardCurvedLabelSubview](self, "_newStandardCurvedLabelSubview");
      v12 = self->_curvedLabel;
      self->_curvedLabel = v11;

      -[CLKUICurvedColoringLabel setFilterProvider:](self->_curvedLabel, "setFilterProvider:", self);
      objc_storeStrong((id *)&self->_activeLabel, self->_curvedLabel);
      v13 = -[NTKUtilityComplicationView _newCurvedCircularHighlightView](self, "_newCurvedCircularHighlightView");
LABEL_12:
      curvedHighlightView = self->_curvedHighlightView;
      self->_curvedHighlightView = v13;

      -[NTKUtilityComplicationView setHighlightView:](self, "setHighlightView:", self->_curvedHighlightView);
      return;
    }
    v20 = self->_curvedLabel;
    if (v20)
    {
      -[CLKUICurvedColoringLabel removeFromSuperview](v20, "removeFromSuperview");
      v21 = self->_curvedLabel;
      self->_curvedLabel = 0;

      -[NTKUtilityComplicationView highlightView](self, "highlightView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeFromSuperview");

      v23 = self->_curvedHighlightView;
      self->_curvedHighlightView = 0;

    }
    v24 = -[NTKUtilityComplicationView _newStandardLabelSubview](self, "_newStandardLabelSubview");
    v25 = self->_label;
    self->_label = v24;

    objc_storeStrong((id *)&self->_activeLabel, self->_label);
    v26 = -[NTKUtilityComplicationView _newHighlightView](self, "_newHighlightView");
    -[NTKUtilityComplicationView setHighlightView:](self, "setHighlightView:", v26);

  }
}

- (void)setForegroundColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[NTKUtilityComplicationView foregroundColor](self, "foregroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKUtilityFlatComplicationView;
    -[NTKUtilityComplicationView setForegroundColor:](&v7, sel_setForegroundColor_, v4);
  }

}

- (void)setPlacement:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double *v10;
  unint64_t v11;
  CLKUICurvedColoringLabel *curvedLabel;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[256];
  uint64_t v16;
  unsigned __int8 v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView setPlacement:](&v21, sel_setPlacement_);
  if (-[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 1)
  {
    v19 = 0.0;
    v20 = 0.0;
    v18 = 0.0;
    v17 = 0;
    v5 = (void *)objc_opt_class();
    -[NTKUtilityComplicationView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "circleRadius:centerAngle:maxAngularWidth:interior:forPlacement:forDevice:", &v20, &v19, &v18, &v17, a3, v6);

    -[CLKUICurvedColoringLabel setCircleRadius:](self->_curvedLabel, "setCircleRadius:", v20);
    -[CLKUICurvedColoringLabel setInterior:](self->_curvedLabel, "setInterior:", v17);
    -[CLKUICurvedColoringLabel setCenterAngle:](self->_curvedLabel, "setCenterAngle:", v19);
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](self->_curvedLabel, "setMaxAngularWidth:", v18);
    if (!-[NTKUtilityComplicationView isPlacementForTopBezelComplication](self, "isPlacementForTopBezelComplication"))
    {
      v7 = v17;
      -[NTKUtilityComplicationView device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        _LayoutConstants_49(v8, v15);
        v10 = (double *)&v16;
      }
      else
      {
        _LayoutConstants_49(v8, &v13);
        v10 = (double *)&v14;
      }
      -[CLKUICurvedColoringLabel setTracking:](self->_curvedLabel, "setTracking:", *v10);

    }
    v11 = -[NTKUtilityFlatComplicationView imagePlacement](self, "imagePlacement");
    curvedLabel = self->_curvedLabel;
  }
  else
  {
    if (-[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") != 2)
      return;
    -[CLKUICurvedColoringLabel setPath:](self->_curvedLabel, "setPath:", self->_path);
    v11 = -[NTKUtilityFlatComplicationView imagePlacement](self, "imagePlacement");
    curvedLabel = self->_curvedLabel;
  }
  -[CLKUICurvedColoringLabel setImagePlacement:](curvedLabel, "setImagePlacement:", v11);
}

- (void)setMaxAngularWidth:(double)a3
{
  void *v5;

  -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](self->_curvedLabel, "setMaxAngularWidth:", a3);
}

- (double)maxAngularWidth
{
  void *v3;
  double result;

  -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0.0;
  -[CLKUICurvedColoringLabel maxAngularWidth](self->_curvedLabel, "maxAngularWidth");
  return result;
}

- (void)setCircleRadius:(double)a3
{
  void *v5;

  -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CLKUICurvedColoringLabel setCircleRadius:](self->_curvedLabel, "setCircleRadius:", a3);
}

- (double)circleRadius
{
  void *v3;
  double result;

  -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0.0;
  -[CLKUICurvedColoringLabel circleRadius](self->_curvedLabel, "circleRadius");
  return result;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
  -[CLKUICurvedColoringLabel setBaselineOffset:](self->_curvedLabel, "setBaselineOffset:");
}

- (void)setPath:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_path, a3);
  v5 = a3;
  -[CLKUICurvedColoringLabel setPath:](self->_curvedLabel, "setPath:", v5);

}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[CLKUICurvedColoringLabel setTextAlignment:](self->_curvedLabel, "setTextAlignment:");
}

- (void)setTracking:(double)a3
{
  self->_tracking = a3;
  -[CLKUICurvedColoringLabel setTracking:](self->_curvedLabel, "setTracking:");
}

- (void)setUseBlockyHighlightCorners:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView setUseBlockyHighlightCorners:](&v4, sel_setUseBlockyHighlightCorners_, a3);
  -[NTKUtilityFlatComplicationView _updateHighlightViewCornerRadius](self, "_updateHighlightViewCornerRadius");
}

- (unint64_t)imagePlacement
{
  if ((-[NTKUtilityComplicationView placement](self, "placement") & 8) != 0)
    return 2;
  if ((-[NTKUtilityComplicationView placement](self, "placement") & 4) == 0)
    return 1;
  if (CLKLayoutIsRTL())
    return 2;
  return 1;
}

- (void)setShouldUseBackgroundPlatter:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView setShouldUseBackgroundPlatter:](&v4, sel_setShouldUseBackgroundPlatter_, a3);
  -[NTKUtilityFlatComplicationView _updateHighlightViewCornerRadius](self, "_updateHighlightViewCornerRadius");
}

- (void)_updateHighlightViewCornerRadius
{
  _BOOL4 v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _BYTE v10[192];
  double v11;
  _BYTE v12[152];
  double v13;

  v3 = -[NTKUtilityComplicationView useBlockyHighlightCorners](self, "useBlockyHighlightCorners");
  -[NTKUtilityComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (v3)
  {
    _LayoutConstants_49(v4, v12);
    v5 = v13;
LABEL_6:
    -[NTKUtilityComplicationView highlightView](self, "highlightView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v5);

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "deviceCategory");

  if (v6 != 1)
  {
    -[NTKUtilityComplicationView device](self, "device");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v9, v10);
    v5 = v11;
    goto LABEL_6;
  }
  -[NTKUtilityComplicationView highlightView](self, "highlightView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 0.0);
LABEL_7:

}

- (BOOL)_shouldLayoutWithImageView
{
  int v3;
  CDComplicationImageView *imageView;

  if (-[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 1
    || -[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    imageView = self->_imageView;
    if (imageView)
      v3 = -[CDComplicationImageView isHidden](imageView, "isHidden") ^ 1;
    else
      v3 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[CDComplicationImageView hasMonochromeImage](self->_imageView, "hasMonochromeImage") & v3;
  }
  return v3;
}

- (void)_updateLabelMaxWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9[43];
  _BYTE v10[96];
  double v11;

  -[NTKUtilityComplicationView maxSize](self, "maxSize");
  v4 = v3;
  if (-[NTKUtilityFlatComplicationView _shouldLayoutWithImageView](self, "_shouldLayoutWithImageView"))
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = v5;
    -[NTKUtilityComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v7, v10);
    v4 = v4 - (v6 + v11);

  }
  if (-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v8, v9);
    v4 = v4 + v9[22] * -2.0;

  }
  -[CLKUIColoringLabel setMaxWidth:](self->_activeLabel, "setMaxWidth:", v4);
}

- (double)_widthThatFits
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v11;
  _BYTE v12[96];

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[CLKUIColoringLabel sizeThatFits:](self->_activeLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], v4);
  if (-[NTKUtilityFlatComplicationView _shouldLayoutWithImageView](self, "_shouldLayoutWithImageView"))
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v4);
    -[NTKUtilityComplicationView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v5, v12);

  }
  if (-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v6, &v11);

  }
  -[NTKUtilityComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  v9 = v8;

  return v9;
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  BOOL v5;
  CDComplicationImageView *v6;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v8;
  CLKUICurvedColoringLabel *curvedLabel;
  CDComplicationImageView *v10;
  unint64_t v11;
  void *v12;
  CLKUIColoringLabel *activeLabel;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _BYTE v19[96];
  double v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView _updateForTemplateChange](&v21, sel__updateForTemplateChange);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NTKUtilityFlatComplicationView setUseBlockyHighlightCorners:](self, "setUseBlockyHighlightCorners:", 1);
  v5 = -[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 1
    || -[NTKUtilityComplicationView textLayoutStyle](self, "textLayoutStyle") == 2;
  if ((objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v4) & 1) == 0)
  {
    if (v5)
      -[CLKUICurvedColoringLabel setImageView:](self->_curvedLabel, "setImageView:", 0);
    else
      -[CDComplicationImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v4);
    v6 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    imageView = self->_imageView;
    self->_imageView = v6;

    -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:", self->_imageView);
    -[NTKUtilityComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  }
  -[CDComplicationImageView setImageProvider:](self->_imageView, "setImageProvider:", v4);
  v8 = self->_imageView;
  if (v5)
  {
    if (!v8 || (-[CDComplicationImageView bounds](self->_imageView, "bounds"), CGRectIsEmpty(v22)))
    {
      -[CLKUICurvedColoringLabel setImageView:](self->_curvedLabel, "setImageView:", 0);
    }
    else
    {
      curvedLabel = self->_curvedLabel;
      v10 = self->_imageView;
      v11 = -[NTKUtilityFlatComplicationView imagePlacement](self, "imagePlacement");
      -[NTKUtilityComplicationView device](self, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_49(v12, v19);
      -[CLKUICurvedColoringLabel setImageView:placement:padding:](curvedLabel, "setImageView:placement:padding:", v10, v11, v20);

    }
  }
  else if (v8)
  {
    -[NTKUtilityFlatComplicationView addSubview:](self, "addSubview:");
  }
  activeLabel = self->_activeLabel;
  objc_msgSend(v3, "textProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](activeLabel, "setTextProvider:", v14);

  if (self->_curvedLabel)
  {
    -[NTKUtilityComplicationView setBackgroundPlatter:](self, "setBackgroundPlatter:", 0);
    -[UIImageView setImage:](self->_curvedHighlightView, "setImage:", 0);
  }
  -[NTKUtilityFlatComplicationView _updateLabelMaxWidth](self, "_updateLabelMaxWidth");
  -[NTKUtilityComplicationView colorScheme](self, "colorScheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsOverrideFaceColor");

  if (v16)
  {
    -[NTKUtilityComplicationView colorScheme](self, "colorScheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUtilityComplicationView _applyColorScheme:](self, "_applyColorScheme:", v17);

  }
  -[NTKUtilityFlatComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "complicationDisplayNeedsResize:", self);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  CLKUICurvedColoringLabel *curvedLabel;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  _BYTE v17[176];
  double v18;
  objc_super v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  curvedLabel = self->_curvedLabel;
  if (!curvedLabel)
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKUtilityFlatComplicationView;
    -[NTKUtilityComplicationView sizeThatFits:](&v19, sel_sizeThatFits_, a3.width, a3.height);
    height = v11;
    goto LABEL_14;
  }
  if (self->_label)
  {
    -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    width = v7;
    height = v8;
    if (!-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
      goto LABEL_12;
    -[NTKUtilityComplicationView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v9, v17);
    width = width + v18 * 2.0;
  }
  else
  {
    -[CLKUICurvedColoringLabel path](curvedLabel, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_12;
    -[CLKUICurvedColoringLabel centerAngle](self->_curvedLabel, "centerAngle");
    v13 = CLKFloatEqualsFloat();
    -[NTKUtilityComplicationView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      CLKUICurvedColoringLabelCenterSize();
    else
      CLKUICurvedColoringLabelCornerSize();
    width = v14;
    height = v15;
  }

LABEL_12:
  -[NTKUtilityComplicationView minimumWidth](self, "minimumWidth");
  if (width >= v10)
    v10 = width;
LABEL_14:
  v16 = height;
  result.height = v16;
  result.width = v10;
  return result;
}

- (CGSize)boundingSizeOfCurrentComplicationTemplate
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[NTKUtilityFlatComplicationView layoutIfNeeded](self, "layoutIfNeeded");
  -[CLKUIColoringLabel frame](self->_activeLabel, "frame");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
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
  CGFloat v25;
  double v26;
  CGFloat v27;
  char v28;
  int IsRTL;
  double v30;
  double v31;
  double v32;
  double MinX;
  double v34;
  char v35;
  CLKUICurvedColoringLabel *curvedLabel;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CDComplicationImageView *imageView;
  void *v52;
  void *v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  uint64_t v76;
  uint64_t v77;
  _OWORD v78[6];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  objc_super v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v95.receiver = self;
  v95.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView layoutSubviews](&v95, sel_layoutSubviews);
  -[NTKUtilityComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v79 = 0u;
  memset(v78, 0, sizeof(v78));
  _LayoutConstants_49(v3, v78);
  -[NTKUtilityFlatComplicationView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CLKUIColoringLabel sizeToFit](self->_activeLabel, "sizeToFit");
  if (self->_label)
  {
    v12 = -[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset");
    v13 = *(double *)&v84;
    if (v12)
      v9 = v9 + *(double *)&v84 * -2.0;
    else
      v13 = -0.0;
    v5 = v5 + v13;
    -[NTKUtilityComplicationView layoutLabelVertically:](self, "layoutLabelVertically:", self->_activeLabel);
  }
  -[CLKUIColoringLabel frame](self->_activeLabel, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (-[NTKUtilityFlatComplicationView _shouldLayoutWithImageView](self, "_shouldLayoutWithImageView"))
  {
    v74 = v7;
    v75 = v11;
    -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
    -[CDComplicationImageView frame](self->_imageView, "frame");
    v23 = v22;
    v25 = v24;
    -[NTKUtilityComplicationView _imageViewOriginYWithBaseImageSize:labelFrame:](self, "_imageViewOriginYWithBaseImageSize:labelFrame:", v22, v24, v15, v17, v19, v21);
    v27 = v26;
    if (v19 > v9 - v23 - *(double *)&v79)
      v19 = v9 - v23 - *(double *)&v79;
    v28 = -[NTKUtilityComplicationView placement](self, "placement");
    if ((v28 & 2) != 0)
    {
      v98.origin.x = v5;
      v98.origin.y = v74;
      v98.size.height = v75;
      v98.size.width = v9;
      v99.origin.x = CGRectGetMinX(v98);
      v99.origin.y = v27;
      v99.size.width = v23;
      v99.size.height = v25;
      CGRectGetMaxX(v99);
    }
    else if ((v28 & 8) != 0)
    {
      v100.origin.x = v5;
      v100.origin.y = v74;
      v100.size.height = v75;
      v100.size.width = v9;
      v101.origin.x = CGRectGetMaxX(v100) - v23;
      v101.origin.y = v27;
      v101.size.width = v23;
      v101.size.height = v25;
      CGRectGetMinX(v101);
    }
    else
    {
      IsRTL = CLKLayoutIsRTL();
      if (IsRTL)
        v30 = v21;
      else
        v30 = v25;
      if (IsRTL)
        v31 = v19;
      else
        v31 = v23;
      v71 = v30;
      v72 = v31;
      if (IsRTL)
        v32 = v17;
      else
        v32 = v27;
      v73 = v32;
      CLKLayoutIsRTL();
      v96.origin.x = v5;
      v96.origin.y = v74;
      v96.size.height = v75;
      v96.size.width = v9;
      MinX = CGRectGetMinX(v96);
      CLKFloorForDevice();
      v97.origin.x = MinX + v34;
      v97.origin.y = v73;
      v97.size.width = v72;
      v97.size.height = v71;
      CGRectGetMaxX(v97);
      CLKLayoutIsRTL();
      CLKLayoutIsRTL();
    }
    -[NTKUtilityComplicationView device](self, "device");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    CLKPixelAlignRectForDevice();
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;

    imageView = self->_imageView;
    -[NTKUtilityComplicationView device](self, "device");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    CLKPixelAlignRectForDevice();
    -[CDComplicationImageView setFrame:](imageView, "setFrame:");
  }
  else
  {
    v35 = -[NTKUtilityComplicationView placement](self, "placement");
    curvedLabel = self->_curvedLabel;
    if (curvedLabel)
    {
      -[CLKUICurvedColoringLabel path](curvedLabel, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[NTKUtilityFlatComplicationView bounds](self, "bounds");
      }
      else if (-[NTKUtilityComplicationView isPlacementForTopBezelComplication](self, "isPlacementForTopBezelComplication"))
      {
        v76 = 0;
        v77 = 0;
        -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", &v76, 0, 0);
        -[NTKUtilityFlatComplicationView bounds](self, "bounds");
        CGRectGetMidX(v102);
        v103.origin.x = v15;
        v103.origin.y = v17;
        v103.size.width = v19;
        v103.size.height = v21;
        CGRectGetWidth(v103);
        -[CLKUICurvedColoringLabel bounds](self->_curvedLabel, "bounds");
        CGRectGetMidX(v104);
        -[NTKUtilityComplicationView device](self, "device");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        CLKPointRoundForDevice();

      }
      else
      {
        objc_msgSend(v3, "screenBounds");
        v60 = v56;
        v61 = v57;
        v62 = v58;
        v63 = v59;
        if ((v35 & 1) != 0)
        {
          if ((v35 & 8) != 0)
          {
            CGRectGetWidth(*(CGRect *)&v56);
            CLKUICurvedColoringLabelCornerSize();
          }
        }
        else if ((v35 & 4) != 0)
        {
          if ((v35 & 0xA) != 0)
            CLKUICurvedColoringLabelCornerSize();
          else
            CLKUICurvedColoringLabelCenterSize();
          v105.origin.x = v60;
          v105.origin.y = v61;
          v105.size.width = v62;
          v105.size.height = v63;
          CGRectGetHeight(v105);
          if ((v35 & 8) != 0)
          {
            v107.origin.x = v60;
            v107.origin.y = v61;
            v107.size.width = v62;
            v107.size.height = v63;
            CGRectGetWidth(v107);
            CLKUICurvedColoringLabelCornerSize();
          }
          else if ((v35 & 2) == 0)
          {
            v106.origin.x = v60;
            v106.origin.y = v61;
            v106.size.width = v62;
            v106.size.height = v63;
            CGRectGetWidth(v106);
            CLKUICurvedColoringLabelCenterSize();
          }
        }
        v76 = 0;
        v77 = 0;
        -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", &v76, 0, 0);
        -[NTKUtilityComplicationView placement](self, "placement");
        v108.origin.x = v60;
        v108.origin.y = v61;
        v108.size.width = v62;
        v108.size.height = v63;
        CGRectGetMaxY(v108);
        -[CLKUICurvedColoringLabel circleRadius](self->_curvedLabel, "circleRadius");
        v109.origin.x = v60;
        v109.origin.y = v61;
        v109.size.width = v62;
        v109.size.height = v63;
        CGRectGetMidX(v109);
      }
    }
    else
    {
      v38 = v5;
      v39 = v7;
      if ((v35 & 2) != 0)
      {
        v54 = v9;
        v55 = v11;
        CGRectGetMinX(*(CGRect *)&v38);
      }
      else
      {
        v40 = v9;
        v41 = v11;
        if ((v35 & 8) != 0)
        {
          CGRectGetMaxX(*(CGRect *)&v38);
        }
        else
        {
          CGRectGetMinX(*(CGRect *)&v38);
          CLKFloorForDevice();
        }
      }
    }
    -[NTKUtilityComplicationView device](self, "device");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    CLKPixelAlignRectForDevice();
    v44 = v64;
    v46 = v65;
    v48 = v66;
    v50 = v67;
  }

  -[CLKUIColoringLabel setFrame:](self->_activeLabel, "setFrame:", v44, v46, v48, v50);
  if (self->_curvedLabel)
  {
    -[UIImageView image](self->_curvedHighlightView, "image");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
    {
      -[NTKUtilityFlatComplicationView _backgroundPlatterImage](self, "_backgroundPlatterImage");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_curvedHighlightView, "setImage:", v69);

    }
    -[UIImageView sizeToFit](self->_curvedHighlightView, "sizeToFit");
    -[UIImageView frame](self->_curvedHighlightView, "frame");
    -[NTKUtilityComplicationView device](self, "device");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_curvedHighlightView, "setFrame:");

  }
  -[NTKUtilityFlatComplicationView updateTextWidthIfNeeded](self, "updateTextWidthIfNeeded");

}

- (id)_backgroundPlatterImage
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  _OWORD v25[18];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  if (self->_curvedLabel)
  {
    -[NTKUtilityFlatComplicationView bounds](self, "bounds");
    if (CGRectIsEmpty(v31))
      return 0;
    -[CLKUICurvedColoringLabel bounds](self->_curvedLabel, "bounds");
    if (CGRectIsEmpty(v32))
      return 0;
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    memset(v25, 0, sizeof(v25));
    -[NTKUtilityComplicationView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v5, v25);

    -[CLKUICurvedColoringLabel path](self->_curvedLabel, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (!v6)
    {
      v7 = -[CLKUICurvedColoringLabel interior](self->_curvedLabel, "interior");
      -[CLKUICurvedColoringLabel circleRadius](self->_curvedLabel, "circleRadius");
      v23 = 0.0;
      v24 = 0.0;
      v21 = 0;
      v22 = 0;
      -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", &v23, &v22, &v21);
      -[CLKUICurvedColoringLabel bounds](self->_curvedLabel, "bounds");
      v8 = *(double *)&v26;
      v34 = CGRectInset(v33, -*(double *)&v26, -*(double *)&v26);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      v13 = CGRectGetWidth(v34);
      -[CLKUICurvedColoringLabel bounds](self->_curvedLabel, "bounds");
      v23 = v23 + (v13 - CGRectGetWidth(v35)) * 0.5;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v14 = CGRectGetHeight(v36);
      -[CLKUICurvedColoringLabel bounds](self->_curvedLabel, "bounds");
      v24 = v24 + (v14 - CGRectGetHeight(v37)) * 0.5;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v7 ^ 1u, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineWidth:", v8);
      objc_msgSend(v15, "setLineCapStyle:", 1);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__NTKUtilityFlatComplicationView__backgroundPlatterImage__block_invoke;
      v19[3] = &unk_1E6BD2F50;
      v20 = v15;
      v17 = v15;
      objc_msgSend(v16, "imageWithActions:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageWithRenderingMode:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKUtilityFlatComplicationView;
    -[NTKUtilityComplicationView _backgroundPlatterImage](&v30, sel__backgroundPlatterImage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t __57__NTKUtilityFlatComplicationView__backgroundPlatterImage__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  return objc_msgSend(*(id *)(a1 + 32), "stroke");
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_imageView);

}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);

  v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4[2](v4, self->_imageView);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUICurvedColoringLabel transitionToMonochromeWithFraction:style:](self->_curvedLabel, "transitionToMonochromeWithFraction:style:", 1, a3);
}

- (void)updateMonochromeColor
{
  -[CLKUICurvedColoringLabel updateMonochromeColorWithStyle:](self->_curvedLabel, "updateMonochromeColorWithStyle:", 1);
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKUtilityFlatComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (double)textWidthInRadians
{
  return self->_textWidthInRadians;
}

- (NTKUtilityFlatComplicationViewDelegate)delegate
{
  return (NTKUtilityFlatComplicationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (double)tracking
{
  return self->_tracking;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_activeLabel, 0);
  objc_storeStrong((id *)&self->_curvedHighlightView, 0);
  objc_storeStrong((id *)&self->_curvedLabel, 0);
}

@end
