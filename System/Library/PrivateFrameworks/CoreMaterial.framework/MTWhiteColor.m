@implementation MTWhiteColor

- (id)_initWithDescription:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  float v10;
  MTWhiteColor *v11;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorDescription"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("alpha"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedAlpha != nil"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("white"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedWhite != nil"));

  }
  objc_msgSend(v7, "floatValue");
  v9 = v8;
  objc_msgSend(v6, "floatValue");
  v11 = -[MTWhiteColor initWithWhite:alpha:](self, "initWithWhite:alpha:", v9, v10);

  return v11;
}

- (MTWhiteColor)initWithWhite:(double)a3 alpha:(double)a4
{
  MTWhiteColor *v7;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTWhiteColor;
  v7 = -[MTWhiteColor init](&v12, sel_init);
  if (v7)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MTColor.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= white) && (white <= 1.0)"));

    }
    if (a4 < 0.0 || a4 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MTColor.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= alpha) && (alpha <= 1.0)"));

    }
    v7->_white = a3;
    v7->_alpha = a4;
  }
  return v7;
}

- (CGColor)CGColor
{
  CGColor *result;
  double alpha;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  result = self->super._cachedColor;
  if (!result)
  {
    alpha = self->_alpha;
    components[0] = self->_white;
    components[1] = alpha;
    if (GrayColorSpace_onceToken != -1)
      dispatch_once(&GrayColorSpace_onceToken, &__block_literal_global_108);
    result = CGColorCreate((CGColorSpaceRef)GrayColorSpace___GrayColorSpace, components);
    self->super._cachedColor = result;
  }
  return result;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  return (CAColorMatrix *)CAColorMatrixMakeColorSourceOver();
}

- (MTWhiteColor)colorWithAlphaComponent:(double)a3
{
  return (MTWhiteColor *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWhite:alpha:", self->_white, a3);
}

- (id)_initWithCGColor:(CGColor *)a3
{
  CGColorSpace *ColorSpace;
  void *v6;
  const CGFloat *Components;
  double v8;
  double v9;
  MTWhiteColor *v10;
  MTWhiteColor *v11;
  void *v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cgColor"));

    goto LABEL_6;
  }
  ColorSpace = CGColorGetColorSpace(a3);
  CGColorSpaceGetName(ColorSpace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C9D930])
    || (Components = CGColorGetComponents(a3), CGColorGetNumberOfComponents(a3) != 2))
  {

LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v8 = *Components;
  v9 = Components[1];

  self = -[MTWhiteColor initWithWhite:alpha:](self, "initWithWhite:alpha:", v8, v9);
  v10 = self;
LABEL_7:
  v11 = v10;

  return v11;
}

- (id)colorDescription
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("white");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_white);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("alpha");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_alpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MTWhiteColor)colorWithAdditionalAlphaComponent:(double)a3
{
  return -[MTWhiteColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", fmax(fmin(self->_alpha + a3, 1.0), 0.0));
}

- (id)colorBlendedWithColor:(id)a3
{
  double *v4;
  MTWhiteColor *v5;
  double alpha;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  MTWhiteColor *v11;

  v4 = (double *)a3;
  v5 = self;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      alpha = v5->_alpha;
      v7 = v4[3];
      v8 = 1.0;
      v9 = alpha + v7 * (1.0 - alpha);
      if (v9 != 0.0)
        v8 = (alpha * v5->_white + v7 * v4[2] * (1.0 - alpha)) / v9;
      +[MTColor colorWithWhite:alpha:](MTColor, "colorWithWhite:alpha:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MTWhiteColor _rgbColor](v5, "_rgbColor");
      v11 = (MTWhiteColor *)objc_claimAutoreleasedReturnValue();
      -[MTWhiteColor colorBlendedWithColor:](v11, "colorBlendedWithColor:", v4);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = v11;
    }

    v5 = (MTWhiteColor *)v10;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; white: %f; alpha: %f>"),
               objc_opt_class(),
               self,
               *(_QWORD *)&self->_white,
               *(_QWORD *)&self->_alpha);
}

- (id)_rgbColor
{
  return -[MTRGBColor initWithRed:green:blue:alpha:]([MTRGBColor alloc], "initWithRed:green:blue:alpha:", self->_white, self->_white, self->_white, self->_alpha);
}

- (double)white
{
  return self->_white;
}

- (double)alpha
{
  return self->_alpha;
}

@end
