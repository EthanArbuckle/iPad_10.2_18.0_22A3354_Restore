@implementation AXSortedDialectsForDisplay

uint64_t __AXSortedDialectsForDisplay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v6, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (!v9 || v12)
  {
    if ((v12 ^ 1 | v9) == 1)
    {
      objc_msgSend(v5, "languageNameAndLocaleInCurrentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "languageNameAndLocaleInCurrentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "localizedCompare:", v15);

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

@end
