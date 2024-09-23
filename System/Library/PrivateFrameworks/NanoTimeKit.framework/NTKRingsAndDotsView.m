@implementation NTKRingsAndDotsView

- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3
{
  return -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](self, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 26.0, 2.0, 2.5, 2.5);
}

- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3 diameter:(double)a4 ringWidth:(double)a5 ringGapWidth:(double)a6 overlapStrokeWidth:(double)a7
{
  NTKRingsAndDotsView *v10;
  NTKRingsAndDotsView *v11;
  void *v12;
  NSArray *v13;
  uint64_t i;
  NTKRingView *v15;
  NTKRingView *v16;
  NSArray *ringViews;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKRingsAndDotsView;
  v10 = -[NTKRingsAndDotsView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  if (v10)
  {
    -[NTKRingsAndDotsView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsDisplayOnBoundsChange:", 1);

    -[NTKRingsAndDotsView setOpaque:](v11, "setOpaque:", 0);
    -[NTKRingsAndDotsView setRingWidth:](v11, "setRingWidth:", a5);
    -[NTKRingsAndDotsView setRingGapWidth:](v11, "setRingGapWidth:", a6);
    -[NTKRingsAndDotsView _setDiameter:](v11, "_setDiameter:", a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      -[NTKRingsAndDotsView radiusForRingAtIndex:](v11, "radiusForRingAtIndex:", i);
      v15 = [NTKRingView alloc];
      -[NTKRingsAndDotsView bounds](v11, "bounds");
      v16 = -[NTKRingView initWithFrame:radius:ringWidth:overlapWidth:](v15, "initWithFrame:radius:ringWidth:overlapWidth:");
      -[NTKRingsAndDotsView addSubview:](v11, "addSubview:", v16);
      -[NSArray addObject:](v13, "addObject:", v16);

    }
    ringViews = v11->_ringViews;
    v11->_ringViews = v13;

    -[NTKRingsAndDotsView sizeToFit](v11, "sizeToFit");
  }
  return v11;
}

+ (id)emptyFillFractions
{
  return &unk_1E6CA9BB0;
}

- (UIColor)overrideColor
{
  return 0;
}

- (BOOL)usesLegibility
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double diameter;
  double v4;
  CGSize result;

  diameter = self->_diameter;
  v4 = diameter;
  result.height = v4;
  result.width = diameter;
  return result;
}

- (void)layoutSubviews
{
  NSArray *ringViews;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRingsAndDotsView;
  -[NTKRingsAndDotsView layoutSubviews](&v5, sel_layoutSubviews);
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__NTKRingsAndDotsView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E6BD34D0;
  v4[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v4);
}

void __37__NTKRingsAndDotsView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)setRingsFillFractions:(id)a3
{
  id v4;
  NSArray *ringViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__NTKRingsAndDotsView_setRingsFillFractions___block_invoke;
  v7[3] = &unk_1E6BD34D0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v7);

}

void __45__NTKRingsAndDotsView_setRingsFillFractions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  float v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v5, "setFillFraction:", v6);

}

- (void)setHidesOverlapShadow:(BOOL)a3
{
  NSArray *ringViews;
  _QWORD v4[4];
  BOOL v5;

  self->_hidesOverlapShadow = a3;
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NTKRingsAndDotsView_setHidesOverlapShadow___block_invoke;
  v4[3] = &__block_descriptor_33_e28_v32__0__NTKRingView_8Q16_B24l;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __45__NTKRingsAndDotsView_setHidesOverlapShadow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidesOverlapShadow:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setForegroundColor:(id)a3
{
  id v4;
  NSArray *ringViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__NTKRingsAndDotsView_setForegroundColor___block_invoke;
  v7[3] = &unk_1E6BD34D0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __42__NTKRingsAndDotsView_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

- (void)setRingColors:(id)a3
{
  NSArray *ringViews;
  NSArray *v6;
  _QWORD v7[4];
  NSArray *v8;

  v6 = (NSArray *)a3;
  if (self->_ringColors != v6)
  {
    objc_storeStrong((id *)&self->_ringColors, a3);
    ringViews = self->_ringViews;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__NTKRingsAndDotsView_setRingColors___block_invoke;
    v7[3] = &unk_1E6BD34D0;
    v8 = v6;
    -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v7);

  }
}

void __37__NTKRingsAndDotsView_setRingColors___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v6);

}

- (void)setShouldUseMonochromeAccentColor:(BOOL)a3
{
  NSArray *ringViews;
  _QWORD v4[4];
  BOOL v5;

  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NTKRingsAndDotsView_setShouldUseMonochromeAccentColor___block_invoke;
  v4[3] = &__block_descriptor_33_e28_v32__0__NTKRingView_8Q16_B24l;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __57__NTKRingsAndDotsView_setShouldUseMonochromeAccentColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldUseMonochromeAccentColor:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setFilterProvider:(id)a3
{
  id v4;
  NSArray *ringViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__NTKRingsAndDotsView_setFilterProvider___block_invoke;
  v7[3] = &unk_1E6BD34D0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __41__NTKRingsAndDotsView_setFilterProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFilterProvider:", *(_QWORD *)(a1 + 32));
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  NSArray *ringViews;
  _QWORD v4[5];

  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__NTKRingsAndDotsView_transitionToMonochromeWithFraction___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v32__0__NTKRingView_8Q16_B24l;
  *(double *)&v4[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](ringViews, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __58__NTKRingsAndDotsView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transitionToMonochromeWithFraction:", *(double *)(a1 + 32));
}

- (void)updateMonochromeColor
{
  -[NSArray enumerateObjectsUsingBlock:](self->_ringViews, "enumerateObjectsUsingBlock:", &__block_literal_global_74);
}

uint64_t __44__NTKRingsAndDotsView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateMonochromeColor");
}

- (void)_setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)radiusForRingAtIndex:(int64_t)a3
{
  return fmax(self->_diameter * 0.5- self->_ringGapWidth * (double)a3- self->_ringWidth * (double)a3- self->_ringWidth * 0.5, 0.0);
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (NSArray)ringColors
{
  return self->_ringColors;
}

- (NSMutableArray)ringsFillFractions
{
  return self->_ringsFillFractions;
}

- (BOOL)hidesOverlapShadow
{
  return self->_hidesOverlapShadow;
}

- (BOOL)shouldUseMonochromeAccentColor
{
  return self->_shouldUseMonochromeAccentColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)secondaryForegroundColor
{
  return self->_secondaryForegroundColor;
}

- (void)setSecondaryForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryForegroundColor, a3);
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (void)setRingWidth:(double)a3
{
  self->_ringWidth = a3;
}

- (double)ringGapWidth
{
  return self->_ringGapWidth;
}

- (void)setRingGapWidth:(double)a3
{
  self->_ringGapWidth = a3;
}

- (double)appearanceAnimationProgress
{
  return self->_appearanceAnimationProgress;
}

- (void)setAppearanceAnimationProgress:(double)a3
{
  self->_appearanceAnimationProgress = a3;
}

- (NSArray)ringViews
{
  return self->_ringViews;
}

- (void)setRingViews:(id)a3
{
  objc_storeStrong((id *)&self->_ringViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringViews, 0);
  objc_storeStrong((id *)&self->_secondaryForegroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringColors, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
}

@end
