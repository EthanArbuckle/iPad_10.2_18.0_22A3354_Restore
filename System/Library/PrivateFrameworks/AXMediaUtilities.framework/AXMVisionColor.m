@implementation AXMVisionColor

+ (id)colorWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  _BYTE *v8;

  v8 = objc_alloc_init((Class)a1);
  v8[8] = a3;
  v8[9] = a4;
  v8[10] = a5;
  objc_msgSend(v8, "_getHue:saturation:brightness:", v8 + 11, v8 + 12, v8 + 13);
  return v8;
}

+ (id)colorWithHue:(unsigned __int8)a3 saturation:(unsigned __int8)a4 brightness:(unsigned __int8)a5
{
  _BYTE *v8;

  v8 = objc_alloc_init((Class)a1);
  v8[11] = a3;
  v8[12] = a4;
  v8[13] = a5;
  objc_msgSend(v8, "_getRed:green:blue:", v8 + 8, v8 + 9, v8 + 10);
  return v8;
}

+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  v5 = fmax(a3, 0.0);
  v6 = fmax(a4, 0.0);
  v7 = fmax(a5, 0.0);
  if (v5 >= 360.0)
    v8 = 255.0;
  else
    v8 = v5 * 255.0 / 360.0;
  v9 = (int)v8;
  if (v6 >= 1.0)
    v10 = 255.0;
  else
    v10 = v6 * 255.0;
  if (v7 >= 1.0)
    v11 = 255.0;
  else
    v11 = v7 * 255.0;
  return (id)objc_msgSend(a1, "colorWithHue:saturation:brightness:", v9, (int)v10, (int)v11);
}

- (AXMVisionColor)init
{
  AXMVisionColor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMVisionColor;
  result = -[AXMVisionColor init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_saturation = 0;
    *(_DWORD *)&result->_red = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> [r:%u g:%u b:%u] [h:%u s:%u b:%u]"), v5, self, self->_red, self->_green, self->_blue, self->_hue, self->_saturation, self->_brightness);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXMVisionColor *v4;
  BOOL v5;

  v4 = (AXMVisionColor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AXMVisionColor isEqualToAXMVisionColor:](self, "isEqualToAXMVisionColor:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionColor:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  v5 = v4 && self->_red == v4[8] && self->_green == v4[9] && self->_blue == v4[10];

  return v5;
}

- (unint64_t)hash
{
  return *(unsigned __int16 *)&self->_red | ((unint64_t)self->_blue << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionColor)initWithCoder:(id)a3
{
  id v4;
  AXMVisionColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[AXMVisionColor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("red"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5->_red = objc_msgSend(v6, "unsignedCharValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("green"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v5->_green = objc_msgSend(v8, "unsignedCharValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v5->_blue = objc_msgSend(v9, "unsignedCharValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v5->_hue = objc_msgSend(v10, "unsignedCharValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saturation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v5->_saturation = objc_msgSend(v11, "unsignedCharValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brightness"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v5->_brightness = objc_msgSend(v12, "unsignedCharValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t red;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  red = self->_red;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedChar:", red);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("red"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_green);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("green"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_blue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("blue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_hue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("hue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_saturation);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("saturation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_brightness);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("brightness"));

}

- (void)_getHue:(char *)a3 saturation:(char *)a4 brightness:(char *)a5
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v11 = 0.0;
  LOBYTE(v5) = self->_red;
  LOBYTE(v6) = self->_green;
  LOBYTE(v7) = self->_blue;
  _AXMRGBToHSB(&v13, &v12, &v11, (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0);
  *a3 = (int)(v13 * 255.0);
  *a4 = (int)(v12 * 255.0);
  *a5 = (int)(v11 * 255.0);
}

- (void)_getRed:(char *)a3 green:(char *)a4 blue:(char *)a5
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v11 = 0.0;
  LOBYTE(v5) = self->_hue;
  LOBYTE(v6) = self->_saturation;
  LOBYTE(v7) = self->_brightness;
  _AXMHSBToRGB(&v13, &v12, &v11, (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0);
  *a3 = (int)(v13 * 255.0);
  *a4 = (int)(v12 * 255.0);
  *a5 = (int)(v11 * 255.0);
}

- (double)euclidianDistanceHSV:(id)a3
{
  id v4;
  double v5;
  double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a3;
  -[AXMVisionColor saturationFloat](self, "saturationFloat");
  v6 = v5;
  -[AXMVisionColor hueRadians](self, "hueRadians");
  v8 = v6 * cos(v7);
  -[AXMVisionColor saturationFloat](self, "saturationFloat");
  v10 = v9;
  -[AXMVisionColor hueRadians](self, "hueRadians");
  v12 = v10 * sin(v11);
  objc_msgSend(v4, "saturationFloat");
  v14 = v13;
  objc_msgSend(v4, "hueRadians");
  v16 = v14 * cos(v15);
  objc_msgSend(v4, "saturationFloat");
  v18 = v17;
  objc_msgSend(v4, "hueRadians");
  v20 = v8 - v16;
  v21 = v12 - v18 * sin(v19);
  -[AXMVisionColor brightnessFloat](self, "brightnessFloat");
  v23 = v22;
  objc_msgSend(v4, "brightnessFloat");
  v25 = v24;

  return sqrt(v21 * v21 + v20 * v20 + (v23 - v25) * (v23 - v25));
}

- (double)euclidianDistanceHS:(id)a3
{
  id v4;
  double v5;
  double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  long double v21;

  v4 = a3;
  -[AXMVisionColor saturationFloat](self, "saturationFloat");
  v6 = v5;
  -[AXMVisionColor hueRadians](self, "hueRadians");
  v8 = v6 * cos(v7);
  -[AXMVisionColor saturationFloat](self, "saturationFloat");
  v10 = v9;
  -[AXMVisionColor hueRadians](self, "hueRadians");
  v12 = v10 * sin(v11);
  objc_msgSend(v4, "saturationFloat");
  v14 = v13;
  objc_msgSend(v4, "hueRadians");
  v16 = v14 * cos(v15);
  objc_msgSend(v4, "saturationFloat");
  v18 = v17;
  objc_msgSend(v4, "hueRadians");
  v20 = v19;

  v21 = sin(v20);
  return sqrt((v12 - v18 * v21) * (v12 - v18 * v21) + (v8 - v16) * (v8 - v16));
}

- (double)redFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_red;
  return (double)v2 / 255.0;
}

- (double)greenFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_green;
  return (double)v2 / 255.0;
}

- (double)blueFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_blue;
  return (double)v2 / 255.0;
}

- (double)hueFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_hue;
  return (double)v2 / 255.0;
}

- (double)hueRadians
{
  double v2;

  -[AXMVisionColor hueFloat](self, "hueFloat");
  return (v2 + v2) * 3.14159265;
}

- (double)saturationFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_saturation;
  return (double)v2 / 255.0;
}

- (double)brightnessFloat
{
  unint64_t v2;

  LOBYTE(v2) = self->_brightness;
  return (double)v2 / 255.0;
}

@end
