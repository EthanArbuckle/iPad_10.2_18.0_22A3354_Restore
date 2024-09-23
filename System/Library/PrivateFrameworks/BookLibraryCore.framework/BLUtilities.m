@implementation BLUtilities

+ (id)buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("&"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 2)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if (v13)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  objc_msgSend(v14, "stringByRemovingPercentEncoding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)storeIDFromBuyParameters:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  if (a3)
  {
    +[BLUtilities buyParametersValueForKey:fromBuyParams:](BLUtilities, "buyParametersValueForKey:fromBuyParams:", CFSTR("salableAdamId"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BLUtilitiesLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "storeIDFromBuyParameters: cannot retrieve storeID from nil buyParameters", v7, 2u);
    }

    v3 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isPreOrderFromBuyParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  if (v3)
  {
    +[BLUtilities buyParametersValueForKey:fromBuyParams:](BLUtilities, "buyParametersValueForKey:fromBuyParams:", CFSTR("isPreorder"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLUtilities buyParametersValueForKey:fromBuyParams:](BLUtilities, "buyParametersValueForKey:fromBuyParams:", CFSTR("pricingParameters"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSuffix:", CFSTR("PRE"));
    if (v4)
      v7 = 1;
    else
      v7 = v6;

  }
  else
  {
    BLDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "isPreOrderFromBuyParameters: cannot retrieve isPreOrder key from nil buyParameters", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (BOOL)isAudioBookFromBuyParameters:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    +[BLUtilities buyParametersValueForKey:fromBuyParams:](BLUtilities, "buyParametersValueForKey:fromBuyParams:", CFSTR("productType"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("P"));
    else
      v5 = 0;

  }
  else
  {
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "isAudioBookFromBuyParameters: cannot retrieve productType key from nil buyParameters", v8, 2u);
    }

    return 0;
  }
  return v5;
}

@end
