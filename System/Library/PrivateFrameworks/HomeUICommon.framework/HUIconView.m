@implementation HUIconView

- (void)setVibrancyEffect:(id)a3
{
  -[HUIconView setVibrancyEffect:animated:](self, "setVibrancyEffect:animated:", a3, 0);
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void)setVibrancyEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((-[UIVisualEffect isEqual:](self->_vibrancyEffect, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyEffect, a3);
    -[HUIconView _updateVisualEffectStateForVibrancyEffectChange:animated:](self, "_updateVisualEffectStateForVibrancyEffectChange:animated:", 1, v4);
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[5];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUIconView;
  -[HUIconView layoutSubviews](&v22, sel_layoutSubviews);
  -[HUIconView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUIconView effectView](self, "effectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __28__HUIconView_layoutSubviews__block_invoke;
  v21[3] = &unk_250F49D38;
  v21[4] = self;
  __28__HUIconView_layoutSubviews__block_invoke((uint64_t)v21);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v5 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  -[HUIconView vibrancyEffect](self, "vibrancyEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVibrancyEffect:", v7);

  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wantsManagedVibrancyEffect");

  v11 = -[HUIconView displayStyle](self, "displayStyle");
  -[HUIconView effectView](self, "effectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v29 = v11 == 2;
  if (v11 == 2 && v10)
  {
    objc_msgSend(v12, "effect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 || v5)
    {
      if (v4)
      {
        v15 = (void *)MEMORY[0x24BDF6F90];
        -[HUIconView vibrancyEffectAnimationDuration](self, "vibrancyEffectAnimationDuration");
        v17 = v16;
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke;
        v37[3] = &unk_250F49D60;
        v37[4] = self;
        v38 = v7;
        objc_msgSend(v15, "animateWithDuration:animations:", v37, v17);

      }
      else
      {
        -[HUIconView effectView](self, "effectView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEffect:", v7);

      }
    }
  }
  else
  {
    objc_msgSend(v12, "setEffect:", 0);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedVisualEffectViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    if (v11 == 2)
      v24 = v7;
    else
      v24 = 0;
    v25 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v4)
        {
          v28 = (void *)MEMORY[0x24BDF6F90];
          v30[0] = v25;
          v30[1] = 3221225472;
          v30[2] = __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke_2;
          v30[3] = &unk_250F49D88;
          v30[4] = v27;
          v32 = v29;
          v31 = v7;
          objc_msgSend(v28, "animateWithDuration:animations:", v30, 0.25);

        }
        else
        {
          objc_msgSend(v27, "setEffect:", v24);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v22);
  }

}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UIVisualEffect)vibrancyEffect
{
  UIVisualEffect *vibrancyEffect;

  vibrancyEffect = self->_vibrancyEffect;
  if (vibrancyEffect)
    return vibrancyEffect;
  -[HUIconView _defaultVibrancyEffect](self, "_defaultVibrancyEffect");
  return (UIVisualEffect *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (id)_defaultVibrancyEffect
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F88], "_effectForBlurEffect:vibrancyStyle:", v2, 110);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  unint64_t displayStyle;
  id v43;

  v5 = a5;
  v43 = a3;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v8, "setHidden:", 0);

    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();

    v11 = +[HUIconContentView iconContentViewClassForIconDescriptor:](HUIconContentView, "iconContentViewClassForIconDescriptor:", v43);
    if ((objc_class *)v10 != v11)
    {
      -[HUIconView currentIconContentView](self, "currentIconContentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[HUIconView currentIconContentView](self, "currentIconContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[HUIconContentViewReuseQueue globalReuseQueueForContentViewClass:](HUIconContentViewReuseQueue, "globalReuseQueueForContentViewClass:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reapContentView:", v15);

      }
      if (v11)
      {
        +[HUIconContentViewReuseQueue globalReuseQueueForContentViewClass:](HUIconContentViewReuseQueue, "globalReuseQueueForContentViewClass:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dequeueContentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUIconView setCurrentIconContentView:](self, "setCurrentIconContentView:", v17);

        -[HUIconView bounds](self, "bounds");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setDelegate:", self);

        v28 = -[HUIconView displayContext](self, "displayContext");
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDisplayContext:", v28);

        v30 = -[HUIconView disableContinuousAnimation](self, "disableContinuousAnimation");
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setDisableContinuousAnimation:", v30);

        v32 = -[HUIconView iconSize](self, "iconSize");
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setIconSize:", v32);

        -[HUIconView contentContainerView](self, "contentContainerView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUIconView currentIconContentView](self, "currentIconContentView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addSubview:", v35);

        -[HUIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
        -[HUIconView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[HUIconView setCurrentIconContentView:](self, "setCurrentIconContentView:", 0);
      }
    }
    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "updateWithIconDescriptor:displayStyle:animated:", v43, a4, v5);

    objc_opt_class();
    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
    v8 = v38;

    if (v8)
      objc_msgSend(v8, "setIconContentMode:", -[HUIconView contentMode](self, "contentMode"));
    objc_opt_class();
    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v41 = v40;

    objc_msgSend(v41, "setUseAssetMarginSize:", -[HUIconView useIntrinsicContentSizeFromAsset](self, "useIntrinsicContentSizeFromAsset") ^ 1);
    displayStyle = self->_displayStyle;
    self->_displayStyle = a4;
    if ((objc_class *)v10 != v11 || displayStyle != a4)
      -[HUIconView _updateVisualEffectStateForVibrancyEffectChange:](self, "_updateVisualEffectStateForVibrancyEffectChange:", 0);
    -[HUIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUIconView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v8, "setHidden:", 1);
  }

}

- (HUIconContentView)currentIconContentView
{
  return self->_currentIconContentView;
}

- (BOOL)useIntrinsicContentSizeFromAsset
{
  return self->_useIntrinsicContentSizeFromAsset;
}

uint64_t __28__HUIconView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGAffineTransform v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGRect v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "sizeThatFits:", v3, v4);
  v6 = v5;
  v8 = v7;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v14.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v14.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
  memset(&v10, 0, sizeof(v10));
  v14.size.width = v6;
  v14.size.height = v8;
  CGRectApplyAffineTransform(v14, &v10);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return UIRectCenteredIntegralRect();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  -[HUIconView currentIconContentView](self, "currentIconContentView", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aspectRatio");
    v8 = v7;

  }
  else
  {
    v8 = 1.0;
  }

  v9 = height * v8;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = HUDefaultSizeForIconSize(-[HUIconView iconSize](self, "iconSize"));
  v5 = v4;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_256DC7D20))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8 && -[HUIconView useIntrinsicContentSizeFromAsset](self, "useIntrinsicContentSizeFromAsset"))
  {
    objc_msgSend(v8, "iconContentIntrinsicContentSize");
    v3 = v9;
    v5 = v10;
  }
  -[HUIconView sizeThatFits:](self, "sizeThatFits:", v3, v5);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setCurrentIconContentView:(id)a3
{
  objc_storeStrong((id *)&self->_currentIconContentView, a3);
}

- (unint64_t)displayContext
{
  return self->_displayContext;
}

- (BOOL)disableContinuousAnimation
{
  return self->_disableContinuousAnimation;
}

- (id)contentContainerView
{
  void *v2;
  void *v3;

  -[HUIconView effectView](self, "effectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateVisualEffectStateForVibrancyEffectChange:(BOOL)a3
{
  -[HUIconView _updateVisualEffectStateForVibrancyEffectChange:animated:](self, "_updateVisualEffectStateForVibrancyEffectChange:animated:", a3, 0);
}

- (void)setIconSize:(unint64_t)a3
{
  void *v5;

  if (self->_iconSize != a3)
  {
    self->_iconSize = a3;
    -[HUIconView currentIconContentView](self, "currentIconContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIconSize:", a3);

    -[HUIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (HUIconView)initWithFrame:(CGRect)a3 contentMode:(int64_t)a4
{
  HUIconView *v5;
  uint64_t v6;
  UIVisualEffectView *effectView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUIconView;
  v5 = -[HUIconView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", 0);
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView contentView](v5->_effectView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 0);

    -[HUIconView addSubview:](v5, "addSubview:", v5->_effectView);
    v5->_contentMode = a4;
    v5->_vibrancyEffectAnimationDuration = 0.25;
  }
  return v5;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setUseIntrinsicContentSizeFromAsset:(BOOL)a3
{
  self->_useIntrinsicContentSizeFromAsset = a3;
}

- (HUIconView)initWithFrame:(CGRect)a3
{
  return -[HUIconView initWithFrame:contentMode:](self, "initWithFrame:contentMode:", 4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renounceIconIfPossible
{
  id v2;

  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renounceIconIfPossible");

}

- (void)reclaimIconIfPossible
{
  id v2;

  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reclaimIconIfPossible");

}

void __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", v1);

}

uint64_t __71__HUIconView__updateVisualEffectStateForVibrancyEffectChange_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = *(_QWORD *)(a1 + 40);
  else
    v1 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setEffect:", v1);
}

- (void)setDisplayContext:(unint64_t)a3
{
  unint64_t displayContext;
  void *v6;

  displayContext = self->_displayContext;
  self->_displayContext = a3;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayContext:", a3);

  if (displayContext != a3 && !self->_vibrancyEffect)
    -[HUIconView _updateVisualEffectStateForVibrancyEffectChange:](self, "_updateVisualEffectStateForVibrancyEffectChange:", 1);
}

- (HFIconDescriptor)iconDescriptor
{
  void *v2;
  void *v3;

  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFIconDescriptor *)v3;
}

- (void)setDisableContinuousAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disableContinuousAnimation = a3;
  -[HUIconView currentIconContentView](self, "currentIconContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableContinuousAnimation:", v3);

}

- (double)vibrancyEffectAnimationDuration
{
  return self->_vibrancyEffectAnimationDuration;
}

- (void)setVibrancyEffectAnimationDuration:(double)a3
{
  self->_vibrancyEffectAnimationDuration = a3;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIconContentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
}

@end
