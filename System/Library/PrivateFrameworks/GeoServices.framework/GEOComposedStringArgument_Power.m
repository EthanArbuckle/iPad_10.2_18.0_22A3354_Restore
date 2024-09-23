@implementation GEOComposedStringArgument_Power

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  _DWORD *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Power;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v12, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "numberData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasValue");

    if (v7)
    {
      objc_msgSend(v5, "setHasDefaultValue:", 1);
      objc_msgSend(v4, "numberData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v5[8] = v9;

    }
    v10 = v5;
  }

  return v5;
}

- (void)setOverrideValue:(float)a3
{
  -[GEOComposedStringArgument setHasOverrideValue:](self, "setHasOverrideValue:", 1);
  self->_overrideValue = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  _BYTE *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  float v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue")
    || v4 && v4[9] && -[GEOComposedStringArgument hasDefaultValue](self, "hasDefaultValue"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3760]);
    objc_msgSend(v5, "numberFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumFractionDigits:", 0);

    v7 = -[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue");
    v8 = 1;
    if (!v7)
      v8 = 0;
    v9 = *(float *)((char *)&self->super.super.isa + OBJC_IVAR___GEOComposedStringArgument_Power__defaultValue[v8]);
    v10 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithDoubleValue:unit:", v11, v9);

    objc_msgSend(v5, "stringFromMeasurement:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Power;
  result = -[GEOComposedStringArgument copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 8) = LODWORD(self->_defaultValue);
  *((_DWORD *)result + 9) = LODWORD(self->_overrideValue);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Power;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_defaultValue"), self->_defaultValue, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_overrideValue"), self->_overrideValue);

}

- (GEOComposedStringArgument_Power)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Power *v5;
  double v6;
  double v7;
  GEOComposedStringArgument_Power *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Power;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_defaultValue"));
    *(float *)&v6 = v6;
    v5->_defaultValue = *(float *)&v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_overrideValue"));
    *(float *)&v7 = v7;
    v5->_overrideValue = *(float *)&v7;
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (float *)v4;
    v8.receiver = self;
    v8.super_class = (Class)GEOComposedStringArgument_Power;
    v6 = -[GEOComposedStringArgument isEqual:](&v8, sel_isEqual_, v5)
      && self->_defaultValue == v5[8]
      && self->_overrideValue == v5[9];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (float)overrideValue
{
  return self->_overrideValue;
}

@end
