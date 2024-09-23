@implementation NSArray(Utilities)

- (id)mt_map:()Utilities
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mt_deepCopy
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "count");
  v3 = 8 * v2;
  v4 = (char *)v11 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v2);
  if (v2)
  {
    for (i = 0; i != v2; ++i)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "mt_deepCopy");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      v8 = *(void **)&v4[8 * i];
      *(_QWORD *)&v4[8 * i] = v6;

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }
  return v9;
}

- (unint64_t)mt_verifyEventData
{
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 == v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {

      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          v13 = MTConfigurationError(108, CFSTR("Event data item at index %ld is of invalid type %@. Event data items must be of NSDictionary or MTPromise type."), v7, v8, v9, v10, v11, v12, i);
        }
      }

      result = objc_msgSend(a1, "count");
    }
  }
  return result;
}

- (id)mt_condensedArray
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
  {

    v7 = 0;
LABEL_25:
    v6 = 0;
    goto LABEL_26;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v6 && v7)
          v6 = (void *)objc_msgSend(v7, "mutableCopy");
        if (v6)
        {
          objc_msgSend(v6, "addEntriesFromDictionary:", v10);
        }
        else
        {
          v12 = v10;

          v7 = v12;
        }
      }
      else
      {
        if (v6)
        {
          v11 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(v2, "addObject:", v11);

        }
        else if (v7)
        {
          objc_msgSend(v2, "addObject:", v7, (_QWORD)v16);
        }

        objc_msgSend(v2, "addObject:", v10);
        v6 = 0;
        v7 = 0;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v5);

  if (!v6)
  {
    if (v7)
      objc_msgSend(v2, "addObject:", v7);
    goto LABEL_25;
  }
  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v2, "addObject:", v13);

LABEL_26:
  v14 = (void *)objc_msgSend(v2, "copy", (_QWORD)v16);

  return v14;
}

@end
