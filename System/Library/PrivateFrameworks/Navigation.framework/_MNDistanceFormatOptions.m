@implementation _MNDistanceFormatOptions

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[_MNDistanceFormatOptions minimumFractionDigits](self, "minimumFractionDigits");
    if (v6 == objc_msgSend(v5, "minimumFractionDigits")
      && (v7 = -[_MNDistanceFormatOptions maximumFractionDigits](self, "maximumFractionDigits"),
          v7 == objc_msgSend(v5, "maximumFractionDigits"))
      && (v8 = -[_MNDistanceFormatOptions metric](self, "metric"), v8 == objc_msgSend(v5, "metric"))
      && (v9 = -[_MNDistanceFormatOptions yards](self, "yards"), v9 == objc_msgSend(v5, "yards"))
      && (v10 = -[_MNDistanceFormatOptions abbreviateUnits](self, "abbreviateUnits"),
          v10 == objc_msgSend(v5, "abbreviateUnits"))
      && (v11 = -[_MNDistanceFormatOptions spoken](self, "spoken"), v11 == objc_msgSend(v5, "spoken"))
      && (v12 = -[_MNDistanceFormatOptions rounding](self, "rounding"), v12 == objc_msgSend(v5, "rounding")))
    {
      -[_MNDistanceFormatOptions unitLength](self, "unitLength");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unitLength");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v14))
      {
        -[_MNDistanceFormatOptions locale](self, "locale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "locale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[_MNDistanceFormatOptions minimumFractionDigits](self, "minimumFractionDigits");
  v4 = -[_MNDistanceFormatOptions maximumFractionDigits](self, "maximumFractionDigits") ^ v3;
  v5 = v4 ^ -[_MNDistanceFormatOptions metric](self, "metric");
  v6 = -[_MNDistanceFormatOptions yards](self, "yards");
  v7 = v5 ^ v6 ^ -[_MNDistanceFormatOptions abbreviateUnits](self, "abbreviateUnits");
  v8 = -[_MNDistanceFormatOptions spoken](self, "spoken");
  v9 = v8 ^ -[_MNDistanceFormatOptions rounding](self, "rounding");
  -[_MNDistanceFormatOptions unitLength](self, "unitLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  -[_MNDistanceFormatOptions locale](self, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (unint64_t)minimumFractionDigits
{
  return self->_minimumFractionDigits;
}

- (void)setMinimumFractionDigits:(unint64_t)a3
{
  self->_minimumFractionDigits = a3;
}

- (unint64_t)maximumFractionDigits
{
  return self->_maximumFractionDigits;
}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  self->_maximumFractionDigits = a3;
}

- (BOOL)metric
{
  return self->_metric;
}

- (void)setMetric:(BOOL)a3
{
  self->_metric = a3;
}

- (BOOL)yards
{
  return self->_yards;
}

- (void)setYards:(BOOL)a3
{
  self->_yards = a3;
}

- (BOOL)abbreviateUnits
{
  return self->_abbreviateUnits;
}

- (void)setAbbreviateUnits:(BOOL)a3
{
  self->_abbreviateUnits = a3;
}

- (BOOL)spoken
{
  return self->_spoken;
}

- (void)setSpoken:(BOOL)a3
{
  self->_spoken = a3;
}

- (int64_t)rounding
{
  return self->_rounding;
}

- (void)setRounding:(int64_t)a3
{
  self->_rounding = a3;
}

- (NSUnitLength)unitLength
{
  return self->_unitLength;
}

- (void)setUnitLength:(id)a3
{
  objc_storeStrong((id *)&self->_unitLength, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unitLength, 0);
}

@end
