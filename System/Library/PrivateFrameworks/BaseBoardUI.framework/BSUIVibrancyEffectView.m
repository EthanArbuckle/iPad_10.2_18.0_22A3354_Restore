@implementation BSUIVibrancyEffectView

- (BSUIVibrancyEffectView)initWithFrame:(CGRect)a3
{
  BSUIVibrancyEffectView *v3;
  BSUIVibrancyEffectView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *contentView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BSUIVibrancyEffectView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BSUIVibrancyEffectView bounds](v3, "bounds");
    v4->_isEnabled = 1;
    v4->_blurEnabled = 1;
    v4->_contentType = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v9;

    -[BSUIVibrancyEffectView addSubview:](v4, "addSubview:", v4->_contentView);
    -[BSUIVibrancyEffectView invalidateSubviews](v4, "invalidateSubviews");
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BSUIVibrancyEffectView;
  -[BSUIVibrancyEffectView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyEffectView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
    v9 = v5;
  else
    v9 = 0;

  return v9;
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    -[BSUIVibrancyEffectView invalidateSubviews](self, "invalidateSubviews");
    -[BSUIVibrancyView _invalidateFilters](self, "_invalidateFilters");
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    -[BSUIVibrancyView _invalidateFilters](self, "_invalidateFilters");
  }
}

- (void)setCaptureOnly:(BOOL)a3
{
  if (self->_captureOnly != a3)
  {
    self->_captureOnly = a3;
    -[BSUIVibrancyEffectView invalidateSubviews](self, "invalidateSubviews");
  }
}

- (void)setContentType:(unint64_t)a3
{
  if (self->_contentType != a3)
  {
    self->_contentType = a3;
    -[BSUIVibrancyView _invalidateFilters](self, "_invalidateFilters");
  }
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  -[BSUIVibrancyEffectView _updateSubviewsIfNeeded](self, "_updateSubviewsIfNeeded");
  v24.receiver = self;
  v24.super_class = (Class)BSUIVibrancyEffectView;
  -[BSUIVibrancyView layoutSubviews](&v24, sel_layoutSubviews);
  -[BSUIVibrancyEffectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BSUIVibrancyEffectView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[BSUIVibrancyEffectView materialBackdropView](self, "materialBackdropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[BSUIVibrancyEffectView vibrancyView](self, "vibrancyView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[BSUIVibrancyEffectView materialBackdropView](self, "materialBackdropView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[BSUIVibrancyEffectView maskView](self, "maskView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

}

- (void)invalidateSubviews
{
  self->_needsUpdate.subviews = 1;
  -[BSUIVibrancyEffectView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateFilters
{
  void *v3;
  BSUIVibrancyEffectValues *v4;
  BSUIVibrancyEffectValues *values;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BSUIVibrancyEffectValues *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BSUIVibrancyEffectValues *v24;
  uint64_t v25;
  unsigned int v26;
  float v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BSUIVibrancyEffectValues *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _OWORD v44[5];
  _OWORD v45[5];
  _OWORD v46[5];
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  __int128 v50;

  -[BSUIVibrancyView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectValues");
  v4 = (BSUIVibrancyEffectValues *)objc_claimAutoreleasedReturnValue();
  values = self->_values;
  self->_values = v4;

  v6 = -[BSUIVibrancyEffectView isBlurEnabled](self, "isBlurEnabled");
  v7 = -[BSUIVibrancyEffectView contentType](self, "contentType");
  v8 = objc_msgSend(v3, "effectType");
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8 != 3)
  {
    if (!v6)
    {
      v41 = 0;
      v25 = 1;
      v26 = 1050253722;
      v27 = *(float *)"333?";
      goto LABEL_13;
    }
    v15 = *MEMORY[0x1E0CD2BF0];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v48 = 0u;
    memset(v49, 0, sizeof(v49));
    v47 = 0u;
    v17 = self->_values;
    if (v17)
      -[BSUIVibrancyEffectValues backdropColorMatrix](v17, "backdropColorMatrix");
    objc_msgSend(v16, "setName:", CFSTR("color"));
    v46[2] = v49[0];
    v46[3] = v49[1];
    v46[4] = v50;
    v46[0] = v47;
    v46[1] = v48;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CD2D20];
    objc_msgSend(v16, "setValue:forKey:", v18, *MEMORY[0x1E0CD2D20]);

    objc_msgSend(v42, "addObject:", v16);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setName:", CFSTR("blur"));
    objc_msgSend(v20, "setValue:forKey:", &unk_1E434EE90, *MEMORY[0x1E0CD2D90]);
    objc_msgSend(v20, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
    objc_msgSend(v42, "addObject:", v20);
    -[BSUIVibrancyEffectValues groupName](self->_values, "groupName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v41;
      objc_msgSend(v21, "setName:", CFSTR("vibrantColor"));
      v23 = (void *)MEMORY[0x1E0CB3B18];
      v24 = self->_values;
      if (v24)
        -[BSUIVibrancyEffectValues vibrantColorMatrix](v24, "vibrantColorMatrix");
      else
        memset(v45, 0, sizeof(v45));
      objc_msgSend(v23, "valueWithCAColorMatrix:", v45);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setValue:forKey:", v34, v19);

      objc_msgSend(v42, "insertObject:atIndex:", v21, 0);
      objc_msgSend(v41, "stringByAppendingString:", CFSTR("-withVibrancy"));
      v25 = 0;
      v30 = 1;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_11:
    v25 = 0;
    v26 = 0;
    v27 = 1.0;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setName:", CFSTR("colorToAlphaMask"));
    v48 = 0u;
    memset(v49, 0, 28);
    v47 = 0u;
    *((float *)&v49[1] + 3) = v27;
    *(_QWORD *)&v50 = 0;
    *((_QWORD *)&v50 + 1) = v26;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v47);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CD2D20];
    objc_msgSend(v21, "setValue:forKey:", v28, *MEMORY[0x1E0CD2D20]);

    objc_msgSend(v21, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D80]);
    objc_msgSend(v43, "addObject:", v21);
    if (v8 == 3)
    {
      v30 = 0;
LABEL_22:

      v10 = v41;
      -[BSUIVibrancyBackdropView backdropLayer](self->_materialBackdropView, "backdropLayer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setGroupName:", v41);

      -[BSUIVibrancyBackdropView setHidden:](self->_materialBackdropView, "setHidden:", v25);
      -[UIView setHidden:](self->_vibrancyView, "setHidden:", v30);
      -[UIView layer](self->_vibrancyView, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v8 == 3)
        v38 = *MEMORY[0x1E0CD2C48];
      else
        v38 = 0;
      objc_msgSend(v36, "setCompositingFilter:", v38);

      -[BSUIVibrancyBackdropView layer](self->_materialBackdropView, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _setLayerFilters(v39, v42);

      -[UIView layer](self->_vibrancyView, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _setLayerFilters(v40, v43);

      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setName:", CFSTR("vibrantColor"));
    v31 = (void *)MEMORY[0x1E0CB3B18];
    v32 = self->_values;
    if (v32)
      -[BSUIVibrancyEffectValues vibrantColorMatrix](v32, "vibrantColorMatrix");
    else
      memset(v44, 0, sizeof(v44));
    objc_msgSend(v31, "valueWithCAColorMatrix:", v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v33, v29);

    objc_msgSend(v43, "addObject:", v22);
    v30 = 0;
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v3, "alternativeVibrancyEffectLUT");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "resolvedLUTFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v42, "addObject:", v11);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "groupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v13, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_27:

}

- (void)_updateSubviewsIfNeeded
{
  if (self->_needsUpdate.subviews)
  {
    self->_needsUpdate.subviews = 0;
    -[BSUIVibrancyEffectView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)_updateSubviews
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BSUIVibrancyBackdropView *v12;
  BSUIVibrancyBackdropView *materialBackdropView;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *vibrancyView;
  double v18;
  UIView *v19;
  UIView *maskView;
  char v21;
  UIView *v22;
  BSUIVibrancyBackdropView *v23;
  BSUIVibrancyAnimatingPortalView *v24;
  id v25;

  if (-[BSUIVibrancyEffectView isEnabled](self, "isEnabled"))
    v3 = !+[BSUIVibrancyView isDisabled](BSUIVibrancyEffectView, "isDisabled");
  else
    v3 = 0;
  -[BSUIVibrancyView configuration](self, "configuration");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setAlpha:](self->_contentView, "setAlpha:", (double)(v3 ^ 1u));
  if ((v3 & 1) != 0)
  {
    -[BSUIVibrancyEffectView bounds](self, "bounds");
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (!self->_materialBackdropView)
    {
      v12 = -[BSUIVibrancyBackdropView initWithFrame:]([BSUIVibrancyBackdropView alloc], "initWithFrame:", v4, v5, v6, v7);
      materialBackdropView = self->_materialBackdropView;
      self->_materialBackdropView = v12;

      -[BSUIVibrancyBackdropView setUserInteractionEnabled:](self->_materialBackdropView, "setUserInteractionEnabled:", 0);
      -[BSUIVibrancyBackdropView backdropLayer](self->_materialBackdropView, "backdropLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUsesGlobalGroupNamespace:", 1);

      -[BSUIVibrancyEffectView addSubview:](self, "addSubview:", self->_materialBackdropView);
    }
    v15 = -[BSUIVibrancyEffectView isCaptureOnly](self, "isCaptureOnly");
    v16 = objc_msgSend(v25, "effectType");
    -[BSUIVibrancyBackdropView backdropLayer](self->_materialBackdropView, "backdropLayer");
    vibrancyView = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(vibrancyView, "setCaptureOnly:", v15);
    v18 = 0.1;
    if (v16 == 3)
      v18 = 1.0;
    objc_msgSend(vibrancyView, "setScale:", v18);
    if (!self->_maskView)
    {
      v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", self->_contentView);
      -[UIView setFrame:](v19, "setFrame:", v8, v9, v10, v11);
      maskView = self->_maskView;
      self->_maskView = v19;

    }
    v21 = v16 == 3 || v15;
    if ((v21 & 1) != 0)
      v22 = 0;
    else
      v22 = self->_maskView;
    -[BSUIVibrancyBackdropView setMaskView:](self->_materialBackdropView, "setMaskView:", v22);
    if (!self->_vibrancyView)
    {
      v24 = -[_UIPortalView initWithSourceView:]([BSUIVibrancyAnimatingPortalView alloc], "initWithSourceView:", self->_contentView);
      -[_UIPortalView setFrame:](v24, "setFrame:", v8, v9, v10, v11);
      -[_UIPortalView setAllowsHitTesting:](v24, "setAllowsHitTesting:", 1);
      objc_storeStrong((id *)&self->_vibrancyView, v24);
      -[BSUIVibrancyEffectView addSubview:](self, "addSubview:", self->_vibrancyView);

    }
  }
  else
  {
    -[BSUIVibrancyBackdropView removeFromSuperview](self->_materialBackdropView, "removeFromSuperview");
    v23 = self->_materialBackdropView;
    self->_materialBackdropView = 0;

    -[UIView removeFromSuperview](self->_vibrancyView, "removeFromSuperview");
    vibrancyView = self->_vibrancyView;
    self->_vibrancyView = 0;
  }

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (BOOL)isCaptureOnly
{
  return self->_captureOnly;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BSUIVibrancyBackdropView)materialBackdropView
{
  return self->_materialBackdropView;
}

- (UIView)maskView
{
  return self->_maskView;
}

- (UIView)vibrancyView
{
  return self->_vibrancyView;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_materialBackdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
