@implementation INPlayMediaIntent(IntentUtilities)

- (id)atx_nonNilParametersByName
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = a1;
  v18.super_class = (Class)&off_25691BF78;
  objc_msgSendSuper2(&v18, sel_atx_nonNilParametersByName);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("buckets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = 1;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bucket_%i"), v8 + v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v11);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        v8 = (v8 + v9);
      }
      while (v6);
    }

    v3 = v13;
  }

  return v2;
}

@end
