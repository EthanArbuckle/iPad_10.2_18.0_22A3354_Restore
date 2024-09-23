@implementation GEOComposedStringArgument_Distance

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringArgument_Distance;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v15, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "hasValInt1"))
    {
      objc_msgSend(v5, "setHasDefaultValue:", 1);
      v6 = objc_alloc(MEMORY[0x1E0CB3758]);
      v7 = (double)objc_msgSend(v4, "valInt1");
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "initWithDoubleValue:unit:", v8, v7);
      v10 = (void *)*((_QWORD *)v5 + 4);
      *((_QWORD *)v5 + 4) = v9;

    }
    *((_BYTE *)v5 + 56) = 1;
    objc_msgSend(v4, "measurementData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "measurementData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v5 + 56) = objc_msgSend(v12, "enableUnitScaling");

    }
    v13 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSMeasurement *overrideValue;
  _BOOL4 v7;
  BOOL v8;
  NSMeasurement *v9;
  void *v10;
  unint64_t formatOptions;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (self->_defaultValue)
  {
    if (v4 && *((_BYTE *)v4 + 9))
    {
      overrideValue = self->_overrideValue;
      goto LABEL_11;
    }
    v7 = self->_formatOptions != 0;
  }
  else
  {
    v7 = 0;
  }
  overrideValue = self->_overrideValue;
  if (overrideValue)
    v8 = 0;
  else
    v8 = !v7;
  if (v8)
  {
    v12 = 0;
    goto LABEL_17;
  }
LABEL_11:
  if (!overrideValue)
    overrideValue = self->_defaultValue;
  v9 = overrideValue;
  +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_allowUnitConversion)
    formatOptions = self->_formatOptions;
  else
    formatOptions = self->_formatOptions | 0x20;
  _GEOStringForDistanceMeasurement(v9, v10, formatOptions, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Distance;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSMeasurement copy](self->_defaultValue, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSMeasurement copy](self->_overrideValue, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v4[6] = self->_formatOptions;
  *((_BYTE *)v4 + 56) = self->_allowUnitConversion;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Distance;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("_defaultValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideValue, CFSTR("_overrideValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_formatOptions, CFSTR("_formatOptions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowUnitConversion, CFSTR("_allowUnitConversion"));

}

- (GEOComposedStringArgument_Distance)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Distance *v5;
  uint64_t v6;
  NSMeasurement *defaultValue;
  uint64_t v8;
  NSMeasurement *overrideValue;
  GEOComposedStringArgument_Distance *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Distance;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSMeasurement *)v8;

    v5->_formatOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_formatOptions"));
    v5->_allowUnitConversion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowUnitConversion"));
    v10 = v5;
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
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)GEOComposedStringArgument_Distance;
    if (!-[GEOComposedStringArgument isEqual:](&v18, sel_isEqual_, v5))
      goto LABEL_10;
    v6 = (void *)v5[4];
    v7 = self->_defaultValue;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_10;
    }
    if (((v11 = (void *)v5[5], v12 = self->_overrideValue, v13 = v11, !(v12 | v13))
       || (v14 = (void *)v13, v15 = objc_msgSend((id)v12, "isEqual:", v13),
                              v14,
                              (id)v12,
                              v15))
      && self->_formatOptions == v5[6])
    {
      v16 = self->_allowUnitConversion == *((unsigned __int8 *)v5 + 56);
    }
    else
    {
LABEL_10:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSMeasurement)overrideValue
{
  return self->_overrideValue;
}

- (void)setOverrideValue:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValue, a3);
}

- (unint64_t)formatOptions
{
  return self->_formatOptions;
}

- (void)setFormatOptions:(unint64_t)a3
{
  self->_formatOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
