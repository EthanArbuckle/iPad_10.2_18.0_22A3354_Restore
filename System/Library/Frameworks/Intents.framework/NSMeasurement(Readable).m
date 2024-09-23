@implementation NSMeasurement(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  objc_msgSend(v6, "unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "measurementByConvertingToUnit:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
  }
  else
  {
    v13 = 2;
    v12 = v8;
  }
  objc_msgSend(v9, "setUnitOptions:", v13);
  objc_msgSend(v8, "unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v16 = 2;
  else
    v16 = 3;
  objc_msgSend(v9, "setUnitStyle:", v16);
  objc_msgSend(v9, "setLocale:", v7);
  objc_msgSend(v9, "stringFromMeasurement:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
