@implementation INPriceRange(AssistantCardService)

- (id)acs_formattedRangeString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "currencyCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_currencySymbolForCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (acs_formattedRangeString_once != -1)
    dispatch_once(&acs_formattedRangeString_once, &__block_literal_global_0);
  objc_msgSend(a1, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter, "setCurrencyCode:", v5);

  objc_msgSend((id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter, "setCurrencySymbol:", v4);
  objc_msgSend(a1, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter, "setCurrencyCode:", v6);

  objc_msgSend((id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter, "setCurrencySymbol:", 0);
  v7 = (void *)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter;
  objc_msgSend(a1, "minimumPrice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter;
  objc_msgSend(a1, "maximumPrice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_localeForCode:()AssistantCardService
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEA0], "availableLocaleIdentifiers");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x24BDBCAF0];
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x24BDBCEA0]);
        v12 = (void *)objc_msgSend(v11, "initWithLocaleIdentifier:", v10, (_QWORD)v15);
        objc_msgSend(v12, "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v3))
        {

          goto LABEL_11;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_currencySymbolForCode:()AssistantCardService
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x24BDD16F0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "_localeForCode:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "setLocale:", v7);
    objc_msgSend(v6, "setNumberStyle:", 2);
    objc_msgSend(v6, "currencySymbol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "length") >= 2)
    {
      objc_msgSend(v8, "substringToIndex:", 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
