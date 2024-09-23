@implementation NSArray(HFAdditions)

- (id)hf_firstMostCommonObject
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v2, "countForObject:", v10, (_QWORD)v15);
        if (v11 > v6)
        {
          v12 = v11;
          v13 = v10;

          v6 = v12;
          v7 = v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)hf_fanOutAtIndex:()HFAdditions usingBlock:
{
  void (**v7)(id, void *, unint64_t, _BYTE *);
  void *v8;
  unint64_t v9;
  unint64_t i;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a4;
  if (objc_msgSend(a1, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HFAdditions.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < self.count"));

  }
  v15 = 0;
  objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, a3, &v15);

  if (!v15)
  {
    v9 = a3 - 1;
    for (i = 1; ; ++i)
    {
      if (i <= a3)
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v12, v9, &v15);

        if (v15)
          break;
        v11 = a3 + i;
        if (a3 + i >= objc_msgSend(a1, "count"))
          goto LABEL_12;
      }
      else
      {
        v11 = i + a3;
        if (i + a3 >= objc_msgSend(a1, "count"))
          break;
      }
      objc_msgSend(a1, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13, v11, &v15);

      if (v15)
        break;
LABEL_12:
      --v9;
    }
  }

}

@end
