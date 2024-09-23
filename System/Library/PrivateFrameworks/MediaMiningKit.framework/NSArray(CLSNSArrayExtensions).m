@implementation NSArray(CLSNSArrayExtensions)

- (id)indentBy:()CLSNSArrayExtensions withSeparator:
{
  __CFString *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(a1, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cls_indentBy:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 >= objc_msgSend(a1, "count") - 1)
        v12 = &stru_1E84F9D30;
      else
        v12 = v6;
      objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v11, v12);

      ++v8;
    }
    while (v8 < objc_msgSend(a1, "count"));
  }

  return v7;
}

- (id)flattenWithSeparator:()CLSNSArrayExtensions
{
  __CFString *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 >= objc_msgSend(a1, "count") - 1)
        v9 = &stru_1E84F9D30;
      else
        v9 = v4;
      objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v8, v9);

      ++v6;
    }
    while (v6 < objc_msgSend(a1, "count"));
  }

  return v5;
}

- (id)map:()CLSNSArrayExtensions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)anyObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
