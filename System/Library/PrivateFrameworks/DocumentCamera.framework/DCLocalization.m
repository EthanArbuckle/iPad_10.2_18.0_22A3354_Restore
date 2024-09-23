@implementation DCLocalization

+ (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
