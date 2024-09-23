@implementation NSNetService(CATTXTRecord)

+ (id)cat_dictionaryFromData:()CATTXTRecord
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *context;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    context = (void *)MEMORY[0x20BD108A4]();
    v29 = v3;
    objc_msgSend(MEMORY[0x24BDB7460], "dictionaryFromTXTRecordData:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    objc_msgSend(v6, "objectsAtIndexes:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v9);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v8;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "substringToIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "length") - objc_msgSend(CFSTR("-0"), "length"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_opt_new();
          for (j = 0; ; ++j)
          {
            objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-%lu"), j);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "removeObject:", v14);
            objc_msgSend(v5, "objectForKeyedSubscript:", v14);
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
              break;
            v16 = (void *)v15;
            objc_msgSend(v12, "appendData:", v15);

          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v32);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
          objc_msgSend(v5, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v19);
    }

    objc_autoreleasePoolPop(context);
    v24 = (void *)objc_msgSend(v4, "copy");

    v3 = v29;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)cat_dataFromDictionary:()CATTXTRecord
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    v5 = CFSTR("-%lu");
    v28 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v26 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        objc_msgSend(obj, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "length");
        v10 = 249 - v9;
        v11 = objc_msgSend(v8, "length") / (unint64_t)(249 - v9);
        if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {
          objc_msgSend(v4, "setObject:forKey:", v8, v7);
        }
        else
        {
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v27 = v11 + 1;
          v15 = v9 - 249;
          do
          {
            v16 = objc_msgSend(v8, "length");
            if (v10 >= v16 + v12)
              v17 = v16 + v12;
            else
              v17 = v10;
            objc_msgSend(v8, "subdataWithRange:", v13, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByAppendingFormat:", v5, v14);
            v19 = v5;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v18, v20);

            v5 = v19;
            ++v14;
            v13 += v10;
            v12 += v15;
          }
          while (v27 != v14);
        }

        v6 = v26 + 1;
        v4 = v28;
      }
      while (v26 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x24BDB7460], "dataFromTXTRecordDictionary:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
