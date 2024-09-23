@implementation NTKRing

- (NTKRing)init
{
  return -[NTKRing initWithFillFraction:style:radius:strokeWidth:](self, "initWithFillFraction:style:radius:strokeWidth:", 0, 0.0, 0.0, 0.0);
}

- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4
{
  return -[NTKRing initWithFillFraction:style:radius:strokeWidth:](self, "initWithFillFraction:style:radius:strokeWidth:", a4, a3, 0.0, 0.0);
}

- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4 radius:(double)a5 strokeWidth:(double)a6
{
  NTKRing *v10;
  NTKRing *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRing;
  v10 = -[NTKRing init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[NTKRing _validFillFraction:](v10, "_validFillFraction:", a3);
    v11->_ringStyle = a4;
    v11->_radius = a5;
    v11->_fillFraction = v12;
    v11->_strokeWidth = a6;
    v11->_backgroundRingAlpha = 0.18;
  }
  return v11;
}

- (id)ringImage
{
  double fillFraction;
  double radius;
  double v5;
  double v6;
  int64_t ringStyle;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  CGContext *CurrentContext;
  void *v16;
  CGFloat v17;
  void *v18;
  void *v19;
  CGSize v21;

  fillFraction = self->_fillFraction;
  radius = self->_radius;
  v5 = radius + self->_strokeWidth * -0.5;
  v6 = (fillFraction + fillFraction) * 3.14159265 + -1.57079633;
  ringStyle = self->_ringStyle;
  v8 = fillFraction * 5.65486678 + 1.88495559;
  if (ringStyle == 1)
    v9 = v8;
  else
    v9 = v6;
  if (ringStyle == 1)
    v10 = 1.88495559;
  else
    v10 = -1.57079633;
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "screenScale");
  v14 = v13;
  v21.width = radius + radius;
  v21.height = radius + radius;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, self->_strokeWidth);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStroke");

  CGContextAddArc(CurrentContext, radius, radius, v5, v10, v9, 0);
  CGContextStrokePath(CurrentContext);
  if (self->_fillFraction != 1.0)
  {
    v17 = dbl_1B755EAE0[ringStyle == 1];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, self->_backgroundRingAlpha);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStroke");

    CGContextAddArc(CurrentContext, radius, radius, v5, v9, v17, 0);
    CGContextStrokePath(CurrentContext);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v19;
}

- (void)fillFraction:(double)a3
{
  double v4;

  -[NTKRing _validFillFraction:](self, "_validFillFraction:", a3);
  self->_fillFraction = v4;
}

- (id)fillFractionString
{
  double fillFraction;

  fillFraction = self->_fillFraction;
  *(float *)&fillFraction = fillFraction;
  return +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:", fillFraction);
}

- (id)fillFractionStringWithSymbol
{
  double fillFraction;

  fillFraction = self->_fillFraction;
  *(float *)&fillFraction = fillFraction;
  return +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:", fillFraction);
}

- (double)_validFillFraction:(double)a3
{
  double v3;
  BOOL v4;
  double result;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  v4 = a3 < 0.0;
  result = 0.0;
  if (!v4)
    return v3;
  return result;
}

+ (id)fillFractionStringForFillFraction:(float)a3
{
  double v5;

  if (fillFractionStringForFillFraction__onceToken != -1)
    dispatch_once(&fillFractionStringForFillFraction__onceToken, &__block_literal_global_108);
  *(float *)&v5 = a3;
  return (id)objc_msgSend(a1, "_fillFractionStringForFillFraction:withFormatter:", fillFractionStringForFillFraction__percentageFormatter, v5);
}

uint64_t __45__NTKRing_fillFractionStringForFillFraction___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fillFractionStringForFillFraction__percentageFormatter;
  fillFractionStringForFillFraction__percentageFormatter = v0;

  objc_msgSend((id)fillFractionStringForFillFraction__percentageFormatter, "setNumberStyle:", 3);
  return objc_msgSend((id)fillFractionStringForFillFraction__percentageFormatter, "setPercentSymbol:", &stru_1E6BDC918);
}

+ (id)fillFractionStringWithSymbolForFillFraction:(float)a3
{
  double v5;

  if (fillFractionStringWithSymbolForFillFraction__onceToken != -1)
    dispatch_once(&fillFractionStringWithSymbolForFillFraction__onceToken, &__block_literal_global_5_2);
  *(float *)&v5 = a3;
  return (id)objc_msgSend(a1, "_fillFractionStringForFillFraction:withFormatter:", fillFractionStringWithSymbolForFillFraction__percentageFormatter, v5);
}

uint64_t __55__NTKRing_fillFractionStringWithSymbolForFillFraction___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fillFractionStringWithSymbolForFillFraction__percentageFormatter;
  fillFractionStringWithSymbolForFillFraction__percentageFormatter = v0;

  return objc_msgSend((id)fillFractionStringWithSymbolForFillFraction__percentageFormatter, "setNumberStyle:", 3);
}

+ (id)_fillFractionStringForFillFraction:(float)a3 withFormatter:(id)a4
{
  __CFString *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 == -1.0)
  {
    v5 = CFSTR("--");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    *(float *)&v8 = a3;
    objc_msgSend(v6, "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(double)a3
{
  self->_fillFraction = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_backgroundRingAlpha = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (int64_t)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(int64_t)a3
{
  self->_ringStyle = a3;
}

@end
