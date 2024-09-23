@implementation CHLocalization

+ (NSBundle)classBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (NSString)localizationTableName
{
  return (NSString *)CFSTR("CallHistory");
}

+ (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "classBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizationTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E6747850, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
