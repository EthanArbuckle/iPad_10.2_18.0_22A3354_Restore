@implementation BCSLocalizedStringProvider

+ (id)sharedInstance
{
  if (qword_253EC0A88 != -1)
    dispatch_once(&qword_253EC0A88, &__block_literal_global_7);
  return (id)_MergedGlobals_38;
}

void __44__BCSLocalizedStringProvider_sharedInstance__block_invoke()
{
  BCSLocalizedStringProvider *v0;
  void *v1;

  v0 = objc_alloc_init(BCSLocalizedStringProvider);
  v1 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = (uint64_t)v0;

}

- (id)willOpenAtSameDaySingularWithFormattedTime:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WILL_OPEN_AT_SAME_DAY_SINGULAR"), &stru_24C39D888, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)willOpenAtSameDayPluralWithFormattedTime:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WILL_OPEN_AT_SAME_DAY_PLURAL"), &stru_24C39D888, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)willOpenAtDifferentDaySingularWithFormattedTime:(id)a3 formattedDay:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WILL_OPEN_AT_DIFFERENT_DAY_SINGULAR"), &stru_24C39D888, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v10, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)willOpenAtDifferentDayPluralWithFormattedTime:(id)a3 formattedDay:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WILL_OPEN_AT_DIFFERENT_DAY_PLURAL"), &stru_24C39D888, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v10, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
