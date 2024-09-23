@implementation HKCategoryType

- (BOOL)_acceptsValue:(int64_t)a3
{
  return HKCategoryTypeAcceptsValue(-[HKObjectType code](self, "code"), a3);
}

- (HKCategoryType)initWithIdentifier:(id)a3
{
  id v4;
  HKCategoryType *v5;

  v4 = a3;
  +[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", v4);
  v5 = (HKCategoryType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

- (int64_t)_categoryValueForValue:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v4 = -[HKObjectType code](self, "code");
  if (v4 != 63)
  {
    if (v4 != 92)
      return a3;
    v6 = HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v5);
    if (a3 == 4 && !v6)
      return 3;
  }
  if ((HKProgramSDKAtLeast(0x7E60901FFFFFFFFLL, v5) & 1) == 0)
  {
    _HKCategoryValueSleepAnalysisAsleepValues();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if ((v9 & 1) != 0)
      return 1;
  }
  return a3;
}

+ (id)_categoryTypeWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_dataTypeWithCode:expectedClass:", a3, objc_opt_class());
}

- (int64_t)_defaultValue
{
  if (-[HKObjectType code](self, "code") == 63)
    return _HKCategoryValueSleepAnalysisDefaultAsleepValue();
  else
    return 0;
}

- (id)_predicateForSDKVersionToken:(unint64_t)a3
{
  void *v4;

  if (-[HKObjectType code](self, "code") == 63 && (HKProgramSDKTokenAtLeast(a3, 0x7E00901FFFFFFFFLL) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %ld"), CFSTR("value"), 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
