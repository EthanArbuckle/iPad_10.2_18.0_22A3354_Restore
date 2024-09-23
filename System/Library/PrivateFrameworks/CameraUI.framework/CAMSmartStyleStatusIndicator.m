@implementation CAMSmartStyleStatusIndicator

- (CAMSmartStyleStatusIndicator)initWithFrame:(CGRect)a3
{
  CAMSmartStyleStatusIndicator *v3;
  CAMSmartStyleStatusIndicator *v4;
  CAMSmartStyleStatusIndicator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStyleStatusIndicator;
  v3 = -[CAMControlStatusIndicator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)setSmartStyle:(id)a3
{
  -[CAMSmartStyleStatusIndicator setSmartStyle:animated:](self, "setSmartStyle:animated:", a3, 0);
}

- (void)setSmartStyle:(id)a3 animated:(BOOL)a4
{
  CEKSmartStyle *v6;
  CEKSmartStyle *smartStyle;
  char v8;
  double v9;
  double v10;
  double v11;
  CEKSmartStyle *v12;

  v6 = (CEKSmartStyle *)a3;
  smartStyle = self->_smartStyle;
  if (smartStyle != v6)
  {
    v12 = v6;
    v8 = -[CEKSmartStyle isEqualToSmartStyle:](smartStyle, "isEqualToSmartStyle:", v6);
    v6 = v12;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_smartStyle, a3);
      -[CEKSmartStyle colorBias](v12, "colorBias");
      v10 = v9;
      -[CEKSmartStyle toneBias](v12, "toneBias");
      -[CAMSmartStyleStatusIndicator _setNormalizedStyleValue:](self, "_setNormalizedStyleValue:", v10, v11);
      v6 = v12;
    }
  }

}

- (void)setShowDisabled:(BOOL)a3
{
  -[CAMSmartStyleStatusIndicator setShowDisabled:animated:](self, "setShowDisabled:animated:", a3, 0);
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", 0);
  }
}

- (void)setShowValueDot:(BOOL)a3
{
  if (self->_showValueDot != a3)
  {
    self->_showValueDot = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", 0);
  }
}

- (void)_setNormalizedStyleValue:(CGPoint)a3
{
  if (self->__normalizedStyleValue.x != a3.x || self->__normalizedStyleValue.y != a3.y)
  {
    self->__normalizedStyleValue = a3;
    if (-[CAMSmartStyleStatusIndicator showValueDot](self, "showValueDot"))
      -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (id)imageForCurrentState
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (-[CAMSmartStyleStatusIndicator isActive](self, "isActive"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMSmartStyleStatusIndicator showValueDot](self, "showValueDot"))
    v4 = 4.33333333;
  else
    v4 = 0.0;
  v5 = (void *)objc_opt_class();
  -[CAMSmartStyleStatusIndicator _normalizedStyleValue](self, "_normalizedStyleValue");
  objc_msgSend(v5, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v3, 24.0, 24.0, 5.0, 1.0, 3.0, 1.33333333, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  void *v2;
  char v3;

  -[CAMSmartStyleStatusIndicator smartStyle](self, "smartStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCustomizable");

  return v3;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)imageSymbolColorConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithHierarchicalColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)imageForAXHUD
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v3, 48.0, 48.0, 10.0, 2.0, 6.0, 2.66666667, 8.66666667, 0x3FE0000000000000, 0x3FE0000000000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)gridImageWithSize:(CGSize)a3 cornerRadius:(double)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7 valueDotWidth:(double)a8 value:(CGPoint)a9 color:(id)a10
{
  double height;
  double width;
  id v17;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v33;
  double v34;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGPoint v50;

  height = a3.height;
  width = a3.width;
  v17 = a10;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v19, width, height);
    CEKRectWithSize();
    v33 = a4;
    v34 = a8;
    v22 = v21;
    v24 = v23;
    v25 = a7;
    v27 = v26;
    v28 = a6;
    v30 = v29;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __133__CAMSmartStyleStatusIndicator_gridImageWithSize_cornerRadius_strokeWidth_strokeToDotSpacing_gridDotWidth_valueDotWidth_value_color___block_invoke;
    v36[3] = &unk_1EA3297E0;
    v37 = v17;
    v38 = v22;
    v39 = v24;
    v40 = v27;
    v41 = v30;
    v42 = a5;
    v43 = v33;
    v44 = a1;
    v45 = width;
    v46 = height;
    v47 = v28;
    v48 = v25;
    v49 = v34;
    v50 = a9;
    objc_msgSend(v20, "imageWithActions:", v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v31;
}

void __133__CAMSmartStyleStatusIndicator_gridImageWithSize_cornerRadius_strokeWidth_strokeToDotSpacing_gridDotWidth_valueDotWidth_value_color___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  CGRect v15;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStroke");
  objc_msgSend(v3, "setFill");
  v15 = CGRectInset(*(CGRect *)(a1 + 40), *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, *(double *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", *(double *)(a1 + 72));
  objc_msgSend(v4, "stroke");
  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 0.6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");
  v6 = 0;
  v12 = 0;
  v11 = xmmword_1DB9A4D60;
  v13 = xmmword_1DB9A4D70;
  do
  {
    v7 = 0;
    v8 = *((double *)&v11 + v6);
    do
    {
      objc_msgSend(*(id *)(a1 + 88), "centerPositionForNormalizedValue:inGridOfSize:strokeWidth:strokeToDotSpacing:gridDotWidth:", v8, *(double *)((char *)&v11 + v7), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 112), *(double *)(a1 + 120));
      objc_msgSend(*(id *)(a1 + 88), "_drawCircleInContext:atCenter:diameter:", v10);
      v7 += 8;
    }
    while (v7 != 40);
    ++v6;
  }
  while (v6 != 5);
  if (*(double *)(a1 + 128) > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");
    objc_msgSend(*(id *)(a1 + 88), "centerPositionForNormalizedValue:inGridOfSize:strokeWidth:strokeToDotSpacing:gridDotWidth:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 112), *(double *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 88), "_drawCircleInContext:atCenter:diameter:", v10);

  }
}

+ (CGPoint)centerPositionForNormalizedValue:(CGPoint)a3 inGridOfSize:(CGSize)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7
{
  double x;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  double y;
  CGPoint result;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  CEKRectWithSize();
  v20 = CGRectInset(v19, a5 + a6 + a7 * 0.5, a5 + a6 + a7 * 0.5);
  width = v20.size.width;
  height = v20.size.height;
  UIRectGetCenter();
  v14 = v13 + x * width * 0.5;
  v16 = v15 - y * height * 0.5;
  result.y = v16;
  result.x = v14;
  return result;
}

+ (void)_drawCircleInContext:(id)a3 atCenter:(CGPoint)a4 diameter:(double)a5
{
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGContext *v9;
  CGRect v10;

  v6 = a5 * 0.5;
  v7 = a4.x - v6;
  v8 = a4.y - v6;
  v9 = (CGContext *)objc_msgSend(a3, "CGContext");
  v10.origin.x = v7;
  v10.origin.y = v8;
  v10.size.width = a5;
  v10.size.height = a5;
  CGContextFillEllipseInRect(v9, v10);
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarSmartStylesButton");
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)showValueDot
{
  return self->_showValueDot;
}

- (CGPoint)_normalizedStyleValue
{
  double x;
  double y;
  CGPoint result;

  x = self->__normalizedStyleValue.x;
  y = self->__normalizedStyleValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartStyle, 0);
}

@end
