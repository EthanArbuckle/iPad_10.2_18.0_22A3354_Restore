@implementation DSUIUtilities

+ (id)setUpBoldButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = (void *)MEMORY[0x24BE6E3E8];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "boldButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v11, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", v10, a6, 64);
  objc_msgSend(v12, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addButton:", v13);
  return v13;
}

+ (id)setUpLinkButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = (void *)MEMORY[0x24BE6E418];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v11, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", v10, a6, 64);
  objc_msgSend(v12, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addButton:", v13);
  return v13;
}

+ (id)setUpLearnMoreButtonForController:(id)a3 selector:(SEL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BE6E400];
  v6 = a3;
  objc_msgSend(v5, "accessoryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("LEARN_MORE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);
  objc_msgSend(v6, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAccessoryButton:", v7);
  return v7;
}

+ (id)appIconForAppID:(id)a3 format:(int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)MEMORY[0x24BEBD640];
  v6 = (void *)MEMORY[0x24BEBD8F8];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isPlaceholderForApp:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = 0;
  v6 = 1;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  if (!v9)
    v6 = objc_msgSend(v7, "isPlaceholder");

  return v6;
}

+ (id)valueForUnfinalizedString:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("<no loc>")) & 1) != 0)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<no loc>"), &stru_24EFF4790);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

@end
