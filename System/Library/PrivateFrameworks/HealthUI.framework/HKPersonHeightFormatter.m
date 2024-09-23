@implementation HKPersonHeightFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_6);
  return (id)sharedFormatter___sharedFormatter;
}

void __42__HKPersonHeightFormatter_sharedFormatter__block_invoke()
{
  HKPersonHeightFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HKPersonHeightFormatter);
  v1 = (void *)sharedFormatter___sharedFormatter;
  sharedFormatter___sharedFormatter = (uint64_t)v0;

}

- (HKPersonHeightFormatter)init
{
  HKPersonHeightFormatter *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKPersonHeightFormatter;
  v2 = -[HKPersonHeightFormatter init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3728]);
    -[HKPersonHeightFormatter setHeightFormatter:](v2, "setHeightFormatter:", v3);

    -[HKPersonHeightFormatter heightFormatter](v2, "heightFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumFractionDigits:", 0);

    -[HKPersonHeightFormatter heightFormatter](v2, "heightFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForPersonHeightUse:", 1);

    if (-[HKPersonHeightFormatter usesImperialUnits](v2, "usesImperialUnits"))
      v7 = 1;
    else
      v7 = 2;
    -[HKPersonHeightFormatter heightFormatter](v2, "heightFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnitStyle:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)HKPersonHeightFormatter;
  -[HKPersonHeightFormatter dealloc](&v4, sel_dealloc);
}

- (void)_localeChanged:(id)a3
{
  NSNumber *usesImperialUnits;

  usesImperialUnits = self->_usesImperialUnits;
  self->_usesImperialUnits = 0;

}

- (BOOL)usesImperialUnits
{
  NSNumber *usesImperialUnits;
  void *v4;
  id v5;
  _BOOL8 v7;
  NSNumber *v8;
  NSNumber *v9;
  uint64_t v11;

  usesImperialUnits = self->_usesImperialUnits;
  if (!usesImperialUnits)
  {
    v11 = 0;
    -[HKPersonHeightFormatter heightFormatter](self, "heightFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "unitStringFromMeters:usedUnit:", &v11, 1.0);

    v7 = v11 == 1281 || (v11 & 0xFFFFFFFFFFFFFFFELL) == 1282;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_usesImperialUnits;
    self->_usesImperialUnits = v8;

    usesImperialUnits = self->_usesImperialUnits;
  }
  return -[NSNumber BOOLValue](usesImperialUnits, "BOOLValue");
}

- (id)formattedValueForCentimeters:(double)a3
{
  void *v4;
  void *v5;

  -[HKPersonHeightFormatter heightFormatter](self, "heightFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromValue:unit:", 9, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedValueForFeet:(double)a3
{
  void *v4;
  void *v5;

  -[HKPersonHeightFormatter heightFormatter](self, "heightFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromValue:unit:", 1282, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedValueForInches:(double)a3
{
  void *v4;
  void *v5;

  -[HKPersonHeightFormatter heightFormatter](self, "heightFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromValue:unit:", 1281, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getFeet:(int64_t *)a3 inches:(int64_t *)a4 fromCentimeters:(double)a5
{
  signed int v5;
  int v6;

  v5 = llround(a5 / 2.54);
  v6 = v5 % 12;
  if (a3)
    *a3 = (int)llround((double)(v5 - v6) / 12.0);
  if (a4)
    *a4 = v6;
}

- (double)centimetersFromFeet:(double)a3 inches:(double)a4
{
  return (a4 + a3 * 12.0) * 2.54;
}

- (id)localizedStringFromHeightInCentimeters:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (v4)
  {
    if (-[HKPersonHeightFormatter usesImperialUnits](self, "usesImperialUnits"))
    {
      v12 = 0;
      v13 = 0;
      objc_msgSend(v4, "doubleValue");
      -[HKPersonHeightFormatter getFeet:inches:fromCentimeters:](self, "getFeet:inches:fromCentimeters:", &v13, &v12);
      -[HKPersonHeightFormatter formattedValueForFeet:](self, "formattedValueForFeet:", (double)v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 < 1)
      {
        v6 = &stru_1E9C4C428;
      }
      else
      {
        -[HKPersonHeightFormatter formattedValueForInches:](self, "formattedValueForInches:", (double)v12);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (-[__CFString length](v6, "length"))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("HEIGHT_FEET_INCHES %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", v10, v5, v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = v5;
      }

    }
    else
    {
      objc_msgSend(v4, "doubleValue");
      -[HKPersonHeightFormatter formattedValueForCentimeters:](self, "formattedValueForCentimeters:");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSLengthFormatter)heightFormatter
{
  return self->_heightFormatter;
}

- (void)setHeightFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_heightFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightFormatter, 0);
  objc_storeStrong((id *)&self->_usesImperialUnits, 0);
}

@end
