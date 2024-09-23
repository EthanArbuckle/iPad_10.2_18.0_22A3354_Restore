@implementation HKPersonWeightFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken_0 != -1)
    dispatch_once(&sharedFormatter_onceToken_0, &__block_literal_global_60);
  return (id)sharedFormatter___sharedFormatter_0;
}

void __42__HKPersonWeightFormatter_sharedFormatter__block_invoke()
{
  HKPersonWeightFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HKPersonWeightFormatter);
  v1 = (void *)sharedFormatter___sharedFormatter_0;
  sharedFormatter___sharedFormatter_0 = (uint64_t)v0;

}

- (HKPersonWeightFormatter)init
{
  HKPersonWeightFormatter *v2;
  HKPersonWeightFormatter *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKPersonWeightFormatter;
  v2 = -[HKPersonWeightFormatter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HKPersonWeightFormatter _commonInit](v2, "_commonInit");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

  }
  return v3;
}

- (void)_commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3750]);
  -[HKPersonWeightFormatter setMassFormatter:](self, "setMassFormatter:", v3);

  -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForPersonMassUse:", 1);

  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v5);

  -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoundingMode:", 6);

  -[HKPersonWeightFormatter _updateRoundingIncrement](self, "_updateRoundingIncrement");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)HKPersonWeightFormatter;
  -[HKPersonWeightFormatter dealloc](&v4, sel_dealloc);
}

- (void)_localeChanged:(id)a3
{
  -[HKPersonWeightFormatter _commonInit](self, "_commonInit", a3);
  -[HKPersonWeightFormatter _updateRoundingIncrement](self, "_updateRoundingIncrement");
}

- (void)_updateRoundingIncrement
{
  void *v3;
  id v4;
  int64_t localWeightUnit;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "unitStringFromKilograms:usedUnit:", &self->_localWeightUnit, 60.0);

  localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 14)
  {
    -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &unk_1E9CED5A8;
  }
  else if (localWeightUnit == 1539)
  {
    -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &unk_1E9CED598;
  }
  else
  {
    -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &unk_1E9CED5B8;
  }
  objc_msgSend(v6, "setRoundingIncrement:", v8);

}

- (id)stringFromWeightInKilograms:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v7 = v6;

    objc_msgSend(v5, "stringFromKilograms:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)stringFromWeightValue:(double)a3 inUnit:(int64_t)a4
{
  void *v6;
  void *v7;

  -[HKPersonWeightFormatter massFormatter](self, "massFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromValue:unit:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)localWeightUnit
{
  return self->_localWeightUnit;
}

- (NSMassFormatter)massFormatter
{
  return self->_massFormatter;
}

- (void)setMassFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_massFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_massFormatter, 0);
}

@end
