@implementation NTKRingView

- (NTKRingView)initWithFrame:(CGRect)a3 radius:(double)a4 ringWidth:(double)a5 overlapWidth:(double)a6
{
  NTKRingView *v9;
  NTKRingView *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKRingView;
  v9 = -[CLKUIColoringView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_radius = a4;
    v9->_ringWidth = a5;
    v9->_overlapWidth = a6;
    -[NTKRingView layer](v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsDisplayOnBoundsChange:", 1);

    -[NTKRingView setOpaque:](v10, "setOpaque:", 0);
  }
  return v10;
}

- (void)setFillFraction:(double)a3
{
  self->_fillFraction = a3;
  -[NTKRingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (int64_t)filterStyle
{
  return 2 * self->_shouldUseMonochromeAccentColor;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[NTKRingView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKRingView filterStyle](self, "filterStyle"), a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRingView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v9)
    v8 = v9;
  else
    v8 = 0;
  objc_msgSend(v6, "setFilters:", v8);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[NTKRingView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKRingView filterStyle](self, "filterStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRingView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
    v6 = v7;
  else
    v6 = 0;
  objc_msgSend(v4, "setFilters:", v6);

}

- (void)drawRect:(CGRect)a3
{
  void *v4;

  -[NTKRingView contentColor](self, "contentColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  -[NTKRingView _drawBackgroundRings](self, "_drawBackgroundRings");
  -[NTKRingView _drawRingWithRadius:fillFraction:alpha:hidesOverlapShadow:](self, "_drawRingWithRadius:fillFraction:alpha:hidesOverlapShadow:", self->_hidesOverlapShadow, self->_radius, self->_fillFraction, 1.0);
}

- (void)_drawBackgroundRings
{
  -[NTKRingView _drawRingWithRadius:fillFraction:alpha:hidesOverlapShadow:](self, "_drawRingWithRadius:fillFraction:alpha:hidesOverlapShadow:", 1, self->_radius, 1.0, 0.2);
}

- (void)_drawRingWithRadius:(double)a3 fillFraction:(double)a4 alpha:(double)a5 hidesOverlapShadow:(BOOL)a6
{
  double v11;
  double v12;
  id WeakRetained;
  uint64_t *v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double MidX;
  double v32;
  double v33;
  double v34;
  double MidY;
  double v36;
  double radius;
  float v38;
  __float2 v39;
  void *v40;
  void *v41;
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  CLKInterpolateBetweenFloatsClipped();
  v12 = v11;
  if (a4 >= 0.999999881)
    goto LABEL_10;
  os_unfair_lock_lock((os_unfair_lock_t)&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____lock);
  WeakRetained = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
  v14 = &NTKHighPriorityApply_onceToken;
  v15 = &NTKHighPriorityApply_onceToken;
  if (!WeakRetained)
    goto LABEL_6;
  v16 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "device");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
  if (v18 != v19)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice, v25);

    v26 = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
    v14[296] = objc_msgSend(v26, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "screenScale");
    *((double *)v15 + 293) = 1.0 / v29;

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "version");
  v23 = _drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____previousCLKDeviceVersion;

  v15 = &NTKHighPriorityApply_onceToken;
  v14 = &NTKHighPriorityApply_onceToken;
  if (v22 != v23)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____lock);
  v30 = *((double *)v15 + 293);
  if (v12 >= 4.71238898 - (self->_ringWidth + v30) / a3)
    v12 = 4.71238898 - (self->_ringWidth + v30) / a3;
  a6 = 1;
LABEL_10:
  -[NTKRingView bounds](self, "bounds");
  MidX = CGRectGetMidX(v43);
  -[NTKRingView bounds](self, "bounds");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v44), a3, -1.57079633, v12);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setLineWidth:", self->_ringWidth);
  objc_msgSend(v42, "setLineCapStyle:", 1);
  objc_msgSend(v42, "strokeWithBlendMode:alpha:", 17, a5);
  if (!a6)
  {
    CLKInterpolateBetweenFloatsClipped();
    v33 = v32;
    -[NTKRingView bounds](self, "bounds");
    v34 = CGRectGetMidX(v45);
    -[NTKRingView bounds](self, "bounds");
    MidY = CGRectGetMidY(v46);
    v36 = (self->_ringWidth + self->_overlapWidth) * 0.5;
    radius = self->_radius;
    v38 = v33;
    v39 = __sincosf_stret(v38);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setStroke");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v34 + radius * v39.__cosval, MidY + radius * v39.__sinval, v36, v33, v33 + 3.14159265);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLineWidth:", self->_overlapWidth);
    objc_msgSend(v41, "setLineCapStyle:", 0);
    objc_msgSend(v41, "strokeWithBlendMode:alpha:", 16, 1.0);

  }
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (double)overlapWidth
{
  return self->_overlapWidth;
}

- (double)radius
{
  return self->_radius;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (BOOL)hidesOverlapShadow
{
  return self->_hidesOverlapShadow;
}

- (void)setHidesOverlapShadow:(BOOL)a3
{
  self->_hidesOverlapShadow = a3;
}

- (BOOL)shouldUseMonochromeAccentColor
{
  return self->_shouldUseMonochromeAccentColor;
}

- (void)setShouldUseMonochromeAccentColor:(BOOL)a3
{
  self->_shouldUseMonochromeAccentColor = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end
