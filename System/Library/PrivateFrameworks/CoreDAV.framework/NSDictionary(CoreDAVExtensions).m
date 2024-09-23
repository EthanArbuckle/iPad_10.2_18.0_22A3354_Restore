@implementation NSDictionary(CoreDAVExtensions)

- (id)CDVObjectForKeyCaseInsensitive:()CoreDAVExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "capitalizedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectForKey:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __66__NSDictionary_CoreDAVExtensions__CDVObjectForKeyCaseInsensitive___block_invoke;
        v11[3] = &unk_24C1D9E98;
        v12 = v4;
        objc_msgSend(a1, "keysOfEntriesPassingTest:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "anyObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "objectForKey:", v9);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v5 = 0;
        }

      }
    }
  }

  return v5;
}

- (id)CDVObjectForKeyWithNameSpace:()CoreDAVExtensions andName:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCDVNameSpace:andName:", v8, v7);

  objc_msgSend(a1, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)CDVMergeOverrideDictionary:()CoreDAVExtensions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v13 = v12;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "CDVMergeOverrideDictionary:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_msgSend(v5, "setObject:forKey:", v13, v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

@end
