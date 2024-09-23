@implementation HULayeredVisualEffectView

- (HULayeredVisualEffectView)initWithFrame:(CGRect)a3
{
  HULayeredVisualEffectView *v3;
  id v4;
  uint64_t v5;
  UIVisualEffectView *contentEffectView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HULayeredVisualEffectView;
  v3 = -[HULayeredVisualEffectView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    -[HULayeredVisualEffectView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    contentEffectView = v3->_contentEffectView;
    v3->_contentEffectView = (UIVisualEffectView *)v5;

    -[UIVisualEffectView setAutoresizingMask:](v3->_contentEffectView, "setAutoresizingMask:", 18);
    -[HULayeredVisualEffectView addSubview:](v3, "addSubview:", v3->_contentEffectView);
    v3->_contentEffectAlpha = 1.0;
    v3->_backgroundEffectAlpha = 1.0;
    -[HULayeredVisualEffectView _updateContentEffects](v3, "_updateContentEffects");
    -[HULayeredVisualEffectView _updateBackgroundEffects](v3, "_updateBackgroundEffects");
  }
  return v3;
}

- (HULayeredVisualEffectView)initWithContentEffect:(id)a3 backgroundEffect:(id)a4
{
  id v7;
  id v8;
  HULayeredVisualEffectView *v9;
  HULayeredVisualEffectView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HULayeredVisualEffectView;
  v9 = -[HULayeredVisualEffectView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentEffect, a3);
    objc_storeStrong((id *)&v10->_backgroundEffect, a4);
    v10->_contentEffectAlpha = 1.0;
    v10->_backgroundEffectAlpha = 1.0;
    -[HULayeredVisualEffectView _updateContentEffects](v10, "_updateContentEffects");
    -[HULayeredVisualEffectView _updateBackgroundEffects](v10, "_updateBackgroundEffects");
  }

  return v10;
}

- (void)setContentEffect:(id)a3
{
  HULayeredContentEffect *v5;
  HULayeredContentEffect *v6;

  v5 = (HULayeredContentEffect *)a3;
  if (self->_contentEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentEffect, a3);
    -[HULayeredVisualEffectView _updateContentEffects](self, "_updateContentEffects");
    v5 = v6;
  }

}

- (void)setBackgroundEffect:(id)a3
{
  HULayeredBackgroundEffect *v5;
  HULayeredBackgroundEffect *v6;

  v5 = (HULayeredBackgroundEffect *)a3;
  if (self->_backgroundEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundEffect, a3);
    -[HULayeredVisualEffectView _updateBackgroundEffects](self, "_updateBackgroundEffects");
    v5 = v6;
  }

}

- (UIView)contentView
{
  void *v2;
  void *v3;

  -[HULayeredVisualEffectView contentEffectView](self, "contentEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HULayeredVisualEffectView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[HULayeredVisualEffectView _applyCornerRadius](self, "_applyCornerRadius");
  }
}

- (void)setContentEffectAlpha:(double)a3
{
  if (self->_contentEffectAlpha != a3)
  {
    self->_contentEffectAlpha = a3;
    -[HULayeredVisualEffectView _updateContentEffects](self, "_updateContentEffects");
  }
}

- (void)setBackgroundEffectAlpha:(double)a3
{
  if (self->_backgroundEffectAlpha != a3)
  {
    self->_backgroundEffectAlpha = a3;
    -[HULayeredVisualEffectView _updateBackgroundEffects](self, "_updateBackgroundEffects");
  }
}

- (void)_updateContentEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[HULayeredVisualEffectView contentEffect](self, "contentEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vibrancyEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULayeredVisualEffectView contentEffectView](self, "contentEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffect:", v4);

  -[HULayeredVisualEffectView contentEffect](self, "contentEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULayeredVisualEffectView contentEffectView](self, "contentEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  -[HULayeredVisualEffectView contentEffectAlpha](self, "contentEffectAlpha");
  v10 = v9;
  -[HULayeredVisualEffectView contentEffectView](self, "contentEffectView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v10);

}

- (void)_updateBackgroundEffects
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;

  -[HULayeredVisualEffectView backgroundEffect](self, "backgroundEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blurEffect");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
    v7 = objc_alloc(MEMORY[0x1E0CEABE8]);
    -[HULayeredVisualEffectView bounds](self, "bounds");
    v8 = (void *)objc_msgSend(v7, "initWithFrame:");
    -[HULayeredVisualEffectView setBackgroundEffectView:](self, "setBackgroundEffectView:", v8);

    -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULayeredVisualEffectView insertSubview:atIndex:](self, "insertSubview:atIndex:", v3, 0);
  }

LABEL_5:
  -[HULayeredVisualEffectView backgroundEffect](self, "backgroundEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blurEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEffect:", v11);

  -[HULayeredVisualEffectView backgroundEffect](self, "backgroundEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fillColor");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_9;
    v17 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HULayeredVisualEffectView bounds](self, "bounds");
    v18 = (void *)objc_msgSend(v17, "initWithFrame:");
    -[HULayeredVisualEffectView setBackgroundFillView:](self, "setBackgroundFillView:", v18);

    -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutoresizingMask:", 18);

    -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULayeredVisualEffectView insertSubview:atIndex:](self, "insertSubview:atIndex:", v13, 0);
  }

LABEL_9:
  -[HULayeredVisualEffectView backgroundEffect](self, "backgroundEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fillColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  -[HULayeredVisualEffectView backgroundEffect](self, "backgroundEffect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fillColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    v25 = 1.0;
  else
    v25 = 0.0;
  -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAlpha:", v25);

  -[HULayeredVisualEffectView backgroundEffectAlpha](self, "backgroundEffectAlpha");
  v28 = v27;
  -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", v28);

  -[HULayeredVisualEffectView _updateSubviewOrder](self, "_updateSubviewOrder");
  -[HULayeredVisualEffectView _applyCornerRadius](self, "_applyCornerRadius");
}

- (void)_updateSubviewOrder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULayeredVisualEffectView sendSubviewToBack:](self, "sendSubviewToBack:", v4);

  }
  -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HULayeredVisualEffectView sendSubviewToBack:](self, "sendSubviewToBack:", v6);

  }
}

- (void)_applyCornerRadius
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[HULayeredVisualEffectView cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[HULayeredVisualEffectView backgroundEffectView](self, "backgroundEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCornerRadius:", v4);

  -[HULayeredVisualEffectView cornerRadius](self, "cornerRadius");
  v7 = v6;
  -[HULayeredVisualEffectView backgroundFillView](self, "backgroundFillView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setCornerRadius:", v7);

}

- (HULayeredContentEffect)contentEffect
{
  return self->_contentEffect;
}

- (HULayeredBackgroundEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (double)contentEffectAlpha
{
  return self->_contentEffectAlpha;
}

- (double)backgroundEffectAlpha
{
  return self->_backgroundEffectAlpha;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffectView)contentEffectView
{
  return self->_contentEffectView;
}

- (void)setContentEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_contentEffectView, a3);
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (UIView)backgroundFillView
{
  return self->_backgroundFillView;
}

- (void)setBackgroundFillView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFillView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundFillView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
  objc_storeStrong((id *)&self->_contentEffect, 0);
}

@end
