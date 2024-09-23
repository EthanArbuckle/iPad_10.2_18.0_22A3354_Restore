@implementation GEOComposedStringArgument_Price

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedStringArgument_Price;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v13, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "hasPrice"))
    {
      objc_msgSend(v5, "setHasDefaultValue:", 1);
      objc_msgSend(v4, "price");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "amount");
      *((_DWORD *)v5 + 8) = v7;

    }
    objc_msgSend(v4, "price");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currencyCode");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v9;

    v11 = v5;
  }

  return v5;
}

- (void)setOverrideAmount:(float)a3
{
  -[GEOComposedStringArgument setHasOverrideValue:](self, "setHasOverrideValue:", 1);
  self->_overrideAmount = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  _BYTE *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *overrideCurrencyCode;
  NSString *v9;
  _BOOL4 v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue")
    || v4 && v4[9] && -[GEOComposedStringArgument hasDefaultValue](self, "hasDefaultValue"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v7);

    objc_msgSend(v5, "setNumberStyle:", 2);
    overrideCurrencyCode = self->_overrideCurrencyCode;
    if (!overrideCurrencyCode)
      overrideCurrencyCode = self->_defaultCurrencyCode;
    v9 = overrideCurrencyCode;
    objc_msgSend(v5, "setCurrencyCode:", v9);
    if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("CNY")))
      objc_msgSend(v5, "setMinimumFractionDigits:", 0);
    v10 = -[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue");
    v12 = 2;
    if (!v10)
      v12 = 0;
    LODWORD(v11) = *(_DWORD *)((char *)&self->super.super.isa
                             + OBJC_IVAR___GEOComposedStringArgument_Price__defaultAmount[v12]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument_Price;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_DWORD *)v4 + 8) = LODWORD(self->_defaultAmount);
  objc_storeStrong((id *)v4 + 5, self->_defaultCurrencyCode);
  *((_DWORD *)v4 + 12) = LODWORD(self->_overrideAmount);
  objc_storeStrong((id *)v4 + 7, self->_overrideCurrencyCode);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Price;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_defaultAmount"), self->_defaultAmount, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultCurrencyCode, CFSTR("_defaultCurrencyCode"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_overrideAmount"), self->_overrideAmount);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideCurrencyCode, CFSTR("_overrideCurrencyCode"));

}

- (GEOComposedStringArgument_Price)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Price *v5;
  double v6;
  uint64_t v7;
  NSString *defaultCurrencyCode;
  double v9;
  uint64_t v10;
  NSString *overrideCurrencyCode;
  GEOComposedStringArgument_Price *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Price;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_defaultAmount"));
    *(float *)&v6 = v6;
    v5->_defaultAmount = *(float *)&v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultCurrencyCode"));
    v7 = objc_claimAutoreleasedReturnValue();
    defaultCurrencyCode = v5->_defaultCurrencyCode;
    v5->_defaultCurrencyCode = (NSString *)v7;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_overrideAmount"));
    *(float *)&v9 = v9;
    v5->_overrideAmount = *(float *)&v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideCurrencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    overrideCurrencyCode = v5->_overrideCurrencyCode;
    v5->_overrideCurrencyCode = (NSString *)v10;

    v12 = v5;
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
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSString *overrideCurrencyCode;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (float *)v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Price;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && self->_defaultAmount == v5[8]
      && ((v6 = (void *)*((_QWORD *)v5 + 5),
           v7 = self->_defaultCurrencyCode,
           v8 = v6,
           !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10))
      && self->_overrideAmount == v5[12])
    {
      overrideCurrencyCode = self->_overrideCurrencyCode;
      v12 = *((_QWORD *)v5 + 7);
      v13 = overrideCurrencyCode;
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

- (float)overrideAmount
{
  return self->_overrideAmount;
}

- (NSString)overrideCurrencyCode
{
  return self->_overrideCurrencyCode;
}

- (void)setOverrideCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCurrencyCode, 0);
  objc_storeStrong((id *)&self->_defaultCurrencyCode, 0);
}

@end
