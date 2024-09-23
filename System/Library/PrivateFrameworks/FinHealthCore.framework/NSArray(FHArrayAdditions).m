@implementation NSArray(FHArrayAdditions)

- (uint64_t)intAtIndex:()FHArrayAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (uint64_t)signedIntegerAtIndex:()FHArrayAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (id)stringAtIndex:()FHArrayAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)unsignedIntAtIndex:()FHArrayAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (id)decimalNumberAtIndex:()FHArrayAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];
  int v10;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x24BDD1518];
    if (v1)
    {
      objc_msgSend(v1, "decimalValue");
    }
    else
    {
      v9[0] = 0;
      v9[1] = 0;
      v10 = 0;
    }
    objc_msgSend(v2, "decimalNumberWithDecimal:", v9);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v1, "length"))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", v1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  if (!v3)
  {
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToNumber:", v5))
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

LABEL_15:
  return v7;
}

- (uint64_t)firstObjectWithPredicate:()FHArrayAdditions
{
  return objc_msgSend(a1, "_firstObjectWithPredicate:order:", a3, 0);
}

- (uint64_t)lastObjectWithPredicate:()FHArrayAdditions
{
  return objc_msgSend(a1, "_firstObjectWithPredicate:order:", a3, 1);
}

- (id)_firstObjectWithPredicate:()FHArrayAdditions order:
{
  uint64_t (**v6)(id, void *);
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    if (a4 == 1)
      objc_msgSend(a1, "reverseObjectEnumerator");
    else
      objc_msgSend(a1, "objectEnumerator");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((v6[2](v6, v11) & 1) != 0)
          {
            v7 = v11;
            goto LABEL_16;
          }
        }
        v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
