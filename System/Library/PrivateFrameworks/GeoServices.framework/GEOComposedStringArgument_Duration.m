@implementation GEOComposedStringArgument_Duration

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Duration;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v14, sel__initWithGeoFormatArgument_, v4);
  if (!v5)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "format") != 3 && objc_msgSend(v4, "format") != 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoFormatArgument.format == GEOFormatArgument_Formatter_DURATION_SHORT_UNITS || geoFormatArgument.format == GEOFormatArgument_Formatter_DURATION_MEDIUM_UNITS", v13, 2u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "hasValInt1"))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3758]);
    v7 = (double)objc_msgSend(v4, "valInt1");
    objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithDoubleValue:unit:", v8, v7);
    v10 = (void *)v5[4];
    v5[4] = v9;

  }
  v11 = v5;
LABEL_7:

  return v11;
}

- (double)overrideValue
{
  double result;

  -[NSMeasurement doubleValue](self->_overrideValue, "doubleValue");
  return result;
}

- (void)setOverrideValue:(double)a3
{
  id v5;
  NSMeasurement *v6;
  NSMeasurement *overrideValue;
  id v8;

  v5 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSMeasurement *)objc_msgSend(v5, "initWithDoubleValue:unit:", v8, a3);
  overrideValue = self->_overrideValue;
  self->_overrideValue = v6;

}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSMeasurement *overrideValue;
  NSMeasurement *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  overrideValue = self->_overrideValue;
  if (overrideValue || v4 && *((_BYTE *)v4 + 9) && (overrideValue = self->_defaultValue) != 0)
  {
    v7 = overrideValue;
    -[NSMeasurement doubleValue](v7, "doubleValue");
    v9 = v8;
    if (-[GEOComposedStringArgument type](self, "type") == 3)
      v10 = 2;
    else
      v10 = 3;
    GEOStringForDuration(v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  v10.super_class = (Class)GEOComposedStringArgument_Duration;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSMeasurement copy](self->_defaultValue, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSMeasurement copy](self->_overrideValue, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Duration;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("_defaultValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideValue, CFSTR("_overrideValue"));

}

- (GEOComposedStringArgument_Duration)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Duration *v5;
  uint64_t v6;
  NSMeasurement *defaultValue;
  uint64_t v8;
  NSMeasurement *overrideValue;
  GEOComposedStringArgument_Duration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Duration;
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
  NSMeasurement *overrideValue;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Duration;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && ((v6 = (void *)v5[4], v7 = self->_defaultValue, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      overrideValue = self->_overrideValue;
      v12 = v5[5];
      v13 = overrideValue;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
