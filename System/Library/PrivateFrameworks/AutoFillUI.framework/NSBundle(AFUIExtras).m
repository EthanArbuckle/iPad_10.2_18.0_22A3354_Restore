@implementation NSBundle(AFUIExtras)

+ (id)_processLocalizedString:()AFUIExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = 0;
    objc_msgSend(v5, "_searchForLocalizedString:foundKey:foundTable:", v3, &v18, &v17);
    v6 = v18;
    v7 = v17;

    if (!v6)
      goto LABEL_5;
    if (!v7)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredEnglishLocalizationBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localizedStringForKey:value:table:", v6, v3, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
LABEL_5:
      v10 = v3;
    v11 = objc_msgSend(v10, "length");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__NSBundle_AFUIExtras___processLocalizedString___block_invoke;
    v15[3] = &unk_2508568D8;
    v12 = v4;
    v16 = v12;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v15);
    objc_msgSend(v10, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  return v4;
}

- (id)_preferredEnglishLocalizationBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(a1, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizationsFromArray:forPreferences:", v3, &unk_250862958);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pathForResource:ofType:", v5, CFSTR("lproj"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
