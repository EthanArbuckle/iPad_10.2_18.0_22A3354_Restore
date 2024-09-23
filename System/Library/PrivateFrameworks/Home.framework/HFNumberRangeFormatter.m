@implementation HFNumberRangeFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

- (id)stringForNumberRange:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (v6 == 1)
  {
    -[HFNumberRangeFormatter numberFormatter](self, "numberFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringForObjectValue:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFNumberRangeFormatter numberFormatter](self, "numberFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringForObjectValue:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HFNumberRangeFormatter simplifiesEqualValues](self, "simplifiesEqualValues")
      && objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = v7;
      v7 = v9;
    }
    else
    {
      if (-[HFNumberRangeFormatter _shouldRemoveUnitFromMinimumFormattedValue:](self, "_shouldRemoveUnitFromMinimumFormattedValue:", v7))
      {
        objc_msgSend((id)objc_opt_class(), "_nonNumericCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v15;
      }
      if (-[HFNumberRangeFormatter _shouldRemoveUnitFromMaximumFormattedValue:](self, "_shouldRemoveUnitFromMaximumFormattedValue:", v8))
      {
        objc_msgSend((id)objc_opt_class(), "_nonNumericCharacterSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v23;
      }
      v3 = 0;
      if (!v7 || !v8)
        goto LABEL_15;
      HFLocalizedStringWithFormat(CFSTR("HFNumberRangeFormatterRange"), CFSTR("%1$@ %2$@"), v16, v17, v18, v19, v20, v21, (uint64_t)v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    v3 = v9;
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    -[HFNumberRangeFormatter numberFormatter](self, "numberFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "midValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForObjectValue:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_16:

  return v3;
}

- (NSFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (BOOL)simplifiesEqualValues
{
  return self->_simplifiesEqualValues;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HFNumberRangeFormatter stringForNumberRange:](self, "stringForNumberRange:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HFNumberRangeFormatter)initWithNumberFormatter:(id)a3
{
  id v5;
  HFNumberRangeFormatter *v6;
  HFNumberRangeFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNumberRangeFormatter;
  v6 = -[HFNumberRangeFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_numberFormatter, a3);
    v7->_consolidatesUnit = 0;
    v7->_simplifiesEqualValues = 0;
  }

  return v7;
}

- (void)setSimplifiesEqualValues:(BOOL)a3
{
  self->_simplifiesEqualValues = a3;
}

- (void)setConsolidatesUnit:(BOOL)a3
{
  self->_consolidatesUnit = a3;
}

+ (id)_nonNumericCharacterSet
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("-–"));
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isRTL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  HFHomeBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "characterDirectionForLanguage:", v6) == 2;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldRemoveUnitFromMinimumFormattedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v12;

  v4 = a3;
  if (!-[HFNumberRangeFormatter consolidatesUnit](self, "consolidatesUnit") || !objc_msgSend(v4, "length"))
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ar")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberingSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("latn"));

    if ((v9 & 1) != 0)
    {
LABEL_5:
      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  if (-[HFNumberRangeFormatter _isRTL](self, "_isRTL"))
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_nonNumericCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1));

  }
LABEL_6:

  return v10;
}

- (BOOL)_shouldRemoveUnitFromMaximumFormattedValue:(id)a3
{
  id v4;
  char v5;
  void *v7;

  v4 = a3;
  if (-[HFNumberRangeFormatter consolidatesUnit](self, "consolidatesUnit")
    && objc_msgSend(v4, "length")
    && !-[HFNumberRangeFormatter _isRTL](self, "_isRTL"))
  {
    objc_msgSend((id)objc_opt_class(), "_nonNumericCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (BOOL)consolidatesUnit
{
  return self->_consolidatesUnit;
}

@end
