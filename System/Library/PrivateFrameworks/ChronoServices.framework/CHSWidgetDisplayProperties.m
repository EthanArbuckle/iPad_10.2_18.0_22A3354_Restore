@implementation CHSWidgetDisplayProperties

- (double)scale
{
  return self->_scale;
}

- (unint64_t)colorGamut
{
  return self->_colorGamut;
}

- (CHSWidgetDisplayProperties)initWithScale:(double)a3 colorGamut:(unint64_t)a4
{
  CHSWidgetDisplayProperties *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetDisplayProperties;
  result = -[CHSWidgetDisplayProperties init](&v12, sel_init);
  if (result)
  {
    result->_scale = a3;
    result->_colorGamut = a4;
    __asm { FMOV            V0.2D, #1.0 }
    result->_size = _Q0;
  }
  return result;
}

- (CHSWidgetDisplayProperties)initWithSize:(CGSize)a3 scale:(double)a4 colorGamut:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CHSWidgetDisplayProperties *result;

  height = a3.height;
  width = a3.width;
  result = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", a5, a4);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
  }
  return result;
}

- (CHSWidgetDisplayProperties)initWithDisplayConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  CHSWidgetDisplayProperties *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "colorGamut");
  objc_msgSend(v4, "pointScale");
  v6 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", v5 != 1);

  return v6;
}

- (CHSWidgetDisplayProperties)initWithWidgetDisplayProperties:(id)a3
{
  id v4;
  double v5;
  CHSWidgetDisplayProperties *v6;

  v4 = a3;
  objc_msgSend(v4, "scale");
  v6 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", objc_msgSend(v4, "colorGamut"), v5);

  return v6;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double scale;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t colorGamut;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  scale = self->_scale;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__CHSWidgetDisplayProperties_isEqual___block_invoke;
  v23[3] = &unk_1E2A5A4E0;
  v12 = v9;
  v24 = v12;
  v13 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v23, scale);
  colorGamut = self->_colorGamut;
  v18 = v11;
  v19 = 3221225472;
  v20 = __38__CHSWidgetDisplayProperties_isEqual___block_invoke_2;
  v21 = &unk_1E2A5A558;
  v15 = v12;
  v22 = v15;
  v16 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", colorGamut, &v18);
  LOBYTE(colorGamut) = objc_msgSend(v5, "isEqual", v18, v19, v20, v21);

  return colorGamut;
}

double __38__CHSWidgetDisplayProperties_isEqual___block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __38__CHSWidgetDisplayProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGFloat:", self->_scale);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_colorGamut);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("scale"), 2, self->_scale);
  if (self->_colorGamut)
    v5 = CFSTR("sRGB");
  else
    v5 = CFSTR("P3");
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("gamut"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)comparedTo:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[CHSWidgetDisplayProperties hash](self, "hash");
  if (v5 >= objc_msgSend(v4, "hash"))
  {
    v7 = -[CHSWidgetDisplayProperties hash](self, "hash");
    v6 = v7 > objc_msgSend(v4, "hash");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (id)fallbackDisplayProperties
{
  void *v3;
  CHSWidgetDisplayProperties *v4;
  double i;
  CHSWidgetDisplayProperties *v6;
  CHSWidgetDisplayProperties *v7;
  CHSWidgetDisplayProperties *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_colorGamut)
    v4 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", 0, self->_scale);
  else
    v4 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", 1, self->_scale);
  objc_msgSend(v3, "addObject:", v4);

  for (i = 3.0; i > self->_scale; i = i + -1.0)
  {
    if (self->_colorGamut)
    {
      v6 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", self->_colorGamut, i);
      objc_msgSend(v3, "addObject:", v6);

      v7 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", 0, i);
    }
    else
    {
      v8 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", self->_colorGamut, i);
      objc_msgSend(v3, "addObject:", v8);

      v7 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:]([CHSWidgetDisplayProperties alloc], "initWithScale:colorGamut:", 1, i);
    }
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double scale;
  void *v6;
  id v7;

  v4 = a3;
  scale = self->_scale;
  *(float *)&scale = scale;
  v7 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("scale"), scale);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_colorGamut);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("colorGamut"));

}

- (CHSWidgetDisplayProperties)initWithCoder:(id)a3
{
  id v4;
  float v5;
  float v6;
  void *v7;
  uint64_t v8;
  double v9;
  CHSWidgetDisplayProperties *v10;
  CHSWidgetDisplayProperties *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("scale"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorGamut"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = v6;

  v10 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_scale = v9;
    v10->_colorGamut = v8;
  }

  return v11;
}

@end
