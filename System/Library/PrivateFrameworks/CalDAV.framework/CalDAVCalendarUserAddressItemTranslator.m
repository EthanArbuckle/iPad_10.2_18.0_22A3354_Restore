@implementation CalDAVCalendarUserAddressItemTranslator

+ (id)userAddressesForAddressSetItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "hrefs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "calDAVUserAddressForItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)calDAVUserAddressForItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "calDAVUserAddressForItem:prependMailTo:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)calDAVUserAddressForItem:(id)a3 prependMailTo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  CalDAVCalendarUserAddress *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_preferredAttributeForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v4 && (objc_msgSend(v8, "hasPrefix:", CFSTR("mailto")) & 1) == 0)
    {
      objc_msgSend(CFSTR("mailto:"), "stringByAppendingString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = +[CalDAVCalendarUserAddress defaultPreferredAttribute](CalDAVCalendarUserAddress, "defaultPreferredAttribute");
    if (v7)
      v11 = (int)objc_msgSend(v7, "intValue");
    else
      v11 = v10;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v12 = -[CalDAVCalendarUserAddress initWithAddress:preferred:]([CalDAVCalendarUserAddress alloc], "initWithAddress:preferred:", v13, v11);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_preferredAttributeForItem:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "name", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("preferred"));

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v9, "value");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
