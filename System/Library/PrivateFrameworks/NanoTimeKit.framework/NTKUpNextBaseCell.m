@implementation NTKUpNextBaseCell

+ (void)clearLabel:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTextProvider:", 0);
  objc_msgSend(v3, "setText:", 0);

}

+ (CGSize)suggestedHeaderImageSizeForDevice:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend(a3, "sizeClass");
  v4 = 14.5;
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 4:
      v4 = 17.0;
      break;
    default:
      v4 = 19.0;
      break;
  }
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)cornerRadiusForDevice:(id)a3
{
  return _LayoutConstants_48(a3);
}

- (NTKUpNextBaseCell)initWithFrame:(CGRect)a3
{
  NTKUpNextBaseCell *v3;
  void *v4;
  uint64_t v5;
  CLKDevice *device;
  double v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  UIImageView *shadowView;
  void *v14;
  uint64_t v15;
  UIColor *imageColor;
  uint64_t v17;
  CALayer *imageLayer;
  CALayer *v19;
  id v20;
  uint64_t v21;
  UIView *overlayView;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSHashTable *layerProviders;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)NTKUpNextBaseCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v7 = _LayoutConstants_48(v3->_device);
    NTKImageNamed(CFSTR("platter_shadow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v7, 0.0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "size");
    v3->_shadowSize.width = v10;
    v3->_shadowSize.height = v11;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    shadowView = v3->_shadowView;
    v3->_shadowView = (UIImageView *)v12;

    -[UIImageView layer](v3->_shadowView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setZPosition:", -2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = objc_claimAutoreleasedReturnValue();
    imageColor = v3->_imageColor;
    v3->_imageColor = (UIColor *)v15;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v17 = objc_claimAutoreleasedReturnValue();
    imageLayer = v3->_imageLayer;
    v3->_imageLayer = (CALayer *)v17;

    -[CALayer setAllowsGroupBlending:](v3->_imageLayer, "setAllowsGroupBlending:", 0);
    v19 = v3->_imageLayer;
    -[CLKDevice screenScale](v3->_device, "screenScale");
    -[CALayer setContentsScale:](v19, "setContentsScale:");
    v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    overlayView = v3->_overlayView;
    v3->_overlayView = (UIView *)v21;

    v23 = v3->_overlayView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UIView layer](v3->_overlayView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setZPosition:", 1.0);

    v3->_darkeningAmount = 0.0;
    -[NTKUpNextBaseCell addSubview:](v3, "addSubview:", v3->_shadowView);
    -[NTKUpNextBaseCell contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", v27);

    -[NTKUpNextBaseCell contentView](v3, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v3->_overlayView);

    -[NTKUpNextBaseCell layer](v3, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v3->_imageLayer);

    -[CALayer setZPosition:](v3->_imageLayer, "setZPosition:", -1.0);
    v30 = *MEMORY[0x1E0CD2A68];
    -[CALayer setCornerCurve:](v3->_imageLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[CALayer setCornerRadius:](v3->_imageLayer, "setCornerRadius:", v7);
    -[CALayer setMasksToBounds:](v3->_imageLayer, "setMasksToBounds:", 1);
    -[UIView layer](v3->_overlayView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerCurve:", v30);

    -[UIView layer](v3->_overlayView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", v7);

    -[UIView layer](v3->_overlayView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v34 = objc_claimAutoreleasedReturnValue();
    layerProviders = v3->_layerProviders;
    v3->_layerProviders = (NSHashTable *)v34;

  }
  return v3;
}

- (void)addContentsLayerProvider:(id)a3
{
  -[NSHashTable addObject:](self->_layerProviders, "addObject:", a3);
}

- (void)removeContentsLayerProvider:(id)a3
{
  -[NSHashTable removeObject:](self->_layerProviders, "removeObject:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v5 = -[NTKUpNextBaseCell isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextBaseCell;
  -[NTKUpNextBaseCell setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
    {
      -[NTKUpNextBaseCell _updateColorOverlay](self, "_updateColorOverlay");
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __36__NTKUpNextBaseCell_setHighlighted___block_invoke;
      v6[3] = &unk_1E6BCD5F0;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
    }
  }
}

uint64_t __36__NTKUpNextBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateColorOverlay");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextBaseCell;
  -[NTKUpNextBaseCell prepareForReuse](&v4, sel_prepareForReuse);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextBaseCell setImageColor:](self, "setImageColor:", v3);

  -[NTKUpNextBaseCell setPaused:](self, "setPaused:", 0);
}

- (void)layoutSubviews
{
  double x;
  double width;
  double height;
  double MaxY;
  double v7;
  double v8;
  double v9;
  UIView *overlayView;
  CALayer *imageLayer;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextBaseCell;
  -[NTKUpNextBaseCell layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKUpNextBaseCell bounds](self, "bounds");
  x = v13.origin.x;
  width = v13.size.width;
  height = self->_shadowSize.height;
  MaxY = CGRectGetMaxY(v13);
  v7 = _LayoutConstants_48(self->_device);
  v9 = MaxY - v8;
  overlayView = self->_overlayView;
  -[NTKUpNextBaseCell bounds](self, "bounds", v7);
  -[UIView setFrame:](overlayView, "setFrame:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  imageLayer = self->_imageLayer;
  -[NTKUpNextBaseCell bounds](self, "bounds");
  -[CALayer setFrame:](imageLayer, "setFrame:");
  -[UIImageView setFrame:](self->_shadowView, "setFrame:", x, v9, width, height);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setImageColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *imageColor;
  _QWORD v7[5];

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((NTKEqualObjects(v4, self->_imageColor) & 1) == 0)
  {
    v5 = (UIColor *)objc_msgSend(v4, "copy");
    imageColor = self->_imageColor;
    self->_imageColor = v5;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__NTKUpNextBaseCell_setImageColor___block_invoke;
    v7[3] = &unk_1E6BCE010;
    v7[4] = self;
    -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", v7);
  }

}

void __35__NTKUpNextBaseCell_setImageColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 768);
  v3 = a2;
  objc_msgSend(v3, "setContentsMultiplyColor:", objc_msgSend(v2, "CGColor"));

}

- (void)setContentBrightness:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  UIColor *imageColor;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a4;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", a3, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", self->_contentBrightness, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");

    imageColor = self->_imageColor;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(imageColor) = -[UIColor isEqual:](imageColor, "isEqual:", v12);

    if ((imageColor & 1) == 0)
    {
      v24 = 0.0;
      v25 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      -[UIColor getHue:saturation:brightness:alpha:](self->_imageColor, "getHue:saturation:brightness:alpha:", &v25, &v24, &v23, &v22);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v25, v24, v23 * a3, v22);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v13, "CGColor");

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v25, v24, v23 * self->_contentBrightness, v22);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v14, "CGColor");

    }
    v15 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contentsMultiplyColor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setToValue:", v8);
      objc_msgSend(v16, "setFromValue:", v10);
      objc_msgSend(v16, "setDuration:", 0.5);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimingFunction:", v17);

      objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke;
      v20[3] = &unk_1E6BCE010;
      v21 = v16;
      v18 = v16;
      -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", v20);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke_2;
    v19[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
    v19[4] = v8;
    -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", v19);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    self->_contentBrightness = a3;
  }
}

uint64_t __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("brightnessBoost"));
}

uint64_t __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsMultiplyColor:", *(_QWORD *)(a1 + 32));
}

- (void)setContentImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  UIImage *v16;
  _QWORD v17[4];
  id v18;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_contentImage != v7)
  {
    if (!self->_overrideContentImage)
    {
      v8 = MEMORY[0x1E0C809B0];
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setToValue:", -[UIImage CGImage](objc_retainAutorelease(v7), "CGImage"));
        objc_msgSend(v9, "setFromValue:", -[UIImage CGImage](self->_contentImage, "CGImage"));
        objc_msgSend(v9, "setDuration:", 1.0);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTimingFunction:", v10);

        v17[0] = v8;
        v17[1] = 3221225472;
        v17[2] = __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke;
        v17[3] = &unk_1E6BCE010;
        v18 = v9;
        v11 = v9;
        -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", v17);

      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v12 = v8;
      v13 = 3221225472;
      v14 = __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke_2;
      v15 = &unk_1E6BCE010;
      v16 = v7;
      -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", &v12);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v12, v13, v14, v15);

    }
    objc_storeStrong((id *)&self->_contentImage, a3);
  }

}

uint64_t __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("contentsFade"));
}

void __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v4 = a2;
  objc_msgSend(v4, "setContents:", objc_msgSend(v3, "CGImage"));

}

- (void)setOverrideContentImage:(id)a3
{
  UIImage *v5;
  _QWORD v6[4];
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_overrideContentImage != v5)
  {
    objc_storeStrong((id *)&self->_overrideContentImage, a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__NTKUpNextBaseCell_setOverrideContentImage___block_invoke;
    v6[3] = &unk_1E6BCE010;
    v7 = v5;
    -[NTKUpNextBaseCell enumerateContentsLayersWithBlock:](self, "enumerateContentsLayersWithBlock:", v6);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

void __45__NTKUpNextBaseCell_setOverrideContentImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v4 = a2;
  objc_msgSend(v4, "setContents:", objc_msgSend(v3, "CGImage"));

}

- (void)enumerateContentsLayersWithBlock:(id)a3
{
  void (**v4)(id, CALayer *);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CALayer *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, CALayer *))a3;
  v4[2](v4, self->_imageLayer);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_layerProviders;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "contentsLayer", (_QWORD)v11);
        v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)configureWithContent:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_content, a3);
  v5 = a3;
  objc_msgSend(v5, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKUpNextBaseCell setTintColor:](self, "setTintColor:", v6);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  char v5;
  double v6;
  CALayer *imageLayer;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  UIImageView *shadowView;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKUpNextBaseCell;
  -[NTKUpNextBaseCell applyLayoutAttributes:](&v20, sel_applyLayoutAttributes_, v4);
  -[NTKUpNextBaseCell setHidden:](self, "setHidden:", objc_msgSend(v4, "isHidden"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKUpNextBaseCell setPaused:](self, "setPaused:", objc_msgSend(v4, "notVisibleToUser"));
    v5 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    }
    objc_msgSend(v4, "darkeningAlphaUniform");
    CLKInterpolateBetweenFloatsClipped();
    self->_darkeningAmount = v6;
    -[NTKUpNextBaseCell _updateColorOverlay](self, "_updateColorOverlay");
    if (!self->_overrideContentImage)
    {
      imageLayer = self->_imageLayer;
      objc_msgSend(v4, "unitFrameOnScreen");
      -[CALayer setContentsRect:](imageLayer, "setContentsRect:");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = self->_layerProviders;
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v13, "contentsLayer", (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "contentsLayerBoundsForLayout:", v4);
            objc_msgSend(v14, "setContentsRect:");

          }
          v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

    }
    shadowView = self->_shadowView;
    objc_msgSend(v4, "shadowAlpha", (_QWORD)v16);
    CLKInterpolateBetweenFloatsClipped();
    -[UIImageView setAlpha:](shadowView, "setAlpha:");
    if ((v5 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

- (void)_updateColorOverlay
{
  int v3;
  UIView *overlayView;
  double v5;
  double darkeningAmount;
  id v7;

  v3 = -[NTKUpNextBaseCell isHighlighted](self, "isHighlighted");
  overlayView = self->_overlayView;
  if (v3)
  {
    v5 = 1.0;
    darkeningAmount = 0.25;
  }
  else
  {
    darkeningAmount = self->_darkeningAmount;
    v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v5, darkeningAmount);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](overlayView, "setBackgroundColor:", v7);

}

- (id)transitionContextInView:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (Class)suggestedCellClassForContent:(id)a3
{
  objc_msgSend(a3, "style");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (UIImage)overrideContentImage
{
  return self->_overrideContentImage;
}

- (REContent)content
{
  return self->_content;
}

- (NSString)representedElementIdentifier
{
  return self->_representedElementIdentifier;
}

- (void)setRepresentedElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_representedElementIdentifier, a3);
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_representedElementIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideContentImage, 0);
  objc_storeStrong((id *)&self->_contentImage, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_layerProviders, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_11();
}

- (void)updateMonochromeColor
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_11();
}

@end
