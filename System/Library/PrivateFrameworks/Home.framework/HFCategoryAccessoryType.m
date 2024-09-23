@implementation HFCategoryAccessoryType

void __38__HFCategoryAccessoryType_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_262);
  objc_msgSend(v0, "build");
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)qword_1ED378928;
  qword_1ED378928 = v2;

}

+ (id)na_identity
{
  if (qword_1ED378920 != -1)
    dispatch_once(&qword_1ED378920, &__block_literal_global_259);
  return (id)qword_1ED378928;
}

uint64_t __38__HFCategoryAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "categoryType");
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (HFCategoryAccessoryType)initWithCategoryType:(id)a3
{
  id v5;
  id *v6;
  HFCategoryAccessoryType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCategoryAccessoryType;
  v6 = -[HFAccessoryType _init](&v9, sel__init);
  v7 = (HFCategoryAccessoryType *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)localizedCategory
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFCategoryAccessoryType categoryType](self, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("9D302CDA-1467-4E19-ABC9-9ED36BE34508"));

  if ((v4 & 1) != 0
    || (-[HFCategoryAccessoryType categoryType](self, "categoryType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("3047A1A5-8BFC-4112-9888-21314F438FF3")),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    -[HFCategoryAccessoryType categoryType](self, "categoryType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    localizationKeyForAccessoryCategoryType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA5E0], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getLocalizedOrCustomString:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CBA1A8];
  -[HFCategoryAccessoryType categoryType](self, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCategoryAccessoryType categoryType](self, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("categoryType: %@ (%@)"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CBA1A8];
  -[HFCategoryAccessoryType categoryType](self, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCategoryAccessoryType categoryType](self, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("categoryType"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
}

@end
