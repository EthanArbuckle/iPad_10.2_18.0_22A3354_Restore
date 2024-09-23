@implementation _MPUStackItemReuseCache

+ (id)dequeueReusableStackItemWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)__reuseIdentifierToReusableStackItems, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v4, "count"))
      {
        objc_msgSend((id)__reuseIdentifierToReusableStackItems, "removeObjectForKey:", v3);
        if (!objc_msgSend((id)__reuseIdentifierToReusableStackItems, "count"))
        {
          v6 = (void *)__reuseIdentifierToReusableStackItems;
          __reuseIdentifierToReusableStackItems = 0;

        }
      }
      objc_msgSend(v5, "setHidden:", 0);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)enqueueReusableStackItem:(id)a3 forReuseIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (v12)
  {
    if (v5)
    {
      objc_msgSend((id)__reuseIdentifierToRegisteredCount, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      if (v7)
      {
        objc_msgSend(v12, "prepareForReuse");
        objc_msgSend(v12, "setHidden:", 1);
        v8 = (void *)__reuseIdentifierToReusableStackItems;
        if (!__reuseIdentifierToReusableStackItems)
        {
          v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
          v10 = (void *)__reuseIdentifierToReusableStackItems;
          __reuseIdentifierToReusableStackItems = v9;

          v8 = (void *)__reuseIdentifierToReusableStackItems;
        }
        objc_msgSend(v8, "objectForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
          objc_msgSend((id)__reuseIdentifierToReusableStackItems, "setObject:forKey:", v11, v5);
        }
        if ((unint64_t)objc_msgSend(v11, "count") <= 2)
          objc_msgSend(v11, "addObject:", v12);

      }
    }
  }

}

+ (void)registerStackViewForReuseIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)__reuseIdentifierToRegisteredCount;
    v11 = v3;
    if (!__reuseIdentifierToRegisteredCount)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
      v6 = (void *)__reuseIdentifierToRegisteredCount;
      __reuseIdentifierToRegisteredCount = v5;

      v4 = (void *)__reuseIdentifierToRegisteredCount;
    }
    objc_msgSend(v4, "objectForKey:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    v9 = (void *)__reuseIdentifierToRegisteredCount;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

    v3 = v11;
  }

}

+ (void)unregisterStackViewForReuseIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v7 = v3;
    objc_msgSend((id)__reuseIdentifierToRegisteredCount, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v3 = v7;
    if (v5 == 1)
    {
      objc_msgSend((id)__reuseIdentifierToRegisteredCount, "removeObjectForKey:", v7);
      if (!objc_msgSend((id)__reuseIdentifierToRegisteredCount, "count"))
      {
        v6 = (void *)__reuseIdentifierToRegisteredCount;
        __reuseIdentifierToRegisteredCount = 0;

      }
      objc_msgSend((id)__reuseIdentifierToReusableStackItems, "removeObjectForKey:", v7);
      v3 = v7;
    }
  }

}

@end
