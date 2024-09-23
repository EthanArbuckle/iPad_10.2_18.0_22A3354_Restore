@implementation GEOComposedStringArgument_Frequency

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _QWORD *v5;
  int v6;
  int v7;
  id v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  _QWORD *v21;
  uint8_t v23[16];
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedStringArgument_Frequency;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v24, sel__initWithGeoFormatArgument_, v4);
  if (!v5)
  {
LABEL_16:
    v21 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "format") != 5 && objc_msgSend(v4, "format") != 6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoFormatArgument.format == GEOFormatArgument_Formatter_FREQUENCY_VALUE || geoFormatArgument.format == GEOFormatArgument_Formatter_FREQUENCY_RANGE", v23, 2u);
    }
    goto LABEL_16;
  }
  v6 = objc_msgSend(v4, "format");
  v7 = objc_msgSend(v4, "hasValInt1");
  if (v6 != 5)
  {
    if (v7)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3758]);
      v14 = (double)objc_msgSend(v4, "valInt1");
      objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "initWithDoubleValue:unit:", v15, v14);
      v17 = (void *)v5[6];
      v5[6] = v16;

    }
    if (!objc_msgSend(v4, "hasValInt2"))
      goto LABEL_12;
    v18 = objc_alloc(MEMORY[0x1E0CB3758]);
    v19 = (double)objc_msgSend(v4, "valInt2");
    objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v18, "initWithDoubleValue:unit:", v10, v19);
    v12 = 8;
    goto LABEL_11;
  }
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3758]);
    v9 = (double)objc_msgSend(v4, "valInt1");
    objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithDoubleValue:unit:", v10, v9);
    v12 = 4;
LABEL_11:
    v20 = (void *)v5[v12];
    v5[v12] = v11;

  }
LABEL_12:
  v21 = v5;
LABEL_13:

  return v21;
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

- (double)overrideMinValue
{
  double result;

  -[NSMeasurement doubleValue](self->_overrideMinValue, "doubleValue");
  return result;
}

- (void)setOverrideMinValue:(double)a3
{
  id v5;
  NSMeasurement *v6;
  NSMeasurement *overrideMinValue;
  id v8;

  v5 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSMeasurement *)objc_msgSend(v5, "initWithDoubleValue:unit:", v8, a3);
  overrideMinValue = self->_overrideMinValue;
  self->_overrideMinValue = v6;

}

- (double)overrideMaxValue
{
  double result;

  -[NSMeasurement doubleValue](self->_overrideMaxValue, "doubleValue");
  return result;
}

- (void)setOverrideMaxValue:(double)a3
{
  id v5;
  NSMeasurement *v6;
  NSMeasurement *overrideMaxValue;
  id v8;

  v5 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSMeasurement *)objc_msgSend(v5, "initWithDoubleValue:unit:", v8, a3);
  overrideMaxValue = self->_overrideMaxValue;
  self->_overrideMaxValue = v6;

}

- (id)_stringReplacementWithOptions:(id)a3
{
  _BYTE *v4;
  int v5;
  int *v6;
  int *v7;
  void *v8;

  v4 = a3;
  v5 = -[GEOComposedStringArgument type](self, "type");
  if (v5 == 5)
  {
    v6 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__overrideValue;
  }
  else
  {
    v6 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__overrideMaxValue;
    if (!self->_overrideMinValue)
    {
      if (!v4 || !v4[9])
        goto LABEL_17;
      goto LABEL_11;
    }
  }
  if (!*(Class *)((char *)&self->super.super.isa + *v6))
  {
    if (!v4 || !v4[9])
      goto LABEL_17;
    if (v5 == 5)
    {
      v7 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__defaultValue;
LABEL_12:
      if (*(Class *)((char *)&self->super.super.isa + *v7))
        goto LABEL_13;
LABEL_17:
      v8 = 0;
      goto LABEL_18;
    }
LABEL_11:
    v7 = &OBJC_IVAR___GEOComposedStringArgument_Frequency__defaultMaxValue;
    if (!self->_defaultMinValue)
      goto LABEL_17;
    goto LABEL_12;
  }
LABEL_13:
  if (-[GEOComposedStringArgument type](self, "type") == 5)
    -[GEOComposedStringArgument_Frequency _replacementValueForFrequencyValue](self, "_replacementValueForFrequencyValue");
  else
    -[GEOComposedStringArgument_Frequency _replacementValueForFrequencyRange](self, "_replacementValueForFrequencyRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v8;
}

- (id)_replacementValueForFrequencyValue
{
  NSMeasurement *overrideValue;
  NSMeasurement *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  overrideValue = self->_overrideValue;
  if (overrideValue)
  {
    v3 = overrideValue;
  }
  else
  {
    v3 = self->_defaultValue;
    if (!v3)
    {
      v13 = 0;
      return v13;
    }
  }
  -[NSMeasurement doubleValue](v3, "doubleValue");
  v5 = llround(v4 / 60.0);
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5 > 89 || v5 == 60)
  {
    objc_msgSend(v6, "setHour:", v5 / 0x3CuLL);
    v5 %= 0x3CuLL;
  }
  else
  {
    objc_msgSend(v6, "setHour:", 0);
  }
  objc_msgSend(v7, "setMinute:", v5);
  if (objc_msgSend(v7, "hour") != 1)
    goto LABEL_33;
  if (!v7)
  {
    objc_msgSend(0, "minute");
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "hour") >= 1 && !objc_msgSend(v7, "minute"))
  {
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frequencySingleValue_OneHour");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_33:
    if (objc_msgSend(v7, "minute") != 1 || !v7 || objc_msgSend(v7, "hour"))
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[GEOComposedString hasLocalizationProvider](GEOComposedString, "hasLocalizationProvider"))
      {
        +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "locale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLocale:", v10);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLocale:", v9);
      }

      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setCalendar:", v8);
      objc_msgSend(v11, "setFormattingContext:", 2);
      objc_msgSend(v11, "setZeroFormattingBehavior:", 14);
      objc_msgSend(v11, "setAllowedUnits:", 96);
      objc_msgSend(v11, "setMaximumUnitCount:", 2);
      if (v7 && objc_msgSend(v7, "hour") >= 1 && objc_msgSend(v7, "minute") > 0)
        v12 = 1;
      else
        v12 = 2;
      objc_msgSend(v11, "setUnitsStyle:", v12);
      objc_msgSend(v11, "stringFromDateComponents:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    }
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frequencySingleValue_OneMinute");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v14;
LABEL_27:

  return v13;
}

- (id)_replacementValueForFrequencyRange
{
  NSMeasurement *overrideMinValue;
  NSMeasurement *v4;
  NSMeasurement *overrideMaxValue;
  NSMeasurement *v6;
  NSMeasurement *v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;

  overrideMinValue = self->_overrideMinValue;
  if (!overrideMinValue)
    overrideMinValue = self->_defaultMinValue;
  v4 = overrideMinValue;
  overrideMaxValue = self->_overrideMaxValue;
  if (!overrideMaxValue)
    overrideMaxValue = self->_defaultMaxValue;
  v6 = overrideMaxValue;
  v7 = v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    -[NSMeasurement doubleValue](v4, "doubleValue");
    v12 = llround(v11 / 60.0);
    -[NSMeasurement doubleValue](v7, "doubleValue");
    v14 = llround(v13 / 60.0);
    if (v12 > 89 || v14 > 89)
    {
      objc_msgSend(v9, "setHour:", v12 / 60);
      objc_msgSend(v9, "setMinute:", v12 % 60);
      objc_msgSend(v10, "setHour:", v14 / 60);
      v14 %= 60;
    }
    else
    {
      objc_msgSend(v9, "setHour:", 0);
      objc_msgSend(v10, "setHour:", 0);
      objc_msgSend(v9, "setMinute:", v12);
    }
    objc_msgSend(v10, "setMinute:", v14);
    if (+[GEOComposedString hasLocalizationProvider](GEOComposedString, "hasLocalizationProvider"))
    {
      +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v9)
      goto LABEL_33;
    if (objc_msgSend(v9, "hour") < 1 || objc_msgSend(v9, "minute"))
      goto LABEL_19;
    if (!v10)
    {
      objc_msgSend(v9, "hour");
      goto LABEL_33;
    }
    if (objc_msgSend(v10, "hour") < 1)
LABEL_19:
      v17 = 0;
    else
      v17 = objc_msgSend(v10, "minute") == 0;
    if (objc_msgSend(v9, "hour") || !v10)
    {
      if (!v17)
        goto LABEL_33;
    }
    else
    {
      v18 = objc_msgSend(v10, "hour");
      if (!v17)
      {
        if (!v18)
        {
          v19 = (void *)objc_opt_new();
          objc_msgSend(v19, "setLocale:", v16);
          +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "frequencyRange_BothOnlyMinutes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "minute"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringFromNumber:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = (void *)MEMORY[0x1E0CB37E8];
          v25 = objc_msgSend(v10, "minute");
LABEL_27:
          objc_msgSend(v24, "numberWithInteger:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringFromNumber:", v28);
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_42:
          v33 = (void *)v29;

          v35 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@%@"), &v35, v23, v33);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_43;
        }
LABEL_33:
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLocale:", v16);
        v28 = (void *)objc_opt_new();
        objc_msgSend(v28, "setCalendar:", v19);
        objc_msgSend(v28, "setFormattingContext:", 2);
        objc_msgSend(v28, "setZeroFormattingBehavior:", 14);
        objc_msgSend(v28, "setAllowedUnits:", 96);
        objc_msgSend(v28, "setMaximumUnitCount:", 2);
        if (v9 && objc_msgSend(v9, "hour") >= 1 && objc_msgSend(v9, "minute") > 0
          || v10 && objc_msgSend(v10, "hour") >= 1 && objc_msgSend(v10, "minute") > 0)
        {
          v31 = 1;
        }
        else
        {
          v31 = 2;
        }
        objc_msgSend(v28, "setUnitsStyle:", v31);
        +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "frequencyRange_MixedUnits");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "stringFromDateComponents:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringFromDateComponents:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      }
    }
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setLocale:", v16);
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frequencyRange_BothOnlyHours");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "hour"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromNumber:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = objc_msgSend(v10, "hour");
    goto LABEL_27;
  }
  v30 = 0;
LABEL_43:

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_Frequency;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSMeasurement copy](self->_defaultValue, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSMeasurement copy](self->_overrideValue, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSMeasurement copy](self->_defaultMinValue, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSMeasurement copy](self->_overrideMinValue, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSMeasurement copy](self->_defaultMaxValue, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  v15 = -[NSMeasurement copy](self->_overrideMaxValue, "copy");
  v16 = (void *)v4[9];
  v4[9] = v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Frequency;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("_defaultValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideValue, CFSTR("_overrideValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultMinValue, CFSTR("_defaultMinValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideMinValue, CFSTR("_overrideMinValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultMaxValue, CFSTR("_defaultMaxValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideMaxValue, CFSTR("_overrideMaxValue"));

}

- (GEOComposedStringArgument_Frequency)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Frequency *v5;
  uint64_t v6;
  NSMeasurement *defaultValue;
  uint64_t v8;
  NSMeasurement *overrideValue;
  uint64_t v10;
  NSMeasurement *defaultMinValue;
  uint64_t v12;
  NSMeasurement *overrideMinValue;
  uint64_t v14;
  NSMeasurement *defaultMaxValue;
  uint64_t v16;
  NSMeasurement *overrideMaxValue;
  GEOComposedStringArgument_Frequency *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedStringArgument_Frequency;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v20, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultMinValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    defaultMinValue = v5->_defaultMinValue;
    v5->_defaultMinValue = (NSMeasurement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideMinValue"));
    v12 = objc_claimAutoreleasedReturnValue();
    overrideMinValue = v5->_overrideMinValue;
    v5->_overrideMinValue = (NSMeasurement *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultMaxValue"));
    v14 = objc_claimAutoreleasedReturnValue();
    defaultMaxValue = v5->_defaultMaxValue;
    v5->_defaultMaxValue = (NSMeasurement *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideMaxValue"));
    v16 = objc_claimAutoreleasedReturnValue();
    overrideMaxValue = v5->_overrideMaxValue;
    v5->_overrideMaxValue = (NSMeasurement *)v16;

    v18 = v5;
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
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  NSMeasurement *overrideMaxValue;
  uint64_t v32;
  id v33;
  void *v34;
  char v35;
  objc_super v37;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v37.receiver = self;
    v37.super_class = (Class)GEOComposedStringArgument_Frequency;
    if (!-[GEOComposedStringArgument isEqual:](&v37, sel_isEqual_, v5))
      goto LABEL_16;
    v6 = (void *)v5[4];
    v7 = self->_defaultValue;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_16;
    }
    v11 = (void *)v5[5];
    v12 = self->_overrideValue;
    v13 = v11;
    if (v12 | v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend((id)v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_16;
    }
    v16 = (void *)v5[6];
    v17 = self->_defaultMinValue;
    v18 = v16;
    if (v17 | v18)
    {
      v19 = (void *)v18;
      v20 = objc_msgSend((id)v17, "isEqual:", v18);

      if (!v20)
        goto LABEL_16;
    }
    v21 = (void *)v5[7];
    v22 = self->_overrideMinValue;
    v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      v25 = objc_msgSend((id)v22, "isEqual:", v23);

      if (!v25)
        goto LABEL_16;
    }
    v26 = (void *)v5[8];
    v27 = self->_defaultMaxValue;
    v28 = v26;
    if (!(v27 | v28)
      || (v29 = (void *)v28, v30 = objc_msgSend((id)v27, "isEqual:", v28), v29, (id)v27, v30))
    {
      overrideMaxValue = self->_overrideMaxValue;
      v32 = v5[9];
      v33 = overrideMaxValue;
      v34 = v33;
      if ((unint64_t)v33 | v32)
        v35 = objc_msgSend(v33, "isEqual:", v32);
      else
        v35 = 1;

    }
    else
    {
LABEL_16:
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMaxValue, 0);
  objc_storeStrong((id *)&self->_defaultMaxValue, 0);
  objc_storeStrong((id *)&self->_overrideMinValue, 0);
  objc_storeStrong((id *)&self->_defaultMinValue, 0);
  objc_storeStrong((id *)&self->_overrideValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
