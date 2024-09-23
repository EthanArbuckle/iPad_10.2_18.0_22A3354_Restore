@implementation EKUIListViewCellBackground

- (EKUIListViewCellBackground)initWithCornerRadius:(double)a3
{
  EKUIListViewCellBackground *v4;
  EKUIListViewCellBackground *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKUIListViewCellBackground;
  v4 = -[EKUIListViewCellBackground init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cornerRadius = a3;
    -[EKUIListViewCellBackground layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewCellBackground _configureLayer:](v5, "_configureLayer:", v6);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIListViewCellBackground;
  -[EKUIListViewCellBackground layoutSubviews](&v4, sel_layoutSubviews);
  -[EKUIListViewCellBackground layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground _configureLayer:](self, "_configureLayer:", v3);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKUIListViewCellBackground;
  -[EKUIListViewCellBackground layoutSublayersOfLayer:](&v15, sel_layoutSublayersOfLayer_, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "sublayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_msgSend(v4, "bounds");
        objc_msgSend(v10, "setFrame:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

+ (BOOL)drawsBackgroundForEvent:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = a3;
  v4 = CUIKEventDisplaysAsNeedsReply();
  v5 = objc_msgSend(v3, "status");
  v6 = CUIKEventDisplaysAsTentative();

  if (v5 == 3)
    v7 = 0;
  else
    v7 = v4;
  return v7 | v6;
}

- (void)updateBackgroundColorForEvent:(id)a3 highlighted:(BOOL)a4 dimmed:(BOOL)a5 carplayMode:(BOOL)a6 dragPreview:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  EKUIListViewCellBackground *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v37 = a3;
  objc_msgSend(v37, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userInterfaceStyle");
  CUIKAdjustedColorForColor();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = v15;
  }
  else
  {
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  v18 = objc_msgSend(v37, "status");
  if (CUIKEventDisplaysAsNeedsReply() && v18 != 3)
  {
    if (v8)
    {
      v19 = v17;
      v20 = (void *)MEMORY[0x1E0DC3658];
      -[EKUIListViewCellBackground _carplayAngledStripeBackgroundForHighlighted:](self, "_carplayAngledStripeBackgroundForHighlighted:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "colorWithPatternImage:", v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0DC3658];
      v28 = (void *)objc_opt_class();
      -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_angledStripeBackground:", v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "colorWithPatternImage:", v29);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
    }

    v30 = self;
    v31 = v19;
    v32 = v22;
LABEL_17:
    -[EKUIListViewCellBackground _updateBackgroundWithSolidColor:stripedColor:highlighted:dimmed:carplayMode:](v30, "_updateBackgroundWithSolidColor:stripedColor:highlighted:dimmed:carplayMode:", v31, v32, v10, v9, v8);

    goto LABEL_22;
  }
  if (CUIKEventDisplaysAsTentative())
  {
    -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userInterfaceStyle");
    CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v24 = v17;

      v25 = (void *)MEMORY[0x1E0DC3658];
      -[EKUIListViewCellBackground _carplayAngledStripeBackgroundForHighlighted:](self, "_carplayAngledStripeBackgroundForHighlighted:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "colorWithPatternImage:", v26);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v24;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E0DC3658];
      v34 = (void *)objc_opt_class();
      -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_angledStripeBackground:", v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "colorWithPatternImage:", v35);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = self;
    v31 = v22;
    v32 = v19;
    goto LABEL_17;
  }
  if (v8)
  {
    v22 = v17;
  }
  else if (v7)
  {
    -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "userInterfaceStyle");
    CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  -[EKUIListViewCellBackground _updateBackgroundWithSolidColor:stripedColor:highlighted:dimmed:carplayMode:](self, "_updateBackgroundWithSolidColor:stripedColor:highlighted:dimmed:carplayMode:", v22, 0, v10, v9, v8);
LABEL_22:

}

- (void)_configureLayer:(id)a3
{
  double cornerRadius;
  double v5;
  id v6;

  v6 = a3;
  cornerRadius = self->_cornerRadius;
  if (cornerRadius == 0.0)
  {
    -[EKUIListViewCellBackground bounds](self, "bounds");
    cornerRadius = v5 * 0.5;
  }
  objc_msgSend(v6, "setCornerRadius:", cornerRadius);

}

- (void)_updateBackgroundWithSolidColor:(id)a3 stripedColor:(id)a4 highlighted:(BOOL)a5 dimmed:(BOOL)a6 carplayMode:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CATransform3D v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (v8)
  {
    v14 = *MEMORY[0x1E0D0CA68];
    objc_msgSend(v12, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cuik_colorWithAlphaScaled:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v16;
    v12 = (id)v15;
  }
  -[EKUIListViewCellBackground layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sublayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v24++), "removeFromSuperlayer");
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v22);
  }

  -[EKUIListViewCellBackground _backgroundViewFilterForHighlighted:carplayMode:](self, "_backgroundViewFilterForHighlighted:carplayMode:", v9, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground _backgroundViewFilterColorForHighlighted:carplayMode:](self, "_backgroundViewFilterColorForHighlighted:carplayMode:", v9, v7);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v25 && v26)
  {
    v28 = (void *)objc_opt_new();
    -[EKUIListViewCellBackground _configureLayer:](self, "_configureLayer:", v28);
    objc_msgSend(v28, "setCompositingFilter:", v25);
    objc_msgSend(v28, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v27), "CGColor"));
    -[EKUIListViewCellBackground layer](self, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v28);

  }
  -[EKUIListViewCellBackground setBackgroundColor:](self, "setBackgroundColor:", v12);
  if (v13)
  {
    v30 = (void *)objc_opt_new();
    -[EKUIListViewCellBackground _configureLayer:](self, "_configureLayer:", v30);
    objc_msgSend(v30, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v13), "CGColor"));
    CATransform3DMakeScale(&v32, 1.0, -1.0, 1.0);
    objc_msgSend(v30, "setTransform:", &v32);
    -[EKUIListViewCellBackground layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", v30);

  }
  -[EKUIListViewCellBackground setNeedsLayout](self, "setNeedsLayout");

}

- (id)_carplayAngledStripeBackgroundForHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("carplayNeedsReplyStripeColorHighlighted");
  else
    v5 = CFSTR("carplayNeedsReplyStripeColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  EKUIScaleFactor();
  CUIKCreateStripedUIImage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_angledStripeBackground:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (!_angledStripeBackground__imageCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_angledStripeBackground__imageCache;
    _angledStripeBackground__imageCache = v4;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), objc_msgSend(v3, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_angledStripeBackground__imageCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIScaleFactor();
    CUIKCreateStripedUIImage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_angledStripeBackground__imageCache, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (id)_backgroundViewFilterColorForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;

  v4 = 0;
  if (a3 && a4)
  {
    -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0.3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0.1;
    }
    objc_msgSend(v7, "colorWithAlphaComponent:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_backgroundViewFilterForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = 0;
  if (a3 && a4)
  {
    -[EKUIListViewCellBackground traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    v8 = (_QWORD *)MEMORY[0x1E0CD2E00];
    if (v7 == 1)
      v8 = (_QWORD *)MEMORY[0x1E0CD2DF8];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
