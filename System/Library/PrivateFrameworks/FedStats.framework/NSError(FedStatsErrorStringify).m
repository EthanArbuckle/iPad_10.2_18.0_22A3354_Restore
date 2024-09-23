@implementation NSError(FedStatsErrorStringify)

- (id)describe
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("domain = \"%@\", code = %lu, description = \"%@\"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "underlyingErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "describe");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    v15 = 1;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v16)
      {
        v19 = CFSTR("├── ");
      }
      else
      {
        objc_msgSend(v2, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v16)
          v19 = CFSTR("└── ");
        else
          v19 = CFSTR("│   ");
      }
      -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:atIndexedSubscript:", v20, v15);

      ++v15;
    }
    while (v15 < objc_msgSend(v2, "count"));
  }
  return v2;
}

@end
