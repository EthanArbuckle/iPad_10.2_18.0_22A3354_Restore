@implementation MTColor

+ (id)colorWithDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class *v6;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("alpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("white"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = MTWhiteColor;
LABEL_4:
      v4 = (void *)objc_msgSend([v6 alloc], "_initWithDescription:", v3);
      goto LABEL_5;
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("red"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_5;
    objc_msgSend(v3, "objectForKey:", CFSTR("green"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v3, "objectForKey:", CFSTR("blue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v6 = MTRGBColor;
        goto LABEL_4;
      }
    }
    else
    {

    }
    v4 = 0;
  }
LABEL_5:

  return v4;
}

- (void)dealloc
{
  CGColor *cachedColor;
  objc_super v4;

  cachedColor = self->_cachedColor;
  if (cachedColor)
    CGColorRelease(cachedColor);
  v4.receiver = self;
  v4.super_class = (Class)MTColor;
  -[MTColor dealloc](&v4, sel_dealloc);
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  CGColorSpaceRef ColorSpace;
  id v5;

  if (a3)
  {
    ColorSpace = CGColorGetColorSpace(a3);
    if (RGBColorSpace_onceToken != -1)
      dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_107);
    if (ColorSpace != (CGColorSpaceRef)RGBColorSpace___RGBColorSpace
      || (v5 = -[MTRGBColor _initWithCGColor:]([MTRGBColor alloc], "_initWithCGColor:", a3)) == 0)
    {
      if (GrayColorSpace_onceToken != -1)
        dispatch_once(&GrayColorSpace_onceToken, &__block_literal_global_108);
      if (ColorSpace == (CGColorSpaceRef)GrayColorSpace___GrayColorSpace)
        v5 = -[MTWhiteColor _initWithCGColor:]([MTWhiteColor alloc], "_initWithCGColor:", a3);
      else
        v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)whiteColor
{
  return (id)objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 1.0);
}

+ (id)blackColor
{
  return (id)objc_msgSend(a1, "colorWithWhite:alpha:", 0.0, 1.0);
}

+ (id)pinkColor
{
  return (id)objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 1.0, 0.752941176, 0.796078431, 1.0);
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  return -[MTWhiteColor initWithWhite:alpha:]([MTWhiteColor alloc], "initWithWhite:alpha:", a3, a4);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[MTRGBColor initWithRed:green:blue:alpha:]([MTRGBColor alloc], "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

- (id)_initWithCGColor:(CGColor *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 256, CFSTR("Abstract"));

  return 0;
}

- (id)_initWithDescription:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 261, CFSTR("Abstract"));

  return 0;
}

- (CGColor)CGColor
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 272, CFSTR("Abstract"));

  return 0;
}

- (id)colorDescription
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 277, CFSTR("Abstract"));

  return 0;
}

- (MTColor)colorWithAlphaComponent:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 282, CFSTR("Abstract"));

  return 0;
}

- (MTColor)colorWithAdditionalAlphaComponent:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 287, CFSTR("Abstract"));

  return 0;
}

- (id)colorBlendedWithColor:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 292, CFSTR("Abstract"));

  return 0;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  void *v6;
  CAColorMatrix *result;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MTColor.m"), 297, CFSTR("Abstract"));

  v8 = (_OWORD *)MEMORY[0x1E0CD2338];
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  *(_OWORD *)&retstr->m33 = v9;
  *(_OWORD *)&retstr->m42 = v8[4];
  v10 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m15 = v10;
  return result;
}

- (id)_rgbColor
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 302, CFSTR("Abstract"));

  return 0;
}

@end
