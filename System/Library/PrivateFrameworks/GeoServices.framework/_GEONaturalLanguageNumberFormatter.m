@implementation _GEONaturalLanguageNumberFormatter

- (id)stringFromDistanceMeasurement:(id)a3 roundedDistanceMeasurement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL8 v19;
  _GEONaturalLanguageNumberFormatter *v20;
  id v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

LABEL_5:
    objc_msgSend(v7, "doubleValue");
    v15 = v14;
    if (v14 >= 9.9)
    {
      v20 = self;
      v21 = v7;
      v19 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v6, "unit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17 || (objc_msgSend(v6, "doubleValue"), v18 >= 0.875) && v18 <= 1.0)
    {
LABEL_9:
      v26 = 0;
      if (!-[_GEONaturalLanguageNumberFormatter _isNumberNearNaturalNumber:outIsExact:](self, "_isNumberNearNaturalNumber:outIsExact:", &v26, v15))
      {
        if (vcvtmd_s64_f64(v15) - 1 > 8
          || !-[_GEONaturalLanguageNumberFormatter _isHalfDecimal:outIsExact:](self, "_isHalfDecimal:outIsExact:", &v26, v15))
        {
          goto LABEL_3;
        }
        -[_GEONaturalLanguageNumberFormatter _string_nAndAHalfDistance:isApproximate:](self, "_string_nAndAHalfDistance:isApproximate:", v7, v26 == 0);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v13 = (void *)v22;
        goto LABEL_14;
      }
      v19 = v26 == 0;
      v20 = self;
      v21 = v7;
LABEL_12:
      -[_GEONaturalLanguageNumberFormatter _string_nDistance:isApproximate:](v20, "_string_nDistance:isApproximate:", v21, v19);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v18 < 0.625 || v18 >= 0.875)
    {
      if (v18 < 0.375 || v18 >= 0.625)
      {
        if (v18 >= 0.375)
          goto LABEL_9;
        +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "distanceAQuarterMile");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "distanceHalfAMile");
        v25 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "distanceThreeQuartersOfAMile");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v25;

    goto LABEL_14;
  }
  v10 = (void *)v9;
  objc_msgSend(v6, "unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
    goto LABEL_5;
LABEL_3:
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)_string_nDistance:(id)a3 isApproximate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[_GEONaturalLanguageNumberFormatter locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  objc_msgSend(v7, "setUnitOptions:", 1);
  objc_msgSend(v7, "setUnitStyle:", 3);
  objc_msgSend(v7, "numberFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoundingMode:", 4);

  objc_msgSend(v7, "numberFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaximumFractionDigits:", 0);

  objc_msgSend(v7, "stringFromMeasurement:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "aboutNDistance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v17, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (id)_string_nAndAHalfDistance:(id)a3 isApproximate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 == v7)
  {
    if (v4)
      objc_msgSend(v8, "aboutDistanceAndAHalfMiles");
    else
      objc_msgSend(v8, "distanceAndAHalfMiles");
  }
  else if (v4)
  {
    objc_msgSend(v8, "aboutDistanceAndAHalfKilometers");
  }
  else
  {
    objc_msgSend(v8, "distanceAndAHalfKilometers");
  }
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;

  objc_msgSend(v5, "doubleValue");
  v13 = v12;

  LODWORD(v14) = vcvtmd_s64_f64(v13);
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%d"), &v17, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_isHalfDecimal:(double)a3 outIsExact:(BOOL *)a4
{
  int v5;
  unsigned int v6;

  v5 = -[_GEONaturalLanguageNumberFormatter _tenthsDecimalPlace:](self, "_tenthsDecimalPlace:", a3);
  v6 = v5 - 4;
  if (a4 && v6 <= 2)
    *a4 = v5 == 5;
  return v6 < 3;
}

- (BOOL)_isNumberNearNaturalNumber:(double)a3 outIsExact:(BOOL *)a4
{
  unsigned int v5;
  BOOL result;

  if ((int)llround(a3) < 1)
    return 0;
  v5 = -[_GEONaturalLanguageNumberFormatter _tenthsDecimalPlace:](self, "_tenthsDecimalPlace:");
  result = 0;
  if (v5 <= 9 && ((1 << v5) & 0x203) != 0)
  {
    if (a4)
      *a4 = v5 == 0;
    return 1;
  }
  return result;
}

- (int)_tenthsDecimalPlace:(double)a3
{
  return llround((a3 - floor(a3)) * 10.0);
}

@end
