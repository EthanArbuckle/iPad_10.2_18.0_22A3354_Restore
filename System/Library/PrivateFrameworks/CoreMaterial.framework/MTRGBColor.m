@implementation MTRGBColor

- (MTRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  MTRGBColor *v11;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTRGBColor;
  v11 = -[MTRGBColor init](&v18, sel_init);
  if (v11)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MTColor.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= red) && (red <= 1.0)"));

    }
    if (a4 < 0.0 || a4 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MTColor.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= green) && (green <= 1.0)"));

    }
    if (a5 < 0.0 || a5 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MTColor.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= blue) && (blue <= 1.0)"));

    }
    if (a6 < 0.0 || a6 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MTColor.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(0 <= alpha) && (alpha <= 1.0)"));

    }
    v11->_red = a3;
    v11->_green = a4;
    v11->_blue = a5;
    v11->_alpha = a6;
  }
  return v11;
}

- (id)_initWithCGColor:(CGColor *)a3
{
  CGColorSpace *ColorSpace;
  void *v6;
  const CGFloat *Components;
  double v8;
  double v9;
  double v10;
  double v11;
  MTRGBColor *v12;
  MTRGBColor *v13;
  void *v16;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cgColor"));

    goto LABEL_6;
  }
  ColorSpace = CGColorGetColorSpace(a3);
  CGColorSpaceGetName(ColorSpace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C9D960])
    || (Components = CGColorGetComponents(a3), CGColorGetNumberOfComponents(a3) != 4))
  {

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v8 = *Components;
  v9 = Components[1];
  v10 = Components[2];
  v11 = Components[3];

  self = -[MTRGBColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v8, v9, v10, v11);
  v12 = self;
LABEL_7:
  v13 = v12;

  return v13;
}

- (id)_initWithDescription:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  MTRGBColor *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorDescription"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("alpha"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedAlpha != nil"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("red"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedRed != nil"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("green"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedGreen != nil"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("blue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTColor.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrappedBlue != nil"));

  }
  objc_msgSend(v7, "floatValue");
  v11 = v10;
  objc_msgSend(v8, "floatValue");
  v13 = v12;
  objc_msgSend(v9, "floatValue");
  v15 = v14;
  objc_msgSend(v6, "floatValue");
  v17 = -[MTRGBColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v13, v15, v16);

  return v17;
}

- (CGColor)CGColor
{
  CGColor *result;
  double green;
  double blue;
  double alpha;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  result = self->super._cachedColor;
  if (!result)
  {
    green = self->_green;
    blue = self->_blue;
    alpha = self->_alpha;
    components[0] = self->_red;
    components[1] = green;
    components[2] = blue;
    components[3] = alpha;
    if (RGBColorSpace_onceToken != -1)
      dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_107);
    result = CGColorCreate((CGColorSpaceRef)RGBColorSpace___RGBColorSpace, components);
    self->super._cachedColor = result;
  }
  return result;
}

- (id)colorDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("red");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_red);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("green");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_green);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("blue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("alpha");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_alpha);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRGBColor)colorWithAlphaComponent:(double)a3
{
  return (MTRGBColor *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", self->_red, self->_green, self->_blue, a3);
}

- (MTRGBColor)colorWithAdditionalAlphaComponent:(double)a3
{
  return -[MTRGBColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", fmax(fmin(self->_alpha + a3, 1.0), 0.0));
}

- (id)colorBlendedWithColor:(id)a3
{
  MTRGBColor *v4;
  double *v5;
  double *v6;
  double alpha;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = self;
  if (a3)
  {
    objc_msgSend(a3, "_rgbColor");
    v5 = (double *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    alpha = v4->_alpha;
    v8 = v5[5];
    v9 = 1.0;
    v10 = 1.0 - alpha;
    v11 = alpha + v8 * (1.0 - alpha);
    v12 = 1.0;
    v13 = 1.0;
    if (v11 != 0.0)
    {
      v9 = (alpha * v4->_red + v8 * v5[2] * v10) / v11;
      v12 = (alpha * v4->_green + v8 * v5[3] * v10) / v11;
      v13 = (alpha * v4->_blue + v8 * v5[4] * v10) / v11;
    }
    +[MTColor colorWithRed:green:blue:alpha:](MTColor, "colorWithRed:green:blue:alpha:", v9, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (MTRGBColor *)v14;
  }
  return v4;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  return (CAColorMatrix *)CAColorMatrixMakeColorSourceOver();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; red: %f; green: %f; blue: %f; alpha: %f>"),
               objc_opt_class(),
               self,
               *(_QWORD *)&self->_red,
               *(_QWORD *)&self->_green,
               *(_QWORD *)&self->_blue,
               *(_QWORD *)&self->_alpha);
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end
