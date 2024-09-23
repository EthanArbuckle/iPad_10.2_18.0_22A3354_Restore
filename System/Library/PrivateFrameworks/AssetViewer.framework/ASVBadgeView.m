@implementation ASVBadgeView

+ (id)badgeView
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setUpView");
  return v2;
}

+ (id)normalBlurViewEffects
{
  if (normalBlurViewEffects_onceToken != -1)
    dispatch_once(&normalBlurViewEffects_onceToken, &__block_literal_global_4);
  return (id)normalBlurViewEffects_blurViewEffects;
}

void __37__ASVBadgeView_normalBlurViewEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3660];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v1, 0.82, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v3, "effectWithBlurRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)normalBlurViewEffects_blurViewEffects;
  normalBlurViewEffects_blurViewEffects = v7;

}

+ (id)highlightedBlurViewEffects
{
  if (highlightedBlurViewEffects_onceToken != -1)
    dispatch_once(&highlightedBlurViewEffects_onceToken, &__block_literal_global_6_0);
  return (id)highlightedBlurViewEffects_highlightedBlurViewEffects;
}

void __42__ASVBadgeView_highlightedBlurViewEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3660];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v1, 0.52, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v3, "effectWithBlurRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)highlightedBlurViewEffects_highlightedBlurViewEffects;
  highlightedBlurViewEffects_highlightedBlurViewEffects = v7;

}

- (void)setUpView
{
  UIView *v3;
  UIView *shadowView;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  UIVisualEffectView *v11;
  UIVisualEffectView *blurView;
  void *v13;
  UIImageView *v14;
  UIImageView *badgeImageView;

  -[ASVBadgeView setOpaque:](self, "setOpaque:", 0);
  v3 = (UIView *)objc_opt_new();
  shadowView = self->_shadowView;
  self->_shadowView = v3;

  -[UIView layer](self->_shadowView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.06);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[UIView layer](self->_shadowView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowColor:", v7);

  -[UIView layer](self->_shadowView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(v9, "setShadowOpacity:", v10);

  -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 18);
  -[ASVBadgeView bounds](self, "bounds");
  -[UIView setFrame:](self->_shadowView, "setFrame:");
  v11 = (UIVisualEffectView *)objc_opt_new();
  blurView = self->_blurView;
  self->_blurView = v11;

  +[ASVBadgeView normalBlurViewEffects](ASVBadgeView, "normalBlurViewEffects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_blurView, "setBackgroundEffects:", v13);

  -[UIVisualEffectView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 18);
  -[ASVBadgeView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[UIVisualEffectView setClipsToBounds:](self->_blurView, "setClipsToBounds:", 1);
  v14 = (UIImageView *)objc_opt_new();
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v14;

  -[UIImageView setAutoresizingMask:](self->_badgeImageView, "setAutoresizingMask:", 18);
  -[ASVBadgeView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
  -[ASVBadgeView addSubview:](self, "addSubview:", self->_shadowView);
  -[ASVBadgeView addSubview:](self, "addSubview:", self->_blurView);
  -[ASVBadgeView addSubview:](self, "addSubview:", self->_badgeImageView);
}

- (void)setThumbnailSize:(CGSize)a3
{
  ASVBadgeDescription *v4;
  ASVBadgeDescription *badgeDescription;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  self->_thumbnailSize = a3;
  +[ASVBadgeDescription descriptionForSize:](ASVBadgeDescription, "descriptionForSize:");
  v4 = (ASVBadgeDescription *)objc_claimAutoreleasedReturnValue();
  badgeDescription = self->_badgeDescription;
  self->_badgeDescription = v4;

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badgeImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_badgeImageView, "setImage:", v7);

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "badgeSize");
  v10 = v9 * 0.5;
  -[UIVisualEffectView layer](self->_blurView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  -[ASVBadgeView _updateShadow](self, "_updateShadow");
  -[ASVBadgeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateShadow
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  double width;
  double height;
  void *v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  double y;
  double x;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shadowSize");
  v5 = v4;
  -[UIView layer](self->_shadowView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", v5);

  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "badgeSize");
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v7, v8, v11, v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGPath");
  -[UIView layer](self->_shadowView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowPath:", v15);

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shadowSize");
  v19 = v18 * -2.0;
  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shadowSize");
  v22 = v21 * -2.0;
  v43.origin.x = v7;
  v43.origin.y = v8;
  v43.size.width = v11;
  v43.size.height = v13;
  v44 = CGRectInset(v43, v19, v22);
  y = v44.origin.y;
  x = v44.origin.x;
  width = v44.size.width;
  height = v44.size.height;

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shadowSize");
  v27 = v26 + v26;
  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shadowSize");
  v30 = v29 + v29;
  v45.origin.x = v7;
  v45.origin.y = v8;
  v45.size.width = v11;
  v45.size.height = v13;
  v46 = CGRectOffset(v45, v27, v30);
  v31 = v46.origin.x;
  v32 = v46.origin.y;
  v33 = v46.size.width;
  v34 = v46.size.height;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v7, v8, width, height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v31, v32, v33, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bezierPathByReversingPath");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendPath:", v37);

  v38 = (void *)objc_opt_new();
  v40 = objc_retainAutorelease(v35);
  objc_msgSend(v38, "setPath:", objc_msgSend(v40, "CGPath"));
  objc_msgSend(v38, "setFrame:", x, y, width, height);
  -[UIView layer](self->_shadowView, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMask:", v38);

}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v5;
  id v6;

  self->_highlighted = a3;
  if (a3)
    v5 = 3;
  else
    v5 = 0;
  -[UIImageView setDrawMode:](self->_badgeImageView, "setDrawMode:", v5);
  if (a3)
    +[ASVBadgeView highlightedBlurViewEffects](ASVBadgeView, "highlightedBlurViewEffects");
  else
    +[ASVBadgeView normalBlurViewEffects](ASVBadgeView, "normalBlurViewEffects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_blurView, "setBackgroundEffects:", v6);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ASVBadgeView badgeDescription](self, "badgeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

+ (id)badgeForThumbnail:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  +[ASVBadgeDescription descriptionForSize:](ASVBadgeDescription, "descriptionForSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "badgeSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "shadowSize");
  v13 = v12;
  objc_msgSend(v7, "badgeOffset");
  v15 = v6 - (v9 + v13 * 2.0) - v14;
  objc_msgSend(v7, "badgeOffset");
  v17 = v16;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v9 + v13 * 2.0, v11 + v13 * 2.0);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __34__ASVBadgeView_badgeForThumbnail___block_invoke;
  v23[3] = &unk_1E9F0CB58;
  v25 = v7;
  v26 = a1;
  v27 = v15;
  v28 = v17;
  v24 = v4;
  v29 = v13;
  v30 = v9;
  v31 = v11;
  v19 = v7;
  v20 = v4;
  objc_msgSend(v18, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __34__ASVBadgeView_badgeForThumbnail___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGContext *v15;
  CGFloat v16;
  id v17;
  CGColor *v18;
  void *v19;
  id v20;

  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = -*(double *)(a1 + 56);
  v6 = -*(double *)(a1 + 64);
  v7 = a2;
  objc_msgSend(v3, "applyBlurWithBackground:offset:", v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "badgeImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawInRect:", *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  objc_msgSend(v7, "currentImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGContext");
  CGContextClear();
  objc_msgSend(v10, "addClip");
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v9, "drawAtPoint:", *MEMORY[0x1E0C9D538], v12);
  CGContextResetClip((CGContextRef)objc_msgSend(v7, "CGContext"));
  objc_msgSend(v7, "currentImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.06);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CGContext *)objc_msgSend(v7, "CGContext");
  v16 = *(double *)(a1 + 72);
  v17 = objc_retainAutorelease(v14);
  v18 = (CGColor *)objc_msgSend(v17, "CGColor");
  CGContextSetShadowWithColor(v15, *MEMORY[0x1E0C9D820], v16, v18);
  objc_msgSend(v7, "currentImage");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "drawAtPoint:", v11, v12);
}

+ (void)applyBlurWithBackground:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CGImage *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _OWORD v34[3];

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (objc_msgSend(v6, "ioSurface"))
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:", objc_msgSend(v6, "ioSurface"));
  else
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v34[0] = *MEMORY[0x1E0C9BAA8];
  v34[1] = v12;
  v34[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v13 = (void *)MEMORY[0x1E0C9DDB8];
  v14 = v11;
  objc_msgSend(v13, "filterWithName:", CFSTR("CIAffineClamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v15, "setValue:forKey:", v14, *MEMORY[0x1E0C9E1F8]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v34, "{CGAffineTransform=dddddd}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v15;
  objc_msgSend(v15, "setValue:forKey:", v17, *MEMORY[0x1E0C9E280]);

  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIGaussianBlur"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDefaults");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 * 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0C9E258]);

  objc_msgSend(v19, "setValue:forKey:", v18, v16);
  objc_msgSend(v19, "outputImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorControls"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v21, v16);
  objc_msgSend(v22, "setValue:forKey:", &unk_1E9F29F60, *MEMORY[0x1E0C9E260]);
  objc_msgSend(v22, "outputImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithString:", CFSTR("1.0 1.0 1.0 0.405"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setValue:forKey:", v31, *MEMORY[0x1E0C9E1C0]);
  objc_msgSend(v24, "outputImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAdditionCompositing"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v25, v16);
  objc_msgSend(v26, "setValue:forKey:", v23, *MEMORY[0x1E0C9E190]);
  objc_msgSend(v26, "outputImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "extent");
  v28 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v27);
  v29 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v10, "scale");
  objc_msgSend(v29, "imageWithCGImage:scale:orientation:", v28, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v28);
  objc_msgSend(v30, "drawAtPoint:", x, y);

}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (ASVBadgeDescription)badgeDescription
{
  return self->_badgeDescription;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDescription, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
