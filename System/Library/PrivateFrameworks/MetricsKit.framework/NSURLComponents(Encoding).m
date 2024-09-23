@implementation NSURLComponents(Encoding)

+ (id)mt_queryParameterStringForDictionary:()Encoding
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = (void *)objc_msgSend([a1 alloc], "initWithString:", &stru_24C7A22D0);
  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x24BDD1838]);
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v12, "initWithName:value:", v11, v15);

        objc_msgSend(v5, "addObject:", v16);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v19, "setQueryItems:", v5);
  objc_msgSend(v19, "percentEncodedQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
