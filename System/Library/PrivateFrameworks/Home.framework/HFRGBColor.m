@implementation HFRGBColor

- (BOOL)isEqual:(id)a3
{
  HFRGBColor *v4;
  HFRGBColor *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;

  v4 = (HFRGBColor *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFRGBColor red](self, "red");
      v7 = v6;
      -[HFRGBColor red](v5, "red");
      if (vabds_f32(v7, v8) >= 0.001
        || (-[HFRGBColor green](self, "green"), v10 = v9, -[HFRGBColor green](v5, "green"), vabds_f32(v10, v11) >= 0.001))
      {
        v15 = 0;
      }
      else
      {
        -[HFRGBColor blue](self, "blue");
        v13 = v12;
        -[HFRGBColor blue](v5, "blue");
        v15 = vabds_f32(v13, v14) < 0.001;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  float v3;
  signed int v4;
  float v5;
  uint64_t v6;
  float v7;

  -[HFRGBColor red](self, "red");
  v4 = vcvts_n_s32_f32(v3, 0x10uLL);
  -[HFRGBColor green](self, "green");
  v6 = 13 * ((int)vcvts_n_s32_f32(v5, 0x10uLL) + 13 * v4);
  -[HFRGBColor blue](self, "blue");
  return v6 + (int)vcvts_n_s32_f32(v7, 0x10uLL);
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

- (HFRGBColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  HFRGBColor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFRGBColor;
  result = -[HFRGBColor init](&v9, sel_init);
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
  }
  return result;
}

- (HFRGBColor)initWithHue:(float)a3 saturation:(float)a4 brightness:(float)a5
{
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v10 = 0.0;
  HFConvertHSBToRGB(&v12, &v11, &v10, a3, a4, a5);
  HIDWORD(v7) = HIDWORD(v11);
  HIDWORD(v6) = HIDWORD(v12);
  *(float *)&v6 = v12;
  *(float *)&v7 = v11;
  HIDWORD(v8) = HIDWORD(v10);
  *(float *)&v8 = v10;
  return -[HFRGBColor initWithRed:green:blue:](self, "initWithRed:green:blue:", v6, v7, v8);
}

- (HFRGBColor)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRed_green_blue_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorPrimitive.m"), 21, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFRGBColor init]",
    v5);

  return 0;
}

- (HFRGBColor)initWithUIColor:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  HFRGBColor *v9;
  void *v11;
  double v12;
  double v13;
  double v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorPrimitive.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("color"));

  }
  v13 = 0.0;
  v14 = 0.0;
  v12 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v14, &v13, &v12, 0);
  HIDWORD(v7) = HIDWORD(v13);
  HIDWORD(v6) = HIDWORD(v14);
  *(float *)&v6 = v14;
  *(float *)&v7 = v13;
  HIDWORD(v8) = HIDWORD(v12);
  *(float *)&v8 = v12;
  v9 = -[HFRGBColor initWithRed:green:blue:](self, "initWithRed:green:blue:", v6, v7, v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFRGBColor red](self, "red");
  v6 = v5;
  -[HFRGBColor green](self, "green");
  v8 = v7;
  -[HFRGBColor blue](self, "blue");
  LODWORD(v10) = v9;
  LODWORD(v11) = v6;
  LODWORD(v12) = v8;
  return (id)objc_msgSend(v4, "initWithRed:green:blue:", v11, v12, v10);
}

- (UIColor)UIColor
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;

  v3 = (void *)MEMORY[0x1E0CEA478];
  -[HFRGBColor red](self, "red");
  v5 = v4;
  -[HFRGBColor green](self, "green");
  v7 = v6;
  -[HFRGBColor blue](self, "blue");
  return (UIColor *)objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v5, v7, v8, 1.0);
}

- (void)getHue:(float *)a3 saturation:(float *)a4 brightness:(float *)a5
{
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;

  v18 = 0.0;
  v19 = 0.0;
  v17 = 0.0;
  -[HFRGBColor red](self, "red");
  v10 = v9;
  -[HFRGBColor green](self, "green");
  v12 = v11;
  -[HFRGBColor blue](self, "blue");
  HFConvertRGBToHSB(&v19, &v18, &v17, v10, v12, v13);
  if (a3)
  {
    v14 = v19;
    *a3 = v14;
  }
  if (a4)
  {
    v15 = v18;
    *a4 = v15;
  }
  if (a5)
  {
    v16 = v17;
    *a5 = v16;
  }
}

- (id)valueDescription
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFRGBColor red](self, "red");
  v5 = v4;
  -[HFRGBColor green](self, "green");
  v7 = v6;
  -[HFRGBColor blue](self, "blue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("RGB(%f,%f,%f)"), *(_QWORD *)&v5, *(_QWORD *)&v7, v8);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HFRGBColor;
  -[HFRGBColor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRGBColor valueDescription](self, "valueDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
