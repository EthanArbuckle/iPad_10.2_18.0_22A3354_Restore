@implementation HUIconContentView

- (void)_updateOverrideRenderingModeForSubviewsOfView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  int64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          v11 = -[HUIconContentView renderingModeForSubview:suggestedRenderingMode:](self, "renderingModeForSubview:suggestedRenderingMode:", v10, -[HUIconContentView renderingMode](self, "renderingMode"));
          objc_msgSend(v10, "image");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "imageWithRenderingMode:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setImage:", v13);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          v12 = v9;
          objc_msgSend(v12, "_setTextColorFollowsTintColor:", -[HUIconContentView renderingMode](self, "renderingMode") == 2);
        }

LABEL_11:
        -[HUIconContentView _updateOverrideRenderingModeForSubviewsOfView:](self, "_updateOverrideRenderingModeForSubviewsOfView:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (BOOL)wantsManagedVibrancyEffect
{
  return 1;
}

- (void)setVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyEffect, a3);
}

- (id)managedVisualEffectViews
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (Class)iconContentViewClassForIconDescriptor:(id)a3
{
  id v3;
  objc_class *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE4D098], "isHomeUIService");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && v3)
          NSLog(CFSTR("No icon view class for icon descriptor: %@"), v3);
      }
    }
  }
  v4 = (objc_class *)(id)objc_opt_class();

  return v4;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  id v7;
  int v8;
  int v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v7 = a3;
  -[HUIconContentView setIconDescriptor:](self, "setIconDescriptor:", v7);
  -[HUIconContentView setDisplayStyle:](self, "setDisplayStyle:", a4);
  if (-[HUIconContentView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1
    && -[HUIconContentView shouldFlipForRTL](self, "shouldFlipForRTL"))
  {
    v8 = objc_msgSend(v7, "shouldForceLTR") ^ 1;
  }
  else
  {
    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "isSystemImage");
    v10 = -1.0;
    if ((v8 & ~v9 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = -1.0;
  if ((v8 & 1) == 0)
LABEL_9:
    v10 = 1.0;
LABEL_10:
  CGAffineTransformMakeScale(&v12, v10, 1.0);
  v11 = v12;
  -[HUIconContentView setTransform:](self, "setTransform:", &v11);

}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
  -[HUIconContentView _updateOverrideRenderingModeForSubviewsOfView:](self, "_updateOverrideRenderingModeForSubviewsOfView:", self);
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
  -[HUIconContentView setRenderingMode:](self, "setRenderingMode:", 2 * (a3 != 1));
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setDisplayContext:(unint64_t)a3
{
  self->_displayContext = a3;
}

- (void)setDisableContinuousAnimation:(BOOL)a3
{
  self->_disableContinuousAnimation = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (HUIconContentView)initWithFrame:(CGRect)a3
{
  HUIconContentView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUIconContentView;
  result = -[HUIconContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_aspectRatio = 1.0;
  return result;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4
{
  return a4;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setAspectRatio:(double)a3
{
  void *v4;

  if (vabdd_f64(a3, self->_aspectRatio) > 0.00000011920929)
  {
    self->_aspectRatio = a3;
    -[HUIconContentView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconContentView:didChangeAspectRatio:", self, self->_aspectRatio);

    -[HUIconContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (HUIconContentViewDelegate)delegate
{
  return (HUIconContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldFlipForRTL
{
  return 1;
}

- (void)invalidateRenderingMode
{
  -[HUIconContentView _updateOverrideRenderingModeForSubviewsOfView:](self, "_updateOverrideRenderingModeForSubviewsOfView:", self);
}

+ (id)iconImageNamed:(id)a3 withSize:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  return HUIconImageNamed(a3, a4, a5);
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (unint64_t)displayContext
{
  return self->_displayContext;
}

- (BOOL)disableContinuousAnimation
{
  return self->_disableContinuousAnimation;
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
}

@end
