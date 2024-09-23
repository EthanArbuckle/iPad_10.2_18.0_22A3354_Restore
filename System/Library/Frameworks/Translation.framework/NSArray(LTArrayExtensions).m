@implementation NSArray(LTArrayExtensions)

- (id)_ltCompactMap:()LTArrayExtensions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __44__NSArray_LTArrayExtensions___ltCompactMap___block_invoke;
  v13 = &unk_250694C40;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)lt_filterUsingBlock:()LTArrayExtensions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)lt_firstObjectPassingTest:()LTArrayExtensions
{
  unsigned int (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  unsigned int (**v12)(id, void *);

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v6))
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __56__NSArray_LTArrayExtensions__lt_firstObjectPassingTest___block_invoke;
      v11[3] = &unk_250694C68;
      v12 = v4;
      v9 = objc_msgSend(a1, "indexOfObjectPassingTest:", v11);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v12;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)lt_hasObjectPassingTest:()LTArrayExtensions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "lt_firstObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)lt_suffixWithMaxLength:()LTArrayExtensions
{
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(a1, "count");
  v6 = v5 - a3;
  if (v5 <= a3)
  {
    v7 = (void *)objc_msgSend(a1, "copy", v6);
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (uint64_t)lt_ensureElementType:()LTArrayExtensions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__NSArray_LTArrayExtensions__lt_ensureElementType___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  return objc_msgSend(a1, "lt_hasObjectPassingTest:", v4) ^ 1;
}

@end
