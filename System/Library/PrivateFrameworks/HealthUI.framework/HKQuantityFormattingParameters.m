@implementation HKQuantityFormattingParameters

- (HKQuantityFormattingParameters)init
{
  HKQuantityFormattingParameters *v2;
  HKQuantityFormattingParameters *v3;
  HKUnit *preferredUnit;
  UIFont *valueFont;
  UIFont *unitFont;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKQuantityFormattingParameters;
  v2 = -[HKQuantityFormattingParameters init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    preferredUnit = v2->_preferredUnit;
    v2->_preferredUnit = 0;

    v3->_precision = -1;
    v3->_significantDigits = -1;
    v3->_omitUnit = 0;
    v3->_wheelchairUse = 0;
    v3->_timeFormatOptions = 0;
    valueFont = v3->_valueFont;
    v3->_valueFont = 0;

    unitFont = v3->_unitFont;
    v3->_unitFont = 0;

    *(_WORD *)&v3->_useColor = 256;
  }
  return v3;
}

- (id)valueString:(id)a3 quantity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[HKQuantityFormattingParameters _unitForQuantity:objectType:](self, "_unitForQuantity:objectType:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKQuantityFormattingParameters _unitIsFeet:](self, "_unitIsFeet:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v9);
    v11 = v10;

    HKFormattedFeetAndInches(v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v6, *MEMORY[0x1E0CB4880]))
  {
    HKLocalizedDisplayStringForAppleStandHours(v7, 0, 1, 1);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v6, *MEMORY[0x1E0CB4980]))
    {
      -[HKQuantityFormattingParameters _sleepFormatForQuantity:](self, "_sleepFormatForQuantity:", v7);
    }
    else
    {
      -[HKQuantityFormattingParameters _standardFormatForQuantity:unit:objectType:](self, "_standardFormatForQuantity:unit:objectType:", v7, v8, v6);
    }
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_sleepFormatForQuantity:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  __int16 v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB6CD0];
  v5 = a3;
  objc_msgSend(v4, "secondUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  if (-[HKQuantityFormattingParameters timeFormatOptions](self, "timeFormatOptions"))
    v9 = -[HKQuantityFormattingParameters timeFormatOptions](self, "timeFormatOptions");
  else
    v9 = 4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKTimePeriodString(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unitString:(id)a3 quantity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  -[HKQuantityFormattingParameters _unitForQuantity:objectType:](self, "_unitForQuantity:objectType:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKQuantityFormattingParameters omitUnit](self, "omitUnit")
    || -[HKQuantityFormattingParameters _unitIsFeet:](self, "_unitIsFeet:", v8)
    || -[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v6, *MEMORY[0x1E0CB4980]))
  {
    v9 = &stru_1E9C4C428;
  }
  else
  {
    if (-[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v6, *MEMORY[0x1E0CB4880]))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("HOURS_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValueForUnit:", v8);
      objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "doubleValueForUnit:", v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKUnitPreferenceController localizedUnitStringForObjectType:unit:value:wheelchairUse:](HKUnitPreferenceController, "localizedUnitStringForObjectType:unit:value:wheelchairUse:", v6, v8, v12, -[HKQuantityFormattingParameters wheelchairUse](self, "wheelchairUse"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (id)_unitForQuantity:(id)a3 objectType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[HKQuantityFormattingParameters preferredUnit](self, "preferredUnit");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_21;
  v9 = (void *)v8;
  -[HKQuantityFormattingParameters preferredUnit](self, "preferredUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_isCompatibleWithUnit:", v11);

  if (v12)
  {
    -[HKQuantityFormattingParameters preferredUnit](self, "preferredUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_21:
    if (-[HKQuantityFormattingParameters _objectType:isQuantityWithIdentifier:](self, "_objectType:isQuantityWithIdentifier:", v7, *MEMORY[0x1E0CB5CB0]))
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if (-[HKQuantityFormattingParameters _objectType:isQuantityWithIdentifier:](self, "_objectType:isQuantityWithIdentifier:", v7, *MEMORY[0x1E0CB5A50]))
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    if (-[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v7, *MEMORY[0x1E0CB4880]))
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    if (-[HKQuantityFormattingParameters _objectType:isCategoryWithIdentifier:](self, "_objectType:isCategoryWithIdentifier:", v7, *MEMORY[0x1E0CB4928]))
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    if (v14
      && (objc_msgSend(v6, "_unit"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v14, "_isCompatibleWithUnit:", v18),
          v18,
          v19))
    {
      v20 = v14;
    }
    else
    {
      objc_msgSend(v6, "_unit");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v20;

  }
  return v13;
}

- (BOOL)_unitIsFeet:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB6CD0];
  v4 = a3;
  objc_msgSend(v3, "footUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)_objectType:(id)a3 isQuantityWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB6978];
  v6 = a3;
  objc_msgSend(v5, "quantityTypeForIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v7);

  return (char)v5;
}

- (BOOL)_objectType:(id)a3 isCategoryWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB6380];
  v6 = a3;
  objc_msgSend(v5, "categoryTypeForIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v7);

  return (char)v5;
}

- (id)_standardFormatForQuantity:(id)a3 unit:(id)a4 objectType:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  int64_t v13;
  int64_t v14;
  HKQuantityFormattingParameters *v15;
  id v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "doubleValueForUnit:", v8);
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v12, "setNumberStyle:", 1);
  if (-[HKQuantityFormattingParameters precision](self, "precision") < 0)
  {
    if (-[HKQuantityFormattingParameters significantDigits](self, "significantDigits") < 0)
    {
      v13 = -[HKQuantityFormattingParameters _maximumPrecisionForObjectType:unit:value:](self, "_maximumPrecisionForObjectType:unit:value:", v9, v8, v11);
      if ((v13 & 0x8000000000000000) == 0)
        goto LABEL_3;
      v15 = self;
      v16 = v12;
      v14 = 6;
    }
    else
    {
      v14 = -[HKQuantityFormattingParameters significantDigits](self, "significantDigits");
      v15 = self;
      v16 = v12;
    }
    -[HKQuantityFormattingParameters _setFormatter:maximumSignificantDigits:](v15, "_setFormatter:maximumSignificantDigits:", v16, v14);
    goto LABEL_7;
  }
  v13 = -[HKQuantityFormattingParameters precision](self, "precision");
LABEL_3:
  objc_msgSend(v12, "setMaximumFractionDigits:", v13);
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_setFormatter:(id)a3 maximumSignificantDigits:(int64_t)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setUsesSignificantDigits:", 1);
  objc_msgSend(v5, "setMinimumSignificantDigits:", 1);
  objc_msgSend(v5, "setMaximumSignificantDigits:", a4);

}

- (int64_t)_maximumPrecisionForObjectType:(id)a3 unit:(id)a4 value:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v7 = a4;
  +[HKDisplayTypeController displayTypeForObjectType:wheelchairUse:](HKDisplayTypeController, "displayTypeForObjectType:wheelchairUse:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chartingRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allowedDecimalPrecisionRuleForUnit:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "decimalPrecisionForValue:", a5);
  else
    v11 = -1;

  return v11;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (void)setPreferredUnit:(id)a3
{
  objc_storeStrong((id *)&self->_preferredUnit, a3);
}

- (int64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(int64_t)a3
{
  self->_precision = a3;
}

- (int64_t)significantDigits
{
  return self->_significantDigits;
}

- (void)setSignificantDigits:(int64_t)a3
{
  self->_significantDigits = a3;
}

- (BOOL)omitUnit
{
  return self->_omitUnit;
}

- (void)setOmitUnit:(BOOL)a3
{
  self->_omitUnit = a3;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (unint64_t)timeFormatOptions
{
  return self->_timeFormatOptions;
}

- (void)setTimeFormatOptions:(unint64_t)a3
{
  self->_timeFormatOptions = a3;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (void)setUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_unitFont, a3);
}

- (BOOL)useColor
{
  return self->_useColor;
}

- (void)setUseColor:(BOOL)a3
{
  self->_useColor = a3;
}

- (BOOL)hasSpaceBetweenValueAndUnit
{
  return self->_hasSpaceBetweenValueAndUnit;
}

- (void)setHasSpaceBetweenValueAndUnit:(BOOL)a3
{
  self->_hasSpaceBetweenValueAndUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
}

@end
