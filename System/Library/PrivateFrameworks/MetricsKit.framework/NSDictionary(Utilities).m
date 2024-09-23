@implementation NSDictionary(Utilities)

- (id)mt_deepCopy
{
  size_t v2;
  char *v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  size_t v25;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = (uint64_t)&v27;
  v28 = objc_msgSend(a1, "count");
  v2 = 8 * v28;
  v3 = (char *)&v27 - ((8 * v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v3, 8 * v28);
  v4 = v3;
  v29 = v2;
  bzero(v3, v2);
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v31 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      v30 = sel_mt_deepCopy;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        v11 = v8 + v10;
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        objc_storeStrong((id *)&v4[8 * (v8 + v10)], v12);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "mt_deepCopy");
          v14 = v5;
          v15 = v3;
          v16 = v8;
          v17 = v7;
          v18 = v9;
          v19 = v4;
          v20 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v20;
          v4 = v19;
          v9 = v18;
          v7 = v17;
          v8 = v16;
          v3 = v15;
          v5 = v14;
        }
        v21 = *(void **)&v3[8 * v11];
        *(_QWORD *)&v3[8 * v11] = v13;

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v8 = (v8 + v10);
    }
    while (v7);
  }

  v22 = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v4, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v29;
  if (v22)
  {
    v25 = v29;
    do
    {

      v25 -= 8;
    }
    while (v25);
    do
    {

      v24 -= 8;
    }
    while (v24);
  }
  return v23;
}

- (id)mt_removingKeys:()Utilities
{
  id v4;
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
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
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
        if ((objc_msgSend(v4, "containsObject:", v11, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v5, "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)mt_dictionarybyReplacingKey:()Utilities value:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == v7 || objc_msgSend(v8, "isEqual:", v7))
  {
    v10 = a1;
  }
  else
  {
    v11 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v6);
    v10 = (id)objc_msgSend(v11, "copy");

  }
  return v10;
}

@end
