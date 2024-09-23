@implementation HFAccessoryCategoryItem

- (HFAccessoryCategoryItem)initWithCategoryType:(id)a3
{
  id v5;
  HFAccessoryCategoryItem *v6;
  HFAccessoryCategoryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAccessoryCategoryItem;
  v6 = -[HFAccessoryCategoryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_categoryType, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CBA1A8];
  -[HFAccessoryCategoryItem categoryType](self, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_userFriendlyLocalizedCapitalizedPluralDescription:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("title"));
  -[HFAccessoryCategoryItem categoryType](self, "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("icon"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("dependentHomeKitClasses"));

  v13 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFAccessoryCategoryItem *v4;
  void *v5;
  HFAccessoryCategoryItem *v6;

  v4 = +[HFAccessoryCategoryItem allocWithZone:](HFAccessoryCategoryItem, "allocWithZone:", a3);
  -[HFAccessoryCategoryItem categoryType](self, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFAccessoryCategoryItem initWithCategoryType:](v4, "initWithCategoryType:", v5);

  return v6;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
}

@end
